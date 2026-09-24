Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B603B6C13
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217720; cv=none; b=lDRrd7vvqJ1vLgEkxiVEcneolf/s6ywd8mqd/+4mwVqTwWpicO62kzPjBcUO6RidsM5Hmsm1oUN9M3reKehFpe4dOlZUkgIQpXJCfuSgdtBQfJxz3M3CupevV0LZoPFhZVnpLz5AkeR68kHv80vlYGro9DgRFU53jr5++zgnEIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217720; c=relaxed/simple;
	bh=B09U8gOZesMCEBzvTLZSwdhDuHEUPOCrldRVojuw5F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cznf7nsx7lErRXKl9yoNEeufexs07RhWf0MJlVHJWyJG7gZb1/I1kYYd7T9DotUev794gLHwfOTk/Z8r2rqC3GFzP7ZiWsIqhwjU2odIuVfPdNBgJIJYmuh2VedILPe9Aq7ru6gD6+EtTClMT0tFxU/Nb+HIKU+I+0lM3iVE9N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3VCF13B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1YbnH+7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3VCF13B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1YbnH+7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O2KLHW1317311
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqQFvCpqMmcYteEOAfp8FU0jNTDNQtjxvly1IY7Ldd8=; b=j3VCF13B4AMlpOdO
	QlHePRwQfsGPQZCLSmlN6/FTNtn2RuB7SHjhiqGO56aSqlv8i/3j52vDD2H3JPbh
	YgBX9vPEnFTXgUNYbaP/azE0bl5HgHRBlX/gHipCkbez2ww6+NRqkHHBeDRq1yBC
	OoJFmkftmEEs4T25dnwGI6JHXSd3LwXU5jexujZCGqXLH1gJTxb73EdKHicySgmZ
	z4UTby656ecl73b0/RtO6FiBmunAUB2TVlLrQxkvc3GxnJkTBJYZ25P4n1HK5vY0
	GB6yoPjd9pLd0mQpwLtLDvG9UzLubnyZOBFVKy7LnTPqTdiVteb+DNYydjeP8vIk
	lQHB9w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbjwfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so2909213eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790217714; x=1790822514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqQFvCpqMmcYteEOAfp8FU0jNTDNQtjxvly1IY7Ldd8=;
        b=B1YbnH+73zcBDLFnjK5lkh1zDoD9ARXPQEIQEE4ehs43T6QqY57p6My1Fmc89S67c9
         n5C8/gyVK6gBVtKb98l1aX2oyYEICvMShQtOeROCjiTz7MCGBxBcuOgbid4i+b1rHWGo
         XOId4v8zFA6iD3KCsOzVj12Fg5PONPsFrcBcSCngS0rhXLFfdYbyoU0BlTCJgUE8/YPA
         3ntR8F5ulF6bSMJdKwSso10gwrgOkRIAH86hKNRcRAWYKKeyqwoDXArgMMwfICl1sGKq
         4RwfszEn7oqT8cintxmXEmvrQ39MS9l3RaoQlpRT55yX/+Ok8mAL2IzUiBI1rdHelalm
         C8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790217714; x=1790822514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqQFvCpqMmcYteEOAfp8FU0jNTDNQtjxvly1IY7Ldd8=;
        b=1eT//VoXX1E0vQDB6PMyRY6Ya/rhNkUbaM3j7UmudQOo5W1WdAex4sKyefVzXGeQFf
         cPlpXPrvZsDE7NobGitCHvY7b3yLeuo5cW/B2eHdAKJd0l2BvAq2YTF5XU38WOlE+RW0
         htlKD8RMvKJbg62wynJQWJzUlgevAVc6FXhTf4f4o7i4zlSZLT7pddjtBRYxMc06zhd1
         JLwI28AzHUomN5sdTg6nfm2hS78pR2LLdJzermfpxha9WMljboubF4Gx/mYl+iPxhVtb
         x2DkAFBdoH4fsl2PkOPG4LgXJAQPqKOvufH363EhhYgh7tAKZhjhppATS+NrXLiE4qh8
         B6Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxlGAaFCMzQjpSsZBmpGpZ69nUPlwzb76NpspFhlLEeaBSioOj4Fkawne4TeCqRXxQvPxJJHehaOXj8Fj4=@vger.kernel.org
