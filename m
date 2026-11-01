Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551492;
	b=1chCQMldaIOuWvMsEHoo/cJA4cywcISm3CgpKWVWnJBNgEcHj1Y2h7Kqo6/xNqqvP6Nf
	 qKWIA5YVWtSZlE53CnOHyqrkUsLQpm2JsLhzUGh4CiB4XdojvjgmEkDg8im1UEiXrhJ+7
	 8iUKJiPbFqVui2mk41EZp/aD/iMbM9NxZhCOmCl5e+1Sk/PMUoj8ZAqdPalnd+jo0ikY/
	 KrqBYit7svLu4rI68iaQE0sa952HREEG1sMm3CsY+nyZ1UaI1m0FH3ZbSyZmnSbr+juIV
	 FSGi80q3N+7Yy/ttaMJcIcVdb5fsdeWSwMdtp7HIqzomm+rX3AyA4q3y1MTFAf5c8vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=U2u6JPtaLF5iMQqC/jieagySVrkOfItQa7rqdEpvsOI=;
	b=Pwn8zjdMcLk0ykucrbW4Dq/IEHf+GpPNZlKXhan2BTgFN+tMbG3gRQWubmsDRTEZ5+E7
	 QdNQOs3mDqu9+6u75M7ZzDUGw1d1lmGyuajZqb702Do40YDeqVq66AujlNLxmRB+94eyt
	 ganv/ckqUlXnRZe7rLR8sxa0ErSBdecjs3BQwzQ3tkgP0MokzlGocd21UFB8LUC0VqqUe
	 UURVY1WFB77EUDaR4REdUjTywthFG/7XACO+S+51g7b3Kgi5dNiyFjVglLTGAyHFBCJq4
	 guxse+8zLVXNwAX79qiSG1vcTJDVTulfzz3HYVeKVP3olO0DOLIiT42ZMyW2e8yRMOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+5xjkRq;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5ED606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D5ED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+5xjkRq
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a6b774d12so21515eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793551491; x=1794156291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U2u6JPtaLF5iMQqC/jieagySVrkOfItQa7rqdEpvsOI=;
        b=H+5xjkRqOlQ+gTIg+ylrbrHOHBoG0TexZC1ZdxZ0cV58+hgewBHW1VqBhjs2749Cv1
         IndwgJl3odHdVnm99BMjz3v8kwlG8O8yyqZl07YuXvQjYuaJ937Xph18fT3qjoonuFbE
         BeoU2fI1jFAh9e3pSt5uEW5imsMSxdxYzOrQP+f1EoNKDTOsXsry5cjIUxA6mLtvuaCp
         ePCzx2FjeiBOp2ilMQ3aYg27EpkOXCtXKuJcVdAzWLAAcweVK6zfWGURjrdFKhmVj9vj
         jPVQhtrX9CS/+fKeUafXuUOomK995Y0nZb4V1Rh97VnpP8uQuZYaoyKwzxlhqreBQCF/
         iGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551491; x=1794156291;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2u6JPtaLF5iMQqC/jieagySVrkOfItQa7rqdEpvsOI=;
        b=UojnfYyQxzVPiCvXwZZX1J7Mj64K6catEd35kBVLvzLoxZiKhyLpGt0QcP1ND5KMzR
         moMNfX3Tsa74ct7e63bXMg9gZwY1Oyu0g+Iz+H66O0qcVrfwfxFyM9hVw/Lfj2csyIEP
         e3NYJs3s5lerd7Z6qaeHimeFUDXR55Hi6hx+fQYXFvzwMF9ka+b2bCmckyN6n6yyTl0f
         tOaslPYKUj6ZqSkcU1mbVPUF3yhxWti7dBn5pvEadLNQ+ao6mmG7xGwQyr5shyZcRPHx
         8mrpxNyJxxI7rPO2SmTiR2F6S6mAHwjZGOQFM5s55EKXAS3ny+iYte+LyCHH6BZ9KebR
         0OSQ==
X-Forwarded-Encrypted: i=1; AKwUvByfuO1bEdbmuA8g/THry0gzOnnQt1jfnEVYMnrLeFZzYXFICMjj536/sb00W9Bbaz/qyGFVXR74vosqSXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqGWedmmsYmN6U3L4IRm38YOYu8KOhDbFltmJ+T2+oExKADjjE
	rw9IDnfK43EUXHzAscFOhQHtD7e8SgQ3nrpS7EXPBTKEHiO1bylIp+r0
