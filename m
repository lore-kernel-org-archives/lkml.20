Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754671;
	b=dnanXuhPCBN//un4Tg68cZn25NDL0XtPXTxlirT+Q3PAV7ho6ziR50j+aQmPp+TypZp5
	 7eWhYfWRsgnKPpYcJWMSAX1aFJFqlGgzPvwEQSlEasd/wZ9c/+cs9G6lE1FjXgoFepsuo
	 Plbfwz10XSdCvPw++34C1dljrKjSRSTWWKBxkmWj6rNIKq3fCGfONh4t/hz/qKAV6/jcN
	 y9ye7TLmen5mNXqo7VorMCa+AJKpcnLJjaiAUrvzl6BhVGxPV+TcL7JFsWqv91nwUkV1k
	 ZYTGs0aW/g3gE4hYbaMk8IpFSnFLLEeA026jtKT5pzbOFy86bIV6VDqdW177ZlyUmlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P6T+znYJFX63fZP+5bBevFaZYq1NjxngereBvySOQ7o=;
	b=aDe2E8OGkfQbictTnY9rYCLeefbjM54D0xwgB4BorE62UFBlUNPN/FLbGq9VjDedzMsa
	 HKJOChmdDDbGBGjASQvhecbafs5HB6RdZubmB9rvZjI5mTFkR5jfcFAAjdhLMjFpytnD4
	 lG9lJWzl+vf0whUkTCluJlFr1y5pMVWexFW+sEmHKGUKInkCUz/sVVdQr1Btbk33DyG/s
	 oGd4qJKv384jOLUzPf0J2kzfwDjfBwVkAUX9B61teY4sOsIbcl+GG4eoF+yFE4JtZV4AI
	 y4HbWxEz6q+zy3DBVrlnb1dZROLJcicGehSqjrKjCDQCvSmYyJwNy+YSJl6H8im3xvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnQ8tkCs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ko32UlUz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0CC606EEAE
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE0CC606EEAE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnQ8tkCs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ko32UlUz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40SDAL4071691
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 01:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6T+znYJFX63fZP+5bBevFaZYq1NjxngereBvySOQ7o=; b=dnQ8tkCsDqT7CwL2
	FvjyCHEDCwMUYsegh6FGYu/AWaW/yIyurgL8pjNt94d9jQxpfSZaEPtwBFIO8nQn
	QY6osp9vo1+++wcaa8FUI9nGtxeHq+5iyCuMjoq2WyxvakNhLRAf/+Je5lVjYczc
	l14AU2k5L/xqQudzsPX3B6HugVydHD4UMZrGmcWdCD78A9nuKR4lx6NNwPLdP5jp
	e8dBiqOCHYIoEnPJKr05ROeP7pJHdJN4c49hDw3C74DWcxtK41YlJxJpWmeuLjtO
	0waonw4iq/JUVDCQUKUvCVBnG87t+q9mMyTvzPhOTZpstG+cSFgPp624b9oFgp6Q
	BHGN8Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bjm5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:10:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a223755e4so520434eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754659; x=1794359459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6T+znYJFX63fZP+5bBevFaZYq1NjxngereBvySOQ7o=;
        b=ko32UlUzmZjh1vQPPtK8i1XkFuWqd24KVPZJeFza6OvLNVgytBehsUmfOHhaXQizoZ
         67TB7rO/3C8EeniAeMeY/e5d6m4RU5or8/vx2HuJD16FkJxJAOjjnv63FtA3jn0iCeou
         3B9K9sX9iNAHlDWX1dojhtwaaVu12cbX7w3GwWr9RnV2oY0Pb/QHoFckzfAm6A1G8qb7
         bgGTbHsMDXipNxWuCRrKS5JBYaC5xJUczDgABNV9nFIBkaw978DDjPUbCY5A4NQf+pEJ
         bQTr8Q9DOxgQvJzJyCmBtliHRW8YTHwBBD0uhV9c1J8vBvC1aaBjU8jPosvngTkI+ALq
         QUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754659; x=1794359459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6T+znYJFX63fZP+5bBevFaZYq1NjxngereBvySOQ7o=;
        b=AktAvEtGFhhZZu3Shwpht/vDTOW2L5jFFfbL18mackFF7vRNyTYrea0P+YdxI/Pd/t
         JeRR3ePMycgipFCuHiu6F0RImBE3f20M6kM6oVvLM37GDn3zVZsKVeCnzPvl3Q0vx7Im
         KBisFs/vuf3qqu3Ao2VYl9Tetu0GXSel8OHDUzzg7jpuTiwJT2ekSaRir8Lso8KLmDY6
         R/j44D2aRQeUzEEs8Fmw/xWgUYsU5fme/JszmCyOKwTLmu3r+PCzSWcH46Am9bDP1hr/
         Ti39kZF871xVLHfuXRDG/8oUgOfnr4U/X+yvAh2FvtNV2kH0chKnTfAGIddUNyY9I1qc
         Z8jw==
