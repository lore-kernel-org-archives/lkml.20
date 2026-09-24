Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00AF3D5C23
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217711; cv=none; b=V8/hLtDDMETuJI5+L0nX1VFF30jDLWLZkN8Y8RM0D0GQkypC4RhzeXlYq7lQRj6nvIJWBPLjUHY9gmIYc5VDzRTjkYtC2Mm+7WJijGNgCGoHedzq9fec/9U/KglmwKU3bIgqglJ6ahhXPa6+o3T85Kr0lsBuLA80OeOX8XjZx+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217711; c=relaxed/simple;
	bh=WCja1zMpIWpAvShJZ5yorR/YcVCtwzNTE3z3uAWcbDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YqNGy7JSIn9RGZ45E17QLW7miywA1nSCaa+kcZ4nIIAIRQw2hqeWxtacViryVc8SEBCSCa4bQyAGBr+JjilvzIMIyRnf6AHp6QdMLb0/brrokaynZqt/AH366xsfovK8zJ3kWRJb9cVkcKYXIZSqeV2NhnuxbgorWmWP347nmsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jj0HHMnr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EqplB3zC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jj0HHMnr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EqplB3zC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O2K2291316988
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/twQYaftVTGoKuK359yIkzi9M9zMZOVOhOpBlAzba8=; b=Jj0HHMnrq1Q+FOzm
	sB9En1O5XLelPGwlL6KRP65h733KZjnVoxo+ZpqDQ/gW7te5/xUcbmxnkFlvT/MS
	7Lqh/WTWG+X4CsRZtteQy9fNb77xdRYsd6npccjAI9lLOEMN9fVSaQaeb7H6lbWk
	vvinkWDrxkygOeV1IxeXrt+yZ0LjvQcDdZ4HCXdvjBKe9wsv0fFdeEQxRhp6m/kf
	0uDHRGNw+L6IKBTaW53bgDI7VXFbobyBWJ/KTRWgTz1qrbGe7xOZ2kTEHqUxZBb+
	J4MZ+RhAAWbGVaHelEIsCjnALF4g9lGlWc9Rohy787x3smDX6I8rs0vSqARjdeOb
	7MfeoQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbjwfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so2909131eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790217707; x=1790822507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/twQYaftVTGoKuK359yIkzi9M9zMZOVOhOpBlAzba8=;
        b=EqplB3zC7DZS3MMq7V8rvoItZSyzuJS/uToa2JK4qUIZLT22I/lH/t+9gBytDIJOVp
         PahUoM0847vcO3SY3XY3wzNTnl41HGHiELEEMKohPaYfL1kEzqYodEQFdX5sYGbk85Br
         rxXV7dLzE4gpacL2g8U2RKEDZqqHIwPeC/a9V0oqKh3ZAtK5wjVvDaS1lQE4/6QVmA4q
         t0AFsFSpLxeo8Zo6CzuGAZi3FhzNJ3aaDq0BBY5ArFxGtpp013hs+inx4XjxUZJP2aU3
         ofdlrsBShJgrkrvUZzta334E3U2tVVKdoWrwnndbRwcNHJZQSpZKDwYIgHcHVAFtsz21
         SjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790217707; x=1790822507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/twQYaftVTGoKuK359yIkzi9M9zMZOVOhOpBlAzba8=;
        b=Tmh762kFGFPkD0apCfKrCYks3oN8SW2hpe3kuuCJ3wJLK/DzjaeSXgh+e1IN+J7XDo
         6pavSOkfXQp/F26VyTeBsj8vGrqkhF+d3kUbNgDtfy4Ql2z5tPMdFaRsrnbNDk0EVMVc
         S9KZqWem/IpxZ8c7AQWuS5+720mKwQ/Q5uulMDsxndqipnlgZ5PKFAjy0RLvD6CDNP5a
         CW/5F+U6MY0uDaUFsFBJK9e7Ms0gazoqcb6pQR5k5z4lfzf2K4XqJTiVNLG1EuGfqglA
         pd2VN//8xN46a+JTQIIS9x9aTgLx8ewi9mc3Yf5Cbc++zwwOfz2huHuBoHhhCCBcPMAH
         68Hg==
X-Forwarded-Encrypted: i=1; AKwUvBwHeB49mfjm7wwXb4615XKZKHq4FIHFdKsaTwQIo1SE5dSfqpFBMVpPDST3pjiJh9WhF3Mf3IudIhw44XE=@vger.kernel.org
X-Gm-Message-State: AFuF++np4TQl2R2xC+NG6LopSsTAYOhkmEP1RJLp55B9kfQOK8yy7rnc
	wvfbfjteJQw00VxMoXGNjMWtr3EBMBX8kSrhgDVbtNl1tRXjlL6NWk98MUALg3rJ6Q1tT38zXjZ
	Ajr/9NUBAnLQ96t2apzL+lkeJ+xTVuCVUKYUAx2iAARorY+tLEdVn9Zr4g1ZsjgEr5g==
