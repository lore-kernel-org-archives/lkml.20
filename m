Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793801255;
	b=lL/hqkE7NsQZKDzrHCHLxl1eoFUSZuXCBw6ih6JfNKQJTgeqZ2TfSHyzEXTdgaXJVVZy
	 r3B7T6NxcQONG+/YtyjwABFmESXEj+j49ZMUgwKK9NqCOqtNUUM06UVyeva6Q+DhwPMlb
	 qYo/KFCz9L0wo0Jc4pzYdRVNiEKbE7FXk5PQfd3gII80eC6F2/bwmF5j1OxFX/w6QA7lu
	 H9lOaa6b4kuS/rJzmkAPuwZfAis7wPzGAl4vi+IVEO30nYug7WBh6JZIK+wIzN1Mr2Xqm
	 zj+tPM3lr9wlCst4/oIWdUFgZf7lT3O+utODwLKdcPLYVlsjXvIYCulU5JZnqb+I8wQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SaAZs9B+UXOHTaRDcZeWz12aXXxWAqfcjHVOwU/3B4c=;
	b=hVj372D1mS9jVfdOUnuwzu4UipgauYXQcPoAMyioGVWVoRBRKhuk0CzQMDWNI48oRkhf
	 UB1F5gPygk3f1eWn7w8Yx/s09M1OCIl6FHz7qbMBps1tMQOW6d12M3SI9+uxwik+CM6+u
	 S54zFLL8MRZQ8x+xBjWBYNNuUgjAkzT2ns2xT1u9glmMdIic/5W76r25HaI1sKyf7EL74
	 UgGc6wlA4NQxSDZ1afvQfgpFtLdYqQoqBTQQkvpWKjYXf0iu+ENQzw/wdtc5O6BYUJyrI
	 YVcAfqB57ZknVcd6muAKtDTTs9zPqfE1A3qGSdE+a1k8lGjDVXMKAQzfXJzXndM1X8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="V/2yO7/8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DF7606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37DF7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V/2yO7/8
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1680a50de2aso6816c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:07:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793801254; cv=none;
        d=google.com; s=arc-20260327;
        b=mMOJ9i0n13pgh2d5mf8vf3P0xwzFTdazYhGKyC+pTBvtuoG7H6hepnuAoRZ+b+QFx0
         5+FhGf+e7BmWSDx6KQ5uA6nh+JCNWqpwwHUexVAEctEihVO8REXoHZLzWS3vSBtm5o82
         p/UwfeVHwxvvxDJh77slJKxSPKddAEpIDDqaVZEq4gB/eNjACrDb100SnThz7P4lI626
         x7TzLq4utJ/78626BBQadFFWtIlJF8XroIMeUUs61wOJPU9Yw1FA/LbEq9wX9ZoCw3FT
         phyzIVXLl7ELvtLXvcUbshDLsm+HSefMa4wgAPeN3W5hBk6Kq4/hBAiOalXWlCNas/lL
         arQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SaAZs9B+UXOHTaRDcZeWz12aXXxWAqfcjHVOwU/3B4c=;
        fh=6ewGlsSme+Id2Sjl6vt+klSUFbd26mUecVoWITU6Z34=;
        b=CZBld4nRjcZsVge9mmTJYguvPrj8lQ833bVyuDXHQQHa1r/We5iTSDSnOhibnXQruE
         lH2uVmvtEkpJG5uWtyQKPAerJ7vzlvdLUxXch5iTme0Bs2esN/BDmWoHTj6FfltZAu/a
         Y9hfcfh8iHWf7+pGbMFN1saWsFRerddP3s6cbh35bal/YlOnx1OEYN4FMMclQFq5WyMC
         bD89bH5OO/lQjvunPp9iAIDCFAR8YOIrCpGAIagLJtyYnCi0pbCxQYV35eLsobkPuyVY
         hFHTDnF8w/oBNLuTM6FNpEJ1gBDYteqMq0TgRQZ19ejxmLGyq87mTIdCC480eEEmV6Qs
         pgJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793801254; x=1794406054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SaAZs9B+UXOHTaRDcZeWz12aXXxWAqfcjHVOwU/3B4c=;
        b=V/2yO7/8PXKq4q1AGH7aDdPF4i8QsjKybMINSR2frLSUYqM28fCXnFiToYN53l5s8D
         8tbaBd6hOxv8AX7KX4+W+So5xZNDj/5ygsFTJObwqgTQ4uL+/9av/WAGb9ACqdc+f9Je
         r/RjMiELZsrJuXyu8AH6wyxvnymzYZTGRvyQfE+zMkvjxZjOilBijScblgY2QcIoTTTh
         lj7qPijK5+t31Ymwn32wg7nZf6L1GU9bD+s9tm0c8qpwthjLfNeNGxM6xcuKjwBlXVKG
         lQRoiPvv73CYqpsokXpAIsoKVqCY3gopX83+pcFN3tPh/gm3eDlfucTqoDVB+5EAwUJO
         f89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801254; x=1794406054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SaAZs9B+UXOHTaRDcZeWz12aXXxWAqfcjHVOwU/3B4c=;
        b=Wom9lLKyP5vpGBVBsO7RcsUfm0cagwVNuUvHet5nzY2Vw/IgEWO3MurqHPKnKvykch
         Gf3+prMTCb/JXoh2R8ExrJHSkY1eZRgbGuKsI4lL4Rm3lqTMee+LYFStw8/j2sVfTaR8
         vhRtw4keH2f7GnZZ3ck/zFh6C3jgPBax2yXfzaR6uhKm9pmcWjIZC/cQQ8iBuCc76yHw
         eCIjkb5fZYDjNvuNtCgfTcXbAkdsP/8bbPSIw38Mt/qGGlQmJyF58pXUESs9wwWXiy2a
         7PrW47aZS8gicbJiWTDzuqjrCYZ+z1/oG6gPdWyXwHlB1huJQ38buk/3zWEUPIYCFgcP
         Ld+w==
