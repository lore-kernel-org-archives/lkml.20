Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907656;
	b=emk/1Qg4lXNca6pAhZtCVYlxaoR+EgF/ExJpXP6truoSSkM43WvDV4WrWrWIoDSJIkh7
	 tt3k47R+NmUpPrxaJ94XPmMVGLI4Zh98N7+Lbw/tTgUNUTS15QZjVtTwRxI0K5ceXjuE8
	 b/+Qnk1mlK/5Z9QBe2SLLkk3X5qN7fmLhKHQA58bpwVYlKYqZ8t0Der57ztmg9W1M2w8u
	 Fmi/pu7wzsSo2ONA8WzNhNmwyiFll6xNpSqxW9VHplipAwDWKA+YqU4pE6ZXnMPmcf26H
	 RC6cwSBxHZ1T3dO+dv7GocFnv4Q1+SflPoiaI4sNIGQeTzBAwex1NpgBxC5b/34iL3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fKYri61OGhi/wgn25KBuupgoVfkejSRXbBTtvGVv0uM=;
	b=oYd9nJIQR3lB4uNXwLwevExc7WoZwvUlkaj+W0JFP3oTbqjhtouJxgzA7fUz92wpGwNT
	 ueP89r13hA9TydPB5XJT9bro/fPcm4iSDFXHiconxBIwYpx0cTgL1Cuc5TrK8FjGSHNo3
	 UFXNFR27YxJdkRGX7OIPpCmkDDjnN83k4p0Z0QJJVgWCzbxjFrfswSjKKdwkxfe8m3YqQ
	 3Kare40mdLhfneG4nEIp+kvEjriGXeJ8ib4LL2iAC7JlnAH8kgerH0yR0/IBVZ40+/3xo
	 tfoS3I7o1cH35wptam8LUH5IeD2lESerPejn0J7QuyIlNAUqzgl3iO/NwohD5d8Mvmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mBYubT+0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZMWXYYV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DF560818CD
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8DF560818CD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mBYubT+0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZMWXYYV
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5JKxHU751421
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKYri61OGhi/wgn25KBuupgoVfkejSRXbBTtvGVv0uM=; b=mBYubT+0aH0Cdu8Z
	JS3ERN0kjk8DgMIIhUvrhamjYPSXKu8BWwX5UL6lgsR0Y1H0wFGCdYlyNf9YizXY
	UnvPYzQ4nvZ1tkdlxNQWR/7vPJisff9HY1H/dNzzCJTW6fBhzZBCj5cq5PJphLms
	w2ap5fCjcQd7YDFFgVMpMc6Jf441ZxUgWZ2Gd4gpnRJEfaHGb/M4vTo8sLJiOSKv
	iYJZedLSYekNB9Oxe3ZnxpZ1CR3oJ5vazB24qRpH/ilIm/nUE+bkFhor27FzhgQj
	2B9JljLZ25k5SLqDCu5f/RE/OLpa+q1WtGe1rDyaL4cJ9MOIpQB9pSI2FoskZexE
	O9MKUw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvp82gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:40:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f1e7d9d4dso742476eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907654; x=1794512454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKYri61OGhi/wgn25KBuupgoVfkejSRXbBTtvGVv0uM=;
        b=AZMWXYYVfPVGUCfWv9BPfw+3FkW2mxECWc3gGugNKXX31y/rlCMEWq1GoD8mPVqktg
         uUSOHfTmmVUno04XGMWBEPlkEWFVI84TTFu9GxRqSNbYTaVCXow3ZcFT53Ei5TlFUe4w
         rJJz7y34QJPGBZADwBrfBTy+ADoNLZt5dDNxPt79/5FeXOTnp8hb7QRLrpGPDeDY/ppz
         aYgz4FIuEFugHScGV6UJvT/Z+l3WSVS2dwQ6nFhn1Qu93htUVyU5iZ6X9mruz6zmmTGT
         9sqSrjwBrSS9qOGT2TqbCKFNRdVpo0Qi9/suWhi3n0JXVPC5ouhhvyg2lMs6nKbudcoU
         Oh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907654; x=1794512454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKYri61OGhi/wgn25KBuupgoVfkejSRXbBTtvGVv0uM=;
        b=HJQFSxMs1t6j23SBlIQZClN2mrNT3Gt68WthwTo29VS0/MI6ZGg8AklOK0WBu1mND7
         9Tjyi/BsK36zMUoChwR4eEiUzZDcTsmkKLiXxX2bcpFaJUQl/w2Jk8SlU6X7UkboeF4E
         SvZgS81vYAx5VYLYCSx7fVHbp7WlSruGOdXvk6yvU21pakRcYLHtgRPNKus2nW21ITpo
         Slc+4vSuN+vsaeey3HazmLSLt9VDfoJVUs6VxkTc+UNIyjSsq0l3Xf5DELJw/nToHCAg
         YnuyI6tUMm77OrmONpHKrmFbj5iBKfH6B0gDngQnhdWNZ51t1dtcs4Yz7puKOQPysaID
         LAVw==
