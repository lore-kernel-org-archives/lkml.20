Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1044607B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813211; cv=none; b=ck1xK1+1KuZjqlds3gBtRpk/2r4I4kaNEtc4Tc4sIH9dkgRElf/Ur3rzdqq3rdlGZTxkj6zEZG1o1JSD1u1zUyOCkwenu0cVeXd5PKWDsGRMqMKbG/hp/pBTYEkKZpuym+/9+QcU9cN6IAkKufIfE05/pUx5oWgw94gHvPA9R5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813211; c=relaxed/simple;
	bh=vGFJQ6aAodKhtzS21oPWEsRImbjCMwfBF99koJOYdiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=phoiiUoG4fqXQH73OCFlqggcIKvExE6ntf/LFlkEj2t+v8zPUUQfr+PsLQLdrsbZ0StPOsEzceQwwmW5I5o/j1GdB459+PBUqWhNwxnygNpM9DgYTPN74N4T3JsfAo38mVf+sxos42+wUDdM/dtG9cebkkz7ybSOaL3H3Dn2rKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiGbn6se; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QA3uUY7y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiGbn6se";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QA3uUY7y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687HXE0o552724
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tmSBOtvSp+Gmy3pqLBjim1lUAAw6sE0lZZQQfu5q2wE=; b=ZiGbn6segsoLakw4
	y4HXVWYxLiKdfZtKxyeVKoWm5rUTQ1Fq9A4fVKo+E1+U+R/qQDHVMlP5XNT7eFde
	4zLO1/JSHJGSRsb8JtUU1GrhAaC/elb0U/tXbfDXfkxw+mfdsxSzXXx/8swt0Bfm
	0pJL3z/+cxKT6BIGVdQoh2F5uM0j2ewWnZwF/X7WBcaqGCdHprIeZUZtUlxJJXNz
	1qluEfE5Z1hVTmgY54Cb75tzNWLUipgiTdiqhjVGG9ps2lT5sKiDFlfbaPFKs7n5
	TVyJOokJ8xjnoNGc6qXo3Iwc4Xvbsn0jb0x0ZSnjMCmhTJUulH+H9IuHKJrNUxk/
	oCHH3g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwgffj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:33:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso353985a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788813208; x=1789418008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmSBOtvSp+Gmy3pqLBjim1lUAAw6sE0lZZQQfu5q2wE=;
        b=QA3uUY7yFSCFR8YAa+Bq4qdNAY+muwZjn/YDHzFj67iQNzWgrF3zCEkoimJazssqZK
         elH8tiftEbeMjV5BV/yBWSMir/j5E1C4HBZDJnwacNZbkcHw1pEuN6oit7oFGS3AxMaZ
         vsLnvDYkelfKS8bGWJIfYVvleJ0pwQ4HI8yIiym+5WQWlSP68SR9Qw/K05VdqBPdryFR
         TvUrbbModxJvuC4SmBdgPz3ji2QdFioTeExu4vODKIytuSuTo8FYmakn7AsJpC3MndrV
         Vfsm2ACL/KP464LwgDdO3KAPOCG9Sx+MdjL/rAVyoB0QPBMPSnNjBJMaRzZa6naRSCW3
         12qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813208; x=1789418008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmSBOtvSp+Gmy3pqLBjim1lUAAw6sE0lZZQQfu5q2wE=;
        b=hqqN2BZYKe2EIS8IQKGk6sqdgS9ORlBfqzVRKbYoGg6ciUIpZwS6Ero1NfKi9+IJgx
         moF9DMGfX9wb5hpwy0HJyc58UR7DglUoGP2ogE8pus/szA0r4Oauv+V8m3pTnrUz5jUx
         EGJqjA5ZN5QoYCcYZfLAvBD8uZiH+zVgUey6xhhIITZeKDMnrVnEcgCe+Evj0wDu3oE9
         xSKgT68IaXgNZgO48Zk8Z4QKxkyX22b0T7PKsiWYFT2cm6fLJhEGgqjZPGOqmoBxHtMR
         NmkvAxtGHd9yKyffqNn0RFip5GEqTuXRg2qPnDqJiqkgdOsBA1oCJ7fTENAsm7GgAWVv
         B9EQ==
