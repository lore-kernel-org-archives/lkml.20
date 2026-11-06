Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952008;
	b=ktjMisQJ33DpIBA6KHyxJqVolcIRO01bMLqxBgVFAuY5x3K58H6XiF70cl1KZkfASKgF
	 Tg785t5GyfTFbSnNb+8oWTZl1h6t/KAUiT1TifP07WyBV5ClRgsxvua7afAGNw2NvugSm
	 NKYdlMfI5eWN5Jp5ZlT2wVSJX+2mBK6cpXUE7reYp0gdyUfbmQEHpEUCv4xNhiU7mUf7F
	 h8FVAoLVq2EPuW4nR4yLsPEKh4Vod94Z/1RGxDIlPgSHoPdcvlx2QsQ9DOHn+Qlqif+FT
	 MW4ejKn44aPSAl/I7txoE0q3kIIwmj8Ge92DzKy+X6q6AaD8ModX7dFCyb12j4R6cOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952008;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jshofKC0QdDfPF/zBkVJlmFjxY3GE8tXQO7KwbzIz1k=;
	b=LMqNqghXvdcR0VTh26Vlii20bBdW950i7BfDN4ZIn6x/hnGf5Y5PDOi4K023tVRm3t0x
	 liZom10PiNHdiOXZyze4+yZZgeXn4Dtt7E53pTJzAndiJccmJG42GluYYtF/ZxcL4msPG
	 6itMJp0tfkiejhKG8kI179XiMNTUS/II8cBMfkEhPSgOAzIeIsUigcfam1SDXkt+MrUIZ
	 sQme2WKaSE72zHdGrkXN6YtMI+kiKqGOw/kAoPxaUa5BYVWB9pGQpE8KdiVXX/fkRMUy0
	 YlrX83ZfVY4p6mRRlDKC1xg3Q72pP+qEgA8/l5qd8NK+m/7u2eTU3xkW71sI1RgC0mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kvNXp2v8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PunsyVGh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532ED60A2613
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 532ED60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kvNXp2v8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PunsyVGh
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RPIS3906894
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jshofKC0QdDfPF/zBkVJlmFjxY3GE8tXQO7KwbzIz1k=; b=kvNXp2v8lDGWCcMk
	1WyFV+3BqaFEcaGOXk8/RHoChzEJEEkMM/fbsC4yn8JBm1O6aiAvTJgeooFEwt2d
	WfuhPkrs4JRc/zRi6FOHFs1DtgVyIA5yvkHKF3p4CREZNClrFXt6L94iGLo5U+76
	sLmfxmNuvQou2NezVJJicjCfFiG5Z04ZaJAMoYUGRUQJ2BNvaMowWDZkXjMV0+3f
	jAGrrSAznM73sB/h14Rwl8ySCgjlNjDIFP650Ui/zSgTCsQsIg6KRvm4RCy6e6u3
	EX/cfS4PtbtM0KT0neoWGVG1IgrkHx0Ju7zXJ0AxmZHJs+4ZBiGUZIG1cdT2IvJq
	SNxdKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pasqme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:00:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a3ee64bbso892981a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952006; x=1794556806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jshofKC0QdDfPF/zBkVJlmFjxY3GE8tXQO7KwbzIz1k=;
        b=PunsyVGh3pfQ8MheGD/K2cwFRB3D7BmywCeZXYkjlHJbSWqF+jaH/sZtW0i2iVlCgl
         Z37lm5z3vzeQJv4NwjZ1TVadLxACbzgFV3xS454jnYsxL3B6mUGcoTZBwHR9Yhf78EcV
         Yd2zkbmcondW/1LKkMOFNdWVH6iyEbVZHpXSVwwpYG31dts9bhGNH4S0VyoFt8okeaDr
         CorW4rMISM+Fyx7E++Eyrw+VWC3KSjp0X4uucI88Kl17aSliJ+fQTaqVw8EzmATgoZR1
         tfatvYRtUu+tGmy3WUTvin6TjNe9t0qDcdErp4jBLWLAap4RRQTloLwZDWuJSzKo9tC+
         PIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952006; x=1794556806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jshofKC0QdDfPF/zBkVJlmFjxY3GE8tXQO7KwbzIz1k=;
        b=UKcDn9mDSUqLn6rFMamXmuoGoe2135d5eEs+tDW5vvCaoyKmjag/99KRJ76mftAPwT
         0ulUqv/9bdCSPEoyoFPj3JNlcLJvA97zCiq/lX3mnPG8AVzyCdGDA3jR3jWEYNjhaM8t
         jc7QjOCqzjvi19RCI/9Rs0lAshfiPLeLErNpbHy+tPNtBAm1YUJ7DqY4pr7G4SWj5aBg
         4JO5vlfjbqV2Wo7ot5q7mXFx999oYxYDo2dVAK/1R5MKHqfpjEb8s+6XapHsNgBIfUlP
         dW0wZLnMOGqF7t7RiVDe3UgwE2ZdT+aVu7hyLNqrHbn3df6aaYzpqkM2wk6TsPGBGDuV
         l6WA==