X-Forwarded-Encrypted: i=1; AKwUvBzAptnZqmIFBFphDT8wmvNuMRT74B5aEiEyGeCh8/cn3qX5XxAJniT53++CAvLCuPpmn+lRk3RTA+uPkEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sb9qszKv7+9qlbCuEE5EhxuZIHAKQuUXjR/H/WYU7mxVeAu/X
	5+gd+7yR+jgqoyAlY7inDeZuYlvVLL4qfd2J4p90+q32sA0bjaNf9vJSZJO6lk2Hwo2lJ/I/GoC
	BQaDUmz0gCwNiTMmyJddrwFUNywVRHbfYxUMTSmvKdcHqCPf4FvxrpOeJ6AF/GqHfciQ=
X-Gm-Gg: AYBFou0sPpQlcR2Sn9RHiXDHA4zsy4mz9s1TByCmsS/HLmYxzbZyl5xZykrA/n6oVag
	mCFeK+mcEq9PL50UuVAWcrDv8fldn6C/7sxKhT6vDUjqaiYwHW+teveLWZ8NbQRoR2EUS0dthGv
	Zs/H95VkQGmippvD8hBO3YVC9H9MvC/YVl1VWip5yFTeAKPXsdBY7obQJclRPbeBMQXYDB+gsHG
	4fz+wcACqLjGvJvcMvlZ1JpbUz6W5xywu8hKDmI5KLSwP5135VH2x6fTQg7lNVKf0q0ctasAfhq
	iDyNDi2IxyHN2KfhjDJxClD9m3wGZ1MZNSgi2RlGltpOsw5UxJMl1cXMzyDv/I1f0g3qyFZCuEp
	UspEy18+LgyZYVJ2FPk3+wvGDWzjdyhOuvZpwmZUqWGXGXWvDzodiCI2bwNOLuqDcWfuzeu+nrM
	VSBA48UZYFr3nMTs4C2sefaDKBRcrhrDeL5fds
X-Received: by 2002:a05:7300:c39f:b0:366:6644:2839 with SMTP id 5a478bee46e88-36a42203e90mr22284511eec.3.1793754658363;
        Tue, 03 Nov 2026 17:10:58 -0800 (PST)
X-Received: by 2002:a05:7300:c39f:b0:366:6644:2839 with SMTP id 5a478bee46e88-36a42203e90mr22284457eec.3.1793754657522;
        Tue, 03 Nov 2026 17:10:57 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:57 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:54 -0800
Subject: [PATCH ath-next v3 11/13] wifi: ath12k: ng: add RX TID REO helpers
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
Message-Id: <20261103-reo-cmd-b4-posting-v3-11-861adf04b516@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX8SHXeXLu469M
 s6qXQRMZHrXBZFaNyhj+v6v4+6HrJOxUSzB/vrSva+x3v9ndMPcveNMiK9AWrCTYcim3XVsPLE0
 ROePcMCAEMnR9lvTKyWZFacAYIuikis=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea8623 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kM6TWAs1cUZVOPE9P6AA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: hz8s6xZAZ6fvFWgoyiy9C5ODmiKbo-iU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfXwaqpKU4PDgyi
 9ByjzAGuHdSESucOdkBzi/bjaYba/bHFQipOqJj04kU1e8eF9TUvvK0xoGp92ZcAsuZP6IU750i
 dumKubeDJoVj1E9FRW0xEQu76U3Gxl3EXdeezagM0vaUVvZjWUf6R+7pM0+FMloIVP1BUY39cmK
 XA2vOOA2xoW9UU3hay+NSlkhg0z6+wSjANvQqxGeuHUDrJoRw1CmqY/Wc7g3JOu4dsN+vcyxrEN
 2iCkCMayzeJ/arB5y7rRinCsUK0YuPOMu3FZHehqRldFbxI1dkF8xL2iGitnEZhqgecWHtoe4gl
 MQTLgBFyuR5yFmrdagdYoRw5lCYNtwQuGcOZd1MloIv2kaSsa+mW+/H8OfjRZ9TUFkMtHoHuGYD
 aWtnSKhaSKPKUZILEo/ONGa9gruCdJrTxRVTXUgYysYMuFNvp/B6+Wx4o0PXNeTtfE7YgRjdzHn
 GhW1IAG8hVlDHxfClEQ==
