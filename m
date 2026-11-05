Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907666;
	b=5pG8FedsY+oazgKa5TO1rHLMmaWm3DlA+At5V/uu33eLZeVhpIsJDCh7BrCVhgRHt7MM
	 c2EvquJIOEV9EIGwtO1akvwOtT5LGObIscL5SBX5WK+FWhfwoPkpVE2JS5FC5DxmK3XtN
	 eUbhG2VRmzfsfFeeUL18IgieFHRGZh54mhgcbZpbbCN8CCGdx5ygCLnrMVuuoBZhRErLN
	 g1S12QaKKzc8PmzKMBeVR52XTmdMwqP3f8jrfAa2AsOtEHGwiR+nmQ1+p/mNpXBrNxNvP
	 byhIwNZgev5WloLjcqFHXDlaJnc8CAKaA7tlQW6OV12dSgGzSAh6Fc9OMiLWnwAFVWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gCtLvFIImSB8LqKP6MP6VDrJv6ieUFPxwzhvVnpKvdQ=;
	b=zAUJQpufS7di+nj08G/XJumGabQpL9S1bkFp3QwyZVINYVeiYcnU9/b0g6t0KwszGVKO
	 DiR7OQrsHz08IaYnif6DJx8wiD0tgButaY1PNGr1L6DJwYQWt1VCP857fB/5qECOxAXXB
	 1Cz4ph3OYbW4TNAGkhNcZzCpCa+AmCo8n+o9AR5fRODtBgNMP/r4ABArDRpiI2X9BAvEn
	 eqpR+nyI7Wt6jd6JzGcmYQr4iXGzxQvqS+g6SY+fWPAEgNH85dZhuNR1YJQudzRiePvn2
	 VuRuygZvjHd2hL61ZqS2uIumnkaKFZGiJyS/XnPIeDCsxsltsOeTzPosdllLgN3m/ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="WyiKwPJ/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A5kdAF/+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699BC60772BB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 699BC60772BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WyiKwPJ/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A5kdAF/+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeAbi2513415
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gCtLvFIImSB8LqKP6MP6VDrJv6ieUFPxwzhvVnpKvdQ=; b=WyiKwPJ/D3JMwMhn
	v9AU1UW1E3GuHNb3Pz2IWXoLZlYfjgWIWX3BnC997fpUM3wGVjf/6MDLKanK9vuT
	fkwYtyBqt+ErQDkO4J4jD74Os8iaamuqJ3LipCzZHnypjDVzRew/X4ydmjrkiASQ
	MztnrdK4Y0pkYboNN7QIIb96zBMehNn6+aXZCu249aWc9IJPQDksxO/lvnZ8+8vV
	A5cFDdUCVNTQRwQPT9pUuExMdMbIScov0bH+9hNhn/r2gV8LWTlFnRckHhLFoRYH
	mD4Rg90dBnDaD82egXmSp39FrXTEKBLTLJWT/XMCrx/o5rCUK63QIovYmQmFwmke
	+nsLrA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraatbym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:41:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so4247990eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907665; x=1794512465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCtLvFIImSB8LqKP6MP6VDrJv6ieUFPxwzhvVnpKvdQ=;
        b=A5kdAF/+vRy2EELe9OR7UzqQvN0joTg9b4q/kkpW97PZ/gTHjMuG1mag96xB71ilnZ
         TPsa25vkxlTTb1rxUiRIa6Z9GqArM1SPoHjZbAOSF8UebVIPGekelnjq6cmmGU7XJ9tm
         hSYd2eLwvPk+HGP67x/U5x8tj9FiqwMEnqbz9svcnNwfM6pxpfivjYJIMUYgVBgC9G7/
         tl2YiO1TtBBUzJtWhthTnx3DTaV76g+OzL0WKT5jknfLAW1vXRoQcl6Ve0M8+1x185pO
         9iPLoUkrfWfqefJwN93DPl9f62ssqX/5F9mpCPYl3WlxPFA1YYNIHtKcN521SRrUOyJC
         ycmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907665; x=1794512465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCtLvFIImSB8LqKP6MP6VDrJv6ieUFPxwzhvVnpKvdQ=;
        b=Uc3nwRDik5gCwm086cNSyjah2SjKAdY6CUl+dAmAWHVGXztI1FNGBZyNANKiin/v9Q
         AKKtQUs+fmlkXY8uQ2dNMaHjaK3jiaqx26DeE7KLiNXXd+waWUNxR2HNr9morouQe68w
         MeWUnd8lF3KUZaLhUN1WL0BvtwQFWxfPcmYfu6wuTDZ8MSwgiTycbDAbc4Cx/bL8KDZz
         nI6r1YQ1xGQ+s3lJFYmDRdyc7coVL8zC3EnEl5LKcq1pC4nQgxgtXWhsQjNTQx4CAKta
         ObEfGubbtmWPf6mlrNdjYp/sp0JuY+GFlHoD2PUvovClIxTwStXjW2zLaNtl0g7evESR
         By1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNXGzIoqncQdwZzHL2D7/9Ap0mAIqAgbUHW1Q3jl0knoE6/n2rJKV1i7GfbZwcJe7HUvOuWIoexQkW3+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RROIiok/onkAlRhS/jzEUaWqVZnrZKQG5oYZt+Pe0uyTnjQgy
	melBl5GAmb5UrR9WEwWszyPOErh030mBsYC6chQlLiPnA++gJpQROcZydSn9+cMFS9p23p1v1HR
	A9SDeRnq0O7wKG93c7v7lGYoKcZuHofWrAftDNtwPaX+rg5vNjCdDjuMYuNIC7eld7w==
