Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747CF3D0C18
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217720; cv=none; b=doKA6ii8pdFfYRr8sJaQRD844GB08rtbcFwlQIerBWWs039vNaE/Kt+kCoTvkzY1n1rz7r+ZzuqfUe9eGXaZDxljDj/0us1OOObq5B0MrE1j0srJbRtbAArcYFns9F6Df/zart8iru1/T5zZ2C6YBUyr6XZJkx6SWQ9OQYOpnnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217720; c=relaxed/simple;
	bh=xGsLNyQlQoDV+Ub/zZp7BYFxqifILtCYTg9z7VysFrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bkXx5u7j4B9+klD3GAdYwBmwz+3PJSR1JuhVCijP861b+7suX4GBqoxCeCqU50zuzkmrmCog3A4ii37R1VTDLKDxehKL2OVTJl/WwFvHem0mRVfMpyHQgNSUfvt/Fr7/a02DM63ZAhB3K+7UX14fFf++zz+xZ0u+Zm78ooVROEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZR/5+r0a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4EMzOCK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZR/5+r0a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4EMzOCK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O2KLQ01995435
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2A5S7dXBn8f2uUVD7ehSB6YipngkdXNcYQ7ZXaa4CA=; b=ZR/5+r0aoSNOdZ+I
	7vy/9oswEnWZTd70OnS8d74cYf4NdDzgpWRaxBOl2uwycxHj6Bmx2NY7Jwx5uedR
	uFSuJEaZ7ygeisnMAYMA8FTsr3G95C5+SN517w12Jhz8NirMOgCbCBt/DJ14qjvY
	7l8U6A8z0q6CfeOO0Fj2OZJQ+Uj6LQmq5m2XrmjwsurggG0r54zgoI3sSjJL9/xG
	L+r1jFvRAQexrbNs5cSXvU6sPWFj4YHqX/R14KhJjw8/UB7W7WIjoJpKJRcu4/db
	rodtwJCxXItBP/RoBEst4/tj+pxAbbMgqEjAzSgC5NDPkV473tTJhP2vByeIa8XZ
	y5rmXg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstug9m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:41:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-334f782d1abso476670eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790217717; x=1790822517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2A5S7dXBn8f2uUVD7ehSB6YipngkdXNcYQ7ZXaa4CA=;
        b=Y4EMzOCKvyy4QyxDFJcg2KBWICQcrMQKxME3hvCcA3mkpgu/m2wafpb2vL5jwzFTk7
         L6afB3fY0hA3mrL1J9QSPiDxsV/ZwO0NWqBno8lR0fY3Zg3Rud7o7JrIAoO9w6m8UIAe
         StxAov33eA7YuMVq8JakQx8KmTGpR9bAvyVKpASxhlt43bhpSy1QsQBBflDJVOMdmzLy
         to5TMo+Zx8AiEcuYQ6GN7IoVfygtQazcRSP3vBhITahQZjlw+qbo61Y3Ctfqo968JMVT
         4YzWnbiucctpQsJ+Rb/d8mDcWJu+uOYjUE1OT7NNOzHeom9u4HULxH5XqyoMqWGGFsV7
         /dTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790217717; x=1790822517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2A5S7dXBn8f2uUVD7ehSB6YipngkdXNcYQ7ZXaa4CA=;
        b=KzislPz/mIuTIW4Zy2xyuAbXyR4qsTptsz/0w/62SBvEWBxWzd7QAgpKIpq4RJTxgE
         1r4QfpJGLJnnjemj9L04OqyrE58X6SMMzlZxMxH4hGMn0ZlrH/g1IiqnqbVK0EWnGMRW
         1p29+fh6gu68tPtMZlEYF9YESO7/tlAAKvUaN1bOTp1gHaBbJtN43HyAkcUBr3h28zVw
         1pi+JHdoFICh+38607hXn5tzgvf0Of6zZL1cc3/8ik6ugNnFzTi/JCHxNMLBxQiCN12X
         GKwKshfBECITnY+klD329SOoYG57faTM+/2yebzoNTLZaH4yuXaKk7AV112qLa7KhNAK
         YOlw==
