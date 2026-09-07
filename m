Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035E7443E22
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770318; cv=none; b=IvZ6A+eBQ2maG5041KyadWI74SmvT7GCXazzIw7fg1ErEbNaVoe9+udcMec+o933rO+te8nWqxZ5LbL0inR+KDxVacmPLTfczAxuL20f7nyBq+XIaSKCgnC9BT33vhzqZGQJsevYwPuHg+Vb/dUvzQ3uWnqgg0eCe3KsbxaH+As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770318; c=relaxed/simple;
	bh=0p8RCwSnzJRObH4V/hHmFZHqxqK5DRlHfnAXqVAAiug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icnv4GQfsevZp5nMcHLqHWBJIElxFUkUopZNdkJKGxyfeYu5SZ8TRNiDfno8w+A8jynDa7ONO5CGGKC1b5JjptalwcqlLC4bMghUUMixbFZPoDIuLCxM4KncZSIXoKCWXmWWD/Ok5EGV3mbNjOzeVPl95nNX4acI/0A6xcF7mys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoznclFE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCMVTTJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CoznclFE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JCMVTTJb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6878Rlg33872901
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KnWk5w0YLVl
	dL/piP7sv25BHvbCU7XI78c1SRugNzqo=; b=CoznclFETHq6gWvcrKGdkgzdVJU
	WbpsZDKdBktY8kDNvmkx5luylPD/csggtOcPR/1pXl+sSG6GHAsU1ELmp5TCyMZs
	9F68IFPvKfkTl5ObXNP7z/80kUXXD2lizwpDYxkdDc/NkgsJ3A2UyyZwcaRRPMIT
	NsxVljG8u49+ZLHXMa//Yjsmvd/piOq6+xb3P6bgfnDXi8/YxCRB6uxG3hDb1pnO
	aQVVBqLVhmcn55iSEiSObcF7bD0/wtcCTQqnwCw9wwaeJPIPqRSQgVeGKE+Sbjis
	/ERbu/vzQlmxKb1fRllczOKPznPoPWjhFmLbwiHy6bzPNe1Pdb6VbgqTocQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg01qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:38:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939a6937513so116726285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770313; x=1789375113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnWk5w0YLVldL/piP7sv25BHvbCU7XI78c1SRugNzqo=;
        b=JCMVTTJbhi1OjttUteLVQskqzMpTTrqb3S1w/PYZ0WqIttNQIHzA1HDyn+3xhi+yQa
         PkB4w6owidsbh8FGq0cbldZ1V2OJcrl70rNrxLJ9WDXz2q7lslB6IiWeG6eIvi5CXmml
         rLQOLcjTSLtyRjkv/4Ko+jFIX1eF934xvUGZuw0xhXPiv7R5Va7XG1HdL1FvnPZpFVhe
         F9a4BlI99ndZmofwgwnuCT4C/aDGwj0HEh+yLddhAviO3JFcN9iI7iUAD1kqheJ8J34p
         tecU9L8Nh6F4MbNIssmpVz2hV9AyugV1UNemCTDzy1lhDUa0aQ+5D9t7vd1lXSozg077
         DboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770313; x=1789375113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KnWk5w0YLVldL/piP7sv25BHvbCU7XI78c1SRugNzqo=;
        b=QidFggmXAiJ1ar8iuc6TqEwTVRMQsI3L+ZlQwdoCgTkf8HsRqBX2tyIiMprO7StIFY
         C4LHQ5O8GR2vZ6mp0lYQsvALA89rRuigirneXLCdjUjmbkbXK88Hf9S3GsHIpRnxf3+x
         E5Mq0+8qfxK0/xF1o6OTQ/6Me5jF4EIVn2WvI7CXgXIRpHGgQxU8jezzQiLSAjNZfOju
         xJ6qpJ678UMjGZNWepkZqGvVC/cqbePZr5uX3qQFVy6SimwcBdKH/XCsG9ImjzhMr/rj
         YYsuaqjTmOt0EsPasKdCCI3mfV/EnYGyx7BkZ3Wp3F4N5+VYCXlOJ2PFEDXyOV/ZC8Mz
         GAWg==
