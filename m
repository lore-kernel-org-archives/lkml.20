Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7573E371887
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217704; cv=none; b=L3K62sVq+5JM6NeIWg1kWt45B/bH3yxfBIcrBq0vE726KSjalh0lGyVF7X6sPnBiBNZBR5kPCONckioM6wOYhmBe63k7sQm0aXKl+c0evEh07rP75MhwCbLxLX4BCS+yjp7/FCXCLOczMrxG7ZjgY7OJ4F7AwBnmFMmCvBD5q3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217704; c=relaxed/simple;
	bh=A5JcIqBFxQ0+a5/+IVFf55NYSny4vDEgxMVzcOHWaHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eaJBIY55ZlPFa4/UuoDOE/U+gpfxRx3O33ZCriCh5E3oNb2UJwufWaLTTQKpG3orN67Meh/T8KC6//GSQOpXlT6Kv3BkDrgmx8YZ8V568vkXGreIWFZfQIHvBgRmjli9mk4yckOmMwHJ652ejm+7FVJFDUd8CdwWfmaHh5IsEJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRy946jA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgFp55cb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRy946jA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kgFp55cb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O2Jun81107848
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODyR1rthMpA1mqS2BL6bd97tNxqZN2OWPjCXhXyDeWQ=; b=VRy946jAk4C009Z0
	w2GESdysnp+1Ngh9OUwSHxuOpIZibdyiopIhoed9iwUrV4zqScaXvlt36gn0KB1H
	vClo8JqizlTQp55GcsnEG1rNVDe7Cmvb0+/3Y1EHcrvV2YeVQlHujWgvqTeKVqsQ
	KtCYWo6DxuAhGS7wIpFg8WreJTywPYpm2xNcc53ZWgFmq+4g3zvHAyRYLvO0NEXk
	TLEFyoTrNZOyEtE5JFvHLQTK/EiagT/9zK+hlPa1tXHZypE8YEnzJe4QeGsUY9zo
	SCWU/sTBqywUKBfJdXipS9w0ibtVDeoJxYPnrwMiMlt0sEVfSK6VICKVChLviAUR
	ptWFRg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgrb0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-333543ac378so1887791eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790217698; x=1790822498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODyR1rthMpA1mqS2BL6bd97tNxqZN2OWPjCXhXyDeWQ=;
        b=kgFp55cbEiOpgTCiCSJC8V1MYJemjfePcCn8GUtbsXO4pEEZMVrxPm8u++/FwPhMOT
         trw8IUK0Dzov8S6pXqq1j3jewoh7/BDhmiqFhwFvT+HX6OvHMod517VaQo+p4U+Odif/
         ajoUKTVf8x0UlzAOyg/wfwvxXf78+wLr0Gh3gRWLeASjS/xHD8VEtum2I9nJqoifo65x
         egWPVuQj0kROCAJKGOq0p8LrP3KqlG8UcGoTdP4sz/hSTCkf613i4sRYMLeI4D995zqF
         8gigO6AtniplJi3IuIeTXDGs3snS/WwZrHQGQT2hV86PhjnP8BWcT5kPCHEneTAnIl/U
         WKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790217698; x=1790822498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODyR1rthMpA1mqS2BL6bd97tNxqZN2OWPjCXhXyDeWQ=;
        b=HQFpkEqtLwlTDNh5lzm9qtWN9aMWXMruoG9BM79oUTry/LjmXoiviToBdIOVB3NFDU
         CrcxFDoo6vkaqN28W0kVnB34F/QFjAZc3HEadGeMT02dlgQ0CGd8bmh1qebUtvFlrLjs
         8MoLez5/vThvG2bUGedsaxX7FaIR6iRAPk3G4x8GaV7ZZVFxfyDgaE4KxBksXnLzIxs6
         l4XMUkEXUMxTSTPqGu77ejlS6ogOeVc2ej6YFdZs4vepgiMveJzsX5bZSeCn/zhkhQ8A
         yogebNdRgAa3dOaCCFounOLyt+8LzVhpxPm838AFrRanD5tiFhEAqdamlQU3cK3z+Mop
         3x9A==
