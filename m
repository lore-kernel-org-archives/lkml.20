Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F04908CA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045308; cv=none; b=RKDQI6Jj6t8XR1OZgus15pupy03dMxwrxMKV2/AoaW9FGkKQpgDLz3Lu74/EixHB7jnlvec8/BLhUyoBEFGj38h4d6fzaDj9tc80O1+Z0caIxZq8BzqbZXTqw/EoUt2JbsWekw9QrTMnUsgurfCqRzRKlY2+tzZhRGA5uFm1I5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045308; c=relaxed/simple;
	bh=vd5H/xImeYjTu+utvQUws4xVG15wDIeOJYRAn2MwOYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pE/Pug/4avh91QqbNViGXN8GNJKXvh8yCy2YHUQaVtYvzNQTMlQulotXsYTi+I1mViDkP24d/8oMHCIpb8bXKTfjEpYMIHtYr4KZHhGR/EgLDIwsSnQH0ZRHN35vZZKrNPyiGsB27d+lZQxBbFtCsB23Yzzk03hAyS80G/bq0ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0QILee/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=klVZa0gT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0QILee/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="klVZa0gT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ehm1440462
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GDqvvL/QEdH2j6dVRoAeWH/JNTn7jK0fTxmvAeyTbL8=; b=L0QILee/qYEroYHm
	UD5gCIyOR8HuSKn8QM+OCwI+ccQ6/H4lchBi1Y3UnTv4DHe1+X1gppkuf4Xlao/B
	xW/+f0EGwlwxtgB9VxAlHTLj+SBZlAMfQGWOlnGsgzlxQAtCknTJc+bBQs9ovI3b
	qaQldVOrHb9u/FSLDypTbY2GC215M74e3/kLEclrnErMR+xdoLLStd6lD6f4UYIv
	b0ILllt0YqPpCdc6Jhc5KFQ3ygGklIA+bjrO2FO/JDApQlzXqxwSy33hSJbuwwD0
	97vdfg2NXG7ogNZMhMVW6jqXNbfcVRHHqGxXFUlm/DrJCMMIIhRGJth0XOdAJZw4
	mNDnzA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvsbay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e9e2deaa4so5181830241.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045304; x=1789650104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDqvvL/QEdH2j6dVRoAeWH/JNTn7jK0fTxmvAeyTbL8=;
        b=klVZa0gTzmlQatxV3ZjOnA2XZboX1cvrNoq050/FGBCs7ly514Pj/ha8dO0gwW1OHH
         S/dT3/QHrCf4CQ8LSUJ0zdDI0OVPAEWv+Tc0yYO3Zp3u3zMV0Yi7WmBTYL904lneMHUa
         9pOIM4ypmlYzfJoT2kzHxlE1RUiXImrI5WajGEceBsbXCb9vwkBJWhLFwZ8HvLkEFmuW
         x7nLSmTcTm1KSCZ9CJYf1XbUT1N5CxSjhWMKo6NNSMAo+Pv8Usq9uhFVAaP2KhXfrtDl
         EtuNCvp8By5eoX+MWb5A7MybqL5AovhN8Db8o23K0YSnMcV83/jlC5DPZQYDDHZfIS0i
         jWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045304; x=1789650104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDqvvL/QEdH2j6dVRoAeWH/JNTn7jK0fTxmvAeyTbL8=;
        b=aFWeeTJa88lyuu8zrgHXtIIAMmcP3ilpRhstpoE1XSBcZzF03qTl9EH9KWBwXIBMJa
         gVD7ScBvEYVru0Up2MYGAu483Pm9ziZVQ/B8IYaqy4MlT4Y4OnhqBjYBKnlivSiEzlrk
         m3PErv76CwPrqNPFTo4MDSzz5ndgF5/2B2l0SSCtMpZk2KHufDMlBCcsfhQ4l0z+cOCB
         5g9dstNeDgjH54ZHtUMarsIEBerPGoVN32KSZH+JlCEniSh/z2urk3OKedZZzhsw66J3
         5OpXwjMhaE9U1y1+sxM1OuXsJhIKtSf4V5kYRazYCG/gSPgR5NDAo8XwJY1s1MkQhp5O
         xeHA==
X-Forwarded-Encrypted: i=1; AKwUvBy1Eo9eQh0pb1ltESfgeUzD9Rqlf6T+ai3CJaP80kV0rT/kY5xNPlhNszGh+QOsa36Q1FAwBOzMc/dfTDU=@vger.kernel.org
X-Gm-Message-State: AFuF++kZUp0KQryi0d3VFuwxd1JRxlTWvAUvbI0+0LF7rHflRYUKB6rz
	RUPzyAppghx0NF0WJfv3kVa//BVpzxx0lAE/yo5KpcJPBDMeTAmkL+FCV9MDsF38uwImwdRgDWF
	pSWIgBICSO3l9zt9OfHdU0qc8Uu8RQCHdiJ8VtA4a4JgVqcAbqlnr1lmdrl9zG3yh22Q=
