Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952003;
	b=eQMY3xlaOBZtwxeYuX4FB1QG4ZgswacJ8pOakdRLlzfDuFH6qIzaCfogYK3c7MXCw4WD
	 1xtON1Yt07l6KyryPrWxf0vtzSCTTZugD+m9rZkmPOTGq2kAi2AkjYdldV28yN6hzAqxR
	 LejdIXxds1rhVxCKdaF4ugWgAKpOsT303Ez8b4qOATymtg9i68Zk69VxERZdSmgZ1gB/m
	 o+691jq2RNBmwKNE9Od0B244402SKhDoXNBLIOyEPJQvRKPcvWdUmxDp+LtQVvc6LAx1a
	 1nxdUTUAs63WJdK5FnBImC3JcBLRp9e+efz0qBoI3fS9g9MW/r3vUDHr3VDofb8Ix8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952003;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gOYWK9XugZsXS7XRYjyj5nEvCnGNo96ScNjgbqrNypM=;
	b=wbP7+ZH+gMtoC8yYzXHbBviPpgrtKlpB3Va9cFimWeNsN1Upe2khP6yVcinCcpQYS9ES
	 fjmy01sY4tsPddcdJQibyHKE6fvJ0u0flq5aFxf/+yrWlszXql+R2DRk/gTmOOJapcmyq
	 2nYXEinNXFHA4dRPefs32XjO+FQI+12iyWPuw1mornDR8Qzre1cYqMTwV2bkNYvsab2QZ
	 /HQpU2AqLdTVxisWQwbJ1ZINV7VsoJrx1bjZTR+JY8rgLpbCalP2ORHhW0s7AAuDCxnp9
	 7PKDfqcFlxxveUxQBBZQmTkJYQaS6RzHbTjj524Bku7W8/pmZif2a9Bf7gTE8jVvroA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IORU37R7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fDidxiX1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477AA6083635
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477AA6083635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IORU37R7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fDidxiX1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RPRv2933657
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gOYWK9XugZsXS7XRYjyj5nEvCnGNo96ScNjgbqrNypM=; b=IORU37R7Fx8682Hr
	emVRz+2nocT1Qbscopq1pVxqb+ZdRoqVy4eWqduZYzxAkOEqU53CMKTbN8swUCdr
	AAN6AC71tbJQ0uPJJgggYWAfFV/tZkqfrfGpiyXUAJ2msyMgmlnXuo3YVzkEIDwO
	i9SD43B4CVKxcJ8qK36bdkMikU7Ra3RTrONsoYrqFXDCq3IvmEucVpQ92O9pZPUm
	SAJutO/QcXANBQ4/Od0+fd3mVQFRa/GAmHpnSbRmCacAar/XC8jWV5ep3qVjCIBv
	kFOEPckaHnYthw02yF9zaZmJNZC0HXxHrkAImbiFsjNKs+J2bnybQx0y1K3uxFcr
	biYZig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1r70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:00:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so661218a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952001; x=1794556801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gOYWK9XugZsXS7XRYjyj5nEvCnGNo96ScNjgbqrNypM=;
        b=fDidxiX1IbqvQDtXQEYlOoeQpz3zyHukUHycnmHNRPGw37txO3PccSAL4Jw3/EWsRg
         Ocn7K+2Mos/IERUgjMCyKFwVcbj/7qUds1EywWLMA6w9SHOXby5xTLwjLbypEhz8tZWv
         F2RYosU456ziOBDahlD+wiHyhjlHWhGRveeTioxmw4UipD2eebpuIxHgLKlin7blThWB
         FTXMYN+Bze0CQITfJulgcqSEAlnXilLDD4rhYy+KtDK/54POhb+qpPh53FOTvRDmN5/K
         GU19DuYNGEFJnraUco8XqtC1CbjUygXfUGeGhKBH3SNQCGqoPTFQkBw7a5/5xgDuIMbz
         4oBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952001; x=1794556801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOYWK9XugZsXS7XRYjyj5nEvCnGNo96ScNjgbqrNypM=;
        b=o0tvD4g0FyittbO1cVPIG9viWQmEZEAeWU+csuJjl1fRvmQEqPFDhJsA3IyUiHMQiw
         HJm/8xupZTXs4yiPdAJLXv8068XturzSeHnw7idLT1iqzCaC4rZaXpf3nwLvPKUJ3HzN
         3lsNLrSD4EImUUJ96rEF17W0Jcev8aSr90CBzwjsfllOEPaHKqzZQX8b57VoSgs3JMl9
         o677VL9hPbM+sxqxuUXrdgMh2QVxMMnqlnvMFOSsUDUgB/rqMvp4pOFSfADiysGhgjkV
         Uzfv3U3GQ2Cr+qV5o65TJSqK2DjkXvfNAvVRNM9irOpb3oOMBIeSya0XbJkw6I1TmQqG
         UNrg==
