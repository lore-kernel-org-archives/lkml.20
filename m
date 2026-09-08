Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688245947FD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887421; cv=none; b=NSnNXYinKRDvrwjswUuNHHQXtDThMav8AEtTQ+Khl8XGkqzUiJ4QnTIYXyz4LlXIP0d/ubYPRiJztPCrxRbhGeSzAiC2KgbavZcEYruVBZx2osBGte7W5pUG6YroOIz5/zZib5iB20TuYfvvQZ5DDyOCRBs/ogQn9HivedvYpiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887421; c=relaxed/simple;
	bh=BdDhSKqvE4bR6i94Z4PzJjpFNgCG9vS4dOfg0BJDMsA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dlqq3bXpgX7sjXS37D83zzkkm5fcdkebeKo+frc6gs0AIDv9nv6uG4Vx4L2ojNi+6mlvfVg9HToopQQPcTVgb2DuwGhc386Fet3qVHVvfPEsckeL3MQfBiRJA7zTILJTOyblnBGcYQZr6BULN1xVkJtVz6y8RHxvGMCkv4DdcFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJh2tyZD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQRvW5tr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJh2tyZD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQRvW5tr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdZ24045458
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 17:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VQNR1mlZBEy+Xn7d0FfH0MwnsJQZNZ8utWBVHbu9Dpk=; b=YJh2tyZDV4+4QIsc
	f/a72uwTDIpYdXsz+YbrhiPs83btOx1iL5vX5HYWTjxB4KSPnfWyLVOfWjqu/WSD
	epSWSRf4W5G0IwHCPKc+nTCX7Tk7SgfbpkFfLScSvUzRAlPHJwB7bLwSfVVC0Efz
	h9U0lYx9F/LsIfjgwW1enkxN+Zxl2y/nw4W14jsakKoTD2Bqr32wRZJZtRN61boT
	GNFZXhD9eaGGZR8U3vz5bpNANzRVlTtSi0Y7LUuj8EjtBzzsjznEr8xcxLbKCWT0
	/eEpfSGjoWADI9XhHmOjPtvjwfOHeMoh6jK4bQayBQUq1JBlYGat6QPXVWpqscP3
	26QRKg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjg8xsy4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:10:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso6498618a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788887413; x=1789492213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VQNR1mlZBEy+Xn7d0FfH0MwnsJQZNZ8utWBVHbu9Dpk=;
        b=YQRvW5tr9JBb73ShIlCNVeUwX28Dy4miUpk4iER+4T0YH4/PWQJEU1/8LmK/7GqFdw
         MEIi5duELwDliQw5wIvtf6mG7lsq/To+IptPp3xRNY787Fuz33cwwaAba/Vt3VNcDZhd
         hpekUjwMTm8trTSGtu8sEnoohGMUdYRqkTmt/FXNOE61xIwi2rakw9b43pl3cSXc2FCg
         DQ5jMsHBiN5QK8EuSiEviLlb9L+g9IdagTaz7CY3Xg/ArndEf8CAJyPk86/2v4MNbbE9
         kEW33UVlLAhK1DAoPkGvfSiSZEs/E1uj0oxcd7kibfmyScUUwj9sCLnMIvyAPI3Op+5K
         aSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887413; x=1789492213;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQNR1mlZBEy+Xn7d0FfH0MwnsJQZNZ8utWBVHbu9Dpk=;
        b=g7ohuhW/7HL8VhvIQmMc+h7A0UA2vo8003cf704NG73vKmTa+7KP6/leIS/gJILAfl
         ECdMDCfYHs87Hazn49jTHu/PTVF5Rq3dzZDYZvymnVW03w/kL+rlHqsvIYXmJziDDXvr
         B2KQ71dJCAAmf1v+aIWasrhofmFKicHiGv+eEkX5DMHru4rY8xj1xyCLAAwtxAzqDQl2
         6AC8SRv8aIFAxxRaWy2wloRTgV66unhguCOLrSF/bm8JnRLX+XVHacxoRF0SV2K2sgBF
         gk0B1lz7jjaJoxuGZffxP1aycJZetHtuRtMTHNgJ5L9dg8ofrBQuUj3JQ4Xppg+QxS74
         T3hw==
X-Gm-Message-State: AFuF++nAMZSPJSEIVBARqdfWIhAW9vkSxNASZAL0yzSsHYJO0qI/Msd2
	MRdU+aBYDZobyrST88fkxfZUc/M11rgEPzcGtTANmuErWEP8LFjkgTDrs9UH6KauIvW1aZdGkqr
	PzSUTvdvSVhAdqd1ptz5K+jXy1Gda/k7NYfrb7gDGP9laDKUjwt66TT98eW6mN6J90g==
