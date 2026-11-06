Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952010;
	b=ylYVLvhtf+UFLg7c/jyekaqtabbTkMDSpP54HN6lp3Iqr/mqec+BV6AHtTE46qofl8WT
	 tJOpZLgMlfKfMTRiHPEMmaj4l9vcnm8KXaqkK+ebEdTeZwdGWZcOjOn+XwRFtzlO0k1cb
	 b3Zaj9cw8rGIyIKNfab5TS/0HCYbbF1jkOYe0o/UYGWUdtC7MQ8qzPJzVF8fKPx9BDZLN
	 OyomniJFy5ZjsFhUN1yh77k47dA9S/nVyBJK/4QAIgJAGErNDB0ojGkmXR7JbYhV+Cyut
	 xZJ8EXyRUCCmCP/txwsHHTtpBB3lz6NRuOxhvzq9UD8YZmG7FplHWWv2lsfc0Awn4JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rT/d7+i9YSFZFfCF66tfzOlOFOmBtXy3cwDPZswL+pQ=;
	b=lMrmTjKn6V7p39oEcwhMIIEixKnt8eYlW5T0S0w/Bfw4JJmDBHZiDRLVUeY7MCrDEE43
	 z0mp9ytOo6QMxUQVQYTLZpWCQyEZEYWqLDRIzsI9iWLTvBzJjBQDeO4AUI5mJ9KD8fYfN
	 VS2lvYHbOnwx8wxsKigt8yyfCOM+XSyY3uV12YBTynQDOVLz6fP0aMoWtieeyZ95yz/K9
	 15pL7TVfehTdVzXA4/FsItjbo/XCyATVTAcrJQn3etcDB1izBTeO9kREc7cQdxNPNTpXM
	 NlQf9K69C9Fu+ZqRhouFjkQFztk1sO6FInd1bGnrdWZFLz0SworblbhFTt5ChnxII5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1bjP7gu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O94qcogg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4357B60A262C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4357B60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1bjP7gu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O94qcogg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67ROak3906879
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rT/d7+i9YSFZFfCF66tfzOlOFOmBtXy3cwDPZswL+pQ=; b=l1bjP7guESCFs1df
	rSdobeW0X0QRxmxSdXvxd0O9hj5fdW6tJ3T63P2qY0tc8hTtWJllFNtj3QDcnaHo
	bgjP4dso6k/qcoRuI/bl4l2ffBPv6AU1+DhIDSWhNd9/HHMnVR//iytHy3g7P6jp
	SewldhVLA1+K/izA1m+Z7Vr3olb1+ZKXEsfKc7PZ2ZxTay4/roVDFp7oq7M1yT7S
	PRBVxR+bR3FvN/JsDMzi3JOWjmarOKB7CWwkxcWAMB1YxL+0MHMxrFCw+ly4sLwl
	Ymv+VHzvpNdnQMiGJQS3TvwYRd9kgRJIYUWXc66FfPvjuTojxcXQhCYH+072UQMq
	ir/3YA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pasqmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:00:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so382387a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952008; x=1794556808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rT/d7+i9YSFZFfCF66tfzOlOFOmBtXy3cwDPZswL+pQ=;
        b=O94qcoggwEP0m6j2HcB/+mhoN1qp66EgedQ/kvFuF7sr9IJHZyHGqAV2VPDsq8a0YL
         H4ffdW6YRqj5T5Of5T2YRloRIXkUcHqyzHaQYM3KB8UDZptaCFCNUz0ZZcXK+ziaRolQ
         OgZ05KRJzBKQuqc2Kh/kBcefYTbWBQu8HFRNPVV110S0WW/mw8zbdFgPN9zFjJW620LH
         nYTRBJoLPkZz8N9ZNdAXD3Q+Jyobj61OvyuYXC/gU7uVNPjp5/onE1vlpRskbtZ9cui5
         d+5z07gBH/luwqL45t2LVZtGMUtD++lzKVTgM7M5W30gWfBRS6W/jRmc19V5ob+2yVEx
         SCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952008; x=1794556808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rT/d7+i9YSFZFfCF66tfzOlOFOmBtXy3cwDPZswL+pQ=;
        b=TIwH4GOOpFiYN1P5xkH5tJNpCVuA6G9NfAZqVElVLHJILERYS8AoJePxzVQVwAXQUV
         2Vk/rNXbmx5Y/IqEWcVoty1cjr01nZiSuoit9vHc/GRMPmN/QHbsSxQJNHlmlAcFfd3g
         ugd1Iy/yvYUXxir6s2u1uCRZFjY7cY9HSuI6hNUjdQJK5Qd1knCzT/c1ApwFnI1vxHza
         jILTeVIiWmRjMXB1P/6/FfTkGCrvyBseFRh0u/4z0EHYwGG7+0k7dYW2bovVtazu1jdl
         c7rT29zGhDWdeJus/Rmn+bi/COISvBjp5egDghBBrZcJXaaq4kOBH63yEOfkvIIlyJ68
         bg7Q==
