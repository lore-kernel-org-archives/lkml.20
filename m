Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754652;
	b=Cxoe4dFrX/QOcYLRqeNCtoIFTreikmBUQEgHi0K/A3Vyp5NAlg5IX19pgEYhydjqHsxE
	 soeCF7v6jqhM8nFIgveIy8i7LIJNvGCOjySD5a+ip+SykXTSY5A4kOjbKOYutHJYGUYK7
	 5heapOOVToP/z3f01rsBYsdw3v09+SPZ6y0gKqbuMnKdmAarxVm1TwghDTcpgf4EZcKZ1
	 Y8SsfUkdG16DjyO05FUg6TY7E66nEIRJYH/OLOLx98kzrOalZZzbDWr9oAbGDZy40GdHJ
	 rGsPVk0KF+E2KSI4okD+E7uZcjBWt3x8z2XJ+9oV2SghnRtTaxn7tZjcoZOD55BS1JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3iz3Cx1junU5AKH67YJX4/Pd0NUTUZq/2Hnk10krITE=;
	b=0mr7iNUjwCNUaVTujkUzsnU6OCK59jxhn//hkGgLfZLL6gEBUFdv07gNZmf4mPqxF0IX
	 6bW9wJNTCoweBCU3ryPkyv8wDeOc8yiee9VBuEFbb2zSDGtNBsy1SlnXqgCsI9FnFc8w0
	 cQ3NYT2BSN9YkUN+cLn+BfBZsgxoMnsvPY+mc8S7j84TaQ95jfeZDHynQnY3wI9OhnhmS
	 BATDK56pNV5ACArh4U1gBq+wXCBlyWl22PhtWBfXxszbylmQtzyY15KIuHIAsfYVcVVBw
	 qXxwDUza4U1cBcmn5mr3PLAF/SAAsLOvA0bg+UQ5yFCuezpMrsnIslyGgVpWCqd+nXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NmZ/OYXV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQJ4+1CV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496DB606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 496DB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmZ/OYXV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQJ4+1CV
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RUDM230860
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 01:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3iz3Cx1junU5AKH67YJX4/Pd0NUTUZq/2Hnk10krITE=; b=NmZ/OYXV8kl/llRx
	dGrpnN95QBk8Y3ULkyl8OkQpfGrZjNnPR/kW8ZQKbiTA7uSkxeewTwOlgpTRafTE
	mbsZlQ8rKErPtTn+c+3zWRFLiug7OzCzGoNnbA9Vh5pcwZlGhLyKJWjXZmW/u30V
	hqZwL4lLWBPUM/E77uHBIvLpSCNdteihX5t028XhQ+dMZt2DSeibN5g3V0NA/CAp
	Q2Z8FZKLuz0TvMz/1xdLO/887qScbIUUgfhj3vutN0crvsP9uD3TtewkoLGT16ge
	hNd3rCpuGzxB+FT01tsSQWkmPTi9i9qeaOjKb47mDSu1sLr/khm9aH3F89JkoEx3
	iDB04g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypjdvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:10:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36ca254ca2cso264734eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754649; x=1794359449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3iz3Cx1junU5AKH67YJX4/Pd0NUTUZq/2Hnk10krITE=;
        b=RQJ4+1CV4D4sejhH4cTzKKBizjMlQRC6Tcjx0y93WVwYaTDGc2uUIGsASmzbzoZwnw
         5rc0i54wI7R/ZHWJ+vKqi/2FF+sEzNCgmEVHdUhwcC5loeTxADaeGjkBuY2S+4xaN98P
         rY3BdHGApiUc4Gs9r8skE/W+bwlUslwbu2CmP95oGkUisiEmGzWNy9OSoU+RMnDXUX2E
         zwQUCqRfzHA9hxSVHtomH3OmX+J9NCwz+MrZzRmxh0MD9wkKFhvVjgH8xZruMCzo7Lez
         nxeA9jLs10VKgeZcYQg9M/k4sIwiVn1IBFzmNJVVmu4+e+9VX6C+frQkarrgh+ft1Mpe
         JimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754649; x=1794359449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3iz3Cx1junU5AKH67YJX4/Pd0NUTUZq/2Hnk10krITE=;
        b=QdbD/rSQ/v31HTCCIgbvOcYq3VHGMxiI9xR5+/w4UvAafPpP4STQdwd4FftiBBIVrt
         92mvBwQ9wF0Xb0UM6F3W0/ZqPeImv7fyWGtP+A+vsQ6Jc2x3a6SM4y4s3FIgCaioykNh
         rZoNvpyrygdVUSsupQcJnTafgyGF3fh42HKi4QSPwDB4AHDsK1XoOQ0zLxOwhw+oFFK4
         9tmGGTaUB+8IpVQMhqIcudKuH+M9JY5Q9KUFcLIc20cAqZ9Rt6KTR7u9EhUNm8ZxC/dV
         ptEA8fSx/LbrspHWdi16iCquw6jMguZXKBy2axg5HL+VZ7/+nJ56GXNmNGSBTDah4bRD
         728A==
