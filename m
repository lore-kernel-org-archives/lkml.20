Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA82B4B0481
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402774; cv=none; b=cBgBmZS3V5pCWX/OhMfKVmMAXqytMbdWsO54rXCpPYnWX5h/FNR3G0WPPx4B+IGZV2kBIS23uNx5Qc3Xak/091lGnHOCidpM9Hr8IDDbyKJagkS8vZD89jJftVPLRxp1G9zgwimC7kccP/jkG5+LARAgKkUpICiwv/LvpNQdUQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402774; c=relaxed/simple;
	bh=DOxW57gGNe3KIgyfoStMcEagGHr/l7F1qoTzjRQFJ+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmUjKrx71ZTUxArDsmmxryQiuMk28CBQUgc93GIGC8LQREi0XZ5n2STJFDZuJ3Xl88prx3g961baL55FroCZIwaCnoK/Tez7mLC7rVie12z6nel+vWI1VHxMWVWqHX8o7hUoeW9AKe99pWyBFtP5S4zck4DYG4koFmQ3rLGX9T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8bUtb8y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3mIBztx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8bUtb8y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3mIBztx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OtnN3256624
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZVc5yK4aj2x
	++CU5m24PZHvPUSDXx2MOqUQkc7ptteQ=; b=B8bUtb8yOcXT4Rvr+GX1h00uv1J
	raA0AL6ql+gYYdcMea5sXpLT5RF4NFguA6Jqbp53jbkp8D3XZGyivL0O4lb/TPMQ
	wkx0sgeuocJChwq8+R/hDXicvG1vW4BK78WsFBC1rOI5fX4pcpc+1rGsipLS5DtN
	gZjvKEApw8U4z/CAXgYPEaXw6AHhNunbFJQl0mrQJL3VS2JH2HS6Ea11TB7gdoSa
	SGGoWGqVK3pTsfjY/KxJ4wjlyJZjEdEKpOHAkrowlwmEXsBQ7aA/3VcRFnSXs0DD
	lTs3PbWgsDtiYT88LhnsOZiuYgqAXQ/kH6TqiY2KezLYJ2OckQuekgGoQXA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8e7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:39:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac94f8df66so615907a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792402771; x=1793007571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVc5yK4aj2x++CU5m24PZHvPUSDXx2MOqUQkc7ptteQ=;
        b=S3mIBztx1nG3qpLNFjaYfXtYZeNs+pRGFaM4pcLFpfji2ANc716ZyVDPtEj/eOV0D9
         qBEk/biQDAZMPUazo+fl6NQOJdXNgRdKcJ8kK+IxRLW0VHLFKHu/QKjD8pPmr0qv2gLi
         t1BPTkAlKlwj7aaUUVptSov9CMCYKgZ0isvrvAobvC6KVbROTR5KziiVcR/EEv8PapeZ
         mj5FzmDWHLxWRG2Jk9wjE1ErdVo65cNDQbpIqsMAZ/HAacUIaynuFAfptPwxCXMjgp9W
         tdO8KpNa8HDSAiWVc9axHKPDDMbV67LjxxniBieaFX/IRXH/ZD8mn8m68u7BAKs+kYjJ
         Wjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402771; x=1793007571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVc5yK4aj2x++CU5m24PZHvPUSDXx2MOqUQkc7ptteQ=;
        b=K98+yFWhxowfzKDBC6XAg4xIYtRAHWPtuHCYcPVUPIN8tSv7nHqQQp2Nfhyj0zogUH
         4P4Ch94ysgJDMfcXBnrjFehuJLB1GcPGAfnk2V9AipngFidIGCX1X0glkM8p9Q1I7K4R
         OMa8B++54BxiV3wPOOSmjd4WYmnHr4bsq1CcHhY+17OAB+R53S82D+QirR5gXGHN2Mls
         50qolHTpFORXmZhCiI7brvDlnzio+NJ8aeg9yiECpFr0yt1Eq6y7NclT4UBVGGvK2y8y
         X1i5BSnQxIXvfo6gVMiiC6oSIu8Mxku8KnCM5pe1IC01qMWSGrUWkpJoqEkPrj4BldB3
         iKYw==
X-Forwarded-Encrypted: i=1; AKwUvBwa2VBIy0pBbJehgnTV/4q+Bl1Dxw1CdPqNzHzmTdUPyemVDeR3QpOMRSqA36jaxRQT2RvTO3xMq0skRgU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiyQQWQyYnryW160eFZ7wM1Po5j/Wb0efC+DUapLuJ/vRNcogG
	+K8BDEABD38ACB4ngdnUEUSKK1PW2Irma58AYOG/ivu/zL0GeEAE+DUzlzVhK3wEUpqDwQ6TzRJ
	elzUSIM+/Ljr6aESLgD5M6IrZJH8scRSV1YwQtL/TxiKeLXsCL+g+wDsHA8OurePvQ3E=
