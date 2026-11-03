Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721965;
	b=ELGlWhbdwtshtSfLpmKz6ml4yyITVBpNY/jd88lxU49vdFxmBLqmFIgMjSHZTdAkCCtz
	 g2267+RKu881KG8ZAr5tpg9WUWJoAAZkm9xbB5wln/Q2QC8AMnrqxsCVnlKmKk64aisvA
	 SSM5zB0ZK4xGBa9tB5bkUDzzdPawQkEjsWaKyRuLm4OdV2UTidz5OTWeXJm5eQ32pNntr
	 6m3vz5RCKDY61TIyRaMTDUz3yDD2P3BrNWQJauhCqOzBUFsTNtm0wiGySrNJHDyNcCYRe
	 KQVUoEfNHSFC2LiJ07pWwVSbCeTXQ+DKtOrx/PQUBGn3fnaA4GjWDuwxr1uXvI04CIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hSehECxM5OmeuNZLHLBGBNwYZB+YaKpkw0khTkFJZnw=;
	b=L5mf92irb5G0DHrvS9emgIkjTSjYxuvhj2I+p55C+dxC8x6MkUHih+b//kzOpPE9b7yo
	 WzScFGxtr2bwvrB9E+lo1EdcNbZ+VbVfHXxfSCufbPzkd5OnMBHOP6SHO/gUtom/ATdjg
	 okY2zx5Gp4JD/ru1aiGTeOHUbReP1PdzYFFcwnJ3FalY9/PjZLx+DNcRpoJ89nDPQjBZ8
	 DRAwadwaNhwr9nXKt5avGLpw9sDxXgd0dHRAwwCvcrhbC6p8VJOOfcGOzni+vnGYqaBi9
	 G90WBkAAxwh6XyS1bYmLG8aW2i+056mjewa4rHR+0s3QBrT4EMltFNw0Mus8gRGyV4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jB6ot0V8;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CDF606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62CDF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jB6ot0V8
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14fc585291cso3460209c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721964; x=1794326764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSehECxM5OmeuNZLHLBGBNwYZB+YaKpkw0khTkFJZnw=;
        b=jB6ot0V8stA9Z77PzXtFcwerR4qPDCNUa5RCM533Y3uc2rwm2WcNuVZAD9b4DMcnyn
         7flcyKdTf9XXT4ChwLdFTNvaHd5ldHlYaoolloUG1BZd3PPSeoCB4yiZtW1vUInkcZx8
         of5CijR3HY/CiDJpos2HDAjOAMnmULzKadjJgdAC7RKVHtPY+HM3ZZryvtHdWNmxy98V
         bIgFsFNUEGy6ETRoAu3vebJMCI/cb0xq97gKWbIGSBpRQVAAPSLt4rHWnj4qz57vu85Z
         /4EaOsNU2OI7wl9u8SXR0GIZak2dajErVGmn5cvn3WYuw2x667PfAdBqu8/K2GmON8hQ
         dSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721964; x=1794326764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSehECxM5OmeuNZLHLBGBNwYZB+YaKpkw0khTkFJZnw=;
        b=lVw8g2gRFuIuSk8weUO3v9ZpGSuaR/aeg1GpZzDLpgZmq7I7qUwy3tRNvjbZ9VaDPg
         45SgsWs4+JP/tV7YQWMQhduxhGcoJ0BjgylNmsqSZMwP7l7YaE5CuJvzZMND9cjnbs8W
         VTBskfDAV1sWjUgp6kdKvxeA2w1IffPkjt5CsuQRaMBEPgTAFK/5xMZ3PFkzL/z+jzUm
         6opY/XS9wOYJBEiGrf07ek2FojPYA6Fg/IaaI73Dkaov25m/JID8muQ7VoiuBFUa/jJ9
         pfhHYhkIY3dMW3w0Iz1d1ByRcm1vc7Ve0tEgYKQgSQmkh+dMt4+D9XzfFs838o1F9zxu
         u5Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzfg3w78nBBv4CUjZ7yDeD5/3wfQ0JF0BJmNt/6S2Uq9ro99jAJiLEyjKJNHlaaBwjdm2NqoxTic+2I37g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zrojif5mrFJgzBExW5N9ITME69NKaq/Oi121wv7nnWirBrcIz
	cmbM14l4l0kk8/Y8CUtwCgiBL2pt/EfKhCPwS0qET2IGuqNAHWhuNtw=