X-Forwarded-Encrypted: i=1; AKwUvBz67mOkSKocjqTR4S6GQMsLxoZhDjzoUbSjvaH7JHLGxqqhLq/98GE33YyfyuiN13bY1+WbTC0khE60xEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3+sscwXycjgb+50BS8UdkFaTpliqr4njDhtN3sg0wVocl6Akt
	0GKpVfttW0F/i0pei9OPLtnfWJzAtpmCsJbTBxrhHeXELaqKRd279AWCsFhgfrHMuSPcq5lH4c3
	Sl6Z6H+JYrTXhN4w+HMK3BbrHElS7yblvGu4OPP+GqhMNVyO3qhQnyF2qBso4iZUtpAc=
X-Gm-Gg: AYBFou0rGS474B7SLnUeiCQ1U4gycwtyu7t/kYTqIukv1Jlfx+HD2I05k/CQK5ELA7v
	q+68JYMck7qAPD36y4sprUBaAHTnYHYYntk4kxnXn/Qq3JXaTi+Jm0Qs2EA+vkpwPSSs1qnY3Xu
	hBEiV63FhT9rk+IG3aJFbpf2xFFof64reUXd4NqBe50Lcj0eD1CUe53t1vPUwhiFBlcDJLZ5G2B
	KYr2aiRcrU/q/aJhpdkFfPWxdJkB/W+c4I9JFaxUdCZZ2X9Kz7vxgkT3/SoFX+CJXVzYeO2kfAH
	5mVKnF26mtb4AZKZUo2t2tFIi8apgVWpyFYMl0ePL3NWt1Vu8rJg0KaSUsq7GVxIDiZzawQQ/nt
	O4+x/2XSs5nf5sFIX+Rqr5cHcraumKuFs8jhN03GL9OBPYlsLyFq0xAvvBUGmO0jfeuBtPxY1VU
	2nCTu5O0LsX+C5mxYfMz/MyWi9U87lJc+Yru6G
X-Received: by 2002:a05:693c:414f:20b0:369:e930:6bc4 with SMTP id 5a478bee46e88-36a423f6f4amr22540061eec.30.1793754648899;
        Tue, 03 Nov 2026 17:10:48 -0800 (PST)
X-Received: by 2002:a05:693c:414f:20b0:369:e930:6bc4 with SMTP id 5a478bee46e88-36a423f6f4amr22540010eec.30.1793754648180;
        Tue, 03 Nov 2026 17:10:48 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:47 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:45 -0800
