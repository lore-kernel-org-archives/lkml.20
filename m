Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228CA450418
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942661; cv=none; b=I602yecE2+Th6K1eNarD1vW3jpb0Ih2/LQyrqFamz0KeFKh2bwDvvlCpt8oYlo/oCpvmR2fKFCRwDQWGn26NRClEC1ds8nJtfSv8CQkDxf+4/DuvpE1PEORQeJ/0fSR0I0BUhnIAQAdTG1h3bXMF855f2ikn3GMWgffZ1tKbyKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942661; c=relaxed/simple;
	bh=M5gOmxNVEYBWCZddIshPvl/AuXs4iPCkuaNTOjovIfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrrC3a4MX0uiYpSXx+kxaz9fdlcQ2XmrQUt4JUkqiNtjfIBpVeqbSydeykO3ZueLiDg0sV3rHJ6fhi2g5DpA0hNRLswQHQAQ+Lz5qJgdIOKg1ODe3x/Vej9wwPoyKl+SFXlqaFvqA5DbNKnUjKY/fJfnQYbx9Kr61cyq5Jqgb5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvjU6WvE; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvjU6WvE"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8016ab5f277so327363a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942658; x=1789547458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fr9GqqlcZjpJ8b9Wsl+mydOW8kr4IAMiGLW3BSwW8ho=;
        b=BvjU6WvExhhxPpTrJ5lvNGguXUJEKG/lEFmCQiJs5nrd7yhH1hBXZmJYKUP0Eb5S4C
         ndb81ExTztpeFETqxmyWqHtH/Sw34+tkprOkUzqGZrlgi/WrwwZY14LfUvFFZtIfEhp2
         jvmAQoeiOujMka2Auh4uVxNXAmdkiho+ZkOsA3ENE+SLigLoDUey1bqme67Ikor8AvWT
         AMvNej2WmaNqJysoVAuyqZmLQ7M5fxibmsDqcqjeJr9etAHlYkq9lUOn01NEbeZTdwIW
         /TEcol49N4rhcJD6E4YGPbEx78fhEwP2Y3QVlqBHp84Nt3plqweVmNVMEYnrDn4fjwL6
         b7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942658; x=1789547458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr9GqqlcZjpJ8b9Wsl+mydOW8kr4IAMiGLW3BSwW8ho=;
        b=MB4CMGgXYC0Q824jcsd/93cpW4ZJay4THbKVLHurUyRvbWH0lIBlb9lc6xLzvI5m8G
         L0Q8rn/VEGVnkaDePTMYJI/wzY9pfuelndBYSmHKemN2gN8hEtxDPyFcZz3V5krR/t85
         sJc4mwvWeu6mkZkYhvWlhD2RgVeSRUZFjptPX2weoHE9x7BtDxY0DGrpTfUs2olslIe0
         bp4W1b78rhsY8vRXvS2OGA9wnSNgoJ176TVptA+4KMuu2QkGBXAANdR5plv2pb2DNexu
         cLCek3VNVn6l/8yYRPD856DOiOZBxWW+EYDA+ctVgRjjWsg8qwyJajwOyRvAkUjcqOVD
         LyQw==
X-Forwarded-Encrypted: i=1; AKwUvBy3a+zo6UlO9IYJNj9Cm9e6zS1wJpojiFQSzScdlgNrQbpg+Mp4kzSo9du0nx9zmVmT+eLC1y2ue3/h49k=@vger.kernel.org
X-Gm-Message-State: AFuF++l/UoQYS5kb1wxnGohuHxqj4v/c0gpyoQuphVkG4xmXIUly8cy1
	GjeekjMi3I9KWiw3ECbBBFSCbVfCQuFc/f75RrX5vJngIXJSSEvHDy65
X-Gm-Gg: AYBFou1ziY5sOe5sSeInwmhomEy/MmLN7hIj+IznODLi9jXpHmMGIBU4nRev9jdLBWY
	J3yqXvj4418nXLDi2hLIk2zY3HYjD1AOnG6f4WVP8jrBrq23oSyI0iNQMmRGtkrj5B0yGu9f0XM
	qckyvCVb4Q+I/DBrqNs6TZddkdWZsQjwgvM2oI+Qzmym2G6kGqXlB8Aaphzex/g/TB3KQ4wTZ4p
	NhQ2rg9utGf47mmzxHJwecbQGnRhCdQPOj8U1x/JeZ6CWnB+575nyataX8VdTPlllcgeT+7OPMI
	gA+Wi4ISCN2+I45wqFopJ5JRfw89oNVWJV1JuCc4NJUIpwsT8a+Txkfz6D9yVxLBrv9Yw5GwdwY
	2MwuqnojR/vk8Q/ICYrw/Hm3k/IHvIbYIkdwOCpzD25oG9wqYEBYPfr/Za8TJSj00KxpqI5nXeI
	yTwibYP5wzU8pSdzcTwzrgema9PaubHWkiqQmotQX31X81hSRhN6YZrkWuipQYyPbo3GtM7JAUj
	VUSay/T5WJG+Pa1X65INeAN0l3Kyx5GexWlFMJfuK0vqpYjv1tB6FD1pjSH4KAL+wOnDjNCeUxM
	doygZpjSexH5TtWAGn7m8GFttp70AyzTiZMCaLssX9wyGL/n/OGPIzrX1vV+kiB8Vj8gT8YEawY
	VE3Fy4tpY4Tc3SLi+A+G3CjtGu1oz
X-Received: by 2002:a4a:e914:0:b0:6b2:69bf:c8d7 with SMTP id 006d021491bc7-6b6fb3df17emr20147370eaf.10.1788942657854;
        Wed, 09 Sep 2026 01:30:57 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:37 -0600
Subject: [PATCH v3 04/15] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-4-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The pattern ID register has one bit per hardware ECC step, distinguishing
all-zero from all-ones data. The correction helper checks the current
step's pattern-found bit but always reads pattern ID bit zero.

PIO reuses hardware step zero, so this works there. DMA processes several
steps at once: a later all-ones step can be filled with zeros and reported
as a successful read if pattern ID bit zero is clear. Conversely, a later
all-zero step can be treated as erased when bit zero is set.

Use the current hardware step's pattern ID bit, matching the error and
pattern-found bits already checked by the helper.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index af8ba2d9f7a0..1bc94565e9e8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1105,7 +1105,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

