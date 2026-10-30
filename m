Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377066;
	b=Ypc1C6UlXgJcWg8Z76T8sAf8xf+C4J6s3KXfpe9qOU8N2fTfhNKoCyir9BeCGX1xdH9x
	 mlL7oIt/e9rsYHlChE1Fh68Wn/PG+Z9ySdkfWLYO2cwZcq3a4dS9EedOa4MVB/T84j6G+
	 oy3D9pO2i07V6EWA6rKyAixMZt6c9xHkWgryTt4zYCoSVhUlk0AKAPavul07zQU0s21ab
	 JUgaNaKERrh1CB3yHgXif+pVWET/v2y6JCOX896g7dHJ9FViLir9W/7akvapH8BPbWOO8
	 FlJCOwVXuB6+6Idg2OIR02m3xCC2ZxGe6gLCps7DLqpzqk5N9EAy6Mm/lwjmSPjdBFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377066;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=8t3gdvjjnowUxN7iM8Hsq2V0s8IBX1guRroAt73Fi0o=;
	b=s/EJvkSGy64FqOi/5VM7BXsO6wG1ZMSB838N01V9fi1OeH/or83jbm7ELsKpXLbcIkCd
	 N1Y6E5lse9NpGo+M7S05YuKadPdunytP0QwpDvseO4Hi9PgDZTu7+5EFDA3y2t4dwnpx9
	 Rhrsp7udaFRJf5P+v9UJGlw1OzDUq9uHRLx9C9GijM2GaUT0S3hcR1ivVX6V+SmjCD/7n
	 pbTENr/n/wE2vw3IJpbIdVuSSE1V9xcqRZJ1JZz/UxA7WH2eEwEoFX+3evLNbIYyYA78a
	 SRYblAP9KUifIIFoYx+RmMZ0oDRAtm3XsOWEQpkZgdr/mg6JmIACFxneRcZcDWc3Kdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y6bm4vS+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94E4606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y6bm4vS+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793377064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8t3gdvjjnowUxN7iM8Hsq2V0s8IBX1guRroAt73Fi0o=;
	b=Y6bm4vS+qCynTlkmPRRCAb1IfMrTh732V/mbM3P3dyLfu0kQDa2zXK0HehIjIgLS+8ViaH
	IXXYiBWppXbH9+N4FJDnXtr7et6cMRQxc+ArkKiIK81kB3euDGV78Ccwq3Nsggew2eUAqa
	xuDkEpVWyida9OiRzulWOsEl4oqgccM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-68-XVlegFeiPw-G8LPeL9Yl3Q-1; Fri,
 30 Oct 2026 12:17:39 -0400
X-MC-Unique: XVlegFeiPw-G8LPeL9Yl3Q-1
X-Mimecast-MFC-AGG-ID: XVlegFeiPw-G8LPeL9Yl3Q_1793377058
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3591C195C27B;
	Fri, 30 Oct 2026 16:17:26 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id C7AF31803A60;
	Fri, 30 Oct 2026 16:17:24 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri, 30 Oct 2026 17:17:25 +0100 (CET)
Date: Fri, 30 Oct 2026 17:17:23 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Joe Perches <joe@perches.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] get_maintainer: lazy load JSON::PP only when --json is
 used
Message-ID: <auTDEy_vyMixVRTU@redhat.com>
References: <auS7NOsyw7pJ7rbF@redhat.com>
 <eb8d1fb4e2a8a32ae1b71df686ed65be800e2918.camel@perches.com>
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
In-Reply-To: <eb8d1fb4e2a8a32ae1b71df686ed65be800e2918.camel@perches.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 10/30, Joe Perches wrote:
>
> On Fri, 2026-10-30 at 16:43 +0100, Oleg Nesterov wrote:
> > After commit 09d8b39563e8 ("get_maintainer: add --json output mode"),
> > I can no longer use get_maintainer.pl; it fails at compile time
>
> ?
>
> Just verifying that you mean when using perl directly and
> not something like perlcc.

Yes,

> > if JSON::PP is not installed even when --json is not requested.
>
> What version of perl are you using?

v5.42.3

> I believe JSON is bundled since perl 5.14

Well, JSON::PP is not installed on my Fedora release 44

> > This module is only needed with the --json option. Use "require" to
> > load this module dynamically inside the "if ($json)" block instead.
>
> The patch may be sensible but could fail the same way
> if you used the --json option with your version.

Of course, "./scripts/get_maintainer.pl --json ..." will still fail
the same way without JSON::PP. But with this patch get_maintainer.pl
works without the --json option.

> > diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> []
> > @@ -21,7 +21,6 @@ use Cwd;
> >  use File::Find;
> >  use File::Spec::Functions;
> >  use open qw(:std :encoding(UTF-8));
> > -use JSON::PP;
> >  
> >  my $cur_path = fastgetcwd() . '/';
> >  my $lk_path = "./";
> > @@ -685,6 +684,7 @@ if ($json) {
> >      $result{web} = \@web if ($web);
> >      $result{bug} = \@bug if ($bug);
> >  
> > +    require JSON::PP;
> 
> style nit:
> I likely would have placed this require immediately after the
> if ($json) {

I am fine either way... should I send V2 ?

Oleg.

