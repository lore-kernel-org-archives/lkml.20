Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800400;
	b=FF63DKD/CFEOWqfrTUbkbFVVarWxC4b+1N2C3i/GiYVAOQ9ywa7WFy1/4bGrQBHGw5qQ
	 Ahquwcx3HiWKnUTij97SnKxRlh7VsBu6Dv9ZY12OOz9sBOUEPv9C4yn6fzEsq8CEpIL/k
	 VhHbMBetrwbU8586Lik9Gb0Fpmlv44EUHz9InbM1ShsTpHu+PraqGBtPtQVv9KDaF0NBC
	 QGHfD0ZhrlVPiy9xDk4SfEWhroMrdHwcnhpToMXue4lkN6dT1cd7j3ouR4z/XtFkjEr5N
	 sRbJoyjQ/eXHqGpaSaQLYSohizK0vJw38Sbr2vCr2rWmxBUOYXf2vUJkkXytZERqt/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u9NTI3wQWhg6Ur7+7Hw2oDzx3iUnpb32rYoJcf5DJsM=;
	b=zWTAXLgFRgbM9+LAbTP3Wi676WY2IwfavIsu9aGQ4T13YmRSsWrHtwN/U0D12H5Vcizp
	 IP25g5+IUwjmhLNRS2JymkUPO61GjgWIiJAABKGjJfBIBdJOhP2bH8rne2F0syuq2vy6B
	 t7Dh5KsHGdLzNTLr7fzgHib6xbp4ZMif/i2zWOwKhTcf7u3XNV7P/ykmsiJgq1VbxkNsm
	 xlOK5GowjKkPiKQdJ/vmayJiPvjLgDsICVasFcujtL1RBb3uECYhx4XqVnKHo2MuJ8NiQ
	 91Nxkg7aU2Vlkl8fMl5S6VKpyBUq5o6q2cps2UBxFnnvHT3AMrhkChypAuh8kPc+qNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uo+0lmil;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C02A606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C02A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uo+0lmil
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso7627275e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800399; x=1794405199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9NTI3wQWhg6Ur7+7Hw2oDzx3iUnpb32rYoJcf5DJsM=;
        b=Uo+0lmil8Z3aY+bkjJ4FbHVGMdy2lUTCpIQrUNMI1TGKhOVbFWIrTB3ivU79w2NJSl
         SRAwOStGrvuPK1bTZY01itsChoe8HIpuaqwj5yzR80bmvxE7T2REafV9f57NOhkj8vK1
         juGYDHc6G1meB3ybsfoCKvO22Nxhhsr4h/7Z7INLXhIVd9Sck+0I+QBfxU7o3VdmkOBj
         pGl0UHV4NOIjYK9orlAvJI0O+ah1AJ4mODKEBoNFqzmPtgVaoJqF5/QLhOMHG4n5jAtZ
         TZirkIt/A6TTbdVrTkOgukkWJX9IXZBYLA0pf47LVU6TskSLiLFF20F+rQj+P0zN1v3W
         9oLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800399; x=1794405199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9NTI3wQWhg6Ur7+7Hw2oDzx3iUnpb32rYoJcf5DJsM=;
        b=cJBEpho2UgEAtBci82po91UFwQFDxCCn3AiQhq+A6P7by6+XOZWBclmsNfmqOZCns3
         Kfb1PlG+jER2Ow9mg19PN3dCtrbuNx8mfBFHRj7cmhYbBqY92get2Sqx3L8FIdJ0KgJt
         JNAPBLGJwuPls05/vbqhi0Dx8PMS5aFTr6zA8d8tNbeTa1xjvV6taOePIZOZhV/im9Km
         QGn+8wWYrE0LEwPdp2mSvnVVKthPLAlEz7r8UrXqSyCyvC7TqPE6sNKIJBKgBAU0gScq
         3CFFoy2RWW0RrTJDSiduOmG1U+/ybUeyVgEJeN8GcOcIIWFJrwF5sYwlhhj4vTO0lTK3
         KIuw==
X-Forwarded-Encrypted: i=1; AKwUvBzThj/WZ0ee7/La1sCA7FWOLLf8ia0Scs0WOiKcAJXjAyB39CKBKSz/n6qDC4/mpqAcSkZ4UPNWkAqQpd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e5OcTVyQqSEM+KQ/IWkuMQcRvhTlS5EiSyn7rNVFiU7EKJaC/
	5+JxcVuyJ4xbc2TbveUgtKzfzIaAHUzzwor9lGOVaqC0Befkiu5nqSss
X-Gm-Gg: AYBFou2RiPs30JoUr+MaeqgqsW/auRGqtTooyvIMgKpk0BAysHSqOc+KPxMfNxLB/G4
	WJPX2SI1knpmBK2u1mrfLk/LCs3J+eMJQGKp2ZmXJLJavrm2FpUlSk8XolKzxbffQbIbcu5X3di
	bcmFMgelzyYUv/HL6Z6M2U8gNHdJ8zqsaIMcmSZJEp6NU6nr4Fjc1evnpkWpiwFp4mkMUEhbz4D
	fUZ5I587dfJjbfem1b7FbclwxQ7zkQTlHdWxmhs4dNElv1BlsAuAoYbL8jnJU2kjBiulrmTeft6
	8lUDLdgF4W2Em3P8pguOtNMFalYMQdUM/C3uBSPzB9Zn4ttODk1rmrmOF9ztpGGxD979l9VlQzq
	D6dLGLtDEklQ1x/DzLgugttske1a4QLrlZevCgJGOp0QAVrQ6jV2X/kduqMbV6H21IUeU4PscW4
	nPdYXxS2JFs1Ha3XUk7Mi9MwQz86SW83AQ4BC9+BWsVw8MCW1hFjqEOdU0KFFAuunzb8KlCTJub
	N3qMnh3XXpmNZQhCGA+2UwUSAhQeKtq9JDZ2PBefFEd44bpjt+xPDu9tkCWHbZbHD10qigvdhrG
	PeWUfplEIP151mhb7lqe+KGlN++Y64wcsS8PteLSvZgd78ysxynhTMsrky44qXeLYyZ80PokvOs
	xT5eD/eNJOxGxg19e/EHr+HV4
X-Received: by 2002:a05:6000:4914:b0:48c:69b3:610f with SMTP id ffacd0b85a97d-48e6e5008b4mr34049088f8f.26.1793800398437;
        Wed, 04 Nov 2026 05:53:18 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d88e1sm4160971f8f.15.2026.11.04.05.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:53:17 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH] ASoC: sunxi: sun50i-dmic: select REGMAP_MMIO
Date: Wed,  4 Nov 2026 14:53:00 +0100
Message-ID: <20261104135300.3723057-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
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

sun50i-dmic calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  sun50i-dmic.c:(.text+0x142bce): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave SND_SUN50I_DMIC
unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SUN50I_DMIC=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 9fc2c8ed923d ("ASoC: sunxi: Add Allwinner H6 Digital MIC driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

 sound/soc/sunxi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
index 205f422d9ded..c8a626396e9a 100644
--- a/sound/soc/sunxi/Kconfig
+++ b/sound/soc/sunxi/Kconfig
@@ -58,6 +58,7 @@ config SND_SUN4I_SPDIF
 
 config SND_SUN50I_DMIC
 	tristate "Allwinner H6 DMIC Support"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M to add support for the DMIC audio block in the Allwinner
-- 
2.43.0

