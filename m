Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907649;
	b=gm4TdemVUA4Sn8y3u4JyPRAIMDlSjWpxBK67rX7LI8j2AwXC/i/zcZTtGe6Hw0AuWLar
	 jAjOWh/WFbahg5YdztMW+9qiH4yW1opZbWTJCDb2m+8CJoE4s/jiXiw9QJpg8CQSfcTu3
	 v/fAmo/b7vDK0m/0KOU9tUNDxenHEX+IwUWJQeEgX4E/Z4xAOzc2D/EXfvmbFPFW4Vgk0
	 jm47mSP4ABrfo8//oxtTstM8DIx5u/L8hj5hMonYD8MUBCxMLvxvOUC+YXk0AIiChv1/s
	 L4swetZVyviv7HIJwvu0zcPt+C2qLeaSbSiVeGVePaih5woU6lfLjAMuKA25o5LmFHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=clhys4CQaKnPc3jhrMSj1m0KYYir2kxiA5JTYn80wVY=;
	b=HyxEPx39qLPESPfTf7vwzvJAyQgyNuWsaznQqeeEOOOuU4lXUH/M3Z1KPByKWiwq3c2e
	 9eLqY2nOUxkS4A8h5BxEaorMMBZbt4KQF/xtrfYXN51HIUKrxyjM2kD+1eWov65CQ9TJV
	 xCaQbEx0SfWIO2401pSmLVEUeArI6JLHaaLah5xrgpUdp4uA9XJmeobhp59HtjtQVkDaN
	 IVC4WWV2aUdVPDvffhweJgrR2XcqYRMNlqSbl2xTsp4D6+aVnNkfH+DH/v3HSQ+q5wW4+
	 XaarbgWr3JldhXyrC9EtO8MQFPQfYPGSCUEdVpTGV33v7Mu91AoOzUizeYIco9tKp/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FqWiSy3H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DPa8bz8H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B02C608068E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B02C608068E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FqWiSy3H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DPa8bz8H
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5He9Wc2433558
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clhys4CQaKnPc3jhrMSj1m0KYYir2kxiA5JTYn80wVY=; b=FqWiSy3Hjm78EH+O
	KbtC83PWBHmtm87D4KH/dA7CPhu21Dd3IdTqjwSK3PgH3odU/DkPsaB4V4pdppkE
	UPULm5BlYk0pgmgyDf/e121Nh2Nact8EPiMSc/YzcJhlQ6a/p7srhrB+AenNt3mh
	FAM7ES5jibpX2VlZhoCEbehOMfuMzBIfkIQfWvE8m92lM7MA9E76pEaDbxO8jziC
	hvB3eNzmSNQ7GQrqamfuUC2P1otPNKLg5CRwZk6PdyltbcVYP4YsRmr/fH5TDiT0
	0SF8Z+NpyHanlyeIJUM4IjcW1FgMcc89GzaId4Bv9a4/IzEEb4oz3U8JzmE2fAOp
	CvyCuQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd2h6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:40:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f1e7d9d4dso742283eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907647; x=1794512447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clhys4CQaKnPc3jhrMSj1m0KYYir2kxiA5JTYn80wVY=;
        b=DPa8bz8Hw8O5oVIZXr/mMOi+Psy9FOkbnEIf4yl2H3bdHBxnkpjg74TlPk0gtPUz9L
         K0SE2zUmP9sRqtkvlScNXEsAh7KYwKrgSzHnk2WnkoLrxXpALMIbEmkC6cxSyiNJDPSf
         Cx8SpDdesQETrTofnqjmU8XhyC2ykiT+d/fT2PuHVcj0at3lGTF74BcPJqa8tEytToXS
         PdQNpwRYHQ9JZojf6hDb7h6waYc9/EVTTp5AluOa1jLBi9BPfNfW+VZH5bY4nMYMcRrx
         jp1oXtUTb4QPFLsvjZ1G2ROCdNpdIPgp4Hio3NoORuDS4Sn3WeiWJhKbqodqHzFWh3ti
         VsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907647; x=1794512447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clhys4CQaKnPc3jhrMSj1m0KYYir2kxiA5JTYn80wVY=;
        b=XbsSUjBfcl8lKmNlzkRntnfGp4zapw00OIqt+/Z4aP207ZQwz7BVuBcJmc74FqvezL
         Y3gWDcN8EOHn3Ka9+jhPh8z2X5fQVwieVUXE0qtV3seC1STfJv8U41HlB5lp3JKL8++l
         GMkKkopR0+2jhBA2ql1WtdMCQmJwN1+sVWSk+9BzcJRAzYvwgkoaL+bSg2cy1JsxF9Dd
         hOuo9rEw2wsQ9W13vvGWN+Uy0WD/kc4TBJXQOPjZI6JykAw9LYry+GlajPWksp2H9D0x
         3gMcaSen2buWJoPiqsEtEagqL2fWW/aTrVXnV0NjD1Kb2Gqn0oeDvd+SFlO8BoSqLfO+
         ixIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKkK+pq73YIz98q9ln2BeV94SgxvaNvYMcfnrYAeEQkbpeCn1KQO3qiGrkuwFNtjhrZstbvaSk0zpCQiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t5aJ+KSnOch/BnpDnJ46/wfB9NopgkSAS3y/P5/POLXtyDafy
	j0e4U6IPvsKpZfdzmY/GWRCjlX05vRBND6REWbysFllQhTbvBodmhUhX2BIhtPxVUxiRqUVtI2L
	Gb4DUOua+Kc3+bhA4BsgdaC4SKv1bv429oZbP+DFTUfZnAAcesWq3VMeJyPGqmUTfvPLrP+v4EA
	==
