Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A408440A0F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770312; cv=none; b=uCE9lo1hQ3l+1rGK+xsZw78ECAsa7C5WGm7V2mMl846N3sq8P2yFoE6GfgUrq2XoeBQqJjQhzhFckwHAGiRguw/BMNjhMmGS/QSTvP95RxqIOsbbl/7H/5DZclFBlXIZ3dSnWAo3sWqV91T6/uhWIWfM6q3IX+nA006QzJVAfG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770312; c=relaxed/simple;
	bh=ziCjRvS8TtdVYiLj4p88US3Q9YZrXTSiDrYmN2e6/A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7Tri1QSqZIE7l43CwRNUC4R5GZhMrNsFqBd62kfSTo7bfZit7V7IBWIAZnPUlntTZVPNnHucQA9y5rLfOeVsNK1YZlDX3vjTTbxAzwpbx7ti+5MUwrNJlVBvNOfIZJbnzwP0aqhyZI61qKtqvAueOPysGstOZs1r3shqBefYXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgyNXKab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOtNjfC7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgyNXKab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOtNjfC7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877p8K73657693
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uwZCEZhplYW
	S8qCNm5tYopBzZBRREgKD5gOszws1oY8=; b=hgyNXKabhOsexxnpyh9VBGqls9b
	mkalo4AxGOHwci/hU22eYviw6r92j8s2T1qBwoiZby2jqYTXLO1St4tbBrdFhNPz
	CB/lF0Mxp+b4yjhIeGg8+j1+f1zBmA0SJsz04VKqoOZoZnlTcNzg3LFQpxBDLPLw
	r1D1zmj5YytJDn7DsObjZNmsuizm72CBdYEM5EulnkLUTXkVtHMjrvXB+rS4BDO2
	pH4p1hht+SNYSiqSG141Hn8orm4djkjRZ0nv7gYRmenDTYWIoNY9L/mtAp0qvOK3
	vMJ+KyTNirswGRUKq/oT9Z6Vvd/mBo9RzZ6Bnb/LiZi8zi20vYh+mOZ3wPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86r6pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:38:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so623202185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770308; x=1789375108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwZCEZhplYWS8qCNm5tYopBzZBRREgKD5gOszws1oY8=;
        b=UOtNjfC79I4HSvU40bIrzoUtkc0s17rmT185p/E3qkrqW6VWtoz+nEF9BkmpbMtI2v
         I2ve2Uli6HKdrSI2/Hxa9E8RSHJ4jk5IcJw1K9bkoxM5GaI1jAbrRXKXi31ShraABG2g
         GGRRS4moC7D5gjqELfPtkcn0PU+F3TqkTEySRWfOmQShv1fkDXZBogNfZWDoTrAflINj
         R5Mdrj3uz4Yr5jHvQGzGF5wIYQ3pSRVhPFDgZw2CkQ8v8mU6u5lmyQz9yZy2HnLUg9le
         0cIhc5f0Ecq6UrLbj1vPbbSyYTlJK50E3k//2bk7Ud+R4C2Z/Va/3kLJN4LeBmtb6g5R
         ooqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770308; x=1789375108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uwZCEZhplYWS8qCNm5tYopBzZBRREgKD5gOszws1oY8=;
        b=mbUB/DwH+DdtbI4+eZLFjkh6fJMXD2I9c4nTsVFeFEdrYvEK8mPzbpt1FfDyN5KO2k
         HgIwCF74+z0UKp/EahmsPBV8P5b6wgKhSY+JmUo+Ub7qLnTgxyk9x+Zhd5Q0dZ5Oyipm
         EN4ePpTN8+kwrsIB57zDQJudI/jOrpQo90CVxpOY/I48KsmXCboxxGXUsKGW8NRvH9U0
         ioSTXbTeGhPT50p6YfpJ3AY030qzP0x2f6fNa+leeeLzPamwcQ3fmaXk8PosbDRXLTFl
         k/2gWLjouocs6ifN9rBTXxgVSRJqzsico7hFSFFn0R2ulO5RlETS4foj3wQwkuZaUnSU
         pJtg==
