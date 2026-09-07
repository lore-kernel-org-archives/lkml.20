Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997793B9D9F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813224; cv=none; b=gA73HLi75bUIUai/EVQdBIMnSoac5pxDz4NjRdkAl0WwymmoEqFUyYvTtytxHOkQ5xRpgGgQabdIiGNlbreH25jEvArkHvMExWt3mbqEuLKsa65LhTgwm/yurSShP9HXAvOWyDDaz11gTlTF1qmLjR6TRCVmXnvv4iGfMCeArVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813224; c=relaxed/simple;
	bh=XxXeGyH8LowR4EFnJMlxM2wbsxxbipviiWhjmsnKVcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKarBGBJrkNhlzsoyCITisnnZPmYHQBj/HUjZRgONQXa1D/R6Nx9WoJDwrK+7vf3Wxyac9bPhc9VH39CNknCVJOJY6SF5yT61qyU0yfcQGl5EbluhHyI5JXa6onK+VeKXFl5jyCPDKIn2JIszqG4WVXUml+grnrWG3J951nh1eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jx2LWUgq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yb13lr6J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jx2LWUgq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yb13lr6J"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H8LfP1050067
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4KjAE1JwpT6DGpnh/CZZfax3IJ/HuYkECxZMwDBCSw=; b=jx2LWUgqwXxwmLZC
	FB7Bk21kDrkW2c8kjyfcP+BAaAsVGyN68cYYqCoJFWZDrtujs9lzHMvps7NKFmuP
	aHTuSpWSPC2H2X5uDRinMgiiO2RDjqBrYS2v364ptdZ5bW++k1GKDKmQ9+REVmZ4
	RbFAKTfU+kRmilkZL1v0ckJWU7tlu4JZDKC/+c8GOyXZoqsEb1/OdIM5Qts9JQ/B
	ocU8j/TTFsG1NZErbEKTfedeEDcsSAOCaL9F+W3+80rvZqw54pghhty2c2e/nBkt
	TPi7ZrpXMu/GS/6SRPyh5zNDX5zZhPMgMBDoqLfnK6fqWlSTZDBggUWhGeC2zwPG
	gTZesg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqj9sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:33:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db4e331406so26717865ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788813220; x=1789418020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4KjAE1JwpT6DGpnh/CZZfax3IJ/HuYkECxZMwDBCSw=;
        b=Yb13lr6JeSZ7DmWi0pWUpUE5u6hC03RQAkYuRPiqUwIksSJ/VkXXnNcqGCCx/aO2yy
         thlvVuTocbJk9vj4PTyYy2HoYo6m0fdA8aoZT4osPMs/NX8G6OG29v9l04zWQNzdT/35
         i5ARSR0aMNFFPDsaVdTOe0UYrI1A0mLwCmP1agFJZRJE+32BVb5ZI0jq2Xyyx37l+PN9
         floZKIoXpLPBcvrVNGs6IDxLJFcWTdZAeiuxsPypwrRpK7ihZs9eX+Qj1F6cTwTvT/RO
         IfpUbwMgPWnwC5MuJYad2kcdfs7YTuhh/NqMxITMp2H5HfW+lCa1gnFuYrjIPsQo13gi
         664w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813220; x=1789418020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4KjAE1JwpT6DGpnh/CZZfax3IJ/HuYkECxZMwDBCSw=;
        b=UG2hoxC5E/jy7+6VZPLJs5soUyF59occvJMaiA2jm0il/u7jeuG7EOSCKWaCwQy0dx
         GUHPrFxWooJrHR4FbcznvcPYnpd7tKN/aWugKWlxp5rUP1hVr43D8XqotTlhpULUyBAB
         n/8EbidBnHT5erVSLhfNY5w5hBwCf7kk+ol1IQ+JaFhfFqaJEuUtkGlfuT8+QGlsA3xh
         OyerMs/EtGQXWRqNaD35Nkk0AHxEOJ86QWIap9+sqCUof1mp1MzjX+Hn/wI3nZNShF4O
         505xW45FyR4zWF2ooqaebnCujRBf6sBxLAXEVd/ckchazUkPMEg66a59tFkTQPZyH/aQ
         56cQ==
