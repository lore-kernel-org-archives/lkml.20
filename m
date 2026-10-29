Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260648;
	b=p31ucrjkNOQdJBiCcLowFM1FphxBo6ZrqoZ876GE4JlWbTNPO3yJWxKd4HcDK4z2eUuP
	 8bp3zmmuUTmC6NGDhSMAqiMmmc7vXtYa31jRJfDqzSCuS7dhg/hrpZOeclYnyy7WR+uFx
	 3PsUsdjrFQoJqn1kQSGTpQy+j0F2ZDB5Xs06wNVx1QKdrTl1iYVrkKIjWpxUZdzW/ttPo
	 rVmMYNDhW324iXTMouEU4u/zM0lnUIGuK/vka+BL8h/UhGP19DZhd/Tc7d7zL9nBx1swb
	 mpFAJq2YtQrnHCJIrxPOJSYRVf1cwEq/BVfKgitzHlB7a/jjfnjer7ivM3osY/izDJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260648;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=bnlmMEizUAgCV8+p+ZXesD4AYJNLVCQuj4kNgrtTkYc=;
	b=RMq50rTN+zdBg23mBwmtzzPy3vKEJNiWfZ+KwtIG51j8dFkWNVX642Uei5bCSRIxOUM/
	 hooNIqkogNQIT273ufDJfqBgFIbmYYviZ9UtawXMcRLbpgUbLw8qX0eVxtsr+LnwG+9gj
	 JS6sDxav2GSmsmv3J5HgsGTHMvUteeBgbUoa+nPmCS/KppE24EtXQ9Lw5Ah3ydURYKZEs
	 mFZ42avzNubySpAJ1Og8ETfqocB2/vPlhQOcxOWjozJnmgHm//qWnnIFtenZLjysTK+yA
	 OWPhvotqxRFf/pBsgzLuTuyfmUA/CdLqGlrgOffQcXO5iflcyUc+ISQgCbgeNoRg1Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C48606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C48606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-98ff53fb739so1067508241.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260647; x=1793865447;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bnlmMEizUAgCV8+p+ZXesD4AYJNLVCQuj4kNgrtTkYc=;
        b=VswGdS+evjArKWWffIw6vHjEtEOZj/4mVDBzBYj5LJtcakXzJ65lXavi3h56vg7R8A
         k9AJ6YmP47Xzvt0DQ2Qu/bad54DeM89jlzM6zC/PiciqOm2Ke9vB8ufBSKmXs04BkRMh
         7RaGSw9P5lNyy2XdxiEg7EJ0a7U4TeJQdekYBYT4CSiOsQ7Zacpj1e60LngNp/1Xz1QF
         8+CrCw1bgLQkeiCZWBFgCOZgXkadsR52oyp2X/ReWtXE73w0fLZUMkQ2nUyg1b5MleeX
         D2M6EHq6R4bfPJAhKhKxhhKCTKOmF5kI7IbFIClduliesvHCuHPjh4Iy0NevpslJ+Str
         E8cw==
X-Forwarded-Encrypted: i=1; AKwUvBx+dHMHXOyUDgbLz22xyRe6TFv6lHM0L7Mgr7oDTZfJXe/eRDGbm4lcvGqoSds2gxg2015d9RMk8vlRCqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXAgegcfMRJZ1i11wJ37Cewnu8NMEt5t+81HqNdhQTECJMvafh
	UF4R4pKu2Mm+bcrF9FxzoQuxT3y1350TbUGZmArBYxwnOyxuBkwnjswAMkWiNMpn
X-Gm-Gg: AYBFou3SIyDL0Zi1yOhS31YowpKs9161z1IuMX1qGJxw2VRuUvkKmQKFqG0aqLxksq0
	0JVZTcs4AaAVQwgyTwDNmSuO91SGrd22/xdJFjrZkLN6hLx887wEcGLhbhucjyYDFxvUE4oGmWE
	2gkU+Ua/msy6PJWGqSn8px7vuKS/x6+HXZGyoOCoKMpCxqJ2byYwGIhFMdm/69mwtwhNNoJFL4U
	azBF311DkYg7FT2teiYt4b3EQCJrmGzTGN1PJF9/ebaG7feAbGIYiM+jLQoiZVPHIqxAWAmTBhg
	AbAZ+kqaLoWfJU1mbFR7sFdoo1uCiZ+fngiXoBTc9xoij0f/3+DskMVGURK5ZnYN5PUUeMbDu8S
	VLuRa4xJ6urY7JqmbWsX8v+ift29ukfQQViWQXpBuS0BxIyIjQbbiYPy48kqQnSsTB+FGRiRwpt
	gol7rMTqvcNbRRZQH/O1W/+Y6zo1XGCHk4zrYRSGEj0R01WdeFNNazypn4O+CrIDU5+9t7df56w
	Tmzz8CeaUPtenybmnDFNvV882f5G/IWVTUOzKcOu8jK44ONJdue3C/3zp+epE+ibWAlcWd0wCZP
	8yPc+17p6xy8x9npkqu9i2eu7qIFC8qRAXiRw4CpdBwEyit5MSiBMhUJynx4nQTV6ro=
X-Received: by 2002:a05:6102:578e:b0:7cc:25bc:3b30 with SMTP id ada2fe7eead31-7d03a56430amr2221830137.21.1793260647361;
        Thu, 29 Oct 2026 00:57:27 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9913af7aa6esm2470831241.4.2026.10.29.00.57.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 00:57:26 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7c3b6e8225dso1232107137.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:57:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx4dPbbnOF4HgNBM+mOm6ZbKHCUq8TQOaKLqGOQjXRZvQqUNOTcQtrEs/IZ72uC9TAo9mFeMyWB4r50hpw=@vger.kernel.org
X-Received: by 2002:a05:6102:448d:b0:7cc:1967:5e3a with SMTP id
 ada2fe7eead31-7d03a5e4ca7mr2571146137.32.1793260646444; Thu, 29 Oct 2026
 00:57:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
In-Reply-To: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Oct 2026 08:57:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhBeqmMt-VXbh2u6AvzyQ6NsZAzATNRZCnm2DHUAFUFw@mail.gmail.com>
X-Gm-Features: AclHuK-fwV0Ywnec5fo7ksIRhkmYl2FqOpWfbqGPc6rEoPI6YKH1NmsrsMsnUlA
Message-ID: <CAMuHMdWhBeqmMt-VXbh2u6AvzyQ6NsZAzATNRZCnm2DHUAFUFw@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: constify struct configfs_attribute
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

Thanks for your patch!

On Wed, 21 Oct 2026 at 14:31, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-aggregator const
> and use the new st_attrs_const field of struct config_item_type.

This has a hard dependency on commit f7528cd38b87fb59 ("configfs:
Allow the registration of const struct configfs_attribute"), which is
not yet in gpio/for-next, thus  breaking your build.

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Since you have to rebase anyway ;-)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
