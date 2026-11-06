Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951998;
	b=sMHOtqmsU4wEwMvRvNdiJicWARfm/LKa6gPmkl3TaO056zHQEHCnSrpDiaW7EjkBIRmY
	 Z3uMuuB1aZPZpYFT9Ji/p+sg8wd5A4bdDks8KCLcDkE7yAHsO7eeDOG3I9pmaEybbQT8x
	 rEyd5SeM0qUtVvhvflSeY6zVJ5/3F4EU43s2lYR2aI4Qp1zSSnvlZI0M7aAm98IXO89wQ
	 i7NyGOn8UZqc/22NiL7kv6JI6CCmBonUA2A1J5/EwVkLPkb7rNs/K5AR0aqG3eeKW4ogB
	 M3fdJS/nisEwy/eSW8MUBPuEuKCM59WhKO6jLA3x+CZltRDzIzVE4eD5PsSejYXgQIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K7Rs0bymkxjSQVmD5S9xd52rJVwRLbCLDF7LJZQJuzc=;
	b=wIMv74yHkp3IY1AEIn9OcyDDVf8hUGi40B1HLZndVfg6nAbmtlUcRBqV0oTv1CegbtmH
	 qA2E2ce/+sMyG2YMxnrTDUARE9+8VIq1G9Iet6bUY/LCXKHojFuplcXNyIGmxU9N/hgCR
	 oSCBfDXPfKKzk3Q/RlDAitpKZhd/gzg1CWderGvPVmeYih2rQo4ksYs32Th3vCyCCJtKG
	 fS+/q+W4oiJR7Z3Mxvjq/a2W318TVoGch+uzGDZ4PQkXy5yjdmszcQ1ece/U9GSn+gegP
	 2vUhsOsHS2OIDeaTRu8RVYULgQlQhUst1AhsbdEsTU3XLx4ft7dPj+3BqGXp1bGuHHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ERqIW8ty;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CiRZC6pm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C13606D828
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C13606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ERqIW8ty;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CiRZC6pm
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RMIq045441
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 07:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K7Rs0bymkxjSQVmD5S9xd52rJVwRLbCLDF7LJZQJuzc=; b=ERqIW8tyqgK8hWAK
	P/m1HlAf3ZbQqrHCDTJhfO5Zbyyi/zOFOuMiCzibRLXf+Cc6uFZaK+JBcT9/3Usf
	DFnt3x6Tnlnzi9sLtxYBoTYO3c9zyE4zDng70CzEJJBWtHvaJltwQBDFCPWunGrs
	A2pDV6vYwNlRJIxuvHox6gxavsHf5gHfg9CL5vaRoyoyYE11eKdBCzPlO7FCUJGi
	JwQgc4S2TSPm9By57K+wA6V/yJ9b+Ld3BARWdSarsRMUzgmk2umYSYs8ohGuRsTf
	uQAtaJJaH+6kQQU6aLMTG/J0Iv+kPF3QsmmMoOUZ+FzP1VKz+CFx1ZpjEbUu3a3u
	Tii38A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9srrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:59:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so505070a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793951996; x=1794556796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7Rs0bymkxjSQVmD5S9xd52rJVwRLbCLDF7LJZQJuzc=;
        b=CiRZC6pmPDjCyn5dXpSaV85UAro4Wl2kmt3TWuP+Oo1x3i6UqQlDvMsPpWrdReYU4b
         +wp1DWtaq4dKdcM/nLGmCQ2N0ZAu/+Q2bXnYlBuNUFZME/CxTqqL8xxXkldx0m8+cOUi
         dNbAGWVXNoOLuaUyLSXzbQ5NMfxMtXIVvZxS15gou5WmxCfyqRC7ahjQXfQJWUKIVSdv
         mS5GWBPS1HhLcgMf1FtDUT+4epxTKyZ3mblOl7hhcmw1a9ivcoB0eYX36Q2Yrq1hTDwW
         PX72l9VvZpEugFrzMtZc2OyEahIgaD/XKsnAyPGHvClPBkng070rZ4VSAZioG6vTGevf
         pgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951996; x=1794556796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7Rs0bymkxjSQVmD5S9xd52rJVwRLbCLDF7LJZQJuzc=;
        b=vGx5TNXobHaSVC7YbixcfwQvWnyzU72UmOWTWmq9M44rQall+/4yweYemj8ner2Qzv
         qEw/VVYK4B9A9NNATWP9r7stt5ldPwT4NLEmGvBxcFZ5AtfaKAYUYysFW+1wE9B0qm6i
         BT42w6rwJZTrdyHBeIsmMZuK7M9jauFJa/TRgEB8UF9StZZBsvizj66wwQ02BNwNouFi
         6d3Wa2MphNWqODZidEzxB0+wUfk/2WaG+Yx8LCzvzdG157yPTDo0UQb0j8ATQ5L/Mk34
         NlMWd+BrMn8tDea0qOxq7uixK/9pNTyk+Tq44YgjlvscxzM0/HC1ohlgFr4p48/Yzpjg
         Z1NQ==
