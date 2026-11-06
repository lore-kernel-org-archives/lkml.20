Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793931426;
	b=uJrdHousJQmSlOIhbnnlP+fxK1ISIUM+2Vroy5t+tupZySL9japj2KgadwPnW6AFGUYR
	 8zmVqSYX2x4enzuMwFRlslwYE889xVVFqW5G5qD9FwkLqH1QRwJy3MC5X27cEtPYhxUMT
	 lr9WrV8yMvPY6Sj0R1/oFE1eyTQcFbjt82FyLa5ritAr+S0IpYDUjcojSsp/RaTwiFT9R
	 P+SsdaT6HRY6VOqYhd+TP/GsDUCMDEI7P7lbE5JxZZ0AoF8LDw702cbJIFKs3yDnSIFFM
	 dZMQ/vrORuW25AthXcVrJooQZEyt9vePQR7rOgSNM0TxFbCwLrp33neTFhVwCgD9CbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793931426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
	b=bXg2op0gQICqqTfu8XA0DcKdXNHZ25at9MRikdZlYvU0KUJUimhw75gsVy5XZcNOneia
	 7q1kExvECFGouOaYisVxTxfiAzq2L1n5aLdndiW4oQckNHqvA34skQDELtzXw+Ahb8r4M
	 Xu+uv828ZNz+OdZkCkMzyJVagBcqqZHrsFsjLYE91Fufukx1kXvLmFVTM8DlfGICfUZER
	 4w6UW/0G3fgBJ8Hk8TfyZZvILaq7jNv9xwx65UuhI40eOm0PO1RrO7Z5i68fsDQWaWSZd
	 zE48H6EqDRvzdANSAOl5O1XpqIZc+HKyBZQixPIJIBYKSCDy7fCUys7Va155w+OP5Yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y52n66Gq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689A6606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 689A6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y52n66Gq
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bb7ad903d0so14966e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793931424; cv=none;
        d=google.com; s=arc-20260327;
        b=feUZG6EdJeEOPDRs1sZGnb8+zfwjaeKUJbUhScAcgn3zreSqQnhl+fqqCrV07uNzGh
         fT12Uc7BwT+D1xb1IpcvOlHlzMpGK/7rD2V15l06+RYMD/xQ996IlD/rORM9ZSWprxE3
         26mWyrShsvMobF6hR7FQIws4q1SNA8QBQ7kPy0o9PUnFBMcLvMAaBvIX3l77y3Vpesq3
         Dsq18NwVJ6K7CYwyPUK8OmWFX+WiFRV15a8GIfEeM+0m4RTps4fBSGSkDuFaLz9fVU7P
         PEYwmbuVFGiATqlmOcNGE43KlVTY4LhFxBaNMdp2DgiYHJ4BQWU0i7p08RCwsmeViFbj
         WFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
        fh=TpfifYkO+KE/qOdLJm3oHvGrFSp18yYffGx8Xv7u6pw=;
        b=dPhY+8GKIzVYcvbSAeeWOjmpn92pf989q0gHp8OrYA33dKMqpgBs/HLnwOkYuTZkEK
         2XMtGCqBb96bEjEE31mqm6WVNfqTmY42F5ZkFgb0kT5VBT2S7wfI+FlPTVEV9Wyg5FUJ
         raYQ4++aW7xHH4aNHMqzwy53mPiuVuHnD/Nlz5/zm+cyRuIlG7SCvNj1kZx1KCsjnyF2
         IkOZI7Qya9pp4UwbWJ5XZMcTIXzOjNmmocEE2pbgqI6KrKqAgRCTqDoCyGpWV9C6gLWm
         uqJQPB+FmV3VmGQx4u4m143lIfY07SyOwRrP0s3dR/k/h5QNjg4vTQEdKrxr58OTcciq
         CLJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793931424; x=1794536224; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
        b=y52n66GqCM/IpK42JIjgWKkg1QPRKupRbssLQS0bhlgBZPtlxR22WdDf7Cb/WZZ2zK
         OktRlBKYgEki+dEGCjO/1Rt67NRgA6dCn9IgpQnLV+k6riwYgBIpCuapbjHivFbuK6mQ
         7wefPUZC9lsirgeFG+bcDsbL24fhbF32OWD/NhUQWa4n+YbFXmYFs8ewO3ZHNNIX3n9X
         uv4zP0PHryB+Va0vIB2fCvxKuwmRCvP0Yfk9F4XobOGmUqz64LD0k8z/GS6h+DNe1srA
         cGLsJtRNk6Uwy+gm3Xip0zxkFTErj3hrIIGYvXO3GPF8ulUbF4V5lewAPsU4LLU3UQh2
         N6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793931424; x=1794536224;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
        b=0YH7VPhNHKd2JdiRlm9I9WQ4Dq/8NPrZpGJVG9ZgpJq9qUQPhSOJcNHwtYhf7yKpNl
         3jjlMvRAw9sfwpFmfmclleQmcqkR7bdQ9WebK3vnUkBhDIpL5BctrXfJjKTSnJKsopWL
         gd5zvji8FkcYPDkNlgyKWBLur5rMZ/+fj4W0+VtUDB7Vox+LOpjMqC1tIndNT4UZ0TOW
         e4LvU6AIwJs+lILMv9FySCdHrf+ZcjRqbnsSfSqVoBPfhatd+Udg4cMPkwiqt67GbBk5
         WIdpdRBBoUaC7H+l0Rj94w9QgHNBKHavt+JCMFZT4Ysem//PaL1a4SF17zEyzRY4gTqd
         6yig==
