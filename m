Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143FA4DD6CA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352688; cv=none; b=mRIeJNGRDYVx9QeCG5TjhUOltNGe6He8lYjmn4ddk1ENbJU7tl3NEEPNgep4/DtSiJ6XcgqYzyBFFQz9Fyqdbj+jDe4in6M7g9cfbjIk527Tg/yEbPumxlvcWVHT3ML/CvaZiiFGgfiPd3lPYMq+9GSNIIAJluJTy78o2ONiM6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352688; c=relaxed/simple;
	bh=tKHIOiQsQeC33EW/Qjc6tjjp39R5cseNHhkAtWTOdw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGIoCgC0c8and8PodahAhJUPxvjIzVU/Cmb9IUZWbQ4h9VeoXWS0jlQRrvBzwPFt4pteKosbyViy+hukUTrMmAsNjWCaFMqKkKAo3jL4Q9mlOMunXGBbiZvdqOe+Xk4SKOr/ejUSaYYZm5+Erk22XIafiYw+wG3tWD5NnPkhvq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbahM8m6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PEqqraGA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbahM8m6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PEqqraGA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG1jE61668969
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JNsnnKSZQPB
	dxnmNmbrm/4Q4uf6HnwcsLbnCUtI07yk=; b=AbahM8m6uUAUnzBDrfEk++bJIpP
	xD2CCZcbpXo3+GKLDK0cIzYp3fYczo9opwPHXohVwqgX7SSJy5oseJNGOS3BXRoW
	VjYtN3/Fydp5sW2ArHV3qlYW+0qVkwsAMY1+bjGHZWQYhR7oVZY2c3+nipv5y5oz
	VqjkkhS+ChdLDSIQMd+M9E+MDNNekItXYOj97zuy2OQnGU8OOXRFcGBd6okDCU5n
	NC/avlmI1d5DydTVRQKWiDoZM/mlr+tpaGsCTFZcDAL6+M6TL9AmJ0EJPUxWZCYn
	XUQEIZNZ/aHSfwsWfT9tv8uikIshNucd/tBBLV9y+aEzh0HlffepFOJCDEg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898vauf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:11:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78d25a8ff32so243642137.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352684; x=1790957484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNsnnKSZQPBdxnmNmbrm/4Q4uf6HnwcsLbnCUtI07yk=;
        b=PEqqraGAe9mqb7crSOs9Tq068p4aCHYO+M73YqxYX9TraMUtF9l/xzGOii17mLcM+N
         ZsGpY0GbtnK6GC0un7azePbepZcLHFYdl4TGM8OVQlXJx7cEjPgiYW3CQ88s5aiGSDVv
         iRSCXzIjuVU6FLjsB/aOtIr7Fg5yhp0XEIH42kvpuUwc6hEFNfld4ISycb+f72+nx1gr
         OBcgS40arrRE7uFkQSnMQsYPW1AaVwdSUKGuGm55qkFUYU3LAAPMtFjoE/1VG8ZDwt3w
         4JSOukxgDez+Hxt4Trrn62jEtAHU8HzJzt2KaoHieidPhAsCTd3YYYcar3d2/9qvsYtz
         eGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352684; x=1790957484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNsnnKSZQPBdxnmNmbrm/4Q4uf6HnwcsLbnCUtI07yk=;
        b=cVid7PnvxGXvkCHkcJqflUOsTNE8wORcH2Ogv3U8+UlTjpsuD1j68bN3EHULk/gfmt
         O7lS3Ol9sbRKGC8clfbiOqSWjl6xFypPaAwd9VaHXKs+cPJHlLjxqAlSAd2MFvrhZ2B+
         /l9hAqWH7ZPEiAQ+wcnlpOvbFMIVXmbKKmAJahcij/bl8vwdq90mFZy29HSPEhMnSrjp
         yHAK5qzAUb5m/PEu6ICyVKbBj0NSVVxB0YvAOUq0TVZD02ABe/oCzmFE/+3qi5s8AVPa
         KD1MXutkAuOvKSneP36hRvGswbzBhN4WuvvRhr3tH7YdOd/7xcBX3Q3DGP8QarYVxXE6
         y5Dg==
