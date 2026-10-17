Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34CB3D904C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210664; cv=none; b=rVAbrsEmxneuJaNppXzZHjtBjDmnskKNlwmsGmj/FDlFF/N5d2jPmZ4vp/KzAP92gfVe5idfgrpKIEGf1e57u7fcpugLJJPtU1j/5W8k/MvKMWRQ5bzPofS9pUn5E/Phf1K7eauuGG6AGHZX76p+tbrh5T8ycKRrJUH/m8C946I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210664; c=relaxed/simple;
	bh=ssOnPoaE7XQ12PG+oKJemRa6BALjXKzZFHhUDHvPFKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NNx2oQ315tC5JQNX5paNIMaaBheEW4SGfdSqHo+T+LDypcW+/V48Bi5VxHRbnJIBpy46End4zNzjBko2tJIBFLyPi5Vs6ppu0Qf2FUokDq+NjfxIBkjY8vNONLGPGU/ba1cKK+vGA+9SZoQDTpAV+YvvYiK9tga2BxGU5IToVfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtDnVZy+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SltqBFKX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtDnVZy+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SltqBFKX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H3Pq1X4134451
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QnYl0yZRVPO
	gMVYXy+G0YJRx73FHQQiXmwwHhcUoJxo=; b=AtDnVZy+SDjS2lAzXDMRWP5EWMK
	PiompGSgwP5a7wPCWbEcG1jAacrKF07pl7uGkLYshDXmCN7Cy+Gp+v8Kr8m9uZZJ
	bpnc3mLbEyfC47EtsEZ1wdsX/hfADSn4WBUWZML6UhYjQIMbpenLrE5jnWaPVuVq
	MfQ8FfyE5fbrZvItIqy9COXyXDt+0zWVAHdiGFIyqhYjpU1zbr2bZXoMoAadlraD
	czQtYz8xC2jcR5P0SFmzNcNopMizycgIbL+itR7mcwO8nywfRuiA0adyULNpmhDb
	ofYrVbyy6prYpwEihI2n4mnLM2d12sLE/Xz1VBvOsJZ381ZGgwkNVYM99/Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc13ur357-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:17:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1479064eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792210659; x=1792815459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QnYl0yZRVPOgMVYXy+G0YJRx73FHQQiXmwwHhcUoJxo=;
        b=SltqBFKXQHrFC44lwpQiT7o3Q9KfRRFqwqsBlDDvlL/QM+7kXJgoJ8rgTj5znAIFSw
         bbuz08z/PVGpBwMhJn/u2B/FlRmakYMvOA3k4IVJ4M2NAd9PW4pmdHk73jT3Q2J518mW
         MIrU6guA6O1fyhHaB8lHhQ+Lqpxu5vRmPPrFmSx2AmNZTpt81aH5Psbe5kKhdEq3b+8G
         JK6V+YpyOxMtTEH6APORjZbEr/o4zwsjxnY/L9v9LLr27jw4+Q99/Kns/Oo08YCe/4rP
         +cWFjCI5kHco1Pmw8Qfi9g8hE24Kg33v7+SCL2k0AzjFvTitaBpF4q4mzQr01qJoc0zf
         2Ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792210659; x=1792815459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QnYl0yZRVPOgMVYXy+G0YJRx73FHQQiXmwwHhcUoJxo=;
        b=JU9zGfZZEPDrbMQ7rSZiamd2D1QewXRLtS6BLPV9iDxlGYNiegvOjpZRv5M3XAp/I+
         EMWkOsye2dqZHhGFtbIq/IUQtfS+UwW5IV6lrfFn8lBrQCrNnaaC3vOKVHt9eFUC0WTi
         xXSFmUS3f6sj0StIrecQmiKWVFSm7vcWGrcawTfSwlWu1fLhnM2vzwPtAjsKumqoVqgx
         FWzR6xB4XpF/6rKr2ILQx98hKW6PDBx42LjRS2S2fU1/Gk4WMpwdAb4RtSniFlPLkfw5
         TPqQoFoxs/xTMSc/cknyWus+mS3JGW/AjajODjtZ+c8OFz/rVWvp9WktRagokF74vBB9
         OvpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx23o05AEZju2YH7etpIYUkKr0Qp2bbVhJwvrgLZFJviCLO+DfSB3qk3SmS1vUIXqCl9jSO5oAUqWwlx4=@vger.kernel.org
