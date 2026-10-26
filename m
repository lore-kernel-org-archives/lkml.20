Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992643;
	b=0FF1BJfoVZMkS5+Bs6JbD6QCRq9iyvJIA4Zc9u5hDhxR83l3db07q5M7xQZJCZpkgwUh
	 r+aFwmSS3RTFEDCrpkC4LPr/SLinc/RiZa1kYU6JXbLShAn7jt2FIsgEEOwlUUfd1fp5t
	 nRm2e1t4dfHbDjPa9aTPmV34iL8M+tRybxakRqTiO5eWwEObXSvJllF+qBNDLa88Hch4j
	 dO/gHRrgtNSzuAZ0uIzw3jHS9vPnLcV0+JtXm77vMiHLR3/woJdXXrH8NDR8WNozCT/7F
	 Y4GgHZ9FGi/9bA5x1DMsAUoHpd9X92f+gVYPbRygXa9SaZTZXt0lhSwHbu2RCGl1MdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RSTZyb5+uiWzqJVObvhjIHn8jGxooKwz09y219ms2cE=;
	b=e+l1Ja9Ad40bpGa9dnE7mrwmar9JUIinDs5/KqbJkoWlD32U75wBBpzST6YbZl3HZh+3
	 z9dD5lD+mpxDtnOIac3CtrS3+ZD9AWPuFFwmrUA2MTE05QosrDEuGpcTPJlECbn1+66qg
	 G/6Ii2WLL6K7Dfp17Y5Y0Exx6KgsIar8r7bUdqMybJ7eSse6TOZ8BbKk5mUljDr+tNHMX
	 rLYxhJInBNpuDiiu3keY0KyaHuc5eUGrRk8+lvtaMBKsctZLsT/AUX8xNt2TghUXA1IU/
	 MIlyHAu1tAjVEbUpypIzsCMcFQeMUJSg6kvilsFXhaYmBWDlqnO10C5FnCj4pJhOuyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G6yDbX9c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=doQ1VI0d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A5F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80A5F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G6yDbX9c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=doQ1VI0d
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b7wc1907915
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RSTZyb5+uiWzqJVObvhjIHn8jGxooKwz09y
	219ms2cE=; b=G6yDbX9cxSPMI7yM7QijxKmWIRc5a22+2XKP/PP2ogC73noKMJC
	KtCGLxxKVSgAD4UO4n/mqbIvOGuZgqwptDTO1x8VMaAaAMsosRSLERylYkJCQ8EK
	au8c/AocnyRrCUC19A5PeGOQ4qND6dUmBB6J+wIq4qYmUDL4sTlDQQLLbf3kFiYa
	YCtHELfcmoex0XvCog3w5XqLIMYYT3PsBK/eSvzyfaoNgcpRDbLfsNcJmNts5iAL
	R8wYEEz8ACTp1sufXGQTWVcr9k/oB96dHfwCjrTEQW4qJ3VV5AGHJXyuZlb+Fz6K
	K2cXibkjh8QGrBD53QC/C0c/dPXEQqk5vmQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gmyaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:30:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36637676140so4597441eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792992640; x=1793597440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSTZyb5+uiWzqJVObvhjIHn8jGxooKwz09y219ms2cE=;
        b=doQ1VI0dre53twnEUNSeN1ALjSaSkK/gtKr9rc4IQ2HiGYJGKROdfKLRPCNvzh54c4
         TU5Wkx6Lg+JMd7scvdHYSYjooHoDUf82VYkpX2pniHq/XnCaMh75B2IQh3jvqOs5iYw2
         U59lmWbuo8PYVAQzaZC1X+/dG/OxmYgzeeP7RNnMV4/jc+rKU50R+IM5CxUXdU1Es+nk
         +/LRpYLS13e7V7VGpyQzk7VB0yEIwjOB1warxKhleU1tF2+ye9YUnVhziT8YrNSCK82t
         PukTMAauuRY9B35nzOObblH/i5UhjpnMKvmpnprHg7O4mBCjyOXLMx+yJo5xqQrLUP/i
         jCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992640; x=1793597440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSTZyb5+uiWzqJVObvhjIHn8jGxooKwz09y219ms2cE=;
        b=DW5jzqXqOeoQNu/YysFYqf+5DiUNo1ILeW1LDEVqYJLLGDUM7E6JS8FDnucVjI9QBU
         rbUvBGMTPJD8A+Q6Pu1uwcEpNbKb300OSSsZvI9mFwxTEprIyS4JivUqoFr/yrgTHhc8
         ZnmdWmfjWrdUDcgZPhqrq/BNUtCKq/8ANZde7oZNtJWR/kUpKBugijFB+hAeTaXVhf7/
         2T7rR71lq8k/Ra4tCCIpZr7ePJneU4ndW0D2nTkYkrb8b3kNpX5jzqxpFR2OhWnoBtSj
         h/rsad3gHAUm9bR1O0isAHcGgIG4ctne1hfLqbB5t12RUSBfODgPXnrOVfkDQ732PcPp
         Y1MQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlhh0Dk/WE+YgtFD/d2+EjBf1iMWRqnsUtHGRu6DyCrVD8PiEnMMWuO+arSqG4n7JjCoeihMaReS4CxXo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQDeh4NTvpeM8FPkivTzFwhVFd82/rvt0Kf16Wi64w5nLv9eJK
	EHpKZLC2hM5CKe/ChNqdH2SLZOcFuL8NYdgyoANctLN2QNUrxDOLKTdWYz1Hkn7m89fQqJO6m6e
	wzOPNypih41xNYnX6MyQWLXg8l94Hd8QcwoWWijDlvjmFZwThYaDxbLY5F08xYQ42QYw=