X-Forwarded-Encrypted: i=1; AL+hErHKGaK+Gg558es+Aj9FjsiX5t9vOS3+1R8k9XZujYEtFdvjU8hkgeZ4zV2n3t+Bbr25a8NA2+reMbaNccs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hs4sohAHLZ1Vce5RZpUjUx0HKvfJSAk4d+qB9WA+A5mjjF+3S
	Y0UFbGTY0Y9Aij6F5ZZGtdOjDZckm2oASlbop/0LD0mrDYA3kO6ugieEYr0474qkrJXUQuib1jN
	mo4mARHoSlMqt0lzTGwPg3YX9uFG625DIzAYfbynmP2WDr62xHmlF1Px3eVJy7z+Nnw==
X-Gm-Gg: AYBFou0ttO5WCqQ6WgLh0jVeVilm7Pat5PekDveie2APwpK1XFg+icieIV4vi72x8+Q
	bKbGnSmP9ud4l1lDkmWam9ZixojzqZBsuXObFO1LVP+oh2liww4ZRjzKcAYAa7pBShYFCq0JnN+
	YfM8ruesMFoDclxO8YUGpePwkrPHVCk0YB8QL//zB7MhkfHBDaLT2JLbzXlDiTwjZpdfw7oo6lz
	u9WctGvd4NS+7aTrtf7ogQ6qy3nD8NjpQT1IkTCvhsxI27hwaH3s2gFWBgDS4kgXo5AR+aj4m+v
	wzAwNxvuHdciCFu1aaW0/94XHaPX6J3C5hxPbXKyOGVMuWih5ZzzW0HLtSHgya8QyD8Ou/L01F1
	bE20s6YzWskaFVPiEHH7jgTYaPiUxQJVO2OsIhYaxNzBRZ6Z3w0MIE8vnY707QKYkG7jUOVdEbo
	JeslXZOlmzvInOqxIAgaSQoB1Sfljv01AA54fzbOvKErjTdfa/ir32nws1eNB7EKMCgxOZawk=
X-Received: by 2002:a17:90b:47:b0:3b0:ce1c:e754 with SMTP id 98e67ed59e1d1-3b0db70120emr1678497a91.62.1793952005670;
        Fri, 06 Nov 2026 00:00:05 -0800 (PST)
X-Received: by 2002:a17:90b:47:b0:3b0:ce1c:e754 with SMTP id 98e67ed59e1d1-3b0db70120emr1678477a91.62.1793952005189;
        Fri, 06 Nov 2026 00:00:05 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.06.00.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:04 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:54 +0530