X-Forwarded-Encrypted: i=1; AKwUvBzFRq6axvD2p6w6eTMYOEhICwPiKCLJxtIFfLPD4gHEEc0UvcQIJOctcC+pikSIaEHTdqP0Vgormyt/dzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NVP7GtxrSBXFKKtr35FWhseYEa/daWjyFZXsmP6g3KdyS1ZY/
	g9mcZc5SO20/gfwma/QNVeXc38TWD552aklpPo9aAD8Xdx9gDOMZ5aWBLXFy52AczqCL7hSTNjX
	2OxqBxrMtU3S2nw0tb2IejcoqIHziwog=
X-Gm-Gg: AYBFou3Zy5o1y+MHL9Z2JAapUeDyGA0a/1o25XZjCN2xgypdIkwyqRRGZv0Ngjds376
	z7TEImLfOyNJ53m/TRJ4kNZq6mOSHJ4x5fngwKZTOXQ2+3k+1+uLI/497LBfzOpbqmGqeRMpKRH
	vVknBj5ylF5XzXNmGA0GA4paqzG4XWdEo/yySls1t3pW90yMaGmImiuywQLZ+Rd2z6WFM1WI4Fq
	qFazyFrez/5rNMFlewpjcIGERdikQF4EUQM3rvu9AfLq/XuBv9lc5iNrMdkBOSiXvfUumRi1d/c
	zwJfWPoVpoS3+g92bFJfpFFJnopd/BZ1OK/ZNX92wmlC0dMCmRBZj2fe9n8H3hEyjuKUnnOBrAI
	grPf9JG8t710Kv5Z/kA5LT/7XYi4Y1CET50IjoLjAhGYLMwpx3nab+LWu/bGbEwFuZltQXTECXl
	tDW1Hb2Rl7/yfZH7I8/8UdMLU=
X-Received: by 2002:a05:7022:7e0c:b0:165:be2f:c56e with SMTP id
 a92af1059eb24-1ac5b7dcb2bmr39911852c88.2.1793801253717; Wed, 04 Nov 2026
 06:07:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CADnq5_NCB6ur05ZvP0fe9hsgLHM0=y_Wx31G4vkpKH+F7yZ74g@mail.gmail.com>
 <20261103150057.1227-1-atharvatiwarilinuxdev@gmail.com> <CADnq5_N-sobVK3qitqABjqMv2HMyGNdxX0XMXa4TZzVnMv8MLA@mail.gmail.com>
 <20261104125241.39209-1-ed@charmerstraining.com>
