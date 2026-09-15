Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8915D4BAA14
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491454; cv=none; b=J4E3/fJoiVj8oiT9e7e3pnYKm/RHJD9zNMvLya+LSKBwCtK96HfTjf9EiZqKFaDuoxLbL/beVkLDDZiRxfl9ebCnh7AlK96bdKm/LtWBwXS++HK6HyzExHLgyGeOek/YiOERNoucwORd1nJ18VGXqzfOJMdiBXsFU4m6AbENhPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491454; c=relaxed/simple;
	bh=sTtAcC6DTgTsyia/QnLhKcG49gomKemayk5z0N7ppgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnW0gWnTocwoZhwI1FnARkdMY6a1cVwizO2PBrwPU2N8+OvvxAm69XEInQlT3jojy7//I84PVxkAaPvk1KIjERoWRGKEnh7ShcAfcJBGPisLyccvIJf2Tal71Tn2WRD0ETg3aJAjCOfJp1gWjVkzEbNOiGaiIYc5/L+uDurutVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kf4ZLvAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REzVRAXT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kf4ZLvAM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REzVRAXT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FGXWN33577078
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xB2gDVEaK5Q
	aG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=; b=kf4ZLvAMFX2gazjCvXoux6fxHn5
	jeLEGwxEtZC2q6dAKbIZ0VNOgpzwehzXucmRvXFZtstTT7acIIiFDI9eUbyr4F6I
	xy5IMJ88V0esrL+kowjejST0c/5JPECIeIu+V9kWwCDz1wE5+cU9ymLSkzsDs0rd
	Mqx2BPSxHG+KkjqAmsYGhgl22NIfp58U2X+XDX8EIGI0jR0MELpe4iYYrnH82/Bt
	MwQw3BBPVqImDOIoodlWh9FaQpbyJ0rtQ99yHmOnYXTFEaN1MP0rnXjUdxGyu538
	k9vOGVMDVQmPX0q4i9s+bfrPth+7UbQ/PwpszIN/jGEm/iTU9fB05u4J7Sg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n605fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so46697085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491439; x=1790096239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB2gDVEaK5QaG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=;
        b=REzVRAXTXeeAU/RcldNqbcQp9qcxFwxs6yd0gkbR++FQlHV6sc5vPSfCqoySkBx8s3
         pKoSn3+9AUL+NO1HZ29IXu3mIJRsAxOfWXsFgyDiG+Z29vv+6xi3XNtmEPDle9P4ZLiz
         JJu7BG5dRdIe+cYJfyCkwkZFu/X2cDjjGhRAzrMn/ahz2AF9dU/L53UQyzoG38dI+aOp
         tIte5Z8q9rb64XftB62rdzKVUbF108NYmBPMLCeBQpEyp/719rOMFu2uizdDXgELBAnv
         kdUZwAenSeSgRO9WHiKBnSRk7KzS2f5cFB7Sc4DfcjJovbYK+9X5M9iMRqBXwad3sgC1
         B/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491439; x=1790096239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xB2gDVEaK5QaG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=;
        b=OvSmejyah8fdw7T0Shr8gTfYcGUpxH1+TEmi/iwJIqWXRUs9pOpAd8Izi/UInTwusw
         hYn9dfglfnpMk95BKM9rCbo5S2Tp0FjdqN5MW2blkxJkt/kePDrgEdHAwheZ2mW3xuPi
         dKI4rsz+nkv8hzk4zzBTbxK6QjG9gzpozUUoPIuoSskdS58bEWqEEoxHshxxYyHgovsw
         FEEsIXzQrkyGM9pB557pyscXGCJOqC7G+cTOewujFofrktWopnUzpzVlZA/jjvTDymwY
         jDiXiQOh1M4fwgQYMKy50URqIQ4klhhirWoH0wZqUFqW/5E0voimyTtZSoSjIF6ZhbWE
         ENgw==
