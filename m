Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754655;
	b=ogPAukGs8UeCKCHvIXf0tOpCV+iYBa+U34U3Qut3NJnZUy8QDDb6OAz3XNKjwvgp22E1
	 I0p1juaf0YTF8u7ZE7w3aDaPoNX34AQP8DeHHoBAQirpquFEqMfL9u4xDk+0VTlcTeNh7
	 3rAZJYgJNK8IYHJU2UtsVygY6hg2353MjRRz0tw614LnMRGykYfHxRDeq1UsZi0BVsQvg
	 0bvXicGv/kHMdrN+Ib+BQRl/+FuA4R45qXiJenHNfoa10iXkwG17erdKpR7VmDUtHd+lZ
	 PwAMIR9SIF//irtGFyHMCn5wZy0BN50x0tHiTBauzN0czGDZhFb2pT8K/Je2NBkHRsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mL14LNWehxCuNae9DlFtHdzgIir7uUJx/MZpih9Df48=;
	b=RZJjVRg7NUsJ/C45lIJJ8+zRqnAxC6hwrkzwQ2Jm/oTLZxddvSSDlSBjsrV/12a9vfYF
	 lEWcNo72l0aLHbQIyV1xE2/LiMnd0XaoYR0cqm2k7PX8670SXyHJay/qxGlJ/1HYTnvd/
	 EO9gIS48GHGqEI4sLg0Q5FzifUVgo/NKozEv1ke7bSbxbeFcKkF/nXdsjjUVueyKNshpS
	 mBbyC7YPJ6meeRhbWa/pwBWutsssBpJK4grE+BCOGX5BwwMmLrcvonvLMDovTCRKNPvQm
	 55lGLoaGezgEbl03oMNC/P8WqIfnz/e8+x0Qs+hcGJ52lRqNdZZ0Ktjfjo+ut7NYP9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SJgNINCo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IyGF+xvv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E25606D808
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21E25606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SJgNINCo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IyGF+xvv
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RQIa3335539
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 01:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mL14LNWehxCuNae9DlFtHdzgIir7uUJx/MZpih9Df48=; b=SJgNINCozTDPpQNL
	a9SOujbC0xWVYYR2PXU1t/In1wFnzAu/LXIciLYTVh+kUhpZhq3aQalEjM6pYQCM
	GwD5P5qOwzocTpA6FVey5meSWz58SrQefh8vuh0jBOBxDDdUwNVqY6xIkLlWborv
	1ww1NF4GmyJZbc2qZqBunAGErS1PrGFomcV3KvtmCIDk55/n4aQcpiJNbJbz5GiD
	sPyV3v3jJIZq3Xi9A16vf4e3M7WMmPS1kIS9odnIKx7WqVhe0LUmKga2DQg42Jqj
	ndkNSUhRWi6vN7aO8Rba9MTqMqcfAtQKc90GrDm6ZuSYs/1dATVrgZ2YTKlnnP8E
	HvhDWA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbsf9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:10:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36998507c13so166914eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754653; x=1794359453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mL14LNWehxCuNae9DlFtHdzgIir7uUJx/MZpih9Df48=;
        b=IyGF+xvvP/dzPgdemwVPA7kY4dHzYYC/Y91m6rdhWSeR9ry/bf/p8twuPNs57ikILP
         4lqgbxWWJHiZualEftSeDzFmaUVXb2CdMvXLLG9J764/NrniJv/7BVRGWBM1/XhSGgaL
         Dr8NBudiinrDuMlWpZqldiGNw0gbz4kynj0xc6rq2wUzDVfu57BtsAPN8/W5HOd9/uF6
         8EIe0v/iXUcOg7gaEq+BT2WYIeexzzdFNytcMVHMJB02GoncpLQZ536mnCZW5QctHp2W
         /nubhFTdTp8mlPsPGrF99kU6o3yn0a6JAsqkDk8RmLvXvGE0cKYdZ6S3lXf7x3WWod5V
         7lLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754653; x=1794359453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mL14LNWehxCuNae9DlFtHdzgIir7uUJx/MZpih9Df48=;
        b=PzcE9nakC4gE1A/reHBs3TuKF6B9z0W8lHxcOb5w0Y88KzYvSns9rqJHRBQF5122EY
         aBd2gtT0s06m+0LTZ/hBVbZbLNo7HWbJsdiGyBtnCXIAoSSoPOE/yJUyFmDuzGsp1Zb6
         olzaKMt6eryXJ0ipI/33CZSvKJ9LKUBy4RWSHy8HEXdUIgsXzAYBFGoXCBP1GLwlolWr
         f+CUlBEXoheq3m4CtbY/Lk9sFyLEO4gEPCiSGWqY91UDP4wDCEonnnLhnBGYoh62kP8k
         fqGfCEvkBuaQ0wbrhWNvJAU1m/PuDbF/MYSnV1V9A56CD2/9aMG4soZNSRCN6ya0BeZG
         Y4oA==
