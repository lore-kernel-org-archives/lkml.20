Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DA330BBBF;
	Mon, 12 Oct 2026 23:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791846353; cv=none; b=kwGx6VNiHo1taWCfiKFJyyFDgHU2Eo/BU3ojEwABDOezooIu+KNDKpdmPF3JTekzYgybxW6iPyOsVyJtW8mqSLCYR0VTFMbGQ/G7rgP+k5sYmMKtgJyEKaVreQmtlgTPhc75uHOHN3yqBGSq9CWvjPplgqNn81iOCqFCKhar1Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791846353; c=relaxed/simple;
	bh=G5ga4rbNA4Bu85EmqkY4O6wSytGKel2/17oF1+EgulA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nWR20ny1x9gEM1wjPBMl2rcUlncBbWvFfjZVw3RG+63/nG5PjFRb6grAu/JcH7kgDojYYEbVGgTmNXu86kvCbDT9dMuFZ0J02wI3lIxR5G6pznj8Ha4sZq37Ev0xC9is0ozUrCV5vTqiyKvIywOEfyePrkbJY9vKz2A2gJ5NBTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=Q54EhBg9; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="Q54EhBg9"
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJOAGU2753738;
	Mon, 12 Oct 2026 16:05:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=4OobPzwl+rKR1jcWpgUcJcn7lQ0ZaUS0UUMq4
	55NFX4=; b=Q54EhBg9bvkiI6jdjbLVYOqWkRw8cqXOfIYU+03LLra1eL9FmEorl
	dWjwf14bAn0EMmsGgM3l/7NMKbZXoti04FtdXKmhJNrGIvBaxiJFMpaNa5Q8EP18
	wPoyrCx+mRrvIYAXz2c3OT/1kHAjQD7uudhfVzWouSaLTACQ1M3ZS8cCAet5Z31y
	SH/cKDd+1Tvm3ebmXQGbJrc7AkLUy5kyWqwuD815qZMcAf16X2uIwE+4ELvRepvH
	7A1Xj/uwQ4oyszfYxCj5+7SXvOA8abx7ZA9qnpTuEURXi652NplKZiFImY9FHOvu
	4CHAcxCB2HjixkmGTHwHV/7vP/ADrW3Jg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4h7jf78jxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 12 Oct 2026 16:05:35 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.49; Mon, 12 Oct
 2026 23:05:34 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/4] coresight: syscfg: Match feature capabilities separately from device class
Date: Mon, 12 Oct 2026 16:05:21 -0700
Message-ID: <20261012230527.750567-3-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261012230527.750567-1-aaupov@fb.com>
References: <20261012230527.750567-1-aaupov@fb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA5MSBTYWx0ZWRfX8TyiWm39SbKO
 MWmdUHnkeZEPQEoeLcsLn2jlt7wk0alJrRt0wwH2/KefvWUPVuZJkgxHS3RutQ+mmuw6P82SR7Q
 N2IX9exxRtLV3DbfZjUco6AMLrs6ObY=
X-Proofpoint-GUID: pR0fbDFx4grSowKAFrFiG7P4etG6baAN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA5MSBTYWx0ZWRfX7q4EDHAIL8II
 xKkqnILXFiGTKxEZ4+5g8einZ0BPaP1gYmBwuL07WopidXJB+uoeZQsEYw3NM2+u7orHyoITkHa
 75Z4L2QQScT7/Wjp4MoLRhaUbH2JfWVEgaCQR+Sj+C5uq+/JOlh45B22f7b6Z5IHDjDuWAQ50in
 AuFexDWFG1mTWRFP6LNE7edblIbkxV3p5RycpDTrTeN6LroE2vhvY6oZ69tOEnfSwFt2Put2a72
 sfKqmSIgAemIGsvCQT5HOGPNpISfoMXUxv8SWWfCqG4PUnxeT/4GlkN4HBtbRuyCMhepYvx/H5N
 1GlfN8RckYBVMh9/vLpfMAY+ZSW8BvI9whfO7fMsfC1XigN7oRZl/nf0RxMoMCdz8mxCq3CDydR
 3ueJoYLKKSdbb0xHPpM6xJ9NbSKaD4xkUmFD1GU7yIed7qZhQ8k79nOhWMEEgzzzVqzFOfvS7i+
 4zAKhhjJT7gyISxGTyw==
