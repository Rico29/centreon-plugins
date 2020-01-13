#
# Copyright 2020 Centreon (http://www.centreon.com/)
#
# Centreon is a full-fledged industry-strength solution that meets
# the needs in IT infrastructure and application monitoring for
# service performance.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package network::cisco::cces::restapi::plugin;

use strict;
use warnings;
use base qw(centreon::plugins::script_custom);

sub new {
    my ($class, %options) = @_;

    my $self = $class->SUPER::new(package => __PACKAGE__, %options);
    bless $self, $class;

    $self->{version} = '1.0';
    %{$self->{modes}} = (
        'components'    => 'network::cisco::cces::restapi::mode::components',
        'calls-summary' => 'network::cisco::cces::restapi::mode::callssummary',
        'calls-rt'      => 'network::cisco::cces::restapi::mode::callsrt',
        'diagnostics'   => 'network::cisco::cces::restapi::mode::diagnostics',
        'sessions'      => 'network::cisco::cces::restapi::mode::sessions',
    );

    $self->{custom_modes}{api} = 'network::cisco::cces::restapi::custom::api';
    return $self;
}

1;

__END__

=head1 PLUGIN DESCRIPTION

Check Cisco Collaboration Endpoint Software through HTTP/REST API.

=over 8

=back

=cut
