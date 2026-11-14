Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794680259;
	b=rA5xI6LRuI02gIZnIssvDtUCPLGjoKYJH0yExT+6oTi3nmsi0L7PzhXrhBIpYX2rAlVX
	 JNEjcyzUShWmCPjxWZHmxOhTeyl49Vo+IvZ0EVKKYCGGdAP8of90FGH4bdHXeIRHx8dWt
	 4H2MPA7c6QaS3k36RV0yh05dXgx25sb7HsZz+hU/p9dZqBWmUfctk/ukzZCoin1UGF1Cb
	 nQOt4TUaReWrVDMyq3creCV48y0VvhDmtHsVh2ksFgc8yTo9jCpNMNao0t6Q4UNUAv02u
	 augeaJNRqy9xoauAIVXJnR+ZhQC3FeLgMd0TKQSFe0lnG0e/jZkcoIwOLfkka+xxzXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Akw4w+Mm9p0/w7vgjEImHk5sQ6l3ya6ZIdLy8E2yDA8=;
	b=PZg3PbDor1Flm0okDhmnLNKTPIJexCr5GCYJsjpZJ5FxhzydusBNKWcDV9iAH6xFBMYi
	 5V/EKflKT5zUkWMrWsoSr7tEENssDgE2FgUX+tBgbBzkZtjwagS5y/eNkugxBdZoXe3qP
	 6dXxEVTq3beusH4mwAzj21cAGD+981PYyf0aFEPUPTgCGKkna8uzjUFnkoNZKzJq8XTus
	 nhVfz5FKcQL1VrIjrhz9PHNWNxjFSoV+6n+TDg35hft2IQZbt3IxxPYvGKl1GBpkkQSzK
	 qahXziX/va5SHl7kVThyO0J+dfSDA/5tKT5NYjj9B3LSYspBDuRZLdpgT/M32RrlaVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mXVOsOUK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AFE606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93AFE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mXVOsOUK
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so2219221137.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:17:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794680257; cv=none;
        d=google.com; s=arc-20260327;
        b=RCn+hpJaLCAS/Y2IeVxtEQAZioMtQfjEIaHIOuYxV8x1HCEQxiihii1ktKdihd0qN6
         JWqkcwu/iSQaBK/IRDqgly2UHKvooK2M3+dePZ5C1hZHFiYABhlRWdP6wlijh99qyE7/
         Ly1Iw+11TkFH3eqvSTGd1jCTBmMrEJEZULRj3vhkdofObdgwt6832Wzzrxa8LN+uc1C2
         NGTR7QDEdwY21JNJtJ2GMerc8FZgJjuu+47fC4QpF9+v6ruZ7vA1sxmH9RYKfswT+0IJ
         ZH56O1PlBlNeamueWt6NxxgvbkYg6sdUQmjawF5ZRKWrDqxC/r7PLRMEGBSEPGwRGTg3
         psEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Akw4w+Mm9p0/w7vgjEImHk5sQ6l3ya6ZIdLy8E2yDA8=;
        fh=CM+ke7wxIb+N7kpWi/KeMzlZPvYAQ43AJR8JhJpVaB0=;
        b=mKLzW3r0Hrsg8sfOieCSt39U+4df8r4MoDOzg9RYcNAKkGx3fCQqwat0lK291xndxo
         jBAF2QiMK7dTWRGhgZuIC9hoA3HsC2+OJgXvW0eUhym4HMrSYwkMvlTbKeyYL44Q1TFr
         HZ7BpplpGf4HkHB7jsZ/QqYDz0uFwUFhOxe5IJjnFb0gprC8soSs5Qe+GVIlKXBxLlA9
         pGk6UPwMS5pabgK0bPty6rT5Geb3h72MNdJEIkgVOKZL4YePNP71m2mkRAJiWi7u8ei7
         +x+qpOInWIVYNus/GvuKV1BLhkUCGwoxs46IOO8CmofnHV6LT0Di01KB9RyGyViFJHV7
         T5ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794680257; x=1795285057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Akw4w+Mm9p0/w7vgjEImHk5sQ6l3ya6ZIdLy8E2yDA8=;
        b=mXVOsOUKNAJeo3ZO3fzDWnh6gj9KJzfdTLuB9IRjHlWh4Nit9zPTAnajqt84e8RVPv
         L472Pihle4AR+2PogxGgWNAO36LIkZJQgpwzFM2MMFEsHdRsRmNsAE+8x8RGcaI5ZSmi
         Yt1hgOdSKtLekx90VVujp+zofGT8mX4KiOxKkZNkG0b535JM72hw6vmkLm6ZkW3MCwJr
         R5pVv87wfXrbumPvOB7BpKaCiDCsIp9tFbXuP96qQIjFULf+dBKE12kOkg5M44uewczb
         ZpgsDH9LCETVRBlm/QsWsMq75Smd2gyhaHhRH1Rcc38tx9BC5snLs4YFr+1vwJJWQ1Ki
         Ci6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680257; x=1795285057;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Akw4w+Mm9p0/w7vgjEImHk5sQ6l3ya6ZIdLy8E2yDA8=;
        b=AbAbe6rf00rgAeSG7EPh7lesLC6nIDUStqWYD6Th8+kU5dCoAUCdXkPG4D1Bl7rRmd
         7fc/7YX+M627JJKhZRr67V9+dE4rjSXmDe8whsE1dHyEirMwSGk4uJs2E3LtgQttPPmg
         3PkODz+9QQt01FWu7EFiLO7KfAzu2auoeJ/97aSOR9mzDCpVp2GhBNiBhO7cDYZwsl9K
         lZuwD3enmX+Ry7L2nt4x0GVpeCi4w+FBaSHwpYx38xhHPk8z2ypRJ2BnB3EAjc9KuTZL
         KIKmjFxUEKpMNqZQ304FOR7EdddFQgXl872y/QtvxAcH1UPDa18PFQGYkcjpVe0JHiyB
         YRag==