X-Gm-Message-State: AFuF++lNldJN7S41n+aL8u5P1wFh1F3xN7qAfRNZR+Ll9eQdj6Iiojjf
	DGsMfVGQGzxBaYGd2uwApI2GCr7+5LJWz0rB1YI1/IT1zMwl/cZ8cokUebuZLjacJmuFqJKZDeI
	XuRTq3AJPFVLap/LLaSW43GkHPcXvlci0tmJAVPlIWSxjBKEL64zzxhgrZEhebo+ElZXzNGpsew
	==
X-Gm-Gg: AYBFou0f1mkpBv/eKpJXfCRnLp2P4icQHVOT4tYr/JvLTQlNJ5KwySKQHzy94iG4K7m
	odjGcCuEg64GIeHViGAlvr/l0oUsjdQgt3LyPz+nkcRHmRFahQSay0XCX+ucndzSF1/KvFM83De
	Eowghbq1PTLPL+sQYOS+qKtsIMXLG27luAzIeSNY4rpfev9SjPLgtnpdKKvID0IYt7qmSwvYuxW
	WDA5sZbmRl163yEQeJqLOmERZ8DA4uqLdXRyQivdxacKjcsHdTjh3/oll1cYnQKbdPemrSKexTG
	DZrT2xcgED5+F2cArH1e0+AlvuEa5LokATJyjM0XHRM7BYEO37z+UhiV/EgCqjlu0PDmXsfi2CE
	vfaWcVdExI/uukZZ9YR6Zj9w9RH2eBBugfwM1C8Pi8fngm5CvBbDw7GN4EII6e4jjrUk1n7EuHB
	jlS7ZxtA2H1C/zvEFuDxr+XQ==
X-Received: by 2002:a17:90b:1dc3:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39b26207ee4mr38263436a91.17.1788813208192;
        Mon, 07 Sep 2026 13:33:28 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc3:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39b26207ee4mr38263380a91.17.1788813207672;
        Mon, 07 Sep 2026 13:33:27 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm47841297eec.16.2026.09.07.13.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:33:27 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:59:13 +0530
Subject: [PATCH wireless-next 04/18] wifi: cfg80211/mac80211: Configure AP
 with SMD capabilities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-smd-v1-4-65ad4ab30fbd@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9f1f99 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=56q9xwJp3_aMvtWITrUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfXxeD8qpGh0R+I
 72EnrvzJ4LpVXvhNM94WHKDdl45SaL/dmySqQadDN/8PH2c04NKdrpRXfZJoW22eY2vblzWYqfp
 csb8Os+bsM5rZMTjL0MPGWVM0bm7iGZRJPHoW6jvVBXkhXfZeLtyk1SFoRtyHApnvM3hOESGQfe
 cSS04jQ6TX50uS0edA92FhuJzBgpyRJ6SR7SaYnIqNpJnFASVZgbwfboq2dIBNTArHzJRZAWlYv
 VBpuPC8tkQu940tQIBt5HpPLHuBWPVghhEgRy1rZvvG2pQ8x5dYI6USKi054KUavpGljV3gkcmY
 ATSjkDiB6t3L0uV43HRQ6vOkxJx5vnxEooEtGU839IXz+g1W/VtOVlZyywn9WAU+kwynBTRrxTm
 wUQ+MP3lgBmvzRA25jAZCUyKipXicSWDTcsljwR1Ob5yiOswngJzgxB4kdZb5Z2nwFacarJ6TD7
 uXZN1HsmHE4guIa10bA==
X-Proofpoint-ORIG-GUID: QOpGWBaA3wuSsv03j1gzNDxndJs5Po84
X-Proofpoint-GUID: QOpGWBaA3wuSsv03j1gzNDxndJs5Po84
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfX3T/6lCuYCdp/
 OdHmehCKyfWMJxgeZc6XYxfahC/izaD2vhRl9zrfggqXW9aY4z0qvCWNnHWRpMXvucZXJZQvYY9
 dtcu0qfIEiNM5DGDB7tegQPwPAWJhGQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070226

From: Rohan Dutta <drohan@qti.qualcomm.com>

When an AP is getting started, configure the AP as SMD-enabled if
userspace defines configuration for the Seamless Mobility Domain (SMD).