X-Gm-Message-State: AFq9FYILrgd9NLNs8kSzrWw8ytLX7scJpL12GM8MPY/0n7vNw4Cu+R3P
	CQPgS77IFwqAOKQs5FzbJeR0DaTqPPDNUuDBqPQDEa8JfJeKJ/4xCxgjER/98W02QPpNoBhuCWx
	wguB0NFT1TXBV5rAyOvC4I823g8SjvkSwsZ/R8VquVeYKimVnT6bjnphC2LuHGUpre5M=
X-Gm-Gg: AYBFou0X+EZClZFwMzeZRBo2aIYvyOmh54V8GFQ4TSz6tSX0v3qHt5/aOhyPkUgMoac
	+hgt7BUIETGXHH9apJb6V4c/ta6IyK+KDUBFkf1m0DZEgi9TmYP4VXgyItnYY7HnJ5S8ixmOAIT
	OJ7KmTtiJRoeeL5iUgjSroIQsSaPlURywH3EsDxWbjBHkNKd9YOxUcTR3B1NtuopoVkmeOSniD5
	J2yoz096O4T36qGvcdMYA+pzpZp8lUXw7L0wcaPrYWVBmvWd0jNKB7Rcb1LF0GghU9DuTVFkqfN
	HVI+uqtM2IWKBQtQVPJfZ0EXaJYMSZEHiJkKn0d4TVKZyLDYK3t+twgYF4AsbHt0OWlcvtfHIN9
	RmrhJapnjDxjYFzMTli2CLreZXYiztY+ohgtGZRoh7bY8S8PuE+svZA==
X-Received: by 2002:a05:7301:380a:b0:35a:ca1e:4d82 with SMTP id 5a478bee46e88-361a1c50083mr3057158eec.20.1792210658092;
        Fri, 16 Oct 2026 21:17:38 -0700 (PDT)
X-Received: by 2002:a05:7301:380a:b0:35a:ca1e:4d82 with SMTP id 5a478bee46e88-361a1c50083mr3057110eec.20.1792210657319;
        Fri, 16 Oct 2026 21:17:37 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm10867636eec.18.2026.10.16.21.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:17:36 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
Date: Fri, 16 Oct 2026 21:17:31 -0700
Message-Id: <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ajfRob7hoCJl5N4M0CkBTPmF7ixn3t7R
X-Proofpoint-ORIG-GUID: ajfRob7hoCJl5N4M0CkBTPmF7ixn3t7R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX8wfctxUW5sMl
 V3VIwx2r1u2ltYH6LaTL3XQ4G5tY+6r+n7S+1fhNDWU1it2LuL/xizaWQa9onlf2uVWmVX4lYjO
 Dcze+OdkQMTyxbYNEewUrTJ/be28vT4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX2bBb8kuNUsbe
 ynIIaH8g7Ov7v+Nre6UPk9AKByc9/8BQPK1rL/q9raPYa4m/7hG4P9i2umyg7K4dYTFKrQ38Mh5
 yy1xKOYLbo6p2KeyWSm7iPzyj/yonn1bB16XBzEIu6jU6EUolk9/ykwS0rrvxnRAZEeInLff+CQ
 cc2TbTkOcJJRQBfPEXs7mo2/gcufDXZLUrgC0m8evctSYeZ3nA5cSNyqdKZIP37lD5VDj/Inr7J
 nHcTlohud0oAaaKX+ygkoxvyULuUMhj08bWoxiZJfpWOwhZlbMyP9kLHhya6k3kFKbGpe/Uj2X8
 bfCb+Qaw6z0PPseaG9NfnhlEUb89zmbH7wKIylhZ2sleYTS0WOnIfVETz+CP6WvpVjbFIXxECfA
 0svZapAP2CsQ9/v+RSHzsrg4kZF1c5yTfsFFCL0W1GPWMFkIOeBRsX/kw1bpIdY8MLoycTUh0am
 vjKmrYltSUUFIZnYT1Q==