X-Gm-Gg: AYBFou2PMyTKbRxa8zPFEKIg8BohcZ5Z0L8WgY1dEJQ5KPOuPoLDDRr5EJj6B5yiGG/
	IA6dLPTOT0V0PCYg6/4mXZHvm2R0EFPcrY8lCMo76GeYsARcXC/Uc0PWxcDskcrXSfEro6R6uTd
	Pxy1zx+/jt0oa7yj3+iZ02+/xypOw/QqZkBF7Fg2BcSagbkqtodxPfBd8rx3V+ri4+AYTIFiDXM
	xRNjrCqbC+SicFBPhCQKMI9nCqwAjEnoL/f5utq5MVcICprCYixUEUH4gVZlNQ8ral3hLLNWJB1
	4rqzWuVt5fiH7RmC1D1xIBl+ZFQcNnUHqRLeSFpM4WPRiZQKNnX2Sm9fR3WM0SG+5G/UAW6pukd
	VlmW8TSQ6IMaHf72pWmEn6btAKSsQpVt1SO/34Vl+CN7wtM1Qa5ad4YYsCqSvjvdHBSvKD5Vaof
	Ia9Cg/Y8Co1nA7BiM4qB/iHfURbgR5dltmgiJA4tRvG6lNx88NTj2IX4Du+ew58DVOXf5zSdDG0
	LfeR+0sCUovZT9PVOkfHBNS3wCvDPVZ2NL1UdrFu+s8Rv+EE4RBZVNnTErGYqqYLNleTfGvO+FB
	Pb6AqysfE9BbNSmarQOF6DVm86c9g/EpHllTIdtBebWZl9bA7g==
X-Received: by 2002:a05:7300:d090:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-36a4239cc86mr18575735eec.2.1793551491118;
        Sun, 01 Nov 2026 08:44:51 -0800 (PST)
Received: from lima-buntos-dev.. ([218.239.109.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm35700172eec.1.2026.11.01.08.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:44:50 -0800 (PST)
From: =?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
Subject: [PATCH 1/2] regulator: mt6363: Use 8-bit regmap values
Date: Mon,  2 Nov 2026 01:44:03 +0900
Message-ID: <20261101164405.1743177-2-rtx4060@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101164405.1743177-1-rtx4060@gmail.com>
References: <20261101164405.1743177-1-rtx4060@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The registers of the MT6363 are 8 bits wide, but the regmap has 16-bit
values. On SPMI that makes every access two bytes long: a read also returns
the next register in the upper byte, and a write also writes the next
register, with 0 or with what a read-modify-write found there.

The next register is rarely related to the one the driver means, so this
goes wrong in several places:

 - mt6363_vreg_disable_setclr() writes the mask to the CLR register and 0
   to the one after it. For VS2 and VBUCK1-7 that is the enable register of
   VS1, VS3 and VSRAM_{DIGRF,MDFE,MODEM}, so disabling any of them disables
   those five as well. For those five it is the low power register of VS2
   and VBUCK1-7.
 - mt6363_regulator_set_load() zeroes the register after OP_CFG and the one
   after the third OP_EN register.
 - A read-modify-write of the low power register of a buck writes back to
   its SET register what it read from it. If SET reads like the register
   itself, that sets again the bit that was just cleared.
 - TOP_TRAP is read together with MISC_TOP_INT_CON0, so the VEMC voltage
   callbacks fail with -EINVAL once a MISC interrupt is enabled.
 - regmap_bulk_write() takes a number of registers. The sizeof() of the u16
   keys of TMA and BUCK_TOP asks for two 16-bit registers, so it reads past
   the key on the stack and writes that to the two registers after the key.

MediaTek's regulator driver uses the regmap of their MFD driver, which has
8-bit values (mt6363-regulator.c and mtk-spmi-pmic.c in the OnePlus MT6897
kernel, OnePlusOSS android_kernel_modules_and_devicetree_oneplus_mt6897,
branch oneplus/mt6897_b_16.0.0_oneplus_pad). With 8-bit values one access
is one register, and the sizeof() of the keys is the right number of
registers.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: GIBEOM LEE (이기범) <rtx4060@gmail.com>
---
 drivers/regulator/mt6363-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index aa6a8eb..cc2e841 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -811,7 +811,7 @@ static struct regmap *mt6363_spmi_register_regmap(struct device *dev)
 {
 	struct regmap_config mt6363_regmap_config = {
 		.reg_bits = 16,
-		.val_bits = 16,
+		.val_bits = 8,
 		.max_register = 0x1f90,
 		.fast_io = true,
 	};
