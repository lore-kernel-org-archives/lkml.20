Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0D13DA5DB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217731; cv=none; b=guc+TtZ5qKvNie9L9DldgjuJYHH5ecojehB2V0rP4LAA6b/W1lweg3uyGth7apmlq8cLJVASxDnC75jhts4xpVbI/9OIkoCJSx0aDCOy+p5Tr6ictFtaVQCMFdXHZ1Ao7RD5pb4OP+WfdRLxnrLVIxKm32SAEQy1N5+XcL6KF4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217731; c=relaxed/simple;
	bh=qjo4LXIMsSyzJCAJhlFb0c6ptyuXA14K/I0JXhuV/Hs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eDO5aznctuxgThlErpLck2GJhhdr1oZyZw9o+gHoUcZEH5QhnOh5i1D1X0A/clMFIT0pTeruhtw4kKNGLlYLi2tYBHeXAWn+uOIUkapCDrbDz58vf5+b205UhA9kL47uM2GsakFNupNAMXzmuMK5Z1Ssi9p3+RUm6xkZQ+dPB+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LSEX4eKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZeDx8uF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LSEX4eKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZeDx8uF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O2KCWL1317106
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3/PwaR8+USw9E7Ih9bOMrj7G4CRNw/PS2L7c9cu4PY=; b=LSEX4eKbYGcY+U+l
	hY3ucSLYtVB7D6y1AKZnM3CsdrzKOJrAf1tPXMC7hHmJXukq8brY78qB2PVsO6u4
	qwpldAQCwbYUlaClQxF8+fuBs7M/HDFvcR7zj4MMvF/UyVqWp9jp9wApy7grpEyW
	8XZTF6ZYQCkvOA550mcPQNKBnP02qvok4zEaUZXGf+RrfIODrl4IkFAQ/+Vjkwqg
	YICSu2GUssFRz9I+5vxrjsM62jVN5fTrTT1nESh8gqc0Bc+zVSe6peWRTtc8bKlv
	ErjsfbxOs2r/ybTYFrc9JFZYn1v9S9ilvIeS9DmfNcmQAnAFiFYhaiz0nAeFBEnB
	XUktfQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbjwg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:42:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32861f5448cso718695eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790217727; x=1790822527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3/PwaR8+USw9E7Ih9bOMrj7G4CRNw/PS2L7c9cu4PY=;
        b=IZeDx8uFyL/32lJYuxTLYWrM9VarxO68AwttM7cwpkQhuxTn5Y4/boZGleadDftYjY
         P1pA2S/b/OudxMw0aSzLI/Y+JqNg66lePinEjoKSnNFyfL1mbmvC/PczVnXnx5xbDqyG
         UX8DgW5Asjeq8ajZPcv9Fsbyfczo61GGrruRdsbOnbTdjO3f+5OvEhuIJ54MCHrqQi3I
         vVHwG02JRXo9z7G8cjQSNAUey6TzADKrKrLExudSjIkfd8+X8Bc+puKVicGe7CpmoEqe
         VbVikzbhJg0ndmwMiulnDqGBqe4h8eY6r6BnsQiFJlYhRWGSFZifL30bndMzNnTiMpkr
         +EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790217727; x=1790822527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3/PwaR8+USw9E7Ih9bOMrj7G4CRNw/PS2L7c9cu4PY=;
        b=tMQmpgPGAHkqTWE3KqA5UPBR2NTP/m8iWg9NOgQi3f5E22fKaYvPzi5AhOr+i10SFt
         fP6hvZNdS4IEKjIm3JkFYMNF7x99uXPFkYL7uaWp6K7X2lsTYz12VLvhiH7G3yfQ8MTJ
         U62TKTT91U4QNYxm44YddId6dqjSNlDIqyFmt6+qkFgmBR6mgpinpc037Fpg9PgfyNPr
         0z5f/WzMVInpsnhyX/pACWwSloRBLya1nb/EhXIgddQGh5b53lXodUARiEokyyhEX5ZA
         38rt74Hq56ZFIhZolSTCGlBZngd7yoYf5H0jiQsDWGydeyXC41RW6iaINoCcAwKyZtKm
         sf3g==