In-Reply-To: <20261104125241.39209-1-ed@charmerstraining.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Nov 2026 09:07:22 -0500
X-Gm-Features: AclHuK_mWOgAzCBAJQN1CbtCJxv3h38jD-baiSMS3zvcmQeJZG5v5X7OZiVyOK0
Message-ID: <CADnq5_N0RFH=n05T_zKSApGB+3o29Nx5rNMOZt5kWzZWxpgsrA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi GPUs
To: Ed Schofield <ed@charmerstraining.com>
Cc: atharvatiwarilinuxdev@gmail.com, dev@deq.rocks, aditya.garg@linux.dev, 
	alexander.deucher@amd.com, kenneth.feng@amd.com, christian.koenig@amd.com, 
	airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 7:52=E2=80=AFAM Ed Schofield <ed@charmerstraining.co=
m> wrote:
>
> Hi Alex, hi Atharva, hi all,
>
> Alex, I'd like to withdraw my September v4 submission. I also don't suppo=
rt
> applying v5 as posted or the simplified patch you attached later in this
> thread. Please remove my Co-developed-by and Signed-off-by tags from both
> versions. I no longer think deferring UCLK is the right approach for the =
iMacs.
>
> I also excluded the MacBookPro16,1 (020f) from v4 deliberately because a =
tester
> found that with deferred UCLK it still hung after login, as it does witho=
ut the
> patch [1], which seems to fit Andr=C3=A9's PPTable diagnosis.
>
> Since then, I've been working with Atharva to get his native-5K iMac supp=
ort
> upstream. His patch initializes the display before the SMU, which has als=
o
> prevented the boot failures without deferring UCLK. On my iMac20,1 (0218)=
, 13
> of 20 warm boots failed with the upstream order; with display first, all =
40
> boots passed [4]. Another tester reported one warm and one cold boot, bot=
h
> successful, on a 0219 [2]. On an iMac20,2 (021a), changing only the
> initialization order improved warm boot success from 11 out of 20 to 100 =
out of
> 100 [3]. His patch only applies to the iMac20,1 and iMac20,2, so it doesn=
't fix
> the 16,1 either.
>
> I don't think the iMacs and the MacBookPro16,1 have the same problem. The
> iMacs fail while amdgpu is loading: the SMU stops responding to
> EnableAllSmuFeatures (message 6), and the probe fails with -62. With the
> display initialized first, the same message succeeds with UCLK included,
> and the iMac boots normally. The 16,1 loads amdgpu without errors and han=
gs
> later, after login, with or without deferred UCLK [1]. So deferring UCLK
> seems to help the iMacs only because it moves the enable after display
> init, and it doesn't help the MacBookPro16,1.
>
> I have prepared a draft patch with Atharva as author and me as co-develop=
er,
> incorporating his review feedback. It combines display-first initializati=
on and
> native 5120x2880 support through two tiled connectors with suspend/resume=
 and
> display power-management changes. The current draft is here:
>
> https://github.com/edschofield/linux-t2-patches/blob/7273823e425200e9f371=
e9272e02ebf9abb6f1c2/7003-amdgpu-add-support-for-5K.patch
>
> This has passed some initial automated testing on my iMac20,1 but I need =
to do
> more testing and get Atharva's final review and sign-off.

There are already patches on the list to support the 5K Macs:
https://lists.freedesktop.org/archives/dri-devel/2026-November/610011.html

Alex

>
> Alex, thanks for following up on the boot issue and checking with the Win=
dows
> team.
>
> Best regards,
> Ed
>
> [1] https://github.com/t2linux/linux-t2-patches/pull/61#issuecomment-5646=
139127
> [2] https://github.com/t2linux/wiki/issues/743#issuecomment-6083265811
> [3] https://github.com/t2linux/wiki/issues/743#issuecomment-6131809640
> [4] https://github.com/t2linux/wiki/issues/743#issuecomment-6163146905