Subject: [PATCH ath-next v3 02/13] wifi: ath12k: ng: add high-priority REO
 command ring
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
Message-Id: <20261103-reo-cmd-b4-posting-v3-2-861adf04b516@oss.qualcomm.com>
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX+tBkuPKgWgFN
 PyyBz5qCv6lW7jLqfFCo5QdOvW0rxNcv33annVAST9RgC2tXz4f/Uw3LcSstZrvfcuyhYONTLZN
 0RbEkn4cWv6wFuWZ4Koccv1nBaTxySw=
X-Proofpoint-ORIG-GUID: sn4xZTS72yBGz-AOqWKl2a91j_KHfrQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX9cnrisvkLxkK
 6UFIlnpy7mXI3ajkTae3FOjKIhDz1/QIVI/L1fyiWcY8xn79qhyq2tia8ucFOInXHzIzHrLaLcx
 QR/khhyWNK3h4uriqVJQeYNwBwsMDmrwhxOP2Q0kzWsqkpTAz1jxXcU74DBfMu6Ja1bc/IYoXjU
 Nsb4D4KklnG8qDTCRgJV9yQvSeyrlY7xA2DCurjrazZzQ0DaaL+RZaqzMfgMeKUzPw15WdIQHZJ
 6X8uthQijTWYeZE7OcYFw3roLDB5qY6al5u41sSXFs8GMTZ90OU3AgQe3vORN8iGAMEH66CsjaC
 c7oNycXCJTo6fzDnzxs1vE29aeLSYm05ft02zN6twujT04m6WZngBtx3geR1gXXA7IB1Q8dFLeM
 oOxi39srRPxNO5vzV89ZW+03qeYPdJGlBliJXH8GXuLODnHh57FbOa6rws1LCRzK5ItASBWMR3o
 T+yQz9VjzyIm3vaAiRg==
X-Proofpoint-GUID: sn4xZTS72yBGz-AOqWKl2a91j_KHfrQ0
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea861a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ATb32olPAYJCz0g8maoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1011
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040004

REO commands currently share one ring, so latency-sensitive queue
statistics and update requests can wait behind normal command traffic.

Wi-Fi 8 hardware provides a second REO command ring for priority traffic.
Represent it as ring index 1 of the existing HAL_REO_CMD type, allocate
and initialize it in the Wi-Fi 8 datapath, and expose a separate
high-priority send callback. Reserve a distinct command-number range so
completions from both command rings remain unambiguous.

The existing REO command ring and common send callback are unchanged.
Only Wi-Fi 8 installs the high-priority callback and allocates the
additional ring.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k

Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.h       |   4 +
 drivers/net/wireless/ath/ath12k/wifi8/dp.c    |   2 +
 drivers/net/wireless/ath/ath12k/wifi8/dp.h    |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c | 109 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h |  13 +++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c   |  13 ++-
 drivers/net/wireless/ath/ath12k/wifi8/hal.h   |   3 +
 7 files changed, 142 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index d369d68620ed..3a369dfc8ea5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -11,6 +11,8 @@
 
 #define DP_MAX_NWIFI_HDR_LEN	30
 