X-Forwarded-Encrypted: i=1; AKwUvBwmL0eSiGhZTb2PDD9tR5ghMG4/ZbX9N4bCfKKnLDLtpl82nwiuMaYhK+RD5O1rgg3fvF+Z+nOg3N1MtBA=@vger.kernel.org
X-Gm-Message-State: AFuF++kOuT829KEK5yR04YGaEcKmBLRydbFR6ytJ7aOyoXKnxrao4hg0
	EmznHBYiSJ8vqujqaXCddmM9znMAtfXPM2TiWQkPmmxV+bpl/0luoKoacOBe9E7BHxngrbj/YEy
	kqm41c5tzZOkawSSiPLqvzHVMqRCKR2Z1g4Cpz4tc5IvUqmDJXH3PV6niyn785oC1kj9ZnDt3CA
	==
X-Gm-Gg: AYBFou3St8mtHbGs2c87Q2cFRF18AL/bzXYokWloGgq27swMQGYqbTSgHvCro2xE6qk
	qXXTON3telUgLtE19Yq1y2BCNg5ot7IZJxEpkbIgJQEN8vFyl3LhzHT1bXAtyO+6fbqFfZ+cqHr
	5YRhwa59TC0NX5YeBt0USiEocJzewBpXNfipFBwxeNGb2huFWEevv6nweDURcniCOfnx829lM+n
	TGzEKEGc+vIILUmpv80bIXw2uHzc2K6U7bXNrJRFksNZF01rzLSaV7X59cyOx9WPvjgE2bZzTkz
	6oSbGW23XjFrMNnqq/q4VhGfY7WGCI0n95jY5aaNgbBisVrcz7a5G1QrUc8eLM9DwG++i+myGke
	FmPIekjcArWuO2WTyOZldaa8hLTlC3bJ8UC/smHG/kgCQXFPaFSrav6G8pI86Wzb3WSwQXath+D
	a4ANtb5sH7wnIYBWYOiph/cQ==
X-Received: by 2002:a05:693c:621a:b0:33e:6a58:b03 with SMTP id 5a478bee46e88-34002edeb01mr909282eec.21.1790217726491;
        Wed, 23 Sep 2026 19:42:06 -0700 (PDT)
X-Received: by 2002:a05:693c:621a:b0:33e:6a58:b03 with SMTP id 5a478bee46e88-34002edeb01mr909257eec.21.1790217725786;
        Wed, 23 Sep 2026 19:42:05 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm9692263eec.12.2026.09.23.19.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:42:05 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 08:10:48 +0530
Subject: [PATCH wireless-next v2 11/16] wifi: cfg80211/mac80211: Handle UHR
 Link Reconfiguration frame
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-smd-v2-11-bb40094da1d4@oss.qualcomm.com>
References: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
In-Reply-To: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfX1nQv0nEyz1NW
 Ieghwom3FmxpmQ2vWYaXeTBOiidjeEmlH2Lsm4nYih0k540zbND3q3EcBSXZ4gy/pLPtdTCRLq3
 oRYWc+2OAOb0J3k9FaGEVnia6hBsS2k=
X-Proofpoint-GUID: Q-GvegE9LgjnrL0bI8qVzSP0FcZglwHT
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab48dff cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kIFG_faw9rmyLF2AHFUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfX9u5qZeYq3io8
 lStWhYkgQGp0MnWVQRcxzGcWVQtHDW1qOp2QCKJqjtrnMH2z9IE4Xt1EeP3/mIKVCVS6/15cqwX
 wQvUVKnPtYuZ08RDeQLBFYbtI6cy+5mXb7Mrne+D1ITo99IjsDAvt2atlm7PajPKj6nnWE766aX
 zw3iVeGG20XeZNaE3vDgsMdxXzDv3YmR8bmjgcq7EXgiU8C48XIU6bjauHEzGTpyo8q857Cx1iO
 aWdo3ofaKkYERDQAXMnafpcxudNWL+hvZyUHVSz93VlXst+Q/mcK9BKyiLFjl5LCRXIOSu8eyq6
 OdexV6kHGAD/CczC3u2fm6/i9/YFxtKUCw8lcXW1QMF3sFnl3x3bEK88CJqhyr3grPokUGIns2b
 1wF9LtSK8e77CMuUjHCaK5E/DGgtzpYBXn8EMc1gGth2XUMqP0HCGATL4YznXBEhjgde/+J8QMe
 xoO2VZx8NUFUsA+e8BA==
