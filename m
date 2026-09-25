Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54834E06D5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352689; cv=none; b=FO2mTPHjTkoll1OB5e2yuKAF3cqiNH8MhMjorYFTY5Ckwt+wMnDTCz4PGhR9o+X8J9x/nqMMudBgoS+YdttjthUXEBbXYhbkWsfyOQboSXws5RLYuTrJpiJUJ4r+jw7xcsRHkG1nwA6d2gXvthW6hSSRlzzqbUyM+vQGlyQyQPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352689; c=relaxed/simple;
	bh=4dhgjm398m/ETEt5uEgSrrj3Rc/izKTfRSl9s7ITdS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aiFRLmnnYFEdirpbFax1UROreDqSyv+ATqPI1HQDMp0vL3KMjR892CZ7T9ynzNJvRdFvLTPu0/EFbZJU020eX7sPLfgbzfi2DNqbegjxup4Lz77UlCRWhfL1+oPNSfYscJH6sbFEgOid+Kmsqt0JqBV9ASFl1qnQ2cNoOhgC+jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itgl/S2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEt63Hc+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itgl/S2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEt63Hc+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0QeG1002066
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JIPcTXD3grr
	fQWrBYj3DIhbI58SA8jam/6/w84NcOZA=; b=itgl/S2fHwKUtrzDR6htj9CJmzn
	9YRPaJSG6SaRPHq/aQ8Dp+jSgumVuZsB7Lji+V3TPT1YjUXvnFd2Bpi7+Btibm55
	MCn5q/wW61L7hkCVI48RHYSw8Q2ngaXGoZO4jcGKlIqIGWkd5CoQgscxjCSS5Hi+
	FXKQRnWLskEOutvBQ3yVlsa2+mw4IBzHvDOVew5DhE8tl+a0Ywz1ta6A5zc4TQVk
	KQ4p7nRScY5gIToF9jAAax+SSqG7cpqsHTEvj4fAY2tKPF5kP/TdeJ4qfhcWe5lQ
	dcDCS3iUP6UEtjtABZ7r+jSix9xfyezjFszWIu4rmcOkvbp78xjHkN5cfBg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e91ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:11:26 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7915a83539fso966448137.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352686; x=1790957486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIPcTXD3grrfQWrBYj3DIhbI58SA8jam/6/w84NcOZA=;
        b=kEt63Hc+Er9qQcYd9HUGuO4sKSE2eurqyO6cou9qFp/qNfbko0B1BOKrFL45OQzfH4
         Kdti/i4QgkvYYAeUxyVy2T6xRIbpc9NIMfVhSTn75gVMARXcOMOh6zUWDSEAYIATndfX
         40gzfnvfMEGPsu0Ky+Sf37DxeSLH7Hwj5l9SyIQSJrxVufWmOC1z5HmbPUTSHs+uEIFJ
         GMIiV1HWYaz37rgGYqmVt6gfd64taiZqrXzN31K3QqUX9ZElVwn/+QK7MhAI00Rtl8ls
         fh9rSiwvm06orG93HM6R6t4PvmxJFTCcs2HwnUnJ0Cjbc+cIkx/AoGo79x6sf6yRGEc1
         rZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352686; x=1790957486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIPcTXD3grrfQWrBYj3DIhbI58SA8jam/6/w84NcOZA=;
        b=I4pXAz/GlnFHeKboo/p/UDGzkwjMxiVmUW3MyQv14cCPs8/8R6j6/seS1tbVSZKAnD
         +McM/gWjGAqfwrj7dM0P81ziTzgr8YLNC/+1vCZN7E2fVizS1NIAgWqUFYpE4QccWDQk
         onytUq6h0ENCZoxK2/SZcEOmgE8rYjQOHjaPHbZvcb3UUCzaoGqbvF88uTrRoAu+pAjg
         jxbBwlm77mTys1e6yjRuUROP3WOcq6aKhmwmN4NMCM9vWnQNu2FRMqX1i+pRKkfWDe7i
         QvyuYygVc5bDU7iTdvgOhvF/LvycLeIb0kc+F3Yni+zAuSXh/EqVwTJlygN2Cj1jl583
         vgNA==