X-Gm-Gg: AYBFou20deXhUlPk6LEiC6Ko/H8TMGCS6fBWIjKsX9+Nb1avC2w749zclRmT+SEbOcD
	RuWJ/04m5E7cg7B8vD/+ln9nh/WYlQgJFpi6VR4eWiiQOuCaUNlasB7eu5rxdSZFe62sAmPQ98Z
	rqcA0xfxNWw9BQEPig3g9GY5bbJRmETEFq/eSqB2NUIojrAbSDHqdIsangYTCw3cHXgIeJrDkvA
	P6776JIZU0D7WvBQxLgF6puhW/R/sAfLKoQDJSRNFERYbYhFc+TYQOZSq5ftEIZUzxIDacWSBPk
	S63hkyE7vg1VZ5+fahRxz98yNbt0IpoQltj8adXDaM6r9D3NRFVs+KbxL4r/y2GxkzUVrjgPyqf
	pzG/40TjDKmh2ISfuon65TvaeATu/
X-Received: by 2002:a05:6102:3749:b0:785:eb33:87aa with SMTP id ada2fe7eead31-78a4a8b86a5mr21080232137.5.1789045303894;
        Thu, 10 Sep 2026 06:01:43 -0700 (PDT)
X-Received: by 2002:a05:6102:3749:b0:785:eb33:87aa with SMTP id ada2fe7eead31-78a4a8b86a5mr21080083137.5.1789045303344;
        Thu, 10 Sep 2026 06:01:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:52 +0200
Subject: [PATCH v7 11/12] soc: qcom: add core driver for the Qualcomm
 Crypto Engine
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-11-cdbd2718af14@oss.qualcomm.com>
References: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
In-Reply-To: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4666;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vd5H/xImeYjTu+utvQUws4xVG15wDIeOJYRAn2MwOYc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoT35CZ4eehx49YjHnh/6a082Rh7gDPBnbUL
 1umZuNkNRWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqEwAKCRAFnS7L/zaE
 w444EACvnPRKkbmYvqi8DeAM+zuAchJXGVFB521fQLC5pFWwpg7gr4ciV7x3lje/lsUQqtly2vH
 BPN989WtEVDOeAdd+pKqgV6dE3CYrPqHIyTsQ6P2EPkKt04mQLF/lHPd7HWIrC9aI5sFJhmZaSC
 J425A0H1U0dSFSP+xbKCueu9+ZMp5+pcArM19D8rDV8MboVYCwxHzY14X+fgVKeFBPwXG5xvCyJ
 iSzyrQbo9eMZdLi3zKz0GSw40fPRBOrshO+bzBP8Oz2NdRyXLXWmw0hnXjESxCN0xMkXjCYQVk9
 5VpzCCpAz5HIx0l3VqToA6J29oMdLPVcbD5HzCiSuXEr+ynfODimjMZOnOzUBNN1HEMYJoB+CrD
 Nj9HgO8oaOk4fnafcx5CtCKm8sa+FXcPPAyQaFzeyBuVN4amkH6BTrLpSqxHwCiztvOJDBlVoUu
 P9nrAzOWHPJQT1wUkc7/fqcV0TcTesQDDp6rnTxtLkLyYYsetJ3oil+Kr4Wy/YqbDD4I5TVKG8v
 k13NhaGBauv7L0N6xRA6z8wRpGRxBZiu1BApo6Z3OEunnGbpfaIUWZ0wKHpI2xChpQDAPKuYk+P
 dbG0DxluvhpVaDmIZuZeJ31yWXdT/xv0YVTVZNhmOB4nXEKZjfH70cgG3Hj5UO+v7KeFqtx3hAy
 JlsB4wrGPA6d63A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2aa38 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=jMd-nSem81Ez8mwE2NwA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX6MrI2o1eTSDQ
 XpLgbXYjMUiGzdYzXuNAQ3PVVwIKDVYwk33h5Bf+NTd27qRLcdXZAd4gfYUgGYMpDaiXr/7r+oV
 Ney1JvB0YrruQdu+vJ/32JoAln7M9NygD9X3zgOmltYNAHrYMKg4h5pTKWX0K4aQvjJxrDmvM9z
 bHEaS7jZZbX0KQg37N+8YVCOXjGo3pyB+6+SBfJXlQx4MKrxwzlBmuycUer6ur6vpL+hdYQVLGA
 6YFhSWPn93+djTL+TVfvkW77dck4S0ON4vLuuButJ63BJElPU4V0za+hqll70VSXILieJ/J0bt3
 U8xRcgGXWZeVPFnSSioONKCu00dw5gGs3USUgK68JQWyH8LDzmUxWE2h2lYYLRZ4O0OzcFxKLLv
 xW8pneVDZmMEyV82wY1ETVFJCEYwgjKFzT/5J553M71ktQ9RLtrIrAB7zksmoM0cBldkwBrcmqq
 CiI860hUhIWtsrq0ffQ==