X-Proofpoint-ORIG-GUID: Q-GvegE9LgjnrL0bI8qVzSP0FcZglwHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240012

A UHR Link Reconfiguration Request frame (ST Preparation or Execution)
triggers SMD BSS Transition on the current AP MLD. Userspace needs
reporting of the STA's dynamic context along with such frames so that
the same can be transported to the target AP MLD for setting up the STA
TX and RX queues.

Reserve a field in ieee80211_rx_status that enables drivers to attach
the STA's dynamic context to the corresponding frame. Since the maximum
possible context can grow too big, attach the pointer to the context to
the frame. Add handling for UHR ST Preparation and Execution Request
frames so that the associated context is propagated through cfg80211 and
nl80211 for userspace reporting.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/linux/ieee80211-uhr.h | 59 ++++++++++++++++++++++++++
 include/net/cfg80211.h        | 13 ++++++
 include/net/mac80211.h        | 10 ++++-
 net/mac80211/ieee80211_i.h    |  2 +
 net/mac80211/rx.c             | 96 +++++++++++++++++++++++++++++--------------
 5 files changed, 149 insertions(+), 31 deletions(-)

diff --git a/include/linux/ieee80211-uhr.h b/include/linux/ieee80211-uhr.h
index e6aaef9ae9e6..e74de842b281 100644
--- a/include/linux/ieee80211-uhr.h
+++ b/include/linux/ieee80211-uhr.h
@@ -743,6 +743,65 @@ ieee80211_uhr_mode_change_tuple_size(const struct ieee80211_uhr_mode_change_tupl
 			     IEEE80211_UHR_MODE_CHANGE_CONTROL_MODE_LENGTH);
 }
 
