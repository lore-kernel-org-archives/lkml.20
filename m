Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907661;
	b=qF8V87SNsw2B1azHOGh2PxYxaz3s8hAPRYj/+B+ZIWhnH7asUfaIVcOG7w59eVu/BmSu
	 MVYuiRU02exvjRQnWErwY90trJb/Qs6CiCClZ/BY8/B15lhczjezKK8qOHpCYUfik0XBA
	 lZceLWSBA1N8fFsv2vqLiWqgi/ldqWwagf5vOEvLaKOy/TiWCns2z32VuMrdxP2t7o++6
	 rhYwed7/xe3ufka17FqPEw6X/rVzvkEutVcjC7THFsn6JwIxy2M4CkgYHRT7g2Y3OXML5
	 5s07Xko2bG3kIn+jl/Al/IK3UTvwu4MT3CsmgW9Xfdd5wF+B8Pjl3+q6qG8SwFIChzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jshofKC0QdDfPF/zBkVJlmFjxY3GE8tXQO7KwbzIz1k=;
	b=l706roHrH8NshH5/CDPDc0mexcHeuVPIrSSpQf5d6f9qJ2Wo4BnWaNUixAk859iYHa4M
	 X4RHd6ZBwUhTiRdAAj7TBL6g03y3EjeV/LCc7ibk1dOu99FjO4hpe0XI3JlNN4vM+x82s
	 NhHHRLK+Y2Lf5wizMF21xKuSPmQsCajg/UeYzP2eYqsPYFou1WyGjw/abxvDLxjTqtM+p
	 +YH9dmyf7i7a9oALe18CEb638viUtpYN99sa0dg9gVsbhadvwXddIk1LIH3RivWxT1e7N
	 F/kZbt1L/1Nzjavj4exjIzHv85kEFQpMZ1p7nZ4aZTVMxmAZ9mXtukRI7Bi8/ToMKhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYte3Bd2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IvdEhKAG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0B5606D52A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B0B5606D52A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYte3Bd2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IvdEhKAG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeRrF4075343
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jshofKC0QdDfPF/zBkVJlmFjxY3GE8tXQO7KwbzIz1k=; b=TYte3Bd2Bhla4G6H
	NV+oFjHSA5vR2L/T9D0lGUMU7ZTlJQUDt0XvvGVz/iKPFOpTs5kDWToy+GN5mKUg
	qGr/D7BHCw1UblV/fFp8jOGwKDVUcgjJlgXOkIaFtuHXsUOJNmovRYBNfVcknHGP
	KOivUfPrvLHu6rxB5bZyJ3BMNWKSwJB6F88z0mSDmy1zeY9XzPtGLqWD2gCeCS4o
	nq+GJ3bOxbHtDcwtmnnm2nnrdFZ737hyNIQ7LX7FyOIqrKTqJ9vPvSDQaF+p/Odv
	dR/tJaEGX4iYDKftcPJ98um8CSZJkLCZw2JuyikHjhZ2NRB+SzQFlyHuA+gC+qdi
	ozTy6g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdt9cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:41:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so1259301eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907660; x=1794512460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jshofKC0QdDfPF/zBkVJlmFjxY3GE8tXQO7KwbzIz1k=;
        b=IvdEhKAGsKC65+AN2+xICYydsusARVrNwTW+xl4L8CMr7PD2Ffhmiw1CpR3eKoA+GJ
         hZW21vcJAlIprbK6Ez3iKT+C/B6NXAs1pLmqC7xkBa+rhNj+6RgIlOfNE0Nr/R3Qsmd2
         HVcBkS7oAdPG1k/TvUdXppk1l+TZOTIeCsCYM/2VqnyhPCAEAcpJgLo2xl3KIRfb0Gxa
         aL6HothNJ/63mQ2d8syk3LFLP/gOPoWHWiqOCyRl/Z6c5/t7afhDrzGFnOTKBI5zsMcn
         hocxo3d0bbtL+3A89zF0rzG4G0TGS4LXb8HLd0fnUDTiaKNYl+OWO+th5D/Vkvaerws5
         J4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907660; x=1794512460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jshofKC0QdDfPF/zBkVJlmFjxY3GE8tXQO7KwbzIz1k=;
        b=h4M6KwIoQrEEjoyrEhYuYzuABu9NZDC0WFhjGqCsdNCPwMCLeH2ySz3tf7RTs2DzyL
         Z3Uj1slwTi/2P7fCwCVAi8lmWhl6smJ64dc94FTc6Qxk/83ZlQ2ElKX2O5lENmJvjaJw
         VcDJrppLHHfPCDiUWHW0W9O1oBrpsP8RfQ8QwZ1l/omJufBiAC5vlOqkj9NqMs9IU973
         2BT5p4XkeDuc8Iey2SW/06HfbQRivuhsbth3Y02RLAx+FW+JqMrHBfg5oOYnHIk7cKe9
         nRL+nmBTn3YAXtAzR29IgfLPl/R/T+aIHvXHzgdlr4j84DfkbRUX3g1ZsI2fyWbLlSsP
         QBug==
