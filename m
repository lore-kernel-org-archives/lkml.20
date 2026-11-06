Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952016;
	b=sfS87q1NzgU8ct0dGovhpLdboG1IbLrQK7M4nv0rtvNPmj///gT6WDyOnr+T0WRoI4ip
	 8xjEMsCyTVGXXo8tP8fjkU4+5ZAI3UBXcLLJxZQRlJ/f52X12V03R6gB0Y+/SaOZVXVl9
	 iwPWlNQ/t1mq6rXdCNqHzc3vOiR7gygXpiUHkCE3QRSb5h0EIhXiH45ji7fVcEy3LdaOx
	 dIf6gZl3LyArqekfzjau28q78trryV9bDMIUdqdaj99ui8ZjoShyLlvmqz+C4vvEeTrUZ
	 SD5bbA3Oq1eQuX6KFpLahetuOzjlZHj1y/dZuMt/kE7zK35tVQMRe69+gYrVM824JPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952016;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=58cqdlgifRKWV1I5Qv4pWFFday1yRTm7BjeSoU3ga54=;
	b=OVY/cqAGwehSsXqBOqSETyZgY98UNnN3gR5uHs5bV8CuUqcl26Ki0X31BjuUOSBySi85
	 E3xWqJ8XSMY1LeuRPlFp8BjVEtdvbQhfVuAcyFDqjxroNCtYTl3uRCjly3cxpBaatdVcf
	 ZCzXnR5hzwbUSeWqF3IGLYK8xj1Sid/Hx2iLXh9of8NThzMO/24HDsMfGo2V+v/lucUBJ
	 aOQPw2wEWhnc4uUVHu0bYtDy/WxuUozs+QYdrlaVY66iPgOBBMD9SndEQxeqk6GS2fboh
	 OUOv5TvI4RPHwpQS8lXut/NMFDyfjOeGPZGdwhnu4ViznQEm1BdB5xOiJElZ1TfkqGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6V3+As1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1o5cj6A;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BA96082BDD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03BA96082BDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6V3+As1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1o5cj6A
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RMMD2933606
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58cqdlgifRKWV1I5Qv4pWFFday1yRTm7BjeSoU3ga54=; b=d6V3+As1GHYnrqti
	oD5UbqB4+PYCuT+n0Es+N+8abbZ1bplZD9CBhN8LqAaCTlxgndCiOfrze79VStgO
	UqNQ+O3cRWXS/+0t6fUwXHnJdjNZ2XG7GkdxGs2fc1Cxm5RL3ObqKhN4kdkxInof
	ABfgJpYc1F2QM9a4ymhHohlp3rtf7+nL8ljco+OKiTGXCHox9vXEkJJBNJscZkQQ
	Uuxv0Z+dO4OHeFx4i1umEqMdB5UcMG7jZY3DAuvurlS6brBu+7Lg29H+2sNy0Svt
	F0dnUGtpYBN1tsVanRXmajOj9qADUroKQXRKqrrwW0bmpjZ48kSOkWzPC8apbvgO
	MSVFrg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1r7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:00:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so410112a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952013; x=1794556813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58cqdlgifRKWV1I5Qv4pWFFday1yRTm7BjeSoU3ga54=;
        b=B1o5cj6ACy1fHz2Y7LSBju5tEcB30oW+KXjW6DXtVgAGQRs4phxhcQDdf3OZewPGc2
         VsNSUAP8EZHT9MaIkqkE2MAKdqKcdFYBeNCpHy46mybVa+GFeM0sL2IHvGyQgQIjPRfQ
         D0BgG1lqi46+MttVxW+AkT7BQS9kfF19MzlGWkhZNxM/Z6FrGxlwupGWYC0u/WWbzHGZ
         UYHvyDYSEuCby/ueg3A80MCsPTQuRaq0zskcLvPGHIPSnOyMxA3a+VGhRk83TgECprpZ
         sdhGRaJAYuZs4rM5ERmaPN3lpGXY66nFNMSEHIryDCgF5DICKmva4ZHmdbBPuQu0CEqw
         EgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952013; x=1794556813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58cqdlgifRKWV1I5Qv4pWFFday1yRTm7BjeSoU3ga54=;
        b=MG0MzkNeAlHfsn7oG14mN2EEH3oAynprupiKlGHS1ftTgXUSTd9f0u/XqQV16q8eIV
         GP8Ud7QI9lLwipYbj9uYXuRAwFuh3s8bZl1l0bg4Yenik9G+SgAlKRUO26Iy/5sXdVgC
         ZxHhr+SdfSoLsCUttOv29Iif2kYcAMiiikKg3deThmirZCh7Rdzp8j7znOIBXw8HCR97
         YJ6LplEWeNG3ZvMr9DNG4CF9vtXnCvasUVTZTRb4wCzeNBxcHMJlqrd5HX5tHifkI/0F
         hZFJ5aQUvfJA04G/0clG7CCyifbU4OE7phtQ+WRslGm9Xd8/L+6fCum8GKhyRc/vw7xZ
         fyng==
