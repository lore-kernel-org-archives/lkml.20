Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C584B5CC9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491439; cv=none; b=HXJhpnxar5wOIyKBO85yV9YmbzUDVTxTpcUJaRnBJHv5qq8fQ98PBEqWWNE41aqpejk2I4+/aXgnNi/BS5Zgh1tx8wREoCTvRpv6apzuubA6AX+r69b8PUVC9kK7tOjm2mrL22N4R/ccxe39vXfmFzbvEUBkGx1PqGd5usRntLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491439; c=relaxed/simple;
	bh=/FBOEcDQA091aAhbqoTJr44HTdfwyetl/ojJwn6bogI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCpwUff5titZ8VZfvGGle/I6M6bf6cpu9lWL1ytOklsMSeA5D4dqEby/p3kFZbb5fS1toR2PJib1canNyU0wj1LHIdDwPolOiOzVQo2Xdi6xKjEmCPyLlQ71VJs3KgxJ4pv2tjpGqOjjvCM31tPjr/xUzzuRBe2Pvk5kvXhbSWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RT/AzVGv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaFsRKXT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RT/AzVGv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PaFsRKXT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAQRV813414
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8Lm+uA5NKEI
	6jw1avVSpizSsQr8c+IrE83JBco1rBMo=; b=RT/AzVGvExfRCLvD5LkfYIpedAb
	4jlBnkocelYc2Znmdcnc2OwlDZNIszdUAoc2kqFp4Xr40xY46tTaUAyYjCbQVaL9
	263fBWi8kXoFo/uHzORxi3PTHiELaULDtCxRRxFT8vHVlWHTQxcLlPb0XnCmglUm
	deoAA73XHjstEVF0akic1CRHC3L8JYVYiJBDHu0MRwtEcbb9NpPulDG7HnOC2m2+
	uvA80WqkWxSZePqRpS/PyvfS5dm1FAhxiRFMEu7keiRzRt3KVJR6Sno48z8Gij7U
	8isDMSX4WdixG9t7hQ/0URV+a3JFE9QfIUc5ToOw+0YQTAusxw34rJl6R1A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq6kc1bh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:15 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-790376c9f8cso1192499137.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491435; x=1790096235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Lm+uA5NKEI6jw1avVSpizSsQr8c+IrE83JBco1rBMo=;
        b=PaFsRKXTVQWmo8buwxCl29L3YFVjghKmcYRQIGF0/yYz/z7Y6L52zsFylHfgs3ANDN
         j8XijWskPp9BXGr8dYjeYuZMNrfxX5KcDGlX92HPKmam5z1CHoxIgTfvLkZ2g88ZCOxA
         8I+KegLKgeRHdq/83dcGw3RZn90idpcmcW8O8gNOAyWHaObsxUzsLxTQopw2BbgnnUmf
         brGcFGAlHzGo/GCLsEF7LW1Edbxjf/lp926GlzKmM90NBG8IyTXvVn2yZvyI5iz/2Uqh
         CZTy5c1rHKiOulb6sr1HSGuijyWO9ND+k/zETDDa3r6vVmj3sbAzUZwe2uUcnqg7B9Nj
         0IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491435; x=1790096235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Lm+uA5NKEI6jw1avVSpizSsQr8c+IrE83JBco1rBMo=;
        b=XvtSH5YN+lNDNl+E5IsjuHOInuJkKyzzSADRhuJ4UGmLnxWPFyR0ctglP3y37kvD1y
         L2v3vX3PsPVqPOVkSbj8JbGJQcatoQEwKRajSHhKCqhdLqSLtokHPWC9BdGM6RdaAoc7
         sjSvVUqPiHxLqRgTOYai7j21Qb6LmmGEI6S4PaJjMXkmziVpFEXRLYLOatHd33fpmf6g
         bfgL81DoWBWZNh08J4yFbFuEDBNmeF3lwdnLV3XPjlLyIFA8t8SpL9lCqXs5BankfLaM
         DWbS+iMiBylyjPAuPHuTC1guNkNBYxTC1HTCxdDGAV1mwzITrXVzIpj5+fcNFYGvIFGG
         LYLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn90BCOMxvMrv5cWxgd40zoVMCRWKGSKtJ+yrSeK+E4rdHjnFNB4kHcfKyjqoGdhCzAm9XxtPJWkmXnqc=@vger.kernel.org
X-Gm-Message-State: AFuF++m5dvlYj/zM74g/rnwDvusGusH1eHTYw5wsz6eoHv/CunM2j1oR
	OUBo9TDh5DO15r6szVZNn4Esb1ixbDIQHGL9+MlABomLFV0bVSn5+PGl1JgR9zQH6LPWnePEqBu
	4Q749ksZgFn5PF3gilDE8JwC7IsJr5IvrSny+ilvbU2L7XSRKHEZPRkyqI9jQkcZp5SA=