X-Authority-Analysis: v=2.4 cv=SKzXx+vH c=1 sm=1 tr=0 ts=6ad2f6e3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Z_sKr-ctKYL1et_evLUA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170016

Add PHY_MODE_MIPI_CPHY, struct phy_configure_opts_mipi_cphy and three
helpers: phy_mipi_cphy_get_default_config(),
phy_mipi_cphy_get_default_config_for_hsclk() and
phy_mipi_cphy_config_validate(). These mirror the existing MIPI D-PHY
generic configuration API (phy-core-mipi-dphy.c) so PHY providers can
be configured for C-PHY via phy_configure().

C-PHY encodes 16 bits per 7 symbols across a 3-wire trio; the default
config helper derives the required per-trio symbol rate from the pixel
clock, bits-per-pixel and lane (trio) count the same way the D-PHY
helper derives its HS clock rate. The timing fields are filled in from
the MIPI Alliance Specification for C-PHY (v1.0), Table 18 "Global
Operation Timing Parameters"; unlike D-PHY, these are not data-rate
dependent, so phy_mipi_cphy_get_default_config() fills the spec's
minimum values directly rather than computing them from the symbol
rate, and phy_mipi_cphy_config_validate() checks each field against
its spec-defined bound.

No existing phy consumer or provider selects GENERIC_PHY_MIPI_CPHY
yet, so this commit has no functional effect on its own.

Co-developed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/phy/Kconfig               |   9 ++
 drivers/phy/Makefile              |   1 +
 drivers/phy/phy-core-mipi-cphy.c  | 131 ++++++++++++++++++++++
 include/linux/phy/phy-mipi-cphy.h | 177 ++++++++++++++++++++++++++++++
 include/linux/phy/phy.h           |   5 +
 5 files changed, 323 insertions(+)
 create mode 100644 drivers/phy/phy-core-mipi-cphy.c
 create mode 100644 include/linux/phy/phy-mipi-cphy.h

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 19f3b7d12b7d..a6b0749a40cc 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -46,6 +46,15 @@ config GENERIC_PHY_MIPI_DPHY
 	  Provides a number of helpers a core functions for MIPI D-PHY
 	  drivers to us.
 
+config GENERIC_PHY_MIPI_CPHY
+	bool
+	select GENERIC_PHY
+	help
+	  Generic MIPI C-PHY configuration helpers.
+
+	  Provides a number of helper core functions for MIPI C-PHY
+	  drivers to use.
+
 config PHY_AIROHA_PCIE
 	tristate "Airoha PCIe-PHY Driver"
 	depends on ARCH_AIROHA || COMPILE_TEST
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index d7aa516bcc49..a94dc1b352e1 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+= phy-common-props.o
 obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+= phy-common-props-test.o
 obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
 obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