X-Forwarded-Encrypted: i=1; AL+hErFVXl4O7kL3DeGsrnQJSVhsTtETIqbEj9YgaJjw+htPl19ADK1LsFZGDiVa1Ot+skTfM3lvfnl9Zz/Z5fY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bXGwdn+rKsKSaTB/MR/EOD3qMJ1n6MzayzS9+v0D2tiNIln35
	P4jnFuz8Pf6vEdT3dAzUchVcAyGIj86MY3AjgafwqsJ0LtA2PCVDZn+26ve9q+bKAXZpXxuz7Zo
	8fEaeluT00Fjf3jkRmeHyOvifBN/P33qwDlY3OB+/qo/2Mx04XPknNCilS2Dp1kWQhA==
X-Gm-Gg: AYBFou2YlXSNQDM6xjXHvYzeFCztXHUKJ2auZWPBbgAyVe6R86Z4jMvyl4nVvAmJYf5
	Z74Amua5Qgbi7n/nh0tYMsW+BNE2PVZoHJVwATlZIhTyEwzFGh3AwqJD1SW0w+0+Qj50YI+rKsW
	gNGhspetvjoS7h/RWdEh40aIf7xyDneUOfG57wdz7fVnJuqnA67zAaDIF6SgfREkNlvY1s6zqn4
	dI7RmQgLDW2SQ58jyxJ2ANL47cmXskEys/XiNkuTKTAC3EDCLhyiTZXiSpdHAmyPPrIvpD21ZI/
	2Kyzz2bDA1zshzo64TVMkWV6f5kCiZdj1UzZr8/0BSSkCpJ7URDfESlK2ihb2PodmoCh9icSrcX
	5NLn1sVZGxZnanmT8q47cwenMT8cTSyR/ohtsH31JD+hIq8G9ax82zdsdKkYqvRg9pwufemRDG5
	uTqEMsLkLxLs3GTqBcWXE+dJXfb9IbwRI7m+BWMkf9w3mf7VEC8FVkc0+pEom2kagQluJCaNc=
X-Received: by 2002:a17:90b:1b04:b0:3b0:a3eb:7597 with SMTP id 98e67ed59e1d1-3b0db72908bmr1272467a91.51.1793952012891;
        Fri, 06 Nov 2026 00:00:12 -0800 (PST)
X-Received: by 2002:a17:90b:1b04:b0:3b0:a3eb:7597 with SMTP id 98e67ed59e1d1-3b0db72908bmr1272443a91.51.1793952012360;
        Fri, 06 Nov 2026 00:00:12 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.06.00.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:11 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:57 +0530
Subject: [PATCH wireless-next v4 20/21] wifi: mac80211: add mac80211
 support to handle NL80211_CMD_GET_SMD_CTX
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
Message-Id: <20261106-smd-v4-20-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: wFiIaCW8zA3IyHC70jnrcO3Xz6EOO8cX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX5hz9LBNRypzi
 WMs8J5yQoV2n0pFHL9zXSSgicLNM9WsqZ578xbMOVTh5j7i+ZNNUqyyyAlRLxkk869WLvhgtHsl
 pW1qDZjCDg0Sx7rBIf1FwhBeJ9YGXsVAu4ATLyp2R+R1ybDwAUQDdsQZs7dB7LGt6u9UGaOqE4D
 fpaBF7hE7jQyLLyX1OFeWuMjJrpH5rsH0TmS259DPRDb2TxCDHajCyffXxnevkfiBaCPF31e/Av
 AUps/bpPQKGaNB3cnuK0R++S8D+A9cEvzUlElvFwzXJIqVEH8Ht2ufghahCJ2eK+XPgXWGA2Soq
 boEuyu7Zn+h6E2wOM0q6KzD45b+xgHvrbPbikEa5RWgGzAVTPjwOD+y9rZUxs9pERa79gLQlukl
 utEwiWoIXhZIXQv2Om96EM66vY2AsWF9Iot8y7rRGpYoAYns04Zye7uNnlmVdL+akI6sP1Bzm0Q
 GH4+t/a3vVemr/SNevg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX4bSFcb+uxymz
 82VcIztBMabZezAyU94ro1ixS7OLLnvLizj8GppbKfTauW1OHYGqXFxtTWVFu652+RBV5U2YcQw
 ZiPBxSnxQGlhrGma9+hE2zKBfHSQR/k=