X-Gm-Message-State: AFuF++n8DbrYTJi56HtqoFZaCj7PCobzqbhZxkWl7+XxsloUL8pjFW0Z
	Kxdh8blKMckmdB94KY3vK7zCNqZ/UqbIZX23O/PJe8nwg2pokY9OLYJvukUY4QlOU+sE6csyv8N
	It50de/9i3Ty3N+5a9puHFEW/BAOa5rgfCJ1B+GyWrSeEqK5VTKL/JaS+ZgAqgtR5S5+uI/pjPw
	==
X-Gm-Gg: AYBFou3uOVYaeJeckzpkxqA2wsojZgGifpeUJ5wVuqd5qKat0taxwJqlFEkQ5hQOxDz
	V98TxtHoQO/nauG+2OBURSPltRybKHOO+fkuO5xETwBleHnBOwVTTGbpP2ZP1vy7JBASxE4ossE
	zXiJRtbz4rAFucFmg28jN6jzZRA7mkdZdq9cE+Kp1hR9Z/X2Zjwe+xccoix8r6siAVOEUxip7pJ
	igMlhGtLn8s9z7ZONUv5iMovajBZLI8b1lrs+GW/1tvNGf895QiU3PmU7G7Mnf9Iv40tVF9ZNxX
	1bB7qky7z5UFlDZBgvoF6Gq2oIis5yoxLqDUUiPHqNrLBMlrGBfgf9+IQRLzXTqYz10/xAe2Ecb
	6M/8WQumV+JUrIGCGuIDSe6sQX4b4/c609MEQ0XET87vOLJW6nErZdy6woCxJOS4YMNVfXz9L2Y
	HrJyqS+3puMYFszkvNTkUzsQ==
X-Received: by 2002:a17:902:ce82:b0:2d9:2ff6:2497 with SMTP id d9443c01a7336-2db12599b07mr340310315ad.13.1788813219951;
        Mon, 07 Sep 2026 13:33:39 -0700 (PDT)
X-Received: by 2002:a17:902:ce82:b0:2d9:2ff6:2497 with SMTP id d9443c01a7336-2db12599b07mr340309845ad.13.1788813219492;
        Mon, 07 Sep 2026 13:33:39 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm47841297eec.16.2026.09.07.13.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:33:38 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:59:16 +0530
Subject: [PATCH wireless-next 07/18] wifi: nl80211/mac80211: Add SMD BSS
 Transition sub-state STA flags
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-smd-v1-7-65ad4ab30fbd@oss.qualcomm.com>
References: <20260908-smd-v1-0-65ad4ab30fbd@oss.qualcomm.com>
In-Reply-To: <20260908-smd-v1-0-65ad4ab30fbd@oss.qualcomm.com>
To: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfXxW5Py3NTVF75
 gSFqS5L/6gIo6nZS+GjMkZd2UZqkFsx6Ou+b1bqXSqTgZgOXTg3o/x4LKZebz4JjLCDbMDdC4q7
 7E+fy7U9ZGi+bOVhlVBnbk73iUCRdTpsGE+GQ06i8m7+zwVhnltfpT8CSMz7ICYJYJONZC7hCEA
 QXzh8gC49h1KbLO7yWJAeOiB04EG3tRHMbRUQHsVjceh3o8W0toHrEKhEeHYBPNAyRF5U00teFH
 XkFtU7ilwH9tNLtfu9e93xmUrsu7xvkQ+fs+CXzZYNJW13HKbkUYFReyX5//eJ5NnSnG5arsilT
 S6E58xjZaNeBUH3QHC6AF13dM/vT3JE0/wmH1yrDUtqQuTr8b/hE4hDov05OwGNFvZDEfFad/uT
 X6c4V+2MfCL4q7casnIpCNk9Yh+fHS1pBUgWDAB93qpnPYKTYCzUGA3+0RgvUrvdADJdO/Nt1GZ
 R/iqUYwF/Gcu+pSVPyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfX4QhUFMRFlf55
 UJ4X4XuwZw/4eO+t8id3wKyg+0b2bZY0/+sZhgiRMqHmsRI9bdjs9VDx96yqQXth0vsyCaf2JKJ
 b46uhH8ORyhgbmtWUr5L7UjsfkMHeoo=