X-Forwarded-Encrypted: i=1; AKwUvBzzDSZOsCyaKidyShYyUYzYE9rs+WSKCIAwSeBEgTx9K3d/ada60Ln3BcFQYQc39Pt08uZuhUzQPeqz9pQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kv5C2j63Ov1ce7TThLs7B04ThUIjKnjFcmlGQJmOt+oXqGxv8m
	TTkjllFzDmc84/EZ/fMnarVY7vQfbzi5RnUvaGDexLP3MztUFVPnLwG6CQFnQlEOafgtYeXhHMK
	9UlB1SOD0je/ktvIhp4dkBRJmiOcQMlSwec3kuNUJL49ajJ4GcO65VOdIh3A2Spxhydo=
X-Gm-Gg: AYBFou29oxM4GFFTPeHGL4RmHUCsoeujpk4xlxRhTKGovVHtV593ratHPctjBcR7yw5
	kXIW8ugT7Md+oyMUefF+vsoQa4DY8ULLTr8ckHaQeMtGrDhC42fxa1LVY0tjdN44xt/MBTv2RJw
	DoRncK/+erBqkLBb/tnYmAYpLYHc7UyLlbB7gVIAvMgM4WySwaHYW1s/WeaclK0cyhFVCgykn79
	aFGUbVzCnBL9UZ4+yJsBsXrvmMAe3vt/CBVsWRhQxcB36pUqT1iAU4dTdvC4tRtOY9RobE59jMn
	O9d+h4e895q4t7uuCdT+oQ1x97s2rb4EAHkLUo4oieeUC+bRti0HjBUwI1hLteOxStT88zIC+/c
	eez0nPxu9RxojUQ==
X-Received: by 2002:a05:620a:22e3:b0:937:6d2e:d023 with SMTP id af79cd13be357-93980449a63mr1676775585a.30.1788770308507;
        Mon, 07 Sep 2026 01:38:28 -0700 (PDT)
X-Received: by 2002:a05:620a:22e3:b0:937:6d2e:d023 with SMTP id af79cd13be357-93980449a63mr1676772185a.30.1788770308078;
        Mon, 07 Sep 2026 01:38:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:27 -0700 (PDT)
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
Subject: [PATCH v2 01/11] ASoC: SDCA: allow building without ACPI
Date: Mon,  7 Sep 2026 09:37:15 +0100
Message-ID: <20260907083727.733705-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: Xqm7LyjcNCjtAc_4ITZUdqx-tOawA8KO
X-Proofpoint-ORIG-GUID: Xqm7LyjcNCjtAc_4ITZUdqx-tOawA8KO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXykjmopI3gRvy
 e47CDgRaERFHp2+FAxiN8j9n9u+JCj7lksqu3C6yvJLc40slfThImdNRGohmWsj8zoVknZbNKC2
 gE+0kP3veUKX9stP2V9qiOsOeAHl9lg=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e7805 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=RY6toyVs4qztpF5PSasA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX46Hth2Vh5dXB
 X+8nxpPYbusSaPM88IwrCbFb9sd/gcs2wDnCKS1Rcu07x2pD6d8dZNuFmQcPZb7NW3kTeHe6BxE
 JUja4WSuOTkTBVH7qUWvWE29vWnepc5quUSq5Su7K82uDGRdml0EdBW1RIvMT48muNMu+fzN1G9
 Cb/vUWsDngl13lKAnn8MVvIpwPU6SSNPqLO2T9dFhfQa4/V2IAop34gNRkkayB8FxCd8paIFhUn
 DKpx8jpoTZpM7QH+ME7mGBA45kgeODIASAfa8U/DppdcQ3M6X7xsM1usk80kVezIbgLmsANt3aU
 llBj39+T8lzgP75CQRy5xQ0v1+768OaDYWlN1iDHc/Bw5YSm9VMSYYF5Zw6f/qVWPXtAAngNnDd
 wLR5w4YMeIEGu5Dg7mpW0m0G1TAWbwax+jwWomRk6TH7tIq2Tef8MYDmthyTlUPcMCYKIa36MZy
 7zpRD3NU6CnfV+Xo0+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

The SDCA class driver is useful on non-ACPI platforms where the
topology is supplied statically via sdca_class_hw_ops.get_function_data.

