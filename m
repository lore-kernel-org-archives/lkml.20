Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952010;
	b=zIpFF097VrMHLeT9Jq+zmc+whboYsQMw4YhSdoOpzFwI85JIjo7RGi70iF7clqsuVGuP
	 xlONTwc8E1pDEvrkYoOcZXixD/n61zq5f7EuOB+pGOCOHy6xkBtL3d3BmgYdqTltr/adz
	 0m6puwB7oDDqCre+N9LxtiuVo3i+Lq20NuQt5z5l65WLlG61QnAYqyBUMiXS+Ls7Qu3VU
	 GnPQO7pM10P2sDBY/BtfWRNzSe4hc9a1cDS7h5O1P6YM2rtdaP+JQEUai4VTnuJeGYBZZ
	 HdRDuPjix6br+3wHc7wgf5CORUmmcN1ZDgHLrEOEBz6O/psPQILuyODdCbTzg5FBRGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qMOncR0UoevAZucFiHIuWkcdcZlD/liB3Dpz3ZsMqk0=;
	b=ttF3O6m1Vq0YCFZF0wrRupM8jz32b+tM2uQV927ZVNNGHlH/bcco3f1i4MO0zkbt6dxn
	 YuET2oIfPatM7XEACcrhbEza0rChcM5f7FbPg28jPoDWR0By4AGKRexG1jcor0xChNqEn
	 7+AuQUMypVvZlWXtyyiC0cNRO6wYHPkx++JQeZUbmAbU2BWtxsl2BfccTuOJ1rakhDtcx
	 r2CWAZbkgWzkxQ2NiOF6RTcpsYy0TcMl7GBdmbUBXi/oNnnrIFlz4aDGS8c2xu+hrwSHj
	 hJN7Um2C0sQSFMGfVbtEvIvt7hNQoemA+G5Oq+SOKpl9gzf8/J9mV2OpjgXnLzLNbEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N2aR6UFK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=My4voQ4G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB99606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FB99606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N2aR6UFK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=My4voQ4G
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R7Jk3243884
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qMOncR0UoevAZucFiHIuWkcdcZlD/liB3Dpz3ZsMqk0=; b=N2aR6UFKBc8gvoh+
	IJ+t5DhcWhL1LIJddtns1E+aKbc1YK3ZglbkUMFGWlSWF1yN2iBwl5exy2i8yoYd
	NhC52zY+lIGhLm5Ao06l/nJuZVUHu/7J3FdSHX/6ViWarvU9JY324JSIy3g2fXWj
	8mtPZcfOEAabcMdYs6lAzecEPH9eSpsgnybbXbHNQYWQ9YPAgwmuEjx/FfrQLT39
	S1T+e1zi7ccW4tew3Hgv4cZMSy6hEH9aLJLDT7272AKSDjNW0m2HLujJRaOSkpis
	St4/74H0PuCVxVgCwQgG0lEb0v8C6VI99FUZ1JE1Knn509GpH2sL7OCdo+2Rq1sP
	I6sV1A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1pmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:00:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso340119a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952003; x=1794556803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMOncR0UoevAZucFiHIuWkcdcZlD/liB3Dpz3ZsMqk0=;
        b=My4voQ4GpPNVXl0ivdl/HytgYBs0xGQ+CD2rjXO6ZJ++sfqPS5HwO+X9nEYoSy23SR
         eI/N8mQzs/LMYNOCR99y1zghKwKhxmtAwCNzY3nEKT97r/MIDZzR0mc+sm06IuIniMEo
         LBpVbUoi3ULlNS9lVR2msJagJRBW+U6ONMWZmvWwZmhXvaCj0v1fMPTmy6d2zY965h/h
         ay+VdDJNlQp0Y6H9DAkYQbNaQVmil5r7cs/s8bY9u8MmDQ5UCMVJMpUb01S0tw5NhBJ3
         LO4/ho5VhidcDcobEnD7+QgA4cW9pC1OCC4JbHyZSZ7kCDNG9gxFB3mfYpcCG90aLBJ6
         gPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952003; x=1794556803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMOncR0UoevAZucFiHIuWkcdcZlD/liB3Dpz3ZsMqk0=;
        b=avV/ni+sQLOtmiMlvWkc7ReXuaqgnJAnbAmmUN5NPaU6/N0L5AGkWKRloeJKlK6F02
         iUgzlCpHdAENrTCKya+THjjxFqsaOELaj7k+0omYItyBT/qLo11xfKATFAYTIY4DuPLO
         b6GkS0vq2ZGcCtFZpCFeWrJABTmOsrA6iXio8S67BDWH6WaMFEiBo9FujtQkMxTuiKN/
         ddfc6sSJWtK4w+M5PqZ2C6V/xyc1LYwGX1go9/25MHzZsMq8QDQ+ExaItiYxmA6nseR1
         ZWqqDInqb4VFP7li+Ln8rL0z6MLTaSt0nXuO005BUJZDuAIgjkfJ6+TcJ5/QTaLLoeFx
         tmEg==
