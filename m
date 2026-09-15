Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5263643F8AE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789451486; cv=none; b=BUO2IHS7iLmMGh2KlJ+EIqJvSKR1GOS3fIYR1NWTR+IYcJbySrgHgPXWQhY5/tH01Rhfp1ieLYVQ2PtdjTgGaxdu/1LOL7dHLRkIDFUEyDJrSgxbVECLIT3iHOKhF/5vZH3F0wHKbOsyLV8E3UPqZK87mUbh4kviNfjPU2cNE/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789451486; c=relaxed/simple;
	bh=ft2IMJOrTksSAWxkADDlao+zkDUCB73x+Dnzu6+UJyE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=psfXtGLqerRaCg2iXj+zOhtNnNs1vjzcCM0jShTEOa8wSVnSZJCbIS9XAV55Pq5E+mGql1SojDR7bTmlmGyOLdrMuPTHj7WUx5wW/NP1DS8LqdSkNa3JkDgPUaBsBO7vTUt0V9f6Zmktp8Oqm/f6+9P0DXwtTZI4jppZlfJpgZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKMOWUmp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxdHkqpC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKMOWUmp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxdHkqpC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nX4G2298498
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MfvZRT+O1Exq/eskO7t45EfR6j91xK+ywi6
	Da9qaxcg=; b=PKMOWUmpqa62H4ib+sh6DQDZCgbjaQBF+a0D9VZhyRKTKqh0r9I
	y7xpAJqoPlceH86r2701uHMvJ8aRAvMsVyel65EJvaNRih4Fn4VJUFE0KXkcyoSp
	N+EeCa2QmfegmO6WF2sHqsn1dGv1b1+/K47ikKAhd8aDbEvWqjkPuCYqAoM95p4f
	xIN1ymcbm2fFrCrl8kGe81r1a2EZmx5NblZRvkoZES89J6D9bQGZRJWHQBAuJcEk
	BOFd8zLCP5n6Meb2p+IcZa5E8YolmoZW3vmselQT+b5Z9+n0WuR35CAbGJmY1uk1
	sR6Lz3O2v0cyM3cPHj43eSG79OZV9qmXs6w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtkqry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:51:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso3939341a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789451482; x=1790056282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfvZRT+O1Exq/eskO7t45EfR6j91xK+ywi6Da9qaxcg=;
        b=gxdHkqpCHLPt+gN6lOSTgvXfJUr+iG3kA/K6RtynNXDxSbr0UcZZ5Jcxnvs3/PD072
         fgbm4bvMJq53zCoX8skV09MZKgknffbrljEq24fTOQw9ILys1eYj+G6th+I1EN9J+BNj
         F5Klh4S1L4ZChjMNo/Y4sAz1ZDSHIusaDwuDR0Yqg5T+xk9EbuipptwaC9Y8x45JNaCf
         f9I+pAcDZW5KpnAm6Dh21uDhSH4XbtRwUmmTY5/Rf1IMNE8GiChiteKjaP1SblaabSBH
         UfPmMVk6+AyAKbRiSndsWe2vOSnvVATamvsGwooUVk0yYufPesmmigjjTwAS/LZldgDP
         K93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789451482; x=1790056282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfvZRT+O1Exq/eskO7t45EfR6j91xK+ywi6Da9qaxcg=;
        b=FrNM2LUwnn+Fx2d/q8Ire+7v6Zvk5KCUSDmq+LdmH5pNkMAQBX1f+FYsIwGQJMjah2
         4SbqMdsHBB+TUjxReMjjcljY43Nh+CNIdhiBPa7cqArYRqM+Zj5DHfFyhly+lpBfFJSV
         oJjmg4JvKNpzHs6YhqEtIsfVfFbZFhF+czpG1S6lG0nKnKoOUgT6lN3jNYkjrpXpTldb
         7t5tmJJ11mG0wnBzKZnHcMs/WpEa+8LV549kfDuwQEVaVLzZ11En0JxrS3MtshmFdXix
         EvUp4lqKg6h9Sdvfwe5GIj8s/qeHhQvQoQLqGBq1dS1DV/1UNOui4jHhAzA4bX08gDGp
         iw5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxgq4X1h8BeduFht6zHa76NdzlesiNF3BXmPSDrn1P/PybK5K4MzXIKFYndBNMTX2GZ1qcPsBbwRRa/weA=@vger.kernel.org
X-Gm-Message-State: AFuF++mV4rheuvyXhVE1bPl+S86yuh0g/pZsylZvp1CbIr+MB1pDeLCE
	yiBeXQnGA7uys2lDPDWoZ6ZRTDpl6GOAkdiWIBywVikMElyDXJKTmx8pbAiTbYMXn4e0t8T1i5t
	G4SXNtj/eEz2S1yw1sGsSrdRbHih2pPzvpJ3gPk8SEGESp6IJL55tLnxdEqEN8b0v1SU=