X-Forwarded-Encrypted: i=1; AKwUvBxniRsbPdaMP8I0GGaJoC7geJZYu1Cxua2e4/d872+6HS7E/ZDU9MLUtTqVpv6/O6LLgVeWT28B3qbIuWM=@vger.kernel.org
X-Gm-Message-State: AFuF++l+z1srDQhATtGidE7hgTgOc+Pn19gUjk0nKzMsEFcIVreResQf
	qrUZAu5t1Mq8OK7PzSy7XIau3o9VfGRRZPz5fIQnNPRb4r0QGCJQBMh4eMUzQiE8V6NiMs8hJFh
	9gtIJvb4T+aV71AToyuNbXrcG5glsJs8cdFWzG/qzh+oYD/hswRV1upz80Wz7+LWqpIU=
X-Gm-Gg: AYBFou02Mf7agjXiJqLEsF59Qp5YNct+49lm+zrnMDJ3ltnFXA399Y/Y59x9y9b1brn
	guhO4LxX47330JIrpYNvTNvZ6aqLORRogDf5DqkE9NftKsOZ5lYC+2HqLsmRdTc/asD99vyNrEe
	JW+OQ0HBIhBb8h6qEPO8cCbHYnLqSf8p3nej6nYTmgf5HztjUyuICN0+Ns6SuuenlB3AXLwl1UU
	cQHVYGscZ9CeDWLv9ob5Wa9R7DzbujlVHwQLBvMdER7mZ1el7JVnRBh5wJ/ZvS7R0S3IgCZ6tdJ
	Gs5ZPFgJVR9D9qUgZFiz6sooRAuSqPiBLdDJmwkmmOyIfaXTAhJRkobh8C2t0oCbz/7nlXDQy6F
	WTODGD/dDZJWU
X-Received: by 2002:a05:6102:41a9:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7af1e4f6363mr2494685137.17.1790352684116;
        Fri, 25 Sep 2026 09:11:24 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7af1e4f6363mr2494667137.17.1790352683630;
        Fri, 25 Sep 2026 09:11:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm73019505e9.7.2026.09.25.09.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:22 -0700 (PDT)
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
Subject: [PATCH v5 2/7] ASoC: SDCA: export PM helpers keyed on sdca_class_drv
Date: Fri, 25 Sep 2026 17:10:43 +0100
Message-ID: <20260925161049.758913-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX+TZtjV4diCIq
 FBWS7QuYTCa2pxivvCNi+jDVr9/0SLPrBr/+6QHYNW77VQM28MqcOfLHJQO7PTDyeR/tz+VjCfg
 uN/SuBvX+R5S25ekQdrUWXfEldir4tK7ry09E1AyEwzOirTV4n1816b9gk3obhSL0n3hGkdwUEi
 cKZJNXAPHS2r4MLSQ/wJaKn0zV4ONea3tGPHOzz06Kp6qy883st0oaKDwG3nZMcPxJAuqrgTsVb
 qmAJmMLzUS4xpIt803wG4iDNn8kDFVugLZIGSl5a4GJGXCuaE4o9ZTyVG82LjQYMFtYaduSkEd3
 +SP0eSisgYEOLMRNTvGWFXPAOdRSGUEy/LvdC/Z9CAz5bahmj0JlLnILmpa8AwlXzjd1Cu0ea1N
 e2MX6VIhLvqJZxpAQmlTDuSmt8Ohm0TkEDRNu+UPyCL3UpTQC6Osa3X7x+cs1urml6C0MP+t8ss
 qY8PGrye9tVYBW6IvGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfXwZTChKbjJsTv
 bxBLLNSrjl+eNNOWdb0DaKKUYzRLS29L7TW8O+f0JusWUo1jS9+FCufnOdSeZv/J2ahoIlRI4SO
 xW8MEoXbnal1tdyU2e4RNcaIyvmsD7M=
