Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951996;
	b=Klbk+E5sN89K2NeKxRhhdDnkJcDZzLDhNMb0yn0aaUVlwf15j8KwH1P9aicY+DlIYQzW
	 LRtWXW9RYwSQF4P6J0fJka/EgGNIfPuHZAplSUX5Oq7eGfDl7dewrLcn8FuO3JlMltr1p
	 jQ0GXhI0BSyOxxvgtpYLuYvRCraTmhQcLX9jXxGua+pbGeHWEEwh+EiRWp4l6uvU9uhJb
	 PCxp9G29YJ3BGHTWqH+bUm/LNIWaaDlCiP2SymEsCoUPBrjnMdk8V8sdjAQ27utDvJmD7
	 NdrQ6msJu0/0P19I0rv4aeKvZk+6HA83lhJ8RiwbMFsOGhqTOupyoZR7SgYLU1DowpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951996;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=clhys4CQaKnPc3jhrMSj1m0KYYir2kxiA5JTYn80wVY=;
	b=aUFde7Mc25ezbFzV6o3qhnWcCKl5ce8oKBFtOws2XZ7dr37SY3R7BsxWyQY9k3W1DdVz
	 72aAZrsZI/bbfeFqHEAJofr89hAPO5zud1I5I15tSws/IYxri6FuzuEH3DCgb+Ptkmb/i
	 xSyFn1ToMADFHzweTsc+pNcOXo+yrbFdGEjc3bKkCGo/A8WUgTF/jhdGksyq1RSVVkyL9
	 pkyadvJSqofD6TaRwu3Kt3jCqOj0I7PCnb38zYUVZj+OnMBGAfatFqIGo2F/9Uox3J8vj
	 PpMN6RnShjEWZqizaa6rziqELJVH1F/mJ3kMKe6+xt95UEOkwN4N9ts5Xmu4q23K6zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EfRqtMC6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlWcGB7s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6707C606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6707C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EfRqtMC6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlWcGB7s
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R9Wg2333816
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 07:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clhys4CQaKnPc3jhrMSj1m0KYYir2kxiA5JTYn80wVY=; b=EfRqtMC6tn85Q/zg
	nuISZhrULfiLsuFS9etEJJGxI9KesaExaplzK3+RxmFWzUSVM8XuzfZWooOCBALp
	SHVKGFhENMxCJ5ECRGtVAehTek34xxlj1XsvIbiIHCDXnHyeAQfiea1VaLSS19QN
	jWwC22xy4GHVynApA4SryyV29NboxiskFdo3TQaP+ZCAdSUcz8se0IhliR0GVmE1
	Tz+OiDkTZwvf9qMqQlLY0e6fKjetUfYzjeenE7+OSdHRcDHzVla57fHS9luJGy+n
	Epl+DWxechHe1L40CmrXeCy5mYf7k84RExuXQxTQEImYQfycQGiOMAyAnuh+tjOV
	MSib2g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p99tce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:59:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so1214159a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793951994; x=1794556794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clhys4CQaKnPc3jhrMSj1m0KYYir2kxiA5JTYn80wVY=;
        b=jlWcGB7sLZ4Xxg2WtIM7l9wblpGqlcxiDV6Ov2hNQlPLQ0Kmn/Rvqy+H9W+9FLd46a
         jhzF31S6E4x8jSusV0l6wdbLsplctVYP9RyUz4w83SHJ9ap2YCiOF2FUSaFUFIcogYS3
         vU3fAq1Tm2mvIo1bXUGenlCQtru3S5Pdbpc4FF5wyxAGN4muUP2z82/d2rPX/ZLrtpXb
         ipjzFpcDE+QjVyQL7jMlo3FxLevuY5EvKc9p+ElvvakKTcGfNKSDCOeKpkY6OPPZ8NVO
         MiW50712C9t1NejRVDCW3dCF6Vg7IZH9GPJ2K/Vit4B3zdsg2mA/2dHmWyFzIrcDFep5
         AFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951994; x=1794556794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clhys4CQaKnPc3jhrMSj1m0KYYir2kxiA5JTYn80wVY=;
        b=NwBavmUNwSRFuHY+g29yAkooqBM4iYOW3LAkstvXpVd640Tyu+wqD+5GgGWCobP03k
         KjGUouVdEUtqjSN0VmzzFG1nPQxm54js6Y/k58EarR3EkrvLdIpWPfd6rh9QehdJHJZ0
         dPxnbPbR1DETcXHLNDd8NnMSYkf2XbMUrppihTHbYuMgKA8lkFOKqNlfwZBWUHXKWuUR
         /345jDmBJPBURUjcQLzmW4AxeEoQwAUcy8SWs12JlxgvGB8adIkvjx/tZlbtpmtp+UMO
         5F5eYfjkRIDeGPdFvgncS87YMp+vw4t0+vPWK1UGdM7GUhEI/QzE6LUEuBmzDg7hT5si
         hdVg==
