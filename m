Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3CB3D810D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217714; cv=none; b=LVfJJ70uEK69Gwo5FgtyAxkxCoq44J7kHTXAU6mpmPLsIZpf3OFJoxNB7wSmv6+aTurlOZIk3ckMphhpYs/u8Vpyc2WUkYgx1lp74Z7pTr5zwTes6qGLK48Ei89fR1qUE36gSvH6ovlYm5KPboVhmfI3RIrHEXm80bH3O+eTO+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217714; c=relaxed/simple;
	bh=niHUdxdsMzapGQWgN+ygxlQwbBOivdvtyi9oGnhcRmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jScFTv3pAzwBAGERUCtcg7j2/ZESMiyTNFXzKpizYBRQkzBbW5oziLm/lUOiAnl41IAJf/FFZ1qBei/Gf8z6BTu/W6o/EIu4YXkpNVlI4q7jpLtdlXbTt+MLnIlwAcOybIm0Ao8SBoFoS2nrMVslUjkz+TGs+oTPzkpnfWXmDXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Go/q84pW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKf5meON; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Go/q84pW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKf5meON"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O2K33U3722570
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wIM3NWZ3d8aicbDm/119VKkMxWVj5der5v1yPGJcgSw=; b=Go/q84pW2jElYtSB
	wFkAZw/IXpaRtu/pXKQrW7OH1bpmP52bGcyLIxs4Ua1DojQOiAib9ceoY8iCz6KS
	1gHKFp5GMljROYWXWELur7vdyAAw5IgE4gyprQ75FWNEr8PSKi7ejmTM6CLc/vGb
	JcDXIfGcW1EwPCDknYOb3C8/l+5IUUvp0zhljTXGHv70eCyIfaR+GQVowUH1Kdeg
	UaHxQgYuxwvzYpaPinWf0bLXKCS+XhRsY2/eej0rrcoagfyHpUdVpVKOqBFHWa4g
	BwBs3IDYRPOrq4KREbDnlRvIp36v4D0qd0ppmy1S8NZG7uM3QYw72SoP3fjKEfFZ
	+33urw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv2wqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33bee712354so2033300eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790217711; x=1790822511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wIM3NWZ3d8aicbDm/119VKkMxWVj5der5v1yPGJcgSw=;
        b=IKf5meONna3gch9JyQKGqgsDKY3h7v3uG5rRYk6GNYwCPvbZmEIApiq6nw4ci2NE7z
         gnMzyWZx+UVwNjAs/PSKkM/XnuKeSGlGlHTak3+3XVmUIdZZ7cxhvGAwcwkga5U+SHR2
         b8frl6LuI4wCSxAN1XnU5ThI1XNpl0gRXxoBAvKZ95s9D/+ZrXLUuYL/cZcy7rt4jQBO
         4Okygu7B8iVpASvylOso5qLhQMvwdDR8w5ICflqyeEyoHDVPVLEs5Isaj/de+Md6qjH2
         upt8qzP6rjC2dRZaQvSphA8wrcejk+tfo8C6GNWqxO6Q/XrfDlb4wkQIyVyuWqHwSlYd
         u3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790217711; x=1790822511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIM3NWZ3d8aicbDm/119VKkMxWVj5der5v1yPGJcgSw=;
        b=mHAnhkIwDXl+Xv5TS74h0TfJJAdhkEbwjC1xHcE89elwG1+BFvxQrr91vzTUkGsU0v
         KktfW/81Nob+C4lbqb0btAJFLg3E4pubLNEIFUNEmV+fEN9779GM7x0JdBdpgPn5ADt+
         VPk4yT81btDfNss4bI3Kd8q2v3myWr7GuTAoyCvIWWWxkoziNYUcGTKnJjS9HGTzcrKV
         D+62UbT9N9uOwocE0WVZGsTX6oWD+syR8+e+gBEdKWkt7esC35vp3yRV5fnOkBT6OrGP
         zCtTrv1/182ATN0kOBLqH0cV4qqNIBcN+UOnK+ap8J23R7g+v5n7j42hpQPeBKgSqP7i
         PhTg==
