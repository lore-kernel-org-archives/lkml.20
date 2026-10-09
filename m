Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1148D3C198D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565046; cv=none; b=aAWBV65o+3t+iC/AeWZw5WFTG9wleSpXeElArbS4W/UfV4+WtEDOc2YDttwPAftdKSJB4NO0fMO7VG99+Y2iutvlO/dARh5hHaom/5ll8FmWI+pZeisi7t0NDSaksX8lclA5i/JjjaszWNEY+0LlM5waDF0knwf2TMFl5nBdkwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565046; c=relaxed/simple;
	bh=a4LEdI4zmYrsARTO6tm7elt3ct0CBuvgZr8Y+wGqMS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TUbHLHEZTfObUMnhHoOck5lxSmk0aUwdA/QvVN/5DA1t0EGbfxD4eyJZWmxurMHCqFFkIePrzbqnehWthi+5EU5XLDFVSfJw/Kd1lKNk7r9jjz6KLoee7uVdmLEhoX0NRENz4jKEdcJ12RjLH3iIBVmcsRYYBQj9QBGImEk3UN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhzBgdzX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhzBgdzX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a17baef589so619035e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565042; x=1792169842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0El2Fy00Oi5wjm6HinjFYLztqKtQYho+ZzRgbEJvPwY=;
        b=hhzBgdzXN7i2paxcOk6Uh2cFgLFkwmkiLN+/mptwRx/GtlA+IGu4QclPdeV91uwFjy
         HGqxOKSph3hzFQ0alB+u9a/O2psj1qVpBkSfIhlRq52etZ0T/ZyKSGLjU/EZR/lqNmWq
         oemEzWzzmObBcWbTqTS4QiJPJiMGtW+VtyYuqcvvC9G345quur0g3Krv1z2sTzhIUsKj
         0qoL93YsdXXmR7+IKyFGPZJf6rGolDF/Z65Mb+i8t/Gvq3ARx75++YEUzZgi4okxMoWC
         7h4Y+rweveAEpwrIkihBnSV/ODvR587k7Hdoywf13RmNQojeBPdwsgoIw+ifgBpHckFO
         qGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565042; x=1792169842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0El2Fy00Oi5wjm6HinjFYLztqKtQYho+ZzRgbEJvPwY=;
        b=kXVutb4a/LWOENJ5e03vFgJFmkG+Zu3chmNilrdZNR8T5x58T5rJERbW/VFmGjD4AJ
         Lo5/biTg+mWvJQ3aqcPSLctnQSPxwzBuQg5kcDco0Ktg/F04CzkgK7XVh4TTC8by5iWD
         9bB4rYF42rq4XmZHMYvIeSfPxOpitQA5Uugn9WmfYbcmCgvF6h4iBmBn4/htgVFymZ8v
         h+j7Zf5dQZZdjSSBGTmr/+d0QXdt7uojpLfSX9IQim3e0isMijN6fttZrfA6Oygw0Ta1
         GGXXGNuk1FUU5YPukadqfwtaCx0ipMCAwe3d5Ap3OMFeTzYyjkZwDR2a+UWntCnxjj/n
         +shA==
X-Forwarded-Encrypted: i=1; AKwUvBx+9yMmu2sj2Q/2uZYrZNxWh57V/vVWN2PhtXYDB/A9/0e5/RpVAYB99YEq6E1FRXDaybuibkhH4E9qi+k=@vger.kernel.org
X-Gm-Message-State: AFuF++kmsiSdtJWCk9Kb9BTEkvzsUf00b95/p/tBfQ/EAyvQr1s7OHBZ
	VwEMAZbWsumA/7ISwWHzDlDhJx3ugImzQUmGwg/iGx5F1iCqGkKeSLVz
X-Gm-Gg: AYBFou0x3ZL6Ns4DMXuS9QPkl1dVcZuKPonwJ1ocYZn1XnQNWyfhtMLViWtP+9fy/MD
	PC/vaoa+gdD7L5x2td1kZ4YkrS2ofSoncZ01Johsh83kRatsZc6FMFTHIifR52VzZR8Nn316s/0
	LJeGm7XRCYfwvdUxU4iGyDnhX/v+8HyVVC8gnr3mHGuLjiPHevEj+qzcZp91WhdHG8f/SXoyEjE
	6OIIN+QLF/GcLpfehfAgCI0sQBSuVtYrbGTMY4sWuZb4icFkqN5YdD1wyPfgG8e200n5xY2fBSy
	WPY58/F2FWCxdr5cfKUb17MyC1iGK92Gko27xmpysiSugVM93xAQZXZ7eO0qIZ/FK51oXU7oFuq
	Huho9+fAQkEyz7zf7VtbVdqCbCzAsgs2w2HT0fHMxtYHK+UqipUvWCalvjtGaoDb6fc54wDVah+
	B6nukSt4M3bj8uOVm1JdcboNa+N99CuM9kC6LheLNbuwR0+HOFzNdlOxH95IaxWz5P1Msu4YvG8
	HC+4TYivJ/3bYkkmq0PNhx+NYPoCaE8JQX04IYzE+p/LodPlkK4W62L6Lhz4zmnQFP/1AkWYeVW
	V185GrseFfCqSGobBw==
