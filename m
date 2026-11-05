Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871287;
	b=VrpnlRgaJb0C06WKeXPi9g12Z6DzjERm29ud9FLNLHiaNGTs3+IU1Vh+HMdlM9RhUV67
	 kczSp3nwoP56uaoJkLRp2u5z/FzPoDSqVdujCVJ6nr15DLmsRQ3LJ7wv8XqyTyri/VJ9Q
	 xagCe7NIKe5Ym2gHsttTduVx1fHf3/xFACPHbIGsgtzz3nj1NRmBsD06pescfNRLKG9of
	 NchJOA1CroSmOlnL7Zsl1n0wKd5YSf55eVS8in1ekxBZbCmXiXxoKIh1vpFwA4Ha4t2dl
	 1Vjty1TpdryMNLyjZBgglCmxRTLk25Cd3+KOlhM3RES6d1yzzx3LcyN6CpG4Ai7tg8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871287;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DpLYJIWgXoS5zQrloj/RgE/cGCpS34NjW3pzuN6S6xY=;
	b=I4tnEA7wIivnwTurp7RulOsgdaTjUgtpg/6PumSfWXvkm7W5kiM1+XgeC6uki/fumKvm
	 pFFD0I+dfZWe/gbzxFJc+JyIGptH0GUL8BJZQ8W0NIW1yuIZKSsjTHLpAUZWGP+aAGChQ
	 3Cfwlxh6OJnf2ZGuEu4Dp9aqzQKFvcDm9U/urWYFQHfbsYYjJ9FzwdqlLSCCZPm2Z7eUh
	 sy/fC+HdRd9KNW9H5P0HH+s+zt5rw8KpF7lbKxRxiWfZs9p3jvW6/VmD+8a9UZOK04c1o
	 u4KvYtJmsXIR96GS3cb0woMn8K0aDx6FsiMabbPiM8cHwj97FmJIcFUE0r33/7N73YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967DD606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967DD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-99806b7d89aso451660241.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:34:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871286; x=1794476086;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DpLYJIWgXoS5zQrloj/RgE/cGCpS34NjW3pzuN6S6xY=;
        b=nZ6jjSBRu67VfQZbjYXMKT10uchnTCeMVX0p9ErGc5XP2qOTFw2vtzqNVmNEIf104q
         l00bYywKaoIfj1Y3q8BiFDLc4b8jfqcipDZA6XWYdz2Bg/M6GAKa1fXRKa4itWAhehP4
         h/U2YGzkMFqSNxSSPRIog+zJm5yU7umcxg1affb2kLGi3mEuDsgt7WFBlGm9e5o9jSWs
         M6Y63o67LOpWC8sfKdh6hiY8tZuG7ABcmGkQGIFQQEO3nzYhpjEGf52subOmAlaCMRKC
         6AAGPc/W5b9yTLkXZ93uIae8u4yYxCIFQ+43pOhIbZ188GK/a0xltUuRiUrTdAX6SITa
         NHYA==
X-Forwarded-Encrypted: i=1; AKwUvBwYdvUmtgbZGZQYAz45tu0H6cJhMpcMNI7UWk9gszbTQV58PFqMuPMfQOAmlzLtt0z03jjJXkn6iYQkOyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5bE+uTmQ/yGTN7VCetpCVNLsLh721W0Syr0ElqCLulNnNUSJu
	zQpNg+hkcFbrg6JRouii/aPc1GCDJGQlG5Z7alW6ej21TgvAgAciRnev5j8pp4Q8gJI=