X-Proofpoint-GUID: NzVPcSkA8bVDDWE72Yn0oaZnbqnZKYFg
X-Proofpoint-ORIG-GUID: NzVPcSkA8bVDDWE72Yn0oaZnbqnZKYFg
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab69d2d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3PQulrMEHypX3zRcvmEA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250064

The class PM callbacks pull sdca_class_drv out of drvdata, so the
built-in class_sdw_driver owns the drvdata slot. That works for the
generic case but blocks codec drivers that want to embed
sdca_class_drv in their own private struct -- they need drvdata for
their codec priv.

Split the four callbacks into exported helpers that take a
struct sdca_class_drv * directly:

  sdca_class_system_suspend()
  sdca_class_system_resume()
  sdca_class_runtime_suspend()
  sdca_class_runtime_resume()

Codec drivers can now compose these into their own dev_pm_ops without
going through drvdata.

For the built-in class_sdw_driver, add small dev_pm_ops wrappers that
fetch drv from drvdata and wire them into sdca_class_pm_ops. The ops
struct itself stays private to this file; codec drivers build their
own dev_pm_ops from the four exported helpers above.

No functional change: the built-in class_sdw_driver keeps the same PM
semantics; only the internal plumbing shifts to operate on
sdca_class_drv instead of struct device *dev.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../soc/sdca => include/sound}/sdca_class.h   | 14 ++++
 sound/soc/sdca/sdca_class.c                   | 81 ++++++++++++++-----
 sound/soc/sdca/sdca_class_function.c          |  2 +-
 3 files changed, 78 insertions(+), 19 deletions(-)
 rename {sound/soc/sdca => include/sound}/sdca_class.h (58%)

diff --git a/sound/soc/sdca/sdca_class.h b/include/sound/sdca_class.h
similarity index 58%
rename from sound/soc/sdca/sdca_class.h
rename to include/sound/sdca_class.h
index 57f7f8d08f49..8a6a34a8dd4c 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -32,4 +32,18 @@ struct sdca_class_drv {
 	struct work_struct boot_work;
 };
 
+/*
+ * PM helpers.  Codec drivers embed sdca_class_drv in their own priv,
+ * own dev_set_drvdata(), and compose these into their own dev_pm_ops:
+ *
+ *	static int wcd_runtime_suspend(struct device *dev) {
+ *		struct wcd_priv *priv = dev_get_drvdata(dev);
+ *		return sdca_class_runtime_suspend(&priv->class);
+ *	}
+ */
+int sdca_class_runtime_suspend(struct sdca_class_drv *drv);
+int sdca_class_runtime_resume(struct sdca_class_drv *drv);
+int sdca_class_system_suspend(struct sdca_class_drv *drv);
+int sdca_class_system_resume(struct sdca_class_drv *drv);
+
 #endif /* __SDCA_CLASS_H__ */
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index d7444f442c71..a092ebaa620a 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -20,7 +20,7 @@
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
 #include <sound/sdca_regmap.h>
-#include "sdca_class.h"
+#include <sound/sdca_class.h>
 
 #define CLASS_SDW_ATTACH_TIMEOUT_MS	5000
 
@@ -194,30 +194,41 @@ static void class_sdw_remove(struct sdw_slave *sdw)
 	cancel_work_sync(&drv->boot_work);
 }
 
-static int class_suspend(struct device *dev)
+/**
+ * sdca_class_system_suspend - SDCA class system suspend helper
+ * @drv: caller-owned sdca_class_drv.
+ *
+ * Codec drivers compose this into their own dev_pm_ops.  Disables the
+ * SoundWire interrupt and forces runtime suspend of the underlying
+ * class regmap.
+ */
+int sdca_class_system_suspend(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
 	disable_irq(drv->sdw->irq);
 
-	ret = pm_runtime_force_suspend(dev);
+	ret = pm_runtime_force_suspend(drv->dev);
 	if (ret) {
-		dev_err(dev, "failed to force suspend: %d\n", ret);
+		dev_err(drv->dev, "failed to force suspend: %d\n", ret);
 		return ret;
 	}
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_system_suspend, "SND_SOC_SDCA_CLASS");
 