X-Forwarded-Encrypted: i=1; AKwUvBwc8KUZsVugSCrt4vyvGlQFY+UYjLGXM4l2sw6mnaZWhErZ2UbezOIbTFTCF+YFbRz2J6rPXh+gugz/YwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CX6FK7dRD3/c5p/BG+iuUV9jb+ZBgn8gjx51VhRZj/Zs9V/F0
	ZVrJKf30e4JzsfbNLz7PTieAAL3P1XoslAj5wYGe6i6R7/61x8x/MvbNIbBIVkXnP/TGAr0zU19
	Bacsgb+A8gc2EecFRJ4cMd1BDuuZjOWPICti8thA=
X-Gm-Gg: AYBFou27A3sApj5BbosWQRlnaeACydm9AV3AkG1vDKbIVJq19WYIzhnXV/KPLDwC5OT
	deX7WAOgVkUnl63X6FITpD+FkKMoKOsbnk0tsTWbYM424kiUwTA5BbgbMUtY1Bzse8POEL9R9QG
	3uuNhTg6TJaLA2y1h1sV7hvv3Om9eifVMb0SbmKBTb5m6nT/SPx34AnRy3GWSsQPdcCPzIFXkp7
	meEq3PGEvl6qiIT7ZBk4e21HbKGnq++zKcuRmp3nE3VQSa3Srk7Lt5XMpY//rU/ZN1yLRpx7Tev
	HI95gRNvyFrZBIzm4MAJlRk6C5czXTpE45hDBgOpTsf1CtmszpoGUjixVOki3yIF84TPJv1xtl1
	Hochg81QZ74epi3gCzQCkh6AqTWPYJtsSEEaGvRS6xkcKF2d2OfrwwNY3KpMOs8AkHJCMrGJAVE
	NJrAIWQlP5YGkFLsgrOA==
X-Received: by 2002:a05:6512:2524:b0:5bf:d9b4:2481 with SMTP id
 2adb3069b0e04-5c003c16440mr312893e87.6.1793931424363; Thu, 05 Nov 2026
 18:17:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com> <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 6 Nov 2026 10:16:53 +0800
X-Gm-Features: AclHuK-dqaISPAtfDlMGbnSeryvn5bwnJRHt-qebg7Qbj88Q7XOH_5ONWOiQpyg
Message-ID: <CAKspUhKv_6BLHVH_5oBsM8UhvCGHEsukRDmMozZEebHZtoJmcg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: dts: sophgo: make sg2002-milkv-duo256m-eth
 overlay generic
To: Hiago De Franco <hfranco@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tested on a Milk-V Duo 256M with the USB & Ethernet IO board, on top of
v7.4-rc1. The composed sg2002-milkv-duo256m-eth.dtb is byte-identical
before and after this patch. Booting it, eth0 links at 100Mbps/Full and
pings the PC over a direct link, 5/5.

Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M