X-Gm-Gg: AYBFou1BIHf1pMb+EmowNqx/Z55bhMHIbDKbxTjE+r5uCsTfY3YmdRxm2nEwfotU2+s
	N4fpLo7LtTnA7KlXXyaK4Cdsnek5PeNBxoQPvZSWQ1G6z2jUVYUUBWf/F7gwlZHHSvJyny5hHGJ
	3QeLkupeS0Sb93RT2QGhFNzLYKJdkR7rd0QPA+1DYHMTCPFlsf97Vjd01n4DrocLchJz5k85ycr
	psZLmS7popiicB2e5pzySOkXo8fkVxGv3+SGf/1TffW3X5M57ludKiYzgv+KrGrPAPmvv0PBdhW
	AndRnXwpI8R4eHYiQfqB51Xqkk+R3XQhW12KhWCKuvQEbGbazXc9+S6EUAsP17hCYFN0/WAAuEG
	zLHvSdAcpxmhNgA==
X-Received: by 2002:a05:6102:50ab:b0:784:b9ec:910b with SMTP id ada2fe7eead31-79b5caf1b6dmr9011816137.12.1789491434601;
        Tue, 15 Sep 2026 09:57:14 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:784:b9ec:910b with SMTP id ada2fe7eead31-79b5caf1b6dmr9011719137.12.1789491434035;
        Tue, 15 Sep 2026 09:57:14 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:13 -0700 (PDT)
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
Subject: [PATCH v3 1/8] ASoC: SDCA: allow building without ACPI
Date: Tue, 15 Sep 2026 17:56:43 +0100
Message-ID: <20260915165652.914893-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfXzrDQZONA4rk/
 /F5uZ9zcnaLiBXEY2XdHLqX+/QAs1Mwbg9M1eWHDXSTU1U5XmN4pNaQ8pVZZhezkVApPLzsc/Rq
 Eu+g9nJoCoaQlsTN/JPAoZLx4vIru0c=
X-Proofpoint-GUID: iWmRAPYrMNHpLqM7gZt5k0FGd34vX4Wb
X-Authority-Analysis: v=2.4 cv=ZINCCn7b c=1 sm=1 tr=0 ts=6aa978eb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QBLm4htSTobWmsIIepQA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: iWmRAPYrMNHpLqM7gZt5k0FGd34vX4Wb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX5JQ8ljblYRRu
 NPkg0/ksOQcqD2rJBBI4PTZygNas0wqAAcYGmD9p93aqQgVq9yeXTDAFj57S3wpW9wP47m0cDKz
 nL5jIqqWYa+2Og5O25lVsaUMIj0xPwtFrRmDkQjvAXMZ6GqfSDY6qbLFI3TcvecujmfQUpUlQZ/
 zNnQ+bTcQhYXrTDnqIVB/uxMw/7yRoQhNo6lWH7I4A6N4G1AD6hW7m23AILfYp8DGkSyBI7ViXs
 9GC5p1ATG2rtBq8AppcJp/reYNx331ANU3ZxBwGwek7DI+7zUbO4KIJMV4jufjA9mZNr0rl1n/+
 lGBdm3CeuG2PxEC0TwNsulaIbAppVbSlpDnuUXJhL2trIeEmmVCoI/ZITwA0xHle5xm2vfk6rVY
 hho6r/T5eDPXwaIcWSn4ybjQGflkovr5gcvLi5OLPAwmDO/WAreY/lW1QHbWhCVFr4p/4E8MvI/
 4cH9tAaqVP7QppyOO+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150247

The SDCA class driver is useful on non-ACPI platforms where the
topology is supplied statically via sdca_class_ops.populate_function.

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
+	  Class for Audio (SDCA). The ACPI/DisCo topology parser is
+	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
+	  (e.g. ARM/DT) codec drivers supply the SDCA function data
+	  via sdca_class_ops.populate_function.
 
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
index b55e3ad8ea34..6eb0e1059dbd 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -25,6 +25,7 @@
  */
 #define SDCA_PROPERTY_LENGTH 64
 
+#if IS_ENABLED(CONFIG_ACPI)
 static int patch_sdca_function_type(u32 interface_revision, u32 *function_type)
 {
 	/*
@@ -201,6 +202,7 @@ void sdca_lookup_functions(struct sdw_slave *slave)
 	acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
 }
 EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
+#endif
 
 struct raw_init_write {
 	__le32 addr;
-- 
2.53.0