X-Gm-Message-State: AFuF++lCyV3Kdw4w8zVZ1lnnal8Msd9zes9K62QrIR+Tax5SKi1vktjk
	z3QAyzPgDt5ZzXRTE+ibIgvyMCoQhP9AsSd8d3cANIPmbMlo5FEc5nZQRgwa3t2mRmSOUfKuw6e
	3qo4xODKAD/T7W1Wx40vqUCEAmiOWa0nKhylhSnobA4n/MUczT6lJZcRPajuE1No5qA==
X-Gm-Gg: AYBFou3StrFTXzstbsmDYxRyT4s5ux5nTTPOhncT7MrG95BLs4bYNJGKfYJ2MNj4jxc
	NP2o+mc4AiYtIUJycO7wqQuyqHqx2fs4YsKbu+5pg7PqTRCqEIXeaVvmgbqd8HTHjArkn7YPIdI
	DMGbUGPKwJ3SBUnCgI4q6Mfi7wWK0XhwtKpWhBESF0nFqfVaGEDiS294cXxtlZPvPgG+SLkYh39
	cI78jZFAcIvJHndtcETIlmM40Rw885jSsUkQcUM44XrSKOrzTV+N1C5KhleezXcGyszl5SDh+IJ
	MxmHKoJ2biNHOmr9rbt1UMNEZDpiRdIOJCrVmozg1edhbTGQwPumkq4RJ5S5NlVwIUYsi7oAVJ+
	GpTQ7Cdi3U7A/iI5hsRPVBccFiD0GReJ+tJJq7lYfbqL5/9NATOqp22wEsP80jBcTK+aafMhfpp
	JnKbsI1dduoZsuZdsKYXsu9Q==
X-Received: by 2002:a05:7301:4282:b0:33c:e72:5b3c with SMTP id 5a478bee46e88-3400044a1c3mr757566eec.26.1790217713767;
        Wed, 23 Sep 2026 19:41:53 -0700 (PDT)
X-Received: by 2002:a05:7301:4282:b0:33c:e72:5b3c with SMTP id 5a478bee46e88-3400044a1c3mr757548eec.26.1790217713016;
        Wed, 23 Sep 2026 19:41:53 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm9692263eec.12.2026.09.23.19.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:41:52 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 08:10:44 +0530
Subject: [PATCH wireless-next v2 07/16] wifi: mac80211: Add driver_op for
 SMD substate changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-smd-v2-7-bb40094da1d4@oss.qualcomm.com>
References: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
In-Reply-To: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfX9ttiQzXHariR
 2H7rNCbbsYfEX5IckjQ9k01/4APISiBSD713M6h0NTY1ip+/8PonM/98Vp7I46+Zo3axIoAufmZ
 w29jCKz6NceMIx7y3nekWNWpa9bRVB4=
X-Proofpoint-GUID: D1-4t8XFsfmAz5qDV9ciI2vVVxgLOjeL
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab48df3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uScroKfZLg1nAwDi7sIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfX04y4QeeMAOep
 rrLvcSU98fhHRpOO9UkjckJaEBeMaIWjvsQtwaWD+tLZnhlt2NCN0h0i4AoFD8F/KOsQJsqNoIA
 ATScOUbxxyxWg2GIzc4b8RoeUpmayIJCT9wKNBW+RUfIHvIsBpmgb+taoS9OSWBiiESyMdUNwkc
 Z9cfmG4DFaRUaV/JuLXfkCwmFoN6vna+YkX8ShJz3bK49DItsKkU87R5WKrr9jAes4zpY6dzEFe
 0XOMab630GGkGZs7MO9+fi8gEsAMeVV0ZuNzRI8VtnqQcWd+JvlVQosMqp+hFOL/c0bYSHyZRjB
 PiCedOegFhngiA7a0ozGW3K3wqgwsruHuMmTaNfQZ26wpuZeFuuhtHSPE8G5Mre5nE8ZwE5jVoo
 A/iypr5foxU9WmfNnmMguy3j2spaXsuzfa7K9RjuY7f3OwkKcs/AEYA5TCApl/d8eQsXjM2cpi5
 Cq/cmS/1d2d4x3mNN4g==