X-Forwarded-Encrypted: i=1; AKwUvByUpH1V+/Qzsu9ivXFDbsuB5UNugJaz7WA6/anvS5uB9W2T+5GH1/SIOSQjAZMwhC3SurCEcLMcKcJJBGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q0A9tVMFFosVUpQjruv3BBptPRbShkdnbpbiWoz7dagqx2Okc
	ipYSgFuTxDCUQG42+G+bSDcBFEV/5dyF4aZqEF34kN5Ih76TwxLnYbh/4BSOXBPFD52AxCnmzI3
	ocsZN7S5YLDpXiF2rVHFz8OXNWLHMNGN89DaMTRtRTdFESi+y3C3Mo9zJrJHq+ZzvuQ==
X-Gm-Gg: AYBFou1XuS7P2CxUToeuaEYL6Deg5ycBzNDCvxnNFytuFCu9V6B2IxBzYH0PzL4QAGc
	+k2ZFERQwlsBBAjGQYfVwQ4R2VWLjaKdTdz+c6Hla0BmLBY89xeEB9qdweO3e+FduQmE826A2fz
	DFLT+u73d0iHyLv7GZ0U/g0cvz2Vxuvhc1EAk3W8clFzAp2zUkRUVZDvzs++ociI6cc7LzAWW59
	R9+MK9PCuHp7/ojO87Sn0i5FvmeIHWyAs2kvvFX3kK8qdN55b8uWiMAQLdl+BtAY+rGgyzwcJEH
	a5c1jouuybkcg7N95o+JZmvnqsgTUaJgcOFvGyplxHm06cTDYto6wobhXF2M8inyPtMXP4uRYTE
	TdFqmah1/8wY3dM47ApHjPbRn95AROLrX/dhp01d/chq94dIS07+OxILcDCW98TXEMcl0RFxPwc
	VWeeU9hAlataUveG8WZ7KTaSVI7WIe2bhUKCs/KUm3NhilPskA0+r/+K957pxzNp6YcqruDw==
X-Received: by 2002:a05:693c:881b:10b0:351:1bdb:e3b7 with SMTP id 5a478bee46e88-36f75b2c6e8mr173845eec.15.1793907654319;
        Thu, 05 Nov 2026 11:40:54 -0800 (PST)
X-Received: by 2002:a05:693c:881b:10b0:351:1bdb:e3b7 with SMTP id 5a478bee46e88-36f75b2c6e8mr173796eec.15.1793907653589;
        Thu, 05 Nov 2026 11:40:53 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:40:53 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:50 +0530
Subject: [PATCH wireless-next v3 15/21] wifi: mac80211: filter uplink and
 downlink frames based on SMD states
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
Message-Id: <20261106-smd-v3-15-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Ib4Symqa c=1 sm=1 tr=0 ts=6aecdbc7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AigL14bPCbaQZCUQxqEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: noE-te5OC2s7gLy1BkqZVzU7FsNvn8cl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX0N0RlDGl189/
 hDZ4C9HKsuBCTLxsNXq5j26Mc/nJd14idHDaDQR0k8/GRZi20GNza0pe5h2dcvaEYmM3TvWopHs
 NTSbsvRMzl1p2L33o/bjAld1eTpn2mQeVS1lDFPfTtSdg9hQ6WbELQFu2Gyd2iQyhl8tHer+pYo
 X9Cw0R2RE/BaihKWrgxgIEzo2tqc6Dm8IEcowlHGEWuZPWl3lftXEgO/NFair7hG5nbbQOsaAtf
 W1jcAwwcBgmRd7MZPVumOI0jdM3w6aJkXdIBwJTjutYr5bJgs1djhMhUY4PPptMf0eDeZW42FRH
 FgozwoM6mG5gCSaEWqaRQNVolVo5oPjcRgKwDZ6+dtudV/RED5ZDWVLD+7V0X6r/tS4ie0eQC0w
 47KoEi0CL2NKTy326zPjQ5xUQbNi/+xoA3E+AkEZ8gu8NV4Rb1xaYqLDDRk9ZX4SX5PAtKd7y6F
 StOtE7+bt1ahr9fHWTA==
