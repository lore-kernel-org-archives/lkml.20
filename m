Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DFA526AA9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813231; cv=none; b=HsPJg8ZXb7XBu4+nOBSDEU4inA52ZuqEvyI3cVJjTnu8rwSQPO8s9OzI/1yOQfbI6uMBOE/1nddTCfCYT8X/+v9B1x0216DkIkT/vt2yL+aylndmdScJte6Z0S+SQAuNXvJwFfg5/yenldPdXUHn19oX3lH9wmoKO9/sIDal8SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813231; c=relaxed/simple;
	bh=86w9hu+WJ1z3hy9Or+mlRGtKjgaxVht0KJsSe0k3fEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/wQewBxYP+o5F90753XJgJeuvbXPfr2dXwvutI2snt/xaJbzM4/rNRiktO9YJA0Xo+KTepdebNxubJBOhjgbhkb5dn9FDr1PPDJMHWYHKdzjlrPfcww5GJX/88D2IJ8rYyCDI7GxuFN9XWZOXCgJoXtHnz+9O/nNCzWrYwEuwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAVSusNU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihQU8Mzt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAVSusNU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihQU8Mzt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H85s1838247
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gofo4g5PMnVYPHJH99bL1SwGrtDr+P/qsI5BTGGqohw=; b=RAVSusNUGqWXGM24
	HXFfHQS0H6iLEF2X3JaSi5NtkAfaOD/wCk32AQbYBtjiqEShavXWh/YEjt9oJ/4M
	55a8JsB1m5mJsCB9l3G3GjctySL9GZ+JckPHVOFEG7XnqpVxD4EMR2zNu5m3lMeE
	CQ83XH89MZuXpY7G/ZjKrrDLC9BM3k+0PWyz21WSVUJgx4NZxCkcN39rqE1y97hK
	dIxKv7xGU2HVnrWi2b0+knt7OTlqX5j2gCFS9B1hIbCr9oGWufb6B+SzoRZfrq3l
	PrQLe6ySXkdHhZ1RNaDaaRcYapqMX4tpOcS3vgla0AvhcbciX3rJFWSXWhoe1rDU
	E3u1bw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg2j26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:33:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so4864362a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788813228; x=1789418028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gofo4g5PMnVYPHJH99bL1SwGrtDr+P/qsI5BTGGqohw=;
        b=ihQU8MztNpQ5CWHSj9SaMdxQCZIBVBdOBkwnTVqaw+DK4Cyge3kAFsjPQjFObhNJnH
         sCdKWPXELq6EJtjHFcM6M+CSuDO3Soy2LLsOPy7UD1ZbvvFm5lzAaU4L8FJhiB1qDPK5
         CrQveQX3Ml0NzR1KIWSQTqISloRHRiKgntxXrr9AYvkCNm0J1mvvYY+WtLbJG2vbWY4L
         ZuJi+YI06HlpC6qbJYfOu9+rk4UuVhJte7PDL31IPkaM0mCfVm88F52CmFPsw422Decr
         Pb5iX800ql/5rfQj0tnTPuCNdTDkcqWdnHgnDZFGHWP85fyCNzUVw5Iy46WqF8QoxWgw
         qwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813228; x=1789418028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gofo4g5PMnVYPHJH99bL1SwGrtDr+P/qsI5BTGGqohw=;
        b=SCQPXlmsDh2GlyvFQ5tXgFkFSgg7Jnn58czYYTwemP3awof3LPnTZfESxMlQIPAeBH
         qbODA9GpEDMui0GTjeCtG0nwAGdm5mk7HrKX0fyGRjfkBVPU+T27nNObuTa3BH/Cv39s
         tiXDgOT+dy+5U2VAKaEESOf89M2dKybzHrdcv/Edq0Asr94MVgMo7Q8lOE4T0n3d6Fxr
         MkLxq94qps+e+exSJl7rehpmS+HAwK7xSfqn4pYge2V20DiqEALWRQYYYwO4mln3eaUR
         BqdKQoaCSXTxBWY1DPzzALqo4/3TGoyXL11M3QNA2h+cQU+EK0XSMXwgy/SDl2z7D7Ja
         EgAw==
X-Gm-Message-State: AFuF++nNqs9Ff333xgEOAVIHhZ5gH7DnvZrPR42DD+qi9W2+z2YdqRwX
	ZzX9X9Kh8vlKm7pef6vK+IqG58b6A3K+lOLiyaALjDc2GqnCNa1v4HQG5MQCZHbvPU+9RPsfXxd
	JHjjJvqfskq12FVCAkdOB3qT0qUxyq8htSItdNCiWbQn0rk8gmnBR2WVzRGaHP9OJAQ==