X-Forwarded-Encrypted: i=1; AL+hErFWpa7tj7j/j3k/hbpeCc+ba/Ekh1kz20wxeCDLIgio3yPaT1qKZHQRHv/R3DxQrfXQ1OSKAnsotHnGMK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5t42uSlbQ+WhKFq6wQxByusiFXzzNtEI/HufrUvFzSUs1qb2p
	FqGYkGF5DjZEly6z6Aa2Q2SMPrxUy6LFU3bYyk0Ey24jWecIMB+NMo6B32PRjELNPEy0qMHvw8n
	XIbJGHoukHRX63lcRRvyWbssE5jzlan8=
X-Gm-Gg: AYBFou0iw5vZbCLFiLyJJ/iWsXOuL/AEpswjRdc/P4mgy0CVGMBJbyrAkTWK+QJKGQ/
	mxgibTfACDF0NrxtDk+vSyBLafZ4C+VQ/Sbkq46aeXMafvIAxJJHwUbbtpDSkLQslL3HGoDntMn
	Tj4hJ9wDyWexsUUGaWbmzvGGinWTF/pzGVCQNmPRk47/eTNf2w5f9jUtqGgiz7e11d5PeHmLOOD
	U7b4gkXRdzngWQsjxdxNwVB4BHgAnSr7zLOwTnMQ9Kxj8dINCsn8AZhhVpO1UmJZ0+AL8oyJfCt
	xmLbkxkdwZCydp5MOiTvCXknVZDca8vFsP5jgIeN6B2jB+4i9nUBoQGcdpSmpo72pP9HBQfM9xt
	KGyfq3MsoF4okpGJgZWUBAugmWxjBgapsVdn1IqVJuecbiNaRCgblHo4h2nlCkLUCbpEXcWOM6b
	m3yFzXaaZ12qu+gePMoMOUGpGNow/9XkiC2emfioMgLppcEC5XPckP6yhDVwaIFYH6u8YNjxuDT
	xXk+veoXg==
X-Received: by 2002:a05:6102:94d:b0:7cc:2cef:b330 with SMTP id
 ada2fe7eead31-7d64d6ea31fmr2531841137.12.1794680257398; Sat, 14 Nov 2026
 10:17:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261010095211.12831-1-krishgulati7@gmail.com>
In-Reply-To: <20261010095211.12831-1-krishgulati7@gmail.com>
From: Krish Gulati <krishgulati7@gmail.com>
Date: Sat, 14 Nov 2026 23:47:26 +0530
X-Gm-Features: AclHuK8z0QCSIrVMOeF9oHB31OfX_1Kym3M-aXR-skyGrdiQWegAViV-btSEV5Y
Message-ID: <CAOzTEaUWqAh14GFL2ZfrLS8q6EU2VsY1TyG8Tw2C53+6d5R6HA@mail.gmail.com>
Subject: Re: [PATCH] HID: core: serialize report_descriptor_read() against
 probe and remove
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: syzbot+bc537ca7a0efe33988eb@syzkaller.appspotmail.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Gentle ping on this patch.

Please let me know if you=E2=80=99d like any changes.

Thanks,
Krish Gulati
