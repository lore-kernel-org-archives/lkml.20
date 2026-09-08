Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDF85908CB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887477; cv=none; b=GRMLKt2iDttjBs1EqJbbqXCQpvLk+5xEnAu9ez4sI/zl2bHiGbqv4XdfdYNAU7la371C3ul92hUnPEZGObnpOh7TVgse9qc8wXI1Nf61yPG9h65qPSM71qwGD8Qkjp5eQrTlblDQPq/5V8eJQpQRSEu2UQb7dcrD8zchuchW44o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887477; c=relaxed/simple;
	bh=1uMWzUWflebLiT0iHAY0034lgOkn4kH51Nlr0m2TKN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHFxfPsR7G1Bd0Nbwwl/WalNcPlAe34ip9E/x17qd0/OUtZ6jelcaexVTIlDAT2gJpsW7jQE5JcPRAetWn9NO8O/0kwC11jcXUatcvcI1+aNln+oRxb9w6nG6dbEeb6Gg7fcUdbZLMq39AUJ5ddLjAfHUlBGY7sDWi+RU7rA5WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8cWA0Hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HklKwvh9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8cWA0Hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HklKwvh9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdaU82899286
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 17:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAgmn3n8oR+1sTJOd89f91uGu1zJpklwZxV7NMQTcT0=; b=L8cWA0HyxdfCcJDR
	ZME9ajAXc016Nj32Is24rfrMh1b4aitmlCc8c5V6CB6MAnahwn+RSqrE3h8CrOgU
	TUmvvvEsL770Xp0K3W82ZswhECsUtJnGTfq5ZPTikK8NidYuLw2Nc5HSSViQuylE
	ZXZnJUvtYt1L7Hr5IjhtobfhHu0iLzyDdlUtXw133dEdnhpoUZdw+wBC3i2cMvKJ
	kY5uZGACwXOcULCSOuNHvM3N2uPub+s0wMb3zDGTUgZQ1MhCe+JiPhqvVyMhhM1v
	ihZmDmS5xJKWR4v0ZRZcUiwhFkHUpBKPSOa6DFUlRnnK1JHkoDiWJTu3IEwezawF
	pJuH1g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvujvgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:11:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so8488026a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788887471; x=1789492271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DAgmn3n8oR+1sTJOd89f91uGu1zJpklwZxV7NMQTcT0=;
        b=HklKwvh9lQesTQHqKE4Huya3ybjLVMcH2PlnQsJDTaQdAxHpkwjOGj/SxaqFWMGps7
         LAGPXvXwiR8bycC9kYzBctTG4549dJLJMJNfvCEibDkiPDVxC2YxFBhDwRxqsqZf5ccm
         5MIB6BLoQNDz41Cl8dRJIPaJkJyaus2nk91LorikqtW3gMLDZ10MqZOHku6yCWLWDoiP
         +JJIzS426iaxqf1ChGf8n1H0J4YAjZo4VY10CEh97+IBhsozCgdETAXMZzBWz/LvxivQ
         0nSywvFsfTgS3PpNu8r2eAq2uPcZwSRd6CVNOrvfsQh5zuTG4Oiz6cHcv35zraYShzsJ
         xL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887471; x=1789492271;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAgmn3n8oR+1sTJOd89f91uGu1zJpklwZxV7NMQTcT0=;
        b=FuuUFw2xeTKxoMifQcZ2/JBOv2Ys9J4EBdjrtTSzg6arz8crUR+ywnPhVMFAyc/0Oj
         Q+CyBfj4RQ4WaVVyWEYZxHJR3WsBgNY71jN9Y7Txt59y5Bq0KR/Sjly5JQgOLnNrlVj5
         SIxE3OGGA8SSL7e9INRhoZZbvI+5BYtZ9PyErHT1TKbWt9IDBAFdWr3QP4w62hbJ52YQ
         faZKLEv/RhH5zn7Jq9MIbj5GpPYpHgcrRo1UCoYtG7RYoWXdP/w8mnz8mECxc3Y5SXKa
         9TE50q3sWnUKDJgV3BYb0/h4re1YfIU4H82E1VpTU6+7B2MF0Jfw3sg3d4eTRsGNJz0y
         EO9A==
