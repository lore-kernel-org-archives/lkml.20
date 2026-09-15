Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102E74B53E5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491446; cv=none; b=PpKK6gxRLs8ou8KVLYUxOut5OebdDo7BpJIPTWS+vuHVDViMZchXihTLSwwvyVX1/4QLPoGqH8ZTHKJqL3SGiWuh8P7DTanRiG0+H4K7HetlPe314ZfhcreIDU/KCq8QNtelHcJoyOtcCVr6/J/lZmfLyoKNtwgjtWJkLFaYijw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491446; c=relaxed/simple;
	bh=h6+Fqs5UICNizMZu2Bg4oRbMCdcWTrt2xZG+VwgmlyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FkKmBuieOny+TLJjFOT6IrLKDTRFe/7/Kw+1ox/V30rDCNoxV//1UgN9NMf9NMiKLrnRobM5IvabVEKtnT82HWMZtZMRNsRRE7zNlZdhhMFyVvGjdTZWp+zjlF30wUIJ3mi8pOis6WItkNkGnpiJUmuWFPvVY3f5vks7d7ulZYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e4jBOvqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOQVadJx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e4jBOvqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOQVadJx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAQfo1014170
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XrwBpas1mTr
	Y7PaKJXk9LXDg4hKLTOIWwidZcoVKoms=; b=e4jBOvqU2GGy4btghKJ579FA8ow
	+7nExM42sxcm3cpGeMNZY5jPgQLllk9Vzo98rBCpeTukKRKpsi4YQWlHgH+bFjEC
	aEqK++QW9x3Ui+OFMdQH+9Aq02PrIcgYCGR+W72XmusFaF+K7yQEcMiAKVtRAwtt
	zgohVN9811fpFWme1pab1QFpp51uBJtQAsvYpQaZIWYuc8N3yAohrAER/aHWq8Nl
	8YxwjnQxPnOHWgIPcnbsbW8Dt+GmtF2ku5MAVjf1Rqm9YdznEsalGH0UzRqQNhLz
	/K41Z+PD0OmcbRsZ2kMqXbnop3MbE9Fc/wUHOt3r8wGaWBFf7wTkkDT6aRw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea32we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:18 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso3541306241.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491437; x=1790096237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrwBpas1mTrY7PaKJXk9LXDg4hKLTOIWwidZcoVKoms=;
        b=TOQVadJxVOm+tCeDTdwgi0ZPcRi22jlvqepiUCMlwW9UjhZl5sVUDu0b4ll8xIF5sn
         eihGM4u3dPW+VVps0x0Re8igBIfrdgKOYxkF41pjVkwIc1dWMdnVnC9i45u4jUGgWzhU
         LDVtGJW+0VIg1jKR859b2rTZPOQ6G/CgCNjEQrzncI8LZPp3xTwz8bd7Dl2+xYYJJU9I
         X5KUsoXUGL3XZfS9H5egf6Q9sHfwId0wEPUw286W6t2bZ8PBXwzAnkgLQoLUEe/G3ysC
         n9k+vb8z/IWUTBWqUOJVGW95AGgx9gU4M279zXvv8Sd78MgkIX603R+5+gYmZd+GEx4u
         4ZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491437; x=1790096237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XrwBpas1mTrY7PaKJXk9LXDg4hKLTOIWwidZcoVKoms=;
        b=z54WluZ4HOhCwhqe07Jz64O/YaEGImFixI3KNJoB0J4eL3BtVJQ27nzY7wuhl9HGwQ
         k3tjK/jSDe3Z6JmIYWWiIcnHLnhCn1+S7fIY5GMF+4Hd+WAAl/K5qUePdcjAhVXoWefg
         1jymYsEBS+vDYQtCHTvD2kNNuDkxpGH+78Kj+pkjHD6qrrx1URawnMDoYkrPBq9uGsnl
         TiMX5ATXjx243JuZImO8WlhmcNHM4cVKu67UfZYldAAVM2SoH2W7ksq6zi/lHeLt2VcC
         M0Q5d2hyyFN7nLNh6UcH+zhi/tRIeE9H1ncMP3dI+U+EP3fdCCoKWIc4XeMXxe8XecHo
         WxaA==
