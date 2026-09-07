Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC8B3E00A5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813218; cv=none; b=ZBmi/T5Nb1uUChnA5zLjKvHUmiMykMII8JXDeEKOJdlnaBzTpE3C6sGSCecjuq/y57+Ko25WxvDsctpC5738Z6pT0CAAT3AWNv3UOLUWi+megw6j67TqXjHM1qHgNqTvsi4lL5tLLMrnij7+6pB3SRRwIj4Bi/wazOMtwz1xCjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813218; c=relaxed/simple;
	bh=n6QZOZ4ipBg1ZD4KtCHhdn0h3EQTsWMtpUTn1ZHyNpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pCH62ZSx4kYCuZAlcUEDd9eDbALZU+NhW92PTydkKtWvwEsqdewWG2J2ma994E+LPOQHLh9P/MXZnZ0RR56gillsQ4EXHpA9IYQCfSyAFJ1orq44AxVGKXBkNy80C2EVJcRDNSte22zSvnlKiqrXEOKO4Hj8zd/k5eoKUCs0WP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfTHNGbA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCncq8oE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfTHNGbA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCncq8oE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7jHo1642056
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4cSKp76Wny+ccMBfbKuXS85MttxoIgTePwgcdN/NDrU=; b=VfTHNGbAqawR0xvl
	vlP2wlJ7T0WonKha64ImA46JyV07ZyMgjV5Xj5eoxcVNJL/r5A74sZxRt+tMx9CI
	m/JO2dYrQctSuTIrfIs9O7OQwRr3PCCA9GQYn0wtpWmLu5isXfU1qAJ6rmFPkzQg
	pPQLg/ObcEzhCDD3qATlccxXm2BFNfWtFq7semEPY0P5NrjJvDuJIkLCqs7xLwH9
	q/1avRtfyOi6sITix36FLsR69NeChJ3PVwK8O5zv0x6rUJbvfDdXCmlXQARm6Y3k
	iT1krPbTP2kLWdMeChZGUxnSjsdljS/5PBqaEebpayaKbQknPU0O0xXPDsGdTxOC
	MxHfDQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghruaaxcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:33:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e1da97175so4533643b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788813216; x=1789418016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4cSKp76Wny+ccMBfbKuXS85MttxoIgTePwgcdN/NDrU=;
        b=NCncq8oE9oYH4zxb6ejEsJ4DVAqGG7/SHaRWROLokS344UDWFcTOOKErAWul31QZyJ
         Yee621h7FLd7Rlhw9Bxk1ix6qKL/QvUOOP934od7JkoyqE0e5AL4qOGB+LeOlA0l2Gkt
         3IEsYlmlmgc18ZVnvQI9v/2f5PBV3hwE79TE+EcpMrduR+vxFyY+RpU72wrdpMJcqcQ4
         Sx0QTk7mIaN9JlpGSAYfQ2GSXv687vPIElBcDaBIaIg7hdrM4jFX7FLEcXFc/NLEm6ME
         QnLXWOdHuAEAmCCQdp6FNjQ1JVdj+Kxz65Fz6mrc0hrMWbHdvqS95VeAE6lFZA2+4rV3
         Uc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813216; x=1789418016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cSKp76Wny+ccMBfbKuXS85MttxoIgTePwgcdN/NDrU=;
        b=a/vUGkery+1wM8Wr0G38IHLTWYD+ObgC4RN8TyFu7xUkstzLjgQJ9iHpTbOi8lZKbl
         DmmseVhNCXRb/AlziO4Pc/Rn5UCJFG3bVNdP+RrLHZ/WEhrv6lJ0BcVTkmxdOEl1IX+R
         ozqO9XaSykB0N3XD1v5ixnSV+wDdMdxAlG4InW6W11uaBnQGoG+1UjYmMBFjlaCDvBD6
         8RuJ8i1aJfxATWNyk6Yj/BywJturi/Eju+pvF8u1x68HA3Nma+8Hbtr0xXV5SIBT/w0k
         1GoKrUEeaHao0Hqm8kyEqSIBsHz/RFu/6eWPw3a3e5mtMO2u58P/B6LBwk17U01VSdDe
         Vz9Q==
X-Gm-Message-State: AFuF++kZ4gd494mgFdcL2DFgEM2ForyZjVtRlwXx+s0ARm9itlEWn+K6
	mgKY2suHhN+U0+zb1Adyq3AMhxgqHQdMmT33WJUh9y0SqhG2yTSMb/2fMoOLWaOwXEgktgA8HAq
	P86pN3RrHilXNjw0ksDl+ors3QeLeZNsLuUbcbbEyK/7rLrovb56nLkfhkRtV6wCZeQ==
X-Gm-Gg: AYBFou2YN8yXMl2u8LhXECVu8w3QZbBERZI6oGJPtguT18CyP9YbAG/Ak6J28vGp1qr
	0lDJms1UEa24SUdGDKsPcwlX9viUSxmpgAtYQk/GDuDoeoN801ymnfxw6qvenhFS1OVc/k9sUKg
	fRs49fAzo5Y/h9LWLoTd41WSJLjbOsrJMSpi4fELHD3vivn5OJnbFyXzUAroGTQlZFb5TxLOEfx
	w1fQPUVdUGFwAbnl2g9qoe6Ene/V2AMCLD14zIxDC3PPZSZR5sZNzST5eiBewx/jZThi7UzQCmK
	C8BInBkbDhsrjo6bwwgok3upUbs4vlTk4OfQDh99pYnpvh2tORnfKAf3re552Kw26cb6yCSwwEV
	p03pJEMJ6o985Mao8JnMilm9BC3A6F3604FpUYIC4NdML//6XPGK6t7Jhen3pTxJmFzcGQd39Mu
	qyfTil3mbEzYASET/0RNdL5w==
