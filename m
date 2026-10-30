Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398796;
	b=Gr7qnGuUrt1NbrwBzBLJgrTLqZLhdGvua7NutdsJTbZV2hFbcu2diJtz4Wuon7pqGsCT
	 tXWtbZ2IhiKq81Nbb41lbRtFbcaFR2okVUqY+nVuZFQaOBw+6JnGK3qwcZhvHHQlmQ4ZZ
	 fTYLih6jqOkdtSnxfk/wDxo9cYMhL2oPfzPW8GXCPHGqIWXE3S053cglksj4UUpdA1Vgh
	 DIrICvMWPB/Lv2dF945KWvMLnyjQuHtDeS3q16mAE3qx53aowuuHOuL+4Xxdch2jzzL9F
	 M5tBFJTebNTNoWHPAsCxc2lOSZ6zYAOWtQLVJQkbQ5OUG9zzqbKU27VvZdXoy1hKMow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398796;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=0MYxr4Xxvaoaz3nCIWIJ2vjoXYwNVFw0vflixUyh0Io=;
	b=r1wgW0jBUnDRuJrbIwEEp7euIo7sY0ehZRVl/FQVJXHgbUP/Wcwch7xRwGpAQWZrUmfp
	 IkAHvFIjLoLLBUorwI+VcuRd2zi+s8XfWtr6oTrJNl3GlcBRpg4wnOGu3STQ8rYunb7MJ
	 tJ5BHX9n+jQYtUdKNKEpGYxeQkY4RhOmM0xHzpd/t6FYMZuItthIKhFxts5Gk4x60X72E
	 7DfJWVI5337pUgcmuEg+FxFV+UguA36dJf2e9AIzIytcKRbjJuHi/OXOkGnMue4JJyJ1Z
	 klDmtnn98L2EG01TEkzCBD05+FFP6fJksubuzWfmrfK//w4H6UTFqtVOUog631gQs7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A39606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A39606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf18.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 893A91A08C0;
	Fri, 30 Oct 2026 22:19:54 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf18.hostedemail.com (Postfix) with ESMTPA id B6DDF32;
	Fri, 30 Oct 2026 22:19:52 +0000 (UTC)
Message-ID: <e184b73da5229fa387074fce2d977994f6464f1e.camel@perches.com>
Subject: Re: [PATCH] get_maintainer: lazy load JSON::PP only when --json is
 used
From: Joe Perches <joe@perches.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Sasha Levin <sashal@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, 	linux-kernel@vger.kernel.org
Date: Fri, 30 Oct 2026 15:19:51 -0700
In-Reply-To: <auUPo66ISiR2gzmi@redhat.com>
References: <auS7NOsyw7pJ7rbF@redhat.com>
	 <eb8d1fb4e2a8a32ae1b71df686ed65be800e2918.camel@perches.com>
	 <auTDEy_vyMixVRTU@redhat.com>
	 <1ad2ae74e3257578cac561f19af63ccb94fce85a.camel@perches.com>
	 <auUPo66ISiR2gzmi@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: B6DDF32
X-Stat-Signature: e6ga8h4xfo8ewzrjyiawsbyhq7wq3ew5
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18TExNSLjEm4FBYRLSZCtj54s5w4Gpi1Ks=
X-HE-Tag: 1793398792-11267
X-HE-Meta: U2FsdGVkX1/s0DByItt5t65mtes7ZDs8N9tJG3Y+nej4rCcmvd121aiPFu1GyPBy6OO5A46Zd9n1pQP4I9/CQocG1JMkg9o9YBTXAyA0/Vg2zgfjXT+d7X8m0tQyEabQ7MXG8IL5v0GUgZOkw1g9X9az6yNiRE0zwYNhLqQpF9rAiVzoXmSViBvnluVIEv8KzT8IwRw9aBF/l3aN7jORPxs37/66e6/oVDtFxbdI6mz1JWYllK4MOFUaQF62Ipk45S6hb2vhW6+jHGn8In/Rfw9ZMgE7xXJNjbYTmRfCjy6iKVlszUKnWzpxjCGCLXSCOjS6ai30W0yd7RVz+VllwoPZ+RSvIdGK/lp/nE5m8tUXQ8HyfWabQzAyodGWM7ffw1inoaIR3qSOWW8vmjzsSw==