X-Proofpoint-ORIG-GUID: ttz-3ZYs24w2XJzEXl8mkhnhyKtQTeqN
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9f1fa5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=olGzuFvk815fMYXliRYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ttz-3ZYs24w2XJzEXl8mkhnhyKtQTeqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070226

IEEE P802.11bn/D2.0, Aug 2026, subclause 11.3.1, defines three new MLD
state sub-states (4a, 4b, 4c) that apply when a non-AP MLD and its
associated SMD-ME are in state 4 and an SMD BSS Transition is
in progress.

Add the corresponding nl80211 STA flags:
  NL80211_STA_FLAG_SMD_PREP_TARGET -- State 4a: target AP MLD prepared;
    Class 3 frames blocked except ST execution request/response.
  NL80211_STA_FLAG_SMD_EXEC_CURRENT -- State 4b: ST execution active on
    current AP MLD; UL Class 3 data blocked.
  NL80211_STA_FLAG_SMD_DL_DRAIN -- State 4c: DL draining period; only
    control frames and UHR Reconfiguration Notify permitted on current
    AP MLD.

Add three internal station flags to track the 802.11bn SMD BSS
Transition sub-states (4a/4b/4c) in mac80211:

  WLAN_STA_SMD_PREP_TARGET - State 4a
  WLAN_STA_SMD_EXEC_CURRENT - State 4b
  WLAN_STA_SMD_DL_DRAIN - State 4c

These are transient sub-states of WLAN_STA_AUTHORIZED with the SMD-ME.
The station remains authenticated, associated, and RSNA-established
throughout; only the frame-filtering rules change. At most one of the
three may be set at a time; mutual exclusion is enforced in
sta_apply_smd_state_flags().

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/uapi/linux/nl80211.h | 10 ++++++++
 net/mac80211/cfg.c           | 60 ++++++++++++++++++++++++++++++++++++++++++++
 net/mac80211/debugfs_sta.c   |  3 +++
 net/mac80211/sta_info.h      |  8 ++++++
 net/wireless/nl80211.c       | 18 ++++++++++---
 5 files changed, 95 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 5e474fda2a49..65c7eefe9db5 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -3965,6 +3965,13 @@ enum nl80211_iftype {
  *	previously added station into associated state
  * @NL80211_STA_FLAG_SPP_AMSDU: station supports SPP A-MSDUs
  * @NL80211_STA_FLAG_SMD: station has negotiated SMD.
+ * @NL80211_STA_FLAG_SMD_PREP_TARGET: station is prepared at SMD target AP MLD
+ *	(State 4a). Class 3 frames blocked except ST execution req/resp.
+ * @NL80211_STA_FLAG_SMD_EXEC_CURRENT: current AP MLD is executing SMD BSS
+ *	Transition (State 4b). Uplink Class 3 data blocked after exec-req Tx.
+ * @NL80211_STA_FLAG_SMD_DL_DRAIN: current AP MLD is in DL draining period
+ *	(State 4c). Both directions restricted; only control and UHR Reconf
+ *	Notify frames are permitted.
  * @NL80211_STA_FLAG_MAX: highest station flag number currently defined
  * @__NL80211_STA_FLAG_AFTER_LAST: internal use
  */
@@ -3979,6 +3986,9 @@ enum nl80211_sta_flags {
 	NL80211_STA_FLAG_ASSOCIATED,
 	NL80211_STA_FLAG_SPP_AMSDU,
 	NL80211_STA_FLAG_SMD,
+	NL80211_STA_FLAG_SMD_PREP_TARGET,
+	NL80211_STA_FLAG_SMD_EXEC_CURRENT,
+	NL80211_STA_FLAG_SMD_DL_DRAIN,
 
 	/* keep last */
 	__NL80211_STA_FLAG_AFTER_LAST,
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 138b67f4bda4..69b3ac0b48f3 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2452,6 +2452,55 @@ static int sta_link_apply_parameters(struct ieee80211_local *local,
 	return 0;
 }
 
+static int sta_apply_smd_state_flags(struct sta_info *sta,
+				     u32 mask, u32 set)
+{
+	bool smd_prep_target, smd_exec_current, smd_dl_drain;
+	u32 expected_mask = BIT(NL80211_STA_FLAG_SMD_PREP_TARGET) |
+			    BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT) |
+			    BIT(NL80211_STA_FLAG_SMD_DL_DRAIN);
+	u32 smd_flags;
+
+	if (!(mask & expected_mask))
+		return 0;
+
+	smd_flags = mask & expected_mask & set;
+	if (WARN_ON(hweight32(smd_flags) > 1))
+		return -EINVAL;
+
+	smd_prep_target =
+		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_PREP_TARGET));
+	smd_exec_current =
+		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT));
+	smd_dl_drain =
+		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_DL_DRAIN));
+
+	if (!test_sta_flag(sta, WLAN_STA_AUTHORIZED) &&
+	    (smd_exec_current || smd_dl_drain))
+		return -EINVAL;
+
+	if (smd_prep_target) {
+		clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
+		clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
+		set_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
+	} else if (smd_exec_current) {
+		clear_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
+		clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
+		set_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
+	} else if (smd_dl_drain) {
+		clear_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
+		clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
+		set_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
+	} else {
+		/* all flags revert back to none being set */
+		clear_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
+		clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
+		clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
+	}
+
+	return 0;
+}
+
 static int sta_apply_parameters(struct ieee80211_local *local,
 				struct sta_info *sta,
 				struct station_parameters *params)