X-Forwarded-Encrypted: i=1; AKwUvByUYBaRhB1ONZ5ZEQJ8vZiH4mGdhu2IHMBVYrwONWF/MwH357vU0SdPsDk4F4478HSWNkHk+LZMUcmOFtE=@vger.kernel.org
X-Gm-Message-State: AFuF++lEKV7JE+zYDnXrcd5dCwm7HB2zxXm5/FmYnwInLp5pvXFBQ7pb
	TZVeOod+HJDhDuSVQdDlDQ2WqUfNqarIrXqHKU0mq9pHJtwg/8lvTjHZKAMpa1FAte3MklXiAp6
	atb+a4Y3JyaJVg5FQSfb6iYXkmMgRVs26EtxBzoUy5mp3FC922H9SbuVjnbEnruHUPQ==
X-Gm-Gg: AYBFou0k7rB5h1abfV1aZrNgS1r3LU9g+zT56BeK7hzh+OtVd0AiyPR2+127QkJsWBc
	nZZSJYY+ZYaDfUDv2C6m/XLFDtKGDn3EovqC4v2co9Plrlm63mpsjIP1mDpPnj04Ke5ovPImaAF
	4SawFMGsCu2y2do47M6bjBBa4znOGv0U+AnomCxlqnR1JZaS27g4NlYin1I0S6vV0meshzP26bI
	nnvhxO04r2NhMYJ1sqx8Nqu99gVZhxl+P3eF+1SgRgJVuECXHnIk+D4lKrQ28TOFqKJK1+JuOz5
	N9yBq5Zy1EUL7qddhTuQhfHvLL7orZH7KkZii6NdZvsGIF9Ehj4cUVeOARZRL+l+uBfSmxUAEjJ
	jpNPeOVLSikVOFaJ5/QQQkEyvGGUhVyBHoVFSyG9OnCx1FVoQrYa1ww1opNwwaUdOlTFMiibZC8
	eLKnVAmPdiUloc7IKh7d+SWg==
X-Received: by 2002:a05:7300:c019:10b0:33b:c24c:47cd with SMTP id 5a478bee46e88-340035bf9d9mr822554eec.16.1790217698002;
        Wed, 23 Sep 2026 19:41:38 -0700 (PDT)
X-Received: by 2002:a05:7300:c019:10b0:33b:c24c:47cd with SMTP id 5a478bee46e88-340035bf9d9mr822530eec.16.1790217697377;
        Wed, 23 Sep 2026 19:41:37 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm9692263eec.12.2026.09.23.19.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:41:36 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 08:10:39 +0530
Subject: [PATCH wireless-next v2 02/16] wifi: nl80211: Add kernel
 interfaces for Seamless Mobility Domain setup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-smd-v2-2-bb40094da1d4@oss.qualcomm.com>
References: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
In-Reply-To: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab48de3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WqWJlBuMtEtNw8dGTc8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: ji0zkicuv66TBQY2P9-P_oUSN9kwuVzA
X-Proofpoint-GUID: ji0zkicuv66TBQY2P9-P_oUSN9kwuVzA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfX95ouWT+vYFUh
 k87C1E+3oLkYpnOf2Ebi8JLZKlbRnR5EzRmJ1hP92RF/VzVD1Qt3EcVoTAV8pW9DkbdVk7AxwYp
 MC7c2cfNcmsZBwZWV84F967Dy7nhnfU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfX6s4Pb7nRD9In
 IbM0daT4hrH8CfDnNGHim+Lca0Rc/VC/+gLvtf3k5AUlrLekx/HR/XiOZzdqTffRg4W+ZkBsvXA
 8BMoKPneyk5NNCsswj13RMZHLpREklO9KKvkEtyomaOsYereoc09hDvRZFJqORAD2VDZ5BaaFEs
 WqVRwx9AhbhUSvpoKsxbBdJ3qipn6ANz9SgcFiI88Wdny1QzZg4052ywQCFY1G2Wws3o+EwCP2r
 fWZnM6s8BmbRPWcErcuFgos/TE47r5ATaAtTFlYbGLYmzLbqnREDvyvN4em6MWSD1SqyoSCSXMG
 o3gg2vv9Imheq8s+EdgO7JQWylC+p7FDXcxY9Jye2PEoemkkpqNne23wxofymOSpdhnEzXTMZ72
 N6l8xoKpp0PQuFmlXZevGMwGt0vhKIVaPchI0p7n/jhn+h25lV22tuSbJmvIwvC+axO38DxHd+N
 v85i45fW9TXnC6+LElg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240012

