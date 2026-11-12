Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468033;
	b=LSEj4EWNL4eUhy++hxbIpWPMoxe5Lk8aCWJz1BcTf21lCZloM0OoK7bhObHtcZRg2yvj
	 n5aiIXpcPIvsQ94mypuAqJ4O/atgbK4nujygVv39b0ZZzp75n0szVh+3oG/cCwniu+HKm
	 RIs5g1T5ISgNZ7fv9Eito9YiIkATcvT95YDJzsfJYKLoib76IO0JggyK07NE6uk+DLzLe
	 nRf49Buer59wuy0ROrSCEGomPXcswqQIc+toKjRRYUA6q5/+fP/STqqYni7zFvg5/t6S4
	 4HWt0CSJVunvRhzNEgsC1559Y//J8nPmiBPK1L5knO/j0iSSk0O0cjZR7Ry6+5zTEUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WADlB89QNmzwJxrRLEaHqXVtl5b6bAp/OWZbUebu8cs=;
	b=PObqbTqd7Pxh58Kxdsd+oDav8BxULNfl2EVPwAuPH9C7nBWZI7mBQIKP8n6LNMszVCmz
	 eI6cS1+5MGURJK67SQ3zIpN2b5PudWA04noml6r6tj6WAJeJddI+TTgPHMzSmelOiKDIW
	 S394ikrrma/KLMabMKyPdUeTaLTEGlBsGOMiQWFvaWdqb9tXQNft6Nc7e52yy8cRK6U7n
	 58YjbqqO/hrzPZ2YSU+ocPqPYIAU0BWfrU3bNvCIdO6ZVvLvhyo7fNzGSCTIBThNIH+e9
	 lu2AA+PV+HCOhjdRjsLbWfHFzmRo2TKhf8ywj6p7Zmb/33iddnWfu3u3rttqIOOCGGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cJoa/K2j";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kbZHbGgY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D182606A883
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D182606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cJoa/K2j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kbZHbGgY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5ne48441573
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WADlB89QNmz
	wJxrRLEaHqXVtl5b6bAp/OWZbUebu8cs=; b=cJoa/K2jnnGUSfJMD2NFxQQiO1c
	zUAJQu2Mevi4ubNyvBBzNDXvMLCTZ9qd14149NTa8Bqb3VTzwslM1A29q7Pi0qUV
	XVpnQXoBkmmZoeq1JD6gYPCaNyIpI25Uem+Lwpyzoe0H379S4qMRrLAwVq/lIAfa
	O55Y5s2gzug26ew3zz8LSBByguGAAR1rSgnQXhneMS7d46sgU2JzDLDun3QLtttU
	yEFRDvkSJR+9p0RbIlZddxAQLb2RIx1BW+jAo3RNdJsOMK473a6lBuwhjWJszb0p
	gT25kq6rqEkK7f+DmLkHBm5oAbsuuliNSN0WYvlh7LOgO543QAeQRQDn9QA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0a7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed1d20a96fso1725365ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794468032; x=1795072832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WADlB89QNmzwJxrRLEaHqXVtl5b6bAp/OWZbUebu8cs=;
        b=kbZHbGgY8gHfXCL4PGpGD8quekRwQpAvinmYlovL8yZDoVgm+DtTMHWzA0YtbGJ7FX
         wOXknPPTnfj8yEOFM6KkgLlfL1OkY9AAFxEJJ8ovYrx2aDZxOGfDcWRYwGriwvpBRXRC
         1DYGw+fP/OhINWSHjjWg65N2vYExqinSbMWRM0cK7E7O83qZotuAvaviNRuyoCEmHN5D
         VD652bZWjgDzsOV0rOBqhohiy9k+C908PZJjhpHNCuOo9FR0XRs/dvr4KE8XrgsuFPXj
         LcZVvwYpRZy6CqdnvbhaP8NyG9Z1hKAvcVLAP5lgFaxVu38apPGWe/zkSb6z2ykMpeeL
         KSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468032; x=1795072832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WADlB89QNmzwJxrRLEaHqXVtl5b6bAp/OWZbUebu8cs=;
        b=0wC/0+U7y1nKbpUXW+awI0Rg4YSYLMt44a3GxlyhoBImH9GRe8uwizT2C4ZHZ7te0g
         jqZgwZ2ErBG0n3WV+njUgkmDyN1phz2ykG6BurcdYo+bnOoJQnRHEw7bsNSPqZOQeleN
         iroyaxfOcVAmjSg8gp8wvfBYy6c71nIrSk/5smIV8v2xIsaEUkGszzr6ecC2IHAnyAx7
         5neDZP8jxrY7Xy5NoBNtraWuAjcpF5v4OgsVr1zIQwAGEsio89dVTqDu6ScK9+dgRXPa
         XrgmhBdZ1+hP6KwpdzWjmp0mtcxl3WMvAudUTsZmIVLJ5KRIMZy7wXC1T5aCrQGhTC5a
         zFcA==
