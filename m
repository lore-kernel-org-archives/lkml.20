Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396650;
	b=JImnnUxNXei/tksQpMSnUC77dzirnhdPPP9qxLKXPW2mFyvwCbYNnKXOE+To1lPo3bhj
	 DH6f6kIhAHWKEesub+VBgim14/U1y5MgFUY2Q456ksH7Zi439P2QMCtpXhoPo9l+OlrzO
	 v1dGRpianFyHiAQl5Ok6AZ26P6hXDWLwwmm9zS6c+CSd8HdJNcCSibK2bLkA6UMdrE/oB
	 V7apoDuyknbdptzUvrlIERRhXbEPgSRgokwLcxyHyqK3z315axlr06eGbs7bj4Ohu32iV
	 twjD1OQ84Ht97zaAiKfopCglLdIoJq06wg5YD7D2gYe8AnxlA4anivChatLGGg97l9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396650;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=3XXUbMkh50qOlZUprywzOe5GUVod3RXehiu4UpE8QAs=;
	b=mMjN/YyYw2kJ3K2OXWZdywnIb7IK+pOYYsCmMqizN0moE41cHUkgoDDdr+XcSd2EsZMF
	 UGhw82N0lyTqAumhioM4xw6mQNQaGymgWgLKL4DoNcvnAAeggKrYnxoJNlqCsvFRU1tDG
	 6V5/GCoGyUGKAzFuQEO+cdhRQlOTaTyGpMGbY3J//P29DM//oPZrIIe7V4+17nPYj0MTh
	 7uIUoXQdw1akjx+9pwWsJ1lbmBAxOuyGQhQDOEodOjFw7CgK0Vgx8qXiy8lGz82Pikyaz
	 3Htb1v7kiDKUyoVh7gnHHhliTaGd8oS0o1JW5urghjKwPJozh6tpBCT0PWyCbj0sodw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B2EyUsKE;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39507606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39507606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B2EyUsKE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793396649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3XXUbMkh50qOlZUprywzOe5GUVod3RXehiu4UpE8QAs=;
	b=B2EyUsKEiDflv2zxaISnCTAEeAVPamNycQB0ZgIY60gLnyurIu2TdBiwKtPiXxYBt58i3I
	EdWuy3S8hfHc++C5IFqf+bVm1OI77YOMyAfxEZJI+iX/NP/rQSfvAlq6yv04Niag7lJFNZ
	5lJA8xqKzUXki+fWSnh1WfZQlzZj0rU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-sN34vy9_ODqkn-MKdD0hRA-1; Fri,
 30 Oct 2026 17:44:07 -0400
X-MC-Unique: sN34vy9_ODqkn-MKdD0hRA-1
X-Mimecast-MFC-AGG-ID: sN34vy9_ODqkn-MKdD0hRA_1793396646
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 08F811956051;
	Fri, 30 Oct 2026 21:44:06 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 996A71956086;
	Fri, 30 Oct 2026 21:44:04 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri, 30 Oct 2026 22:44:05 +0100 (CET)
Date: Fri, 30 Oct 2026 22:44:03 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Joe Perches <joe@perches.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] get_maintainer: lazy load JSON::PP only when --json is
 used
Message-ID: <auUPo66ISiR2gzmi@redhat.com>
References: <auS7NOsyw7pJ7rbF@redhat.com>
 <eb8d1fb4e2a8a32ae1b71df686ed65be800e2918.camel@perches.com>
 <auTDEy_vyMixVRTU@redhat.com>
 <1ad2ae74e3257578cac561f19af63ccb94fce85a.camel@perches.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ad2ae74e3257578cac561f19af63ccb94fce85a.camel@perches.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 10/30, Joe Perches wrote:
>
> On Fri, 2026-10-30 at 17:17 +0100, Oleg Nesterov wrote:
> > On 10/30, Joe Perches wrote:
> > > > This module is only needed with the --json option. Use "require" to
> > > > load this module dynamically inside the "if ($json)" block instead.
> > > The patch may be sensible but could fail the same way
> > > if you used the --json option with your version.
> >
> > Of course, "./scripts/get_maintainer.pl --json ..." will still fail
> > the same way without JSON::PP. But with this patch get_maintainer.pl
> > works without the --json option.
>
> What does that failure output?

Hmm. I am not sure I understand you concerns. Let me add more details.
So, I think this patch makes no difference if JSON::PP is installed.
Do you agree?

Now lets see what happens on my machine where JSON::PP is NOT installed.
Without --json:

Before this patch:

	$ ./scripts/get_maintainer.pl ./scripts/get_maintainer.pl
	Can't locate JSON/PP.pm in @INC (you may need to install the JSON::PP module) (@INC entries checked: /usr/local/lib64/perl5/5.42 /usr/local/share/perl5/5.42 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at ./scripts/get_maintainer.pl line 24.
	BEGIN failed--compilation aborted at ./scripts/get_maintainer.pl line 24.

After:

	$ ./scripts/get_maintainer.pl ./scripts/get_maintainer.pl
	Joe Perches <joe@perches.com> (maintainer:GET_MAINTAINER SCRIPT)
	linux-kernel@vger.kernel.org (open list)

With --json:

Before this patch:

	$ ./scripts/get_maintainer.pl --json ./scripts/get_maintainer.pl
	Can't locate JSON/PP.pm in @INC (you may need to install the JSON::PP module) (@INC entries checked: /usr/local/lib64/perl5/5.42 /usr/local/share/perl5/5.42 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at ./scripts/get_maintainer.pl line 24.
	BEGIN failed--compilation aborted at ./scripts/get_maintainer.pl line 24.

After:

	$ ./scripts/get_maintainer.pl --json ./scripts/get_maintainer.pl
	Can't locate JSON/PP.pm in @INC (you may need to install the JSON::PP module) (@INC entries checked: /usr/local/lib64/perl5/5.42 /usr/local/share/perl5/5.42 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at ./scripts/get_maintainer.pl line 665.

Same failure. Sorry, I don't understand what is not clear for you :(

> Dunno.  Depending on the current failure output
> maybe adding something like the below is better:
>
> use Module::Load::Conditional qw(check_install);
>
> if (!check_install(module => 'JSON:PP')) {
>     die "$P: --json not available - missing perl module JSON:PP\n";
> }

But why? Why make get_maintainer.pl depend on yet another module?
FYI, on my Fedora 44

	$ perl -we 'use Module::Load::Conditional qw(check_install);'
	Can't locate Module/Load/Conditional.pm in @INC (you may need to install the Module::Load::Conditional module) (@INC entries checked: /usr/local/lib64/perl5/5.42 /usr/local/share/perl5/5.42 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at -e line 1.
	BEGIN failed--compilation aborted at -e line 1.

And for what ???

If we want to "improve" the errmsg, we can use "eval { require JSON::PP; }; die ... if $@"
but this looks absolutely pointless to me.


Let me repeat. If JSON::PP is not installed, then get_maintainer.pl
with --json:

	fails the same way before or after this patch, I see nothing to improve.

without --json:

	fails before this patch, works after this patch


Sorry, I really can't understand your concerns.

Oleg.