X-Forwarded-Encrypted: i=1; AKwUvBwpNubzgz6JooGpdZcjE/S9hw7j52TpgveI3u//jxQ3GP6Z/xGFU7PmUfvn1JHocq4K7wwxD4qTKsNc1kA=@vger.kernel.org
X-Gm-Message-State: AFuF++nuiFgUj+VsbLqELoXUvz3uDRhXpbRAgZ/RMolHnxBn7VT2RFkB
	6klvbM9jPm4DC5OKr6+jnc51jbevSelLjQrBdlYojyozMmdeyVrhzDBIzaW1NNzhUzx3OXBp0YR
	3iLevcRcRDRj4lmkjrtCD+bkySbTT+JNCyjdClzBPQlGVDuPbaVs4dVNwAiDbWmOUIQ==
X-Gm-Gg: AYBFou2S6qA69jJE1sXXyEhXNzDwsxIetlgyU+QRWZ9xrpQQUZZcFFMG/DXs4zNt4Zr
	KOA0uOOcsYItKu2wxpvb/6pIcfSPxvkWiwTIEffQS9ykTRwsM4Z29sk3+o+kpdewnKGrh+lrH+M
	kWhDV2KBe2t756EyB7ZPBU2puYUVwTwFPgDHATktOB/quwimRiUu2xktLzBLf+aoGp7VbC1pugJ
	2GefFNj24peCSsJXxdFKUyHJkZDKi7RHVwGz1Wr433ofNOCMrRA92GYa0HSRQHMK8c2tJh6J7Dl
	vXd5udpVl8Q/mdSFCOxaYyhiIkavwMK+lcjnAQXWVnK0qSvW1rsjJ7Y+pN2qO4wvLZ5A7FxoKrP
	PAPyYkpakcbWsAMSvCycNslzMksOTKq2dmPqMQR12u4yjmET/BDUFNbY/bvhs7bfdh0Jvdorf1K
	F5YEKUES9FiQsPaujAFDzBDA==
X-Received: by 2002:a05:7301:201d:b0:314:267f:46e2 with SMTP id 5a478bee46e88-34005c61551mr678904eec.20.1790217710636;
        Wed, 23 Sep 2026 19:41:50 -0700 (PDT)
X-Received: by 2002:a05:7301:201d:b0:314:267f:46e2 with SMTP id 5a478bee46e88-34005c61551mr678884eec.20.1790217709863;
        Wed, 23 Sep 2026 19:41:49 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm9692263eec.12.2026.09.23.19.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:41:49 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 08:10:43 +0530
Subject: [PATCH wireless-next v2 06/16] wifi: nl80211/mac80211: Add SMD BSS
 Transition sub-state STA flags
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-smd-v2-6-bb40094da1d4@oss.qualcomm.com>
References: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
In-Reply-To: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfX9vmvDOKEcgRe
 OFt/bhim6GnDXSWVBaBAkmctGlboo1LgNOXCfp6r4lOp8CSYnjEFzq2rNri8yYeleKh+Z5sQ2LT
 o3Hpe70M9tnNnVEKHQZx5vQgY92jBTKjrYTxJMf6fc04+2vrgO/c9Mf5IRyGwji1ACbXQuDpHFl
 aWOQ3URfRdmuZvtIWGLwQAla6bcc5xVQE7Ob82xTa8VByPtVUN7wREKb9//0EaI7h4LQm+mLkwg
 y6j7hy0pc/If+9trgoylzMef7Ao0XbUQAQUex0i+HOk6uA7aZMbUogACq3fE1HG7vLvX8AlpwGk
 xfcly6u7CXKKYWxQmAsMOQrR35FwCS5X4+yyoK7C3llV4GuaA87Ne7imNArcPJY/bU4Mr08UWXB
 R8IniNlYauKFQUE4Y8IS1ijxiRATXdcw9UVJUG5TQb1JkiW7V4ELLgb4198MyV+3HTrR4eCVtXF
 FGukVthCe7QY7i+urHw==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab48def cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jLbTusTt1GuB8y0ejZAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: VOtUt3ZzgjmIVSScPwxlgEVP_HbHPjjg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfX/7rj63jNWGxU
 MOsk+JtioWsGo0NzM2scI5wcpAAAXATtBr2Ms+3c7wTmoCWwsu9jP63rpSwBEtT71zAnCrqVJkW
 QkzckOEwc+p/E0JoCFOrHjOs3ReiyDg=
X-Proofpoint-ORIG-GUID: VOtUt3ZzgjmIVSScPwxlgEVP_HbHPjjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240012

