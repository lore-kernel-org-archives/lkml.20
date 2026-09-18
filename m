Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA20D4F5E14
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737578; cv=none; b=vEs/Jni00RnIozsPU2pU83FX2K2+VmFlHp2TauvaT/OUGQJhVFrRfB9JyYX2pER4kieG8NN/gobNUx3qz6Sibbz1p2XSTxNwzerYB02VEBo+cKNMrKANRHncwklX/wfcHl2Jvrf2vZg+HVaE0e8yjcv4EoAKKIOM2ivLhMkYM6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737578; c=relaxed/simple;
	bh=DX/k2+cTu6rvPz9eR+rvoARBCOb7oGx3eJBOQvcqBx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+7grCwk/81BKnGbz5dEvvRo6z9n3rwN5nITbJysqQ5FA0+/2Y1UNbXum3KG6YAB2VfmDIQ+hz5EQUyYmQyWBsjDW0XWivhoutoZtvFfW8QRGe32MPdLieu4J5VoRn4naVQw9XueZWXeTaYU0qt83ha9BV8vLvmEJNjWbHIjHNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nii4CUWj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DE19lT6c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nii4CUWj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DE19lT6c"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICu1gq819756
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AAXGraH2Q+c
	EaofkWeUO4doE1Ao8y1Vg8kmDtzDBeow=; b=nii4CUWj8WbCxPkAWdf2bEU/VoF
	rg7eX/S4pZUEiT56LBWT5LxSliMJ/QiPyswGFaUSHXxEhKhzUEmsN1cLbFs7Og+n
	GJ8rkGQOyQfpITChxvWPfJ9PQUEj+kyWsSMBU8iZav8FnE5gMXdbtPX51hNLj0F9
	KGLZt9sja3q11iIf9oLl5Ji6FwjR62xK95IbwAEsVdq+s3GwD7FmTgD4ySGbrYiq
	PB/D2mOqzbcdh03tDbP0JbQy6El0HjWrzwk8uQfWzRTTMwCs1S9t8NiODwDA0g0W
	kbrmj92hcjyGAZOHP7joCcYVwMSEUmElGh2JWr/bt3JQ1mybvPltnXyvxeg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrt2vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a08ff8451so122696885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737572; x=1790342372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAXGraH2Q+cEaofkWeUO4doE1Ao8y1Vg8kmDtzDBeow=;
        b=DE19lT6cNXK7HufNih5FhK0EbHhluLxlhm2G2TnDNEz/+rqqZLTPmT6FpDpflgeL6x
         ztn3FErRkGuSVhmFmaT78tZbHDUmoaSA1X9KqI+qPIYUHOxMyN1MTacYkqjsVzEK2RWj
         Yn1108MWhaPD67Sw7QAMk8nv3FIkh22YdeunwnFrcDvLY5lxYOLun1+5RgNduiFeUP9+
         +ATajoD0CmnAFoiinVgL0/8/VAfqtrR1faZWSZtpP0n276jloT83RHWLazCFsM1PF9hy
         SrMdLvpAVuQY8KSydiKYreGg3qDDEzhHtKEntIEDXhMMFn7M7SemCRYxQ1nulgSCiM+v
         itfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737572; x=1790342372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AAXGraH2Q+cEaofkWeUO4doE1Ao8y1Vg8kmDtzDBeow=;
        b=u1mk61+u+nH/o5kw+0zb1XV7Yqt1N+F4TYAyq8pgqV6jvQxNRgIz9eFFDP68lmyxf+
         Fo293zMjjjAxPMZ1pXHGZjls9OAPX6LDzQXuda8F7vEt40fEZspiEjqVkKh6oXNN/JXu
         SFsKkQoGdXzxEtkE7Psz7GMccEYC7C42LFrLK8l96WXBjeYoYWlZepjsIgWGi1bo6fAg
         PPp/TBaKz4c03mWc9c4i1E5vbX+w1RM/YmW+ahkX42b+eExByp2l0HHX6nRYzm7kG9Fa
         buL8I4K09VWHQWYQPco2DKCHf1RU3LTG/7d/53W3U5xPOGFuC3h/vZqWwEbHAhSDUv91
         G9GA==
X-Forwarded-Encrypted: i=1; AKwUvBw7VUGJrJ5AQBNbSBJvA1eiIAe865s2zi55fPSMsfmrhhsXxRPs7NXHWzYiZBqLHuX8k7GF8q3NNJDrjnA=@vger.kernel.org
X-Gm-Message-State: AFuF++lymKYgnvFrLfE/YLgpSqJyQDecKPdvnPoKlYImMOzIUOHRUANV
	otJZJ2gBZ7etF9gqSSVIP9pzc8+dGtqO+b1gwl6foBPYzAXtmPUIsPjDxvwN+Tu9JF7bbTfhnwK
	JfsC+YNS2FE4fMD6nJAXvwEe5DIwfsDceKQroDzPS8Jo6eN7wJAyNeIAtV9zfrMzQRnY=