X-Forwarded-Encrypted: i=1; AKwUvBwNkVR8fbKv+YdsnRbZnScHLnJFslTV0+wGK11o1LTj/NljU2kf1bGQ5xwDXDCq8K1b4AS6wZ3jbIOal3A=@vger.kernel.org
X-Gm-Message-State: AFuF++m8rPOSvHxm19SyEeFezkBtmzqWQDcNI2kkcnE/3eMbAlaWZUsB
	nW3U25m8fnxHjtGuZjPwATGMFmOym8EPHaHWVTehVGCnkjrSqZFsaXFWq5nnL45ucNvUt5VI8F9
	vidqHshVokOALOX3nSXZWoEbuuHmKRVOneLymzgviRrNkiXua90YJ250Zy5TkWbzPetw=
X-Gm-Gg: AYBFou2vuBS4IUl5J6vRFx/2pKcxa3DKsSvfLoGiu6ApK76eFF0k1j4eKLpFADY9xQ4
	I7PyWfUyk3AmSUPhrKsoD0owj9+0q4jVKGNDkQB2c0A2lEmeOnGkl9eQfCCAv1C9IZS2wZYPw2L
	YBpcmit1RsrpLeu28y/VNkTSTaSjRQyVXD5qY20TsjvPKj4lIzQdRui3pjAPjVFQiZr0KY6Wxg9
	9pa6xjixeA4WH0wL7U37vwK0CY4G+sCVgWC0m6afnebq7qOHGvwcxE25jsgOY0EYDtHR6f7r+lI
	kE6ZAnq/bKc5fKixGtU/xKgrkcNIbsiCgJMeQfuTSYO4l9rv0vfbDdsCjCThBT0vCVosEW3kHJ2
	6czpH32F6qY99XA==
X-Received: by 2002:a05:620a:8386:b0:939:6d22:6fd with SMTP id af79cd13be357-939803712c1mr2067472185a.18.1788770312948;
        Mon, 07 Sep 2026 01:38:32 -0700 (PDT)
X-Received: by 2002:a05:620a:8386:b0:939:6d22:6fd with SMTP id af79cd13be357-939803712c1mr2067469085a.18.1788770312351;
        Mon, 07 Sep 2026 01:38:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 04/11] ASoC: SDCA: add hw_ops with hw_init hook
Date: Mon,  7 Sep 2026 09:37:18 +0100
Message-ID: <20260907083727.733705-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX32goPGEPBgBv
 H7XmI1clcRF2O4m0uAMuJJIWS46TCegYhb0LXYujBR04IjYxB3qtMJtsiivGz1eaJJ7b1Wy6LPR
 Fe33gzCvZunXKBXcCP840/6+o3uIVoCCFTDJHtL8T4HWfzWyd65irUKqr+pvIMnyS9bp7Y9FLWf
 oIukZs5ApDel8m5ixSgyGVP7kkGwS7iFQmq0/YISmES1k+gAFINuNvJ+Wodptrozh6BS8l4PGQ7
 0dcE6ZvIGUuUUlHKHeUDD98M5nYJTB7ZITqQosr+OJWQunpwkhfmcmQ8knbwVtOygHH7NqHJUDS
 IQN+clRRtcMmO3/AS/zkeMoCDmLH/C92qXKI1iLcoeyyBf9TR7JCKSfompGiizIekp53pMKJL4C
 AjNBuGd4Sl/lwwBKMGvcmsx4mzo2Dx8AzdezS71vs9/qhx1gVhxoB++/HU7mn+KCprpLEk2iQq8
 L+ey3AKtEgsYeQiu5OQ==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9e7809 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=TbNiP_vgcRotoqA_lb4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: tPMx1HzrtLk6Z8XVHM7f7BORhzPvDGMu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX1PnDH5D5ZxEq
 AGJSWmLUkuG4J11xtFbwiLHV2T8Pkouas2w0YQjL0PQYeEV6veaZMAR1HvRRDHoY2gndUVsNYwI
 Tx0tolfExEFNuTkezJXoucKEzDS5AXc=
