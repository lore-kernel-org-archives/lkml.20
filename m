Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793682965;
	b=nArfZPc8XJIU1zQPn8SpSjylSvv2KqNRGzzA2IA8X4gn2v3AJsqRgtudf5Y5qatKQQ36
	 RqvI8/3oFZkawXdUGAwLlJCGsKt7WOX+dE5Gj04uFf1fD9GnnOe8jOs+DpwyI51oYrF5w
	 wTuoEkFkSOESWxTCo/vJb/fmMLWWtaKpag28e854JqPIgWFR1bzwcyBO7QKyhE11H38tO
	 br6+yypPzjqF+rJcy1TgJLZn7p7kzb638EKXUaAJ2Ic91kx840I2MKApMgWHQer3WKKuN
	 y6ETWiXhE4wpOtJJoFF9AvI63zpqkBmWw6bf83fkAQFaeS7YkEfXmPG6/sm2nmpM4sQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793682965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PGFryZNd38Zhqh8hnykXJyIhCnVJvOsmZjjsn+Xx4Kk=;
	b=Bwt7qYRmg0wdws3IZPu2N82aS6jrqETpdMvJ10sKew/QCyDPS2wIrtciaoxYnJNl6wb4
	 6qhqrnbhdbO0dvuauCzxST+QC9CTo0RYaa3RHo++0fEYrLeB2PuUceOiw79xeHzDZ4JRr
	 ucoz+S/HqZUcUQsicum6lv94XNGwu/RCTV0mkr8VPWGuxi4pgW/oMrAVZYyEw96f2cUqi
	 +M1MrjgsNk9uN8X8PYuF1X4hF49lUIQc1bSQwxaDgJNtKHaOBCMwAXMLS5ckP/Etukt+W
	 ht0TULzjRP63lgMTNjaLKrnQZcajX0+eWZBRADuC163r87/bMB1O8n2uzpt6dwXGNCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=FSGnN9eu;
	arc=fail smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3922F606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3922F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=FSGnN9eu
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-53656465d1dso2224635b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793682964; cv=none;
        d=google.com; s=arc-20260327;
        b=HgI/Nn7F/HoyzEzrMqJkSUwD+iBj7xKMjGO2yCqM275XvTliYSdkSrbZiNADx8H1O+
         fGMSkhotJIdkiqfA7Qj8HLCXOgMeocSTll20GvU3tAn+68yGrlD/0sZXn8LHRAf5NoL9
         Yqg3OZoiBbAxp1RJzf+Xzrsvh2M4aUbC/lZO4d4ALOwdAdch6+KKYq6QTBMYaEx1M4mu
         /SzunxGf4gh9BnMMve2mQ/rD0IC1rUED00/GVH26Oj0r11bYaaIZ1ffRR+NbiiYsmNxx
         RMv4KcImrjkrrGPMFNyVlF2IFLGX9jSoDFUEBoa+GS6W7/9oLiZ9A8XA/CtHjVyBd3Av
         ibXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PGFryZNd38Zhqh8hnykXJyIhCnVJvOsmZjjsn+Xx4Kk=;
        fh=9bTH/zCO0LoQpBVxrXn4AAhqIcGYiNBSbqMwdVDT7kU=;
        b=Eh5MHTnL38OUt8gluEJrj7AMaz6v5bv+QYlX+fx+B+8+CyN/lx43bctmCvbChT45ei
         UkjXQ/Y6r356Ls6w25xErkUZMnfk6NxIvTytkhSCe4vBSTv8WbAGK78KlUGBomIQ5alE
         WpEkNl9v13oonBkhdzNr1R5WIogxwK5CADMWShfL68eSQW3iQlYMv514KT6nvHrjf1ad
         Q/33xGUMe8rfS6pIHfT0ijkmRwPL9B2cXeFhyO+WYYf60JX3VKLMTvcmVk6UovANJzyf
         1H3l3JIt6+D+vvve8T4gqRH+Q86dPE7IVhtBaV3gG3iNfAv6UU7p0O49P3nxBt35NalH
         U2oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793682964; x=1794287764; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGFryZNd38Zhqh8hnykXJyIhCnVJvOsmZjjsn+Xx4Kk=;
        b=FSGnN9euCc9ApPpIPO11jVmZ5B0lESa7Ydpi553D8AMywtGLGjTxy80uGxzB5MbGBE
         wsDmxZVI6weJS603WotaUcvaZeercfWdQkLTAvdBWod27m4nX/vh8KZgytWZkkZr9RP9
         aHlZOYKQ+11VD8F63mr6nvqzOTxEK7TD5J8RvG7tZkN3h67kCjHAlOHRGw+YSHKAz7my
         j4Hj2JZyAjzWEoD3IZQV6XU6wIeLzz0CrMdsFB8QCKx4yStdWTmNB9ojG/SYMxlLQutD
         Tu+d4ch0ncnEEfl11kbmXXkuAX0sBOhMVMsWZLtTDrc5s3Gxr03xihwjRN3WCVC6wxNF
         zq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793682964; x=1794287764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PGFryZNd38Zhqh8hnykXJyIhCnVJvOsmZjjsn+Xx4Kk=;
        b=HCmHLemPJhS50A/8q/XYy9ght/qFYNcE2RC33s7RMm2Cbt9K0lgj0Yg1Vt+3awHAVs
         jAXZjz1jO865dgDs2MkCMEt3Mi28QWC6cs6pWx6x1SRsz9wyVkIbmRY4FXplmEhDx7bN
         neRACAtI6mInBEyyrK3oMv4tI5L8buxRLvq9mfOOH4VZgRwgY2vKs/B9q5b8AQ7JEiQR
         iqfZDqii0zXjsbcovxn5BWJsPteUT1F6gB6G2I+HDyBPEvw7XRwiHZt3toaZQPGc//aY
         VWwAkSpaabKmTuWXXn13izc3v595H3KAym3Mt75hQuBoDTNKXzLuFwjFKyQcgzQH2abc
         FNfA==