X-Proofpoint-ORIG-GUID: wFiIaCW8zA3IyHC70jnrcO3Xz6EOO8cX
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed890e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=x9_SPualhOxJPIen774A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

cfg80211 supports NL80211_CMD_GET_SMD_CTX from userspace on the current
AP MLD to collect the station's context on the target AP MLD's behalf;
this context is used by the target AP MLD to program its TX and RX
queues to support seamless roaming of the non-AP MLD.

Add mac80211 support for the same to invoke the driver to collect the
requested station context. Since context collection is asynchronous,
the driver reports the collected context later via
ieee80211_get_smd_ctx_done(), which then packs the context into
NL80211_CMD_SMD_CTX_EVENT and delivers it to userspace as a multicast
event.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/mac80211.h    | 19 +++++++++++++++++++
 net/mac80211/cfg.c        | 36 ++++++++++++++++++++++++++++++++++++
 net/mac80211/driver-ops.h | 24 ++++++++++++++++++++++++
 net/mac80211/sta_info.c   |  6 ++++++
 net/mac80211/trace.h      | 27 +++++++++++++++++++++++++++
 5 files changed, 112 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 15d9a069ba73..d78b7e897230 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4817,6 +4817,11 @@ enum ieee80211_sta_smd_state {
  *	The callback can sleep.
  * @set_smd_ctx: Set the UHR SMD context for the non-AP MLD. This is used on
  *	the target AP MLD side to program dynamic context.
+ * @get_smd_ctx: Get the UHR SMD context for the non-AP MLD. This is used in
+ *	the current AP MLD side on behalf of the target AP MLD to collect
+ *	dynamic context, when the non-AP MLD sends ST Execute frame directly
+ *	to the target. Since the response is asynchronous, the drivers that
+ *	implement this should not store reference to @sta.
  */
 struct ieee80211_ops {
 	void (*tx)(struct ieee80211_hw *hw,
@@ -5238,6 +5243,9 @@ struct ieee80211_ops {
 	int (*set_smd_ctx)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta,
 			   struct cfg80211_smd_transition_info *st_info);
+	int (*get_smd_ctx)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			   struct ieee80211_sta *sta,
+			   enum nl80211_smd_ctx_type type);
 };
 
 /**
@@ -8312,4 +8320,15 @@ bool ieee80211_vif_nan_started(struct ieee80211_vif *vif);
  * Return: 0 if success and non-zero on error
  */
 int ieee80211_encrypt_tx_skb(struct sk_buff *skb);
+
+/**
+ * ieee80211_get_smd_ctx_done - Deliver async get_smd_ctx result to nl80211
+ * @vif: virtual interface
+ * @sta_addr: non-AP MLD address the context was collected for
+ * @st_info: SMD BSS Transition Info (set @st_info->ctx to NULL to indicate
+ *	failure)
+ */
+void ieee80211_get_smd_ctx_done(struct ieee80211_vif *vif,
+				const u8 *sta_addr,
+				struct cfg80211_smd_transition_info *st_info);
 #endif /* MAC80211_H */
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 356c14eaa58c..26ebbc27dac0 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -6388,6 +6388,41 @@ static int ieee80211_set_smd_ctx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	return drv_set_smd_ctx(local, sdata, &sta->sta, st_info);
 }
 
