Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C62E4F68AC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737579; cv=none; b=p9FXtTBrfnSSzWgVAJvrzXxEwuSvLAWGmlYQvSQUXjgonyPJMMk4v9ZMUuHKFN6hoeYucZY+J6kP/J50lxM8TVtbv5twHlqMRi3cHwRU55NfAmzdnJKOw/lqfsmjTR8ggDmh8qmFVNNkuwxA0N60KIRoKJ+zdlrTuY1sZI/vInU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737579; c=relaxed/simple;
	bh=i+O7cZGqDHF9oCN3XLT5p5vttilZ9SLFPpmi99WMzqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5HxJdaKgkZVLWgNQ45JahfWdvKt2I/pMOJAJrU6T0xfCVkabWeIc/Q2jXbXQxrn6rjCd7CE9DZ9l2pniEG4tDiYRKyLcOiVLMil4J1afP2TvuarpwsrjivSLYxSibnXv3sCf+l5TAvkhCBBAcyb59TOvIyGFRA05ChF6EGF8EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MW/to48S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/9Uprm/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MW/to48S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/9Uprm/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICtqFw1836647
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XrwBpas1mTr
	Y7PaKJXk9LXDg4hKLTOIWwidZcoVKoms=; b=MW/to48SB18tqKYkapF49++gw8o
	ccV5S6BTy0OT1gQnoG6uswFcLbCg4hlS8hBo0lAFffZ7uZrC11whInUlQobLmfIk
	t6naN7med9lRKzMsVY8ASFcbW01UPq8PO6h2irIsHHVRZYGUUZdNwVh0t4q2pybw
	gnGghnHuMPyw1OqdFoDjrMIFn5HRAxOavFGbTd/gBQBWbc/yKPW9VEg/ioEshexb
	nEvVgSqxhwfBvCXPVzrVRaJWIW7CBbKfp75jtfWbsAJDepGdMAHiTKVlAH5oIpd1
	teRyXf5V5gIvcpzeRcUmzQ20HEhgm/i2jRDI9tuEiKMg7dSl+Mmbezfnykg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpttbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1bffc2eeso205521785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737574; x=1790342374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrwBpas1mTrY7PaKJXk9LXDg4hKLTOIWwidZcoVKoms=;
        b=M/9Uprm/Dmt1Mv202qF9tvZ7RG9p1ueGKlrUum2eaGosmIqaMDFv5VGICWsxaNgUcl
         0tTIkwH/ny3O0ztR4sPzJm0e9HtqEaRu/GkyMjuMbSgVWQgPnahcbOM03B45qHT2lFS9
         EOfYDTlmyReesB8lbpdGdLsVHsVHxLc/a4ICsNTPRcf9Znao9PJt0jx+NofcYRVdYKxU
         a4z545UHFW2zIs6ZfSeWtOlHAmntWBCq61obdKvv8WXyiJhSJjKrf0WYfdsFnJr+IYXH
         3LAvr31KoZ+DEYsF9Wd8kx7YNn5mAY2pHzi4Y8t80Mhdv8mqOCCA9G5asDjHbgv03HTz
         +BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737574; x=1790342374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XrwBpas1mTrY7PaKJXk9LXDg4hKLTOIWwidZcoVKoms=;
        b=rkFn5u6yF0i9oUixIWVlCuBYNmOIWDydn0pr5xj/bonvWmHuGXw1hQfVYKDUjQjq/w
         MTVykZsAvtDOo1LnOQhnNwN50pVzFQEt5Yzggb0dn+wW/HZvS5FNzPUcdF8Fzf34ASsl
         27egRIMR8yI2UHaarfI7eJXaSvq0B5I0/xITa/6WGUoYPcaJWCTaWRRXqieHBkZwdMlj
         oD3uTtMT0qM/8QNRfpoOrsVxSbC93yOQthZz/lbth8LjUShkX/3qo+35mL8hGk2f/wle
         bnoK+ZjVgkd3nPn/rMjLXNaw8IwC6YgtZyknYd2dKVjF5Db5iTCAhQ+caxe4ElC48h22
         G2mQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEjp+Skwhl3N3nJERPaNqyJtYzrrCIf2ks7lFIA0awSEa3BF3FI3lxS5TuMboFnhKk1VaR9H4cZLAa0Zw=@vger.kernel.org