X-Forwarded-Encrypted: i=1; AKwUvByGd0OCEPTyacQUSC7vnIGTL/1KoLVj0erVnOys/37kiJqo3+OrESs821jesRP/4mv8XpccHxl0tafAnW8=@vger.kernel.org
X-Gm-Message-State: AFuF++mgnH90NoMI89UvrP2Ij9GpXqG/qilLSzdVVICEhxkjsSJ+fZJ4
	9puYlgpw0V/lwz6qnYZxlb11+k8BX33pjd9BYT8dw9r+4MdMKialE4zVSTMweNYEhpAnP1W4GNm
	Y9PjqwYj/7wxDoUcxnO+D6ZY/vgc5DuHUB0dtOIPK68u7G8/yvtZKF+aOLNiY9kTUdA==
X-Gm-Gg: AYBFou03veopbCoRANbGPBlTZEjSOqtZuhlMbp6wm5J8vDqaQcxMn1/F5Fxh4K/5twj
	Y0kUO3DheGE8weIoUwEqivwlmzYme6/AimD7ySwLfQ5PPkMYPYk15woM+wTSCprj6fAQXhUzZG2
	pz2xeBgCzY1UA9u0xRTeH2ZFPchrH2CAaYjNJkwPBXvstLg60ryrK+WGuyV4R2pA9Ofa5wCBBw3
	adLZMcQRxEXDZ28Bq1n6XUAfh/p8gSwdqjVl5KAD7Dkyb/RK5nNGqr7m4y9SsMgUF+s3HoS5GaD
	RNUQED9vYOxOxaDMCkQGUdogqBqE0g52PM/J+OV/zz5ZQGL49bpPOyPtx1Jj3rYcbifFGKziEWU
	Lwn0lL+v8vGfHcgDP5C+Uf5Spi7APKVrIOcJANFbtVwJ4odKHutAVPu5HpaVf2mQC/fQ2hgrNnJ
	ZKmJcqelrjDawOYixzeR83BA==
X-Received: by 2002:a05:7300:ec0a:b0:33c:14c9:c79d with SMTP id 5a478bee46e88-34004b8b5bamr1063035eec.9.1790217716867;
        Wed, 23 Sep 2026 19:41:56 -0700 (PDT)
X-Received: by 2002:a05:7300:ec0a:b0:33c:14c9:c79d with SMTP id 5a478bee46e88-34004b8b5bamr1063017eec.9.1790217716275;
        Wed, 23 Sep 2026 19:41:56 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm9692263eec.12.2026.09.23.19.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:41:55 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 08:10:45 +0530
Subject: [PATCH wireless-next v2 08/16] wifi: mac80211: Send BlockAck
 policy in AMPDU action
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-smd-v2-8-bb40094da1d4@oss.qualcomm.com>
References: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
In-Reply-To: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfX4JYFzs6guWeL
 DdI5MOmZE0PzNKvkCMuMgYGQkhwFzccMjZUgzXHkqFOpAuWKa/J2Z50iL/6xNkOdbn1UGaczynh
 UkU4zBqEvQhMnqrhKohhmd3obCObXH0=
X-Proofpoint-ORIG-GUID: vHbzelBnAtUcLbVrZ8ViN3hi8mniHK1f
X-Proofpoint-GUID: vHbzelBnAtUcLbVrZ8ViN3hi8mniHK1f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxMiBTYWx0ZWRfXz4tVkjNwOP4B
 rWeVib957Fn64Ax42/f8mq5IuvTP4J3b6JxJxfM1dS/wuqrxTAJiJVutXJF2c+Kkoe4iRcNRV0j
 kk4Pioo2xFPu0Cb2lYf6Nye5RNH3j3JnaekImaaKPknkTDPZhjFff9aT2egnOT6Kj6f7DiFBQ3g
 KTf7L6JZaCfS/qh0Jlf0ZcrJdy09d1jl/TCt/+AmyGLRqDX/lFLHygv5x3o9kZ1jHblHMBiRfkb
 vLotuGsk3QgK7Hm2ykop/YGm9xK++audHrzPFl4f7d3MksZMjmqiqUyKVBSVYiti0sGSt1Qr5Qo
 iVKwcdwIgGB4gspWkoasAoBzlxRc2kKlCkq5a8ez9C+JKXALRzLRt+uLjv/GMDzjOdKSnamx/BE
 gIVmPZ2XlVTXfK32g2Hd5Mfe+5RxClgO69Kj+94kReISztzwDibxG3zQx/bmuMz49boStOHVrhd
 Qcl9S+OcQZeozBkQ0YA==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab48df5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nliDdBWBufQ-nTcFh1oA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240012

While sending AMPDU action hints to drivers, mac80211 does not include
the BlockAck policy extracted from ADDBA frames. Drivers may require the
complete set of BlockAck negotiation parameters for certain use cases,
such as SMD BSS Transition, where the complete BlockAck context needs to
be transported as part of the transition.