X-Gm-Gg: AYBFou2nWdpQ8ApkOb6gJ7BekDsLC4X+x8EfLowNZoz5OhiuJnA5g2zEHcQKQ7dnpld
	X/H8bmXdL9EJUbG4vig+/xXTBVODz8eNXZRRjClZlybA5HRHgQ7ztV85NKeohrxYxwbJL/32b+r
	C2NiU3X+UiS7UQsy4pfRJPDTCgPTKPZa0RUjDOznw+hOe+pZld0q60hMWAGiuHGjkZAUYzXNp+l
	laO9qj3RWEewcKZb+6LwEyYaQL+GrMoxOXARyMVGE2tGxt8RhK7r08o/BDO7QLqMH1UGTuxORMb
	Uq0QGGW93KJwEfYqdSpAC7DiftLAD93pmaZ7SbX2CR//kl1FztAb8QiSHdP9Us6ZhYUTVt35wn8
	KUAvHsX6LED/OUXekczf0boKSO/FgSaE5Hd4CA6t6z7173qtJK5oB56Db/XRptnhUw/77VwGDFd
	NVvrL1ugrdVRnNcIhM1Ax3gQ==
X-Received: by 2002:a17:90a:f945:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-39b8bd31191mr2581274a91.6.1788813227998;
        Mon, 07 Sep 2026 13:33:47 -0700 (PDT)
X-Received: by 2002:a17:90a:f945:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-39b8bd31191mr2581239a91.6.1788813227557;
        Mon, 07 Sep 2026 13:33:47 -0700 (PDT)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm47841297eec.16.2026.09.07.13.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:33:46 -0700 (PDT)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:59:18 +0530
Subject: [PATCH wireless-next 09/18] wifi: mac80211: Send BlockAck policy
 in AMPDU action
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-smd-v1-9-65ad4ab30fbd@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfX6Oo4bNfu59jD
 F4kv+VwAKL+Lpx4oAoAwQ8TZcuxBQPjF70cQVMVR5GBXhdgrW/Ryom9cfhtahrb0Q4mWMu0jJrH
 jGv6atIBzGOdqH2cT6BdV6sv6I3y+GMV6NgRAb1s8Zsn11LoX/ySUS4sepgeAuiraKp5V6tVeKv
 TvcA727ylNx/91JVUxqA9JbPO1n/K2xurX4Lypi8bYI/LmetcA1LNeG/Ex7+ku3rajKiNK303b3
 geYe/GZ7794v5Elrx/oyUtllfS4GX0xEK1ew7fvw6+JUBR3h1uOHJdwFF6zACDsMfXTwJH/Zzei
 tQeXStI2O9R2GcyjtUWC6gQHswVLnXvu3PrWfPGFD3GrE2gr1khwNHy9e09JDsNQ9wR2RPEx1LM
 Ot1KWn5NiPXy6ImY0my6FmmB/fNpE9RhzkyC7Q7Xhm0fKX11YbHMPS808nhl3bur8d2V8FkJXTA
 auD99PpUH0+eu1sSOPg==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9f1fac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=poGJry9enlaRV4ryzAsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: UL2AetTouuvLhLjeIbAkDrrqDquPYKFj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNiBTYWx0ZWRfXzEF3SKmPc+ni
 38M6T/Bl1+FV8kSEB9bCPZ33xOAcmVf7bQiDwgT48++AVOUJ/hjleR8H5M3Tt5qnd9pbf6qCc5s
 nZJaN8D/ZYCvnGI3gLip2qsmqGw/yeo=
X-Proofpoint-GUID: UL2AetTouuvLhLjeIbAkDrrqDquPYKFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070226

While sending AMPDU action hints to wireless drivers, mac80211 does not
currently send the BlockAck policy extracted from ADDBA frames. Send the
BlockAck policy as well so that drivers have complete information about
the negotiation. Policy is valid only for IEEE80211_AMPDU_RX_START.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/mac80211.h | 15 +++++++++++++++
 net/mac80211/agg-rx.c  |  1 +
 net/mac80211/trace.h   |  8 +++++---
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 9b5fa6d6281b..32b9b7cd1685 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -3964,6 +3964,19 @@ enum ieee80211_ampdu_mlme_action {
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
@@ -3976,6 +3989,7 @@ enum ieee80211_ampdu_mlme_action {
  * @buf_size: reorder buffer size  (number of subframes). Valid only when the
  *	action is set to %IEEE80211_AMPDU_RX_START or
  *	%IEEE80211_AMPDU_TX_OPERATIONAL
+ * @policy: BlockAck policy of type &enum ieee80211_ba_policy
  * @amsdu: indicates the peer's ability to receive A-MSDU within A-MPDU.
  *	valid when the action is set to %IEEE80211_AMPDU_TX_OPERATIONAL
  * @timeout: BA session timeout. Valid only when the action is set to
@@ -3987,6 +4001,7 @@ struct ieee80211_ampdu_params {
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