X-Gm-Gg: AYBFou3wnSVFVdCe+4J4EzjYZYkRZal/vKuFCT8RLfuXDE661lYJpd3126UTbJNvrCb
	MaISneS4mjFLoMikFUjHD/LqL2TX23zDryz2FIWLOjXfxiTy9L7ynxu2Z3Sug867KLj0FJALTYZ
	fLTqVZj1lV1X2U/V8nqw3BVNDEry4wqNO+1J9zKomm9kye52fgcRGBVtzMmk6TOgd05PnG/fKUf
	lOLWbPizSpKKgvfuqz5dRVg8Pqt3czqCnjpY3e1blWwras58ImPzOq7IV1Wab2IpEM8BUvvt92i
	0URKm/hWZAT/ZLEPow6zafp73vdfAXCecZ5wt+Rp7oBUD71VFnvo0wGBI+1/e4sJyS4lEFo6OJ0
	Ugt0e9KrSvUa8AuYdcnf0ZLbQfpwjxrQyIPY=
X-Received: by 2002:a05:693c:8944:10b0:36a:713:a76b with SMTP id 5a478bee46e88-36a0713b22bmr374394eec.6.1792992640073;
        Sun, 25 Oct 2026 22:30:40 -0700 (PDT)
X-Received: by 2002:a05:693c:8944:10b0:36a:713:a76b with SMTP id 5a478bee46e88-36a0713b22bmr374352eec.6.1792992639401;
        Sun, 25 Oct 2026 22:30:39 -0700 (PDT)
Received: from hu-hongchen-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a03bea5d4sm2982718eec.6.2026.10.25.22.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:30:37 -0700 (PDT)
From: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless@vger.kernel.org (open list:MAC80211),
        linux-kernel@vger.kernel.org (open list)