X-Proofpoint-ORIG-GUID: noE-te5OC2s7gLy1BkqZVzU7FsNvn8cl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX8dkErPhADtDd
 Vv0oPvWzCbtBirHPcyLYiwf7BIuJoSCSWPz3wibGWyrwI9YbcTOHyvlmPEkJdC8QMBnbZ4yEQ1N
 qy1yNwilAVh1NaCNINkYuRS1h+Al4/M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078

During SMD BSS Transition, based on the state that the non-AP MLD is
currently in, there are frame filtering conditions imposed in both
uplink and downlink directions, as per IEEE P802.11bn/D2.0, Aug 2026,
subclause 11.3.1.

State 4a:
 - UL/DL: All Class 3 frames except ST Execution Request and Response
   frames are disallowed.

State 4b:
 - UL: Class 3 data frames are disallowed.
 - DL: All Class 3 data, control, management frames are disallowed.

State 4c:
 - UL: All Class 3 frames except QoS Null, Control, and UHR
   Reconfiguration Notify frames are disallowed.
 - DL: All Class 3 frames except Data, Control, and UHR
   Reconfiguration Notify frames are disallowed.

Add the filters in both tx and rx handlers to implement the conditions
to avoid exchanging those frames while the station is transitioning
'seamlessly' (state-4) to the target AP MLD. The unexpected frames will
cause out-of-state operations and leaks in the context transferred.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 net/mac80211/drop.h |  1 +
 net/mac80211/rx.c   | 44 ++++++++++++++++++++++++++++++++++++++++++++
 net/mac80211/tx.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/net/mac80211/drop.h b/net/mac80211/drop.h
index f433ee17cce5..fe037c94b2ca 100644
--- a/net/mac80211/drop.h
+++ b/net/mac80211/drop.h
@@ -109,6 +109,7 @@ typedef unsigned int __bitwise ieee80211_rx_result;
 	R(RX_DROP_U_UNHANDLED_MGMT_STYPE)	\
 	R(RX_DROP_U_NO_LINK)			\
 	R(RX_DROP_U_DEFRAG_OVERFLOW)		\
+	R(RX_DROP_U_SMD_FILTERED)		\
 /* this line for the trailing \ - add before this */
 
 /* having two enums allows for checking ieee80211_rx_result use with sparse */
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index ee1f33178d26..12ba9fbcc983 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -1628,6 +1628,49 @@ ieee80211_rx_h_check(struct ieee80211_rx_data *rx)
 	return RX_CONTINUE;
 }
 