X-Proofpoint-GUID: hz8s6xZAZ6fvFWgoyiy9C5ODmiKbo-iU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040004

The common RX TID path routes queue setup, update, flush and teardown
through architecture hooks. Wi-Fi 8 needs matching helpers before those
hooks can be enabled for QCN9625.

Add helpers for queue update, qref programming, PN configuration, flush
handling and fragment cleanup. Keep the helpers disconnected until the
final wiring patch so intermediate commits do not expose a partial RX TID
implementation.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k
Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c | 288 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h |  31 +++
 2 files changed, 315 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
index 14117430c43b..0b8a9d32e125 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
@@ -283,6 +283,287 @@ int ath12k_wifi8_dp_reo_cmd_send_highprio_n(struct ath12k_base *ab,
 						   dp_descs, n);
 }
 
+static struct ath12k_reo_queue_ref *
+ath12k_wifi8_peer_rx_tid_qref(struct ath12k_dp *dp, u16 peer_id, u16 tid)
+{
+	struct ath12k_reo_q_addr_lut *lut = &dp->reoq_lut;
+
+	if (!lut->vaddr)
+		return NULL;
+
+	peer_id &= ~ATH12K_PEER_ML_ID_VALID;
+
+	return (struct ath12k_reo_queue_ref *)lut->vaddr +
+		peer_id * (IEEE80211_NUM_TIDS + 1) + tid;
+}
+
+void ath12k_wifi8_peer_rx_tid_qref_setup(struct ath12k_base *ab, u16 peer_id,
+					 u16 tid, dma_addr_t paddr)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_base *central_ab = central_dp->ab;
+	struct ath12k_reo_queue_ref *qref;
+
+	if (!central_ab->hw_params->reoq_lut_support)
+		return;
+
+	if ((peer_id & ~ATH12K_PEER_ML_ID_VALID) > DP_MAX_PEER_ID) {
+		ath12k_warn(central_ab, "peer id %d exceeds reo qref table\n",
+			    peer_id);
+		return;
+	}
+
+	qref = ath12k_wifi8_peer_rx_tid_qref(central_dp, peer_id, tid);
+	if (!qref) {
+		ath12k_warn(central_ab, "reo qref table is not setup\n");
+		return;
+	}
+
+	qref->info0 = u32_encode_bits(lower_32_bits(paddr),
+				      BUFFER_ADDR_INFO0_ADDR);
+	qref->info1 = u32_encode_bits(upper_32_bits(paddr),
+				      BUFFER_ADDR_INFO1_ADDR) |
+		      u32_encode_bits(tid, DP_REO_QREF_NUM);
+
+	ath12k_hal_reo_shared_qaddr_cache_clear(central_ab);
+}
+
+void ath12k_wifi8_peer_rx_tid_qref_reset(struct ath12k_base *ab, u16 peer_id,
+					 u16 tid)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_base *central_ab = central_dp->ab;
+	struct ath12k_reo_queue_ref *qref;
+
+	if (!central_ab->hw_params->reoq_lut_support)
+		return;
+
+	if ((peer_id & ~ATH12K_PEER_ML_ID_VALID) > DP_MAX_PEER_ID) {
+		ath12k_warn(central_ab, "peer id %d exceeds reo qref table\n",
+			    peer_id);
+		return;
+	}
+
+	qref = ath12k_wifi8_peer_rx_tid_qref(central_dp, peer_id, tid);
+	if (!qref) {
+		ath12k_warn(central_ab, "reo qref table is not setup\n");
+		return;
+	}
+
+	qref->info0 = u32_encode_bits(0, BUFFER_ADDR_INFO0_ADDR);
+	qref->info1 = u32_encode_bits(0, BUFFER_ADDR_INFO1_ADDR) |
+		      u32_encode_bits(tid, DP_REO_QREF_NUM);
+
+	ath12k_hal_reo_shared_qaddr_cache_clear(central_ab);
+}
+
+void ath12k_wifi8_dp_rx_peer_tid_delete(struct ath12k_base *ab,
+					struct ath12k_dp_link_peer *peer,
+					u8 tid)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+
+	if (!(peer->rx_tid_active_bitmask & BIT(tid)))
+		return;
+
+	ath12k_dp_mark_tid_as_inactive(dp, peer->peer_id, tid);
+	ath12k_dp_rx_process_reo_cmd_update_rx_queue_list(dp);
+}
+
+int ath12k_wifi8_peer_rx_tid_reo_update(struct ath12k_dp *dp,
+					struct ath12k_dp_link_peer *peer,
+					struct ath12k_dp_rx_tid *rx_tid,
+					u32 ba_win_sz, u16 ssn,
+					bool update_ssn)
+{
+	struct ath12k_dp_rx_tid_rxq rx_tid_rxq;
+	struct ath12k_hal_reo_cmd cmd = {};
+	struct ath12k_base *ab = dp->ab;
+	int ret;
+
+	ath12k_dp_init_rx_tid_rxq(&rx_tid_rxq, rx_tid,
+				  !!(peer->rx_tid_active_bitmask &
+				     BIT(rx_tid->tid)));
+
+	cmd.addr_lo = lower_32_bits(rx_tid_rxq.qbuf.paddr_aligned);
+	cmd.addr_hi = upper_32_bits(rx_tid_rxq.qbuf.paddr_aligned);
+	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS;
+	cmd.upd0 = HAL_REO_CMD_UPD0_BA_WINDOW_SIZE;
+	cmd.ba_window_size = ba_win_sz;
+
+	if (update_ssn) {
+		cmd.upd0 |= HAL_REO_CMD_UPD0_SSN;
+		cmd.upd2 = u32_encode_bits(ssn, HAL_REO_CMD_UPD2_SSN);
+	}
+
+	ret = ath12k_wifi8_dp_reo_cmd_send(ab, &rx_tid_rxq,
+					   sizeof(rx_tid_rxq),
+					   HAL_REO_CMD_UPDATE_RX_QUEUE,
+					   &cmd, NULL);
+	if (ret) {
+		ath12k_warn(ab, "failed to update rx tid queue, tid %d (%d)\n",
+			    rx_tid_rxq.tid, ret);
+		return ret;
+	}
+
+	rx_tid->ba_win_sz = ba_win_sz;
+
+	ath12k_dbg(ab, ATH12K_DBG_DP_RX,
+		   "rx tid queue update successful for tid: %u, peer_id: %d, peer: %pM, link_id: %u ba_win_sz: %u\n",
+		   rx_tid->tid, peer->peer_id, peer->addr, peer->link_id,
+		   rx_tid->ba_win_sz);
+
+	return 0;
+}
+
+int ath12k_wifi8_dp_reo_cache_flush(struct ath12k_base *ab,
+				    struct ath12k_dp_rx_tid_rxq *rx_tid)
+{
+	struct ath12k_hal_reo_cmd cmd = {};
+
+	cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
+	cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
+	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS |
+		   HAL_REO_CMD_FLG_FLUSH_FWD_ALL_MPDUS;
+
+	if (rx_tid->tid != HAL_DESC_REO_NON_QOS_TID)
+		cmd.flag |= HAL_REO_CMD_FLG_FLUSH_QUEUE_1K_DESC;
+
+	return ath12k_wifi8_dp_reo_cmd_send(ab, rx_tid, sizeof(*rx_tid),
+					    HAL_REO_CMD_FLUSH_CACHE, &cmd,
+					    ath12k_dp_reo_cmd_free);
+}
+
+int ath12k_wifi8_dp_rx_assign_reoq(struct ath12k_base *ab,
+				   struct ath12k_dp_peer *dp_peer,
+				   struct ath12k_dp_rx_tid *rx_tid,
+				   u16 ssn, enum hal_pn_type pn_type)
+{
+	u32 ba_win_sz = rx_tid->ba_win_sz;
+	struct ath12k_reoq_buf *buf;
+	void *vaddr, *vaddr_aligned;
+	dma_addr_t paddr_aligned;
+	u8 tid = rx_tid->tid;
+	u32 hw_desc_sz;
+	int ret;
+
+	buf = &dp_peer->reoq_bufs[tid];
+	if (!buf->vaddr) {
+		if (tid == HAL_DESC_REO_NON_QOS_TID)
+			hw_desc_sz = ath12k_wifi8_hal_reo_qdesc_size(ba_win_sz,
+								     tid);
+		else
+			hw_desc_sz = ath12k_wifi8_hal_reo_qdesc_size(DP_BA_WIN_SZ_MAX,
+								     tid);
+
+		vaddr = kzalloc(hw_desc_sz + HAL_LINK_DESC_ALIGN - 1,
+				GFP_ATOMIC);
+		if (!vaddr)
+			return -ENOMEM;
+
+		vaddr_aligned = PTR_ALIGN(vaddr, HAL_LINK_DESC_ALIGN);
+
+		ath12k_wifi8_hal_reo_qdesc_setup(vaddr_aligned, tid,
+						 ba_win_sz, ssn, pn_type);
+
+		paddr_aligned = dma_map_single(ab->dev, vaddr_aligned,
+					       hw_desc_sz,
+					       DMA_BIDIRECTIONAL);
+		ret = dma_mapping_error(ab->dev, paddr_aligned);
+		if (ret) {
+			kfree(vaddr);
+			return ret;
+		}
+
+		buf->vaddr = vaddr;
+		buf->paddr_aligned = paddr_aligned;
+		buf->size = hw_desc_sz;
+	}
+
+	rx_tid->qbuf = *buf;
+
+	return 0;
+}
+
+int ath12k_wifi8_dp_rx_tid_delete_handler(struct ath12k_base *ab,
+					  struct ath12k_dp_rx_tid_rxq *rx_tid)
+{
+	struct ath12k_hal_reo_cmd cmd = {};
+
+	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS;
+	cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
+	cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
+	/* Keep the queue descriptor valid until the delete completion path
+	 * flushes it from the REO cache. Clearing VLD here can make the
+	 * subsequent flush-cache command fail.
+	 */
+	cmd.upd0 |= HAL_REO_CMD_UPD0_VLD;
+	cmd.upd1 |= HAL_REO_CMD_UPD1_VLD;
+
+	return ath12k_wifi8_dp_reo_cmd_send(ab, rx_tid, sizeof(*rx_tid),
+					    HAL_REO_CMD_UPDATE_RX_QUEUE, &cmd,
+					    ath12k_dp_rx_tid_del_func);
+}
+
+void ath12k_wifi8_dp_rx_frags_cleanup(struct ath12k_dp_rx_tid *rx_tid,
+				      bool rel_link_desc)
+{
+	enum hal_wbm_rel_bm_act act = HAL_WBM_REL_BM_ACT_PUT_IN_IDLE;
+	struct ath12k_buffer_addr *buf_addr_info;
+	struct ath12k_dp *dp = rx_tid->dp;
+
+	lockdep_assert_held(&dp->dp_lock);
+
+	if (rx_tid->dst_ring_desc) {
+		if (rel_link_desc) {
+			buf_addr_info = &rx_tid->dst_ring_desc->buf_addr_info;
+			ath12k_wifi8_dp_rx_link_desc_return(dp, buf_addr_info,
+							    act);
+		}
+
+		kfree(rx_tid->dst_ring_desc);
+		rx_tid->dst_ring_desc = NULL;
+	}
+
+	rx_tid->cur_sn = 0;
+	rx_tid->last_frag_no = 0;
+	rx_tid->rx_frag_bitmap = 0;
+	__skb_queue_purge(&rx_tid->rx_frags);
+}
+
+void ath12k_wifi8_dp_setup_pn_check_reo_cmd(struct ath12k_hal_reo_cmd *cmd,
+					    struct ath12k_dp_rx_tid *rx_tid,
+					    u32 cipher,
+					    enum set_key_cmd key_cmd)
+{
+	cmd->flag = HAL_REO_CMD_FLG_NEED_STATUS;
+	cmd->upd0 = HAL_REO_CMD_UPD0_PN |
+		    HAL_REO_CMD_UPD0_PN_SIZE |
+		    HAL_REO_CMD_UPD0_PN_VALID |
+		    HAL_REO_CMD_UPD0_PN_CHECK |
+		    HAL_REO_CMD_UPD0_SVLD;
+
+	switch (cipher) {
+	case WLAN_CIPHER_SUITE_TKIP:
+	case WLAN_CIPHER_SUITE_CCMP:
+	case WLAN_CIPHER_SUITE_CCMP_256:
+	case WLAN_CIPHER_SUITE_GCMP:
+	case WLAN_CIPHER_SUITE_GCMP_256:
+		if (key_cmd == SET_KEY) {
+			cmd->upd1 |= HAL_REO_CMD_UPD1_PN_CHECK;
+			cmd->pn_size = 48;
+		}
+		break;
+	default:
+		break;
+	}
+
+	cmd->addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
+	cmd->addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
+}
+
 /**
  * ath12k_wifi8_rx_spd_buf_alloc - allocate per-ring SPD scratch-pad arrays
  * @dp_hw_grp_wifi8: Wi-Fi 8 hardware-group private data
@@ -1318,10 +1599,9 @@ ath12k_wifi8_hal_rx_msdu_link_info_get(struct hal_wifi8_rx_msdu_link *link,
  * ath12k_wifi8_dp_rx_link_desc_return - return a link descriptor to the WBM
  * idle pool.
  */