Cc: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
Subject: [PATCH wireless-next] wifi: mac80211: preserve disabled subchannel bitmap in 6 GHz CSA validation
Date: Mon, 26 Oct 2026 11:00:11 +0530
Message-Id: <20261026053012.1668561-1-hongcheng.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NxUw3qT7XFY3BGQEUYbaIvZNlbnE2CH1
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adee581 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=AOFKImNPUqAlGEO73toA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: NxUw3qT7XFY3BGQEUYbaIvZNlbnE2CH1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX4wNcaEbUchL7
 qbauKrslZIoDpMiPpJlGzlcf/8WCBgcPtNaRFH1cSkVMkLmsSGh3PJeiyNHOjR7UgYq41QLEQ9Z
 zjTbFeYZaNOwTPefDdm3bOCSHSJjPHffLyP3Koj9yvYX8SokT9IGg1GsFf3+c3uwifVjMPVFAvO
 5bkPvez+t0YKrRNfiEfDqZusNQ5dbqr5ASMAKmfrXO5N08IeolZQadRolx0dUqCgKRbSVErhmdS
 dQBOmEo/FmbGeZsQpx8lixKxsisY1p6g3qoOW76DKJ3ubwkBkDFOouw5LpfIE/YPM9ve50WdFcO
 9MfEGPG1/Gfw4Jg+1GjnNI93kqNn7wj35EiJQxaxPYbwF7ASFmzPiAg+fSzpH6chy3eA3S3Q24v
 E+SEOAxtWF8bjofwmP2zxpuJPtMhhLYH50iorpd2t4ScWQKhSBmrzm2CsrYMiyBxgmipOmE4rQ7
 xGzCvqBLDboigVVtK+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX3xwuPGadIJ30
 j5IvBWj/WdWgcNsvPK7Za9j+Ug1zMpznGRAuqST8lzmJ+rFHeFJCDl+3aOilFD9l3xEB4CAhs4X
 WX+ijF/8aJqMjDpRJQi6ZuAlx6MOT4A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260021

During 6 GHz Channel Switch Announcement (CSA) handling, mac80211
parses the disabled subchannel bitmap from the Bandwidth Indication
element into the new channel definition.

The channel definition is subsequently validated by reconstructing a
local EHT operation element and passing it to
ieee80211_chandef_he_6ghz_oper(). However, the reconstructed element
does not include the disabled subchannel bitmap or its presence flag.
Consequently, ieee80211_chandef_he_6ghz_oper() overwrites the parsed
puncturing configuration with zero.

Preserve the parsed puncturing configuration by carrying the disabled
subchannel bitmap presence flag into the reconstructed EHT operation
element and populating its bitmap from the channel definition.

Signed-off-by: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
---
 net/mac80211/spectmgmt.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/spectmgmt.c b/net/mac80211/spectmgmt.c
index f5e4970869b6..5d26291e7569 100644
--- a/net/mac80211/spectmgmt.c
+++ b/net/mac80211/spectmgmt.c
@@ -152,7 +152,12 @@ validate_chandef_by_6ghz_he_eht_oper(struct ieee80211_sub_if_data *sdata,
 	struct ieee80211_he_6ghz_oper *_6ghz_oper =
 				(struct ieee80211_he_6ghz_oper *)he->optional;
 	DEFINE_RAW_FLEX(struct ieee80211_eht_operation, eht, optional,
-			sizeof(struct ieee80211_eht_operation_info));
+			sizeof(struct ieee80211_eht_operation_info) +
+			/*
+			 * Additional space for the optional
+			 * Disabled Subchannel Bitmap
+			 */
+			sizeof(u16));
 	struct ieee80211_eht_operation_info *_oper_info =
 			(struct ieee80211_eht_operation_info *)eht->optional;
 	const struct ieee80211_eht_operation *eht_oper;
@@ -207,6 +212,13 @@ validate_chandef_by_6ghz_he_eht_oper(struct ieee80211_sub_if_data *sdata,
 		eht_oper = NULL;
 	} else {
 		eht->params = IEEE80211_EHT_OPER_INFO_PRESENT;
+
+		if (chandef->punctured) {
+			eht->params |=
+				IEEE80211_EHT_OPER_DISABLED_SUBCHANNEL_BITMAP_PRESENT;
+			put_unaligned_le16(chandef->punctured, _oper_info->optional);
+		}
+
 		_oper_info->control = _6ghz_oper->control;
 		_oper_info->ccfs0 = _6ghz_oper->ccfs0;
 		_oper_info->ccfs1 = _6ghz_oper->ccfs1;

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.34.1