X-Forwarded-Encrypted: i=1; AKwUvBwsMsHIbKsxLtqnct1eCJrdywqKsTTVRq9cyt+lqvCyV3f5stPAKeX+6Lg/MimQklhMQO7vI1HMO+3+aP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+owdz7VG1pYat0EEch0rWP1nxoqfFzHNg+1anbnMqjg+VAsNxF
	akCNcCHObxQ7Xa4uHUDkmZJWDyuBalxWe0UMMjzAzGdQeFOgkulbCHEx4V8ZfA/yZcnX+qMySSG
	pC+FUHqVp9i5qp0pzwsbF5lBaAMwJHSMpTxDj8w148ULwib2Jm34S52WsHK3OisI0gEo=
X-Gm-Gg: AYBFou1akO3BbZho7WbW0hfFW09nr/7P9LcWl0VldLPejvZAyZ8MvbcQBRKGAgWnhwB
	zEwmSubQGVeUl+6N3ea7QEWF6juPxf3MXFHxBwTn8ZA7+AJV3/zaEdIBr2mK5P+ph3GYCaIJ2vk
	MXj7nX9M/faQ+ofZdxAyCcEh2WplAz9+N8w/ntpVJnHaUPyGlPkcWFFZvox0fRmlbop1Ybt2IZk
	FgyW38t/Og+N/7yXpkc3YnFAHHFdi+QPWUJ7z/K0ShdVIASm5mN2kd0FTnUaNthmxDP+0Eq5tYH
	Q89IBQRWLlw0E+UMbgxYs4oghu8mt62F28FMmMP+b4P66naTLIqfHfp2Kmr8XhXnRYT0bL0t/Om
	pAw8Byu5FIOC5vzH3oY4QdQHGrAEZ/adKcTAb0QU1fHV+b8V74YEfJQ+IKI4bCRe8Nt1X1L8IU9
	j8zGa3nh8ccbR5/U1uqbWRWyjBi1xtzQuYgyO5
X-Received: by 2002:a05:7300:4719:b0:368:6f29:f26c with SMTP id 5a478bee46e88-36a4221aa0dmr20176238eec.4.1793754652836;
        Tue, 03 Nov 2026 17:10:52 -0800 (PST)
X-Received: by 2002:a05:7300:4719:b0:368:6f29:f26c with SMTP id 5a478bee46e88-36a4221aa0dmr20176178eec.4.1793754652061;
        Tue, 03 Nov 2026 17:10:52 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:51 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:49 -0800
Subject: [PATCH ath-next v3 06/13] wifi: ath12k: ng: parse 1K REO queue
 statistics
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
Message-Id: <20261103-reo-cmd-b4-posting-v3-6-861adf04b516@oss.qualcomm.com>
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
X-Proofpoint-GUID: kcEU5lw1raq03JkTEm62iMrljueRRv7x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX42At9wjYO3Y2
 PqWOxAgxppV8WWp5nNnE8t9TWaQvq5rmbU0Q9XF86o9pEefoYTka2NwfIvIx4qBy/L4EtgR6AC5
 OWASH6vAPso3fnsi9kLV5uqQIFJfWefbiTQ0lsst0OFvjGrnvRVw4NcarwO2QfaB2UxkbebMUE5
 PgUyBEjJhwRWk1pEn+BEa4Z2lNuasABdHMlaI9fQyDDdWlml2V5EJhXKq79HWz6E0Y7alzWdbIi
 uRkp8/3h5v6n01wzMynJsowLbt9AnsaIU68RmI7Sb92OZhBT4xbvTqwvZH24s3ZOByQIzC6XO/2
 a4VFpW+pkHsfJ9FYHiSGOQQXtAaAG2wFRtMMaOKprJqTB9+TbjGp9FpJxTD3/XGPZKWIiBeVs6O
 Yhg7yCOcdV90c0QrjGMUaLaIykn56wR4mditE9cTCuzJ3zw3PoOXEKNnjvVT7U8w4cFhBSU9l6E
 k3T7y0BroNCapbfKmqQ==