X-Forwarded-Encrypted: i=1; AKwUvByEkP92u2g04wGqbq6W+4vn1hSaP2tgpsanCLWSkALRt1FJV8R7HYB94jEKeeHbFiYpF73BRI2ZJV6w71o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKM2hH7Q+2u/GmJJTeHMKXk4eu+CCrvt5/EvZedlC/TanxLwQal
	sQhR4NCw9q6b4ZZKZtDeSgQ9BVypeoIPRXYaV6FRZTMff49dCxQccPp1ZV5L9zXRd7RVhdJR3nA
	ZhX8cexleZEhXnvA07sBuzQegqFTjg2kgYDG4m1nc
X-Gm-Gg: AYBFou3Mtcr/8utMXAiMLAmNWPnLH9BSgHI+PWmwvSJYD/UZSgN+dUdENMAkW/axsvl
	aHm2ViozXAcH3JjKNCddHvsY9jzb92eD03DhqkoEHNScZWh+qixSPZrTGACOtFzJkM1Zdpr0wKm
	5YSu7HJ0HrB6kY0yMMVG1HY4nkIvM7FKydxhs3sqN9RDnUZEsnZm/i4hPGZHqOjcwDkOVymeNx4
	EarxN7PIA9Uni0/9JrsIaOvyuZrtu56+goBqVfOQGTwmhgTb6G58r5gSsZW+P6U3VwlyX0BAcFK
	q5chzr05WHRIooUOTpduw8LBaIAx3tSp/pzzwwL4k0AmygtyMlgl/6Fe4QkHeNUVz+nRdBbrUxx
	p5/OfSvFUx/DCYZNnIWd9TGRkNb1xu1aD/mR8/XAS7IkHCTHR/pRiW4KF38KnMffLjRIr2Kg=
X-Received: by 2002:a05:6808:178b:b0:4e9:cbdd:457d with SMTP id
 5614622812f47-5640dcb7433mr8152707b6e.11.1793682964043; Mon, 02 Nov 2026
 21:16:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103034932.1790235-1-smish149@asu.edu> <20261103034932.1790235-3-smish149@asu.edu>
 <9b8d9f77-981e-4bcc-9d30-5c53a2c1d1b2@suse.com>
In-Reply-To: <9b8d9f77-981e-4bcc-9d30-5c53a2c1d1b2@suse.com>
From: Siddharth Mishra <smish149@asu.edu>
Date: Mon, 2 Nov 2026 22:15:52 -0700
X-Gm-Features: AclHuK8EhuIqsMApcRe1p4MKz2sF3pCM5QkPwADZCjYjbLoYzLMJZd77Dx7ktuo
Message-ID: <CAKpDGtmMzYinwYLF1AKbA4_kvpWS82Z3yWwsyo0-f0t1QknN_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] btrfs: tree-checker: reject extent owner ref without
 simple quota
To: Qu Wenruo <wqu@suse.com>
Cc: David Sterba <dsterba@suse.com>, Boris Burkov <boris@bur.io>, Chris Mason <mason@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 2, 2026 at 9:41 PM Qu Wenruo <wqu@suse.com> wrote:
>
> I don't think this should go into BUG section, but CAUSE.
>
> Again, remove the last paragraph.
>
> Again, I don't think this really counts as a fixes.
>
> Or all hardening would be considered as a fix, which makes no sense.
>

Thanks for the review. I'll send v2 with your reviews addressed.
v2 will drop the last paragraph and the fixes tag from both patches,
add the tree dumps you asked for, remove the comments, and move the
reproduction of the second patch into the [CAUSE] section.

Thanks,
Siddharth