-static int
-ath12k_wifi8_dp_rx_link_desc_return(struct ath12k_dp *dp,
-				    struct ath12k_buffer_addr *buf_addr_info,
-				    enum hal_wbm_rel_bm_act action)
+int ath12k_wifi8_dp_rx_link_desc_return(struct ath12k_dp *dp,
+					struct ath12k_buffer_addr *buf_addr_info,
+					enum hal_wbm_rel_bm_act action)
 {
 	struct ath12k_base *ab = dp->ab;
 	struct hal_wbm_release_ring *desc;
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
index 2fb56776adb0..c5ee01e703a5 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
@@ -8,6 +8,7 @@
 #define ATH12K_DP_RX_WIFI8_H
 
 #include "../core.h"
+#include "../dp_rx.h"
 #include "hal_desc.h"
 
 struct ath12k_dp_hw_group_wifi8;
@@ -171,6 +172,36 @@ int ath12k_wifi8_dp_reo_cmd_send_highprio_n(struct ath12k_base *ab,
 					    struct ath12k_reo_cmd_entry *entries,
 					    struct ath12k_reo_dp_cmd_desc *dp_descs,
 					    int n);
+void ath12k_wifi8_dp_setup_pn_check_reo_cmd(struct ath12k_hal_reo_cmd *cmd,
+					    struct ath12k_dp_rx_tid *rx_tid,
+					    u32 cipher,
+					    enum set_key_cmd key_cmd);
+int ath12k_wifi8_dp_rx_assign_reoq(struct ath12k_base *ab,
+				   struct ath12k_dp_peer *dp_peer,
+				   struct ath12k_dp_rx_tid *rx_tid,
+				   u16 ssn, enum hal_pn_type pn_type);
+int ath12k_wifi8_dp_rx_link_desc_return(struct ath12k_dp *dp,
+					struct ath12k_buffer_addr *buf_addr_info,
+					enum hal_wbm_rel_bm_act action);
+void ath12k_wifi8_dp_rx_frags_cleanup(struct ath12k_dp_rx_tid *rx_tid,
+				      bool rel_link_desc);
+void ath12k_wifi8_peer_rx_tid_qref_setup(struct ath12k_base *ab,
+					 u16 peer_id, u16 tid,
+					 dma_addr_t paddr);
+void ath12k_wifi8_dp_rx_peer_tid_delete(struct ath12k_base *ab,
+					struct ath12k_dp_link_peer *peer,
+					u8 tid);
+int ath12k_wifi8_dp_reo_cache_flush(struct ath12k_base *ab,
+				    struct ath12k_dp_rx_tid_rxq *rx_tid);
+int ath12k_wifi8_peer_rx_tid_reo_update(struct ath12k_dp *dp,
+					struct ath12k_dp_link_peer *peer,
+					struct ath12k_dp_rx_tid *rx_tid,
+					u32 ba_win_sz, u16 ssn,
+					bool update_ssn);
+void ath12k_wifi8_peer_rx_tid_qref_reset(struct ath12k_base *ab,
+					 u16 peer_id, u16 tid);
+int ath12k_wifi8_dp_rx_tid_delete_handler(struct ath12k_base *ab,
+					  struct ath12k_dp_rx_tid_rxq *rx_tid);
 int ath12k_wifi8_dp_rx_ring_setup(struct ath12k_base *ab);
 int ath12k_wifi8_dp_rx_ring_free(struct ath12k_base *ab);
 int ath12k_wifi8_dp_rxdma_ring_sel_config_qcn9625(struct ath12k_base *ab);

-- 
2.43.0