-static int class_resume(struct device *dev)
+/**
+ * sdca_class_system_resume - SDCA class system resume helper
+ * @drv: caller-owned sdca_class_drv.
+ */
+int sdca_class_system_resume(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
-	ret = pm_runtime_force_resume(dev);
+	ret = pm_runtime_force_resume(drv->dev);
 	if (ret) {
-		dev_err(dev, "failed to force resume: %d\n", ret);
+		dev_err(drv->dev, "failed to force resume: %d\n", ret);
 		return ret;
 	}
 
@@ -225,11 +236,14 @@ static int class_resume(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_system_resume, "SND_SOC_SDCA_CLASS");
 
-static int class_runtime_suspend(struct device *dev)
+/**
+ * sdca_class_runtime_suspend - SDCA class runtime suspend helper
+ * @drv: caller-owned sdca_class_drv.
+ */
+int sdca_class_runtime_suspend(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
-
 	/*
 	 * Whilst the driver doesn't power the chip down here, going into runtime
 	 * suspend lets the SoundWire bus power down, which means the driver
@@ -239,10 +253,14 @@ static int class_runtime_suspend(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_runtime_suspend, "SND_SOC_SDCA_CLASS");
 
-static int class_runtime_resume(struct device *dev)
+/**
+ * sdca_class_runtime_resume - SDCA class runtime resume helper
+ * @drv: caller-owned sdca_class_drv.
+ */
+int sdca_class_runtime_resume(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
 	ret = sdw_slave_wait_for_init(drv->sdw, CLASS_SDW_ATTACH_TIMEOUT_MS);
@@ -265,10 +283,37 @@ static int class_runtime_resume(struct device *dev)
 
 	return ret;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_runtime_resume, "SND_SOC_SDCA_CLASS");
+
+/*
+ * Convenience dev_pm_ops used by the built-in class_sdw_driver, which
+ * stashes its sdca_class_drv in drvdata directly.  Codec drivers that
+ * embed sdca_class_drv in their own priv compose their own dev_pm_ops
+ * using the sdca_class_*_suspend/resume helpers above.
+ */
+static int class_pm_system_suspend(struct device *dev)
+{
+	return sdca_class_system_suspend(dev_get_drvdata(dev));
+}
+
+static int class_pm_system_resume(struct device *dev)
+{
+	return sdca_class_system_resume(dev_get_drvdata(dev));
+}
+
+static int class_pm_runtime_suspend(struct device *dev)
+{
+	return sdca_class_runtime_suspend(dev_get_drvdata(dev));
+}
+
+static int class_pm_runtime_resume(struct device *dev)
+{
+	return sdca_class_runtime_resume(dev_get_drvdata(dev));
+}
 
-static const struct dev_pm_ops class_pm_ops = {
-	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
-	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
+static const struct dev_pm_ops sdca_class_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(class_pm_system_suspend, class_pm_system_resume)
+	RUNTIME_PM_OPS(class_pm_runtime_suspend, class_pm_runtime_resume, NULL)
 };
 
 static const struct sdw_device_id class_sdw_id[] = {
@@ -282,7 +327,7 @@ MODULE_DEVICE_TABLE(sdw, class_sdw_id);
 static struct sdw_driver class_sdw_driver = {
 	.driver = {
 		.name		= "sdca_class",
-		.pm		= pm_ptr(&class_pm_ops),
+		.pm		= pm_ptr(&sdca_class_pm_ops),
 	},
 
 	.probe		= class_sdw_probe,
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 1d7fd6603882..411e3d717bb6 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -26,7 +26,7 @@
 #include <sound/soc-component.h>
 #include <sound/soc-dai.h>
 #include <sound/soc.h>
-#include "sdca_class.h"
+#include <sound/sdca_class.h>
 #include "sdca_function_device.h"
 
 struct class_function_drv {
-- 
2.53.0