X-Forwarded-Encrypted: i=1; AL+hErF1MRhUAB2PSkjijIyU83LjtfLRqEpH/4PLa7rXDYHMliNpcKwaNpGd+/wGDuywPd547Rhydw1D7fCayOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oSz49OCySnNuhz6F3/AraryN/3wsmyYNVJw7idXgFcNJBUUaF
	oroB6b7stbp5KF6D3mEhliLYse9Y+mfp0QWnsg6fN5HoR3nRpYx1OKNYi9G2sIzXWL6O5EOt6s9
	QNG7YD6/fYgfScO85tRsqIUOzCHg/iE8DO8bzSyoOSjqG/53T3gNrhHhYdH6aOU1GAA==
X-Gm-Gg: AYBFou26y+p78kjKGw7J8OhHXKh9LLoQnKs28GtkJLw1k3S9c9FYuP27x3BRvNHQQmL
	AXPWvT0LDMzkQfqr3WlB3J9Wjdee761yB0CwhFuYNAeBsO5DappIsdFoE/z2sGzn78vA7XiFjVQ
	NIvwKDP0qTc1+7mOCJeFBZfuP94sLLs7Rkobhdua83htAslXRyOagrSMXAAJWykbBMXJJk/aCHj
	/gSpnrlSRpg9DuLQ+Mpwv8UWeBojlvquM3TtItHOiQvwBUxoWCuDrBDhAlJklNA/Q4YpT4rA0rU
	XTqDnLCMqYUHThDhh4zsDU5LS0D98Wid0zcG8Vu84u/1efo0Gj/4zyJne0SJFgxq3z26mNV1V1V
	SLn7idAD9WxSQGcNfA9+D0+o8+bEkpwNshRX3ZrGq484Db6F5b+46fPr6T6AoLCEF+r9IjboiRQ
	WZqW/HBi/F4ZdRYqi1UaSDzB1qkM5t2k8j3+v5buzDH5fQ1g7h5TAjdW2rVcd9DPNbseK2YRA=
X-Received: by 2002:a17:90b:270e:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3b0db7092eamr1650310a91.51.1793952008054;
        Fri, 06 Nov 2026 00:00:08 -0800 (PST)
X-Received: by 2002:a17:90b:270e:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3b0db7092eamr1650286a91.51.1793952007523;
        Fri, 06 Nov 2026 00:00:07 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.06.00.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:07 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:55 +0530