X-Forwarded-Encrypted: i=1; AL+hErGCaLgez4GOuJRYewplW0yIaX1d9w7e0wD+alRpxZTTbeRTFP6XixF3K+UjB7/ODcRb6miH57EwAeFAxzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZyCD9HKDwWJXD+W7cTMwOmP/1VtW3rqDLF+5955MGMmig3jPf
	TpI9q3mWy9woOVRi+0NgM+XlCnEGrUGuEoxkoYYwd9hMAI7PivTYZaC/1binlnUpZEZ9vod6xCa
	xHv/1ug4ou5aI6xETW2JEfj14Rl9Kmb7fYOUot+VpsPR5zwYQ1fGQKnpr9vIOCvQN4A==
X-Gm-Gg: AYBFou0j/aMwgIUctX0AwEL6OZJ1qrWPPK4NOi/ensibNhAh70KiverF3rz+1z+qUB0
	BWMusZbwHXHXKgGsDz4ZgD73NnA9IlYZ61s/MPmnqxMAQBQTEJ7VSNhjCP76IMjyfKGGQDHAUH3
	Ki0kS8J2y9yv5FEdgjLMWbqaQ8tpjFUqfbRwu9Gl1SMcNHil/hgMFRtazS8keBCiW0fUAgIY/uD
	bnTUliLUBjj6Sa3pqh87qtbeqsHCYOQLM6s42LjAjgseOxLVO0SPGtWohYFPtA0vxc7QJL4MHAX
	X8ws8pPA5QWuz1m+aZfWezNNdzzm3tC5FjMRPiXb4dDYQYldk/pq0KJy+BU69fPm2vuk7SuO7ZP
	REgjW7JofcNZAPj0Dlmd+4UFv0grlZDkkXov7dIc9c1jzMp+Bdzk34HtnNKh5bbJSutYDm3NNom
	YmVpYjp6uvtNh/OjU13V49sVSRzOPUzFn78jkbmwIpjV9SeZXDMmjo3ROC0F2jq3/yd1GZxyU=
X-Received: by 2002:a17:90b:1802:b0:3ac:80dc:f407 with SMTP id 98e67ed59e1d1-3b0db71871fmr1620479a91.60.1793952003350;
        Fri, 06 Nov 2026 00:00:03 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:3ac:80dc:f407 with SMTP id 98e67ed59e1d1-3b0db71871fmr1620453a91.60.1793952002799;
        Fri, 06 Nov 2026 00:00:02 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.06.00.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:02 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:53 +0530
Subject: [PATCH wireless-next v4 16/21] wifi: mac80211: send BlockAck
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
Message-Id: <20261106-smd-v4-16-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed8904 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nliDdBWBufQ-nTcFh1oA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX0JSYdEYiKtv8
 5gOqMmP1wmVbi/FupZkDQ3LVtuAoGheT/BKM7ZcfhimtZKvSPn7pBVY3h0/HNJh/ofpO12L34Ir
 9mny8JKTGqseHq9Uh7oagdpG6HiNxYM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX0ZPGT2eo1ErR
 IJgCngLddgCwiDCnk///SsYTDSs7X/RYWh9sR6CJyIQNxNYmUmrg0EtYapmGzfqu55qHqn5acPI
 5r5YMx12AsqU6BhMDX/yfzg4YsUuneIftG58uzYUCmH1Z/+RjM3nWh6nLtLdxXC+f1D77MAjtQW
 VNIyaCtxtL1iIVPZGlIMaPhuToJ8b8/HMflAO1U5kLoRDJfoN2ni/I5ArJMYxTssnLKqLax2cYR
 KBNkTskSt5Kc24yYvQH7XU9tQPF96VZio9ijSuy72Z91vPYpA2THOaEXqLzm2noeVUfnCy6YueR
 qwzcnaFcDcxKxDNBij+Qtde5iRgt1gUVpPUxmr9Y4/lbKah3VWRqmV3hUfEiKWztck7O793TCaP
 bTSjZ152Q6bG5o04ttowYCrdR+Q48Smj+EsSziPob/AA93PF8FGM4Tp2FA133109ytFwrRuANH1
 aLPgZq0Wf9igAwM0/zA==
X-Proofpoint-GUID: iKhoTgA9GxA-AtOT-GvvmIR_ZCkiGnXl
X-Proofpoint-ORIG-GUID: iKhoTgA9GxA-AtOT-GvvmIR_ZCkiGnXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

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