+obj-$(CONFIG_GENERIC_PHY_MIPI_CPHY)	+= phy-core-mipi-cphy.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_ECONET_PCIE)		+= phy-econet-pcie.o
diff --git a/drivers/phy/phy-core-mipi-cphy.c b/drivers/phy/phy-core-mipi-cphy.c
new file mode 100644
index 000000000000..303b9a02f096
--- /dev/null
+++ b/drivers/phy/phy-core-mipi-cphy.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Generic MIPI C-PHY configuration helpers.
+ */
+#include <linux/phy/phy-mipi-cphy.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/math64.h>
+
+/*
+ * C-PHY carries 16 bits per 7 symbols per trio (lane).
+ */
+#define PHY_MIPI_CPHY_SYMBOLS_PER_GROUP		7
+#define PHY_MIPI_CPHY_BITS_PER_GROUP		16
+
+/*
+ * Fill in the C-PHY global operation timing parameters based on the MIPI
+ * Alliance Specification for C-PHY (v1.0), Table 18 "Global Operation Timing
+ * Parameters". These parameters are not data rate dependent (see sections
+ * 6.14.3 and 6.14.4 of that specification), so unlike the D-PHY equivalent
+ * this helper does not need the symbol rate to compute them.
+ */
+static int phy_mipi_cphy_calc_config(unsigned long pixel_clock,
+				     unsigned int bpp, unsigned int lanes,
+				     unsigned long long hs_clk_rate,
+				     struct phy_configure_opts_mipi_cphy *cfg)
+{
+	if (!cfg || !lanes)
+		return -EINVAL;
+
+	if (!hs_clk_rate) {
+		if (!bpp)
+			return -EINVAL;
+
+		/*
+		 * Total payload bits/s = pixel_clock * bpp, spread over the
+		 * active trios. C-PHY carries 16 bits per 7 symbols per trio,
+		 * so the per-trio symbol rate is the bit rate scaled by 7/16.
+		 */
+		hs_clk_rate = (unsigned long long)pixel_clock * bpp;
+		hs_clk_rate = DIV_ROUND_UP_ULL(hs_clk_rate *
+						PHY_MIPI_CPHY_SYMBOLS_PER_GROUP,
+						(unsigned long long)lanes *
+						PHY_MIPI_CPHY_BITS_PER_GROUP);
+	}
+
+	cfg->lanes = lanes;
+	cfg->hs_clk_rate = hs_clk_rate;
+
+	cfg->t3_prepare = 38000;
+	cfg->t3_term_en = 0;
+	cfg->t3_settle = 95000;
+	cfg->t3_hs_exit = 100000;
+	cfg->lpx = 50000;
+	cfg->init = 100;
+	cfg->ta_get = 5 * cfg->lpx;
+	cfg->ta_go = 4 * cfg->lpx;
+	cfg->ta_sure = cfg->lpx;
+	cfg->wakeup = 1000;
+
+	return 0;
+}
+
+int phy_mipi_cphy_get_default_config(unsigned long pixel_clock,
+				     unsigned int bpp, unsigned int lanes,
+				     struct phy_configure_opts_mipi_cphy *cfg)
+{
+	if (!bpp)
+		return -EINVAL;
+
+	return phy_mipi_cphy_calc_config(pixel_clock, bpp, lanes, 0, cfg);
+}
+EXPORT_SYMBOL_GPL(phy_mipi_cphy_get_default_config);
+
+int phy_mipi_cphy_get_default_config_for_hsclk(unsigned long long hs_clk_rate,
+					       unsigned int lanes,
+					       struct phy_configure_opts_mipi_cphy *cfg)
+{
+	if (!hs_clk_rate)
+		return -EINVAL;
+
+	return phy_mipi_cphy_calc_config(0, 0, lanes, hs_clk_rate, cfg);
+}
+EXPORT_SYMBOL_GPL(phy_mipi_cphy_get_default_config_for_hsclk);
+
+/*
+ * Validate C-PHY configuration according to the MIPI Alliance
+ * Specification for C-PHY (v1.0), Table 18 "Global Operation Timing
+ * Parameters".
+ */
+int phy_mipi_cphy_config_validate(struct phy_configure_opts_mipi_cphy *cfg)
+{
+	if (!cfg || !cfg->lanes)
+		return -EINVAL;
+
+	if (cfg->t3_prepare < 38000 || cfg->t3_prepare > 95000)
+		return -EINVAL;
+
+	if (cfg->t3_term_en > 38000)
+		return -EINVAL;
+
+	if (cfg->t3_settle < 95000 || cfg->t3_settle > 300000)
+		return -EINVAL;
+
+	if (cfg->t3_hs_exit < 100000)
+		return -EINVAL;
+
+	if (cfg->lpx < 50000)
+		return -EINVAL;
+
+	if (cfg->init < 100)
+		return -EINVAL;
+
+	if (cfg->ta_get != 5 * cfg->lpx)
+		return -EINVAL;
+
+	if (cfg->ta_go != 4 * cfg->lpx)
+		return -EINVAL;
+
+	if (cfg->ta_sure < cfg->lpx || cfg->ta_sure > (2 * cfg->lpx))
+		return -EINVAL;
+
+	if (cfg->wakeup < 1000)
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phy_mipi_cphy_config_validate);
diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mipi-cphy.h
new file mode 100644
index 000000000000..7627602eb57f
--- /dev/null
+++ b/include/linux/phy/phy-mipi-cphy.h
@@ -0,0 +1,177 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef __PHY_MIPI_CPHY_H_
+#define __PHY_MIPI_CPHY_H_
+
+#include <linux/types.h>
+
+#define PHY_MIPI_CPHY_MAX_DATA_LANES	4
+
+/**
+ * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
+ *
+ * This structure is used to represent the configuration state of a
+ * MIPI C-PHY phy. The timing fields are named after their symbol in
+ * the MIPI Alliance Specification for C-PHY (v1.0), Table 18 "Global
+ * Operation Timing Parameters", and are all time values in picoseconds
+ * (microseconds for @init and @wakeup) that are not data rate dependent
+ * (see Table 18 and sections 6.14.3/6.14.4 of that specification).
+ */
+struct phy_configure_opts_mipi_cphy {
+	/**
+	 * @lanes:
+	 *
+	 * Number of active C-PHY trios (data lanes).
+	 */
+	unsigned int		lanes;
+
+	/**
+	 * @hs_clk_rate:
+	 *
+	 * High speed symbol rate in symbols/s derived from link rate.
+	 *
+	 * C-PHY encodes 16 bits per 7 symbols across a 3-wire trio.
+	 * Consumers fill this from the sensor link frequency and hand
+	 * it to phy_configure().
+	 */
+	unsigned long		hs_clk_rate;
+
+	/**
+	 * @lane_positions:
+	 *
+	 * Physical-to-logical trio (data lane) position mapping. Entry @i
+	 * gives the physical lane position carrying logical trio @i. C-PHY
+	 * has no clock lane, so all entries map data trios only.
+	 */
+	unsigned char		lane_positions[PHY_MIPI_CPHY_MAX_DATA_LANES];
+
+	/**
+	 * @lane_polarities:
+	 *
+	 * Polarity (0 = normal, 1 = swapped) of each logical trio. Entry
+	 * @i corresponds to logical trio @i.
+	 */
+	bool			lane_polarities[PHY_MIPI_CPHY_MAX_DATA_LANES];
+
+	/**
+	 * @t3_prepare:
+	 *
+	 * Time, in picoseconds, that the transmitter drives the
+	 * 3-wire LP-000 line state immediately before the HS_+x line
+	 * state starting HS transmission.
+	 *
+	 * Minimum value: 38000 ps
+	 * Maximum value: 95000 ps
+	 */
+	unsigned int		t3_prepare;
+
+	/**
+	 * @t3_term_en:
+	 *
+	 * Time, in picoseconds, for the slave to enable the HS line
+	 * termination, starting from the time point when the A, B
+	 * and C wires cross VIL_MAX.
+	 *
+	 * Maximum value: 38000 ps
+	 */
+	unsigned int		t3_term_en;
+
+	/**
+	 * @t3_settle:
+	 *
+	 * Time interval, in picoseconds, during which the HS receiver
+	 * should ignore any HS transitions on the lane, starting from
+	 * the beginning of @t3_prepare.
+	 *
+	 * Minimum value: 95000 ps
+	 * Maximum value: 300000 ps
+	 */
+	unsigned int		t3_settle;
+
+	/**
+	 * @t3_hs_exit:
+	 *
+	 * Time, in picoseconds, that the transmitter drives LP-111
+	 * following an HS burst.
+	 *
+	 * Minimum value: 100000 ps
+	 */
+	unsigned int		t3_hs_exit;
+
+	/**
+	 * @lpx:
+	 *
+	 * Transmitted length, in picoseconds, of any low-power state
+	 * period.
+	 *
+	 * Minimum value: 50000 ps
+	 */
+	unsigned int		lpx;
+
+	/**
+	 * @init:
+	 *
+	 * Time, in microseconds, for the initialization period to
+	 * complete.
+	 *
+	 * Minimum value: 100 us
+	 */
+	unsigned int		init;
+
+	/**
+	 * @ta_get:
+	 *
+	 * Time, in picoseconds, that the new transmitter drives the
+	 * Bridge state (LP-000) after accepting control during a
+	 * link turnaround.
+	 *
+	 * Value: 5 * @lpx
+	 */
+	unsigned int		ta_get;
+
+	/**
+	 * @ta_go:
+	 *
+	 * Time, in picoseconds, that the transmitter drives the
+	 * Bridge state (LP-000) before releasing control during a
+	 * link turnaround.
+	 *
+	 * Value: 4 * @lpx
+	 */
+	unsigned int		ta_go;
+
+	/**
+	 * @ta_sure:
+	 *
+	 * Time, in picoseconds, that the new transmitter waits after
+	 * the LP-100 state before transmitting the Bridge state
+	 * (LP-000) during a link turnaround.
+	 *
+	 * Minimum value: @lpx
+	 * Maximum value: 2 * @lpx
+	 */
+	unsigned int		ta_sure;
+
+	/**
+	 * @wakeup:
+	 *
+	 * Time, in microseconds, that a transmitter drives a Mark-1
+	 * state prior to a Stop state in order to initiate an exit
+	 * from ULPS.
+	 *
+	 * Minimum value: 1000 us
+	 */
+	unsigned int		wakeup;
+};
+
+int phy_mipi_cphy_get_default_config(unsigned long pixel_clock,
+				     unsigned int bpp, unsigned int lanes,
+				     struct phy_configure_opts_mipi_cphy *cfg);
+int phy_mipi_cphy_get_default_config_for_hsclk(unsigned long long hs_clk_rate,
+					       unsigned int lanes,
+					       struct phy_configure_opts_mipi_cphy *cfg);
+int phy_mipi_cphy_config_validate(struct phy_configure_opts_mipi_cphy *cfg);
+
+#endif /* __PHY_MIPI_CPHY_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index c480d6cb42c5..f12337834031 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -19,6 +19,7 @@
 #include <linux/phy/phy-dp.h>
 #include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
+#include <linux/phy/phy-mipi-cphy.h>
 #include <linux/phy/phy-mipi-dphy.h>
 #include <linux/phy/phy-thunderbolt.h>
 
@@ -42,6 +43,7 @@ enum phy_mode {
 	PHY_MODE_PCIE,
 	PHY_MODE_ETHERNET,
 	PHY_MODE_MIPI_DPHY,
+	PHY_MODE_MIPI_CPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
 	PHY_MODE_DP,
@@ -69,6 +71,8 @@ union phy_notify {
  *
  * @mipi_dphy:	Configuration set applicable for phys supporting
  *		the MIPI_DPHY phy mode.
+ * @mipi_cphy:	Configuration set applicable for phys supporting
+ *		the MIPI_CPHY phy mode.
  * @dp:		Configuration set applicable for phys supporting
  *		the DisplayPort protocol.
  * @lvds:	Configuration set applicable for phys supporting
@@ -78,6 +82,7 @@ union phy_notify {
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
+	struct phy_configure_opts_mipi_cphy	mipi_cphy;
 	struct phy_configure_opts_dp		dp;
 	struct phy_configure_opts_lvds		lvds;
 	struct phy_configure_opts_hdmi		hdmi;
-- 
2.34.1