X-Forwarded-Encrypted: i=1; AKwUvByW9rV5QVZ4n25vqN9pRt0b/VbVdr+K8mDbcw+5eYROwmw0IoXuQ1gNtGhbWCg8Q+0G15FoUrbQYCkqZb4=@vger.kernel.org
X-Gm-Message-State: AFuF++kFT8lTlAItWmqj26kFIfL0L1cT4OcZeVZlfUwTI4by3bN2mR8Q
	f8e9tqMufx5kSubA7ofppevo65cUPfQfutOQ4caxS31p8aHiKgH59K735vkKUcQ4WDIwXX37wUE
	fJzkjqkPWIySNxAkib6BnhrSeoiE0cF2wAEchnJl4pvybhpgEiV9ZiTMXYcX20iBNqi4=
X-Gm-Gg: AYBFou22ptIJvDPrlbiS0b7TopPvsJDKzyAIpXpMWsLqKNM3ahlyeHd4e66ZLuJnS8g
	rfd5a9DGc+Gx03BA37qBo1+lXJ3zpOPW6n4ViIWxiDhxIq0/2UIQ3JOEU3CNXas4VGFSY0cWAq3
	q0qFeM1A/k0iIuUcGZaPE6umGmD4SX8Y/yoRaI8e0eEhulJQTL1xQuZeHMZlUqLNUFGlCs21MMv
	ndw33xmBuS8iCCrcKmVEgglvvOxc6K0mFwHSMKrz7kF/nKu7is306NRgaq31RSYh4MccWwUeCJn
	45mPoXlH5Unm7Js15GWQBim8k1OLDA51Mf7wigqnj3U1qk6AjZD7fGsMjKIW5Mn/gDnjFr/vadh
	XWp7Avkq08XHvDQ==
X-Received: by 2002:a05:6102:3590:b0:79f:6c70:572e with SMTP id ada2fe7eead31-79f6c705d2bmr2641458137.4.1789491437410;
        Tue, 15 Sep 2026 09:57:17 -0700 (PDT)
X-Received: by 2002:a05:6102:3590:b0:79f:6c70:572e with SMTP id ada2fe7eead31-79f6c705d2bmr2641424137.4.1789491436963;
        Tue, 15 Sep 2026 09:57:16 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:16 -0700 (PDT)
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
Subject: [PATCH v3 3/8] ASoC: SDCA: expose class SoundWire probe/remove as library
Date: Tue, 15 Sep 2026 17:56:45 +0100
Message-ID: <20260915165652.914893-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: HpAJ2aEXmRDhWhC8SSUjsY-ZvCAZ-GOs
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa978ee cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=mVpuNYMqi7MQLQPxcREA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: HpAJ2aEXmRDhWhC8SSUjsY-ZvCAZ-GOs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX9/YCDjOcRk4d
 L0k5CNrFVmfZeKeV+Uz2hGpC2ZhBJGU7gH7vh2qgZ1ku3Xzy4l0k0wKI7VQz7Q5A3HGDW4VLMTZ
 dngmBQ7tE3lralbdOxhskbGKxwy0Vrc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX2YBLX1fcKXdd
 L8uksBuQahEHl26jPOvZ1vzZzT+u9QdyDvRZph+FWKj6WRGd6FfUqyEBteO5qczeBhzcfqdHUEE
 IvtRdklYSD8E5CfhSZTigCe3YyxInapkifCaezEjxaUcjMJ9WQEoadJkQq809oQ11cKx0FBq8Nz
 TIKw0qQYTgMDKEO5z4lAnECKOGR6XoJqxIX+LATumtnDOlXv2vzevY/QzKAqkElE61giiU/qD+t
 3gfvUGfiB/KLYE05cyy7i93bnkBFqiSNoNRAv+5LPoR/ewftxrFOBCCn21DMh2zAEQtaS2iNt9Z
 1DMskNTrsf7FTCWrKIIYlUXSfhYntOHqHNkP7CxYr4KuLHh8tCUZr5iNsoH0CZ8gQb2esEjerai
 hJB30VzBgqLZ+EwUNePjMMH/qSiwdMeQYYbOUDEyBg9FbAUbo32S4PCRW3E1OfC311rqysdCRd+
 Cv2ky2am4GGd4Zvhd7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150247

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
and avoid a second allocation. No functional change for the built-in
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