X-Forwarded-Encrypted: i=1; AL+hErHGFhFf8/QPo1lgpMFWcTKle71pNFztqOaQBS6BDwThXZp73YA5EBSfXTAaCu9/oboxA27Sn8NPx8E03z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TpA9nTSVpSPzBu9xSMCbNIUGN7zq93sEgSHRbkwMezqBeF5k/
	GDo3fCSYILdwAT1sDILu1a2+ssjXIiEKiY7L6jdkZTAy6+wG/iGZiX2cSFG/1O5teOgZkH3gyl+
	YMaj9+cYJmTqmGtN6gmI4nR4uufyKO3L0JwWywXseisUJcdEQpPh8I9ilSuK5fmG4mg==
X-Gm-Gg: AYBFou0OqHvfwz2NWylRLnTfJp+BjbVWj0YtG1ATFfjkkWpthXJo9cGKre+v0GWaNzq
	lMg8rNbH4z4F/d6pftXxz4nHcbgge8RjIiZ7YOPLDl/lAfus8N5Ye0dR3mtHqAEzWHIwEItJxtS
	HxfcJIuvc6LjVHpE3m8CoNEw2h1aeXoz4g+R7Xy/GQ/JZCGCdjt7iuEG0dFTNcvbLMl/SwsyK2b
	MYHFbquKMk8mathLelmHt+xYkiKYXxa2xWo30tXpNQekjpROIWqwRjfn+si6z+GhRCezRAUh3cC
	/tl/cY7yMSVxko8LtqMXPKOQku1IaVqRi7DprzXEkiqN4eM6EOEuIGvumteiJin2Fs2QiiQvsTl
	+5Ae00eeaSq7IHX6wfMBB3Zlsk3p0q6p6bGWCmNj5nNBYRyB00vCe9DP9sOmQehDWr2TlOVwlrv
	7MddYvoZ/NNy9o10/eIBG36jTmOMNDjyzSuLGXVHWe+izJsrw6vCNLgWJgvMTRz7vpr5KLtF4=
X-Received: by 2002:a17:90b:554e:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b0db6c9b22mr1876584a91.29.1793952001053;
        Fri, 06 Nov 2026 00:00:01 -0800 (PST)
X-Received: by 2002:a17:90b:554e:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b0db6c9b22mr1876568a91.29.1793952000520;
        Fri, 06 Nov 2026 00:00:00 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.05.23.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:00 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:52 +0530
Subject: [PATCH wireless-next v4 15/21] wifi: mac80211: filter uplink and
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
Message-Id: <20261106-smd-v4-15-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: oCu92enpiqVZ13qbzkhn5gBr8N7_jAOJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX9sVc+HKXXjAJ
 g6ceFZyoWqu+z8LY8pBFhmRL4QVNLYO41h6HdMBj8lKOoWWvBULiXEGr4UzKiuZHV6l7CQiTKUC
 xcj+aeX855LCwwVDqu6ZtMCwecwFuQS3fQ/pm64kuEsBjZrqrxZ27Lbtele3/9uacg71WhWMqoh
 Q0LVjq1NE3fSIU1nkZTersIX0FIdoXFcjbs0aLkdYmX+p/4N0y2o7AplFhymx60njoPQ8SaGHb7
 17h6iooK67wNSP1hdIHre8I8WNsxnpzdCggVLL+eZmsusfbZaErZ6R7F0XIZstBES9dl1/dkgYg
 3lSjvrISL8AAosr+JowazkfD2G5NFK2XnhYH9JdsBcqQvjo2WkPSRj1CzI6om4fJkoPEwELB6hb
 2AjVrlG6krCTfiw9rerOhcswnwaOavdi4mvsjVk0UFBDnkIzMYff2xoUoNiePfKAW4AwQbUpl/m
 XtdwF63DtiDHS7j6R3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX3ytpF2RPYBU0
 DnM/au+ZerxAxhT1npeokmTcAADUoDOky0QaNNg8HIOTnihIIAwCaXEr+effy3t88LP3kMTDRpy
 9XeEze29Mw1FKI9jBQv4f+XV+Njru+U=
X-Proofpoint-ORIG-GUID: oCu92enpiqVZ13qbzkhn5gBr8N7_jAOJ
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed8902 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=AigL14bPCbaQZCUQxqEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

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
index e9b6a0415d6a..216d407237ec 100644
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
+	    (tx->sdata->vif.type != NL80211_IFTYPE_AP &&
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

