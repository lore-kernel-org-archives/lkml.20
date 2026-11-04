Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754659;
	b=BFrB8XlgapdGugY84HURiR0SYvlTH+8IjsEcOVBaohdA6w1iaDvmlOoXC7ZnMGRigWgu
	 u+BDd/JoYkZl4i6l1A1cweVdVJPABa753gJrYhg5VmGcyUjXwYwvXH4Q+m6yqW4+XgwOq
	 IhG1RO9pm9Yl6M0lAViT4VTTEbsMf3vjRut7elrCYNnm7dim/EfDRaLAVY7JSSpCEwnd6
	 SnfaLpK2kxVC0fNHblKEhbPtAQ1nCtaE1sxQGxF5ARh7UBsq1g2WOVHnEAXL+eHwMvWXL
	 axloitLswCaOs3xi2pXeraxZMkql6nM26GCIEdjmQnMPOVIKF1qRfMpEHN+P2NTDJ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754659;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SscCVk8nxupD4V6Cfhds03G/OUwDOCK2+kQxVAgWW28=;
	b=LcmS8LsG6H26iOin9luCw/+6vzyPUGMN/XqQYXxoqibuqZ0n3QUlPgq60lD33sCK3ERb
	 swLBSqFhqGC59+XZ0dD+G/q8gHidztYEcf3IrEEJ+ef/fH4XBT3s6I2czyULcO4azQyOQ
	 zvStZfH4PFOW4Gu/mmTGbe2rrBjtOBFx8wFpTDYkZuNNDLCfryyiwC0BUc+XyiRIgIaIJ
	 NbUZ+wu3d+YTURIaI0Gs6ZmUgekWiLicjIox+tU5FheB65Fjh5jnqHCeX4VTIY5HXaQwP
	 +1DUYcgdxTR70Dkd3yLslHBsvavHCdpGJsKg7Q74BNN7NekxSxHgVfnO83lSznPqrXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cd8Khx4q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GoRbKoco;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE9B606D83C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE9B606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cd8Khx4q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GoRbKoco
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RD663335329
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 01:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SscCVk8nxupD4V6Cfhds03G/OUwDOCK2+kQxVAgWW28=; b=Cd8Khx4qNrWJpfG5
	HiXrDUPoMsmGnfls6Xiw5qX/mM2QRKgvoIZiSEkeQw1gHBHlQSodEY2RqvU6SKL1
	yKx42ZkHG3vShctw9cDp9wbt1J7VyDhO3R4XZqJYL0b2meAVlYvVGA281MTfq7H0
	H5M+AjAY+rCsgkTZpuVCOUOkSw6ZopUP5yJ5Ih/OfBmHXmDI0ReQToo7DnXTWWak
	XrnX0F9zCB6pbLzc8c/32J2ZpM4Ho2IP+KKSpWZNjtMQaV3oaumuTaWjVxHklUvp
	jZd6Ooe/tGUb2+2pL2lRK2orVl2tueiZ+nkc1pfjOkv4URN165u2nXFDQMZ89Lfe
	LBzg+Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbsfa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:10:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so313349eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754656; x=1794359456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SscCVk8nxupD4V6Cfhds03G/OUwDOCK2+kQxVAgWW28=;
        b=GoRbKocoieElckuiEqT7leql2h9ZjEllQy+3P2aXrVVZ1rSGK2blkWoXn/zZJ9oMpB
         /z5NkuZnW4A17NyRFXIJzqmjxQSGb8qONYszW822j32HX+RXWSAV/kzvW1DRFrYJjC58
         5HFQT0gsqerMJQhzlUHbxmm2Vz2Y5Turj5senwcaUa8sVGCTuOT3ymwHpZx2yzVDpqIY
         2+PfzHWP+/RH2cmfpY5TqKZkCZ35Q4HlNiSmOvJy+3hxM8sAUnIiVECIoHm3owLQU01P
         JBgwu78RKdTC/oBnqvfwwR5HS6ulMlkS+qHuRg1szQmMkbqJuJLZNWV3yzRlkwM93T4v
         D8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754656; x=1794359456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SscCVk8nxupD4V6Cfhds03G/OUwDOCK2+kQxVAgWW28=;
        b=1WmBw27k2dJt2ovyeX7/VoEQBwgkZscGQ3ki7BgJVq0a7OfI2qz0TKQCuJOWJDHOpk
         NVjzzAPFtH7AoGn0he3flcSP9qQ2Ttd7CBVvQaL+5EBWZWeN17ANya/0i6L+EaXzUEZ+
         2F/MbXwCeU3GBrOTcgZWiWdp7p6pk0OJXuDnZaMCtwAqfkHG1TGgGpvoLKMBbdK55GWA
         HeGuW3lK9Me03b1CQPSKRxkpkCRvi8Of0/hjpTzB5zi3vK+27ogQoUB1UOu6ZraiZKKT
         /Ael70CNrZKwNli8Nt6y2aK7/We/cPizw7SPbEAHDyB7yst/I6eJtzJX3r0PqS5NhSun
         7d3w==