X-Proofpoint-ORIG-GUID: D1-4t8XFsfmAz5qDV9ciI2vVVxgLOjeL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240012

During SMD BSS Transition, a non-AP MLD moves through sub-states 4a,
4b, and 4c that impose different frame-filtering rules on the AP MLD.

Add a new driver op that mac80211 calls on each sub-state transition.
This lets drivers perform the necessary hardware queue and filtering
adjustments at each phase of the SMD BSS Transition.

Valid transition order:
  NONE  -> PREP  (ST preparation completed at the target AP MLD)
  NONE  -> EXEC  (ST execution in progress at the current AP MLD)
  EXEC  -> DRAIN (DL drain period started at the current AP MLD)

Suggested-by: Rohan Dutta <drohan@qti.qualcomm.com>
Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/mac80211.h    |  26 +++++++++
 net/mac80211/cfg.c        |  59 ++++++++++++++-----
 net/mac80211/driver-ops.c |  24 ++++++++
 net/mac80211/driver-ops.h |   6 ++
 net/mac80211/sta_info.c   | 140 ++++++++++++++++++++++++++++++++++++++++++++++
 net/mac80211/sta_info.h   |   9 +++
 net/mac80211/trace.h      |  33 +++++++++++
 7 files changed, 284 insertions(+), 13 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 39d67c054ae6..03b75eead766 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4076,6 +4076,24 @@ struct ieee80211_prep_tx_info {
 	int link_id;
 };
 