X-Proofpoint-GUID: tPMx1HzrtLk6Z8XVHM7f7BORhzPvDGMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070093

Add struct sdca_class_hw_ops with a hw_init callback that runs from
sdca_class_probe() before the class regmap is created.  Codec drivers
use it to enable supplies, toggle reset GPIOs and program initial
vendor register state.

sdca_class_probe() gains an optional const struct sdca_class_hw_ops *
argument (NULL for pure-generic SDCA parts) and stashes it on
sdca_class_drv for later use.

No functional change for the built-in class_sdw_driver, which passes
NULL.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_class.h  | 17 ++++++++++++++++-
 sound/soc/sdca/sdca_class.c | 15 +++++++++++++--
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
index c6063f22be7a..3342937d09fd 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -20,6 +20,17 @@ struct regmap;
 struct sdw_slave;
 struct sdca_function_data;
 
+/**
+ * struct sdca_class_hw_ops - optional codec hardware callbacks
+ * @hw_init: enable supplies, toggle reset, etc.  Runs from sdca_class_probe()
+ *           before the class regmap is created and before the slave is
+ *           ATTACHED; callers needing bus I/O must sdw_slave_wait_for_init()
+ *           first.
+ */
+struct sdca_class_hw_ops {
+	int (*hw_init)(struct sdw_slave *slave);
+};
+
 struct sdca_class_drv {
 	struct device *dev;
 	struct regmap *dev_regmap;
@@ -27,6 +38,8 @@ struct sdca_class_drv {
 
 	struct sdca_interrupt_info *irq_info;
 
+	const struct sdca_class_hw_ops *hw_ops;
+
 	struct mutex regmap_lock;
 	/* Serialise function initialisations */
 	struct mutex init_lock;
@@ -35,7 +48,9 @@ struct sdca_class_drv {
 
 /* Library helpers used by codec-specific SDCA SoundWire drivers. */
 int sdca_class_read_prop(struct sdw_slave *sdw);
-int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
+int sdca_class_probe(struct sdw_slave *sdw,
+		     struct sdca_class_drv *drv,
+		     const struct sdca_class_hw_ops *hw_ops);
 void sdca_class_remove(struct sdca_class_drv *drv);
 
 /*
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index b952fa6eb802..374de7d9e0b5 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -153,6 +153,8 @@ static void class_boot_work(struct work_struct *work)
  *       allocation and sets its own dev_set_drvdata() -- the framework
  *       does not touch drvdata.  Typically embedded in the codec's own
  *       priv struct so codec drivers can keep per-slave state.
+ * @hw_ops: optional device-specific hw_ops (may be NULL for pure-generic
+ *          SDCA parts that need no quirks)
  *
  * Codec-specific SoundWire drivers call this from their .probe after
  * allocating a struct sdca_class_drv (usually embedded in their own
@@ -160,7 +162,9 @@ static void class_boot_work(struct work_struct *work)
  * sdca_class_drv fields, sets up the class regmap, and queues the
  * deferred boot work.
  */
-int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
+int sdca_class_probe(struct sdw_slave *sdw,
+		     struct sdca_class_drv *drv,
+		     const struct sdca_class_hw_ops *hw_ops)
 {
 	struct device *dev = &sdw->dev;
 	struct regmap_config *dev_config;
@@ -178,9 +182,16 @@ int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
 
 	drv->dev = dev;
 	drv->sdw = sdw;
+	drv->hw_ops = hw_ops;
 	mutex_init(&drv->regmap_lock);
 	mutex_init(&drv->init_lock);
 
+	if (hw_ops && hw_ops->hw_init) {
+		ret = hw_ops->hw_init(sdw);
+		if (ret)
+			return dev_err_probe(dev, ret, "hw_init failed\n");
+	}
+
 	INIT_WORK(&drv->boot_work, class_boot_work);
 
 	dev_config->lock_arg = &drv->regmap_lock;
@@ -222,7 +233,7 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 
 	dev_set_drvdata(&sdw->dev, drv);
 
-	return sdca_class_probe(sdw, drv);
+	return sdca_class_probe(sdw, drv, NULL);
 }
 
 /**
-- 
2.53.0