X-Gm-Gg: AYBFou3gDaJTuuRYMRMgxf7AGPX+5zQMeT837tDE04aomt8+EC9LN06bLgmWhfTQrsK
	lzkLIznM0IcbjcLZQ7UudMsWQdTumkGaKoyYIRqg0E5eCPDshBKV38VF8Xr+KIoWOVKGjqZ448H
	35ZFgQi2ANf/gzmGi4eGBYL6sjvdLvH69mFiviR8cXXEJzOGkR2NU57GuisZVXNze6Fs6TGMcWT
	XNmOJhjAstWz5Lzut+iHahrMhbYLYfHyhbk9WmY+rl8m3sH1tOze6biKMcDs8y02IBSmm7vNzyT
	omrOw38ANzKRbp3TZ+9JTFClm4UeAC1cKCLxCCIOEl/TLaDfUTRvCbhzYu1qiN2X0yiheQPx7Bb
	DK/vKZ8t1Sl6antcBGyRB2i4YYevFVE7EQvuX0jLLU+BScMxDycDNKSnbJiCMVkVoXg/pUDD6w2
	b9sjHRDYyqJ8gf7tmdsKj4DiKYxRaR6FBUQu7FxcpOuwrrKdh+C/8ScIZnqAl3WhDSEMRm9O4aR
	KArYvmq9xL4zPfT2Pg9wglQfQWzQbWjlwUcAwJt3cguvtN9dJ8+Ahc8RVC5uTUfffjf7mvGPYSt
	r+lT2X1/DBCvekUejpypyoQ+nzP6eMcgASJMU2KmXaaWIx5JWTuFYT+u5sSwug==
X-Received: by 2002:a05:7022:f20b:b0:136:c443:80e5 with SMTP id a92af1059eb24-1ac56d94b0amr21085882c88.6.1793721963966;
        Tue, 03 Nov 2026 08:06:03 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.19.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm47910609c88.12.2026.11.03.08.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:06:03 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: alexdeucher@gmail.com
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	christian.koenig@amd.com,
	dev@deq.rocks,
	dri-devel@lists.freedesktop.org,
	ed@aicharmers.com,
	kenneth.feng@amd.com,
	linux-kernel@vger.kernel.org,
	simona@ffwll.ch
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi GPUs
Date: Tue,  3 Nov 2026 11:05:53 -0500
Message-ID: <20261103160553.1431-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADnq5_NDJ7V=TQLOJ37msbmhwsVG+70mPKU3ns+xmAu9jxWwcg@mail.gmail.com>
References: <CADnq5_NDJ7V=TQLOJ37msbmhwsVG+70mPKU3ns+xmAu9jxWwcg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I forgot to remove the pptable check.  Can you try a simplified
> version of the patch?  I think all you need to do is delay the UCLK
> DPM enablement until late_init.  Something like the attached patch.
> 
> Alex

Also, i've tested this patch with the 5K patch, the UCLK then just never
gets initialized, so this patch is literally incompatible with 5K.

And also if ur wondering, what patch am i talking about you can see it here:
https://github.com/t2linux/linux-t2-patches/blob/main/7003-amdgpu-add-support-for-5K.patch

I still need to make combine patch (otherwise bad tearing in gnome/mutter), and i need to
enable 5K in EFI aswell to remove the shitty quirk to initialize display eariler than smu,
And make it usable with simpledrm.