+static int ieee80211_get_smd_ctx(struct wiphy *wiphy, struct wireless_dev *wdev,
+				 const u8 *addr,
+				 enum nl80211_smd_ctx_type type)
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
+	if (!sta)
+		return -ENOENT;
+	if (!sta->sta.smd_params.smd_sta)
+		return -EINVAL;
+
+	return drv_get_smd_ctx(local, sdata, &sta->sta, type);
+}
+
+void ieee80211_get_smd_ctx_done(struct ieee80211_vif *vif,
+				const u8 *sta_addr,
+				struct cfg80211_smd_transition_info *st_info)
+{
+	struct ieee80211_sub_if_data *sdata = vif_to_sdata(vif);
+
+	cfg80211_get_smd_ctx_done(&sdata->wdev, sta_addr, st_info);
+}
+EXPORT_SYMBOL(ieee80211_get_smd_ctx_done);
+
 const struct cfg80211_ops mac80211_config_ops = {
 	.add_virtual_intf = ieee80211_add_iface,
 	.del_virtual_intf = ieee80211_del_iface,
@@ -6512,4 +6547,5 @@ const struct cfg80211_ops mac80211_config_ops = {
 	.nan_set_peer_sched = ieee80211_set_peer_nan_sched,
 	.nan_set_non_evac_channels = ieee80211_set_nan_non_evac_channels,
 	.set_smd_ctx = ieee80211_set_smd_ctx,
+	.get_smd_ctx = ieee80211_get_smd_ctx,
 };
diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index 530936ffa11a..7d23ac03a899 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1835,4 +1835,28 @@ static inline int drv_set_smd_ctx(struct ieee80211_local *local,
 	return ret;
 }
 
+static inline int drv_get_smd_ctx(struct ieee80211_local *local,
+				  struct ieee80211_sub_if_data *sdata,
+				  struct ieee80211_sta *sta,
+				  enum nl80211_smd_ctx_type type)
+{
+	int ret;
+
+	if (!sdata || !local->ops->get_smd_ctx)
+		return -EOPNOTSUPP;
+
+	sdata = get_bss_sdata(sdata);
+
+	lockdep_assert_wiphy(local->hw.wiphy);
+
+	if (!check_sdata_in_driver(sdata))
+		return -EIO;
+
+	trace_drv_get_smd_ctx(local, sdata, sta, type);
+	ret = local->ops->get_smd_ctx(&local->hw, &sdata->vif, sta, type);
+	trace_drv_return_int(local, ret);
+
+	return ret;
+}
+
 #endif /* __MAC80211_DRIVER_OPS */
diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index d4d1008887c9..a3e161d160f0 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -1312,6 +1312,7 @@ static int __must_check __sta_info_destroy_part1(struct sta_info *sta)
 {
 	struct ieee80211_local *local;
 	struct ieee80211_sub_if_data *sdata;
+	struct wireless_dev *wdev;
 	int ret, i;
 
 	might_sleep();
@@ -1321,6 +1322,7 @@ static int __must_check __sta_info_destroy_part1(struct sta_info *sta)
 
 	local = sta->local;
 	sdata = sta->sdata;
+	wdev = &sdata->wdev;
 
 	lockdep_assert_wiphy(local->hw.wiphy);
 
@@ -1390,6 +1392,10 @@ static int __must_check __sta_info_destroy_part1(struct sta_info *sta)
 	    rcu_access_pointer(sdata->u.vlan.sta) == sta)
 		RCU_INIT_POINTER(sdata->u.vlan.sta, NULL);
 
+	if (sdata->vif.type == NL80211_IFTYPE_AP ||
+	    sdata->vif.type == NL80211_IFTYPE_AP_VLAN)
+		cfg80211_free_pending_smd_ctx_req(wdev, sta->addr);
+
 	return 0;
 }
 
diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index c156e28fa07b..cdfacbc6e891 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -3502,6 +3502,33 @@ TRACE_EVENT(drv_set_smd_ctx,
 	)
 );
 
+TRACE_EVENT(drv_get_smd_ctx,
+	TP_PROTO(struct ieee80211_local *local,
+		 struct ieee80211_sub_if_data *sdata,
+		 struct ieee80211_sta *sta,
+		 enum nl80211_smd_ctx_type type),
+
+	TP_ARGS(local, sdata, sta, type),
+
+	TP_STRUCT__entry(
+		LOCAL_ENTRY
+		VIF_ENTRY
+		STA_ENTRY
+		__field(u8, st_type)
+	),
+
+	TP_fast_assign(
+		LOCAL_ASSIGN;
+		VIF_ASSIGN;
+		STA_ASSIGN;
+		__entry->st_type = type;
+	),
+
+	TP_printk(LOCAL_PR_FMT VIF_PR_FMT STA_PR_FMT ", ST type=%u",
+		  LOCAL_PR_ARG, VIF_PR_ARG, STA_PR_ARG, __entry->st_type
+	)
+);
+
 #endif /* !__MAC80211_DRIVER_TRACE || TRACE_HEADER_MULTI_READ */
 
 #undef TRACE_INCLUDE_PATH

-- 
2.34.1

