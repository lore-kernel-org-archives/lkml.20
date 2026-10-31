Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793405488;
	b=J4ektEVorIiiablIN3wVFZKxw0zN/v9UM5iRBagykQAZVkLNHEz8wWIDHn3cfdqsGhz3
	 7zr+iwTw1BfRaJ1waARLJIQok2pZdqn/aBnUNm6FsDbO7gVfMUQAnH8agcyPXJXPvP8rk
	 llaCn2/dJNO4r8JIpfEhVJyllNY+z/BD8k18DTBAW1zHnJI7RLJ/E+2DNYervrIoPZeDr
	 vSoDI+yl3kietj75ifpjxEoRuHMdgZz1a1STrG62WTYMI2Xt9Do8Wy3rhjwIXtTTcGeVk
	 4/U/eJ91LbYwqzBjqmeFvTX6NyKtTPTBYItA2LLyfRkYxUSQYr7/lJRIBKfV9qgg1fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793405488;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=q4jHsI/AbZd/koH6wKMADI0gVluIyQDd4SokgJ6bMWs=;
	b=Vic+Z60tVrfay3eguxfZkoBEqqwwbQvvQd8diyHH4hN2cisVL71CyEkRnmH2F+Cee2rR
	 rcaLz2VHDhZB4Uh4yuxPK0zeuwf0fdq5YNJ0RXBkD2wS6d0UT07HIZDuYs0EbxVHwaf32
	 GyV2aNec+jjnsk6Ol2i5ExYEEwmyzKX83V6iu0YKKXiRX7T6eKNJF96100Ls5DYcj+r0E
	 b/2nCMW5Foi+LRAN91qqwzq1piU0mayeOuRSh4gUigvCV8QtkP/O8/cpQCahSzBcaDYL+
	 2Dvzzy1mXXh7J0RGEynlaU8BHFQThuiEaoYMyea1+BsbLD102pKSg4LT4o8Z7wEAiIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B6Tr2meK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3EE606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3EE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B6Tr2meK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793405486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q4jHsI/AbZd/koH6wKMADI0gVluIyQDd4SokgJ6bMWs=;
	b=B6Tr2meKVFeP7+4Ty6z9DBngh7ITRoCH+2yIweqrBp6oF1UHmLD/lpt8SII0VXnTZAkYkd
	Q4ymIWQ2YyaQEzrtAAfloGTUp1YQiDePWbnRRhe5mB2V/zWp4DYx3X89ZkotTTSCiq7z4Z
	n6eoUknlvRl6DMlDSyFyifwXeyxFOWw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-Pde6H50uN2y8gqKprS3oBw-1; Fri,
 30 Oct 2026 20:11:18 -0400
X-MC-Unique: Pde6H50uN2y8gqKprS3oBw-1
X-Mimecast-MFC-AGG-ID: Pde6H50uN2y8gqKprS3oBw_1793405476
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2CBA91955E79;
	Sat, 31 Oct 2026 00:11:16 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 9F2851800677;
	Sat, 31 Oct 2026 00:11:14 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sat, 31 Oct 2026 01:11:15 +0100 (CET)
Date: Sat, 31 Oct 2026 01:11:13 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Joe Perches <joe@perches.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] get_maintainer: lazy load JSON::PP only when --json is
 used
Message-ID: <auUyIX3BYZ26iaBY@redhat.com>
References: <auS7NOsyw7pJ7rbF@redhat.com>
 <eb8d1fb4e2a8a32ae1b71df686ed65be800e2918.camel@perches.com>
 <auTDEy_vyMixVRTU@redhat.com>
 <1ad2ae74e3257578cac561f19af63ccb94fce85a.camel@perches.com>
 <auUPo66ISiR2gzmi@redhat.com>
 <e184b73da5229fa387074fce2d977994f6464f1e.camel@perches.com>
 <auUgX2kp9psrvQ6x@redhat.com>
 <9ba498189291b99fe18d3a8ac32722495fa3227d.camel@perches.com>
 <auUps7Hy7W0SqWw3@redhat.com>
 <d3e29969aeaf10b654a3be87601adee6be89c9d6.camel@perches.com>
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
In-Reply-To: <d3e29969aeaf10b654a3be87601adee6be89c9d6.camel@perches.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 10/30, Joe Perches wrote:
>
> On Sat, 2026-10-31 at 00:35 +0100, Oleg Nesterov wrote:
> > On 10/30, Joe Perches wrote:
> > >
> > > I think that was added in Linus' 7.2 in mid August and in -next since April
> >
> > Yes, I hit this problem months ago, but didn't have time to send the fix.
>
> Nor apparently have time to send an email to the get_maintainer
> maintainer about it either.

No. I knew that this problem is trivial and I can send the trivial fix
when I have time to check the code and write the changelog.

> > Great, then perhaps you can ACK my trivial patch? Then we can discuss
> > the possible improvements.
>
> Maybe when it's done without needing updates.

Sorry, I don't understand...

> In the meantime, you have an easy workaround with dnf install perl-core.

Sure. Or I guess I can install perl-JSON-PP.noarch... most probably this
is the necessary module.

OK. So in essence you NACK this change. OK, maintainer is always right.
I won't argue even if I don't understand why you dislike this trivial change.
Afaics it can't make any regression, it just allows to continue to use
get_maintainer.pl without JSON::PP, as it was always possible.

Oleg.