X-Gm-Gg: AYBFou3Wk1plvgzDLny7vCxdA9yUthT/EnTlgackpzLJC3bAh2LoMMxqFoUZTNq+3M1
	Mn8tYrBEx9p6lTv4hVha0XrYn7Buu0P6vgTsRnppgRVzpwnvhQJWp2BxRPrr8/8ukrdL9z//b9n
	e32/Fa9Z3Ng/5ko8L3wYFgvzfLuHXtDpEnV1K0DUFbFRbb1k28SXeNIvTXV2fUy4K5LH3DKXGuu
	Xx3I34pecrD5PWF67uIIAEPrauh2W08xE+pyGXyMZnVxw2W4+8/u4m9bFAYw68vr+giYpRy9H2U
	iaLJNoAp0y53hMlYsi7/YHZqob/E9N3O2HcoVvlVNdXBs6W3XB8PmT/10xR57DDVFB1lt4soQRm
	/Z0eTz4pQece6a7pr0+oND014/a8TcyQ04NyIzTcpxk0iwkKMVcqSJnylnDpf7MgVOHYF4eMXQi
	E3dl/NATqEVoBiNihqHEyNxQ==
X-Received: by 2002:a05:6a21:e081:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3da39bb593dmr47007575637.2.1788887412679;
        Tue, 08 Sep 2026 10:10:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:e081:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3da39bb593dmr47007494637.2.1788887412057;
        Tue, 08 Sep 2026 10:10:12 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm31773675eec.4.2026.09.08.10.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:10:11 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
To: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Subject: [PATCH RESEND wireless-next 03/18] wifi: nl80211: Add kernel interfaces for Seamless Mobility Domain setup
Date: Tue,  8 Sep 2026 22:39:31 +0530
Message-Id: <20260908-smd-v1-3-9fd2d876a1fb@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908-smd-v1-0-9fd2d876a1fb@oss.qualcomm.com>
References: <20260908-smd-v1-0-9fd2d876a1fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J7GaKgnS c=1 sm=1 tr=0 ts=6aa0417a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WqWJlBuMtEtNw8dGTc8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Q066q9vAiwVFy9nGwG4BVMaBdT8iohLr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE4NSBTYWx0ZWRfXxMADW6b6i7wQ
 5yRDZHQ7qFVW/FgSXBszpVwpp2MyOgGYdib7XNDNW67KhzwbEwk6IjpIS0FqGvouNfO2oOgp3rM
 8v7w1z+APcQupL9+M97hqpPeCW/SVa+2GSJUdLa2nUt9PbQrA9FVo6YCvrOUt774Vo4/1eUWqG/
 vYHnSK51m5cDOulW/X7Etu+M+JmvMmyurO6qVJErB29g/kdgYOTMBHVeDwVmJrFpVbK78Mjf+rZ
 jDgoCZ2C//r1ay346jrvOWB1BWvh6d+asI/WkWNV9xTd1encpGeGjl7w4dbLK8WJL00ucdHC0m7
 fA61vZzC0/c9YVl4urEKsCsamXJsyn0eGmhfojtMGosZS/7ir5Jd8Mm+o5Y2Qgzrqy5FrptGxOA
 WADZ39VHMVUOP6r8dtOXMKSyYSua6H3XszCBo0Ruz679NFXbmsgv7BjliBJETyl8R3SJDoJMETA
 d+NXDM10jzDCio+u2yQ==
X-Proofpoint-GUID: Q066q9vAiwVFy9nGwG4BVMaBdT8iohLr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE4NSBTYWx0ZWRfX64YLAvdipL92
 YH1eWaaBu/sPVTxph++ppuPV58VQEoMLE1WhGIaw48w4PqV+eAYesjQuN7ZB3KbqqDc/pNPL/ti
 JexO88WeypoHdPSXUTopQv2R3zkcIx0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080185

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
index d9ce185b0ef1..f5c8dbe5f26a 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -3185,6 +3185,12 @@ enum nl80211_commands {
  *	The aggregated message always precedes the per-link messages for the
  *	same station within a dump sequence.
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
@@ -3785,6 +3791,8 @@ enum nl80211_attrs {
 
 	NL80211_ATTR_STA_DUMP_LINK_STATS,
 
+	NL80211_ATTR_SMD_PARAMS,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
@@ -9118,4 +9126,91 @@ enum nl80211_nan_peer_map_attrs {
 
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
index e585da1d79c9..22d71f32815f 100644
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
@@ -1097,6 +1112,8 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_NPCA_PUNCT_BITMAP] =
 		NLA_POLICY_FULL_RANGE(NLA_U32, &nl80211_punct_bitmap_range),
 	[NL80211_ATTR_STA_DUMP_LINK_STATS] = { .type = NLA_FLAG },
+	[NL80211_ATTR_SMD_PARAMS] =
+		NLA_POLICY_NESTED(nl80211_smd_params_policy),
 };
 
 /* policy for the key attributes */

-- 
2.34.1

