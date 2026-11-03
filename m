Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712364;
	b=HvJKm9vhCacVZ4/avSZrv9xGk0kNGq3OzeL0yWJDcdkJfH7NwmkwMZpbjLHaSLw0GtrD
	 +T+lQysHqXNfgwR+Sy0lCB79egv3dSsUZ3zar5naba9XOuQBI6Ay7eIEe0MjDcDNULYV6
	 nWv+ZbGGnbMv/OebhNpIp7Gv/d2qysGgsRHC+n6r9A0tpHGdO+35pd+wcEXWboxqikbu4
	 kIGS3HRnRMSAXOSawCJF4FIMPVRnwILa9YWMDDWjp+B3WeZyA+M6Hopq/cVuPIRyiqWQX
	 qjQaQmvcTV0otPOyZfg2OJraYUxU39XkRB2QMbD1/YgOL+KVsN9OPZoavlt6u4d1vIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v78bi34KShnhZM38ptpqSX0i8uHNTah9nPD3iSNdSPE=;
	b=miC2EzLwIG/Shx53/TjaBECFCtxJJk4vIAGn7Zdk6gFFPl1GPljEVwDmzXCkY2cLQ6ye
	 MAQZr4wLjbioXDrxbxbqivIP+emVITNIcsMs3ugShpivxzTQp4e54biwtL9AMO54L3f97
	 OVcFzeHJAZrzVphR3Jz7VG+XljYM8hN0+zAzvhQeSLPVyc9QHngA+tluFv1Gfm7XqrDD+
	 S0z06kuh75tlWQsINJyS/bb7wCsVpDUdm/LxhZcQH6xFYByH0UJiWTBZQKD2xh5er4kF8
	 iWVBQ13VK0Dia/pTCP54K5EiTCHa8TyUwylMDgK3CVrvkJFytIl2yRnZ5aQKwLceJcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TV8ddeBn;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917E7606D803
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 917E7606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TV8ddeBn
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so4330685e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712363; x=1794317163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v78bi34KShnhZM38ptpqSX0i8uHNTah9nPD3iSNdSPE=;
        b=TV8ddeBnRKImlaxB2pGKNLHUaBOH32ONQxYZ1DMJdgrMGyNhGzASpabQ1CDZSwEn/a
         +iM3wFl4I+lzhN6TA9YQNEbUsXGcaHg7dsZXW+Isz6Hz8tkZbU2Ib/UExTGbmycM0QZD
         8GeOsYKX7nDrGUkjw5jcpGiBH974Bxu4dJIwxd6bzOUDNJp3suH0E2bFvPNpHWRvKjeF
         xeqFQAu56XZkxVGoMNwj74a4uC67+rPTvooOH55xLE9TS6lVLO4UNBJzAdkKOlyNspW3
         Y0JYKN20q4zxkiyA7hHF4CarXq0ktUDgTA98f5XuSjddwLkp3JHoCroUMHD4lgefzl1z
         esHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712363; x=1794317163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v78bi34KShnhZM38ptpqSX0i8uHNTah9nPD3iSNdSPE=;
        b=NfJlnoq3JdzXSEwa2XJxRw5Xc3yxWZoNspl9H43c+su68kB1EgZSPcdMqvD9tD/693
         srWEchB3kkBjXGF1GQNSE+L+Rg5KDm6o1Galk9QOfD7nOZUjHQ9LP0Sebf9Y+rnYc1SY
         MbPf2a4sdYkREeB+g0DZwDQ+O7i1YbvTIuot7tURP1eVdkQyB+69GVYw6HHNXGfTbSVq
         HCu/7lgqf4mosNzXTE2WKjheaZyRIQ4597CIQN7/f/LUW5I9mZlvpbNUeRL5FXeWRNad
         jjoh6s93F1iB3d5rAAROBTQvkv6ezthdYHzAPJaHOrSsni/mHMbSKpi7e8nFlD4tB0nL
         cV1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzEgnknRy+fZqf0c+dhTLXW/7725kFDY/NqWBymKBcjXVTZo5t5ce6F7zYn0PFJp/c9DUr46WtcvXsucqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tKHfONh6wmdPSDbcsUvgb3VpoXDkmW+h+cdcztSuHcTgnYT8L
	2YYjmysr74ruQqrqX5g9FBMJ+65ra+g2GFvxrNrublbQ2t8q9JQDX2lG
X-Gm-Gg: AYBFou0/Kla5MCAtweKscKG+UfVEBVqm4AaCgnqEiuB8yWtFHgf4osprV7EWjRPcovm
	dvKwo1H7uF/bc/yOWulpMG0LWb+Y7rd4byiIhmCTuucCmPcQx26AOvz5QzwiiUaAWZ9JqKwVEak
	kSiCvqXKHzO9hYCHu4wXuIq8nYc/95DDcplsHdqC1koPt5GZKJR7rGQHfvAkPoQzy7ALeyqhEtS
	MTSBmFndNqov8QEIwRoiUWjNVYd2lR3lnu7kZiLjcOW139w9Pf6InKJduNGgUfDblNlJz6mSzGy
	zBslzjdzy6zMuH35AcEzPGVczUO+3FcPFW9LCFUspPoYRS1RcE6hezb8fG/bcw9sC6lqXTpftAp
	pk9xgig9hYMBj2pTGNtktvHBLO3GDl3DvwKJqYBZCi7OPM+IPCUCvO5uO8LvJufcJmLS3tqw/Ly
	cA7I9yzg7XIXYBmx+ebMg9eL1V704jzkh37qIqfDglOy9XBPJ+e29yYs78QyOCY6aBuDyYGGvpp
	TifgUF6t6RXC0IkdG7WJodKRXOm3rmt6CYYibDJHkpdvOXY9zmQjfz3XdUfM6RmafyTpFyZDXbA
	V6eDNPl+Wer6vgOseJBeb1bypr7ux2pFHvHx3YinOBCexxtNbBOjK6uK5iuf9+LgPq0GEnePebD
	W8Q==
X-Received: by 2002:a05:600c:c87:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4ac17567fe1mr309294265e9.12.1793712362853;
        Tue, 03 Nov 2026 05:26:02 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:01 -0800 (PST)
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
Subject: [PATCH 2/5] ASoC: rockchip_i2s_tdm: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:34 +0100
Message-ID: <20261103132537.3717496-3-jude.gyimah87@gmail.com>
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

rockchip_i2s_tdm calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_i2s_tdm.c:1304:(.text+0x14b1b6): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_I2S_TDM unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controller")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index d7ec1fbe17a5..0f8ef6868356 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -14,6 +14,7 @@ config SND_SOC_ROCKCHIP_I2S
 
 config SND_SOC_ROCKCHIP_I2S_TDM
 	tristate "Rockchip I2S/TDM Device Driver"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for the I2S/TDM driver for
-- 
2.43.0