X-Gm-Gg: AYBFou2elCobosFFz1s1ZvsRznWwfSgLYLYpkaCsZGoQpfHEyfWLDq8HV9oh5Qn6hk5
	OagZ7X7n3iQgcyJ++h3r9ltbD2VKcKdo7k7EwPgmyZITG5/TPB2oWk3HpHq/ev4aAZgH8OGH1tJ
	sTLngMq9OPWi6KONMbi4c8ypIQ79qUY0/raDPFZ0MuMZGOVSp3l7b52hqfMx2GV76dAh3usCNDr
	iDw816Jtud1mptYBZxYyhUNULzok8YNujBFK97QYZBMEHDXIViPEgP5NZGVq+C3GuGsk9r63p9T
	jCl7yl+2HHjnlzfyBllwO7vk4ZzYhzRj5e9qqE+MbqQCCUGcSxarNjl7U2m3C1tPzGbsPj/Upm3
	xtUM2yLEZBiyLEGocAN06DEMCijsw3bNu5yxDvXNGFlPar/IR8p9kvGVWWIBdgpJUhCvTKB3dRq
	cslfApTV7orLk3yMwiHTYxcBAzxPUz/6fXdRMgdp9q74D4IlLqpNvIfbwmNZRk8Me50JiJXg==
X-Received: by 2002:a05:7301:4605:b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-36f729cfab7mr209722eec.5.1793907646975;
        Thu, 05 Nov 2026 11:40:46 -0800 (PST)
X-Received: by 2002:a05:7301:4605:b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-36f729cfab7mr209692eec.5.1793907646477;
        Thu, 05 Nov 2026 11:40:46 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:40:46 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:47 +0530
Subject: [PATCH wireless-next v3 12/21] wifi: mac80211: set SMD parameters
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
Message-Id: <20261106-smd-v3-12-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfXwc/TASrHMJO2
 mhjnwJmDkzIv7RjcxS3XpGGPwmgdTIWHDNnnzvWSTcGh2gp6RgeIoQL7eFzPN737qdbhK++yliG
 A88CXQ1DFr8rVri7aTW9c+GEqBUBLnA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX8iWEPMAfH4BV
 R7+8BbfiIkTzCiGPcgEeca/3GUR7cC+ow3U/YxV8MRq8VFSMGQtMPuhCdvUexN1XCh3KfLqpt1+
 eps9fkH9mWcX0uX6zUnx6hT0zAl36IvAlthx4xA5j2tNtKOkNPrKEaR2qn6XW7IZ69lKw1Q0vUB
 fzyrnacHZ/RW+DQC4hy47UwA1eAEoh9UKBZjMzv8iRhtcZ4scuiZ6ecy8SoFWtzK1ApnRtdNbN/
 GCE8/QQ9nQKxfQYiK8783vxws8uaShVn+Uk8To2ewmTB7i85yctuHI7tDxfs15ewlxmq7gtBgF+
 DIOeC3Oo2zaCleZ+ujBEyu3tSayqnNH7O7rPKCqw8BKBvw6+bLt87vJIH95VjUPMk59rVINWZj3
 TGgMNCEg4Mr5wGGl91lg0CU094mD6hYBAbmelr8KsXSIkzi+Vo3+IYi6M+3ArDtuLvxOPB6+INz
 TBHhf+64to/4liB0tQA==
X-Proofpoint-ORIG-GUID: B15jvhWJxIpuXePcU0ZLlU23aqEqom51
X-Proofpoint-GUID: B15jvhWJxIpuXePcU0ZLlU23aqEqom51
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aecdbbf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=c5vwGiuQIk8ddjU8bDkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078

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

