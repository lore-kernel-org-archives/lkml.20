Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952012;
	b=3jieYuli3LuT8ZEZIXQLhxkvnBwNEdBSwUCFUeagsupIGf0DWgdtDdMueADHzJYNDm4U
	 qZke2AB2ilwJaa1hwcLETTSvPm5rIxBsOom1+8xDB6IzealkQygjgT5oGtCkrw9XZPRC1
	 qVngVcokizWP9NXTqd7xFh4Uw/xvsVZrwBepO+SU+z14aojBrSkvse7PsFNZku64nD+y/
	 +EkEMV2qEPZw615eCzyZVDZ9EPPTMMWRmxaG2HPjlQBKcIiASXuLops64Wxqh1hxqULkf
	 5Pb5VBqJ9L2QrFphV/5w/OPCakXm9lq02oWwnDddpoCopkKkNqf2igOFmEvqXsif+pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gCtLvFIImSB8LqKP6MP6VDrJv6ieUFPxwzhvVnpKvdQ=;
	b=O2CqbAuuBUUkGqO6tFBbJcA7JVZ0lav7dppt8AzIsvOfMlIKAiSV3JWODqHfllesYtxe
	 Fkvba3UzCbjxuFai8Ou14hKkUj2rGmt5m6baIiatNh5cmME2VwSQUzRVRAqeE6VokIxfw
	 CoXPevCjvogvaimdjBmkK8rOLvmfDI+KJ7NT0Wu8OVoB0GJ8Na1iJcvbTTFWAXDtok+s+
	 wDSIoInXfuGTlyW+NFTbDrWsLfZVdxdfJUe96dIq2n8tX4hcwFiOCzoVKbFrieZVb+uR2
	 XBPvAr+LnEecGsYdHQQv+9Lyg5S4FhsKom2UL8b6EX2F795p35rKcYNn378oEbSu6tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIrLkXTU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EmExq/IM";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA9060A3814
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BA9060A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIrLkXTU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EmExq/IM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R2sx128919
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gCtLvFIImSB8LqKP6MP6VDrJv6ieUFPxwzhvVnpKvdQ=; b=SIrLkXTUDN5wmz5c
	/K18MyZ0vVZKLkwD6lBhIXtQiP1wCel90qwvIYVaYUVq0xXLWwPluS/LWNrbrPwV
	+klXrMNzQRW4jevophr6svS7wj76UNCa+osDbLARgHw/BkAemm8HOeNMKy+xHUH2
	wES2GmcF7PSl8QA5rU1KT+OI0hokY0ic3TVagieEA4YFtmhscldLyFVlxcG+P3IW
	rLw+n+PpR3O/Xtu5OlE3yrMHLElg3nNO/b4goLh8oIfhAJNApf4Ahsfnapb4l75L
	ko+v0dzvLvmGRc4cmub5z0665PYCo4+c2PSxiPJSAp8zpXus59a6eTFM1zZroNtN
	gcqwHQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9sr94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:00:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so400578a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952011; x=1794556811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCtLvFIImSB8LqKP6MP6VDrJv6ieUFPxwzhvVnpKvdQ=;
        b=EmExq/IMZ6rAaDHB5N8tQTVDXUbXHExjyyEdYIlMe1QqoagKMo1ZBWhQYbf0TuQIAe
         OViHyRNBzGK6Te8WSvl02p1mlAKOkG/bmlfTikCoxbKrnplSQjIHr0I15u0P0N6zr1Iv
         pb9UPs2lGQVEm1UMOE3VtN5Ppi9adPfyYTywnO/Lht8Nl71ZAcUTqe9unx+8hqOnTGyd
         G3At7bHeyn4xMuKfqtEMRwBEyZ7ld9HRcNmcY+h9/UsDyNl99qhm2HpKToK/WTD2zNDQ
         GCl3ZyXl6cDi6EgveIb6k8yMnKXcuhrBUcBlbHcYuwNp2SvGczq9sBd5lXzTPHqpehnW
         CIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952011; x=1794556811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCtLvFIImSB8LqKP6MP6VDrJv6ieUFPxwzhvVnpKvdQ=;
        b=qruwMUBIUSxNZn8TlntLIkSN05NhCM2IE3JZJQhKyJgwrsNl1b4Ybt2DJVguZ/L9GW
         lFUjKNGXCP9/Eetk5wpouBHR19iAAWPvUwZCnTBnoqiV3ih+bnkd+Qn3xSeGNDxp94LN
         yCmL8WNR5BQBHsiy8MvdJIodE0JGcQ4Smzh/D9Kwn2+koIuLps0C1Id8VFa3xweRALdg
         Nk+yindP06+uFa8bX9pq84Go+GRBatSKOSwdRI6azuEyS8btiZCtzl+aJvOQZhYdKEwD
         4hV+cqYZHtKZvaJTYhbdtlpaOxKl33egJIOqHf2mzs8YVrQBm8UAmYlqPQNFlsN32E52
         Cm9Q==