X-Gm-Gg: AYBFou0GTEHtSvpasC6wfo/XQZ7lA9KxEqOw+3MMIQwjBApHNLpZHfNqWfJoFBE4kAW
	US0K5vxDvJeFS7N9MbQXJqUQcGraQXGB94ex/BavPR3BHabsEVCYYCj3SoFQt3zMVdRuU0F/Js8
	ePfFXJTDLbunmN2NLjMvfkynFvCjvV7XD5zYzYP3RObL2I7V0/fYuPTxfnVheiantl6G+vCPpj4
	iofT43maYZOhNcQhRcx3QRRTu+rBqV6tm1B7ef7ZA0zmjto6tVy5JLgGPEoABlPFDRNYJTAMtRL
	PrlUhmb1P22uycqOYaUKAVLqCsqKSKd133dVHHSRooBkIXkH5kYEoAHnbOaX1Pq1enDzrUEMkhC
	sI8RiKx1X0dV12b9tpVliTbSaW7T9s2gOC+b4hxq3ITNiheDlEtxbgZNwJLjB5P12IxPOXWnlIN
	1CC5wW4ExzuYbMM7Rwg7pdaeGPO+qOgEPoO0abA+MU4HmexNUm3HwYH7AbBcLnT4cbjTFfiA==
X-Received: by 2002:a05:693c:8097:b0:36d:c2a:7964 with SMTP id 5a478bee46e88-36f76117e63mr174817eec.21.1793907664512;
        Thu, 05 Nov 2026 11:41:04 -0800 (PST)
X-Received: by 2002:a05:693c:8097:b0:36d:c2a:7964 with SMTP id 5a478bee46e88-36f76117e63mr174780eec.21.1793907663867;
        Thu, 05 Nov 2026 11:41:03 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:41:03 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:54 +0530
Subject: [PATCH wireless-next v3 19/21] wifi: mac80211: add mac80211
 support to handle NL80211_CMD_SET_SMD_CTX
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
Message-Id: <20261106-smd-v3-19-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX74UI4JXP3Kfh
 +Or9mVD0gHCf7U20Nt7x9pTT/pgZVmGd7/1FVvEE+7fyWK4xcXuPRQyCmCtGDTjeOInnocmuHrk
 m5WvJjrYRixLYNH+mMuWmcyZKnJHspU=
X-Proofpoint-ORIG-GUID: eT8bbL1R7HK00WnJZ8F3WMqF2fyooy-o
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aecdbd1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zHDNONmbSdC_GOYWSZkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX03aPfG3/Gi0U
 dx13u0xzYUVXKsdP1XYqvdCJvDzG+ksZxYGz8Yj/H3WHcFV/yfXIX6uSTKvjI76jHzDnGx2oJsT
 5VGsxYLwVCZSDd6dr2qrzFJjuPw87BABUYxJ81diMur0P2kOLdK5XsgxuaccbXMSBjyVCWMJWHV
 JDVLc8G3FggTzcNiHRFTC5ku4DbC8XuKxjIc/ab7pOZAg4nelHfQBwj70wgV1/H4qkqpJU6AM7h
 jbxpITew3FVuXvNSHHi/oFett7wrCHSOMV+Cpdh/K+rBs4CgX/sJyCn96ah9JK5XsGeBdFZ7WcL
 FMOSY12VKf87m6U772kPnKWuze6m16hyUT6l0gHjjWCuzfbfE2d+f7XaKqpnQ4o9l689Ptvs9qq
 jrSEEu5mGnHBQlg1DzHMDzJaaTb/ZSy4MUpKNfgrG3RQDFwLha99ufV7NHs7bCW9f87yd0dGFUJ
 0z99+hngohbKQvP0VBg==