X-Gm-Gg: AYBFou0R8VsZwre0cf14jzQttkm+LfBcVFCEK16GeHiouHPxzIQhiPLd2qeF5DvXoeS
	x3RJsrpUBpBj8WPP9N68t/tRmp0AK6+rkbV1W81Ss4toknIJroS8Z0l5PNJ+iraGi7g/Jd1ATc0
	piPnJZR+Hf/nhh/62OXseSQ+v+ymT49cGZGLPq+XBJMlGJ4P69YK2imo2MF8GJkps0f3TSegJrV
	IJ0RWg/tNdP1RKW043PzrTHjcMmRTVWu+fIi9VORhxtm/zpNtotJfxlNm9ayu1KrYBYIBjXg7ui
	CZo/2wEQugtn0RPDc2cBhjmvwvHi66kw3VnWtIbU/H4TrL/bbdF0Jtp8DKuUdwEV6qzsHfyFDkO
	6S6R/P08XkGc1u4l1cx/G0V1DZ1mO0U8iEfeNkmZplUnX++RM
X-Received: by 2002:a05:6a00:1786:b0:857:73e2:9105 with SMTP id d2e1a72fcca58-86f854fb572mr11572367b3a.21.1789451482139;
        Mon, 14 Sep 2026 22:51:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:1786:b0:857:73e2:9105 with SMTP id d2e1a72fcca58-86f854fb572mr11572329b3a.21.1789451481620;
        Mon, 14 Sep 2026 22:51:21 -0700 (PDT)