Include the BlockAck policy as well in AMPDU action so that drivers have
the required information about the negotiation. Since the policy is
extracted from the received ADDBA Request, it is valid only for
IEEE80211_AMPDU_RX_START.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/mac80211.h | 15 +++++++++++++++
 net/mac80211/agg-rx.c  |  1 +
 net/mac80211/trace.h   |  8 +++++---
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 03b75eead766..7bfa421535ca 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -3963,6 +3963,19 @@ enum ieee80211_ampdu_mlme_action {
 #define IEEE80211_AMPDU_TX_START_IMMEDIATE 1
 #define IEEE80211_AMPDU_TX_START_DELAY_ADDBA 2
 
+/**
+ * enum ieee80211_ba_policy - BlockAck Policy
+ *
+ * @IEEE80211_BLOCKACK_DELAYED: Block ACK sent to the BAR sender in next TXOP
+ * @IEEE80211_BLOCKACK_IMMEDIATE: Block ACK sent to the BAR sender immediately
+ *
+ * This field is valid only for %IEEE80211_AMPDU_RX_START.
+ */
+enum ieee80211_ba_policy {
+	IEEE80211_BLOCKACK_DELAYED,
+	IEEE80211_BLOCKACK_IMMEDIATE,
+};
+
 /**
  * struct ieee80211_ampdu_params - AMPDU action parameters
  *
@@ -3975,6 +3988,7 @@ enum ieee80211_ampdu_mlme_action {
  * @buf_size: reorder buffer size  (number of subframes). Valid only when the
  *	action is set to %IEEE80211_AMPDU_RX_START or
  *	%IEEE80211_AMPDU_TX_OPERATIONAL
+ * @policy: BlockAck policy of type &enum ieee80211_ba_policy
  * @amsdu: indicates the peer's ability to receive A-MSDU within A-MPDU.
  *	valid when the action is set to %IEEE80211_AMPDU_TX_OPERATIONAL
  * @timeout: BA session timeout. Valid only when the action is set to
@@ -3986,6 +4000,7 @@ struct ieee80211_ampdu_params {
 	u16 tid;
 	u16 ssn;
 	u16 buf_size;
+	enum ieee80211_ba_policy policy;
 	bool amsdu;
 	u16 timeout;
 };
diff --git a/net/mac80211/agg-rx.c b/net/mac80211/agg-rx.c
index 9629e00069a1..2d67fd883146 100644
--- a/net/mac80211/agg-rx.c
+++ b/net/mac80211/agg-rx.c
@@ -289,6 +289,7 @@ void __ieee80211_start_rx_ba_session(struct sta_info *sta,
 		.amsdu = false,
 		.timeout = timeout,
 		.ssn = start_seq_num,
+		.policy = ba_policy,
 	};
 	int i, ret = -EOPNOTSUPP;
 	u16 status = WLAN_STATUS_REQUEST_DECLINED;
diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index 294a8a44a125..63838a6d5d07 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -116,6 +116,7 @@
 				__field(u16, ssn)					\
 				__field(u16, buf_size)					\
 				__field(bool, amsdu)					\
+				__field(u8, policy)					\
 				__field(u16, timeout)					\
 				__field(u16, action)
 #define AMPDU_ACTION_ASSIGN	STA_NAMED_ASSIGN(params->sta);				\
@@ -123,12 +124,13 @@
 				__entry->ssn = params->ssn;				\
 				__entry->buf_size = params->buf_size;			\
 				__entry->amsdu = params->amsdu;				\
+				__entry->policy = params->policy;			\
 				__entry->timeout = params->timeout;			\
 				__entry->action = params->action;
-#define AMPDU_ACTION_PR_FMT	STA_PR_FMT " tid %d, ssn %d, buf_size %u, amsdu %d, timeout %d action %d"
+#define AMPDU_ACTION_PR_FMT	STA_PR_FMT " tid %d, ssn %d, buf_size %u, amsdu %d, policy=%u, timeout %d action %d"
 #define AMPDU_ACTION_PR_ARG	STA_PR_ARG, __entry->tid, __entry->ssn,			\
-				__entry->buf_size, __entry->amsdu, __entry->timeout,	\
-				__entry->action
+				__entry->buf_size, __entry->amsdu, __entry->policy,	\
+				__entry->timeout, __entry->action
 
 /*
  * Tracing for driver callbacks.

-- 
2.34.1

