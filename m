Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712363;
	b=DVKg/2/GK4a46LxpUiPslsJn6aNZXTF8QbIIf6ElMIRY7/DpPH+r4KONib43B4cmA5FP
	 T1yi+Um66Vjpiq/3wehE5iEmv2NTHpkoL0oQ4VFhZWEumwwUy6P3FPZ600ybSe1fQg+Ju
	 L8BK1lqITKljPJNCygMyMDf16FiAuvFCbuan+CVe8y0xtv0tbmUcEwhOfp8B6F5FYTxRD
	 H1Om1v55ckyagj9By03PHT4USwpM4wv0xX1dP9KylrsXvkHVqKTl18pZlfXVYVHwCgUNn
	 IBWXcztK5o/wQCd23p7EXp4uvJFZ195OhBj4sxD7ZNR/DbOJYWGPpuQKpe1SyPCAUMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iyxcrfJd2R6utTsQVGbm2c3rEERhlQ+yqDUDF6loNwA=;
	b=HymlHj48Dq3IPrEr5OGCHSJG+IjdvR62KxRSdP2NSySbMA3NndTNtIjOQ8fY2kh9w336
	 72XelQhi6oBPdTOLxPKr3hlxRtkfi8VzOZmnatTk23SWdD+3qk4FIIjrzS2KbVTS20Pk6
	 rbngGOJxsLqyYXUAef6en4o1Uix9AwWYdPpTCto3w+VqeBO/7YvhxBSg95eZpSNoTAvmx
	 x/VqkS+dg1Bg883TbJSbhjfmQwIylhiKbEKKLvcTabd/P2BNNscmlvd3NZDyNBjzoud1M
	 3bQXcLmVydkm4K4/Je7Y54sltkkyZza7aMpGdogV+OuPxPUbALMRtXgmiWwPvC73zOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7VkuIbj;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB7F606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB7F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7VkuIbj
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so43765185e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712361; x=1794317161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyxcrfJd2R6utTsQVGbm2c3rEERhlQ+yqDUDF6loNwA=;
        b=R7VkuIbjFzlOrnPSNxpJE2G2yXkwSEIR7kaAD95jDwLmTnu9WhLHaf/BiAaLV+lcc2
         lyjTVdUr2jPPEnWGol7yqT//AwaacuZLAXKVAHrWbGyL2tT1GSqyC9359QOh2Dg5II65
         lkvy2o2QoEpALrBrnnYdy5wfVJTYY+GEI/1ryrUerThfxGmM+xwsSSLWzWHnhwBIYXOD
         Z622L2yYMFm9oatgvg5OrRvM419Lf/PsQT92FRqJiqh8702bYk+45MGmqiAxPl0z+6hc
         bvAzDvsD8HiA0hJORkLqkRNDp5hGmBIwRKS1l1+cwuIvXTjFR5W8gk+KM4vgwZrRxKi+
         Fo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712361; x=1794317161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iyxcrfJd2R6utTsQVGbm2c3rEERhlQ+yqDUDF6loNwA=;
        b=UZzv6XBDyQF/zVqy62n0xAK3OsyVGXyof3Un4AGIdTxToxltrQ6IR5Z5vcYVR04C4b
         rvD946tguY4Ek8mwupJAmIBE1FPU1ZvF2IpfecFKYOXrVX5WSs+AeeEcErRUoMbdiZAE
         5Ps+mE3QwbojV2f9oecMSEaubuqe383oS+oYUv1Cws1org7W9jPo9MPeCXpKylM8ZMZa
         WsmvXI/oSnusIhWVPhHAYaNRNG6+6pLpyzlYGGnbzcxsIt0iNg+VhYs+wbxuv4tpoefe
         a4FsLn5OQfsC48TLEs3oP/vZatnc/YndtzMYGy6vibtONSRdS9NLZJ0v7VgdttE9Ryi9
         CW1Q==
X-Forwarded-Encrypted: i=1; AKwUvBytkrUOO1Y2NDijcU6o2/pPr/PtvppeJkRXebkR59LSGmLiEeunBkRQpov7qZPCSLwdAuzeglZmjWJlBkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UGq6cAyfuAXzM7vP1zze9MCEaF1SIVtLaGVBuSVtFt3dRNRU9
	EOsXSHQPASj42VCDrZCCi2+NNFi0+B2zBIvXnHBwdXqZGeZh26GJ0+WM
X-Gm-Gg: AYBFou1N2ot6OFpTQC4G7LZhQVKiDLj6pUysMvK8GcNCaXgwglYEsHdn1eDfAquCQli
	KdnfPHgBgnuahXykDxuZkMLryB15x+7Y7E/tatSnuLefjV2NleOArFlphmGxbQIIiMayqzDKG+5
	iyzStJUtVypChRrAowt6Eq1ceFSullGZ5KUIrs8gpLnwr7BqH9JyA/yIVcfQlmyPVzw2aqgSQfY
	ZH0q+snAtqTs2YMqYe2pO5FrWp81JLerD7QtVEmafpHlvGCiYFfWtwzFTDSSuzrxIgCJsDErQAF
	eDhK5wCD8Efsr3BVvVvJvSKmdbO/UttowXNXhyOmsiBmsSI5ELng4/7QyV9NtE0VggfEE1TquhK
	YlhWG1EgdFaH/EaH2J/Yo1uRCEPCZnqZRwtllVHuiRKkRfafsSKgu+Q5dKc/kruM0olrwTUtDel
	LpgW1ONAn2mztBQdOwQU9f2zlX0YXu9CWFhhKgysb5kbw2z/Z+e0ng9lJwz58KJHRhJ/k3QVmFD
	9Y9VZOYagwxnWTp/d1gSdOix+Ewrk8BLEGnoHwduG98+SHwMUyRMyZ6ExlfL7DVR6oRDJm0QHfz
	fza4OzN1vPzHOj7T3oM/zdp0GmImqrT43ii1WPnWIBkfCj+wfwfl5vwZFkuxf8MoaETgKzJHxdC
	VDvg=
X-Received: by 2002:a05:600c:46d2:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4ac187a6a38mr302145995e9.19.1793712361435;
        Tue, 03 Nov 2026 05:26:01 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:00 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 1/5] ASoC: rockchip_i2s: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:33 +0100
Message-ID: <20261103132537.3717496-2-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
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

rockchip_i2s calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_i2s.c:(.text+0x418): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_I2S unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_I2S=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 4495c89fcf26 ("ASoC: add driver for Rockchip RK3xxx I2S controller")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index 391ce2225fde..d7ec1fbe17a5 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -5,6 +5,7 @@ menu "Rockchip"
 
 config SND_SOC_ROCKCHIP_I2S
 	tristate "Rockchip I2S Device Driver"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for I2S driver for
-- 
2.43.0