X-Received: by 2002:a05:600c:6215:b0:49f:ff32:8044 with SMTP id 5b1f17b1804b1-4a18e47a88fmr41977265e9.7.1791565042227;
        Fri, 09 Oct 2026 09:57:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm70667395e9.4.2026.10.09.09.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:57:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/5] power: sequencing: renesas-pwrrdy: Add RZ/V2H(P) and RZ/V2N A/D converter support
Date: Fri,  9 Oct 2026 17:57:09 +0100
Message-ID: <20261009165710.1320233-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/V2H(P) and RZ/V2N, the SYS_ADC_CFG.SY_MSTP_ADA bit controls
A/D converter power-down. RZ/V2H(P) has a single A/D converter unit,
while RZ/V2N has three units sharing the same bit.

Add an "adc" power sequencing target for these SoCs and match it to the
RZ/V2H(P) ADC compatible, which is also used as the fallback compatible
by RZ/V2N.

Clear SY_MSTP_ADA when the first A/D converter unit is enabled and set it
again when the last unit is disabled. Wait 20 us after clearing the bit
before allowing conversion to start, ensuring ADCLK has been running for
the required time.

Bind the power sequencer to the RZ/V2H(P) and RZ/V2N auxiliary devices
created by the SYS driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Passed targets and match pointer info.
---
 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
index 158ee5c6432d..40760977f7de 100644
--- a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
+++ b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pwrseq/provider.h>
@@ -15,11 +16,68 @@
 #define SYS_PWRRDY_N_DSI_MASK	BIT(1)
 #define SYS_PWRRDY_N_CSI_MASK	BIT(2)
 
+#define RZV2H_SYS_ADC_CFG		0x1600
+#define RZV2H_SYS_ADC_CFG_SY_MSTP_ADA	BIT(0)
+/* Minimum time with ADCLK running after leaving power-down mode */
+#define RZV2H_ADC_POWER_UP_US		20
+
 struct pwrseq_rz_info {
 	const struct pwrseq_target_data **targets;
 	pwrseq_match_func match;
 };
 
+static int pwrseq_rzv2h_adc_enable(struct pwrseq_device *pwrseq)
+{
+	struct regmap *regmap = pwrseq_device_get_drvdata(pwrseq);
+	int ret;
+
+	ret = regmap_clear_bits(regmap, RZV2H_SYS_ADC_CFG,
+				RZV2H_SYS_ADC_CFG_SY_MSTP_ADA);
+	if (ret)
+		return ret;
+
+	fsleep(RZV2H_ADC_POWER_UP_US);
+
+	return 0;
+}
+
+static int pwrseq_rzv2h_adc_disable(struct pwrseq_device *pwrseq)
+{
+	struct regmap *regmap = pwrseq_device_get_drvdata(pwrseq);
+
+	return regmap_set_bits(regmap, RZV2H_SYS_ADC_CFG,
+			       RZV2H_SYS_ADC_CFG_SY_MSTP_ADA);
+}
+
+static const struct pwrseq_unit_data pwrseq_rzv2h_adc_unit = {
+	.name = "adc-power-sequence",
+	.enable = pwrseq_rzv2h_adc_enable,
+	.disable = pwrseq_rzv2h_adc_disable,
+};
+
+static const struct pwrseq_target_data pwrseq_rzv2h_adc_target = {
+	.name = "adc-power",
+	.unit = &pwrseq_rzv2h_adc_unit,
+};
+
+static const struct pwrseq_target_data *pwrseq_rzv2h_targets[] = {
+	&pwrseq_rzv2h_adc_target,
+	NULL
+};
+
+static const char * const pwrseq_rzv2h_compats[] = {
+	"renesas,r9a09g057-adc",
+	NULL
+};
+
+static int pwrseq_rzv2h_match(struct pwrseq_device *pwrseq, struct device *dev)
+{
+	if (of_device_compatible_match(dev->of_node, pwrseq_rzv2h_compats))
+		return PWRSEQ_MATCH_OK;
+
+	return PWRSEQ_NO_MATCH;
+}
+
 static int pwrseq_rzg3l_set_pwrrdy(struct pwrseq_device *pwrseq, u32 mask,
 				   bool val)
 {
@@ -133,7 +191,20 @@ static const struct pwrseq_rz_info pwrseq_rzg3l_info = {
 	.match = pwrseq_rzg3l_pwrrdy_match,
 };
 
+static const struct pwrseq_rz_info pwrseq_rzv2h_info = {
+	.targets = pwrseq_rzv2h_targets,
+	.match = pwrseq_rzv2h_match,
+};
+
 static const struct auxiliary_device_id pwrseq_rzg3l_pwrrdy_id_table[] = {
+	{
+		.name = "rz_sysc.r9a09g056-pwrseq",
+		.driver_data = (kernel_ulong_t)&pwrseq_rzv2h_info,
+	},
+	{
+		.name = "rz_sysc.r9a09g057-pwrseq",
+		.driver_data = (kernel_ulong_t)&pwrseq_rzv2h_info,
+	},
 	{
 		.name = "rz_sysc.pwrseq-pwrrdy",
 		.driver_data = (kernel_ulong_t)&pwrseq_rzg3l_info,
-- 
2.55.0