X-Gm-Gg: AYBFou1BOKWJS/GkTkf4bBk0pHc0Nk8svURmC9g2FbyGxP8KNl6geFqNAa0ozvTGyIL
	SJ93ktJFkjMAq1w7ctrqKrQcB8NZ9LeiPuS5TLC4ivbVYpG5Cv5l8eNMhmuAgghN2kjLo8F/JTE
	wmn2WrU3arVzTZePzk4xt59lPSG+5qT5OCSBxab6zCrbGBMzeC20gzO2W5XKu2sdVMZ+DSo+Ecx
	pmqjjCk+RUgVMdCu1ZDM2pxaCsQ9DPOwsowPwS5xFlkOHWp6EuIM9G6TsVbuOrGz/zKYy+/tSd3
	gK2QYo0FVQVhi9zyqxkVdYY+XqWTMCZ8zOS2qF3B/pqg07Wfp6Vt1v+4j2lQPQsHbpip7PyYadh
	NKnKAh1W9Z5K59qjUtq7Vjb8u+08MKVnRlBxnVmpNM56wi3yiSKboV0VxZJpp+yEY8STPGWcRPU
	lm8Jsr2RgJgw2qWn/BdxZWTw==
X-Received: by 2002:a05:7301:b0c:b0:33e:6824:9f1c with SMTP id 5a478bee46e88-33ffe84f086mr723323eec.9.1790217707259;
        Wed, 23 Sep 2026 19:41:47 -0700 (PDT)
X-Received: by 2002:a05:7301:b0c:b0:33e:6824:9f1c with SMTP id 5a478bee46e88-33ffe84f086mr723310eec.9.1790217706664;
        Wed, 23 Sep 2026 19:41:46 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm9692263eec.12.2026.09.23.19.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:41:46 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 08:10:42 +0530
Subject: [PATCH wireless-next v2 05/16] wifi: nl80211/cfg80211: Indicate
 STA creation via SMD BSS Transition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-smd-v2-5-bb40094da1d4@oss.qualcomm.com>
References: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
In-Reply-To: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfXwpxRE1drZ8wH
 CeE8G9SLg9Ii1n9Wqh0nSWBfh5ilFuZFzwT8mGEyNTNdKxf7DzbTdIAA62XSjM4A53CpZf0QRjd
 I0vXuc3qlQ22HfqxfE4ztvHWziSqqAI=
X-Proofpoint-GUID: MGFHdQ7IojeFUzr2SoWuF3suFW2ErSzv
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab48dec cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YW6yegcWvZZGXztGtDAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfX6jYzzbGyl7V1
 cmRUGkbEM/7/gVdw4bWITXsWm+P041R1StblX8eihzD385VZqYziS5aFGk9fP/qclPta1skkl2c
 UZZdV2kYXDbePp9kdbHMg5sDCfRH0kadYoWpKBjCSKSiJfqe3O42Pgf4wZ+WFLNk1YRM0Y1aPi9
 FRmgsUY5zXFM1xhRIzBUnmfnyI/GsQyXDLPGC3kqDfJGu67whi6jMNMqYUL9g3tNGSvk/DhSJs4
 0uiMCft9mRnNMOLANgiPeJghtUAqER6AtOBHWSHU15gcCH1cNCY6CGXmq/4dBqoBfxvOYsdHEpT
 e2s00it+QRgewgCq0zmspDSIt8A3g6MeK3+aEbYK9NWWaLw2EEVX+aSE3OW5D8fAESHyM6b8i0S
 uCGqy0M7ZrOCcOyVMHINkFiQKgWpea98rEU4Y/Xf0jxHS1VtAEynGDuWwLZg1FUgJIkAW7NhZ7d
 lXNqQnpBn5xLKmZePiw==
X-Proofpoint-ORIG-GUID: MGFHdQ7IojeFUzr2SoWuF3suFW2ErSzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240012

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
index 51fb64a837fd..a618b3c90161 100644
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
index 265c5883e6cf..3f9acbd4830f 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -3207,6 +3207,11 @@ enum nl80211_commands {
  *	supports DL data forwarding within the SMD domain.
  *	Used with %NL80211_CMD_NEW_STATION and %NL80211_CMD_SET_STATION.
  *
+ * @NL80211_ATTR_SMD_ROAM_STA: Flag attribute indicating this station was
+ *	created via SMD BSS Transition Preparation at the Target AP MLD (refer
+ *	IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.6).
+ *	This flag is carried in %NL80211_CMD_NEW_STATION.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3815,6 +3820,8 @@ enum nl80211_attrs {
 	NL80211_ATTR_PEER_SMD_MAC_ADDR,
 	NL80211_ATTR_PEER_SMD_DL_DATA_FORWARDING,
 
+	NL80211_ATTR_SMD_ROAM_STA,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 76fb83f61b89..eee6ef08950d 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1118,6 +1118,7 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_PEER_SMD_ENABLED] = { .type = NLA_FLAG },
 	[NL80211_ATTR_PEER_SMD_MAC_ADDR] = NLA_POLICY_ETH_ADDR,
 	[NL80211_ATTR_PEER_SMD_DL_DATA_FORWARDING] = { .type = NLA_FLAG },
+	[NL80211_ATTR_SMD_ROAM_STA] = { .type = NLA_FLAG },
 };
 
 /* policy for the key attributes */
@@ -9290,6 +9291,8 @@ static int nl80211_set_station_smd(struct genl_info *info,
 	params->smd_params.dl_data_fwd =
 		!!info->attrs[NL80211_ATTR_PEER_SMD_DL_DATA_FORWARDING];
 
+	params->smd_params.roam_sta = !!info->attrs[NL80211_ATTR_SMD_ROAM_STA];
+
 	return 0;
 }
 

-- 
2.34.1