Drop 'depends on ACPI' from SND_SOC_SDCA and guard the
ACPI-parsing implementations in sdca_device.c and sdca_functions.c
with IS_ENABLED(CONFIG_ACPI), providing empty stubs when ACPI is off.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca.h            | 23 ++++++++++++++++++-----
 sound/soc/sdca/Kconfig          |  6 ++++--
 sound/soc/sdca/sdca_device.c    |  4 ++++
 sound/soc/sdca/sdca_functions.c |  2 ++
 4 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 2bdf4e333e04..db2672b3aae2 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -60,20 +60,16 @@ enum sdca_quirk {
 	SDCA_QUIRKS_SKIP_FUNC_TYPE_PATCHING,
 };
 
-#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SDCA)
+#if IS_ENABLED(CONFIG_SND_SOC_SDCA)
 
-void sdca_lookup_functions(struct sdw_slave *slave);
 void sdca_lookup_swft(struct sdw_slave *slave);
-void sdca_lookup_interface_revision(struct sdw_slave *slave);
 bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk);
 int sdca_dev_register_functions(struct sdw_slave *slave);
 void sdca_dev_unregister_functions(struct sdw_slave *slave);
 
 #else
 
-static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
 static inline void sdca_lookup_swft(struct sdw_slave *slave) {}
-static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
 static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk)
 {
 	return false;
@@ -88,4 +84,21 @@ static inline void sdca_dev_unregister_functions(struct sdw_slave *slave) {}
 
 #endif
 
+/*
+ * Called from the SoundWire bus during peripheral enumeration; gated on
+ * ACPI to avoid a soundwire_bus <-> snd_soc_sdca module cycle on DT builds
+ * (where the bodies are stubs anyway).
+ */
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SDCA)
+
+void sdca_lookup_functions(struct sdw_slave *slave);
+void sdca_lookup_interface_revision(struct sdw_slave *slave);
+
+#else
+
+static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
+static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
+
+#endif
+
 #endif
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 4c0dcb9ff3b9..72c02943c49e 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -3,11 +3,13 @@ menu "SoundWire (SDCA)"
 
 config SND_SOC_SDCA
 	tristate "SDCA core support"
-	depends on ACPI
 	select AUXILIARY_BUS
 	help
 	  This option enables support for the MIPI SoundWire Device
-	  Class for Audio (SDCA).
+	  Class for Audio (SDCA).  The ACPI/DisCo topology parser is
+	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
+	  (e.g. ARM/DT) codec drivers supply the SDCA function data
+	  via sdca_class_hw_ops.populate_function.
 
 config SND_SOC_SDCA_HID
 	bool "SDCA HID support"
diff --git a/sound/soc/sdca/sdca_device.c b/sound/soc/sdca/sdca_device.c
index 4bcd8d1fdff8..3f302bfa5457 100644
--- a/sound/soc/sdca/sdca_device.c
+++ b/sound/soc/sdca/sdca_device.c
@@ -15,6 +15,7 @@
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
 
+#if IS_ENABLED(CONFIG_ACPI)
 void sdca_lookup_interface_revision(struct sdw_slave *slave)
 {
 	struct fwnode_handle *fwnode = slave->dev.fwnode;
@@ -45,6 +46,9 @@ void sdca_lookup_swft(struct sdw_slave *slave)
 		devm_add_action_or_reset(&slave->dev, devm_acpi_table_put,
 					 slave->sdca_data.swft);
 }
+#else
+void sdca_lookup_swft(struct sdw_slave *slave) { }
+#endif
 EXPORT_SYMBOL_NS(sdca_lookup_swft, "SND_SOC_SDCA");
 
 static bool sdca_device_quirk_rt712_vb(struct sdw_slave *slave)
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index e01d91eb3cc8..47dedb62c24c 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -25,6 +25,7 @@
  */
 #define SDCA_PROPERTY_LENGTH 64
 
+#if IS_ENABLED(CONFIG_ACPI)
 static int patch_sdca_function_type(u32 interface_revision, u32 *function_type)
 {
 	/*
@@ -199,6 +200,7 @@ void sdca_lookup_functions(struct sdw_slave *slave)
 	acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
 }
 EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
+#endif
 
 struct raw_init_write {
 	__le32 addr;
-- 
2.53.0