@@ -2538,6 +2587,17 @@ static int sta_apply_parameters(struct ieee80211_local *local,
 	if (params->smd_params.smd_sta)
 		sta->sta.smd_params = params->smd_params;
 
+	/*
+	 * SMD BSS Transition sub-states (IEEE P802.11bn/D2.0, Aug 2026,
+	 * subclause 11.3.1).
+	 * Only meaningful for SMD-capable stations (WLAN_STA_SMD set).
+	 */
+	if (test_sta_flag(sta, WLAN_STA_SMD)) {
+		ret = sta_apply_smd_state_flags(sta, mask, set);
+		if (ret)
+			return ret;
+	}
+
 	/* mark TDLS channel switch support, if the AP allows it */
 	if (test_sta_flag(sta, WLAN_STA_TDLS_PEER) &&
 	    !sdata->deflink.u.mgd.tdls_chan_switch_prohibited &&
diff --git a/net/mac80211/debugfs_sta.c b/net/mac80211/debugfs_sta.c
index d7e7c9c578e4..24c985687bd2 100644
--- a/net/mac80211/debugfs_sta.c
+++ b/net/mac80211/debugfs_sta.c
@@ -79,6 +79,9 @@ static const char * const sta_flag_names[] = {
 	FLAG(USES_ENCRYPTION),
 	FLAG(DECAP_OFFLOAD),
 	FLAG(SMD),
+	FLAG(SMD_PREP_TARGET),
+	FLAG(SMD_EXEC_CURRENT),
+	FLAG(SMD_DL_DRAIN),
 #undef FLAG
 };
 
diff --git a/net/mac80211/sta_info.h b/net/mac80211/sta_info.h
index 506aeb241a6d..89137b18a862 100644
--- a/net/mac80211/sta_info.h
+++ b/net/mac80211/sta_info.h
@@ -73,6 +73,11 @@
  *	so drop all packets without a key later.
  * @WLAN_STA_DECAP_OFFLOAD: This station uses rx decap offload
  * @WLAN_STA_SMD: this station is associated to an SMD-ME.
+ * @WLAN_STA_SMD_PREP_TARGET: this SMD station is prepared at the target AP MLD.
+ * @WLAN_STA_SMD_EXEC_CURRENT: this SMD station has started execution at
+ *	the current AP MLD.
+ * @WLAN_STA_SMD_DL_DRAIN: this SMD station has started draining at
+ *	the current AP MLD.
  *
  * @NUM_WLAN_STA_FLAGS: number of defined flags
  */
@@ -106,6 +111,9 @@ enum ieee80211_sta_info_flags {
 	WLAN_STA_USES_ENCRYPTION,
 	WLAN_STA_DECAP_OFFLOAD,
 	WLAN_STA_SMD,
+	WLAN_STA_SMD_PREP_TARGET,
+	WLAN_STA_SMD_EXEC_CURRENT,
+	WLAN_STA_SMD_DL_DRAIN,
 
 	NUM_WLAN_STA_FLAGS,
 };
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 7577eb31ff65..282d3c82dce8 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -7707,6 +7707,9 @@ static const struct nla_policy sta_flags_policy[NL80211_STA_FLAG_MAX + 1] = {
 	[NL80211_STA_FLAG_AUTHENTICATED] = { .type = NLA_FLAG },
 	[NL80211_STA_FLAG_TDLS_PEER] = { .type = NLA_FLAG },
 	[NL80211_STA_FLAG_SMD] = { .type = NLA_FLAG },
+	[NL80211_STA_FLAG_SMD_PREP_TARGET] = { .type = NLA_FLAG },
+	[NL80211_STA_FLAG_SMD_EXEC_CURRENT] = { .type = NLA_FLAG },
+	[NL80211_STA_FLAG_SMD_DL_DRAIN] = { .type = NLA_FLAG },
 };
 
 static int parse_station_flags(struct genl_info *info,
@@ -7773,7 +7776,11 @@ static int parse_station_flags(struct genl_info *info,
 	switch (iftype) {
 	case NL80211_IFTYPE_AP:
 	case NL80211_IFTYPE_AP_VLAN:
-		params->sta_flags_mask = BIT(NL80211_STA_FLAG_SMD);
+		params->sta_flags_mask =
+			BIT(NL80211_STA_FLAG_SMD) |
+			BIT(NL80211_STA_FLAG_SMD_PREP_TARGET) |
+			BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT) |
+			BIT(NL80211_STA_FLAG_SMD_DL_DRAIN);
 		fallthrough;
 	case NL80211_IFTYPE_P2P_GO:
 		params->sta_flags_mask |= BIT(NL80211_STA_FLAG_AUTHORIZED) |
@@ -8920,7 +8927,7 @@ int cfg80211_check_station_change(struct wiphy *wiphy,
 		return -EINVAL;
 
 	/* When you run into this, adjust the code below for the new flag */
-	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 9);
+	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 12);
 
 	switch (statype) {
 	case CFG80211_STA_MESH_PEER_KERNEL:
@@ -9015,7 +9022,10 @@ int cfg80211_check_station_change(struct wiphy *wiphy,
 				  BIT(NL80211_STA_FLAG_WME) |
 				  BIT(NL80211_STA_FLAG_MFP) |
 				  BIT(NL80211_STA_FLAG_SPP_AMSDU) |
-				  BIT(NL80211_STA_FLAG_SMD)))
+				  BIT(NL80211_STA_FLAG_SMD) |
+				  BIT(NL80211_STA_FLAG_SMD_PREP_TARGET) |
+				  BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT) |
+				  BIT(NL80211_STA_FLAG_SMD_DL_DRAIN)))
 			return -EINVAL;
 
 		/* but authenticated/associated only if driver handles it */
@@ -9702,7 +9712,7 @@ static int nl80211_new_station(struct sk_buff *skb, struct genl_info *info)
 		return -EINVAL;
 
 	/* When you run into this, adjust the code below for the new flag */
-	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 9);
+	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 12);
 
 	switch (wdev->iftype) {
 	case NL80211_IFTYPE_AP:

-- 
2.34.1