X-Proofpoint-GUID: eT8bbL1R7HK00WnJZ8F3WMqF2fyooy-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078

cfg80211 supports NL80211_CMD_SET_SMD_CTX on the target AP MLD for
userspace to program the station's dynamic context on the TX and RX
queues.

Add mac80211 support to handle this command in driver and lower layers
so that the context is installed and the target AP MLD is ready to
continue data transfer with the non-AP MLD from where it may have left
off at the current AP MLD. This facilitates the seamless roaming benefit
of the SMD BSS Transition procedure.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/mac80211.h    |  5 +++++
 net/mac80211/cfg.c        | 30 ++++++++++++++++++++++++++++++
 net/mac80211/driver-ops.h | 24 ++++++++++++++++++++++++
 net/mac80211/trace.h      | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 2539b5ffd78b..15d9a069ba73 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4815,6 +4815,8 @@ enum ieee80211_sta_smd_state {
  * @sta_smd_state: Notifies low level driver about IEEE 802.11bn SMD substate
  *	transition of a station. It must not fail while transitioning down.
  *	The callback can sleep.
+ * @set_smd_ctx: Set the UHR SMD context for the non-AP MLD. This is used on
+ *	the target AP MLD side to program dynamic context.
  */
 struct ieee80211_ops {
 	void (*tx)(struct ieee80211_hw *hw,
@@ -5233,6 +5235,9 @@ struct ieee80211_ops {
 			     struct ieee80211_sta *sta,
 			     enum ieee80211_sta_smd_state old_state,
 			     enum ieee80211_sta_smd_state new_state);
+	int (*set_smd_ctx)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			   struct ieee80211_sta *sta,
+			   struct cfg80211_smd_transition_info *st_info);
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index af9fe323c11b..356c14eaa58c 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -6359,6 +6359,35 @@ ieee80211_set_nan_non_evac_channels(struct wiphy *wiphy,
 	return ieee80211_nan_set_non_evac_channels(sdata, channels);
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
+	if (!sta)
+		return -ENOENT;
+	if (!sta->sta.smd_params.smd_sta ||
+	    sta->smd_state != IEEE80211_STA_SMD_PREP)
+		return -EINVAL;
+
+	if (!wiphy_dereference(wiphy, sta->ptk[sta->ptk_idx]))
+		return -EINVAL;
+
+	return drv_set_smd_ctx(local, sdata, &sta->sta, st_info);
+}
+
 const struct cfg80211_ops mac80211_config_ops = {
 	.add_virtual_intf = ieee80211_add_iface,
 	.del_virtual_intf = ieee80211_del_iface,
@@ -6482,4 +6511,5 @@ const struct cfg80211_ops mac80211_config_ops = {
 	.nan_set_local_sched = ieee80211_set_local_nan_sched,
 	.nan_set_peer_sched = ieee80211_set_peer_nan_sched,
 	.nan_set_non_evac_channels = ieee80211_set_nan_non_evac_channels,
+	.set_smd_ctx = ieee80211_set_smd_ctx,
 };
diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index 0cdd1f1c5315..530936ffa11a 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1811,4 +1811,28 @@ int drv_sta_smd_state(struct ieee80211_local *local,
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
index 1a45ed66242c..c156e28fa07b 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -3466,6 +3466,42 @@ TRACE_EVENT(drv_sta_smd_state,
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
+		__field(u8, dl_tid_bitmap)
+		__field(u8, ul_tid_bitmap)
+	),
+
+	TP_fast_assign(
+		struct ieee80211_smd_ctx *ctx = st_info->ctx;
+
+		LOCAL_ASSIGN;
+		VIF_ASSIGN;
+		STA_ASSIGN;
+		__entry->st_type = st_info->type;
+		__entry->dl_tid_bitmap = ctx->dl.valid_tid_bmap;
+		__entry->ul_tid_bitmap = ctx->ul.valid_tid_bmap;
+	),
+
+	TP_printk(LOCAL_PR_FMT VIF_PR_FMT STA_PR_FMT
+		  ", ST type=%u DL TIDs: 0x%x, UL TIDs: 0x%x",
+		  LOCAL_PR_ARG, VIF_PR_ARG, STA_PR_ARG,
+		  __entry->st_type,
+		  __entry->dl_tid_bitmap, __entry->ul_tid_bitmap
+	)
+);
+
 #endif /* !__MAC80211_DRIVER_TRACE || TRACE_HEADER_MULTI_READ */
 
 #undef TRACE_INCLUDE_PATH

-- 
2.34.1