On Fri, 2026-10-30 at 22:44 +0100, Oleg Nesterov wrote:
> On 10/30, Joe Perches wrote:
> > On Fri, 2026-10-30 at 17:17 +0100, Oleg Nesterov wrote:
> > > > > This module is only needed with the --json option. Use "require" =
to
> > > > > load this module dynamically inside the "if ($json)" block instea=
d.
> > > > The patch may be sensible but could fail the same way
> > > > if you used the --json option with your version.
> > > Of course, "./scripts/get_maintainer.pl --json ..." will still fail
> > > the same way without JSON::PP. But with this patch get_maintainer.pl
> > > works without the --json option.
> > What does that failure output?
> Hmm. I am not sure I understand you concerns. Let me add more details.
> So, I think this patch makes no difference if JSON::PP is installed.
> Do you agree?
>=20
> Now lets see what happens on my machine where JSON::PP is NOT installed.
> Without --json:
>=20
> Before this patch:
>=20
> 	$ ./scripts/get_maintainer.pl ./scripts/get_maintainer.pl
> 	Can't locate JSON/PP.pm in @INC (you may need to install the JSON::PP mo=
dule) (@INC entries checked: /usr/local/lib64/perl5/5.42 /usr/local/share/p=
erl5/5.42 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/li=
b64/perl5 /usr/share/perl5) at ./scripts/get_maintainer.pl line 24.
> 	BEGIN failed--compilation aborted at ./scripts/get_maintainer.pl line 24=
.
>=20
> After:
>=20
> 	$ ./scripts/get_maintainer.pl ./scripts/get_maintainer.pl
> 	Joe Perches <[joe@perches.com](mailto:joe@perches.com)> (maintainer:GET_=
MAINTAINER SCRIPT)
> 	[linux-kernel@vger.kernel.org](mailto:linux-kernel@vger.kernel.org) (ope=
n list)
>=20
> With --json:
>=20
> Before this patch:
>=20
> 	$ ./scripts/get_maintainer.pl --json ./scripts/get_maintainer.pl
> 	Can't locate JSON/PP.pm in @INC (you may need to install the JSON::PP mo=
dule) (@INC entries checked: /usr/local/lib64/perl5/5.42 /usr/local/share/p=
erl5/5.42 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/li=
b64/perl5 /usr/share/perl5) at ./scripts/get_maintainer.pl line 24.
> 	BEGIN failed--compilation aborted at ./scripts/get_maintainer.pl line 24=
.
>=20
> After:
>=20
> 	$ ./scripts/get_maintainer.pl --json ./scripts/get_maintainer.pl
> 	Can't locate JSON/PP.pm in @INC (you may need to install the JSON::PP mo=
dule) (@INC entries checked: /usr/local/lib64/perl5/5.42 /usr/local/share/p=
erl5/5.42 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/li=
b64/perl5 /usr/share/perl5) at ./scripts/get_maintainer.pl line 665.
>=20
> Same failure. Sorry, I don't understand what is not clear for you :(
>=20
>=20
> > Dunno.  Depending on the current failure output
> > maybe adding something like the below is better:
> >=20
> > use Module::Load::Conditional qw(check_install);
> >=20
> > if (!check_install(module =3D> 'JSON:PP')) {
> >     die "$P: --json not available - missing perl module JSON:PP\n";
> > }
>=20
> But why? Why make get_maintainer.pl depend on yet another module?
> FYI, on my Fedora 44
>=20
> 	$ perl -we 'use Module::Load::Conditional qw(check_install);'
> 	Can't locate Module/Load/Conditional.pm in @INC (you may need to install=
 the Module::Load::Conditional module) (@INC entries checked: /usr/local/li=
b64/perl5/5.42 /usr/local/share/perl5/5.42 /usr/lib64/perl5/vendor_perl /us=
r/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at -e line 1.
> 	BEGIN failed--compilation aborted at -e line 1.

Module::Load is a core perl module since 5.10 and

I think you are using a broken version of a perl installation
and I think you should:

$ sudo dnf install perl-core

> And for what ???

My idea is to make it more obvious _why_ something fails
and not like get_maintainer itself is broken.

> If we want to "improve" the errmsg, we can use "eval { require JSON::PP; =
}; die ... if $@"
> but this looks absolutely pointless to me.

We disagree.  I prefer output errors to look less broken.
