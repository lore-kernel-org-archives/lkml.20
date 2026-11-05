Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907658;
	b=r0waacCdtdnmMJ9KokWJbvF+Z7wFqtaHc83SbCpDsb9xNUTvFBZpWFmzlGTGA89Jr0TJ
	 19gTmuwMPw11Yvbhw/L6/Nhf0UE2eGQAXXomrjClvkg4DSuq7kZKSGkOlshfWIFg8eLMU
	 8TlWBB8O0Xk7e6YxTLcA/S8tCJu+ZXmPpXxHOJDlZgXfURAnCZHltqTc7R5SZtcnnrl/I
	 NAW8PpmoAWvD7X46zb0zyRU3JSq/WnkLY2xKhcrmVsFvEyR1X8mc9He5fHhAt+JwhqtoY
	 2GyKmGhJM8kOWCViLSkNrkF8zoq4G2HCvuqX2j3TQix4Ddtt8UxDW8GqmJh4mSTrNNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qMOncR0UoevAZucFiHIuWkcdcZlD/liB3Dpz3ZsMqk0=;
	b=qQhCpB83y5Ng8PXKBliV1F2d9QEjW7E0bI+3Lr2d/27a5eDVX6U75YSbk0NMHVG2hP3y
	 Q7vIP58XoNzJ0YXU7H4kAXr+N9JxZgJqQmMjhgy7pJclJBQLzeDzSMZFFnrr/gtOcaWAg
	 kPNpz57I+ST88PakJa2n9jcUiDh4O/gr3XCQ9Zngd9oLT4X2Qy+RT7STD582VVhwUfSWj
	 NvEGBcuXjV1xSk49NfdU/qCJwBj+qcNh//X4oq0NPP+s0vF6ixGv6XtEq3bhhpaibaUnM
	 LEYlbpxKMFHTFPLkG2TuNjj8ZlH/Bkq2tIxN7MsOl8GkvcfMJrBUiv1HPn1WvACUWLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T6BYMOiF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L6h5Yr9f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A73460818F0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A73460818F0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T6BYMOiF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L6h5Yr9f
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5JL132751444
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qMOncR0UoevAZucFiHIuWkcdcZlD/liB3Dpz3ZsMqk0=; b=T6BYMOiFhKkxLHo6
	Dkpih88+idVGaCXcxDcCa2pviBgfvKEJT41K4bEnet7ADK8yzpCwlgCoLn/8eaTC
	0c9LRofEIf9F99hcxMhwx5c5LFW5sCHY+pW93OOc4YYGbTp3QmlR0iCNQH7xi94n
	5CnBzGmU2tJDML0uxNqZVRAp7c2BO1L/Wbz/5gUvW6l7Z6TDwOtXYk0E8msQn+Qz
	rBDlqM9lszTu+bvjXVKIkXpwIgLSCJrYKgDKY7NSriXYA2m72yvuStM5xz/ldN/J
	yk92rNwMCVajL8XLADa53sxwyf5DWfTjYheLJIwqduVrSG2FB4yQN23PRzJ8KcqR
	CMW/Lg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvp82h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:40:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso4237189eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907657; x=1794512457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMOncR0UoevAZucFiHIuWkcdcZlD/liB3Dpz3ZsMqk0=;
        b=L6h5Yr9f8sFasPvagPhFElvVByfAWrER00QHOdLW0EDVu0FJmu18mev4L2rBwxqgov
         bGRvuAy4meNaECKRtDLaReyL6ZU9i5s+sEgMxNF4LxiYtki8xrgN3pW4b8HNNyCPVx12
         T5i27vyQBe+SJMallK4QFa7oxLrHoTPewmR64hUNsPfqWCR+/zZW7DJPkybq8t/yHuJe
         SpK6sigFbTM8YGnaa2jMNN5y6Aj8KpjhGovSLJ9dzpE+xxW5kiBDy+ECvmgJ99F5zkW6
         MExZY06K04gnUU2zpQ5zE6+rld3r/WkLrwgBFu3M0skOJlaBNqGNqhcnUXtv15TO0cFL
         GWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907657; x=1794512457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMOncR0UoevAZucFiHIuWkcdcZlD/liB3Dpz3ZsMqk0=;
        b=TmA8kT9znHGV4I4BLbzm8yHzozV/0ffm0jYe84VUwF2nx1u7qofKwpxoK+YyFMjjMg
         p5BVlBpN/C9l5hhF80E3n9hMuaCJ+b5RlVAzo/0uhV238Sa2Oxdl71G1UQX7vjvaOpNH
         VCYYku6n+0NqBkDdeP+uvR3uOFjhlQbbNddgd3zlaNp7OGokoZeKovLhcEnZG3kh76LL
         1mlmDaXIErjS/E4NLyACN1ORW5uPNl+K6l9GlRXD4zpvbIs0CRDyODtvmtYjROE5jxSy
         w/oWhIzj663IqMWEzfdtCJKC+BbH3s6zKs7dfvdU4Ge+mM+DYxezOq+N/WVGjY4T7Ksn
         QZUw==
X-Forwarded-Encrypted: i=1; AKwUvBy8a/3OqsjU8zmZ+9ca9uOIgY/sGPskWwixt2A1p30uZ5tygeWtjk4topNOBsaqyMZDmrOLoKteklNsN3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V2n3p4dedobQYhfWtjbLapIwjeBM0IhF8xOPO5TJylHvVAdZS
	4KXNPCNpg3oc1YLshRERMAVcyl/p24qUXNZjS+658rWEJLRzRtmg1AZYGsWS3gqUlq3ayJ1QLGb
	q0jmZeeTqI2rhuFL2nX4/WsZ+FwwsO+1WNHF52nusAYypX8U7FDjzGyC3dbGFSvVhpHdos7R+fA
	==