+/**
+ * ieee80211_is_uhr_link_reconf_req - check if frame is UHR Link Reconf Request
+ * @skb: the SKB to check
+ * Return: whether or not the frame is a UHR Link Reconf Request frame
+ */
+static inline bool ieee80211_is_uhr_link_reconf_req(struct sk_buff *skb)
+{
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
+	u8 category, action;
+
+	if (!ieee80211_is_action(mgmt->frame_control))
+		return false;
+
+	if (skb->len < IEEE80211_MIN_ACTION_SIZE(uhr_link_reconf_req))
+		return false;
+
+	category = mgmt->u.action.category;
+	action = mgmt->u.action.action_code;
+
+	return category == WLAN_CATEGORY_PROTECTED_UHR &&
+	       action == IEEE80211_PROTECTED_UHR_ACTION_LINK_RECONFIG_REQUEST;
+}
+
+/**
+ * ieee80211_is_st_prep_req - check if frame is ST Preparation Request
+ * @skb: the SKB to check
+ * Return: whether or not the frame is an ST Prep request frame
+ */
+static inline bool ieee80211_is_st_prep_req(struct sk_buff *skb)
+{
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
+	u8 type;
+
+	if (!ieee80211_is_uhr_link_reconf_req(skb))
+		return false;
+
+	type = mgmt->u.action.uhr_link_reconf_req.type;
+
+	return type == IEEE80211_UHR_LINK_RECONFIG_REQUEST_ST_PREP;
+}
+
+/**
+ * ieee80211_is_st_exec_req - check if frame is ST Execution Request
+ * @skb: the SKB to check
+ * Return: whether or not the frame is an ST Exec request frame
+ */
+static inline bool ieee80211_is_st_exec_req(struct sk_buff *skb)
+{
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
+	u8 type;
+
+	if (!ieee80211_is_uhr_link_reconf_req(skb))
+		return false;
+
+	type = mgmt->u.action.uhr_link_reconf_req.type;
+
+	return type == IEEE80211_UHR_LINK_RECONFIG_REQUEST_ST_EXEC;
+}
+
 #define for_each_uhr_mode_change_tuple(data, len, tuple)		\
 	for (tuple = (const void *)(data);				\
 	     (len) - ((const u8 *)tuple - (data)) >= sizeof(*tuple) &&	\
diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index a618b3c90161..02fe733f0204 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4889,6 +4889,17 @@ struct mgmt_frame_regs {
 	u32 global_mcast_stypes, interface_mcast_stypes;
 };
 
+/**
+ * struct cfg80211_smd_transition_info - SMD BSS Transition info
+ *
+ * @ctx: Dynamic context to be transferred as part of ST
+ * @type: Type of ST indication
+ */
+struct cfg80211_smd_transition_info {
+	struct ieee80211_smd_ctx *ctx;
+	enum nl80211_smd_ctx_type type;
+};
+
 /**
  * struct cfg80211_ops - backend description for wireless configuration
  *
@@ -9546,6 +9557,7 @@ void cfg80211_conn_failed(struct net_device *dev, const u8 *mac_addr,
  * @rx_tstamp: Hardware timestamp of frame RX in nanoseconds
  * @ack_tstamp: Hardware timestamp of ack TX in nanoseconds
  * @no_sta: set if no station is known for the frame (relevant for MLD)
+ * @st_info: SMD BSS Transition data
  */
 struct cfg80211_rx_info {
 	int freq;
@@ -9558,6 +9570,7 @@ struct cfg80211_rx_info {
 	u64 rx_tstamp;
 	u64 ack_tstamp;
 	bool no_sta;
+	struct cfg80211_smd_transition_info st_info;
 };
 
 /**
diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 7bfa421535ca..a377a16da5c4 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1735,6 +1735,10 @@ enum mac80211_rx_encoding {
  * @ack_tx_hwtstamp: Hardware timestamp for the ack TX in nanoseconds. Only
  *	needed for Timing measurement and Fine timing measurement action frames.
  *	Only reported by devices that have timestamping enabled.
+ * @smd_ctx: Pointer to IEEE P802.11bn SMD BSS Transition context information.
+ *	Only needed for ST Preparation Request and ST Execution Request action
+ *	frames. The pointer will be consumed by mac80211; must be kmalloc-ed.
+ *	Indicated by @smd_ctx_valid.
  * @device_timestamp: arbitrary timestamp for the device, mac80211 doesn't use
  *	it but can store it and pass it back to the driver for synchronisation
  * @band: the active band when this frame was received
@@ -1775,12 +1779,15 @@ enum mac80211_rx_encoding {
  * @link_id: id of the link used to receive the packet. Set and used by
  *	mac80211 internally, it uses @freq set by the driver to identify the
  *	correct link per vif.
+ * @smd_ctx_valid: if @smd_ctx has a valid pointer to the ST context. This flag
+ *	is used only for ST Preparation or ST Execution Request frames.
  */
 struct ieee80211_rx_status {
 	u64 mactime;
 	union {
 		u64 boottime_ns;
 		ktime_t ack_tx_hwtstamp;
+		struct ieee80211_smd_ctx *smd_ctx;
 	};
 	u32 device_timestamp;
 	u32 ampdu_reference;
@@ -1814,7 +1821,8 @@ struct ieee80211_rx_status {
 	u8 chains;
 	s8 chain_signal[IEEE80211_MAX_CHAINS];
 	u8 zero_length_psdu_type;
-	u8 link_id:4;
+	u8 link_id:4,
+	   smd_ctx_valid:1;
 };
 
 static_assert(sizeof(struct ieee80211_rx_status) <= sizeof_field(struct sk_buff, cb));
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 9514f01778be..cf1a5d54d229 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -268,6 +268,8 @@ struct ieee80211_rx_data {
 	};
 
 	u8 link_addrs[3 * ETH_ALEN];
+
+	struct ieee80211_smd_ctx *smd_ctx;
 };
 
 struct ieee80211_csa_settings {
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index b3990b7a7299..4ad7a71d298a 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3970,6 +3970,22 @@ ieee80211_rx_h_action(struct ieee80211_rx_data *rx)
 	return RX_QUEUED;
 }
 
+static void
+ieee80211_rx_h_userspace_mgmt_st_req_frame(struct cfg80211_rx_info *info,
+					   struct ieee80211_rx_data *rx)
+{
+	struct ieee80211_mgmt *mgmt = (void *)info->buf;
+	u8 type;
+
+	if (!rx->smd_ctx)
+		return;
+
+	type = mgmt->u.action.uhr_link_reconf_req.type;
+
+	info->st_info.type = type;
+	info->st_info.ctx = rx->smd_ctx;
+}
+
 static ieee80211_rx_result debug_noinline
 ieee80211_rx_h_userspace_mgmt(struct ieee80211_rx_data *rx)
 {
@@ -3981,6 +3997,7 @@ ieee80211_rx_h_userspace_mgmt(struct ieee80211_rx_data *rx)
 		.link_id = rx->link_id,
 		.have_link_id = rx->link_id >= 0,
 		.no_sta = !rx->sta,
+		.st_info.ctx = NULL,
 	};
 
 	/* skip known-bad action frames and return them in the next handler */
@@ -4002,6 +4019,9 @@ ieee80211_rx_h_userspace_mgmt(struct ieee80211_rx_data *rx)
 	    ieee80211_is_ftm(rx->skb)) {
 		info.rx_tstamp = ktime_to_ns(skb_hwtstamps(rx->skb)->hwtstamp);
 		info.ack_tstamp = ktime_to_ns(status->ack_tx_hwtstamp);
+	} else if (ieee80211_is_st_prep_req(rx->skb) ||
+		   ieee80211_is_st_exec_req(rx->skb)) {
+		ieee80211_rx_h_userspace_mgmt_st_req_frame(&info, rx);
 	}
 
 	if (cfg80211_rx_mgmt_ext(&rx->sdata->wdev, &info)) {
@@ -5340,7 +5360,8 @@ static bool ieee80211_rx_valid_freq(int freq, struct ieee80211_link_data *link)
 static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 					 struct ieee80211_link_sta *link_pubsta,
 					 struct sk_buff *skb,
-					 struct list_head *list)
+					 struct list_head *list,
+					 struct ieee80211_rx_data *rx)
 {
 	struct ieee80211_local *local = hw_to_local(hw);
 	struct ieee80211_sub_if_data *sdata;
@@ -5349,16 +5370,14 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 	struct link_sta_info *link_sta;
 	struct sta_info *sta;
 	__le16 fc;
-	struct ieee80211_rx_data rx;
 	struct rhlist_head *tmp;
 	bool rx_data_pending;
 	int err = 0;
 
 	fc = ((struct ieee80211_hdr *)skb->data)->frame_control;
-	memset(&rx, 0, sizeof(rx));
-	rx.skb = skb;
-	rx.local = local;
-	rx.list = list;
+	rx->skb = skb;
+	rx->local = local;
+	rx->list = list;
 
 	if (ieee80211_is_data(fc) || ieee80211_is_mgmt(fc))
 		I802_DEBUG_INC(local->dot11ReceivedFragmentCount);
@@ -5390,8 +5409,8 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 	}
 
 	hdr = (struct ieee80211_hdr *)skb->data;