X-Forwarded-Encrypted: i=1; AKwUvBxkbGLI6bzKb/DaBQ9YgrvFKVvgrFk21To26egD29P+f0nH8BPO/LKMXbU20RO4nSPDFCamS7IHCMD4Vl0=@vger.kernel.org
X-Gm-Message-State: AFuF++k6cljw6P6nAajJGap38lGniKtcZV9ST3ZaFGLCpa8Yf2uOuqOx
	90OnKqSZemEZaCUb8q3Z2aozBK/v/TGqm9TJRwBlO6l8VRmfEbPbSBsIgBUgBjOt+oahrzXp5K7
	Vh4QxP9vs8BJsZ0NYq6/ozxLToGe9/Jt5anQb8BYBX3k7U4XzbZQ3Tgu3ebPb7nTuh8s=
X-Gm-Gg: AYBFou164u24sXgAQAkswy83mdxjB344JOX7L92kG8vAxAu2odh2jvTu3OnoqjqOiU+
	Q5sJBeWTtvuoEBNhUt6Ljj/lcElOX/ckcOc/rQbGbhP5aZ3zQZehycWOjuzX5A/ZcFS5lvNpJCo
	hayUNaE3C2ehlEcFO5wwt0c3qpiICJu5fY14xeTUUfgZOEADO8FrpLSYVSIN6rdrups08IchLJ5
	xPBcCVApWF0I/Xv1XP6Vu89j7x6GnaxothKJ+tgmJ8CFfvaTLpUAEI4KqojSkI6YZS89H2Y33Er
	T8fofa/bm+Zr4DDj9RGkfKlGQrR/cVFEBJJT0Y+uWrG/D66DNFJ0vJ01MxB63czRxhfvZDqJhgE
	/ibztVvaDViIzyg==
X-Received: by 2002:a05:620a:1b87:b0:92e:76a1:96cd with SMTP id af79cd13be357-93a297e8f8cmr1355600785a.13.1789491439303;
        Tue, 15 Sep 2026 09:57:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1b87:b0:92e:76a1:96cd with SMTP id af79cd13be357-93a297e8f8cmr1355589785a.13.1789491438612;
        Tue, 15 Sep 2026 09:57:18 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 4/8] ASoC: SDCA: add class_ops with populate_function
Date: Tue, 15 Sep 2026 17:56:46 +0100
Message-ID: <20260915165652.914893-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aa978f0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=RDHKc21CrRhZfFRGvR4A:9 a=O8hF6Hzn-FEA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX/iD5ihaV8+0Z
 RMgxTsoY5mMDpSv/XF6UhdDbw6LtE5OiWDBEl18yGQqYFZ14npCX+JDfqinp1N49LO5K5SThKzF
 iI5X2hWe1aYdDx34FAziFbPrdMKkaOu4GWRn/6zjV3hu0JAuBTiYP+CJ7jyKxPMgXeKKx4AVwGc
 StVAP1clDOP39ktiMQazZchURgExDRjalMTwY3PzmP0TPhrjBM/TavHBhCLYZ1sNItkMgYlcx4o
 f2XCh02gWjPsrKy2FO5u0DDEVXeuW6SMHmajb2exzQOCNEh9HwuEalcNbvuQLWXx6ML8/t3oxJO
 KrYL6Mv2YR4GGxvM20J5Ukc1v5HMnEOA3TuLnhEdS6jO+h1fzHoWyRwXB+Gguups9uSY6nXU/Md
 Q4YZHQz6zdDj4DEUsJ32DO33My/3huQ1j8behXThUAVeoVdtRmJhY5pY2K4nhnvcXhqf7PAfVVW
 ppCGy013aEyanFW/ZZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX7xz443i+iA3c
 pT2n32JbHGD7A9K9/K9xg2NOebJSypjs/oCdO1GxDow/WQ0XbzFDEQOrXeIRue/Ptq5BqDdbvDh
 g+4unwERzUbL0nS62cjkwa4BsO9QkeE=
X-Proofpoint-GUID: lL6gPLP7YeQNxPDbCU1OmK2yJCeg1XRS
X-Proofpoint-ORIG-GUID: lL6gPLP7YeQNxPDbCU1OmK2yJCeg1XRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150247