X-Forwarded-Encrypted: i=1; AL+hErEltVMRl4Imz7gVqd4XkkQYGaDNWFhuLeCyJHoWbXJR6HntyqPaXQn2JZJaVsrV4yTVQRdvqwDWZZNlfAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mAx5ya8+109Cr66FzBG8dmLaNFfh48KjI/ofnIWM1fIL2ElFJ
	6ideixqTXrxIF2qeKO9fw/ki+v5kZABPC3I0YLsDSK4hiJQ1QMEHg49Ji1wU6EgXxbMcaP4VO+T
	wUyVQeXm3hTEjpUc+IC83pPPeoPbYh0wk+ebsIqLAsJNzkleBRQ4/366Zp4H4kSHUhLrXNEWp/w
	==
X-Gm-Gg: AYBFou3MAlWXDJxwuUTfULoVgh8Osc9qRRHQXjmuuDbmoNqGmIYA5/eHP662s7NxCgr
	/UnwE9Gnm3NEHoYqfsqYZRyc1iR72X2DN6ovLbq3y+VX0qPAWw1Adi3VFUtbPXhPNQz3N96L35E
	RcIQrwJhpAv8HLZ25zT5iks00jSJoT+U19SwgWGoH9yxOzLIV6qEnqVD+8H1tbQGpyI6vIWaQix
	Waf5+mHrYzR3NnDYPgP8M6SFDzlizNKg7sOJCQMSd9HHMkLusUJLIuIh1/E7R/brWiy0xOjZ7R9
	wk23M5m+cTtNImDsFgcBIqu5J6v1ivdFhY+WC3BRjekV1Sc10bkoURNuFiufa/UEYqPCZJDuX52
	Ie2HOgWlowNLypSUWosZ2X6l1u+mO+i2q3MP6vznAnfi7KynXVirxQfR4+txbz/XpCL47R/Xluu
	qoxaJjufMAWV+Bn8ObrVZ5HRQxn+w9zH2LOPNfM4CSR/7Nwo+n/QAqakgGtZWIg8tPCuEu/bY=
X-Received: by 2002:a17:90b:534d:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b0db6d1d1emr1003237a91.18.1793951993901;
        Thu, 05 Nov 2026 23:59:53 -0800 (PST)
X-Received: by 2002:a17:90b:534d:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b0db6d1d1emr1003227a91.18.1793951993400;
        Thu, 05 Nov 2026 23:59:53 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.05.23.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:59:52 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:49 +0530
Subject: [PATCH wireless-next v4 12/21] wifi: mac80211: set SMD parameters
 for AP setup and STA update
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
Message-Id: <20261106-smd-v4-12-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: xDVxdrxKEqXGafRhwCPtSutEpj9kYQuK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX9PG3zaUl4ytR
 asRQL72qpirY4rjjtTyGRXsP3evNU7yNM2fydEh1HhJIROfhzovPH0r3IZq+LCVb26go6MTyHc9
 tPcaZiTJdGOPC34EnTHIQZPxeY32YtSOoKcL+OtG5vG30aabQVfod6HD0lkGuLU8y1JCLdHrr1+
 7tSNXp7534duDpz58kTS3pZzN4chV+pyP9H7il7JiIExBB5zvA/Mk4eyFE24tOy99tOwZXwG8Cm
 sbmC5DVjxoEgtaNUMiV7v9/8wUwPhhP2x/BCaIRDx45wfT5DCkTdcbowx0kIX1nU3lqQyqfBPfx
 AuDIeHDvtNLJUZonlVpc/mXnk0O4ObsP5+CV3C6x7YfHEih1t2FBQd+VBcAF7mhmg7Zeckdstvh
 MVDWtle4AmgUPQKXuZFZNQL9rMXSVHW7hhe3THA7TOXJGDKiHW4HJi52YjC3Pb2Z5TXNWeZb4h4
 LQ43PV4LMuushonrgiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfXwL6hEJuBDV4h
 EadEac2zHdYt2hx+FZ8PPI4RlTzv0CBV4LmY7BJKVAIJDomz8BP0rQxfVTdHsWNOc0QRbXb/yl8
 Z10nGEPM8+FoFeFgGLH1Lbyq/vf2iQw=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed88fa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=c5vwGiuQIk8ddjU8bDkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: xDVxdrxKEqXGafRhwCPtSutEpj9kYQuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

From: Rohan Dutta <drohan@qti.qualcomm.com>

When userspace marks SMD parameters for AP setup and STA update (during
association and ST Preparation procedure), mark them in mac80211 so that
SMD operations are properly routed and handled in the drivers.