+static ieee80211_rx_result debug_noinline
+ieee80211_rx_h_smd_state(struct ieee80211_rx_data *rx)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)rx->skb->data;
+	__le16 fc = hdr->frame_control;
+
+	if (!rx->sta ||
+	    (rx->sdata->vif.type != NL80211_IFTYPE_AP &&
+	     rx->sdata->vif.type != NL80211_IFTYPE_AP_VLAN) ||
+	    !test_sta_flag(rx->sta, WLAN_STA_ASSOC) ||
+	    is_multicast_ether_addr(hdr->addr1))
+		return RX_CONTINUE;
+
+	switch (rx->sta->smd_state) {
+	case IEEE80211_STA_SMD_NONE:
+		break;
+	case IEEE80211_STA_SMD_PREP:
+		/* 4a: Class 3 disallowed except ST Execution Request */
+		if (ieee80211_is_st_exec_req(rx->skb))
+			break;
+		if (ieee80211_is_class3(rx->skb))
+			return RX_DROP_U_SMD_FILTERED;
+		break;
+	case IEEE80211_STA_SMD_EXEC:
+		/* 4b: Class 3 Data frames disallowed */
+		if (ieee80211_is_data(fc))
+			return RX_DROP_U_SMD_FILTERED;
+		break;
+	case IEEE80211_STA_SMD_DRAIN:
+		/*
+		 * 4c: Class 3 frames disallowed except QoS Null, Control, and
+		 * UHR Reconfiguration Notify frames.
+		 */
+		if (ieee80211_is_qos_nullfunc(fc) || ieee80211_is_ctl(fc) ||
+		    ieee80211_is_uhr_link_reconf_notify(rx->skb))
+			break;
+		if (ieee80211_is_class3(rx->skb))
+			return RX_DROP_U_SMD_FILTERED;
+		break;
+	}
+
+	return RX_CONTINUE;
+}
 
 static ieee80211_rx_result debug_noinline
 ieee80211_rx_h_check_more_data(struct ieee80211_rx_data *rx)
@@ -4279,6 +4322,7 @@ static void ieee80211_invoke_rx_handlers(struct ieee80211_rx_data *rx)
 
 	CALL_RXH(ieee80211_rx_h_check_dup);
 	CALL_RXH(ieee80211_rx_h_check);
+	CALL_RXH(ieee80211_rx_h_smd_state);
 
 	ieee80211_rx_reorder_ampdu(rx, &reorder_release);
 
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index e9b6a0415d6a..17735fd0946b 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -308,6 +308,47 @@ ieee80211_tx_h_check_assoc(struct ieee80211_tx_data *tx)
 	return TX_CONTINUE;
 }
 
+static ieee80211_tx_result debug_noinline
+ieee80211_tx_h_smd_state(struct ieee80211_tx_data *tx)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)tx->skb->data;
+	__le16 fc = hdr->frame_control;
+
+	if (!tx->sta ||
+	    (tx->sdata->vif.type != NL80211_IFTYPE_AP ||
+	     tx->sdata->vif.type != NL80211_IFTYPE_AP_VLAN) ||
+	    !test_sta_flag(tx->sta, WLAN_STA_ASSOC) ||
+	    !(tx->flags & IEEE80211_TX_UNICAST))
+		return TX_CONTINUE;
+
+	switch (tx->sta->smd_state) {
+	case IEEE80211_STA_SMD_NONE:
+		break;
+	case IEEE80211_STA_SMD_PREP:
+		/* 4a: Class 3 disallowed except ST Execution Response */
+		if (ieee80211_is_st_exec_resp(tx->skb))
+			break;
+		if (ieee80211_is_class3(tx->skb))
+			return TX_DROP;
+		break;
+	case IEEE80211_STA_SMD_EXEC:
+		/* 4b: no restriction */
+		break;
+	case IEEE80211_STA_SMD_DRAIN:
+		/* 4c: Class 3 disallowed except Data, Control,
+		 * UHR Reconfiguration Notify
+		 */
+		if (ieee80211_is_ctl(fc) || ieee80211_is_data(fc) ||
+		    ieee80211_is_uhr_link_reconf_notify(tx->skb))
+			break;
+		if (ieee80211_is_class3(tx->skb))
+			return TX_DROP;
+		break;
+	}
+
+	return TX_CONTINUE;
+}
+
 /* This function is called whenever the AP is about to exceed the maximum limit
  * of buffered frames for power saving STAs. This situation should not really
  * happen often during normal operation, so dropping the oldest buffered packet
@@ -1881,6 +1922,7 @@ static int invoke_tx_handlers_early(struct ieee80211_tx_data *tx)
 
 	CALL_TXH(ieee80211_tx_h_dynamic_ps);
 	CALL_TXH(ieee80211_tx_h_check_assoc);
+	CALL_TXH(ieee80211_tx_h_smd_state);
 	CALL_TXH(ieee80211_tx_h_ps_buf);
 	CALL_TXH(ieee80211_tx_h_check_control_port_protocol);
 	CALL_TXH(ieee80211_tx_h_select_key);

-- 
2.34.1