X-Gm-Message-State: AFuF++nAqtVDdvzlbB37/ffbt/X0WNp/IvT82ea7BhANCGNviWgSJqsc
	CW4Q+h33eGJj1DiyMGgyi1oRniAQrj9fD+AGiU1XIeLjkI+3Odmmg+zYtlQ8LGO7Sa3kOxpuXs8
	g+mo9j1A9wQz8bPOHpkveJDimJMhjjkdkdM7WCEEgqHavXiCbEhn7sPpPaz/fHCfvlwE=
X-Gm-Gg: AYBFou36ttoQGeWzJcimWIRdU1Bs5lF2RTutqNLB/npWCf787TSxeX7BS/6s+Jb47Do
	qw1XN1C09FYZYkhMwF+Q9yGnJ3225avD2KCzMFsUUg4T7dzFgBrRABLQpT3elQ5LnhtknOU2j5l
	912l83c6lU7MmjOcEHOAh/Qc9voNNBI02EefF5ukgYW6wBYASBbWfUCxx43N5n7c0yUusdxKuip
	jFU70RS5ge4jhyZZtqgXhw+OPz1Bh90s020wET4/l51GfkRQ4JVd45mO8bkx3tCXthG7mn9md9v
	BhFCkaqs+ZYr8vAMKYoMKaVLvj/faXyrldKHfqtCuGbaTe+rBZMZ+LHq+StMshc0QK4i/fAri8x
	bB7qe3UFW62nSmQ==
X-Received: by 2002:a05:620a:45ab:b0:939:4a34:621e with SMTP id af79cd13be357-93bdc702c8bmr348740885a.28.1789737573504;
        Fri, 18 Sep 2026 06:19:33 -0700 (PDT)
X-Received: by 2002:a05:620a:45ab:b0:939:4a34:621e with SMTP id af79cd13be357-93bdc702c8bmr348733385a.28.1789737572805;
        Fri, 18 Sep 2026 06:19:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm48254015e9.8.2026.09.18.06.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:19:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 3/8] ASoC: SDCA: expose class SoundWire probe/remove as library
Date: Fri, 18 Sep 2026 14:19:08 +0100
Message-ID: <20260918131914.681588-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX9BocaobyijCE
 jALRFsOA1ra8dIA/bBbQ1L4xyQE8NLGO7RubImpGYA0wiDPWlIkEP8uBx7nXftthx4KuiUX9J5P
 xQXupSZIxcyq8TEUeApjMxxwWKEmqR4P+gzCvuKh7ARbVznPWly3jx+q0dEXurFH+676YDyVCmh
 Qg8nlS2gAlwMi1CQlGKThdB7TsMGSwzkamhhjZ0hZOEgaz5iMMV3xuv2FYOjNa3rqKsYvwjBUyg
 HksR+R7E4k2TICGyyL/SmaCH8eIF/vb6IfJAYm2D8lP7P7nTYGGSunoQohdPMII9di5Q7O5PrkW
 7MGYZ7IQd7HJdypM7Lv5eEAm3C5dxCPt6HDjr+UFwvVeaT3qUUH2VCwnlxbvVSN1rA7vo4tiZ6N
 +yihrxzeyQk5g4B1klxndFDcwXPWdtRvLHE0ffN40Cccqcs9ZyyNMtlT8A5nVt4xLmIqLG5g6ze
 3QYUIR4rEukNplXSz3g==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad3a66 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=mVpuNYMqi7MQLQPxcREA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX3Dftceu4Yr85
 AxEGkMTFCrlQlezdYQC9eDR8vVGtlOj6OQ7Rhf3VlGLA39QmN+bp+s70tzKTpliG2ERJpyrCrep
 fWj8lpkOBhyGZbtFTkxpxZgGkGxO5k8=
X-Proofpoint-ORIG-GUID: 7TcbK7-KzuQ7XyrW7pIb3uxPqy7Jn-jC
X-Proofpoint-GUID: 7TcbK7-KzuQ7XyrW7pIb3uxPqy7Jn-jC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180189

Split the internal class_sdw_probe/class_sdw_remove functions into
caller-friendly library helpers:

  sdca_class_probe(sdw, drv)
  sdca_class_remove(drv)

The class_sdw_probe/class_sdw_remove callbacks of the built-in
class_sdw_driver are now thin wrappers that allocate a bare
sdca_class_drv, stash it in drvdata, and defer to the exported
helpers.