Add struct sdca_class_ops with a populate_function callback that lets
codec drivers supply the SDCA topology (entities, clusters,
init_table, ...) from static tables in place of sdca_parse_function()
on DT/non-DisCo platforms. The callback is a pure data source and
performs no bus I/O.

Codec drivers embed sdca_class_drv in their own priv and register
their populate_function through class_ops passed to
sdca_class_probe().

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_class.h           | 18 +++++++++++++++++-
 sound/soc/sdca/sdca_class.c          |  9 +++++++--
 sound/soc/sdca/sdca_class_function.c |  9 ++++++++-
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
index 9e6b0eab8a0e..90af5b914ba3 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -20,6 +20,18 @@ struct regmap;
 struct sdw_slave;
 struct sdca_function_data;
 
+/**
+ * struct sdca_class_ops - optional codec-provided class callbacks
+ * @populate_function: fill @function (entities, clusters, init_table, ...)
+ *           from static tables in place of sdca_parse_function() on
+ *           DT/non-DisCo platforms.  Pure data source; performs no
+ *           bus I/O.  Return 0 on success or a negative errno.
+ */
+struct sdca_class_ops {
+	int (*populate_function)(struct sdw_slave *slave,
+				 struct sdca_function_data *function);
+};
+
 struct sdca_class_drv {
 	struct device *dev;
 	struct regmap *dev_regmap;
@@ -27,6 +39,8 @@ struct sdca_class_drv {
 
 	struct sdca_interrupt_info *irq_info;
 
+	const struct sdca_class_ops *ops;
+
 	struct mutex regmap_lock;
 	/* Serialise function initialisations */
 	struct mutex init_lock;
@@ -34,7 +48,9 @@ struct sdca_class_drv {
 };
 
 /* Library helpers used by codec-specific SDCA SoundWire drivers. */
-int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
+int sdca_class_probe(struct sdw_slave *sdw,
+		     struct sdca_class_drv *drv,
+		     const struct sdca_class_ops *ops);
 void sdca_class_remove(struct sdca_class_drv *drv);
 
 /*
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 0e6dead41495..79fdb672be1d 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -144,6 +144,8 @@ static void class_boot_work(struct work_struct *work)
  *       allocation and sets its own dev_set_drvdata() -- the framework
  *       does not touch drvdata.  Typically embedded in the codec's own
  *       priv struct so codec drivers can keep per-slave state.
+ * @ops: optional codec-provided class callbacks (may be NULL for
+ *       pure-generic SDCA parts that need no quirks)
  *
  * Codec-specific SoundWire drivers call this from their .probe after
  * allocating a struct sdca_class_drv (usually embedded in their own
@@ -151,7 +153,9 @@ static void class_boot_work(struct work_struct *work)
  * sdca_class_drv fields, sets up the class regmap, and queues the
  * deferred boot work.
  */
-int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
+int sdca_class_probe(struct sdw_slave *sdw,
+		     struct sdca_class_drv *drv,
+		     const struct sdca_class_ops *ops)
 {
 	struct device *dev = &sdw->dev;
 	struct regmap_config *dev_config;
@@ -169,6 +173,7 @@ int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
 
 	drv->dev = dev;
 	drv->sdw = sdw;
+	drv->ops = ops;
 	mutex_init(&drv->regmap_lock);
 	mutex_init(&drv->init_lock);
 
@@ -213,7 +218,7 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 
 	dev_set_drvdata(&sdw->dev, drv);
 
-	return sdca_class_probe(sdw, drv);
+	return sdca_class_probe(sdw, drv, NULL);
 }
 
 /**
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 411e3d717bb6..d83be8474e7b 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	drv->core = core;
 	drv->function = &sdev->function;
 
-	ret = sdca_parse_function(dev, drv->function);
+	if (core->ops && core->ops->populate_function) {
+		ret = core->ops->populate_function(core->sdw, drv->function);
+	} else if (drv->function->desc->node) {
+		ret = sdca_parse_function(dev, drv->function);
+	} else {
+		dev_err(dev, "no firmware node and no populate_function hook\n");
+		return -ENOENT;
+	}
 	if (ret)
 		return ret;
 
-- 
2.53.0