+/**
+ * enum ieee80211_sta_smd_state - SMD BSS Transition sub-state
+ *
+ * Tracks the 802.11bn SMD BSS Transition sub-state (IEEE P802.11bn/D2.0,
+ * Aug 2026, subclause 11.3.1) for a specific (non-AP MLD, AP MLD) association.
+ *
+ * @IEEE80211_STA_SMD_NONE:  Plain State 4. No sub-state active.
+ * @IEEE80211_STA_SMD_PREP:  State 4a. STA prepared at the target AP MLD
+ * @IEEE80211_STA_SMD_EXEC:  State 4b. ST execution active at the current AP MLD
+ * @IEEE80211_STA_SMD_DRAIN: State 4c. DL draining period at the current AP MLD
+ */
+enum ieee80211_sta_smd_state {
+	IEEE80211_STA_SMD_NONE,
+	IEEE80211_STA_SMD_PREP,
+	IEEE80211_STA_SMD_EXEC,
+	IEEE80211_STA_SMD_DRAIN,
+};
+
 /**
  * struct ieee80211_ops - callbacks from mac80211 to the driver
  *
@@ -4742,6 +4760,9 @@ struct ieee80211_prep_tx_info {
  * @set_eml_op_mode: Configure eMLSR/eMLMR operation mode in the underlay
  *	driver according to the parameter received in the EML Operating mode
  *	notification frame.
+ * @sta_smd_state: Notifies low level driver about IEEE 802.11bn SMD substate
+ *	transition of a station. It must not fail while transitioning down.
+ *	The callback can sleep.
  */
 struct ieee80211_ops {
 	void (*tx)(struct ieee80211_hw *hw,
@@ -5143,6 +5164,11 @@ struct ieee80211_ops {
 			       struct ieee80211_vif *vif,
 			       struct ieee80211_sta *sta,
 			       struct ieee80211_eml_params *eml_params);
+	int (*sta_smd_state)(struct ieee80211_hw *hw,
+			     struct ieee80211_vif *vif,
+			     struct ieee80211_sta *sta,
+			     enum ieee80211_sta_smd_state old_state,
+			     enum ieee80211_sta_smd_state new_state);
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 69b3ac0b48f3..0ea8b610a771 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2459,7 +2459,9 @@ static int sta_apply_smd_state_flags(struct sta_info *sta,
 	u32 expected_mask = BIT(NL80211_STA_FLAG_SMD_PREP_TARGET) |
 			    BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT) |
 			    BIT(NL80211_STA_FLAG_SMD_DL_DRAIN);
+	enum ieee80211_sta_smd_state new_ss;
 	u32 smd_flags;
+	int err;
 
 	if (!(mask & expected_mask))
 		return 0;
@@ -2479,6 +2481,22 @@ static int sta_apply_smd_state_flags(struct sta_info *sta,
 	    (smd_exec_current || smd_dl_drain))
 		return -EINVAL;
 
+	if (smd_prep_target)
+		new_ss = IEEE80211_STA_SMD_PREP;
+	else if (smd_exec_current)
+		new_ss = IEEE80211_STA_SMD_EXEC;
+	else if (smd_dl_drain)
+		new_ss = IEEE80211_STA_SMD_DRAIN;
+	else
+		new_ss = IEEE80211_STA_SMD_NONE;
+
+	if (new_ss == sta->smd_state)
+		return 0;
+
+	err = sta_info_move_smd_state(sta, new_ss, true);
+	if (err)
+		return err;
+
 	if (smd_prep_target) {
 		clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
 		clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
@@ -2578,26 +2596,17 @@ static int sta_apply_parameters(struct ieee80211_local *local,
 		sta->sta.spp_amsdu = set & BIT(NL80211_STA_FLAG_SPP_AMSDU);
 
 	if (mask & BIT(NL80211_STA_FLAG_SMD)) {
-		if (set & BIT(NL80211_STA_FLAG_SMD))
+		if (set & BIT(NL80211_STA_FLAG_SMD)) {
 			set_sta_flag(sta, WLAN_STA_SMD);
-		else if (test_sta_flag(sta, WLAN_STA_SMD))
+		} else if (test_sta_flag(sta, WLAN_STA_SMD)) {
+			sta_info_reset_smd_state(sta, true);
 			clear_sta_flag(sta, WLAN_STA_SMD);
+		}
 	}
 
 	if (params->smd_params.smd_sta)
 		sta->sta.smd_params = params->smd_params;
 
-	/*
-	 * SMD BSS Transition sub-states (IEEE P802.11bn/D2.0, Aug 2026,
-	 * subclause 11.3.1).
-	 * Only meaningful for SMD-capable stations (WLAN_STA_SMD set).
-	 */
-	if (test_sta_flag(sta, WLAN_STA_SMD)) {
-		ret = sta_apply_smd_state_flags(sta, mask, set);
-		if (ret)
-			return ret;
-	}
-
 	/* mark TDLS channel switch support, if the AP allows it */
 	if (test_sta_flag(sta, WLAN_STA_TDLS_PEER) &&
 	    !sdata->deflink.u.mgd.tdls_chan_switch_prohibited &&
@@ -2699,6 +2708,17 @@ static int sta_apply_parameters(struct ieee80211_local *local,
 			return ret;
 	}
 
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
 	/* Mark the STA as MLO if MLD MAC address is available */
 	if (params->link_sta_params.mld_mac)
 		sta->sta.mlo = true;
@@ -2783,6 +2803,19 @@ static int ieee80211_add_station(struct wiphy *wiphy, struct wireless_dev *wdev,
 	 */
 	if (!err && sdata->vif.type == NL80211_IFTYPE_NAN_DATA)
 		ieee80211_nan_update_ndi_carrier(sta->sdata);
+
+	/*
+	 * SMD sub-state was set in sta_apply_parameters() before the station
+	 * was inserted so drv_sta_smd_state() was skipped (WLAN_STA_INSERTED
+	 * was not yet set). Walk the driver step-by-step to the target state.
+	 */
+	if (!err && test_sta_flag(sta, WLAN_STA_SMD) &&
+	    sta->smd_state != IEEE80211_STA_SMD_NONE) {
+		err = sta_info_move_drv_smd_state(sta);
+		if (err)
+			WARN_ON(__sta_info_destroy(sta));
+	}
+
 	return err;
 }
 
diff --git a/net/mac80211/driver-ops.c b/net/mac80211/driver-ops.c
index 49753b73aba2..d77a5a80f06e 100644
--- a/net/mac80211/driver-ops.c
+++ b/net/mac80211/driver-ops.c
@@ -633,3 +633,27 @@ int drv_change_sta_links(struct ieee80211_local *local,
 
 	return 0;
 }
+
+int drv_sta_smd_state(struct ieee80211_local *local,
+		      struct ieee80211_sub_if_data *sdata,
+		      struct ieee80211_sta *sta,
+		      enum ieee80211_sta_smd_state old_state,
+		      enum ieee80211_sta_smd_state new_state)
+{
+	int ret = 0;
+
+	might_sleep();
+	lockdep_assert_wiphy(local->hw.wiphy);
+
+	sdata = get_bss_sdata(sdata);
+	if (!check_sdata_in_driver(sdata))
+		return -EIO;
+
+	trace_drv_sta_smd_state(local, sdata, sta, old_state, new_state);
+	if (local->ops->sta_smd_state)
+		ret = local->ops->sta_smd_state(&local->hw, &sdata->vif,
+						sta, old_state, new_state);
+	trace_drv_return_int(local, ret);
+
+	return ret;
+}
diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index f1c0b87fddd5..ce11a723ec36 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1814,4 +1814,10 @@ drv_nan_peer_sched_changed(struct ieee80211_local *local,
 	return ret;
 }
 
+int drv_sta_smd_state(struct ieee80211_local *local,
+		      struct ieee80211_sub_if_data *sdata,
+		      struct ieee80211_sta *sta,
+		      enum ieee80211_sta_smd_state old_state,
+		      enum ieee80211_sta_smd_state new_state);
+
 #endif /* __MAC80211_DRIVER_OPS */
diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index fdf00cbf49d8..5aa6f5b481e3 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -701,6 +701,7 @@ __sta_info_alloc(struct ieee80211_sub_if_data *sdata,
 	ieee80211_init_frag_cache(&sta->frags);
 
 	sta->sta_state = IEEE80211_STA_NONE;
+	sta->smd_state = IEEE80211_STA_SMD_NONE;
 
 	if (sdata->vif.type == NL80211_IFTYPE_MESH_POINT)
 		sta->amsdu_mesh_control = -1;
@@ -1527,6 +1528,20 @@ static int _sta_info_move_state(struct sta_info *sta,
 		WARN_ONCE(err,
 			  "Driver is not allowed to fail if the sta_state is transitioning down the list: %d\n",
 			  err);
+
+		/* revert SMD states if STA has transitioned down */
+		if (new_state == IEEE80211_STA_AUTH &&
+		    sta->sta_state == IEEE80211_STA_ASSOC) {
+			if (test_sta_flag(sta, WLAN_STA_SMD) &&
+			    sta->smd_state == IEEE80211_STA_SMD_PREP)
+				sta_info_reset_smd_state(sta, true);
+		} else if (new_state == IEEE80211_STA_ASSOC &&
+			   sta->sta_state == IEEE80211_STA_AUTHORIZED) {
+			if (test_sta_flag(sta, WLAN_STA_SMD) &&
+			    sta->smd_state != IEEE80211_STA_SMD_NONE &&
+			    sta->smd_state != IEEE80211_STA_SMD_PREP)
+				sta_info_reset_smd_state(sta, true);
+		}
 	}
 
 	sta->sta_state = new_state;
@@ -3883,3 +3898,128 @@ bool ieee80211_link_sta_update_rc_bw(struct ieee80211_link_data *link,
 
 	return true;
 }
+
+int sta_info_move_smd_state(struct sta_info *sta,
+			    enum ieee80211_sta_smd_state new_ss,
+			    bool notify)
+{
+	enum ieee80211_sta_smd_state old_ss = sta->smd_state;
+	struct ieee80211_local *local = sta->local;
+	bool notify_driver;
+	int err;
+
+	might_sleep();
+
+	if (old_ss == new_ss)
+		return 0;
+
+	switch (new_ss) {
+	case IEEE80211_STA_SMD_NONE:
+		if (old_ss != IEEE80211_STA_SMD_PREP &&
+		    old_ss != IEEE80211_STA_SMD_EXEC &&
+		    old_ss != IEEE80211_STA_SMD_DRAIN)
+			return -EINVAL;
+		break;
+	case IEEE80211_STA_SMD_EXEC:
+		if (old_ss != IEEE80211_STA_SMD_NONE)
+			return -EINVAL;
+		break;
+	case IEEE80211_STA_SMD_DRAIN:
+		if (old_ss != IEEE80211_STA_SMD_EXEC)
+			return -EINVAL;
+		break;
+	case IEEE80211_STA_SMD_PREP:
+		if (old_ss != IEEE80211_STA_SMD_NONE)
+			return -EINVAL;
+		break;
+	default:
+		sdata_err(sta->sdata, "invalid smd state %d", new_ss);
+		return -EINVAL;
+	}
+
+	sta_dbg(sta->sdata, "moving STA %pM SMD state %u -> %u\n",
+		sta->sta.addr, old_ss, new_ss);
+
+	notify_driver = notify && test_sta_flag(sta, WLAN_STA_INSERTED);
+
+	if (new_ss > old_ss && notify_driver) {
+		err = drv_sta_smd_state(local, sta->sdata, &sta->sta, old_ss,
+					new_ss);
+		if (err)
+			return err;
+	}
+
+	if (new_ss < old_ss && notify_driver) {
+		err = drv_sta_smd_state(local, sta->sdata, &sta->sta, old_ss,
+					new_ss);
+		/* driver should not fail moving down SMD states */
+		WARN_ONCE(err,
+			  "Driver should not fail moving down SMD states: %d\n",
+			  err);
+	}
+
+	sta->smd_state = new_ss;
+
+	return 0;
+}
+
+void sta_info_reset_smd_state(struct sta_info *sta, bool notify)
+{
+	if (sta->smd_state == IEEE80211_STA_SMD_NONE)
+		return;
+
+	/* DRAIN -> NONE, EXEC -> NONE or PREP -> NONE */
+	WARN_ON_ONCE(sta_info_move_smd_state(sta, IEEE80211_STA_SMD_NONE,
+					     notify));
+
+	clear_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
+	clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
+	clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
+}
+
+int sta_info_move_drv_smd_state(struct sta_info *sta)
+{
+	enum ieee80211_sta_smd_state new_ss = sta->smd_state;
+	struct ieee80211_local *local = sta->local;
+	int err = 0;
+
+	if (!test_sta_flag(sta, WLAN_STA_INSERTED))
+		return 0;
+
+	switch (new_ss) {
+	case IEEE80211_STA_SMD_PREP:
+		err = drv_sta_smd_state(local, sta->sdata, &sta->sta,
+					IEEE80211_STA_SMD_NONE,
+					IEEE80211_STA_SMD_PREP);
+		if (err)
+			goto rollback;
+		break;
+	case IEEE80211_STA_SMD_EXEC:
+	case IEEE80211_STA_SMD_DRAIN:
+		err = drv_sta_smd_state(local, sta->sdata, &sta->sta,
+					IEEE80211_STA_SMD_NONE,
+					IEEE80211_STA_SMD_EXEC);
+		if (err)
+			goto rollback;
+
+		if (new_ss == IEEE80211_STA_SMD_DRAIN)
+			err = drv_sta_smd_state(local, sta->sdata, &sta->sta,
+						IEEE80211_STA_SMD_EXEC,
+						IEEE80211_STA_SMD_DRAIN);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (!err)
+		return 0;
+
+	/* if EXEC -> DRAIN failed in the driver, notify EXEC -> NONE */
+	WARN_ON_ONCE(drv_sta_smd_state(local, sta->sdata, &sta->sta,
+				       IEEE80211_STA_SMD_EXEC,
+				       IEEE80211_STA_SMD_NONE));
+
+rollback:
+	sta_info_reset_smd_state(sta, false);
+	return err;
+}
diff --git a/net/mac80211/sta_info.h b/net/mac80211/sta_info.h
index 89137b18a862..bdc021675727 100644
--- a/net/mac80211/sta_info.h
+++ b/net/mac80211/sta_info.h
@@ -721,6 +721,7 @@ struct ieee80211_sta_removed_link_stats {
  *	would be assigned to link[link_id] where link_id is the id assigned
  *	by the AP.
  * @rem_link_stats: accumulated removed link stats
+ * @smd_state: Sub-state for STAs in SMD BSS Transition
  */
 struct sta_info {
 	/* General information, mostly static */
@@ -797,6 +798,8 @@ struct sta_info {
 	struct link_sta_info __rcu *link[IEEE80211_MLD_MAX_NUM_LINKS];
 	struct ieee80211_sta_removed_link_stats rem_link_stats;
 
+	enum ieee80211_sta_smd_state smd_state;
+
 	/* keep last! */
 	struct ieee80211_sta sta;
 };
@@ -1169,4 +1172,10 @@ static inline u32 sta_stats_encode_rate(struct ieee80211_rx_status *s)
 	return r;
 }
 
+int sta_info_move_smd_state(struct sta_info *sta,
+			    enum ieee80211_sta_smd_state new_ss,
+			    bool notify);
+void sta_info_reset_smd_state(struct sta_info *sta, bool notify);
+int sta_info_move_drv_smd_state(struct sta_info *sta);
+
 #endif /* STA_INFO_H */
diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index 562a4964afa3..294a8a44a125 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -3403,6 +3403,39 @@ TRACE_EVENT(drv_nan_peer_sched_changed,
 	)
 );
 
+TRACE_EVENT(drv_sta_smd_state,
+	TP_PROTO(struct ieee80211_local *local,
+		 struct ieee80211_sub_if_data *sdata,
+		 struct ieee80211_sta *sta,
+		 enum ieee80211_sta_smd_state old_state,
+		 enum ieee80211_sta_smd_state new_state),
+
+	TP_ARGS(local, sdata, sta, old_state, new_state),
+
+	TP_STRUCT__entry(
+		LOCAL_ENTRY
+		VIF_ENTRY
+		STA_ENTRY
+		__field(u32, old_state)
+		__field(u32, new_state)
+	),
+
+	TP_fast_assign(
+		LOCAL_ASSIGN;
+		VIF_ASSIGN;
+		STA_ASSIGN;
+		__entry->old_state = old_state;
+		__entry->new_state = new_state;
+	),
+
+	TP_printk(
+		LOCAL_PR_FMT VIF_PR_FMT STA_PR_FMT
+		" smd_state: %d->%d",
+		LOCAL_PR_ARG, VIF_PR_ARG, STA_PR_ARG,
+		__entry->old_state, __entry->new_state
+	)
+);
+
 #endif /* !__MAC80211_DRIVER_TRACE || TRACE_HEADER_MULTI_READ */
 
 #undef TRACE_INCLUDE_PATH

-- 
2.34.1