X-Gm-Message-State: AFuF++mom0b6SO/HMNbHiZD42QBQriwkUMknUE8sO5VZpBGMsn2pJ+iR
	TCYo5MR5QicTKNe/CtK3mKs41D32YJYCRiLjiLHkkTM+5GouQlKV3rqSDzvmvZGtOu0R+5aUbcg
	YwjqUtYijLSO0O8ITRfvdlm/SXHZPPktydS6oBzavO/gQ9jcQVm77gx1dGxZ+4Sesjyu2byiiZQ
	==
X-Gm-Gg: AYBFou3QkTzHSUdTc0jt4EudYZ1J8+GmhKX8x1XYwew10EnEqgEDFUIQl0BWga3Bges
	5SKWIm4ZwYBE3L9CqIf/LkkN2xBGlvEI2OumeDC5QSvJCL1v2TVKUqb2udpj32+qWFze5aa3w9o
	B9nzt0cwGKDj2AtKd9o7YbO2JVE2xTNVlCPmQtA4cKHL4Rjji0nXbafRzg+MNK+tuiljByYxbwE
	D+HGPecitwbHikTGM1iq7PDhPgy2aBIzzSxc0qnjAxfN1L/zhePA6KPvGyy7Q047pgMwDDr5ZWV
	GbSD2fEk/KvQrTfU3r1Une9Fo5vQYxxLkJETlTjbWxwzR4J2yuOTlwDFhJhBOHMz732WzmFzJgF
	2lOdLkTx45opVFxAA3Hcgk/KmhpWtYIXAdVdPtXvLcUBO0wByABKARbu5Vz83Ht4vkyJ2FEp8vr
	FuyIyozEqTqF4bteNsLdXD8A==
X-Received: by 2002:a17:90a:dfd0:b0:396:61f1:da5c with SMTP id 98e67ed59e1d1-39b260de667mr45064326a91.4.1788887471116;
        Tue, 08 Sep 2026 10:11:11 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:396:61f1:da5c with SMTP id 98e67ed59e1d1-39b260de667mr45064260a91.4.1788887470627;
        Tue, 08 Sep 2026 10:11:10 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm31773675eec.4.2026.09.08.10.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:11:10 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
To: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Subject: [PATCH RESEND wireless-next 16/18] wifi: mac80211: Add mac80211 support to handle NL80211_CMD_SET_SMD_CTX
Date: Tue,  8 Sep 2026 22:39:44 +0530
Message-Id: <20260908-smd-v1-16-9fd2d876a1fb@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6aa041af cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zHDNONmbSdC_GOYWSZkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: u4NkHXPYXliQVEENmLyNkVgRTyKoK1eh
X-Proofpoint-ORIG-GUID: u4NkHXPYXliQVEENmLyNkVgRTyKoK1eh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE4NiBTYWx0ZWRfX9ZPLM/F2lqPk
 AkeeS/A2imNBAUL1+KDHcMGepoi+41FuI/AdDu7UB2xLHL7klVxjt2dJmCEWR6pVqpF6eBkyFbS
 m+Dy6d51NWC3B52+BkEyKsnxTSlbk3vIZcA0PcO1qj0bxoRePgva+WiuOZNoR68h0d79Du3tz7f
 bzrAQ5sbwc6B7KYEMhEbwGVd19tC95PwjNuHJHvFMJ1dWT3OcnHtNo/s1wsMEFF2AhwAfJAs9ne
 GCMDLEgqjhGHehgM8FHcJ1fDM44/O3xfPfEr99/UB0VnPuIK2K1bVyht2gk/5YIUVJ1kQBZby3z
 APJGemoptxpKfqT+WxxvjRdw8eRXZ2NXoXUlZ7S4S70RVJINo9d/k3Yhp/nYTuGcTG2LmZLQmOW
 cw3ZGFF3x+Yao4bYOW6BRRjqbE5NZ3L32G1GojYCskuFUvcF9tHseBmUF44X7Qrg5pCP/JDX5+m
 rUK5A4fvFW7NPh7Ftdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE4NiBTYWx0ZWRfX5ONEjHwqdcDE
 jfSC9lOvJfWO/36EEIUPvbf4z/7sYID9zyg+nwgidxO3+i4YsY1UmuTTLhmg0XChPbmQFBhZl2p
 ZL76PmoRRISdYRIHy6Ua1Y9/1g3V4XQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080186