X-Received: by 2002:a05:6a21:2983:b0:3d9:6f0:b42f with SMTP id adf61e73a8af0-3da39fd0822mr41240283637.17.1788813215926;
        Mon, 07 Sep 2026 13:33:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:2983:b0:3d9:6f0:b42f with SMTP id adf61e73a8af0-3da39fd0822mr41240244637.17.1788813215525;
        Mon, 07 Sep 2026 13:33:35 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm47841297eec.16.2026.09.07.13.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:33:35 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:59:15 +0530
Subject: [PATCH wireless-next 06/18] wifi: nl80211/cfg80211: Indicate STA
 creation via SMD BSS Transition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-smd-v1-6-65ad4ab30fbd@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: bYrbM4jcBrvHTRjt-IT1SP4rPORiUUV1
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9f1fa0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YW6yegcWvZZGXztGtDAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: bYrbM4jcBrvHTRjt-IT1SP4rPORiUUV1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfX2+AMBckw79qB
 lzwkcuqooz1HgcBHviVCnal6qTQ1E5Q2fpopnzQJsWrG7JqWNXCMveIFkD5Ay7OpJi65B5v6A50
 3ZyiafWD+dRqDC6ZQ4cnybVLyYpGKj4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfX7U1Qf8DhpY4E
 CsgZnewip4vS9XFLwjRq71iwKcaUwsoOqHjlfmSQUcZ89zQt+g0PIFRvdLV2M3FtRvi7PdyJCkk
 KW/4XlODPfNtGsnmvkIK7rRIPj0Z80jJw7f2HJKLMk3dVQTeswih5yXXC/duz5gkHyW0TndhVO4
 FCPEhHLLVZL6x+xZahB+a2xRy+FmB/sHvIcInmz0z/yxTYTNmCDczWLSHgwe3RTT0DYBvWKLTR6
 CS9tEtD4zY+11HmYNMfHY4Etz18qYWxxNs93Y+H8RlaoT9DuiBl7E5QUhBWo/suEfIVAfJnOOL3
 kPtVmwyTGXdveSd5wSC2D4qenu1W67Conc0C1AqX8ySWx+VA6GJORU2+VCv18a+S4zFnK+nPVNx
 7l9q+EUdJpdy6jNo39Sn3oYyhk3Zp6Mgjord1miWxxZ6DsDEgYuClt5QALU70PpYtsiDpeoyVTM
 mBqdDM4RHPUX8oI5D/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070226

From: Rohan Dutta <drohan@qti.qualcomm.com>

When the peer STA is created via SMD BSS Transition Preparation on the
target AP MLD, indicate that the STA is created as part of SMD procedure
unlike STA creation using typical association. This indication helps the
drivers and lower layers to prepare the STA for handling ST Execution
and datapath switch once the ST procedure is completed.

Signed-off-by: Rohan Dutta <drohan@qti.qualcomm.com>
Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 2 ++
 include/uapi/linux/nl80211.h | 7 +++++++
 net/wireless/nl80211.c       | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index bf33cf5366ef..75d0123fbb5d 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1903,11 +1903,13 @@ struct cfg80211_ttlm_params {
  * @smd_sta: SMD-negotiated STA
  * @smd_identifier: SMD Identifier
  * @dl_data_fwd: MSDU forwarding supported
+ * @roam_sta: station was created via SMD BSS Transition procedure
  */
 struct cfg80211_sta_smd_params {
 	bool smd_sta;
 	u8 smd_identifier[ETH_ALEN];
 	bool dl_data_fwd;
+	bool roam_sta;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index f1d8db31f17e..5e474fda2a49 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -3202,6 +3202,11 @@ enum nl80211_commands {
  *	supports DL data forwarding within the SMD domain.
  *	Used with %NL80211_CMD_NEW_STATION.
  *
+ * @NL80211_ATTR_SMD_ROAM_STA: Flag attribute indicating this station was
+ *	created via SMD BSS Transition Preparation at the Target AP MLD (refer
+ *	IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.6).
+ *	This flag is carried in %NL80211_CMD_NEW_STATION.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3808,6 +3813,8 @@ enum nl80211_attrs {
 	NL80211_ATTR_PEER_SMD_MAC_ADDR,
 	NL80211_ATTR_PEER_SMD_DL_DATA_FORWARDING,
 
+	NL80211_ATTR_SMD_ROAM_STA,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 0d20c2ab3d5e..7577eb31ff65 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1117,6 +1117,7 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_PEER_SMD_ENABLED] = { .type = NLA_FLAG },
 	[NL80211_ATTR_PEER_SMD_MAC_ADDR] = NLA_POLICY_ETH_ADDR,
 	[NL80211_ATTR_PEER_SMD_DL_DATA_FORWARDING] = { .type = NLA_FLAG },
+	[NL80211_ATTR_SMD_ROAM_STA] = { .type = NLA_FLAG },
 };
 
 /* policy for the key attributes */
@@ -9289,6 +9290,8 @@ static int nl80211_set_station_smd(struct genl_info *info,
 	params->smd_params.dl_data_fwd =
 		!!info->attrs[NL80211_ATTR_PEER_SMD_DL_DATA_FORWARDING];
 
+	params->smd_params.roam_sta = !!info->attrs[NL80211_ATTR_SMD_ROAM_STA];
+
 	return 0;
 }
 

-- 
2.34.1