X-Forwarded-Encrypted: i=1; AL+hErGlxSjs1WU5LxzJzybdb6XvS8OlfSovKJykZgHgRhAbe7UpobQOH0V6HeOu9Z+Dd91CNi5DCko+QVRPOMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/beWqJHcDMcXpnIjW7L9yCt9332Muu517BAULak0WdJw9gwjUP
	LFRokSdjAKGr0VlRtSbxrN5Fpqf8EpXLEvmmhhkS1fCCKr/03Fl3be01dQhofwnsMFT6YYPOx/Q
	bZkZW32CB4I96JCb7lSh+PiR7sSChv5KPhhu//q71AeW1p+ZXB6kpLxBeNkOuPqUmmHQ=
X-Gm-Gg: AYBFou1TtMuLwIdAGNUMXW7xIT/iXCnLSS8Q4MacZvjrk9oWVfw3xGRXgeFCfqGwA+K
	7TfQ7vRGLOeW/c/kXk0IDYAzxz4RMVp54zjbimrALxSTSTh0nQbWARLgOFAagJEtlguiu+eBnS2
	L5Kvcs9+3MTxD3444mW+ptS3MSQrdBYAZdrEQI19TreOoeWeEpibDW7chGrMX2/2S0gqX8kV6Fw
	Kse5MiAsa0tRqf3l2nJOjHANthFFR9YjHfb3FJsiJ9yd9jOOkqbSM78G0l0A6Exn8JDHCHrpCRg
	dD7LYOauQqf1ZJMOwa9QCXNLy/sl1G+Fr9j1EQQb/FzaU7Eozf73+CrwXo/SAVGL+xy0DLoZuS5
	n/kl2/israLux2c/Ko1t/dBn2VpyDxGDia3QsXEBINDE1uPHKLKLj7uDMSU6B0iB1hz5ubC0B9P
	X/Gw==
X-Received: by 2002:a17:90b:4c51:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b182de7309mr7512744a91.1.1794468031629;
        Wed, 11 Nov 2026 23:20:31 -0800 (PST)
X-Received: by 2002:a17:90b:4c51:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b182de7309mr7512696a91.1.1794468031117;
        Wed, 11 Nov 2026 23:20:31 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c73e27sm3149185a91.9.2026.11.11.23.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:20:30 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v4 2/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
Date: Thu, 12 Nov 2026 15:20:08 +0800
Message-ID: <20261112072009.3815276-3-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
References: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
 <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ecZJrD1am6Quj8drs9HqcBlzZsZeOf4A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX5AEzQ3Ebketp
 hblZQQo8runFd5JzvByUJso8tWOKiPXW5NtoJbgs/ZrdBaPSOcrZz42kxJTsvNxa4wWPecSFOze
 eE4XB/o/ASxpFR8gDgLGA+iF5JTix8I=
X-Proofpoint-GUID: ecZJrD1am6Quj8drs9HqcBlzZsZeOf4A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX9vZ9C4sAeY40
 TAMH0yQPq6P4HmRrswpwiMU8ElJ5mYmVVxuJQSOvvbu+D7w+U+SKjRoNTg0dP2iPTS2HH4wLj4t
 LxELDyj9pE+gYk/8ceC141V//ECnBl1/ub4n+4xWnDnFu2b2m8E0ExiU2DwNLzsuLi56HVJoqu7
 mVK4Mx3ZkE5HCNYsvoaAFUWnfDVP1pgM9zySyBvBHe3F8PHIUoqi0T7McfPqSO+Him3qPUPb2v7
 hYqx0YKJyj2CLc6ZMENmdQii9OaSo2k/vH742YCQoXhRthcIw3IADOQjGqzSt0RwJpFlqNhneLc
 x1Qt2Naqb7CghY4gxFThdQ9a9L30ZuXUtX566cWp0uF48oF+N4+Vupzck+rzaIYE8oVx376X9eZ
 KXNIcmZzqhl9mb4Of+zhctplXIeFBQSK76YL9Jv3djaZbXpBmkPPzSBb4Yj9ScIKzg0u6auuVl0
 wBtINIO9XZ/x1IX1Vxg==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af568c0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=d3QjpUUrb7QHECHc-BAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120029

Some WCN3990-family devices use SW_CTRL to signal that resources need to
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
index e51b655add01..26b436df9b93 100644
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
 
 	ctx = devm_kzalloc_obj(dev, *ctx);
@@ -525,6 +534,33 @@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
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

