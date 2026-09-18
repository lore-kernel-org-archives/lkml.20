Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1654E9C2D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734329; cv=none; b=AqPvxPFZmTvPt3dSPDy20eIkbVlR33PtMO5o6R4yLY8RPH/vWohfBflodQsXYZQgnoz46o5UfIeGq7RVUvv1Sxby1sSH6kIcaC09lPO6WvXZx4hFLSITmfjaSpSQxybZfOGTwAOoUbFwbArRKQh6BMWKBOMnyAJIEXWCWoiHLow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734329; c=relaxed/simple;
	bh=XEU3X6TrPs6UzvTqsbHKRzxHg0PLadxing8itj7f4nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ot4puYnYM8P+xH5i/OaQyvF6rvRMtLIHluPn7eXPfU8ckDPxbrtFDTRHJanpA5Q+xAr3o2I+/XoEM0uVZDyZGwZA1IGtcY89nXMNhqiLLvzZpMG+VhpeZNhtSgGrtGQTEfG5/ERpGkj6GxwXXINnVzjvIeyZ/GtBnQGn3G2saeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnwhAQkT; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnwhAQkT"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1651bso647318e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734321; x=1790339121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfR3YrnGEF1eVDtqqFJbMom6dYue/Q5AxIRNa4I1fXg=;
        b=jnwhAQkT5QOibrOI4GsyOst+ElbFwout/QutsXF0V/Xrzw+6XwIuIfg1Q791MqhXia
         S8WLl5Srl+Qw8Ey8yqjymFKZdNe9Wp4JCT7Vv2tmzrbyr1NBudYeXEs9ZWFz0W+7traA
         WFBqF9gImjs7dm2tFj42CCfrP4duM5RcsaKysFNy89xz1qCgpUrSfhC69NcLIiPoAeSq
         qVu1ZGtMc5yXsEMQ+H+NuU/kxEQJO0vppeC+ClE8z2r4bXjSypD/0W7E3LMoG+rcXYXd
         oYeeV/WeuOZsCtndQ8Jb8a2pnUlHCGHBMQ6WhUyeg1DDqcHPmofsuiBgi9sP47fQ56VS
         3j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734321; x=1790339121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfR3YrnGEF1eVDtqqFJbMom6dYue/Q5AxIRNa4I1fXg=;
        b=L2t6UGMdAl4t2xdFDuZlYg+LudhNd5VGJZp0RcLsh7RrYEtPE9HCjNUUNpT4qa63a0
         U07lB9UHSbc9wSVF3Bc7/Kx61gf7gr4DDDunWXwouftXQF/K0qnu41zD/DbK8MCOYXNj
         SwGuDF6G6yTpHpGByIW7X3NPdt3DX86GWFtI+bPprLA0GnsjT2yKus1jUzvepCm69XpM
         Gv2for5tcWqeos2suU70sMIJF4yvwK/1iLslOWScKvdFs0LTHtWx29SpRe3w0yTdIJwo
         uA6DlMagFubZIEWMXsIXQxs5659PzKBmed+eabIl7xlXqPtkA9BR2t6A0dkE0KvAwabG
         HyGA==
X-Forwarded-Encrypted: i=1; AKwUvBzgAR3XpTgDIeOudbgfDpBgis5Ugg+dVA4T/o1KofgHGUtlY4BSAlqSKov9tEAC6lwlitT1t9kbzJ1P80Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lMo1yPFDDl9MtU5EgJAjGMLG8slnzcJoZUriRpy0zofqxm1Peg
	q43zQUcNtbovi1s5r/m2HxWQNuAkYZ9DCnWVgi/QLwruIMhfCKKUIypH
X-Gm-Gg: AYBFou2u++NyMotIfrwGbPTWLW2f/qaxMFPTPi9R1ruWwcZtOVfI4XxYHIggJlte5lT
	OAdr6VFpy2hBpcrpnRe4wV4Fsx7G3px+djncd2+yN2zKkV5okh6+oH9RaEOrKmjQsOW4hPBXZ4G
	5/uE8w0JNnXHoP2LawtE7KOeq8LUVfwgBtgu15f65p3nzqr5kP50ygd/wSMVVBHmIN0Ka/5pELu
	JVN7LnKAEaH2aPtpkAm5FZG66cTrXrfdqGlTWTYz4+40tYc8tDVFR9FFALfzUIC59qXSKyav4Lm
	WQdjwyieEGlRQH8Z8fulpUVPYVyLOLAqqOJqvvNzMEFYPYdkams+hOa9OH7qmDi2tDfIpJeiXZ9
	GIvvyNviJWLLfkoin7n7LDj4ajostrm1177e2cTKZ56OnRJC84lsQsoCYLmW+6+rWOZDNcYfeEK
	rulfdBrU4GzncuZ1kV9EgJjQPDujSSaPdLz5mOVXgf3MuCdte+dtECeGBQqttm/95Gt/wLJqzwa
	1hS8iBQ53Ab9GrGrDPZ6AZwEPHAWHnqnFYVbRAq8MpLkBLDiGuX+Y6Ev1RbD8XO4RDM4g==
X-Received: by 2002:a05:6512:3baa:b0:5b6:4ae:3ff7 with SMTP id 2adb3069b0e04-5b8c18449abmr695430e87.31.1789734320670;
        Fri, 18 Sep 2026 05:25:20 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:19 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v7 01/10] iio: pressure: dps310: fix CFG_REG bit definitions
Date: Fri, 18 Sep 2026 15:25:08 +0300
Message-ID: <20260918122517.377565-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918122517.377565-1-zoone.rupert@gmail.com>
References: <20260918122517.377565-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver defines them as BIT(4), BIT(5) and BIT(6). Per datasheet P_SHIFT
is bit 2, FIFO_EN is bit 1 and SPI_MODE is bit 0.

Only P_SHIFT has a user. dps310_set_pres_precision() sets it at
oversampling 16 or above, so with wrong bit the result register is never
shifted and stops matching the scale factor compensation divides by.
in_pressure_input returns -ERANGE at oversampling 16, 32 and 64.

FIFO_EN needed by FIFO support later in this series.

Fixes: ba6ec48e76bc ("iio: Add driver for Infineon DPS310")
Fixes: d711a3c7dc82 ("iio: dps310: Add pressure sensing capability")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 45bdb8c7670f..35260b399390 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -50,9 +50,9 @@
 #define DPS310_CFG_REG		0x09
 #define  DPS310_INT_HL		BIT(7)
 #define  DPS310_TMP_SHIFT_EN	BIT(3)
-#define  DPS310_PRS_SHIFT_EN	BIT(4)
-#define  DPS310_FIFO_EN		BIT(5)
-#define  DPS310_SPI_EN		BIT(6)
+#define  DPS310_PRS_SHIFT_EN	BIT(2)
+#define  DPS310_FIFO_EN		BIT(1)
+#define  DPS310_SPI_EN		BIT(0)
 #define DPS310_RESET		0x0c
 #define  DPS310_RESET_MAGIC	0x09
 #define DPS310_COEF_BASE	0x10
-- 
2.43.0

