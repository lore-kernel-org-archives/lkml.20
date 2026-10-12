Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814B84C4F74
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830521; cv=none; b=V6aJqUZzCz8svcf6Dj5wv/1469mhmyOzySsQEJoadX5gnhYWwhqpm8H81iWyinPimlnNEhu5PbDXAkWuVUuNUvniZl/Tqg04scvKZYO+ZD5MfRgD6/dcY/CxvprAlxxJOW0BsFUrpegCp3bbws2oW6gZvcpNDae+PMK1PyJ/row=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830521; c=relaxed/simple;
	bh=+7IEebuXjPysbU/EOLi4stnxpBM6T6QymSauphGxL/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZ1laExXNjt1bKDNN9AhnpwVEsd7V9EhnzDuGSXilUtM+2NEudv0EoPqSnPgLY8YmV4RL4hLhOp4rR6iIhqcBtK3PNESXJcrzKOBPypVMT5i/zLmHw/qPtUL2xTnVxUrgl2ggsO/Bz0GinTuXCkQLAlZ7Hxwnue+5vkZK+UZwdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H97a1XtI; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H97a1XtI"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5e948e56b9dso451082e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830518; x=1792435318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AyANQsh/NuLrShgUzGL88ky2h7L2MDCXmZx5EOLv9g=;
        b=H97a1XtIYJt4/I/Tso7r9gDwDO9nIF5If321iSItCHG4Kbyl6Thj6YftYeHGNDWuQX
         bREYu0T99CuM31bxJkCnH2J7EijqNAqeJNoYzcFP1MVR+k9bmRK0YFJI23wCBD5vlpkA
         h4hM4XpoYreYSO1QyQ3FXF5EATywEArUF4ugC+a4b646YJALMcqwCWJDXsim4Je1UtBP
         XkOdPb8Oy3CzJsRTHy7Rhk/Ia09NFctgJEdNKXbGP3HP83Q4Hm45+MD08dsDUnp9iwY5
         0L5JWKFG1AySvgdGkVw4dO9/Gcc2a5qVxA7VKx+WfLWhEHtTbUolp/pQvnGXhvI7FRhQ
         G+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830518; x=1792435318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AyANQsh/NuLrShgUzGL88ky2h7L2MDCXmZx5EOLv9g=;
        b=pzSTgvsx4tCg2B0pZbvYKYp/Nw2DBp90XAAQdlkeX1W03qDIfg7JSsp3Xyp85sCflk
         jGlJF/hsmmfE+t3enrwjYQ87SG0E4gEjCbUmVeauGMZDMM3slaqNyw50An6FrZp6IdKm
         YJrIOQD9T1ZxjSqiAeOZLuKLhoO06Lpzz2LrBDCI2rNDYTUAvPtsLAGCBPYCrndxeMSx
         +lDNrB7sfmvcmze1vtvR1KOeK2pqCprvaXgQAi4BQ5xlOqknc/mADxug7nm/4w0pdy/+
         zumdWDbEKIc8HZ3mV5Fb9Ua/szY31IA2EJSIksAb0JunyHBe/+AzpCDrL7bVVJ8D/Ufa
         Ltww==
X-Forwarded-Encrypted: i=1; AKwUvBymHGcCtKZHGdv/D0SPQOXOtUYi40xwpTBctWc1z/bTZkPPP5Q2b9AaZqMxeMyHDbRlvJDanMV+92T+P0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaWgzi0mIuyLWtasYr8F2EUo55TLwy8ZsOAmvZf+7J39c9ffbX
	UqaNMfNYET6jOOxPOZaAtufyktBzGIxJ0/ZO+DMH67UH+S2yhNUl6/Z2
X-Gm-Gg: AYBFou0KsZdl1a8pa1fh2do+ptL40Bj+20W4NSoSTi6CHVLVP69gTQR4WPaJ9mpPrIQ
	uBGpMI4I8gT5E5rRATOKmNcZKCd/f0wpGmCW13g45WRUVVZJ41MBHiS0CKkuXh/t+xQGp1pH18H
	BZuTHOsKPo03AKIqDdQ+1euuLmyaubgF8oiauf0cTAbNFCecGx6YqESHA21Rw8yw4apfpcz3K/X
	VwfB6e058MMWSiVoy/noVh1KFZE61mT55Rd2YVEzFKqHzxMAeSLzdczPyyXxI4HpApTCnDJMvX0
	Z9VsiSj2K0W7iIfscF1H0gcYEGEV6g7XGJ4qf+kSM4cVYX0pJ1SigyyHlyahKRwIR+xofZ27TIh
	MUZcmLylbvpq3WdT6pkqiWDL2a6mUlzBzZXtXw2JNvoY1FkqI2ss7g0/foD/vkgG80W3g7jMN7q
	xcKplP0ptxSgiBSNFqOSlHyofjTeNGd2Afu4+y52LGTUpbI3L7jVMFGso0c32JwQJEScAXs/2Fc
	yyiHMhkz9fUUsOXK4uNxKL+tlQ+R/LwE12xP+b7lPE/sGg0Ue/Rxdu2lJNYFnI3xtNeG88L9GPY
	cDhC4q4r3dP+eXMSbg==
X-Received: by 2002:a05:6102:26c2:b0:7a7:195a:1b2a with SMTP id ada2fe7eead31-7cb377f59d3mr2545886137.36.1791830518290;
        Mon, 12 Oct 2026 11:41:58 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f230b8sm6830180241.8.2026.10.12.11.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:41:57 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: sunxi: a733-r: use the A733 I/O voltage fields
Date: Mon, 12 Oct 2026 15:41:29 -0300
Message-ID: <20261012184130.548261-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A733 R-PIO shares the A523-R descriptor, and with it the A523
inverted one-bit encoding and the access to PIO_POW_MOD_CTL. Its
SGPIO_POW_MOD_SEL has two-bit fields instead, and the manual documents
no control register at offset 0x344. With PL in fixed 3.3 V mode, as
read on a Radxa Cubie A7Z (0x000aaaaa), running the old helper on the
host with a 3.3 V request for PL gives 0x000aaaab, which is fixed
1.8 V. This was not run on the board.

Give the A733-R its own descriptor with the PL and PM fields, and
leave the A523-R as it is.

Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef1..1aa7f32035e1 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,11 +30,33 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+/*
+ * The A733 R-PIO has the A523 one's layout, but its SGPIO_POW_MOD_SEL uses
+ * two-bit fields, and the manual documents no control register at offset 0x344.
+ */
+static const u32 a733_r_io_bias_masks[SUNXI_PINCTRL_MAX_BANKS] = {
+	[0] = GENMASK(1, 0),	/* PL */
+	[1] = GENMASK(3, 2),	/* PM */
+};
+
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
+	.io_bias_masks = a733_r_io_bias_masks,
+	.pin_base = PL_BASE,
+};
+
 static int a523_r_pinctrl_probe(struct platform_device *pdev)
 {
+	struct sunxi_pinctrl_desc *desc = &a523_r_pinctrl_data;
+
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "allwinner,sun60i-a733-r-pinctrl"))
+		desc = &a733_r_pinctrl_data;
+
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
-					   a523_r_irq_bank_muxes,
-					   &a523_r_pinctrl_data,
+					   a523_r_irq_bank_muxes, desc,
 					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
-- 
2.43.0