X-Forwarded-Encrypted: i=1; AKwUvBwXpHuKWEMnAdSIY7VtxRxwwh0flxJOxlBzcaxNBJpRIGXCy4rWT6pNu6lf7Dg1D7ivo2k7UvUIOHQS6U8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tVeKm94epZrlRGfj4AmLxdHlxTZ930VGvCEVLKCHE+7acEojs
	hvBkNUOqtSVXtC977DO5JBS+z/I/G42polmx9/rPyAnwOS5vHF1xFkkaA6+brmvRa7u52rwoaLN
	SKr78KO0VUh7rCwyZfT7BfYtxfrGi0anTIwcequ4mJDLAJ3D5B3745UPIeFjNZXZ7DM19n9N4dQ
	==
X-Gm-Gg: AYBFou2a44TL30xTRzzEZHXb3XkZlbVEYVVPl6SrY3zDXy0FIAVU15WnCY0CRq31VYQ
	G8HJnBIL1eSPPR7KY9DrFbeRdXnM1uvHvdB9QjXwXb5XXojyq0aCSttgxZkPb/Ho8/GV2PBhXb9
	7BJjFFCCOkJN68kN4O2Ey1RL7DNH06LPROCWlYL0/VGKOy18q37PTOJNxrThZAqm2P11arxcH9l
	mr7cPuRLDsrBhaiglkCB2EsbFgdtnyUlp56QGIW0vrta72TuRai6QiCEtljj18O1QEkGDgRzFfS
	hfTI0nsaigoTsv7TeJvKp79kibISkXNCDcdYeuVuv+BfdmvssYnbZ3cvFl5EJRnl1T1Kc16+pmE
	nee9DJ8mA3UY7IYFDmgC8dVk2qicnlxd4/oXpRa/bpWGHM1Y+S4g3ZndgMzz5qdzTydsXlCTZFn
	kF9RYmKUGkYojZt2uQMfyOZ23PYlgbCVvZ25T7eN3ZCHjyBilQW0FZ0HgrSEVVDM430/8U9w==
X-Received: by 2002:a05:7300:ac90:b0:36a:1e0c:e28d with SMTP id 5a478bee46e88-36f727d4322mr344135eec.4.1793907659706;
        Thu, 05 Nov 2026 11:40:59 -0800 (PST)
X-Received: by 2002:a05:7300:ac90:b0:36a:1e0c:e28d with SMTP id 5a478bee46e88-36f727d4322mr344077eec.4.1793907659071;
        Thu, 05 Nov 2026 11:40:59 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:40:58 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:52 +0530
Subject: [PATCH wireless-next v3 17/21] wifi: mac80211: pass rx_data
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
Message-Id: <20261106-smd-v3-17-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aecdbcc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QaRRATVtn6WKYfhituAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: HSOKI8adgn_2Vj_6Q8jaXxqrhzaqaakr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX4JwHKBLtEEVG
 7c/nJ0RqVzumyFU4cNLBQbFhmLnlQ7sjjDFz+wKqrRJoyLdQclnGyRBowfNEzKm+HwrVXYBWId3
 teYPacN3to+m7lhd00Jdg7XGb6YWP4o=
X-Proofpoint-GUID: HSOKI8adgn_2Vj_6Q8jaXxqrhzaqaakr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX8XvtobSOARya
 qSFkXrkA4ePgLAwUv6JRzzYixaThU2SYZ9cYF7UwwpwkpAHEiq5SQ08Ebs0SmJ3wREjjsd3xxMY
 Ogc3avjLXgd5X6/m+aB2XFyRZSW5v2urLNT5FiyBaeOL0YVoHLFzZ2oQ2+swrAREr4l54VzEKH7
 3l/KhhdnJ89HO9Dpvqrn+V4euZPzCNSIldsU+wB2Cfv3qrSHVgNnTTcgQVkyrCgTwBClNNocDw7
 HAK/aIZrR50QisO3kb4GvlSbQKQgJFEhWLvOYe2G+aB+9N2+a5BY3CUPgj0UcOqDee4Mgmphva4
 hTm9isyVMSm6AFYX8elXuh7bPuRdcC6PJdii8kaoOZdpXFRR/ofDssnnYSUfEXKvYOG/EENrHHd
 alpYhuWyAUdlL8eVqfHc4BrIXYaHeeQK/Y/2P6xVsp25zxE78a3TzyaO3lVBTUcrwntYiT4nKp7
 1tHYnI02Ui5FZXsfkcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078

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