X-Forwarded-Encrypted: i=1; AKwUvBz0xxqwcv52/NTP0ZlSUqaasegaGNm8mMb8Y2Rg4UJroJuu3MQrgNn+dBl/B6BlxbVKbaE8tx2U9Ftmbyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m+7Gyc6NET50ag3HzaeU6lOEj6a1j9qdllgOuchlElmKCCj6+
	8ANAH1hdC+uk153OKnqoTAQAEg4O/k7wPRUiu8tAWLkBgFuYD56XICIpp8+Dm5wIq3kpPCujdRn
	h+MHreG02mbiVoPNh6b+fVYXplUvQ2h+brdQBcwHzLSy+Olxg0SHtfA3UpIA5uXv3xMo=
X-Gm-Gg: AYBFou1TIK794ASjHQR1tPERPya2k6/SuDjvqKVNwt8X8Ftk+MGF5pgguCmiRhLlCRW
	iXzmMMr6Vs4E4+I3BQob4l0DIf3Vl79gxfNISDtEcHfG49OQ2P33pnL8u/xvkaksKPtQq45A9VI
	AMU9I+iuJ1k5F+DYbWBSsk5Ax52bmIxUsAU5VBaAKmKOoruuPfYq54qjsUc4LFyZi0HEwKSYL/v
	/7UfTkuPfTzISp3L7DGTSQ5lb2h/n1Ik4yPnKIXtx3GiUoi1L3Kv549Lzb1INJtKRTEFhAov7ri
	qdMG9yS3Rtytca1rDPaPmXAH1sp2qTM/PMh8j4LgAhfEwjCci1JWzBILBRS4tgscUhxoU8PAdG5
	uknDwVwckhKkcWfvG7I7jQoKCrfJHx/9wdQZUxS+bun9RkGaMdTzd5yqvI9ONxn/IyrNX1Ga1BL
	VsrHlNTWOBkPgRVxnsVK1ryfg1G5DxKPUFG/7x
X-Received: by 2002:a05:693c:630c:b0:36c:a360:9c42 with SMTP id 5a478bee46e88-36ca360cda7mr1486120eec.31.1793754656197;
        Tue, 03 Nov 2026 17:10:56 -0800 (PST)
X-Received: by 2002:a05:693c:630c:b0:36c:a360:9c42 with SMTP id 5a478bee46e88-36ca360cda7mr1486068eec.31.1793754655599;
        Tue, 03 Nov 2026 17:10:55 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:55 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:52 -0800