From: Aditya Sathish <asathish@qti.qualcomm.com>

An AP MLD managed by an SMD-ME must advertise its SMD parameters in
Beacon and Probe Response frames so that an SMD-capable non-AP MLD can
negotiate SMD during association and may choose to later perform SMD BSS
Transition. Add nl80211 kernel interfaces for userspace to configure
these parameters in nl80211_start_ap() so that the driver and lower
layers can be configured with appropriate parameters.

Signed-off-by: Aditya Sathish <asathish@qti.qualcomm.com>
Co-developed-by: Rohan Dutta <drohan@qti.qualcomm.com>
Signed-off-by: Rohan Dutta <drohan@qti.qualcomm.com>
Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/linux/ieee80211-uhr.h |  4 ++
 include/uapi/linux/nl80211.h  | 95 +++++++++++++++++++++++++++++++++++++++++++
 net/wireless/nl80211.c        | 17 ++++++++
 3 files changed, 116 insertions(+)

diff --git a/include/linux/ieee80211-uhr.h b/include/linux/ieee80211-uhr.h
index 19e9260d0db8..c3f87d4c8bec 100644
--- a/include/linux/ieee80211-uhr.h
+++ b/include/linux/ieee80211-uhr.h
@@ -589,6 +589,10 @@ ieee80211_uhr_dbe_cap(const struct ieee80211_uhr_cap *cap)
 #define IEEE80211_SMD_INFO_CAPA_TYPE			0x10
 #define IEEE80211_SMD_INFO_CAPA_PTK_PER_AP_MLD		0x20
 