X-Gm-Gg: AYBFou2WWtsjLc6RfF5OJUZZquatu/SqF7GNzfPZQptt8wcyeVrs5tHIkIzLe3dHJ50
	Uhqv2i95+i6WArHm9gEMH271OazBaH/rNW6CsBJkQPThYWHG3eBZ4jZVVXXNPLA23eOhPfYfiBX
	at36gxqZHbeFhzi++h12U4s7Dpd8Om1c9b5nXFDHBiPwM56EtDYLSfg3vvcaxWwJWoSx1dfMXkK
	SLLAm+hnK1q71sc+uBMNg8uQs3FvVwrbPjLsajMaVAn+YRgr69fyxqU5bFXwojzuHmmQSthjBnZ
	oTmXrA4p8G8sya6bosHl0UI1CkxAwW/t4z7XsM9j7vAgFBf5xFTEY2zTgBSbXI5kkmfQxTcjFRe
	UhDUjfIlZeGeDZA==
X-Received: by 2002:a05:620a:268d:b0:939:abe1:ed1b with SMTP id af79cd13be357-93bdc468cd5mr318317385a.0.1789737571766;
        Fri, 18 Sep 2026 06:19:31 -0700 (PDT)
X-Received: by 2002:a05:620a:268d:b0:939:abe1:ed1b with SMTP id af79cd13be357-93bdc468cd5mr318310885a.0.1789737571204;
        Fri, 18 Sep 2026 06:19:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm48254015e9.8.2026.09.18.06.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:19:30 -0700 (PDT)
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
Subject: [PATCH v4 2/8] ASoC: SDCA: export PM helpers keyed on sdca_class_drv
Date: Fri, 18 Sep 2026 14:19:07 +0100
Message-ID: <20260918131914.681588-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad3a64 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3PQulrMEHypX3zRcvmEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4NyBTYWx0ZWRfX6pAmFVjivFN3
 ZlezmEpfmzWKT2H3kgqYcbhkqpAbVqk8rS58gvRxcrIdA8DLkQnm6q4koDpTGcgYHy/Cicx+ccA
 mKaq7s1/lTByMoodhDVOTbfWsAZ9XAl/fxtRkl9Ouk8ipfKRQeeI45nDktInuZdCSDGrNnxNvun
 k6K67HFn0hpSIJIFQvdW1bGi6ubZ+Er3V588rTt0LBA2/G6mW6IoHTeB/Wf9RoAqdzv5mUYdqNQ
 pVMv7MrIO+iuMxlrGiZsjEzW0cRK6wrIhiVtKBWSv0f7AUl+V3csjB3E1KzExkd7NqXqab4C1Qo
 UfSYYXTEzAoGnePfA1/BUTKfkdrBJ4xz8SaAfMcPaIW62oJpOTi+Y0fNg0e+s78EM78J1VaeNSZ
 m9TwZKkW4pFkJq84a5EJs4fBHsx6trViewgONYcSd+yX15W4HKe3jRCoyBI6ySzShzIAI11sqm2
 rvIXTGOJ8a3mmx1ILAw==
X-Proofpoint-GUID: ukAsU3ceSNywlhXukAfPFHBpUve7sXwT
X-Proofpoint-ORIG-GUID: ukAsU3ceSNywlhXukAfPFHBpUve7sXwT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4NyBTYWx0ZWRfX8bL934vt9CjP
 vuaVejZUn8xF7gEBziEiLAwrIAdeVn4cPuxJOdTUSqBQ3yvvg2XNcdah2ENUIuh3xVu85H1yJly
 UmL9fN/jTxYL3j0pP/NAIA9gZwS+U5g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180187

The class PM callbacks pull sdca_class_drv out of drvdata, so the
built-in class_sdw_driver owns the drvdata slot.  That works for the
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
fetch drv from drvdata, wire them into sdca_class_pm_ops, and export
the ops so any generic SDCA slave can pick them up as-is.

No functional change: the built-in class_sdw_driver keeps the same PM
semantics; only the internal plumbing shifts to operate on
sdca_class_drv instead of struct device *dev.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../soc/sdca => include/sound}/sdca_class.h   | 15 ++++
 sound/soc/sdca/sdca_class.c                   | 81 ++++++++++++++-----
 sound/soc/sdca/sdca_class_function.c          |  2 +-
 3 files changed, 79 insertions(+), 19 deletions(-)
 rename {sound/soc/sdca => include/sound}/sdca_class.h (57%)

diff --git a/sound/soc/sdca/sdca_class.h b/include/sound/sdca_class.h
similarity index 57%
rename from sound/soc/sdca/sdca_class.h
rename to include/sound/sdca_class.h
index 57f7f8d08f49..ce2ed5f33e7a 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -15,6 +15,7 @@
 #include <linux/workqueue.h>
 
 struct device;
+struct dev_pm_ops;
 struct regmap;
 struct sdw_slave;
 struct sdca_function_data;
@@ -32,4 +33,18 @@ struct sdca_class_drv {
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