Subject: [PATCH ath-next v3 09/13] wifi: ath12k: ng: add REO queue
 descriptor helpers
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
Message-Id: <20261103-reo-cmd-b4-posting-v3-9-861adf04b516@oss.qualcomm.com>
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
X-Proofpoint-GUID: YOUkhU1L82L4UbKm8By0eqC6tViJAFmR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX2ZH0opfUTBgL
 p/n06wtd+9Ribav0YT289AB9ZReeulBtKmNUCi+Ijwkt4iiNjRivVC/oWzGM6OmamekBBu9rHh0
 OABvmYuGkQGfpt9TDlolXlEVo6ry0okYgyPWJTlclJ0Fnsi/ArFF3T8BoVrXsKpOPX+O5n2Wjna
 lrTpibStrU3ncwElBxNoSHqL2+/CxVH1pOfRfeVgIQdikD2SXcxbqKWE+Wu38nzPNLYa+4+nORK
 sWptudXkuwHgzt/IXDy+3rvQJrlF9Ooh0jz3ANJl3kh60icAIADf8qXXoWrORNToocKnvM1T9UN
 5HMohFNZkwwwJ61RHSJohubJXiyBrXrJDxb+LVA2DdNegI1P5At/h7OylOCKsIuAsrPnH5pTDwc
 6B27UzYx2/uLWPPOK+lIYMJP6FfQrWY8o1kNw/4Z4MKnMqZEpilupawREPMN8bRc/Wdxswem8oN
 J+0F5moS8GA89B6mYbA==
X-Proofpoint-ORIG-GUID: YOUkhU1L82L4UbKm8By0eqC6tViJAFmR
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea8621 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kPHT7MsD_7d9QQ_0F_YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX/e5mqPjWfNst
 tOJlDrarSbqwLBxiZ7zhaMUUUHFAkerMJCQdU1clbBZ7TVcRCgJUCImtxf3VTtMODKvuHmO1EWs
 im4hkQHpU3uwdbFECVEEG4ItIc+7x1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040004

Wi-Fi 8 RX TID setup needs host-created REO queue descriptors so the
common datapath can program per-TID reorder state without relying on the
Wi-Fi 7 descriptor layout.

Add helpers to size, initialize, and release Wi-Fi 8 REO queue
descriptors. Keep non-QoS queues simple and allocate extension
descriptors only for QoS TIDs that can use a larger reorder window.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k
Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h |  98 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c   | 106 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h   |  15 ++++
 3 files changed, 219 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h