X-Proofpoint-ORIG-GUID: kcEU5lw1raq03JkTEm62iMrljueRRv7x
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea861e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jlw-gz1d5bKLCbeaqcMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX3RbC9jFh4pcz
 cmbEQGPt8yZ88dLljMhHLiLHN1+uah4X2772Qkec6Oo7UbpjGy32YMeOz59Dj6xxmpBaRffobO+
 w6KIqJije/LMMKEDX3u7xhMh4v4Q8qM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040004

A normal REO queue-statistics status contains the first 288 bits of the
reorder bitmap. For a receive queue with a larger BlockAck window, the
hardware sets a follow-up flag and returns bits 288 through 1023 in a
second status TLV.

Define the 1K queue-statistics status descriptor and decode its 23
additional bitmap words. Extend the common queue status with the PN
encoding, follow-up indication, and wider counters, and store the TLV tag
so a follow-on datapath patch can distinguish both responses for one
command number.

This commit only extends Wi-Fi 8 status representation and parsing. It
does not submit commands or change the Wi-Fi 7 descriptor path.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k

Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h            | 15 +++++++++---
 drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h | 10 ++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c   | 30 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h   |  3 +++
 4 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 9c0d1dfac8d3..6534e11a3378 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1173,6 +1173,9 @@ struct hal_reo_status_queue_stats {
 	u16 ssn;
 	u16 curr_idx;
 	u32 pn[4];
+	u8 pn_len;
+	u8 pn_127_48_info;
+	bool to_follow_1k;
 	u32 last_rx_queue_ts;
 	u32 last_rx_dequeue_ts;
 	u32 rx_bitmap[9];
@@ -1186,9 +1189,13 @@ struct hal_reo_status_queue_stats {
 	u32 total_num_processed_byte_cnt;
 	u32 late_rx_mpdu_cnt;
 	u32 reorder_hole_cnt;
-	u8 timeout_cnt;
-	u8 bar_rx_cnt;
-	u8 num_window_2k_jump_cnt;
+	u32 timeout_cnt;
+	u32 bar_rx_cnt;
+	u32 num_window_2k_jump_cnt;
+};
+
+struct hal_reo_status_queue_1k_stats {
+	u32 rx_bitmap[23];
 };
 
 struct hal_reo_status_flush_queue {
@@ -1246,8 +1253,10 @@ struct hal_reo_status_desc_thresh_reached {
 struct hal_reo_status {
 	struct hal_reo_status_header uniform_hdr;
 	u8 loop_cnt;
+	u16 tag;
 	union {
 		struct hal_reo_status_queue_stats queue_stats;
+		struct hal_reo_status_queue_1k_stats queue_1k_stats;
 		struct hal_reo_status_flush_queue flush_queue;
 		struct hal_reo_status_flush_cache flush_cache;
 		struct hal_reo_status_unblock_cache unblock_cache;
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h
index 691c9866522f..e2947dd112ce 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h
@@ -536,6 +536,15 @@ struct hal_reo_get_queue_stats_status {
 	__le16 info6;
 } __packed;
 
+#define HAL_REO_GET_Q_1K_STATS_STATUS_INFO0_LOOPING_COUNT	GENMASK(15, 12)
+
+struct hal_reo_get_queue_1k_stats_status {
+	struct hal_reo_status_hdr hdr;
+	__le32 rx_bitmap1023_288[23];
+	__le16 rsvd0;
+	__le16 info0;
+} __packed;
+
 /* REO command TLV tags */
 #define HAL_REO_GET_QUEUE_STATS			313
 #define HAL_REO_FLUSH_QUEUE			314
@@ -549,6 +558,7 @@ struct hal_reo_get_queue_stats_status {
 #define HAL_REO_FLUSH_TIMEOUT_LIST_STATUS	338
 #define HAL_REO_DESCRIPTOR_THRESHOLD_REACHED_STATUS	339
 #define HAL_REO_UPDATE_RX_REO_QUEUE		371
+#define HAL_REO_GET_QUEUE_1K_STATS_STATUS	451
 #define HAL_REO_UPDATE_RX_REO_QUEUE_STATUS	204
 
 #define HAL_REO_FLUSH_QUEUE_INFO0_DESC_ADDR_HI		GENMASK(7, 0)
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
index 80c2f1202233..d78c178cc70d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
@@ -470,6 +470,29 @@ ath12k_wifi8_hal_reo_cmd_update_rx_queue(struct hal_tlv_64_hdr *tlv,
 	return le16_to_cpu(desc->cmd.reo_cmd_number);
 }
 
+void ath12k_wifi8_hal_reo_status_queue_1k_stats(struct ath12k_base *ab,
+						struct hal_tlv_64_hdr *tlv,
+						struct hal_reo_status *status)
+{
+	struct hal_reo_get_queue_1k_stats_status *desc =
+		(struct hal_reo_get_queue_1k_stats_status *)tlv->value;
+	u32 *dst = status->u.queue_1k_stats.rx_bitmap;
+	int i;
+
+	status->uniform_hdr.cmd_num = le16_to_cpu(desc->hdr.reo_status_number);
+	status->uniform_hdr.cmd_status =
+		le16_get_bits(desc->hdr.info0,
+			      HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS);
+	status->uniform_hdr.timestamp = le32_to_cpu(desc->hdr.timestamp);
+
+	for (i = 0; i < ARRAY_SIZE(desc->rx_bitmap1023_288); i++)
+		dst[i] = le32_to_cpu(desc->rx_bitmap1023_288[i]);
+
+	status->loop_cnt =
+		le16_get_bits(desc->info0,
+			      HAL_REO_GET_Q_1K_STATS_STATUS_INFO0_LOOPING_COUNT);
+}
+
 static int ath12k_hal_reo_cmd_flush_queue(struct hal_tlv_64_hdr *tlv,
 					  struct ath12k_hal_reo_cmd *cmd)
 {
@@ -596,6 +619,13 @@ void ath12k_wifi8_hal_reo_status_queue_stats(struct ath12k_base *ab,
 		le32_get_bits(desc->info0, HAL_REO_GET_Q_STATS_STATUS_INFO0_CURRENT_INDEX);
 	status->u.queue_stats.pn[0] = le32_to_cpu(desc->pn_31_0);
 	status->u.queue_stats.pn[1] = le16_to_cpu(desc->pn_47_32);
+	status->u.queue_stats.pn_127_48_info =
+		le16_get_bits(desc->info1, HAL_REO_GET_Q_STATS_STATUS_INFO1_PN_127_48_INFO);
+	status->u.queue_stats.to_follow_1k =
+		le32_get_bits(desc->info5,
+			      HAL_REO_GET_Q_STATS_STATUS_INFO5_GET_Q_1K_SSTAT_FOLLOW);
+	status->u.queue_stats.pn_len =
+		(status->u.queue_stats.pn_127_48_info == 0) ? 6 : 16;
 	status->u.queue_stats.last_rx_queue_ts =
 		le32_to_cpu(desc->last_rx_enqueue_timestamp);
 	status->u.queue_stats.last_rx_dequeue_ts =
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
index d61ca0823b5f..357839c7d9e3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
@@ -112,6 +112,9 @@ void ath12k_wifi8_hal_reo_hw_setup(struct ath12k_base *ab);
 void ath12k_wifi8_hal_reo_status_queue_stats(struct ath12k_base *ab,
 					     struct hal_tlv_64_hdr *tlv,
 					     struct hal_reo_status *status);
+void ath12k_wifi8_hal_reo_status_queue_1k_stats(struct ath12k_base *ab,
+						struct hal_tlv_64_hdr *tlv,
+						struct hal_reo_status *status);
 void ath12k_wifi8_hal_reo_flush_queue_status(struct ath12k_base *ab,
 					     struct hal_tlv_64_hdr *tlv,
 					     struct hal_reo_status *status);

-- 
2.43.0