Subject: [PATCH wireless-next v4 17/21] wifi: mac80211: pass rx_data
 directly from ieee80211_rx_list()
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
Message-Id: <20261106-smd-v4-17-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX7EL2GH3sSlCp
 9I2u6lMagF+3cGnzBRGS8vvs6zgZxfS6laRXx1cOEt1GXp5heraX63KRJrJyXVQ8+U4YVGPB7Fr
 mlXzFPFb+tM9rvGVfMoOpKYW/MPxID/+9vYXw/fFNgT9AI3Bq/roWWH/pXamgOUjAyhZTS2A0pO
 Watsty0r2kBTt2ZKNmTsv8d1HL2HzUjDQzNQYJhVXaDjqamGngmT8zfnf28J9tlN2gbTJgAQAwE
 5IxQMptI53s2O9A5VeBUe37fc2Iq2Wnq5hbpgxANnJDYtEp36kOqzY2T11pzjC0uj+yacuvMqRF
 iEkMUvrGfy3XlutvMRh+jk4PtNV4DwdJN0mYofpnkjQOByeAJDrXPTU0wal0jl6dg4998t96Q3B
 h5m/adj4IsnRzGOeA4Pz2KDvQgldb2TV/jY5L5pbcHhkw4Rj4em/5z8ua1SRmuWngDzV1kkC8Cy
 taMNRE+CrJBQIQrfkRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfXyKWBOpoRUyYC
 mbXm7YK8v8rUU0fEA5fTSsRrD5sry/yf3L9xj28zRkxivBOunJkJyAqqFf6nAcI26JSSHFr7kYB
 h/VXCW6lGpatwXT1+y0/YqTnO6ohz3U=
X-Proofpoint-GUID: HSbkWPzkQbype4ov5hX5I4zqPvcFQSji
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed8906 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QaRRATVtn6WKYfhituAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: HSbkWPzkQbype4ov5hX5I4zqPvcFQSji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060031

rx_data is currently defined inside __ieee80211_rx_handle_packet() and
is passed to the rx handlers called inside. Define it early in
ieee80211_rx_list() so that new transient data that live just between
the driver and mac80211 interface layer can be passed to the rx handlers
as well.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 net/mac80211/rx.c | 60 +++++++++++++++++++++++++++----------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 12ba9fbcc983..78967ac95343 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -5374,7 +5374,8 @@ static bool ieee80211_rx_valid_freq(struct ieee80211_rx_status *status,
 static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 					 struct ieee80211_link_sta *link_pubsta,
 					 struct sk_buff *skb,
-					 struct list_head *list)
+					 struct list_head *list,
+					 struct ieee80211_rx_data *rx)
 {
 	struct ieee80211_local *local = hw_to_local(hw);
 	struct ieee80211_sub_if_data *sdata;
@@ -5383,16 +5384,14 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 	struct link_sta_info *link_sta;
 	struct sta_info *sta;
 	__le16 fc;
-	struct ieee80211_rx_data rx;
 	struct rhlist_head *tmp;
 	bool rx_data_pending;
 	int err = 0;
 
 	fc = ((struct ieee80211_hdr *)skb->data)->frame_control;
-	memset(&rx, 0, sizeof(rx));
-	rx.skb = skb;
-	rx.local = local;
-	rx.list = list;
+	rx->skb = skb;
+	rx->local = local;
+	rx->list = list;
 
 	if (ieee80211_is_data(fc) || ieee80211_is_mgmt(fc))
 		I802_DEBUG_INC(local->dot11ReceivedFragmentCount);
@@ -5424,8 +5423,8 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 	}
 
 	hdr = (struct ieee80211_hdr *)skb->data;