X-Gm-Gg: AYBFou2zZBe8E5yPSML3cUrbcLvqQTXVS3mQTQYoShyZkBhobrb2TseREl1zEXOtXyA
	DughAQTwC7KikfpiLoybnXHS2GeBQbcgFAbpeP13Bfo3Kr3vUEwAGTw1fSJJR1u5KhngyXXH2hr
	WEjqfFbGPc78SCWiaO+CidZrkiD3kIzmuBLOVOqoeMUMcmPwjkPhyagruCeCA5Mzt2AHQUJjinT
	nGskGuHXWr3DOaJ50bpcc6JHaX0wneso7F/HdBfxTtuY7s1Nk5bOxnBFJaznfg9Amd4ejXNT106
	F4j+mDE9OuE34Zh2In1g3JcbG3VdDkjynlcxwHlg8Fbr3yH+c0UmWhqd3RbQmqaS/Y4iFvtIaVU
	1NR6/fmmAIz3LT6ja2Z1DZ/7UD/TEnopH+D1Y789FXeqULjU7zNRwYm5WcLRTXjPU3hipoi3JsA
	gQmbk9BdbExlr6NImw34UDQP6BMZKN1vhrmA5vtbiVo/KrrA8zo0iZ11tjTDdC2CIsa3IgAd0A+
	6eqiGkNBDC/B9i63QnNRWnu+bCkcV65XMoRGlCwaUVLXT2GAGpgbi8maYK9KSxNshYr4eAlmYxF
	7SfWHQU6arBXt/kajdnE1n3OUNppAeVPb67uyQNESYgktuyjvx1Ypwgf5Jy7knezng==
X-Received: by 2002:a05:6102:3e83:b0:7b3:5b2f:7030 with SMTP id ada2fe7eead31-7d286744c22mr1074511137.4.1793871286605;
        Thu, 05 Nov 2026 01:34:46 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecb6d79d9fsm1216131e0c.7.2026.11.05.01.34.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:34:44 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-78fb1fb9508so345512137.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:34:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxjkXXtt0r/40QWV3mGRKIhqgY8JEL/W76JPRcJZD6SX031xwt19iZrRO49EAldPYyEaZT1DCOiRBwePyw=@vger.kernel.org
X-Received: by 2002:a05:6102:3709:b0:7ca:5626:11e with SMTP id
 ada2fe7eead31-7d286b7fa17mr1126485137.36.1793871283167; Thu, 05 Nov 2026
 01:34:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105044046.52180-1-dennylin0707@gmail.com>
In-Reply-To: <20261105044046.52180-1-dennylin0707@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:34:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWzY9YRnGz1Y_60RYP7TH67q8fxi1VNWwkhhc0EUeSCFw@mail.gmail.com>
X-Gm-Features: AclHuK8PYnqOIDpZItZg042mTleQ6jUe2E1wddINt5GGmEiia8n8vhGDZzRowiM
Message-ID: <CAMuHMdWzY9YRnGz1Y_60RYP7TH67q8fxi1VNWwkhhc0EUeSCFw@mail.gmail.com>
Subject: Re: [PATCH] omfs: remove the filesystem
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: me@bobcopeland.com, willy@infradead.org, brauner@kernel.org, 
	viro@zeniv.linux.org.uk, jack@suse.cz, akpm@linux-foundation.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, tsbogend@alpha.franken.de, 
	maddy@linux.ibm.com, linux-karma-devel@lists.sourceforge.net, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 05:41, Hungyu Lin <dennylin0707@gmail.com> wrote:
> OMFS supports the on-disk format used by the long-discontinued Rio Karma
> music player and ReplayTV DVR. While reviewing a fix for incorrect block
> mapping on writes starting beyond EOF, Matthew suggested removing the
> filesystem instead of continuing to maintain it.
>
> Existing OMFS media can still be accessed using an older kernel with OMFS
> support.
>
> Remove the driver, its documentation and build configuration, the
> defconfig entries, and its name from the statmount selftest's filesystem
> list.
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

>  arch/m68k/configs/amiga_defconfig             |   1 -
>  arch/m68k/configs/apollo_defconfig            |   1 -
>  arch/m68k/configs/atari_defconfig             |   1 -
>  arch/m68k/configs/bvme6000_defconfig          |   1 -
>  arch/m68k/configs/hp300_defconfig             |   1 -
>  arch/m68k/configs/mac_defconfig               |   1 -
>  arch/m68k/configs/multi_defconfig             |   1 -
>  arch/m68k/configs/mvme147_defconfig           |   1 -
>  arch/m68k/configs/mvme16x_defconfig           |   1 -
>  arch/m68k/configs/q40_defconfig               |   1 -
>  arch/m68k/configs/sun3_defconfig              |   1 -
>  arch/m68k/configs/sun3x_defconfig             |   1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