Signed-off-by: Rohan Dutta <drohan@qti.qualcomm.com>
Signed-off-by: Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>
Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/mac80211.h     |  5 +++++
 net/mac80211/cfg.c         | 12 ++++++++++++
 net/mac80211/debugfs_sta.c |  1 +
 net/mac80211/sta_info.h    |  2 ++
 4 files changed, 20 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 76ff86ff9974..23a3f08c72e3 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -796,6 +796,7 @@ struct ieee80211_bss_npca_params {
  * @s1g_long_beacon_period: number of beacon intervals between each long
  *	beacon transmission.
  * @npca: NPCA parameters
+ * @smd_ap: AP supports SMD
  */
 struct ieee80211_bss_conf {
 	struct ieee80211_vif *vif;
@@ -902,6 +903,7 @@ struct ieee80211_bss_conf {
 	u8 s1g_long_beacon_period;
 
 	struct ieee80211_bss_npca_params npca;
+	bool smd_ap;
 };
 
 #define IEEE80211_NAN_MAX_CHANNELS 3
@@ -2731,6 +2733,7 @@ struct ieee80211_link_sta {
  * @nan_sched: NAN peer schedule for this station. Valid only for NMI stations.
  * @ext_mld_capa_ops: the MLD's extended MLD capabilities and operations
  *	NOTE: currently only tracked for AP STAs
+ * @smd_params: SMD parameters of the STA
  */
 struct ieee80211_sta {
 	u8 addr[ETH_ALEN] __aligned(2);
@@ -2768,6 +2771,8 @@ struct ieee80211_sta {
 	/* should only be accessed with the wiphy mutex held */
 	struct ieee80211_nan_peer_sched *nan_sched;
 
+	struct cfg80211_sta_smd_params smd_params;
+
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
 };
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 6e466f8e1653..37329d8748ae 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1864,6 +1864,8 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 		}
 	}
 
+	link_conf->smd_ap = params->smd;
+
 	if (sdata->vif.type == NL80211_IFTYPE_AP &&
 	    params->mbssid_config.tx_wdev) {
 		err = ieee80211_set_ap_mbssid_options(sdata,
@@ -2778,6 +2780,16 @@ static int sta_apply_parameters(struct ieee80211_local *local,
 	if (mask & BIT(NL80211_STA_FLAG_SPP_AMSDU))
 		sta->sta.spp_amsdu = set & BIT(NL80211_STA_FLAG_SPP_AMSDU);
 
+	if (mask & BIT(NL80211_STA_FLAG_SMD)) {
+		if (set & BIT(NL80211_STA_FLAG_SMD))
+			set_sta_flag(sta, WLAN_STA_SMD);
+		else if (test_sta_flag(sta, WLAN_STA_SMD))
+			clear_sta_flag(sta, WLAN_STA_SMD);
+	}
+
+	if (params->smd_params.smd_sta)
+		sta->sta.smd_params = params->smd_params;
+
 	/* mark TDLS channel switch support, if the AP allows it */
 	if (test_sta_flag(sta, WLAN_STA_TDLS_PEER) &&
 	    !sdata->deflink.u.mgd.tdls_chan_switch_prohibited &&
diff --git a/net/mac80211/debugfs_sta.c b/net/mac80211/debugfs_sta.c
index 690c186e3bb9..c2268f79601b 100644
--- a/net/mac80211/debugfs_sta.c
+++ b/net/mac80211/debugfs_sta.c
@@ -78,6 +78,7 @@ static const char * const sta_flag_names[] = {
 	FLAG(PS_DELIVER),
 	FLAG(USES_ENCRYPTION),
 	FLAG(DECAP_OFFLOAD),
+	FLAG(SMD),
 #undef FLAG
 };
 
diff --git a/net/mac80211/sta_info.h b/net/mac80211/sta_info.h
index 8c6a9fee6b29..54c4c613a2da 100644
--- a/net/mac80211/sta_info.h
+++ b/net/mac80211/sta_info.h
@@ -72,6 +72,7 @@
  * @WLAN_STA_USES_ENCRYPTION: This station was configured for encryption,
  *	so drop all packets without a key later.
  * @WLAN_STA_DECAP_OFFLOAD: This station uses rx decap offload
+ * @WLAN_STA_SMD: this station is associated to an SMD-ME.
  *
  * @NUM_WLAN_STA_FLAGS: number of defined flags
  */
@@ -104,6 +105,7 @@ enum ieee80211_sta_info_flags {
 	WLAN_STA_PS_DELIVER,
 	WLAN_STA_USES_ENCRYPTION,
 	WLAN_STA_DECAP_OFFLOAD,
+	WLAN_STA_SMD,
 
 	NUM_WLAN_STA_FLAGS,
 };

-- 
2.34.1

