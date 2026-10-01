Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AA9371049
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790836305; cv=none; b=r4Zk+YvKA4Za/mVRO5JA2vKE0UHIbd/sfOeTUfe0A4GrYkaY5wJDXKv7wxvCmp5DBtYTailoK438e7PBRHF4nrstLKUfmSMnjKicVuzB5pLoLCK6/uj3b9gZtC2UovI8jHsGwrRb+IRDjTFdqepwj6bYYG/pLBlajjW+0sP/LcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790836305; c=relaxed/simple;
	bh=/ZLHEKduGAMi8OX6dtIVSYgg07wbm+DIRKlKcLO5ThA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qYHQN26mJXZPyj8RN2FU+iFQ2+qxA5GlKKckCSnVJvH28g3J3FfZf9dcPpTc/J6OT503IgM2VsRqwoaQvuBPUryQ0whafJcJR6zgnGYRt4Ps/o3b+Wh4FoQl0fHLtj0IYipYpzwfGqwEkwY+Q0WoAayHQbAkGaFnrnR8HyDPPmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HmRSDj6t; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BwJEXH9a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HmRSDj6t";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BwJEXH9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790836302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KmUsUjxSpFiungKCvsESmFXzpjQ9eHiLCJCMaDAibjo=;
	b=HmRSDj6tE3ZfaC2aMO5gEBxUnRqDK3Ip+IZpkbhSevau0Ab2aC1t72G6NYxRe+5twp2e1f
	Rriuzg7EsJHPYKDyVqZPMVq//HKjv+Vx8i7Gk9M9GZI4htwx3oNTmUzRDhVCWBdUUzJXCK
	WK33UONVculXmaO8kZboOY0ifRntE6Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-HKk6vewnPh-3V13XgKWBpA-1; Thu, 01 Oct 2026 02:31:41 -0400
X-MC-Unique: HKk6vewnPh-3V13XgKWBpA-1
X-Mimecast-MFC-AGG-ID: HKk6vewnPh-3V13XgKWBpA_1790836300
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49ff43a1ecbso35287025e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790836300; x=1791441100; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmUsUjxSpFiungKCvsESmFXzpjQ9eHiLCJCMaDAibjo=;
        b=BwJEXH9aur8x0BfWiRyciFJdvnuNFblQT2lf7YSNBnDKjtuzVMxGJ60BK6yY98uw/E
         RlbOAIze/0chJ1kQCrJg0yug1jEDVaDvdZCIx/Pv23CxIgHANgJ+rm7R7IM1zQgKXxds
         9t9zYOsRP9RvKuH0xlpEnlraoMELx7Md0gLIeVgvJ4rDg+/eWhrRxSV3opDTn5MadzDb
         Qy6MPmjeR4NTNuPyRWwf0Sqo3gxv/HWPTgkLpP+qiav2C0Jb1ZhH+AF28c+PQx+YIUfX
         a1Jth/6gd4X6B86xGz05HH7/1pIVZHzSlrNd7GBMjhrlQDieGa+8H8gY+fUpHUJeFM22
         1sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790836300; x=1791441100;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KmUsUjxSpFiungKCvsESmFXzpjQ9eHiLCJCMaDAibjo=;
        b=xWVEFzIus3SM9mSDf7fjKDDUhVUCeLbxBk+WQGJl9Z7xtGsNTAGZdkiebGWE7N/6ze
         9lk7lLkkub5M6etAZi7Ad/mnv/LS/ykfOPaTlWs1bVHINZXiDtNkZkMjzBYFyuVrVe4w
         ZMo1xNnzyJqBAW9CELZxDnM4975CiSdwzsxJ+QY3APBPBe9kqi9C99h4RZz826RIEi3A
         BcDU7mnAIIzgRb58Wm9FLfIbsPCVp87W9TeSCn+x0jHBAycSWfKiH7Oi148ywQh3S+Hb
         +2VAtMgtyUOYQtWJa7v42eQS+JUfaaXOw2igNmU6KMbuPtFpC3bhCQcqRuqqCF7AGbbq
         y2fw==
X-Forwarded-Encrypted: i=1; AKwUvBxf+iFAb9uAK2nHZSWf1LkUA7+pzZiuzhD89wGUvRhgU2QYwbZzcrOiDyegMrE0yeVOX40rsT3gqcGVPLs=@vger.kernel.org
X-Gm-Message-State: AFuF++nRH4qZ32I9Nfc0lGgsd6zWJV7jCVcvJfjdaKWWMFIajANT1cq1
	52eqOmoFqsGSxQKUc4FjoKjQhHZfRxc9Km5zeFKkAjUsrXGo2sHHaXLBd413GrvqXxCr9G9iC26
	aQi3htSD6795nNfcc0gOJimNismSU+jB0NAAZKgZuennAB19y748VAozsrFyr7mD41K/O6HD9mA
	==