The exported sdca_class_probe() takes a caller-owned struct
sdca_class_drv * so codec-specific SoundWire drivers can embed the
class state in their own priv struct, own dev_set_drvdata() themselves,
and avoid a second allocation.  No functional change for the built-in
driver.

This lays the groundwork for codec-specific SDCA SoundWire drivers
that want to compose the class-side probe with their own quirks; the
next patches add the class_ops mechanism on top.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_class.h  |  4 +++
 sound/soc/sdca/sdca_class.c | 62 +++++++++++++++++++++++++++++++------
 2 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
index ce2ed5f33e7a..9e6b0eab8a0e 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -33,6 +33,10 @@ struct sdca_class_drv {
 	struct work_struct boot_work;
 };
 
+/* Library helpers used by codec-specific SDCA SoundWire drivers. */
+int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
+void sdca_class_remove(struct sdca_class_drv *drv);
+
 /*
  * PM helpers.  Codec drivers embed sdca_class_drv in their own priv,
  * own dev_set_drvdata(), and compose these into their own dev_pm_ops:
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index a092ebaa620a..0e6dead41495 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -136,18 +136,31 @@ static void class_boot_work(struct work_struct *work)
 	pm_runtime_put_sync(drv->dev);
 }
 
-static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
+/**
+ * sdca_class_probe - SDCA class SoundWire slave probe helper
+ * @sdw: SoundWire slave
+ * @drv: caller-allocated sdca_class_drv storage.  The caller (a codec
+ *       driver, or the built-in class_sdw_driver in this file) owns the
+ *       allocation and sets its own dev_set_drvdata() -- the framework
+ *       does not touch drvdata.  Typically embedded in the codec's own
+ *       priv struct so codec drivers can keep per-slave state.
+ *
+ * Codec-specific SoundWire drivers call this from their .probe after
+ * allocating a struct sdca_class_drv (usually embedded in their own
+ * priv) and setting drvdata to their priv.  The framework fills in the
+ * sdca_class_drv fields, sets up the class regmap, and queues the
+ * deferred boot work.
+ */
+int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
 {
 	struct device *dev = &sdw->dev;
 	struct regmap_config *dev_config;
-	struct sdca_class_drv *drv;
 	int ret;
 
 	sdca_lookup_swft(sdw);
 
-	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
 	if (!drv)
-		return -ENOMEM;
+		return -EINVAL;
 
 	dev_config = devm_kmemdup(dev, &class_dev_regmap_config,
 				  sizeof(*dev_config), GFP_KERNEL);
@@ -159,8 +172,6 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	mutex_init(&drv->regmap_lock);
 	mutex_init(&drv->init_lock);
 
-	dev_set_drvdata(drv->dev, drv);
-
 	INIT_WORK(&drv->boot_work, class_boot_work);
 
 	dev_config->lock_arg = &drv->regmap_lock;
@@ -185,14 +196,47 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_probe, "SND_SOC_SDCA_CLASS");
 
-static void class_sdw_remove(struct sdw_slave *sdw)
+static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
 {
-	struct device *dev = &sdw->dev;
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
+	struct sdca_class_drv *drv;
+
+	/*
+	 * Pure-generic SDCA parts: no codec priv to embed, so allocate a
+	 * bare sdca_class_drv here and stash it in drvdata for the
+	 * built-in PM ops to fetch.
+	 */
+	drv = devm_kzalloc(&sdw->dev, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		return -ENOMEM;
 
+	dev_set_drvdata(&sdw->dev, drv);
+
+	return sdca_class_probe(sdw, drv);
+}
+
+/**
+ * sdca_class_remove - SDCA class SoundWire slave remove helper
+ * @drv: caller-owned sdca_class_drv (the one handed to sdca_class_probe()).
+ *
+ * Cancels the deferred boot work so devres can safely free @drv and the
+ * embedding codec priv without racing class_boot_work.  Codec-specific
+ * SoundWire drivers that call sdca_class_probe() must call this from
+ * their .remove with the same drv pointer they passed to probe.
+ */
+void sdca_class_remove(struct sdca_class_drv *drv)
+{
 	cancel_work_sync(&drv->boot_work);
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_remove, "SND_SOC_SDCA_CLASS");
+
+static void class_sdw_remove(struct sdw_slave *sdw)
+{
+	struct sdca_class_drv *drv = dev_get_drvdata(&sdw->dev);
+
+	sdca_class_remove(drv);
+}
 
 /**
  * sdca_class_system_suspend - SDCA class system suspend helper
-- 
2.53.0