+/* IEEE P802.11bn/D2.0, Aug 2026, subclause 9.4.2.363 */
+#define IEEE80211_SMD_INFO_PREP_TIMEOUT_MIN		2 /* in 64 TUs */
+#define IEEE80211_SMD_INFO_NUM_PREP_AP_MAX		7
+
 struct ieee80211_smd_info {
 	u8 id[ETH_ALEN];
 	u8 capa;
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index d05103889912..1177a511c8cb 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -3190,6 +3190,12 @@ enum nl80211_commands {
  *	known station to transmit a frame. This is relevant to know whether
  *	MLD address translation happened or to disable it when sending a frame.
  *
+ * @NL80211_ATTR_SMD_PARAMS: Nested attribute to indicate support for Seamless
+ *	Mobility Domain (SMD); it contains parameters to define capabilities of
+ *	an AP managed by an SMD-ME. Valid if the driver supports
+ *	%NL80211_EXT_FEATURE_SMD.
+ *	Used with %NL80211_CMD_START_AP. See &enum nl80211_smd_params_attrs.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3792,6 +3798,8 @@ enum nl80211_attrs {
 
 	NL80211_ATTR_FRAME_NO_STA,
 
+	NL80211_ATTR_SMD_PARAMS,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
@@ -9131,4 +9139,91 @@ enum nl80211_nan_peer_map_attrs {
 
 #define NL80211_NAN_SCHED_NOT_AVAIL_SLOT 0xff
 
+/**
+ * enum nl80211_smd_type - Type of the SMD
+ *
+ * @NL80211_SMD_TYPE_PER_AP_MLD_MAC_SAP: Separate MAC SAP is used per AP MLD.
+ * @NL80211_SMD_TYPE_PER_SMD_MAC_SAP: one MAC SAP is used in the SMD.
+ * @NUM_NL80211_SMD_TYPES: internal.
+ * @NL80211_SMD_TYPE_MAX: Max type of the SMD.
+ *
+ * This value represents the data path models between the non-AP MLD and DS.
+ * DS mapping for the non-AP MLD is updated if
+ * %NL80211_SMD_TYPE_PER_AP_MLD_MAC_SAP is used.
+ *
+ * All AP MLDs within an SMD shall indicate the same SMD type (refer
+ * IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.1.2).
+ */
+enum nl80211_smd_type {
+	NL80211_SMD_TYPE_PER_AP_MLD_MAC_SAP,
+	NL80211_SMD_TYPE_PER_SMD_MAC_SAP,
+
+	NUM_NL80211_SMD_TYPES,
+	NL80211_SMD_TYPE_MAX = NUM_NL80211_SMD_TYPES - 1,
+};
+
+/**
+ * enum nl80211_smd_ptk_mode - PTK Mode used in the SMD
+ *
+ * @NL80211_SMD_PTK_MODE_PER_SMD_PTK: one PTK is used by all AP MLDs in the SMD.
+ * @NL80211_SMD_PTK_MODE_PER_AP_MLD_PTK: Separate PTK is used per AP MLD.
+ * @NUM_NL80211_SMD_PTK_MODES: internal.
+ * @NL80211_SMD_PTK_MODE_MAX: Max type of PTK mode.
+ *
+ * This value represents the security mode of the SMD that dictates the PTK used
+ * in current and target AP MLDs to protect communications with the non-AP MLD
+ * (refer IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.1.3.2)
+ */
+enum nl80211_smd_ptk_mode {
+	NL80211_SMD_PTK_MODE_PER_SMD_PTK,
+	NL80211_SMD_PTK_MODE_PER_AP_MLD_PTK,
+
+	NUM_NL80211_SMD_PTK_MODES,
+	NL80211_SMD_PTK_MODE_MAX = NUM_NL80211_SMD_PTK_MODES - 1,
+};
+
+/**
+ * enum nl80211_smd_params_attrs - SMD Domain parameters
+ *
+ * @NL80211_SMD_PARAMS_ATTR_UNSPEC: Invalid attribute.
+ * @NL80211_SMD_PARAMS_ATTR_IDENTIFIER: Required (binary) attribute of ETH_ALEN
+ *	bytes used to define the unique identifier for the SMD.
+ * @NL80211_SMD_PARAMS_ATTR_TIMEOUT: Required (u16) attribute to define the SMD
+ *	Preparation timeout (in 64 TUs, values 0 and 1 are reserved) for
+ *	the target AP MLD.
+ * @NL80211_SMD_PARAMS_ATTR_DL_DATA_FORWARDING: Flag attribute to indicate that
+ *	the device supports forwarding of buffered DL data packets.
+ * @NL80211_SMD_PARAMS_ATTR_MAX_PEER_APMLDS: Required (u8) attribute to define
+ *	the maximum number of AP MLDs a non-AP MLD can prepare with. Value is
+ *	the maximum number of AP MLDs - 1. A value of 0 means that the non-AP
+ *	MLD can prepare with 1 AP MLD.
+ * @NL80211_SMD_PARAMS_ATTR_TYPE: Required (u8) attribute to indicate the
+ *	SMD Type (&enum nl80211_smd_type).
+ * @NL80211_SMD_PARAMS_ATTR_PTK_MODE: Required (u8) attribute to indicate the
+ *	PTK mode used for protection (&enum nl80211_smd_ptk_mode).
+ * @NL80211_SMD_PARAMS_ATTR_NEIGHBOR_PROBING: Flag attribute to indicate that
+ *	the device supports UHR Neighboring AP Probing.
+ * @__NL80211_SMD_PARAMS_ATTR_LAST: Last attribute, used internally.
+ * @NL80211_SMD_PARAMS_ATTR_MAX: Max attribute.
+ *
+ * Nested attributes carried in %NL80211_ATTR_SMD_PARAMS to define
+ * device capabilities that is part of an SMD (refer IEEE P802.11bn/D2.0,
+ * Aug 2026, subclause 9.4.2.363, Figure 9-aa43 and Figure 9-aa44).
+ *
+ */
+enum nl80211_smd_params_attrs {
+	NL80211_SMD_PARAMS_ATTR_UNSPEC,
+	NL80211_SMD_PARAMS_ATTR_IDENTIFIER,
+	NL80211_SMD_PARAMS_ATTR_TIMEOUT,
+	NL80211_SMD_PARAMS_ATTR_DL_DATA_FORWARDING,
+	NL80211_SMD_PARAMS_ATTR_MAX_PEER_APMLDS,
+	NL80211_SMD_PARAMS_ATTR_TYPE,
+	NL80211_SMD_PARAMS_ATTR_PTK_MODE,
+	NL80211_SMD_PARAMS_ATTR_NEIGHBOR_PROBING,
+
+	/* keep last */
+	__NL80211_SMD_PARAMS_ATTR_LAST,
+	NL80211_SMD_PARAMS_ATTR_MAX = __NL80211_SMD_PARAMS_ATTR_LAST - 1
+};
+
 #endif /* __LINUX_NL80211_H */
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index ab5a14f5fe28..de93b34444b4 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -689,6 +689,21 @@ nl80211_nan_conf_policy[NL80211_NAN_CONF_ATTR_MAX + 1] = {
 	[NL80211_NAN_CONF_NOTIFY_DW] = { .type = NLA_FLAG },
 };
 
+static const struct nla_policy
+nl80211_smd_params_policy[NL80211_SMD_PARAMS_ATTR_MAX + 1] = {
+	[NL80211_SMD_PARAMS_ATTR_IDENTIFIER] = NLA_POLICY_ETH_ADDR,
+	[NL80211_SMD_PARAMS_ATTR_TIMEOUT] =
+		NLA_POLICY_MIN(NLA_U16, IEEE80211_SMD_INFO_PREP_TIMEOUT_MIN),
+	[NL80211_SMD_PARAMS_ATTR_DL_DATA_FORWARDING] = { .type = NLA_FLAG },
+	[NL80211_SMD_PARAMS_ATTR_MAX_PEER_APMLDS] =
+		NLA_POLICY_MAX(NLA_U8, IEEE80211_SMD_INFO_NUM_PREP_AP_MAX),
+	[NL80211_SMD_PARAMS_ATTR_TYPE] =
+		NLA_POLICY_MAX(NLA_U8, NL80211_SMD_TYPE_MAX),
+	[NL80211_SMD_PARAMS_ATTR_PTK_MODE] =
+		NLA_POLICY_MAX(NLA_U8, NL80211_SMD_PTK_MODE_MAX),
+	[NL80211_SMD_PARAMS_ATTR_NEIGHBOR_PROBING] = { .type = NLA_FLAG },
+};
+
 static const struct netlink_range_validation nl80211_punct_bitmap_range = {
 	.min = 0,
 	.max = 0xffff,
@@ -1098,6 +1113,8 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 		NLA_POLICY_FULL_RANGE(NLA_U32, &nl80211_punct_bitmap_range),
 	[NL80211_ATTR_STA_DUMP_LINK_STATS] = { .type = NLA_FLAG },
 	[NL80211_ATTR_FRAME_NO_STA] = { .type = NLA_FLAG },
+	[NL80211_ATTR_SMD_PARAMS] =
+		NLA_POLICY_NESTED(nl80211_smd_params_policy),
 };
 
 /* policy for the key attributes */

-- 
2.34.1