X-Gm-Gg: AYBFou0zeWfqfRmljR+ftCNu9jpeoXPfxufDhhIMfNh5WiHgRVl/xEZ90AhTCJmsLSv
	b30RJjgnMqX0hM9wCXrBsyXjGbCE6YNxljx6007DiUGopM9Ub1pSmfKzroNKF17HpYxau+Kfk8e
	KF5RCQo33JwoBk7GjwmJyuv4gX5wqYwvYakCyRxFmqyoCajGdJbUj7nJRJnzp1wcM4sTeANOH3b
	nQq71NZbCko+MsS72CQU3mb89IQ+Cw0S4hWutQrGDgVP7JjQtyPnDlMogb6JQ1Oa0h0EuvFQICf
	UR0u1wTnvi/bt0Hvk7qb//1tOkqazjHu4MQyf0NTozDq6UExvg6qkBwg39qPCVDUFYjolnytuze
	aXT/GGW/hUG32qe9on47Kx5dRvIQ=
X-Received: by 2002:a05:600c:3ba2:b0:4a0:1b14:e846 with SMTP id 5b1f17b1804b1-4a01b14e893mr67031185e9.4.1790836300195;
        Wed, 30 Sep 2026 23:31:40 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba2:b0:4a0:1b14:e846 with SMTP id 5b1f17b1804b1-4a01b14e893mr67030875e9.4.1790836299812;
        Wed, 30 Sep 2026 23:31:39 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01fa15e51sm43325415e9.2.2026.09.30.23.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:31:39 -0700 (PDT)
Message-ID: <e6f78faca93f92981130621d712ac05374d83b05.camel@redhat.com>
Subject: Re: [PATCH] rv/rtapp/wakeup: Use "rv_this" the rv_monitor variable
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, John
 Ogness	 <john.ogness@linutronix.de>
Date: Thu, 01 Oct 2026 08:31:38 +0200
In-Reply-To: <20261001044218.3508990-1-namcao@linutronix.de>
References: <20261001044218.3508990-1-namcao@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-10-01 at 06:42 +0200, Nam Cao wrote:
> Commit d9e4c61a12dd ("rv: Use generic rv_this for the rv_monitor
> variable in LTL") renamed the rv_monitor variable to rv_this. But
> rtapp/wakeup monitor was late to the party and missed that.
>=20
> So for this monitor, rv_this is an empty struct. The reactor fails to
> work, because rv_react() checks monitor->react and sees NULL.
>=20
> Correct to "rv_this" and make the reactor work again.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Damn.. Thanks for noticing!

That's a weird one, I cannot think of a way to only declare the rv_this, so=
 the
compiler is perfectly happy to give you the empty one..

I'm taking this, but I believe it deserves the Fixes tag. What do you think=
?

Thanks,
Gabriele

> ---
> =C2=A0kernel/trace/rv/monitors/wakeup/wakeup.c | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/kernel/trace/rv/monitors/wakeup/wakeup.c
> b/kernel/trace/rv/monitors/wakeup/wakeup.c
> index 01b47416f24e..2e803e79181e 100644
> --- a/kernel/trace/rv/monitors/wakeup/wakeup.c
> +++ b/kernel/trace/rv/monitors/wakeup/wakeup.c
> @@ -128,7 +128,7 @@ static void disable_wakeup(void)
> =C2=A0	ltl_monitor_destroy();
> =C2=A0}
> =C2=A0
> -static struct rv_monitor rv_wakeup =3D {
> +static struct rv_monitor rv_this =3D {
> =C2=A0	.name =3D "wakeup",
> =C2=A0	.description =3D "Monitor that real-time tasks are not woken by lo=
wer-
> priority tasks",
> =C2=A0	.enable =3D enable_wakeup,
> @@ -137,12 +137,12 @@ static struct rv_monitor rv_wakeup =3D {
> =C2=A0
> =C2=A0static int __init register_wakeup(void)
> =C2=A0{
> -	return rv_register_monitor(&rv_wakeup, &rv_rtapp);
> +	return rv_register_monitor(&rv_this, &rv_rtapp);
> =C2=A0}
> =C2=A0
> =C2=A0static void __exit unregister_wakeup(void)
> =C2=A0{
> -	rv_unregister_monitor(&rv_wakeup);
> +	rv_unregister_monitor(&rv_this);
> =C2=A0}
> =C2=A0
> =C2=A0module_init(register_wakeup);