-	ieee80211_parse_qos(&rx);
-	ieee80211_verify_alignment(&rx);
+	ieee80211_parse_qos(rx);
+	ieee80211_verify_alignment(rx);
 
 	if (unlikely(ieee80211_is_probe_resp(hdr->frame_control) ||
 		     ieee80211_is_beacon(hdr->frame_control) ||
@@ -5412,9 +5431,9 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 					   sta);
 			link_sta = rcu_dereference(sta->link[link_pubsta->link_id]);
 
-			rx.sdata = sta->sdata;
-			if (ieee80211_rx_data_set_link_sta(&rx, link_sta) &&
-			    ieee80211_prepare_and_rx_handle(&rx, skb, true))
+			rx->sdata = sta->sdata;
+			if (ieee80211_rx_data_set_link_sta(rx, link_sta) &&
+			    ieee80211_prepare_and_rx_handle(rx, skb, true))
 				return;
 
 			goto out;
@@ -5434,13 +5453,13 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 				continue;
 
 			if (rx_data_pending) {
-				ieee80211_prepare_and_rx_handle(&rx, skb,
+				ieee80211_prepare_and_rx_handle(rx, skb,
 								false);
 				rx_data_pending = false;
 			}
 
-			rx.sdata = sta->sdata;
-			if (!ieee80211_rx_data_set_link_sta(&rx, &sta->deflink))
+			rx->sdata = sta->sdata;
+			if (!ieee80211_rx_data_set_link_sta(rx, &sta->deflink))
 				continue;
 
 			rx_data_pending = true;
@@ -5458,20 +5477,20 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 				continue;
 
 			if (rx_data_pending) {
-				ieee80211_prepare_and_rx_handle(&rx, skb,
+				ieee80211_prepare_and_rx_handle(rx, skb,
 								false);
 				rx_data_pending = false;
 			}
 
-			rx.sdata = sta->sdata;
-			if (!ieee80211_rx_data_set_link_sta(&rx, link_sta))
+			rx->sdata = sta->sdata;
+			if (!ieee80211_rx_data_set_link_sta(rx, link_sta))
 				continue;
 
 			rx_data_pending = true;
 		}
 
 		if (rx_data_pending) {
-			if (ieee80211_prepare_and_rx_handle(&rx, skb, true))
+			if (ieee80211_prepare_and_rx_handle(rx, skb, true))
 				return;
 
 			goto out;
@@ -5526,14 +5545,14 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 		if (link_sta && link &&
 		    ieee80211_rx_valid_freq(status->freq, link)) {
 			if (rx_data_pending) {
-				ieee80211_prepare_and_rx_handle(&rx, skb, false);
+				ieee80211_prepare_and_rx_handle(rx, skb, false);
 				rx_data_pending = false;
 			}
 
 			/* No valid_links check as we need to RX beacons */
 
-			rx.sdata = sdata;
-			if (ieee80211_rx_data_set_link_sta(&rx, link_sta))
+			rx->sdata = sdata;
+			if (ieee80211_rx_data_set_link_sta(rx, link_sta))
 				rx_data_pending = true;
 
 			continue;
@@ -5562,22 +5581,22 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 		}
 
 		if (rx_data_pending) {
-			ieee80211_prepare_and_rx_handle(&rx, skb, false);
+			ieee80211_prepare_and_rx_handle(rx, skb, false);
 			rx_data_pending = false;
 		}
 
-		rx.sdata = sdata;
-		rx.local = sdata->local;
-		rx.link = link;
-		rx.link_id = link->link_id;
-		rx.sta = NULL;
-		rx.link_sta = NULL;
+		rx->sdata = sdata;
+		rx->local = sdata->local;
+		rx->link = link;
+		rx->link_id = link->link_id;
+		rx->sta = NULL;
+		rx->link_sta = NULL;
 
 		rx_data_pending = true;
 	}
 
 	if (rx_data_pending &&
-	    ieee80211_prepare_and_rx_handle(&rx, skb, true))
+	    ieee80211_prepare_and_rx_handle(rx, skb, true))
 		return;
 
  out:
@@ -5597,6 +5616,15 @@ void ieee80211_rx_list(struct ieee80211_hw *hw,
 	struct ieee80211_supported_band *sband;
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ieee80211_smd_ctx *smd_ctx = NULL;
+	struct ieee80211_rx_data rx = {};
+
+	/* cache the pointer to free it later */
+	if (status->smd_ctx_valid) {
+		smd_ctx = status->smd_ctx;
+		status->smd_ctx = NULL;
+		status->smd_ctx_valid = false;
+	}
 
 	WARN_ON_ONCE(softirq_count() == 0);
 
@@ -5731,6 +5759,12 @@ void ieee80211_rx_list(struct ieee80211_hw *hw,
 
 	kcov_remote_start_common(skb_get_kcov_handle(skb));
 
+	rx.smd_ctx = smd_ctx;
+
+	if (WARN_ONCE((status->flag & RX_FLAG_8023) && rx.smd_ctx,
+		      "802.3 packet but with IEEE P802.11bn SMD context"))
+		goto drop;
+
 	/*
 	 * Frames with failed FCS/PLCP checksum are not returned,
 	 * all other frames are returned without radiotap header
@@ -5748,12 +5782,14 @@ void ieee80211_rx_list(struct ieee80211_hw *hw,
 			__ieee80211_rx_handle_8023(hw, link_pubsta, skb, list);
 		else
 			__ieee80211_rx_handle_packet(hw, link_pubsta, skb,
-						     list);
+						     list, &rx);
 	}
+	kfree(smd_ctx);
 
 	kcov_remote_stop();
 	return;
  drop:
+	kfree(smd_ctx);
 	kfree_skb(skb);
 }
 EXPORT_SYMBOL(ieee80211_rx_list);

-- 
2.34.1