cfg80211 accepts NL80211_CMD_SET_SMD_CTX on the target AP MLD for
userspace to be able to program the station's dynamic context on the TX
and RX queues.

Add mac80211 support to handle NL80211_CMD_SET_SMD_CTX in the driver and
lower layers so that the context is installed and the target AP MLD is
ready to continue data transfer with the non-AP MLD from where it may
have left off at the current AP MLD. This enables the seamless roaming
facilitation of the SMD BSS Transition procedure.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/mac80211.h    |  5 +++++
 net/mac80211/cfg.c        | 24 +++++++++++++++++++++++
 net/mac80211/driver-ops.h | 24 +++++++++++++++++++++++
 net/mac80211/trace.h      | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index b4b1d3db9b19..e0e13f0ed31f 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4780,6 +4780,8 @@ enum ieee80211_sta_smd_state {
  * @sta_smd_state: Notifies low level driver about IEEE 802.11bn SMD substate
  *	transition of a station. It must not fail while transitioning down.
  *	The callback can sleep.
+ * @set_smd_ctx: Set the UHR SMD context for the non-AP MLD. This is used on
+ *	the target AP MLD side to program dynamic context.
  */
 struct ieee80211_ops {
 	void (*tx)(struct ieee80211_hw *hw,
@@ -5186,6 +5188,9 @@ struct ieee80211_ops {
 			     struct ieee80211_sta *sta,
 			     enum ieee80211_sta_smd_state old_state,
 			     enum ieee80211_sta_smd_state new_state);
+	int (*set_smd_ctx)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			   struct ieee80211_sta *sta,
+			   struct cfg80211_smd_transition_info *st_info);
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 0ea8b610a771..268d5f42293a 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -6081,6 +6081,29 @@ ieee80211_set_peer_nan_sched(struct wiphy *wiphy,
 	return ieee80211_nan_set_peer_sched(sdata, sched);
 }
 
+static int ieee80211_set_smd_ctx(struct wiphy *wiphy, struct wireless_dev *wdev,
+				 const u8 *addr,
+				 struct cfg80211_smd_transition_info *st_info)
+{
+	struct ieee80211_local *local = wiphy_priv(wiphy);
+	struct ieee80211_sub_if_data *sdata;
+	struct sta_info *sta;
+
+	lockdep_assert_wiphy(wiphy);
+
+	sdata = IEEE80211_WDEV_TO_SUB_IF(wdev);
+
+	if (sdata->vif.type != NL80211_IFTYPE_AP &&
+	    sdata->vif.type != NL80211_IFTYPE_AP_VLAN)
+		return -EOPNOTSUPP;
+
+	sta = sta_info_get_bss(sdata, addr);
+	if (!sta || !sta->sta.smd_params.smd_sta)
+		return -EINVAL;
+
+	return drv_set_smd_ctx(local, sdata, &sta->sta, st_info);
+}
+
 const struct cfg80211_ops mac80211_config_ops = {
 	.add_virtual_intf = ieee80211_add_iface,
 	.del_virtual_intf = ieee80211_del_iface,
@@ -6199,4 +6222,5 @@ const struct cfg80211_ops mac80211_config_ops = {
 	.set_epcs = ieee80211_set_epcs,
 	.nan_set_local_sched = ieee80211_set_local_nan_sched,
 	.nan_set_peer_sched = ieee80211_set_peer_nan_sched,
+	.set_smd_ctx = ieee80211_set_smd_ctx,
 };
diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index ce11a723ec36..e764dd394de2 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1820,4 +1820,28 @@ int drv_sta_smd_state(struct ieee80211_local *local,
 		      enum ieee80211_sta_smd_state old_state,
 		      enum ieee80211_sta_smd_state new_state);
 
+static inline int drv_set_smd_ctx(struct ieee80211_local *local,
+				  struct ieee80211_sub_if_data *sdata,
+				  struct ieee80211_sta *sta,
+				  struct cfg80211_smd_transition_info *st_info)
+{
+	int ret;
+
+	if (!local->ops->set_smd_ctx)
+		return -EOPNOTSUPP;
+
+	sdata = get_bss_sdata(sdata);
+
+	lockdep_assert_wiphy(local->hw.wiphy);
+
+	if (!check_sdata_in_driver(sdata))
+		return -EIO;
+
+	trace_drv_set_smd_ctx(local, sdata, sta, st_info);
+	ret = local->ops->set_smd_ctx(&local->hw, &sdata->vif, sta, st_info);
+	trace_drv_return_int(local, ret);
+
+	return ret;
+}
+
 #endif /* __MAC80211_DRIVER_OPS */
diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index 63838a6d5d07..7aba79e441cf 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -3438,6 +3438,55 @@ TRACE_EVENT(drv_sta_smd_state,
 	)
 );
 
+TRACE_EVENT(drv_set_smd_ctx,
+	TP_PROTO(struct ieee80211_local *local,
+		 struct ieee80211_sub_if_data *sdata,
+		 struct ieee80211_sta *sta,
+		 struct cfg80211_smd_transition_info *st_info),
+
+	TP_ARGS(local, sdata, sta, st_info),
+
+	TP_STRUCT__entry(
+		LOCAL_ENTRY
+		VIF_ENTRY
+		STA_ENTRY
+		__field(u8, st_type)
+		__field(unsigned int, num_tids)
+		__dynamic_array(unsigned long, dl_tid_bitmap,
+				BITS_TO_LONGS(IEEE80211_SMD_CTX_NUM_TIDS))
+		__dynamic_array(unsigned long, ul_tid_bitmap,
+				BITS_TO_LONGS(IEEE80211_SMD_CTX_NUM_TIDS))
+	),
+
+	TP_fast_assign(
+		struct ieee80211_smd_ctx *ctx = st_info->ctx;
+		unsigned long sz;
+
+		LOCAL_ASSIGN;
+		VIF_ASSIGN;
+		STA_ASSIGN;
+		__entry->st_type = st_info->type;
+
+		__entry->num_tids = IEEE80211_SMD_CTX_NUM_TIDS;
+		sz = BITS_TO_LONGS(__entry->num_tids) * sizeof(unsigned long);
+
+		memcpy(__get_dynamic_array(dl_tid_bitmap),
+		       ctx->dl.valid_tid_bmap, sz);
+		memcpy(__get_dynamic_array(ul_tid_bitmap),
+		       ctx->ul.valid_tid_bmap, sz);
+	),
+
+	TP_printk(LOCAL_PR_FMT VIF_PR_FMT STA_PR_FMT
+		  ", ST type=%u DL TIDs: %*pb, UL TIDs: %*pb",
+		  LOCAL_PR_ARG, VIF_PR_ARG, STA_PR_ARG,
+		  __entry->st_type,
+		  __entry->num_tids,
+		  (unsigned long *)__get_dynamic_array(dl_tid_bitmap),
+		  __entry->num_tids,
+		  (unsigned long *)__get_dynamic_array(ul_tid_bitmap)
+	)
+);
+
 #endif /* !__MAC80211_DRIVER_TRACE || TRACE_HEADER_MULTI_READ */
 
 #undef TRACE_INCLUDE_PATH

-- 
2.34.1