The SMD parameters are:
 - SMD Identifier: unique identifier of the SMD
 - SMD Preparation Timeout: Valid duration for a prepared target AP MLD
 - Downlink Data Forwarding: Forwarding support for buffered DL packets
 - Max number of Peer AP MLDs: Number of target AP MLDs a non-AP MLD can
       prepare with
 - SMD Type: Type of SMD
 - SMD PTK Mode: PTK mode used in the SMD
 - Neighbor Probing: UHR Neighboring AP Probing

Without these parameters configured, drivers and lower layers cannot be
able to support SMD BSS Transition.

Signed-off-by: Rohan Dutta <drohan@qti.qualcomm.com>
Co-developed-by: Aditya Sathish <asathish@qti.qualcomm.com>
Signed-off-by: Aditya Sathish <asathish@qti.qualcomm.com>
Co-developed-by: Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>
Signed-off-by: Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>
Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/cfg80211.h | 25 ++++++++++++++++
 include/net/mac80211.h |  2 ++
 net/mac80211/cfg.c     |  5 ++++
 net/wireless/nl80211.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 110 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 6461a7bd0169..d0a269f4c711 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1587,6 +1587,29 @@ struct cfg80211_s1g_short_beacon {
 	size_t short_tail_len;
 };
 
+/**
+ * struct cfg80211_smd_params - Seamless Mobility Domain parameters
+ *
+ * @smd_enabled: SMD is enabled on this device
+ * @smd_identifier: SMD ID (ETH_ALEN bytes)
+ * @smd_timeout: timeout in 64 TUs for ST preparation
+ * @dl_data_fwd: MSDU forwarding supported
+ * @max_num_of_peer_apmlds: max prepared AP MLDs supported (0-7)
+ * @smd_type: SMD type
+ * @ptk_mode: PTK mode
+ * @neighbor_probing: UHR Neighboring AP Probing supported
+ */
+struct cfg80211_smd_params {
+	bool smd_enabled;
+	u8 smd_identifier[ETH_ALEN];
+	u16 smd_timeout;
+	bool dl_data_fwd;
+	u8 max_num_of_peer_apmlds;
+	enum nl80211_smd_type smd_type;
+	enum nl80211_smd_ptk_mode ptk_mode;
+	bool neighbor_probing;
+};
+
 /**
  * struct cfg80211_ap_settings - AP configuration
  *
@@ -1623,6 +1646,7 @@ struct cfg80211_s1g_short_beacon {
  * @mbssid_config: AP settings for multiple bssid
  * @s1g_long_beacon_period: S1G long beacon period
  * @s1g_short_beacon: S1G short beacon data
+ * @smd_params: Seamless Mobility Domain (SMD) parameters
  */
 struct cfg80211_ap_settings {
 	struct cfg80211_chan_def chandef;
@@ -1655,6 +1679,7 @@ struct cfg80211_ap_settings {
 	struct cfg80211_mbssid_config mbssid_config;
 	u8 s1g_long_beacon_period;
 	struct cfg80211_s1g_short_beacon s1g_short_beacon;
+	struct cfg80211_smd_params smd_params;
 };
 
 
diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 7bb4618065b6..6b82ca07fbf0 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -797,6 +797,7 @@ struct ieee80211_bss_npca_params {
  * @s1g_long_beacon_period: number of beacon intervals between each long
  *	beacon transmission.
  * @npca: NPCA parameters
+ * @smd_params: SMD parameters
  */
 struct ieee80211_bss_conf {
 	struct ieee80211_vif *vif;
@@ -904,6 +905,7 @@ struct ieee80211_bss_conf {
 	u8 s1g_long_beacon_period;
 
 	struct ieee80211_bss_npca_params npca;
+	struct cfg80211_smd_params smd_params;
 };
 
 #define IEEE80211_NAN_MAX_CHANNELS 3
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 23f4f9ec86d0..b4b42790c5d7 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1796,6 +1796,11 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 		}
 	}
 
+	if (params->smd_params.smd_enabled)
+		link_conf->smd_params = params->smd_params;
+	else
+		link_conf->smd_params.smd_enabled = false;
+
 	if (sdata->vif.type == NL80211_IFTYPE_AP &&
 	    params->mbssid_config.tx_wdev) {
 		err = ieee80211_set_ap_mbssid_options(sdata,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 22d71f32815f..aa7aa70a5b41 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -7224,6 +7224,78 @@ static int nl80211_check_npca(struct cfg80211_registered_device *rdev,
 	return -EINVAL;
 }
 
+static int nl80211_parse_smd_params(struct genl_info *info,
+				    struct cfg80211_smd_params *smd_params)
+{
+	struct nlattr *smd_params_attr = info->attrs[NL80211_ATTR_SMD_PARAMS];
+	struct cfg80211_registered_device *rdev = info->user_ptr[0];
+	struct net_device *dev = info->user_ptr[1];
+	struct wireless_dev *wdev = dev->ieee80211_ptr;
+	struct nlattr *tb[NL80211_SMD_PARAMS_ATTR_MAX + 1];
+	int err;
+
+	if (!wiphy_ext_feature_isset(&rdev->wiphy,
+				     NL80211_EXT_FEATURE_SMD)) {
+		GENL_SET_ERR_MSG(info, "SMD is not supported");
+		return -EOPNOTSUPP;
+	}
+
+	if (!wdev->valid_links) {
+		GENL_SET_ERR_MSG(info, "SMD is not allowed without MLO");
+		return -EINVAL;
+	}
+
+	err = nla_parse_nested(tb, NL80211_SMD_PARAMS_ATTR_MAX,
+			       smd_params_attr, nl80211_smd_params_policy,
+			       NULL);
+	if (err) {
+		GENL_SET_ERR_MSG(info, "failed to parse SMD parameters");
+		return err;
+	}
+
+	if (!tb[NL80211_SMD_PARAMS_ATTR_IDENTIFIER] ||
+	    !tb[NL80211_SMD_PARAMS_ATTR_TIMEOUT] ||
+	    !tb[NL80211_SMD_PARAMS_ATTR_MAX_PEER_APMLDS] ||
+	    !tb[NL80211_SMD_PARAMS_ATTR_TYPE] ||
+	    !tb[NL80211_SMD_PARAMS_ATTR_PTK_MODE]) {
+		GENL_SET_ERR_MSG(info, "required SMD parameters are missing");
+		return -EINVAL;
+	}
+
+	memcpy(smd_params->smd_identifier,
+	       nla_data(tb[NL80211_SMD_PARAMS_ATTR_IDENTIFIER]),
+	       ETH_ALEN);
+
+	smd_params->smd_timeout =
+		nla_get_u16(tb[NL80211_SMD_PARAMS_ATTR_TIMEOUT]);
+
+	smd_params->dl_data_fwd =
+		!!tb[NL80211_SMD_PARAMS_ATTR_DL_DATA_FORWARDING];
+	if (smd_params->dl_data_fwd &&
+	    !wiphy_ext_feature_isset(&rdev->wiphy,
+				     NL80211_EXT_FEATURE_SMD_DL_PKT_FORWARDING)) {
+		GENL_SET_ERR_MSG(info,
+				 "SMD DL packet forwarding is not supported");
+		return -EOPNOTSUPP;
+	}
+
+	smd_params->max_num_of_peer_apmlds =
+		nla_get_u8(tb[NL80211_SMD_PARAMS_ATTR_MAX_PEER_APMLDS]);
+
+	smd_params->smd_type =
+		nla_get_u8(tb[NL80211_SMD_PARAMS_ATTR_TYPE]);
+
+	smd_params->ptk_mode =
+		nla_get_u8(tb[NL80211_SMD_PARAMS_ATTR_PTK_MODE]);
+
+	smd_params->neighbor_probing =
+		!!tb[NL80211_SMD_PARAMS_ATTR_NEIGHBOR_PROBING];
+
+	smd_params->smd_enabled = true;
+
+	return 0;
+}
+
 static int nl80211_start_ap(struct sk_buff *skb, struct genl_info *info)
 {
 	struct cfg80211_registered_device *rdev = info->user_ptr[0];
@@ -7505,6 +7577,12 @@ static int nl80211_start_ap(struct sk_buff *skb, struct genl_info *info)
 
 	/* FIXME: validate MLO/link-id against driver capabilities */
 
+	if (info->attrs[NL80211_ATTR_SMD_PARAMS]) {
+		err = nl80211_parse_smd_params(info, &params->smd_params);
+		if (err)
+			goto out;
+	}
+
 	err = rdev_start_ap(rdev, dev, params);
 	if (!err) {
 		wdev->links[link_id].ap.beacon_interval = params->beacon_interval;

-- 
2.34.1