X-Gm-Gg: AYBFou03lweLaVwfaOL+sQnyXlIk/z7XKtzkkdbzfxHoTRZgJr2B26sufhLNAO7KZf8
	EEStVpJ4m6uRRMWZjSgt0erQ+hfNqvljf64DvLesxxdQwBt1WHfigqrkT2ILo57d5x5U0py1Q6c
	r+kdMQX+3mMwB6ZJ6T7hoYDRaJJ0Pg5nsz1mox7UKDXyZ4S2IMHlIjt9jHOr88JfDe+u03j5bw2
	LStiBauQlJ7oXMAvHbj2cUCdOrLIshWBHnJ3EYCrYXum09Qj44qgG1l9NyXvDsSntk8CTvU4O78
	oRiGx0pTAHZItCFSmWCHLNcJUecgxUOI3ItwRk4GRKqahGEsZd2Kz6JjV3JFR3LtYZZV7oU/m8Z
	0KYDqJl21ZgzcCy+qPkhnITzq9E19YqXkR5cEloc+5hUG0Dr59JT8E/LZLCvBsOfLqf+Ds7YEBF
	i8PFfKKut/WTmBknSxZH0+/FAoJTnMkVH++tJfa250iTl0UoJqvCDGkegOskPsMVB9ynPNYQ==
X-Received: by 2002:a05:7300:7f22:b0:369:f18f:34ab with SMTP id 5a478bee46e88-36f75f2e750mr152562eec.11.1793907656709;
        Thu, 05 Nov 2026 11:40:56 -0800 (PST)
X-Received: by 2002:a05:7300:7f22:b0:369:f18f:34ab with SMTP id 5a478bee46e88-36f75f2e750mr152536eec.11.1793907656113;
        Thu, 05 Nov 2026 11:40:56 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:40:55 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:51 +0530
Subject: [PATCH wireless-next v3 16/21] wifi: mac80211: send BlockAck
 policy in AMPDU action
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
Message-Id: <20261106-smd-v3-16-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Ib4Symqa c=1 sm=1 tr=0 ts=6aecdbc9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nliDdBWBufQ-nTcFh1oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 0ywaf9LDafb3lT9DOwbklp6QM-6FhLvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX8A4cILW8cpzP
 jbva17YyW9LT2mfExD4Rw5YcDWmPIenMpDBdxIIsm6v+BhQ8qZABjxuWve0adMrd/QBY9Ja2k0w
 C1jpAqvxMA1XTHalP/b4miQOnLzPW+nzrsDFqk+62fiE+CHmuIArY5uO1xrh93NNUJrdCnsQzjz
 ChegKFldPQ+ENMI9fOF/Xpv+1MxmrwqW2BZIEucQ+MCyoj5+JnTvFMNx9ee5DvbskJP2x1ead9M
 QX1hxOhETDqH4Wjzzvz1Kj9XMLLjorvLaBliSxBvVS4JxYZoqHlCxH1ztV7I+qTv2Vcplx5if9h
 i95NGYU8504Xqfptx1IWq5+H1/hOEV6kgtipBeiRFYM9JqIpkZDkx30QzXNYA3mpIVr6RBkm4fI
 kFIKVyDc+AHF4LO2dMBwHM3rc4je/OZTcG/dNM3cWX5NOHiKOtwL49CEKPY245ZucHLj0RnXlVb
 fnCWKKH4rbwxyzTe3oA==
X-Proofpoint-ORIG-GUID: 0ywaf9LDafb3lT9DOwbklp6QM-6FhLvD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX3OxuJa9nIeaE
 VKPbCcbPJvoI9PmhjHuLIk7Crona0+3PHgeiUPAhl7YUU7GJ6bwCjw3UBTlZr4FmEzmt/mh/l+7
 R6hVpwlyQEwNwTLgAgJmVdTldKDVVEM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078

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
index 96acdb9ae8f0..2a595126b1e3 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -3979,6 +3979,19 @@ enum ieee80211_ampdu_mlme_action {
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
@@ -3991,6 +4004,7 @@ enum ieee80211_ampdu_mlme_action {
  * @buf_size: reorder buffer size  (number of subframes). Valid only when the
  *	action is set to %IEEE80211_AMPDU_RX_START or
  *	%IEEE80211_AMPDU_TX_OPERATIONAL
+ * @policy: BlockAck policy of type &enum ieee80211_ba_policy
  * @amsdu: indicates the peer's ability to receive A-MSDU within A-MPDU.
  *	valid when the action is set to %IEEE80211_AMPDU_TX_OPERATIONAL
  * @timeout: BA session timeout. Valid only when the action is set to
@@ -4002,6 +4016,7 @@ struct ieee80211_ampdu_params {
 	u16 tid;
 	u16 ssn;
 	u16 buf_size;
+	enum ieee80211_ba_policy policy;
 	bool amsdu;
 	u16 timeout;
 };
diff --git a/net/mac80211/agg-rx.c b/net/mac80211/agg-rx.c
index 01d6703767c6..d08b4b5b33ff 100644
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
index 83b06e9f72ac..1a45ed66242c 100644
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