X-Forwarded-Encrypted: i=1; AKwUvBwxTKiLlVmurQoSoledh9Ymz/pGJQrfU9JD43T+WEF1x5sSUuHRJksvKsuWVlbytrgryt5ZG6D1kfcNP4s=@vger.kernel.org
X-Gm-Message-State: AFuF++lCrGlesh8I9aB1qTSDEN+zj8bZnuPZBb88gYtYDZRcAzTji+FD
	a0huBADZsxuAtYuHoep1eggOnEGpBQVNR3Au0p7aWIaQe8xqjbfUIf6/zQA1nlkf2SfLo4tzYW3
	P41DL1Ay+OqeRsoxB8l7prqixdUV6WO4qadPhLaYMU8seyLE0MTwa8Lqdgt2rQ1mfJNo=
X-Gm-Gg: AYBFou152xgkM1U2b0EImZj9UgliPZaHvI21vOZHRvSJPckEe9X1+6/bw0DjMo4tfyK
	OevsoiiRvpSj5PKmei4z1kWyzJ2/XwhZslAWe/E0e52cm3LPsOosuNhWsucFBhTzuk8p2qtRD69
	AcdFnvm24+q13iI0yATBi3H7a+ZcUzj+IbZR9jjasBheJ0ce0rlvFSO2l92KYwnCJWFaEk8zC+8
	GwJuvz4QwwmoJ68F9LJqLlojjRxVjm7za4yk+ocQ62/e0sCgAmPUgAB+1Kmvye7MTT4orDeq9cg
	O7wS/OCWj5HGP1B4FJXAOLfgtRap2hyzn8RuDxtWOjrkSsPHhfOIKi5rHtOFm/nklz+dCbwkNRx
	hox1Z/ik34Y7k
X-Received: by 2002:a05:6102:6411:b0:7a4:a8c4:42bf with SMTP id ada2fe7eead31-7af1e4f2df2mr2051164137.17.1790352685654;
        Fri, 25 Sep 2026 09:11:25 -0700 (PDT)
X-Received: by 2002:a05:6102:6411:b0:7a4:a8c4:42bf with SMTP id ada2fe7eead31-7af1e4f2df2mr2051141137.17.1790352685068;
        Fri, 25 Sep 2026 09:11:25 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm73019505e9.7.2026.09.25.09.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:24 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 3/7] ASoC: SDCA: expose class SoundWire probe/remove as library
Date: Fri, 25 Sep 2026 17:10:44 +0100
Message-ID: <20260925161049.758913-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX0Ic4F+OATAGQ
 qnYosTOsycPZMVCCxK7oZeoGPTYJD9L89KGnhcIG+xLqwX7UrTdX1QWDDfuoDyqbPid0PARkTiS
 ffh7RX2awvyRmSsUia2e7XgSijkNFAY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX1gVmbvZJAnnx
 /GmjojufcC7D+P7SyPd8WFvuouX4GLqdERoKbKMun/1aeyMJeI1RmlYb8eXzCugLPo4wc25d5pF
 CFCKy/Sm8qtgWS/TFKxujKQq4T7Q6Li5i5sUgo7ZbS5o6z9elRQW2cIsrP/gYZOfrkJebsE0jsX
 tEnGczFBOTvLFp24z6/svOfLLnlmuUYJBNvMxSjWGc7ib/GeC1aWxT6bYOGYF0a2bRv43NfPdCQ
 a0OdQee4iv7oHCLz0rwVMOc3oyWvjs76pBQ7UND9/uGjTFK1ptcvYg69awrGtDFdLccO5a3WvXS
 4IFW5SB23gER08QC1Z2RRWxjPmeiMWDmqSN6pIZZ2GXhJrQL3VrCOZHg2YYwFT45AcAFqENxEZn
 p/BHvhWs2kmBHnpDbWpZeoCEuGS9KnyLvmle75Otp7YWvc3Or6shYT6D/UlRbWUhvs1YhEewgWj
 +28nEiYjtXFxpR4S5Bw==
X-Proofpoint-GUID: FepBpvtY_uLMrwg179eGmrKSw_SeBjpd
X-Proofpoint-ORIG-GUID: FepBpvtY_uLMrwg179eGmrKSw_SeBjpd
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab69d2e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=mVpuNYMqi7MQLQPxcREA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250064

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
index 8a6a34a8dd4c..890c2dbd88a2 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -32,6 +32,10 @@ struct sdca_class_drv {
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