Received: from hangtian-z2-2004.lan (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb760sm5550274b3a.46.2026.09.14.22.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:51:21 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: set STA EHT MU mode before peer assoc
Date: Tue, 15 Sep 2026 13:51:17 +0800
Message-Id: <20260915055117.546723-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa8dcdb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wW4-qZ-r-tBbmGnQcaQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA4MSBTYWx0ZWRfX+DYC/67tD0JX
 EBnJjqdSqh2P2e7jXCZ1BWyxLR13RKHEFqsEpVB27h7qlqnGUdfWE17ctFNMr4Pw+MNXG65tqAM
 nlZcrv1MObEYStM5vTKSfj5kIlMzrp8s3RezB79crpMLI8zStaiWWawescJKDoQ8e/gRaGHAfeW
 jwQyfwtPW9tGtIuG7JogWHB1wu3eOROwiesg+euQLhYhe2WYfu+rCXSLZUa+oz/1S8COOhh3UHX
 0i698eA+GzZ22peDi3jVN/tBs5S7p4nHESpVCcXP6GSZtiJlPFxuSBVlBUtlH24ex6w622BQkQQ
 j84N6WdfMk4UdP3YsFZrqfVF7tXeKdI/JHvIq6DLlrg8UoKDFxQSYZsQmXs9j9JL7psJ2/jVIBO
 kqrjSEVd9nwI3Fx7fqDbpY2BpDmq0Yo4jv0zmqtw8T9t7bfQKl0sxdJy12GCrIyMY39LOy1syTZ
 hBWwcZCzVLdgT6s3lhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA4MSBTYWx0ZWRfX7BTeilnNmlJU
 o9R1w6lm3/Cle2Q2zxjI3hSuE65/0Hb59xuH40Z4wjlTQp19EkU613dd+AEa3njxRceFzSeMMnQ
 jCb+llC569j0CvkI0QqDAQHldjCG71c=
X-Proofpoint-ORIG-GUID: yUCWurx7T8sxRmIXOFsdrZ79GcS0wpf3
X-Proofpoint-GUID: yUCWurx7T8sxRmIXOFsdrZ79GcS0wpf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150081

Currently, ath12k_bss_assoc() sets HE MU mode with
WMI_VDEV_PARAM_SET_HEMU_MODE before ath12k_wmi_send_peer_assoc_cmd(),
but has no equivalent step for EHT.
This means firmware can process peer assoc without EHT
beamformee/OFDMA mode state matching the current peer and bandwidth,
which can leave incorrect beamforming/OFDMA state for 11be links.

Fix this by adding ath12k_mac_vif_recalc_sta_eht_txbf() to compute the
EHT MU mode bitmask from local and peer EHT capabilities and link
bandwidth, and sending WMI_VDEV_PARAM_SET_EHT_MU_MODE before peer assoc,
mirroring the existing HE flow.
Also send WMI_VDEV_PARAM_SET_EHT_MU_MODE with zero for non-EHT
associations to clear stale EHT mode left from a previous association
on the same vdev.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 91 +++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d4116ba0da08..bc463f759d6e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3780,6 +3780,79 @@ static int ath12k_mac_vif_recalc_sta_he_txbf(struct ath12k *ar,
 	return 0;
 }
 
+static int ath12k_mac_vif_recalc_sta_eht_txbf(struct ath12k *ar,
+					      struct ath12k_link_vif *arvif,
+					      struct ieee80211_link_sta *link_sta,
+					      u32 *ehtmode)
+{
+	const struct ieee80211_sta_eht_cap *peer_eht_cap;
+	const struct ieee80211_sta_eht_cap *own_eht_cap;
+	const struct ieee80211_sband_iftype_data *iftd;
+	struct ieee80211_vif *vif = arvif->ahvif->vif;
+	struct ieee80211_bss_conf *link_conf;
+	struct cfg80211_chan_def def;
+	enum nl80211_band band;
+	u8 mu_bformer;
+
+	*ehtmode = 0;
+
+	if (vif->type != NL80211_IFTYPE_STATION)
+		return -EINVAL;
+
+	link_conf = ath12k_mac_get_link_bss_conf(arvif);
+	if (!link_conf) {
+		ath12k_warn(ar->ab, "unable to access bss link conf in recalc eht txbf conf\n");
+		return -EINVAL;
+	}
+
+	if (!link_conf->eht_support || !link_sta->eht_cap.has_eht)
+		return 0;
+
+	if (WARN_ON(ath12k_mac_vif_link_chan(vif, arvif->link_id, &def)))
+		return -EINVAL;
+
+	band = def.chan->band;
+	iftd = ieee80211_get_sband_iftype_data(&ar->mac.sbands[band], vif->type);
+	if (!iftd) {
+		ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+			   "unable to access iftype data in recalc eht txbf conf\n");
+		return 0;
+	}
+
+	own_eht_cap = &iftd->eht_cap;
+	peer_eht_cap = &link_sta->eht_cap;
+
+	if (!own_eht_cap->has_eht)
+		return 0;
+
+	*ehtmode |= u32_encode_bits(EHT_DL_MUOFDMA_ENABLE, EHT_MODE_DL_OFDMA) |
+		    u32_encode_bits(EHT_UL_MUOFDMA_ENABLE, EHT_MODE_UL_OFDMA);
+
+	if ((own_eht_cap->eht_cap_elem.phy_cap_info[0] &
+	     IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMEE) &&
+	    (peer_eht_cap->eht_cap_elem.phy_cap_info[0] &
+	     IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMER))
+		*ehtmode |= u32_encode_bits(EHT_SU_BFEE_ENABLE, EHT_MODE_SU_TX_BFEE);
+
+	switch (link_sta->bandwidth) {
+	case IEEE80211_STA_RX_BW_320:
+		mu_bformer = IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;
+		break;
+	case IEEE80211_STA_RX_BW_160:
+		mu_bformer = IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_160MHZ;
+		break;
+	default:
+		mu_bformer = IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_80MHZ;
+		break;
+	}
+
+	if (u32_get_bits(*ehtmode, EHT_MODE_SU_TX_BFEE) &&
+	    (peer_eht_cap->eht_cap_elem.phy_cap_info[7] & mu_bformer))
+		*ehtmode |= u32_encode_bits(EHT_MU_BFEE_ENABLE, EHT_MODE_MU_TX_BFEE);
+
+	return 0;
+}
+
 static int ath12k_mac_set_eht_txbf_conf(struct ath12k_link_vif *arvif)
 {
 	struct ath12k_vif *ahvif = arvif->ahvif;
@@ -3923,6 +3996,7 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 	struct ath12k_sta *ahsta;
 	struct ath12k_dp_link_peer *peer;
 	bool is_auth = false;
+	u32 ehtmode = 0;
 	u32 hemode = 0;
 	int ret;
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ar->ab);
@@ -3977,6 +4051,14 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 		return;
 	}
 
+	ret = ath12k_mac_vif_recalc_sta_eht_txbf(ar, arvif, link_sta, &ehtmode);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to recalc eht txbf for vdev %i on bss %pM: %d\n",
+			    arvif->vdev_id, bss_conf->bssid, ret);
+		rcu_read_unlock();
+		return;
+	}
+
 	rcu_read_unlock();
 
 	/* keep this before ath12k_wmi_send_peer_assoc_cmd() */
@@ -3988,6 +4070,15 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 		return;
 	}
 
+	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+					    WMI_VDEV_PARAM_SET_EHT_MU_MODE,
+					    ehtmode);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to submit vdev param eht txbf 0x%x: %d\n",
+			    ehtmode, ret);
+		return;
+	}
+
 	peer_arg->is_assoc = true;
 
 	ret = ath12k_mac_peer_assoc(ar, peer_arg);

base-commit: c3bace8584ca707e34ba837f65c2e9d566af4c2c
-- 
2.25.1