X-Forwarded-Encrypted: i=1; AL+hErFGwIB3Y9NnKljX2b3QkrS49XkTNhMCInl8MnPs3IuvhQCkba3MEp1Lc6m1Hq34SCqdyy1NGTi5j+PdMEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OCpV8tl6vrPIQfRW10s1awNoipZook5JgxZ7D3oB5UremW0CN
	x5iC2rie6ZHlGbQENhj0ToBsFenEY21cUZwm9+IlDlKgbS3ZtDIXusVO88PcUPOM/Cis13WfB45
	CWb/SYqW7y7UKSE2hOZ1vVFbPtX5E2Z6IDrFdEfL0xCVTARC0iMZ6rQAHBDEK7okm9aTt+YZDSQ
	==
X-Gm-Gg: AYBFou2AOlZoY78eMGtSDegOvxHR0WnSgmeieMAvZKSfKVJxxgPp55g1oFD8hsFf4Oz
	qs3Lhi5QZpQlVRqP5NaIYmytP3BilnQtMHgep3/nxqEM6VEjH4Vz3YiGNVK0ERn2QPLP75jCfyv
	UEdFKl6QfejGapjTF8c7J6tV4POj7qqJl3iQVHqTsyCAPNQxi5R5T9wLTUpE2buknTWJYVQ3/Se
	Fza72w8CX2zvCA4p9GVt89cAU8DV9Fo17+qKckHMhDlpiN1ejzZCkJKKDzqEtfNVjLy3zB+aWpH
	A6UHwXzHC1hYzKHkEUdfIZ8HmD2OqPgtBPiIAPCzIBGPl9mZ7XZKS+pcFeYsM+d7u9+Sv66OEZl
	cM5XhWs47E1n2kVekJvJqboDdVFqhxI+CaZCBm9unexhU8sjpUXdeSRAtVW73dkHyS2ECQ5NcYm
	6dJNfb+7ZCZXsZLkOy/h81vD0ryhdT89AWNH2Fgy6vV6j0I2JjYAEmaePqsTFi0Pw7QQJq8Fg=
X-Received: by 2002:a17:90b:3b8b:b0:3b0:a4bf:b90 with SMTP id 98e67ed59e1d1-3b0db69fddcmr1676079a91.20.1793952010664;
        Fri, 06 Nov 2026 00:00:10 -0800 (PST)
X-Received: by 2002:a17:90b:3b8b:b0:3b0:a4bf:b90 with SMTP id 98e67ed59e1d1-3b0db69fddcmr1676053a91.20.1793952009929;
        Fri, 06 Nov 2026 00:00:09 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.06.00.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:09 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:56 +0530
Subject: [PATCH wireless-next v4 19/21] wifi: mac80211: add mac80211
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
Message-Id: <20261106-smd-v4-19-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX1ZNibNjaxNmp
 bci3sb+sW8Bvcw2UwVgIljDqh9xSkq2ISg/eySgkO+FSXY3pCcgvo/B0nSuwc0pcZxG+Jz1H3we
 JXc2tWfJ4b2xv664sJzm6Y2YUqZ2K/w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX/HG0TubgimW5
 z5oJZ78zNnmiLdLjopspomsp7dngo8emmEqfm/wDYVZOsE3sd7SFlXqV18ziaXvWdveVZaemM2L
 FHw5x/MpNTXXfgOWe0K1dmd7ZcaisBoplNbTtKOQg4X+A7TevVtxb4X+kLojv/TCVl4xlE4ddKO
 jfIOHpobDGa8X0OGWQbsMPXIr++Q0ZXRHRf5HosBA0nnBEKgzaUiKfeAi1cM3rFOo2Yzn2JoSWH
 jfUoQCKt8/4HuGAti2mVJOTEE1CTlVT5v8V51i1UAA+xqi44wkaLxFN+BsITtmkwCiCVZv4foEY
 vKWWVSA0e3wQrwP5daeDyhOTK6y5Q2cn2g5IRxo9ek/iiSdcEC8PzvlKDDEPbc3gAkiJwgXSsC8
 yOswrEW9FLOD50Clqr4MLqTtj0XkRlY5joJMskdgG1acmVwXpCDg0/CdSGspbUXV9xju7qyTxma
 LEeugr5HdiLZfyoLA0A==
X-Proofpoint-ORIG-GUID: Mkl1rI-kc55AdC8LN-vOxtf5_lTHKB6g
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed890b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zHDNONmbSdC_GOYWSZkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Mkl1rI-kc55AdC8LN-vOxtf5_lTHKB6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

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