IEEE P802.11bn/D2.0, Aug 2026, subclause 11.3.1, defines three new MLD
state sub-states (4a, 4b, 4c) that apply when a non-AP MLD and its
associated SMD-ME are in state 4 and an SMD BSS Transition is
in progress.

Add the corresponding nl80211 STA flags and internal STA flags to track
the SMD BSS Transition sub-states (4a, 4b, or 4c) in mac80211:
 - NL80211_STA_FLAG_SMD_PREP_TARGET (WLAN_STA_SMD_PREP_TARGET):
     State 4a: non-AP MLD is prepared with target AP MLD
 - NL80211_STA_FLAG_SMD_EXEC_CURRENT (WLAN_STA_SMD_EXEC_CURRENT):
     State 4b: ST execution active on current AP MLD
 - NL80211_STA_FLAG_SMD_DL_DRAIN (WLAN_STA_SMD_DL_DRAIN):
     State 4c: DL draining period

These are transient sub-states of WLAN_STA_AUTHORIZED with the SMD-ME.
The station remains authenticated, associated, and RSNA-established
throughout. At most one of the three may be set at a time; mutual
exclusion is enforced in sta_apply_smd_state_flags().

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/uapi/linux/nl80211.h |  9 +++++++
 net/mac80211/cfg.c           | 60 ++++++++++++++++++++++++++++++++++++++++++++
 net/mac80211/debugfs_sta.c   |  3 +++
 net/mac80211/sta_info.h      |  8 ++++++
 net/wireless/nl80211.c       | 18 ++++++++++---
 5 files changed, 94 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 3f9acbd4830f..cd9a320143d7 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -3973,6 +3973,12 @@ enum nl80211_iftype {
  *	previously added station into associated state
  * @NL80211_STA_FLAG_SPP_AMSDU: station supports SPP A-MSDUs
  * @NL80211_STA_FLAG_SMD: station has negotiated SMD.
+ * @NL80211_STA_FLAG_SMD_PREP_TARGET: station is prepared at SMD target AP MLD
+ *	(State 4a).
+ * @NL80211_STA_FLAG_SMD_EXEC_CURRENT: current AP MLD is executing SMD BSS
+ *	Transition (State 4b).
+ * @NL80211_STA_FLAG_SMD_DL_DRAIN: current AP MLD is in DL draining period
+ *	(State 4c).
  * @NL80211_STA_FLAG_MAX: highest station flag number currently defined
  * @__NL80211_STA_FLAG_AFTER_LAST: internal use
  */
@@ -3987,6 +3993,9 @@ enum nl80211_sta_flags {
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
index eee6ef08950d..26277b3352ae 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -7708,6 +7708,9 @@ static const struct nla_policy sta_flags_policy[NL80211_STA_FLAG_MAX + 1] = {
 	[NL80211_STA_FLAG_AUTHENTICATED] = { .type = NLA_FLAG },
 	[NL80211_STA_FLAG_TDLS_PEER] = { .type = NLA_FLAG },
 	[NL80211_STA_FLAG_SMD] = { .type = NLA_FLAG },
+	[NL80211_STA_FLAG_SMD_PREP_TARGET] = { .type = NLA_FLAG },
+	[NL80211_STA_FLAG_SMD_EXEC_CURRENT] = { .type = NLA_FLAG },
+	[NL80211_STA_FLAG_SMD_DL_DRAIN] = { .type = NLA_FLAG },
 };
 
 static int parse_station_flags(struct genl_info *info,
@@ -7774,7 +7777,11 @@ static int parse_station_flags(struct genl_info *info,
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
@@ -8921,7 +8928,7 @@ int cfg80211_check_station_change(struct wiphy *wiphy,
 		return -EINVAL;
 
 	/* When you run into this, adjust the code below for the new flag */
-	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 9);
+	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 12);
 
 	switch (statype) {
 	case CFG80211_STA_MESH_PEER_KERNEL:
@@ -9016,7 +9023,10 @@ int cfg80211_check_station_change(struct wiphy *wiphy,
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
@@ -9703,7 +9713,7 @@ static int nl80211_new_station(struct sk_buff *skb, struct genl_info *info)
 		return -EINVAL;
 
 	/* When you run into this, adjust the code below for the new flag */
-	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 9);
+	BUILD_BUG_ON(NL80211_STA_FLAG_MAX != 12);
 
 	switch (wdev->iftype) {
 	case NL80211_IFTYPE_AP:

-- 
2.34.1

