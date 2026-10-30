Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400934;
	b=z4Cuobg4p3jNXYyHoKvpS+n8xXfXdwntd9dgjo80GTKTbtyCsR04oZ8YKOCEgCb/QcJA
	 uMu5E3Tfq3fr9uUNT2Iz6nUbNpaACHjujZJw1wg4fEcRoLSlPIfOpuzyNonOnAPL37Ptc
	 5su5TQ8ohSCA339t3hke7OsHeWZ16B5XWIrmy5hjLltJysubFoksy0SMYeH0Jshul0pII
	 jchyum0iexdfu3VpkKM4oZgr/2h33u9AWn+ka1lPxeJN4xmdqswZ7+Juu/zNpUQKf9u+f
	 pxuFXm6C2H/lxJqWDL8nltZxWo9C/l7doB2Ii7xretQRd1emSWnRVEn6n92+/DXrgYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400934;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=CDyeR6MZdLSxDyXwXtqRmsQxvTAUY6G1SRWSYovzJvo=;
	b=NN5oE+WG8c6p8ee7XL7nJd80sliB35sn7vdDzZmVPI7eXNZcF5Hf7gCXo0pUBkbIGvEZ
	 e3zf0ETvrDaXznwjFbnLaG5v69PJCKLNN6pUygjJ2T1TUfOrSsUKkZjco2y6o69XDkAI4
	 N924U4JqpZ2Kyy7ZwVqaMwGkKpUbBqVr9Lq34xJTWRWCkGyn2hgoVC1CWJUBfTr5Jgij3
	 /4z4I64cmTk+TIa1U9rjS/Y0xg5yPa81xaRYWhgBkYe72Lv2fbJb60ulySzhWWTZDg03Z
	 9+7/2+isKou44gsyrLLfBY2I5wwRxAZBEd3vfvMA8Qc9mwsIthO8Hjlb6mhQFQrTpYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OMYTcvib;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F085606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F085606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OMYTcvib
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793400933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CDyeR6MZdLSxDyXwXtqRmsQxvTAUY6G1SRWSYovzJvo=;
	b=OMYTcvibA5MZjzwYEteoKer1oQe1ddZJtUdOrgs5NP7+UrIevLbKUy7tPdRazZVHfpdli8
	VUDHYm2gQILH6Pcw4Yz7VO6OATlfBXxctFcXUHoobHMwNNNIi1fYPDdew6P/roVxbZdIW+
	h8VpG/fRLFfv50JmBhzYh6PcGc4sJwQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-115-pP28hp1ROcGIgBhp1YoC4w-1; Fri,
 30 Oct 2026 18:55:31 -0400
X-MC-Unique: pP28hp1ROcGIgBhp1YoC4w-1
X-Mimecast-MFC-AGG-ID: pP28hp1ROcGIgBhp1YoC4w_1793400930
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E4D4180036E;
	Fri, 30 Oct 2026 22:55:30 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 99E037C6;
	Fri, 30 Oct 2026 22:55:28 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri, 30 Oct 2026 23:55:29 +0100 (CET)
Date: Fri, 30 Oct 2026 23:55:27 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Joe Perches <joe@perches.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] get_maintainer: lazy load JSON::PP only when --json is
 used
Message-ID: <auUgX2kp9psrvQ6x@redhat.com>
References: <auS7NOsyw7pJ7rbF@redhat.com>
 <eb8d1fb4e2a8a32ae1b71df686ed65be800e2918.camel@perches.com>
 <auTDEy_vyMixVRTU@redhat.com>
 <1ad2ae74e3257578cac561f19af63ccb94fce85a.camel@perches.com>
 <auUPo66ISiR2gzmi@redhat.com>
 <e184b73da5229fa387074fce2d977994f6464f1e.camel@perches.com>
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
In-Reply-To: <e184b73da5229fa387074fce2d977994f6464f1e.camel@perches.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 10/30, Joe Perches wrote:
>
> On Fri, 2026-10-30 at 22:44 +0100, Oleg Nesterov wrote:
> >
> > > Dunno.  Depending on the current failure output
> > > maybe adding something like the below is better:
> > >
> > > use Module::Load::Conditional qw(check_install);
> > >
> > > if (!check_install(module => 'JSON:PP')) {
> > >     die "$P: --json not available - missing perl module JSON:PP\n";
> > > }
> >
> > But why? Why make get_maintainer.pl depend on yet another module?
> > FYI, on my Fedora 44
> >
> > 	$ perl -we 'use Module::Load::Conditional qw(check_install);'
> > 	Can't locate Module/Load/Conditional.pm in @INC (you may need to install the Module::Load::Conditional module) (@INC entries checked: /usr/local/lib64/perl5/5.42 /usr/local/share/perl5/5.42 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at -e line 1.
> > 	BEGIN failed--compilation aborted at -e line 1.
>
> Module::Load is a core perl module since 5.10 and
>
> I think you are using a broken version of a perl installation

And how do you think it is broken? my laptop runs the fresh Fedora 44.

I used ./scripts/get_maintainer.pl many years, almost every day, and I never
needed to install the additional modules. Until ("get_maintainer: add --json
output mode")

> and I think you should:
>
> $ sudo dnf install perl-core

Oh. I LOVE perl. Damn I still consider myself as a perl programmer ;)

But why do you think I should install the additional modules (which I will
never use) on my machine???

Again, again, again. AFAICS, this patch makes no difference if JSON::PP
is installed. Please correct me.

It just allows to use get_maintainer.pl without --json in the case when
JSON::PP is NOT installed. This is the ONLY difference afaics.

> > And for what ???
>
> My idea is to make it more obvious _why_ something fails
> and not like get_maintainer itself is broken.

Good idea! But again, again, again, if JSON::PP is not installed, then the
failure message is the same with or without my patch. Just get_maintainer.pl
does NOT fail without --json.

Although to be honest "Can't locate JSON/PP.pm ..." looks very clear to me,
but you can make it more obvious with or without my patch.

> > If we want to "improve" the errmsg, we can use "eval { require JSON::PP; }; die ... if $@"
> > but this looks absolutely pointless to me.
>
> We disagree.  I prefer output errors to look less broken.

less broken than what? see above.

It's not that we disagree... Worse, we can't understand each other :(
Perhaps is this my fault.

Oleg.