X-Forwarded-Encrypted: i=1; AL+hErFjKIiwgH29PEl3GFEnlSBHYElcTSmho1/74H+g1DOqs/QHDIFgQYymM/5AiUSiQeKFayaX+MlchKHK7Ns=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3TYpNLywwJ2ML6nMEthps+4WqTAxJj9IEctMEEVdp2YsTn0rD
	+27UkJ6aShifGBar70NKebBi5gXJNxpyTpndAMJdZb9X95+e/ZkFKGRwJGQe344eHFO+y0qIwfT
	2QxvpdpC9p89zlMO2BAYOWAZJr4uF7mqDqYIZ2CbgDR0TWQTMhe6EQJsgl1rf3ArANQ==
X-Gm-Gg: AYBFou3gtav1o8IYuGqYAGHjhVCHfwc79RFRuoGvRTmjiapWrJCS5v0fqfM9gKRfXkT
	x9x6S76ji9A+FdMAlBhTlOkDqKZHyPmIcbZK3LE8bZM7u2IS+xCzqpFQP5NkjAl6sj8DERq2vQf
	1G7GctbtOaphA0t6eBai1PqgQyKmh2QXRhWgrsQeQiFkCRzcuincIeEtD6hyymgOVYG4aFccDzN
	+7OsHSn7XthMfoRsG1j6t0ooHKD3aAqwfpkUZsOEqrkrkXZl83eLigJpaALdkCZl85faNB7CmL5
	yr+R60siR4si/Gjg4NfGJr3XNAq6hlTRsFSjpKGuEp5/YBSePqQvxQqqEnfBEKd4dpVpjLlfFoD
	+Rw5B+F1XgGP0gocxG1wbArjvGRXdoQH/rrdggzXgNuyecVIJ1mHoyWVdFpFMQdcbCXwT2XHDuw
	0aHtoRBNv3mE5sSEaoopcJA5rDtkRVunJGxlR6+SXLxSMRWpo513vHBZt52VFWDoZHFIjvFT8=
X-Received: by 2002:a17:90b:1642:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3b0db6c9c9dmr1739784a91.12.1793951996294;
        Thu, 05 Nov 2026 23:59:56 -0800 (PST)
X-Received: by 2002:a17:90b:1642:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3b0db6c9c9dmr1739761a91.12.1793951995745;
        Thu, 05 Nov 2026 23:59:55 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.05.23.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:59:55 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:50 +0530
Subject: [PATCH wireless-next v4 13/21] wifi: mac80211: apply SMD BSS
 Transition STA sub-states
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
Message-Id: <20261106-smd-v4-13-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX1TksO1ZnLC6r
 yQL5nBFZ23lijUvPDFoPY/08OPEq/xJPSfIL9PE0yweoUXDcZi7sFZMxSsXkSJ1n6LNYDe130UH
 xKmazGV6ocnvRatXEHdY3dTtaVTwbMw=
X-Proofpoint-GUID: TWxVpjq6whoX1njU_fklAnpVle7hgy2p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfXzN/8Y3fJwoVT
 YTckGAG9ZHEohDMF4KFJUN56dws0Htyw3L3O5MoXyW4R49mlp+qehUkz7XQAx5Ir0pJYpErOrqo
 rQUvHT7fGqYzTHRaIkii90tVY93N0/xRP9ZLhxoFvvn6BKuIDF0xqZd335oja+tlq1v0gWhHKxI
 e+rRc/tsoewWGgHiMhNSIniDOlndmfYxIUZ/EHDiqebRaQ4V9dBpzmh2ThAOUN1LD3BGbFdjYJv
 FBdJQRcRvjOWEqOTC7N/59NxWokRHRV7MfrQtpNaZ43Lvmfo93DnsBigK9wWm8v1cel4hgd1Cs1
 6nExe6LlZ/nPmrhaxZO0Ds47FM+1R+GCwsGU8LPbWfBIe1ObuF6w2JAte5nRqFMjhsA2n1sm9Kz
 Dv3L6cichUXSt/37+qqoCSFghbmW+tgkItjmcUXpsmoEgihbsiJ534Anfwi2moxH6Ug0j+zVVtW
 ht5aq9L58Ml5KcDEk6A==
X-Proofpoint-ORIG-GUID: TWxVpjq6whoX1njU_fklAnpVle7hgy2p
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed88fd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=S5cDeCcwn0inUhub9TMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

During SMD BSS Transition, the non-AP STA MLD roaming from the current
AP MLD to the target AP MLD switches its new SMD sub-states. Capture
these state transitions to track the station roaming.

These are transient sub-states of WLAN_STA_AUTHORIZED with the SMD-ME.
The station remains authenticated, associated, and RSNA-established
throughout. At most one of the three may be set at a time; mutual
exclusion is enforced in sta_apply_smd_state_flags().

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 net/mac80211/cfg.c         | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 net/mac80211/debugfs_sta.c |  3 +++
 net/mac80211/sta_info.h    |  8 +++++++
 3 files changed, 71 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 37329d8748ae..1e0ef74a7420 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2704,6 +2704,55 @@ static int sta_link_apply_parameters(struct ieee80211_local *local,
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
@@ -2790,6 +2839,17 @@ static int sta_apply_parameters(struct ieee80211_local *local,
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
index c2268f79601b..8071ca4c5f06 100644
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
index 54c4c613a2da..2e9bb2ab567f 100644
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

-- 
2.34.1