Subject: [PATCH wireless-next v4 18/21] wifi: mac80211: handle UHR Link
 Reconfiguration frame
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-smd-v4-18-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX4PK7EXOI3WSG
 jw6PEzkI/V7ezv18FHHT3ejysTmB85jbThXEgYy/86ouMBrgv81FwnCrhONXbPAS4PRbZJdkfTK
 J5+xaMcpi5u0zfFdEANyBypzD371E/2hEXG4F1D5F11FpmnbViF4cn4rAW651fzJrBhL3paK+ej
 ErwOu2KdNIo38V9QH1O9mBr52OssijTokS+MI8RyqnHVz792o6tuqy8SsWFSruLa+OVSOa9i2sw
 p12Lm+G9+cQLPWXheqT7Xwb1ZJGGmGYd9C2dNYSQbaAgGuk+bGkeiM+ZEAUW6egux5ZyFF31SsW
 Ll1S4jJUYSNPsdduPykapyxLezvpzRmRiLbm0VKWYrlpn2Y8j+tYRRvhIfubzD6gbgK0Ud80/sD
 z2ZLw6uEwCq/R5tZ+e4flLuduNSt7YJUew6itDKF46XHtV4jjAZV/N7L6a1uFzycRoiPqVAWV1j
 GcSRk6d4LYSkgB4qCcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX1p+LOH65CfC9
 lM4lts42PachQogDrOm7ySfuf2+3nG5YCJ10u5lLwxx2Yka7+5JNfo1trEOOTrHNZlHXIpxNyO7
 +4+RFqtuOk9xalCG/pPpCDY9B4a3cdI=
X-Proofpoint-GUID: YRk5RH2aeCbVStMooZw016-hYx9M2UlJ
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed8909 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2D4fXk2DXaNhJLBsYzwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: YRk5RH2aeCbVStMooZw016-hYx9M2UlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060031

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
 include/net/mac80211.h     | 10 +++++++++-
 net/mac80211/ieee80211_i.h |  2 ++
 net/mac80211/rx.c          | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 2a595126b1e3..2539b5ffd78b 100644
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
index 9906a62ee99c..82e8542973bc 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -279,6 +279,8 @@ struct ieee80211_rx_data {
 	};
 
 	u8 link_addrs[3 * ETH_ALEN];
+
+	struct ieee80211_smd_ctx *smd_ctx;
 };
 
 struct ieee80211_csa_settings {
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 78967ac95343..a3ffb08f50ba 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3992,6 +3992,22 @@ ieee80211_rx_h_action(struct ieee80211_rx_data *rx)
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
@@ -4003,6 +4019,7 @@ ieee80211_rx_h_userspace_mgmt(struct ieee80211_rx_data *rx)
 		.link_id = rx->link_id,
 		.have_link_id = rx->link_id >= 0,
 		.no_sta = !rx->sta,
+		.st_info.ctx = NULL,
 	};
 
 	/* skip known-bad action frames and return them in the next handler */
@@ -4024,6 +4041,9 @@ ieee80211_rx_h_userspace_mgmt(struct ieee80211_rx_data *rx)
 	    ieee80211_is_ftm(rx->skb)) {
 		info.rx_tstamp = ktime_to_ns(skb_hwtstamps(rx->skb)->hwtstamp);
 		info.ack_tstamp = ktime_to_ns(status->ack_tx_hwtstamp);
+	} else if (ieee80211_is_st_prep_req(rx->skb) ||
+		   ieee80211_is_st_exec_req(rx->skb)) {
+		ieee80211_rx_h_userspace_mgmt_st_req_frame(&info, rx);
 	}
 
 	if (cfg80211_rx_mgmt_ext(&rx->sdata->wdev, &info)) {
@@ -5630,10 +5650,18 @@ void ieee80211_rx_list(struct ieee80211_hw *hw,
 	struct ieee80211_supported_band *sband;
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ieee80211_smd_ctx *smd_ctx = NULL;
 	struct ieee80211_rx_data rx = {};
 
 	WARN_ON_ONCE(softirq_count() == 0);
 
+	/* cache the pointer to free it later */
+	if (status->smd_ctx_valid) {
+		smd_ctx = status->smd_ctx;
+		status->smd_ctx = NULL;
+		status->smd_ctx_valid = false;
+	}
+
 	if (WARN_ON(status->band >= NUM_NL80211_BANDS))
 		goto drop;
 
@@ -5765,6 +5793,12 @@ void ieee80211_rx_list(struct ieee80211_hw *hw,
 
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
@@ -5784,10 +5818,12 @@ void ieee80211_rx_list(struct ieee80211_hw *hw,
 			__ieee80211_rx_handle_packet(hw, link_pubsta, skb,
 						     list, &rx);
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