-	ieee80211_parse_qos(&rx);
-	ieee80211_verify_alignment(&rx);
+	ieee80211_parse_qos(rx);
+	ieee80211_verify_alignment(rx);
 
 	if (unlikely(ieee80211_is_probe_resp(hdr->frame_control) ||
 		     ieee80211_is_beacon(hdr->frame_control) ||
@@ -5446,9 +5445,9 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 					   sta);
 			link_sta = rcu_dereference(sta->link[link_pubsta->link_id]);
 
-			rx.sdata = sta->sdata;
-			if (ieee80211_rx_data_set_link_sta(&rx, link_sta) &&
-			    ieee80211_prepare_and_rx_handle(&rx, skb, true))
+			rx->sdata = sta->sdata;
+			if (ieee80211_rx_data_set_link_sta(rx, link_sta) &&
+			    ieee80211_prepare_and_rx_handle(rx, skb, true))
 				return;
 
 			goto out;
@@ -5468,13 +5467,13 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 				continue;
 
 			if (rx_data_pending) {
-				ieee80211_prepare_and_rx_handle(&rx, skb,
+				ieee80211_prepare_and_rx_handle(rx, skb,
 								false);
 				rx_data_pending = false;
 			}
 
-			rx.sdata = sta->sdata;
-			if (!ieee80211_rx_data_set_link_sta(&rx, &sta->deflink))
+			rx->sdata = sta->sdata;
+			if (!ieee80211_rx_data_set_link_sta(rx, &sta->deflink))
 				continue;
 
 			rx_data_pending = true;
@@ -5492,20 +5491,20 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 				continue;
 
 			if (rx_data_pending) {
-				ieee80211_prepare_and_rx_handle(&rx, skb,
+				ieee80211_prepare_and_rx_handle(rx, skb,
 								false);
 				rx_data_pending = false;
 			}
 
-			rx.sdata = sta->sdata;
-			if (!ieee80211_rx_data_set_link_sta(&rx, link_sta))
+			rx->sdata = sta->sdata;
+			if (!ieee80211_rx_data_set_link_sta(rx, link_sta))
 				continue;
 
 			rx_data_pending = true;
 		}
 
 		if (rx_data_pending) {
-			if (ieee80211_prepare_and_rx_handle(&rx, skb, true))
+			if (ieee80211_prepare_and_rx_handle(rx, skb, true))
 				return;
 
 			goto out;
@@ -5560,14 +5559,14 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 		if (link_sta && link &&
 		    ieee80211_rx_valid_freq(status, link)) {
 			if (rx_data_pending) {
-				ieee80211_prepare_and_rx_handle(&rx, skb, false);
+				ieee80211_prepare_and_rx_handle(rx, skb, false);
 				rx_data_pending = false;
 			}
 
 			/* No valid_links check as we need to RX beacons */
 
-			rx.sdata = sdata;
-			if (ieee80211_rx_data_set_link_sta(&rx, link_sta))
+			rx->sdata = sdata;
+			if (ieee80211_rx_data_set_link_sta(rx, link_sta))
 				rx_data_pending = true;
 
 			continue;
@@ -5596,22 +5595,22 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 		}
 
 		if (rx_data_pending) {
-			ieee80211_prepare_and_rx_handle(&rx, skb, false);
+			ieee80211_prepare_and_rx_handle(rx, skb, false);
 			rx_data_pending = false;
 		}
 
-		rx.sdata = sdata;
-		rx.local = sdata->local;
-		rx.link = link;
-		rx.link_id = link != &sdata->deflink ? link->link_id : -1;
-		rx.sta = NULL;
-		rx.link_sta = NULL;
+		rx->sdata = sdata;
+		rx->local = sdata->local;
+		rx->link = link;
+		rx->link_id = link != &sdata->deflink ? link->link_id : -1;
+		rx->sta = NULL;
+		rx->link_sta = NULL;
 
 		rx_data_pending = true;
 	}
 
 	if (rx_data_pending &&
-	    ieee80211_prepare_and_rx_handle(&rx, skb, true))
+	    ieee80211_prepare_and_rx_handle(rx, skb, true))
 		return;
 
  out:
@@ -5631,6 +5630,7 @@ void ieee80211_rx_list(struct ieee80211_hw *hw,
 	struct ieee80211_supported_band *sband;
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ieee80211_rx_data rx = {};
 
 	WARN_ON_ONCE(softirq_count() == 0);
 
@@ -5782,7 +5782,7 @@ void ieee80211_rx_list(struct ieee80211_hw *hw,
 			__ieee80211_rx_handle_8023(hw, link_pubsta, skb, list);
 		else
 			__ieee80211_rx_handle_packet(hw, link_pubsta, skb,
-						     list);
+						     list, &rx);
 	}
 
 	kcov_remote_stop();

-- 
2.34.1