X-Proofpoint-ORIG-GUID: AR5HSoaVwhMshAvDFDluUAJXQ8ukhOS8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfXxtrsDZXpIntY
 R9pOfiD4AlZy9NL110jnwhGM/HQsPj0GZpy4Ydv0f26oqOr2bGRNerMa8qsWz8QAMBZkWYh/aqV
 PdC71+Hm5tGY51iTX45EvhlFmsZXC0E=
X-Proofpoint-GUID: AR5HSoaVwhMshAvDFDluUAJXQ8ukhOS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100156

Add the core driver for the Qualcomm crypto engine. Its task is to bind
to the qce DT node, set up runtime PM for interconnect down-scaling and
register the auxiliary device using the crypto accelerator driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig    | 11 ++++++
 drivers/soc/qcom/Makefile   |  1 +
 drivers/soc/qcom/qce-core.c | 87 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 9f703261d7ac6ccde861b8d29626025bcfdbda8c..81c6634e855be23698591da6d3743ef68b516006 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -121,6 +121,17 @@ config QCOM_PMIC_GLINK
 	  Say yes here to support USB-C and battery status on modern Qualcomm
 	  platforms.
 
+config QCOM_CRYPTO_CORE
+	tristate "Qualcomm Crypto Engine core driver"
+	depends on PM
+	select AUXILIARY_BUS
+	help
+	  Core driver for the Qualcomm Crypto Engine. Say yes here to enable
+	  the top-level driver that binds to the devicetree node representing
+	  the QCE, registers the sub-devices implementing actual QCE
+	  functionalities and sets up runtime PM allowing the interconnects to
+	  scale down.
+
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
 	help
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 798643be3590cc8303854658fd483b7807d2230f..33dfef07e7db2c0488b14c78f098afebf689d013 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
 CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
+obj-$(CONFIG_QCOM_CRYPTO_CORE)	+= qce-core.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
diff --git a/drivers/soc/qcom/qce-core.c b/drivers/soc/qcom/qce-core.c
new file mode 100644
index 0000000000000000000000000000000000000000..a7f8acb606cdd6645e0bf1b3352798e439209d57
--- /dev/null
+++ b/drivers/soc/qcom/qce-core.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define QCE_DEFAULT_MEM_BANDWIDTH 393600
+
+static int qce_core_probe(struct platform_device *pdev)
+{
+	struct auxiliary_device *auxdev;
+	struct device *dev = &pdev->dev;
+	struct icc_path *mem_path;
+	int ret;
+
+	mem_path = devm_of_icc_get(&pdev->dev, "memory");
+	if (IS_ERR(mem_path))
+		return PTR_ERR(mem_path);
+
+	dev_set_drvdata(dev, mem_path);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	PM_RUNTIME_ACQUIRE(dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	auxdev = __devm_auxiliary_device_create(dev, "qce", "crypto", NULL, 0);
+	if (IS_ERR(auxdev))
+		return PTR_ERR(auxdev);
+
+	return 0;
+}
+
+static int qce_core_runtime_suspend(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, 0, 0);
+}
+
+static int qce_core_runtime_resume(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
+			  QCE_DEFAULT_MEM_BANDWIDTH);
+}
+
+static const struct dev_pm_ops qce_core_pm_ops = {
+	RUNTIME_PM_OPS(qce_core_runtime_suspend, qce_core_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static const struct of_device_id qce_core_of_match[] = {
+	{ .compatible = "qcom,crypto-v5.1", },
+	{ .compatible = "qcom,crypto-v5.4", },
+	{ .compatible = "qcom,qce", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qce_core_of_match);
+
+static struct platform_driver qce_core_driver = {
+	.probe = qce_core_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = qce_core_of_match,
+		.pm = pm_ptr(&qce_core_pm_ops),
+	},
+};
+module_platform_driver(qce_core_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm crypto engine core driver");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");

-- 
2.47.3