X-Gm-Gg: AYBFou38XerHPN6BgzDJIpgYO+8mcj6sDTnGYtIOg6rdi6dhaGIGH2qSrhrm1Nd0FaE
	sylPSAaXhW7R5sNfIUFc0SreBoFX5rrcttTsF0IMamp4btvEeq52pxZFkMPo4y0wjQxUJvWOEKK
	l81gi2Npd/Rc8jn77RsCHjlJRuYNZuqylc99dtHWaQvRtrSmOIB5Fdl5fiX+xKBTpNlTGR+pFY/
	13vFibMj7Aayfie6x2MJSa9xTA9qX/cMfZOHuG6mYz3WhNBs2AwydQP5RFcGBRaIKunn7bmpfOI
	mbivgaQ9igphnIKl6T/hhSiMtcCW6Xq5MJxN6ofZboomA/y/2bdyx3mUdRsuy+5u2rHS1+dej9h
	lfWjlxRyTTkW6iPXo5cJ2sN8O9IMo
X-Received: by 2002:a17:90b:39ad:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3acee27aa63mr9790906a91.1.1792402771018;
        Mon, 19 Oct 2026 02:39:31 -0700 (PDT)
X-Received: by 2002:a17:90b:39ad:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3acee27aa63mr9790880a91.1.1792402770468;
        Mon, 19 Oct 2026 02:39:30 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm19758688a91.8.2026.10.19.02.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:39:30 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v3 2/3] power: sequencing: qcom-wcn: support SW_CTRL wake
Date: Mon, 19 Oct 2026 17:39:10 +0800
Message-ID: <20261019093911.3199891-3-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gnzNM_3xcpZhJJOfSQEqgIS-D7236yGI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfX/SGhB2H7NDUN
 1NQ6qWrkqsiLQcUFBszKs1TQwT+hBXzqlEuigFppV091pxJk0tuaE0LyKFc3Ijd919pEHhyFfw6
 9BjRKMwGeETZxa4Jcnfe4YMqyiCrUtkX9H6c9VA57OKpTubqY230vdMnWAR2B0E//HM5Diy5fXW
 xpevSUgztR/UVeF3Y05QZ2Q6dYCztq5clXexe1r/MKa9DGNOyMJAhsE/1+T7kLA7IdeSBNUy+tZ
 Mh4rwVd8lBH/vgOLnHLTvrV1KoF8sJxoDSgj/xijjBiwj68SlNU5QUQLb63AluY1PVNXyGg77nl
 AUhLsIbmSGXQ8W6vuklgUCNWzRsf7huEIMKgc1sHoKAGOrp+lnL+TufLJPNhNCa9qkj/pgGrnXU
 QboPVEB9UUYwtsNf9xCE8m+wBtei/5mXxZMz//8vv0dzAWH1XcqVVaUzTyRpGeiDN7+Y2erQqGp
 CzPvOo6w5EUDZ59Wr3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfXzBGcq1wsivPQ
 uL0lihg8b6YAWrgOuFxGnI75uIxPFWHMDy+CwMe/BNCS00/EVHPS0XAOJF+Z0ppLBGO1TCQj1NC
 4YpgdX+fT4+XqjbgrYbWpY1SQxx1lwk=
X-Proofpoint-GUID: gnzNM_3xcpZhJJOfSQEqgIS-D7236yGI
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad5e553 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=d3QjpUUrb7QHECHc-BAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190038

Some WCN3990-family devices use SW_CTRL to signal that resources need
remain available while the application processor is suspended.

When the PMU is marked as a wakeup source, request the existing SW_CTRL
GPIO as an input, map it to an IRQ and register it as a dedicated wake
IRQ. The PM core then keeps the IRQ disabled during normal operation and
arms it for system suspend.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index 636dd7e63891..69b7eb565996 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -11,6 +11,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/pm_wakeup.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pwrseq/provider.h>
@@ -484,11 +486,18 @@ static int pwrseq_qcom_wcn3990_match(struct pwrseq_device *pwrseq,
 	return pwrseq_qcom_wcn_match_regulator(pwrseq, dev, "vdd-1.8-xo-supply");
 }
 
+static void pwrseq_qcom_wcn_clear_wake_irq(void *data)
+{
+	dev_pm_clear_wake_irq(data);
+}
+
 static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct pwrseq_qcom_wcn_ctx *ctx;
+	struct gpio_desc *swctrl_gpio;
 	struct pwrseq_config config;
+	int wake_irq;
 	int i, ret;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
@@ -526,6 +535,33 @@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ctx->bt_gpio),
 				     "Failed to get the Bluetooth enable GPIO\n");
 
+	if (device_property_read_bool(dev, "wakeup-source")) {
+		swctrl_gpio = devm_gpiod_get(dev, "swctrl", GPIOD_IN);
+		if (IS_ERR(swctrl_gpio))
+			return dev_err_probe(dev, PTR_ERR(swctrl_gpio),
+					     "Failed to get the SW_CTRL GPIO\n");
+
+		wake_irq = gpiod_to_irq(swctrl_gpio);
+		if (wake_irq < 0)
+			return dev_err_probe(dev, wake_irq,
+					     "Failed to get the SW_CTRL wake IRQ\n");
+
+		ret = devm_device_init_wakeup(dev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to enable wakeup\n");
+
+		ret = dev_pm_set_dedicated_wake_irq(dev, wake_irq);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to set the SW_CTRL wake IRQ\n");
+
+		ret = devm_add_action_or_reset(dev,
+					       pwrseq_qcom_wcn_clear_wake_irq, dev);
+		if (ret)
+			return ret;
+	}
+
 	ctx->wlan_gpio = devm_gpiod_get_optional(dev, "wlan-enable",
 						 GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->wlan_gpio))
-- 
2.43.0
