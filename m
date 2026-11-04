Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800219;
	b=28Wt8jVTSr43FxhevqpidbvHQB1QjJi/BkO+PAgFR7lnDO8T2FDKMggfnojL9FRp80je
	 dHOY0qDiFDZvWITOaEIMWmvqDluBO43+XTWAZbHT0xRpisaTNk3b3LDGITlAbbXOjskX8
	 i827Zzf8bj5h17aNigwo4QGjH+ezmAbg+uTMdKHStaoeGKaT3VrJUZ2O+/7jZ/JWRhvUt
	 GmoSfV34kpkscv+nIJ2GFH+2xaXfDyjNNcyl21YTt/nsybnIa7lnP6V5DJUGcHDdGkqpt
	 6qL5gLt/3g8T0oUWiaBSrkvJXNuAD07AU2Ws4WKyVki72DcVx1XCDNh9axwNvLXOiGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BcKmo87w9i30OoXpNaJS74LR5pert/qB2XLpxfTiTqc=;
	b=jIjDdyF6EcBfJ+izLgEfoxK/79yy9AkKRRooPmrrsLwFFu5pgahw0jhOxSv5wm/vxYb5
	 /rBewk4N+KGJB9VwD5uEfXYJfO382An75323WBAnP0oLFNsCdqLWXm4bnllfLfd4pAOAy
	 I9SUCVBsYE0fP2gL2TIR8Mae4c2pWp6sBcsl9A7jEiPVnsjd0STKSnmC+2ISd5T93aYtD
	 hjlbvKEalL3ksGXhjrKpmCZJRMw1JPpybRYaBEL6HN/MlCDuL3B7fzSwwwUtZ+NsUXdM+
	 Oumxa0mYxvzxggh7Hh6XMTQqWiIqFg4pCQHubFCeWrYqH84qaoK+T4vDMWa8Vi7mJXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uymKiL8O;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0666606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0666606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uymKiL8O
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4649b35bso637771f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800217; x=1794405017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcKmo87w9i30OoXpNaJS74LR5pert/qB2XLpxfTiTqc=;
        b=uymKiL8OnJXi+z2hxaqvrABOffxRFtn2pU3IzaYXL9DIg9+2ND43580uNVMldOl/JX
         bQN+QSLf/Z7OZmnRcQ3uJ1buOov3n5x5s7mSM2Ezo3nKl1fAYFebbNcuTXnvBvkn1IgK
         ed8f2jkOCDZCUhNn+eO1plJtCluaMqsJR/pNxa7JudrxL7t4ezm7tqc93x+OsDlSP+b4
         fAVTGC6ikekpAAtbcW9TC1wL8/u2nOYnTFW5a6AkSV2lvzNe0H9G5q6sJm0Uo60NqjDQ
         JZ9hvFPft30mNfuzNE2b7/IfxsGV9o39e+GohTykuhimcwYgKfTCWFP7f6nedz1ZlJT1
         OWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800217; x=1794405017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcKmo87w9i30OoXpNaJS74LR5pert/qB2XLpxfTiTqc=;
        b=CX1RbvGwYs5MG0YI3t1b7avdUHh8g+dAeZolpWVYo6r4IAqqLMrXf3B2AFX8EzIUZo
         VSSFGxIVpw6/7LwsDd/UIIicyHaFkS3OncR6iMvBW0egb0PZQAxVYJZp93gA5Qq2dP3T
         fqanUcFPsb0tAJgclDtZY2YsJ5W+20pP687qE+87ryk1NcFhboluW6td9KOOKc/9/fXO
         GrWegVTUciMZvuqRUK+3K1y30j98nGHCrnkTP25L8hYMDwUKEK9JPzaqeqXJCV2bX2yq
         FlxIyMU4Ec+8GTL2/VL4smV/ap12q1qNZqlKtFLQdT/f0TRshXotMKXAPhxCT5dNfRBT
         oItA==
X-Forwarded-Encrypted: i=1; AKwUvByfGx0MsjuB/nCUIFZqi4oYNkPYNOvx/DqLMVL6yjdEwT6CJlAnpCIBSDt0WSZyQ4l+9/iQvC9CpF1oCO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6rXFfhTGWUFDBqXL08x+4cEdx79BBXXWdPEJciiGuG76FejTy
	TMzRaqLKJwL/7uO9BO8s8EhD//E+jSajEgZ2DM9T5NUaj0mzXMYHYgim
X-Gm-Gg: AYBFou1PhlHBH7pZ/RZrjvuAtpU3vdubuZuwBR1d2YukMinf+Z5ZJQYTH3b9RLFhy8a
	LOIwtcqxACrkQFZjUSq5Uw7xfkT8m71LH0VLQ6xUOD4nSGXYLDIpZpG7G5E9islxfZPj7fOvWhK
	u1zKPZuruk05qCWhUeGYACJRmIcUy9fQW4HqHL1bnD7cD6LkikcecjEu32Wb89bvnVCoNXSOrta
	S+Mrb/ETUnIqvf1FlWc4cBM1q2arBk7fj7ntyDwKzPc7gEDr0G2Tql7WFSbwbnxbrqgVwo6SglY
	5jeemyb6l0CNV47yxx1liuX3KSu6LIkEMo/A7din/epi2dcirX1QJ/OxjbngqCUTkp5l1Xfa7gk
	eIRAgheqfi/HTvx83TBojjLynVk9W3wgUftyebyrUgYuB9rLqjXEq4U2EeDr1zAGZTA2nHOKCOU
	GyM3LC6onbx/wWP1pjZ8Wmvj33blWIiugkLWf5C0TLBVOOW1mLmBHxfw8k51fr25C9Q+bbe4WWk
	QRfG4PYnWY2tubRJC7yVQmT/2gP9YtpHu/CoBc196XlYIQYSiUNW0jC3kmSavX+tq1EagFWGK/n
	HA7X/k5F8YZ5jdRI4zzHI/nnyfIbIgeSGkSwgxTzsj5Z1Jx5V4j0B85QX3SwatPDMJqjWzltFnw
	D1ha8sirdj1CDyCwYdcfspyk=
X-Received: by 2002:a05:6000:2313:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-48e6e30ba6fmr36959078f8f.24.1793800216947;
        Wed, 04 Nov 2026 05:50:16 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb5196esm3701024f8f.58.2026.11.04.05.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:50:16 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: chancel.liu@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 1/3] ASoC: fsl_aud2htx: select missing dependencies
Date: Wed,  4 Nov 2026 14:49:58 +0100
Message-ID: <20261104135000.3723017-2-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
References: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
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

This driver is short two selects, not one: its configuration fails to
link on a symbol from each.

fsl_aud2htx calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.
fsl_aud2htx calls devm_snd_dmaengine_pcm_register, which
sound/soc/soc-generic-dmaengine-pcm.c provides under
SND_SOC_GENERIC_DMAENGINE_PCM.

  fsl_aud2htx.c:(.text+0x30c): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_FSL_AUD2HTX unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_FSL_AUD2HTX=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 8a24c834c053 ("ASoC: fsl_aud2htx: Add aud2htx module driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/fsl/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 04940879dfd8..e8924ed652ba 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -116,6 +116,8 @@ config SND_SOC_FSL_XCVR
 config SND_SOC_FSL_AUD2HTX
 	tristate "AUDIO TO HDMI TX module support"
 	depends on ARCH_MXC || COMPILE_TEST
+	select REGMAP_MMIO
+	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
 	help
 	  Say Y if you want to add AUDIO TO HDMI TX support for NXP.
-- 
2.43.0