+struct hal_reo_status;
+
 struct ath12k_reoq_buf {
 	void *vaddr;
 	dma_addr_t paddr_aligned;
@@ -61,6 +63,8 @@ struct ath12k_dp_rx_reo_cmd {
 	int cmd_num;
 	void (*handler)(struct ath12k_dp *dp, void *ctx,
 			enum hal_reo_cmd_status status);
+	void (*status_handler)(struct ath12k_dp *dp, void *ctx,
+			       struct hal_reo_status *status);
 };
 
 #define ATH12K_DP_RX_FRAGMENT_TIMEOUT_MS (2 * HZ)
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp.c b/drivers/net/wireless/ath/ath12k/wifi8/dp.c
index ff44b8be9534..dee73473cea9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp.c
@@ -245,6 +245,8 @@ static int ath12k_wifi8_dp_umac_init(struct ath12k_dp *dp)
 	INIT_LIST_HEAD(&dp->reo_cmd_list);
 	INIT_LIST_HEAD(&dp->reo_cmd_cache_flush_list);
 	INIT_LIST_HEAD(&dp->reo_cmd_update_rx_queue_list);
+	spin_lock_init(&dp->reo_cmd_lock);
+	spin_lock_init(&dp->reo_rxq_flush_lock);
 	INIT_LIST_HEAD(&dp->tqm_cmd_list);
 	spin_lock_init(&dp->tqm_cmd_lock);
 	atomic_set(&dp->tqm_cmd_num, 0);
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp.h b/drivers/net/wireless/ath/ath12k/wifi8/dp.h
index 4b773dca0483..3d1ce8f31ee8 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp.h
@@ -42,6 +42,7 @@ struct ath12k_dp_wifi8 {
 	struct dp_srng tx_exception;
 	struct dp_srng tcl_cmd_ring;
 	struct dp_srng tcl_status_ring;
+	struct dp_srng reo_high_prio_cmd_ring;
 	struct dp_rxdma_ring wbm_refill_ring[DP_WBM_REFILL_RING_MAX];
 	struct dp_rxdma_ring wbm_idle_ring;
 	struct dp_srng tqm_cmd_ring;
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
index ca82f9ac0e44..0eea810f68fe 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
@@ -15,6 +15,8 @@
 #include "hw.h"
 #include "../hal.h"
 
+#define ATH12K_WIFI8_REO_CMD_HIGHPRI_START_NUM	(DP_REO_CMD_RING_SIZE + 1)
+
 /* Wi-Fi 8 uses cookie-conversion: the chip writes the SW descriptor VA
  * directly into buf_addr_info[63:0] of the REO destination ring entry.
  * info0 holds VA[31:0], info1[7:0] holds VA[39:32].
@@ -48,6 +50,99 @@ ath12k_wifi8_get_sw_desc(struct ath12k_dp *dp, const struct hal_reo_dest_ring *d
 	return ath12k_dp_get_rx_desc(dp, cookie);
 }
 
+static int ath12k_wifi8_dp_reo_cmd_send_ring(struct ath12k_base *ab,
+					     struct hal_srng *cmd_ring,
+					     void *data, size_t len,
+					     enum hal_reo_cmd_type type,
+					     struct ath12k_hal_reo_cmd *cmd,
+					     void (*cb)(struct ath12k_dp *dp, void *ctx,
+							struct hal_reo_status *status))
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp_rx_reo_cmd *dp_cmd;
+	int cmd_num;
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_base *central_ab = central_dp->ab;
+
+	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &central_ab->dev_flags) ||
+	    test_bit(ATH12K_FLAG_RECOVERY, &central_ab->dev_flags))
+		return -ESHUTDOWN;
+
+	if (!cb) {
+		dp_cmd = NULL;
+	} else {
+		if (WARN_ON(len > sizeof(dp_cmd->data)))
+			return -EINVAL;
+
+		dp_cmd = kzalloc_obj(*dp_cmd, GFP_ATOMIC);
+		if (!dp_cmd)
+			return -ENOMEM;
+
+		INIT_LIST_HEAD(&dp_cmd->list);
+		memcpy(&dp_cmd->data, data, len);
+		dp_cmd->status_handler = cb;
+	}
+
+	cmd_num = ath12k_wifi8_hal_reo_cmd_send(central_ab, cmd_ring, type, cmd);
+	if (cmd_num < 0) {
+		kfree(dp_cmd);
+		return cmd_num;
+	}
+
+	if (cmd_num == 0) {
+		kfree(dp_cmd);
+		return -EINVAL;
+	}
+
+	if (!dp_cmd)
+		return 0;
+
+	dp_cmd->cmd_num = cmd_num;
+
+	spin_lock_bh(&central_dp->reo_cmd_lock);
+	list_add_tail(&dp_cmd->list, &central_dp->reo_cmd_list);
+	spin_unlock_bh(&central_dp->reo_cmd_lock);
+
+	return 0;
+}
+
+int ath12k_wifi8_dp_reo_cmd_send(struct ath12k_base *ab,
+				 void *data, size_t len,
+				 enum hal_reo_cmd_type type,
+				 struct ath12k_hal_reo_cmd *cmd,
+				 void (*cb)(struct ath12k_dp *dp, void *ctx,
+					    struct hal_reo_status *status))
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct hal_srng *cmd_ring;
+
+	cmd_ring = &central_dp->ab->hal.srng_list[central_dp->reo_cmd_ring.ring_id];
+
+	return ath12k_wifi8_dp_reo_cmd_send_ring(ab, cmd_ring, data, len,
+						 type, cmd, cb);
+}
+
+int ath12k_wifi8_dp_reo_cmd_send_highprio(struct ath12k_base *ab,
+					  void *data, size_t len,
+					  enum hal_reo_cmd_type type,
+					  struct ath12k_hal_reo_cmd *cmd,
+					  void (*cb)(struct ath12k_dp *dp, void *ctx,
+						     struct hal_reo_status *status))
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_dp_wifi8 *dp_wifi8 = ath12k_get_dp_wifi8(central_dp);
+	struct hal_srng *cmd_ring;
+	u32 ring_id;
+
+	ring_id = dp_wifi8->reo_high_prio_cmd_ring.ring_id;
+	cmd_ring = &central_dp->ab->hal.srng_list[ring_id];
+
+	return ath12k_wifi8_dp_reo_cmd_send_ring(ab, cmd_ring, data, len,
+						 type, cmd, cb);
+}
+
 /**
  * ath12k_wifi8_rx_spd_buf_alloc - allocate per-ring SPD scratch-pad arrays
  * @dp_hw_grp_wifi8: Wi-Fi 8 hardware-group private data
@@ -915,6 +1010,7 @@ int ath12k_wifi8_dp_rx_ring_setup(struct ath12k_base *ab)
 {
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	struct ath12k_dp_wifi8 *dp_wifi8 = ath12k_get_dp_wifi8(dp);
+	struct hal_srng *srng;
 	int i, ret;
 
 	ret = ath12k_dp_rx_pdev_reo_setup(ab);
@@ -949,6 +1045,17 @@ int ath12k_wifi8_dp_rx_ring_setup(struct ath12k_base *ab)
 
 	ath12k_wifi8_dp_wbm_idle_ring_buf_setup(ab, &dp_wifi8->wbm_idle_ring);
 
+	ret = ath12k_dp_srng_setup(ab, &dp_wifi8->reo_high_prio_cmd_ring,
+				   HAL_REO_CMD, 1, 0, DP_REO_CMD_RING_SIZE);
+	if (ret) {
+		ath12k_warn(ab, "failed to set up reo_high_prio_cmd ring :%d\n", ret);
+		goto err_wbm_refill_cleanup;
+	}
+
+	srng = &ab->hal.srng_list[dp_wifi8->reo_high_prio_cmd_ring.ring_id];
+	ath12k_wifi8_hal_reo_init_cmd_ring_offset(ab, srng,
+						  ATH12K_WIFI8_REO_CMD_HIGHPRI_START_NUM);
+
 	return 0;
 
 err_wbm_refill_cleanup:
@@ -964,6 +1071,8 @@ int ath12k_wifi8_dp_rx_ring_free(struct ath12k_base *ab)
 	struct ath12k_dp_wifi8 *dp_wifi8 = ath12k_get_dp_wifi8(dp);
 	int i;
 
+	ath12k_dp_srng_cleanup(ab, &dp_wifi8->reo_high_prio_cmd_ring);
+
 	for (i = 0; i < DP_WBM_REFILL_RING_MAX; i++)
 		ath12k_dp_srng_cleanup(ab, &dp_wifi8->wbm_refill_ring[i].refill_buf_ring);
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
index 9ef1474b1a7e..a05ab2f4495c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
@@ -11,6 +11,7 @@
 #include "hal_desc.h"
 
 struct ath12k_dp_hw_group_wifi8;
+struct hal_reo_status;
 
 struct hal_rx_mpdu_desc_info {
 	union {
@@ -146,6 +147,18 @@ int ath12k_wifi8_dp_pdev_alloc(struct ath12k_base *ab);
 void ath12k_wifi8_dp_pdev_free(struct ath12k_base *ab);
 void ath12k_wifi8_dp_wbm_idle_ring_buf_setup(struct ath12k_base *ab,
 					     struct dp_rxdma_ring *rx_ring);
+int ath12k_wifi8_dp_reo_cmd_send(struct ath12k_base *ab,
+				 void *data, size_t len,
+				 enum hal_reo_cmd_type type,
+				 struct ath12k_hal_reo_cmd *cmd,
+				 void (*cb)(struct ath12k_dp *dp, void *ctx,
+					    struct hal_reo_status *status));
+int ath12k_wifi8_dp_reo_cmd_send_highprio(struct ath12k_base *ab,
+					  void *data, size_t len,
+					  enum hal_reo_cmd_type type,
+					  struct ath12k_hal_reo_cmd *cmd,
+					  void (*cb)(struct ath12k_dp *dp, void *ctx,
+						     struct hal_reo_status *status));
 int ath12k_wifi8_dp_rx_ring_setup(struct ath12k_base *ab);
 int ath12k_wifi8_dp_rx_ring_free(struct ath12k_base *ab);
 int ath12k_wifi8_dp_rxdma_ring_sel_config_qcn9625(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.c b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
index 036c04cbbf16..af51ee3cd7e7 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
@@ -565,13 +565,14 @@ void ath12k_wifi8_hal_set_link_desc_addr(struct hal_wbm_link_desc *desc,
 		le32_encode_bits(cookie, BUFFER_ADDR_INFO1_SW_COOKIE);
 }
 
-void ath12k_wifi8_hal_reo_init_cmd_ring(struct ath12k_base *ab,
-					struct hal_srng *srng)
+void ath12k_wifi8_hal_reo_init_cmd_ring_offset(struct ath12k_base *ab,
+					       struct hal_srng *srng,
+					       u16 cmd_num)
 {
 	struct hal_srng_params params;
 	struct hal_tlv_64_hdr *tlv;
 	struct hal_reo_get_queue_stats *desc;
-	int i, cmd_num = 1;
+	int i;
 	int entry_size;
 	u8 *entry;
 
@@ -589,6 +590,12 @@ void ath12k_wifi8_hal_reo_init_cmd_ring(struct ath12k_base *ab,
 	}
 }
 
+void ath12k_wifi8_hal_reo_init_cmd_ring(struct ath12k_base *ab,
+					struct hal_srng *srng)
+{
+	ath12k_wifi8_hal_reo_init_cmd_ring_offset(ab, srng, 1);
+}
+
 #define HAL_RDI_MAPPING_MAX	32
 
 int ath12k_wifi8_hal_get_rdi_source_cfg(struct ath12k_base *ab, int source)
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
index d30ee1242122..fc5df78be051 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -1045,6 +1045,9 @@ void ath12k_wifi8_hal_set_link_desc_addr(struct hal_wbm_link_desc *desc,
 					 u32 cookie, dma_addr_t paddr, u8 rbm);
 void ath12k_wifi8_hal_reo_init_cmd_ring(struct ath12k_base *ab,
 					struct hal_srng *srng);
+void ath12k_wifi8_hal_reo_init_cmd_ring_offset(struct ath12k_base *ab,
+					       struct hal_srng *srng,
+					       u16 cmd_num);
 int ath12k_wifi8_hal_get_rdi_source_cfg(struct ath12k_base *ab, int source);
 void ath12k_wifi8_hal_hw_ase_init(struct ath12k_base *ab,
 				  struct ath12k_hal_ast_param *ast_param);

-- 
2.43.0