index e2947dd112ce..a7db304a197c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h
@@ -1108,10 +1108,22 @@ struct hal_uniform_tqm_cmd_hdr {
 #define HAL_TQM_MSDU_RBM_OVERRIDE			GENMASK(23, 20)
 #define HAL_TQM_MSDU_RESERVED_4				GENMASK(31, 24)
 
+#define HAL_DESC_REO_OWNED		4
+#define HAL_DESC_REO_QUEUE_DESC		8
+#define HAL_DESC_REO_QUEUE_EXT_DESC	10
+
+#define HAL_DESC_HDR_INFO0_OWNER	GENMASK(3, 0)
+#define HAL_DESC_HDR_INFO0_BUF_TYPE	GENMASK(7, 4)
+#define HAL_DESC_HDR_INFO0_DBG_RESERVED	GENMASK(31, 8)
+
 struct hal_desc_header {
 	__le32 info0;
 } __packed;
 
+struct hal_rx_mpdu_link_ptr {
+	struct ath12k_buffer_addr addr_info;
+} __packed;
+
 /* Per-MSDU entry within a Wi-Fi 8 link descriptor. */
 struct hal_rx_msdu_details {
 	struct ath12k_buffer_addr buf_addr_info;
@@ -1596,6 +1608,92 @@ struct hal_tqm2sw_completion_ring {
 	__le32 info4;
 } __packed;
 
+struct hal_rx_reo_queue_ext {
+	struct hal_desc_header desc_hdr;
+	__le32 rsvd;
+	struct hal_rx_mpdu_link_ptr mpdu_link[31];
+} __packed;
+
+#define HAL_RX_REO_QUEUE_INFO0_VLD					BIT(0)
+#define HAL_RX_REO_QUEUE_INFO0_ASSOCIATED_LINK_DESCRIPTOR_COUNTER	GENMASK(2, 1)
+#define HAL_RX_REO_QUEUE_INFO0_LINK_LIST_TIMER_IDX			GENMASK(8, 5)
+#define HAL_RX_REO_QUEUE_INFO0_RTY					BIT(10)
+#define HAL_RX_REO_QUEUE_INFO0_BA_WINDOW_SIZE				GENMASK(22, 13)
+#define HAL_RX_REO_QUEUE_INFO0_PN_CHECK_NEEDED				BIT(23)
+#define HAL_RX_REO_QUEUE_INFO0_PN_SIZE					GENMASK(28, 27)
+#define HAL_RX_REO_QUEUE_INFO0_IGNORE_AMPDU_FLAG			BIT(29)
+
+#define HAL_RX_REO_QUEUE_INFO1_SVLD					BIT(0)
+#define HAL_RX_REO_QUEUE_INFO1_SSN					GENMASK(12, 1)
+
+#define HAL_RX_REO_QUEUE_INFO2_STATS_ID					GENMASK(10, 0)
+
+struct hal_rx_reo_queue {
+	struct hal_desc_header desc_hdr;
+	__le16 receive_queue_number;
+	__le16 rsvd0;
+	__le32 info0;
+	__le16 info1;
+	__le16 rsvd1;
+	__le32 pn_31_0;
+	__le16 pn_47_32;
+	__le16 rsvd2;
+	__le32 rsvd3[2];
+	__le32 last_rx_enqueue_timestamp;
+	__le32 last_rx_dequeue_timestamp;
+	__le32 ptr_to_next_aging_queue_31_0;
+	__le32 rsvd4;
+	__le32 ptr_to_previous_aging_queue_31_0;
+	__le16 rsvd5;
+	__le16 info2;
+	__le32 rx_bitmap_31_0;
+	__le32 rx_bitmap_63_32;
+	__le32 rx_bitmap_95_64;
+	__le32 rx_bitmap_127_96;
+	__le32 rx_bitmap_159_128;
+	__le32 rx_bitmap_191_160;
+	__le32 rx_bitmap_223_192;
+	__le32 rx_bitmap_255_224;
+	__le32 rx_bitmap_287_256;
+	__le32 rsvd6;
+	__le16 rsvd7;
+	__le16 duplicate_count;
+	__le32 rsvd8;
+	__le32 mpdu_frames_processed_count;
+	__le32 msdu_frames_processed_count;
+	__le32 total_processed_byte_count;
+	__le16 rsvd9;
+	__le16 hole_count;
+	__le16 aging_drop_mpdu_count;
+	__le16 rsvd10;
+	__le32 sawf_dropped_msdu_frames_processed_cnt;
+	__le32 rx_bitmap_319_288;
+	__le32 rx_bitmap_351_320;
+	__le32 rx_bitmap_383_352;
+	__le32 rx_bitmap_415_384;
+	__le32 rx_bitmap_447_416;
+	__le32 rx_bitmap_479_448;
+	__le32 rx_bitmap_511_480;
+	__le32 rx_bitmap_543_512;
+	__le32 rx_bitmap_575_544;
+	__le32 rx_bitmap_607_576;
+	__le32 rx_bitmap_639_608;
+	__le32 rx_bitmap_671_640;
+	__le32 rx_bitmap_703_672;
+	__le32 rx_bitmap_735_704;
+	__le32 rx_bitmap_767_736;
+	__le32 rx_bitmap_799_768;
+	__le32 rx_bitmap_831_800;
+	__le32 rx_bitmap_863_832;
+	__le32 rx_bitmap_895_864;
+	__le32 rx_bitmap_927_896;
+	__le32 rx_bitmap_959_928;
+	__le32 rx_bitmap_991_960;
+	__le32 rx_bitmap_1023_992;
+	__le32 rsvd11[9];
+	struct hal_rx_reo_queue_ext ext_desc[];
+};
+
 #define HAL_TX_MSDU_EXT_INFO0_BUF_PTR_LO	GENMASK(31, 0)
 
 #define HAL_TX_MSDU_EXT_INFO1_BUF_PTR_HI	GENMASK(7, 0)
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
index 12a37c395bb0..ad00c182c2bd 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
@@ -9,6 +9,26 @@
 #include "hal_rx.h"
 #include "hal.h"
 
+static void ath12k_wifi8_hal_reo_set_desc_hdr(struct hal_desc_header *hdr,
+					      u8 owner, u8 buffer_type,
+					      u32 magic)
+{
+	hdr->info0 = le32_encode_bits(owner, HAL_DESC_HDR_INFO0_OWNER) |
+		     le32_encode_bits(buffer_type, HAL_DESC_HDR_INFO0_BUF_TYPE) |
+		     le32_encode_bits(magic, HAL_DESC_HDR_INFO0_DBG_RESERVED);
+}
+
+static u32 ath12k_wifi8_hal_reo_num_ext_desc(u32 ba_window_size)
+{
+	if (ba_window_size <= 217)
+		return 1;
+
+	if (ba_window_size <= 434)
+		return 2;
+
+	return REO_QUEUE_EXT_DESC_MAX;
+}
+
 static void ath12k_wifi8_reo_dest_ring_ctrl_setup(struct ath12k_base *ab,
 						  u32 start, u32 end, u32 reg_add)
 {
@@ -886,3 +906,89 @@ void ath12k_wifi8_hal_reo_update_rx_reo_queue_status(struct ath12k_base *ab,
 
 	ath12k_wifi8_hal_reo_status_hdr_parse(desc, status);
 }
+
+u32 ath12k_wifi8_hal_reo_qdesc_size(u32 ba_window_size, u8 tid)
+{
+	u32 num_ext_desc = ath12k_wifi8_hal_reo_num_ext_desc(ba_window_size);
+
+	if (tid != HAL_DESC_REO_NON_QOS_TID)
+		num_ext_desc = REO_QUEUE_EXT_DESC_MAX;
+
+	return sizeof(struct hal_rx_reo_queue) +
+	       num_ext_desc * sizeof(struct hal_rx_reo_queue_ext);
+}
+
+void ath12k_wifi8_hal_reo_qdesc_setup(struct hal_rx_reo_queue *qdesc,
+				      int tid, u32 ba_window_size,
+				      u32 start_seq, enum hal_pn_type type)
+{
+	static const u32 reo_queue_desc_magic[REO_QUEUE_EXT_DESC_MAX] = {
+		REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_1,
+		REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_2,
+		REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_3,
+		REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_4,
+		REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_5,
+	};
+	struct hal_rx_reo_queue_ext *ext_desc;
+	u32 num_ext_desc;
+	int i;
+
+	ath12k_wifi8_hal_reo_set_desc_hdr(&qdesc->desc_hdr,
+					  HAL_DESC_REO_OWNED,
+					  HAL_DESC_REO_QUEUE_DESC,
+					  REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_0);
+
+	qdesc->receive_queue_number = cpu_to_le16(tid);
+
+	qdesc->info0 =
+		le32_encode_bits(1, HAL_RX_REO_QUEUE_INFO0_VLD) |
+		le32_encode_bits(1, HAL_RX_REO_QUEUE_INFO0_ASSOCIATED_LINK_DESCRIPTOR_COUNTER) |
+		le32_encode_bits(ath12k_tid_to_ac(tid), HAL_RX_REO_QUEUE_INFO0_LINK_LIST_TIMER_IDX);
+
+	if (ba_window_size < 1)
+		ba_window_size = 1;
+
+	if (ba_window_size == 1 && tid != HAL_DESC_REO_NON_QOS_TID)
+		ba_window_size++;
+
+	if (ba_window_size == 1)
+		qdesc->info0 |= le32_encode_bits(1, HAL_RX_REO_QUEUE_INFO0_RTY);
+
+	qdesc->info0 |= le32_encode_bits(ba_window_size - 1,
+					 HAL_RX_REO_QUEUE_INFO0_BA_WINDOW_SIZE);
+
+	switch (type) {
+	case HAL_PN_TYPE_NONE:
+	case HAL_PN_TYPE_WAPI_EVEN:
+	case HAL_PN_TYPE_WAPI_UNEVEN:
+		break;
+	case HAL_PN_TYPE_WPA:
+		qdesc->info0 |=
+			le32_encode_bits(1, HAL_RX_REO_QUEUE_INFO0_PN_CHECK_NEEDED) |
+			le32_encode_bits(HAL_RX_REO_QUEUE_PN_SIZE_48,
+					 HAL_RX_REO_QUEUE_INFO0_PN_SIZE);
+		break;
+	}
+
+	qdesc->info0 |= le32_encode_bits(1,
+					 HAL_RX_REO_QUEUE_INFO0_IGNORE_AMPDU_FLAG);
+
+	qdesc->info1 = le16_encode_bits(0, HAL_RX_REO_QUEUE_INFO1_SVLD);
+
+	if (start_seq <= 0xfff)
+		qdesc->info1 = le16_encode_bits(start_seq,
+						HAL_RX_REO_QUEUE_INFO1_SSN);
+
+	if (tid == HAL_DESC_REO_NON_QOS_TID)
+		return;
+
+	ext_desc = qdesc->ext_desc;
+	num_ext_desc = REO_QUEUE_EXT_DESC_MAX;
+
+	memset(ext_desc, 0, num_ext_desc * sizeof(*ext_desc));
+	for (i = 0; i < num_ext_desc; i++)
+		ath12k_wifi8_hal_reo_set_desc_hdr(&ext_desc[i].desc_hdr,
+						  HAL_DESC_REO_OWNED,
+						  HAL_DESC_REO_QUEUE_EXT_DESC,
+						  reo_queue_desc_magic[i]);
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
index 430b0f07563f..94732f82f614 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
@@ -7,6 +7,9 @@
 #ifndef ATH12K_HAL_RX_H
 #define ATH12K_HAL_RX_H
 
+#include "hal_desc.h"
+#include "hal.h"
+
 #define HAL_REO_CMD_FLG_NEED_STATUS		BIT(0)
 #define HAL_REO_CMD_FLG_STATS_CLEAR		BIT(1)
 #define HAL_REO_CMD_FLG_FLUSH_BLOCK_LATER	BIT(2)
@@ -84,6 +87,14 @@
 /* 8 buffers for max-size SG MPDU + 1 entry to confirm termination */
 #define HAL_REO_SG_TERMINATION_MIN_ENTRIES 9
 
+#define REO_QUEUE_EXT_DESC_MAX 5
+#define REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_0 0xDDBEEF
+#define REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_1 0xADBEEF
+#define REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_2 0xBDBEEF
+#define REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_3 0xCDBEEF
+#define REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_4 0xEDBEEF
+#define REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_5 0xFDBEEF
+
 struct ath12k_hal_rx_cmd_ring_param {
 	u32 mac_addr_31_0;
 	u32 mac_addr_47_32:16,
@@ -142,4 +153,8 @@ void ath12k_wifi8_hal_reo_desc_thresh_reached_status(struct ath12k_base *ab,
 void ath12k_wifi8_hal_reo_update_rx_reo_queue_status(struct ath12k_base *ab,
 						     struct hal_tlv_64_hdr *tlv,
 						     struct hal_reo_status *status);
+u32 ath12k_wifi8_hal_reo_qdesc_size(u32 ba_window_size, u8 tid);
+void ath12k_wifi8_hal_reo_qdesc_setup(struct hal_rx_reo_queue *qdesc,
+				      int tid, u32 ba_window_size,
+				      u32 start_seq, enum hal_pn_type type);
 #endif

-- 
2.43.0