X-Proofpoint-ORIG-GUID: pR0fbDFx4grSowKAFrFiG7P4etG6baAN
X-Authority-Analysis: v=2.4 cv=f7rdl+yM c=1 sm=1 tr=0 ts=6acd67bf cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=FOH2dFAWAAAA:8 a=RZ0xLGkQKdM_NVGOjToA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01

A feature loads on a device when the two share any match flag. That works
for device classes, where a feature wants any one of them, but not for
capabilities a device may or may not have: a feature that sets a class
and a capability would still load on a device of that class without the
capability.

Reserve CS_CFG_MATCH_CAP_MASK for capability flags. A feature now loads on
a device that shares one of its other flags and has all of its
capabilities. Check this once in cscfg_load_feat_csdev(), which both the
feature and the device registration paths call. No capability flags are
defined yet, so matching is unchanged.

Assisted-by: Devmate:Opus-5.5
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../hwtracing/coresight/coresight-config.h    |  6 ++++
 .../hwtracing/coresight/coresight-syscfg.c    | 35 +++++++++++++------
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
index 90fd937d3bd83..af6ef96b9ae01 100644
--- a/drivers/hwtracing/coresight/coresight-config.h
+++ b/drivers/hwtracing/coresight/coresight-config.h
@@ -30,6 +30,12 @@
 #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
 #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
 
+/*
+ * flags defining device capabilities a feature can require. A feature loads on
+ * a device that matches one of its classes and has all of its capabilities.
+ */
+#define CS_CFG_MATCH_CAP_MASK		0x0000ff00
+
 /* flags defining device instance matching - used in config match desc data. */
 #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
 
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index a816c22c87bc8..1545d64afec01 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -172,7 +172,21 @@ cscfg_alloc_csdev_feat(struct coresight_device *csdev, struct cscfg_feature_desc
 }
 
 /* load one feature into one coresight device */
+/*
+ * A feature matches a device that shares one of its class flags and has all of
+ * the capability flags it requires.
+ */
+static bool cscfg_match_feat_csdev(u32 feat_flags, u32 csdev_flags)
+{
+	u32 caps = feat_flags & CS_CFG_MATCH_CAP_MASK;
+
+	return (feat_flags & csdev_flags & ~CS_CFG_MATCH_CAP_MASK) &&
+	       (csdev_flags & caps) == caps;
+}
+
+/* Load the feature into the device if it matches, otherwise skip it. */
 static int cscfg_load_feat_csdev(struct coresight_device *csdev,
+				 u32 match_flags,
 				 struct cscfg_feature_desc *feat_desc,
 				 struct cscfg_csdev_feat_ops *ops)
 {
@@ -183,6 +197,9 @@ static int cscfg_load_feat_csdev(struct coresight_device *csdev,
 	if (!ops->load_feat)
 		return -EINVAL;
 
+	if (!cscfg_match_feat_csdev(feat_desc->match_flags, match_flags))
+		return 0;
+
 	feat_csdev = cscfg_alloc_csdev_feat(csdev, feat_desc);
 	if (!feat_csdev)
 		return -ENOMEM;
@@ -212,11 +229,11 @@ static int cscfg_add_feat_to_csdevs(struct cscfg_feature_desc *feat_desc)
 	int err;
 
 	list_for_each_entry(csdev_item, &cscfg_mgr->csdev_desc_list, item) {
-		if (csdev_item->match_flags & feat_desc->match_flags) {
-			err = cscfg_load_feat_csdev(csdev_item->csdev, feat_desc, &csdev_item->ops);
-			if (err)
-				return err;
-		}
+		err = cscfg_load_feat_csdev(csdev_item->csdev,
+					    csdev_item->match_flags, feat_desc,
+					    &csdev_item->ops);
+		if (err)
+			return err;
 	}
 	return 0;
 }
@@ -739,11 +756,9 @@ static int cscfg_add_feats_csdev(struct coresight_device *csdev,
 		return -EINVAL;
 
 	list_for_each_entry(feat_desc, &cscfg_mgr->feat_desc_list, item) {
-		if (feat_desc->match_flags & match_flags) {
-			err = cscfg_load_feat_csdev(csdev, feat_desc, ops);
-			if (err)
-				break;
-		}
+		err = cscfg_load_feat_csdev(csdev, match_flags, feat_desc, ops);
+		if (err)
+			break;
 	}
 	return err;
 }
-- 
2.52.0
