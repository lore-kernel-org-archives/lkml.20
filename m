Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EC54C225F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651893; cv=none; b=t9HLld94WL644F0lGoqbBd921xtPFc5esVp5ug23sqUmsCCP1PO2RFPKbHr6qSAQvXLNFj3UK/Ervhqod73lNgk4S+SCm1vjVuVAt5FLhKlbE+idbxSeIvXtSB7S6N3a3onl4H1fiYkaEY1pMxTOm7cEPoQhRGZJEhIss+Eq6QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651893; c=relaxed/simple;
	bh=JwtpegHcj7NCF7jfmE75XHrbUMVQR4/Y0It5Xr1iAYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSmgFlilvfQCxMPRy6gsevhpX+shH7ewdmiWNMq5gL71oIVJf8HCMrqV+gt4/FEaGWOZCiG4ToVTdzsv9cWskfhEn2n1FqcSjfu+MCAfd4eoEQsXpn8dirKQf8F5gTCX6C4ycNBc1HFh04E8iFuFnzJRUA4kd+jAN87ToBsL8oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEnjZkFE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9mSkk2F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEnjZkFE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9mSkk2F"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0j4XU3210780
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A6MXJCAA+hGYKXd4gdTi2Koltv+FMGR2V0l7go7NMGA=; b=HEnjZkFEZS/uOW+h
	iKZU00ZxeZQDH8dJcVpnvxyuVoCKczWz8/uhspZgv0vF6mVNhVGAh/jukBCW5QQw
	tMRhKYwOdryblv79eAEB1YDWp/XiEe8M8yGP1/TwuTxyvVU3FBU83BmACy2jx1yi
	AlVxw9ViIJ5z887RSqooGIEZ2lgVaxoZ2KcTJPJnR30MC6GrJZDVcOgmKobPqzJ4
	SxmH8wQIrAcMgIs3NS9KsG071lFZeDFWjkxZvdnlRLoUGKZvBBQJ6Rkja9f/rIUq
	+fFo7yqVCpgiWfkXnMJeNsQoDMi67TESzoilhcMjYfcvUGntISdOGRA4FJ8/JAXX
	qoBJjg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4rvv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso2356782c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651878; x=1791256678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6MXJCAA+hGYKXd4gdTi2Koltv+FMGR2V0l7go7NMGA=;
        b=T9mSkk2FkknS+lkTnBjkPwTH/hc2nSO+mmJtOIQ8GG+DMA5uygOnn8dw56vjQPBIDm
         ojhluce515oytG27NjMo/voMYrm8fS18JS+oumb9fuZ8Fuzx/rX3kDlgOHUWo/sUbZOM
         9uKw7WPyo60yCLMOEruhjtUEGV3pYcr+B0uSiXyVXkjxOrAyTOxd++5P+Xuaq4DJ/lqb
         uJa7oLcYoJElfhz2iVOJQS2aJ6678ZFXLBgUba2zMhRi7cJwlyDf6uGZFS01PfhtajnI
         llcMIxMEHbgBkbI29Ha90EAwSm124ncO+qO23CVMPS0Jyxv8G9kkH0wSWiFXATXXKHDW
         dtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651878; x=1791256678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6MXJCAA+hGYKXd4gdTi2Koltv+FMGR2V0l7go7NMGA=;
        b=GGx+S5Kh87afdOUwToZZJacgtfZ/VnaiaaxZTjVxF05B8EBUbSB6fBMKYFoQIOxe0M
         vmYvPS+FJUmnYcAte1aqxZl63aFmVfgWH3ECpVM0YPnFTw/RRCaH+ZgHsXgbe0xOOM9t
         8BAeXdRrEdT3df9Fw4Rl6vvL6Z9OmJ5mLeS4S3Foh22U57D4nlfY32JegWyjJPCMrdkw
         1J5LhSTKkKpTSxlqXZl8HdQ0chZkEX+np1EerZGMLA9wcZxU7Xv91ISP+lcl0Md1ewp2
         fXAvJKJ1Z6CIgCBWEoJe8LpILpVxt3/tNE3foMSrdrPyeopdfx3Z1txjZfquDiE6MqFg
         pCzQ==
X-Forwarded-Encrypted: i=1; AKwUvByvIGWjzVm9ALoWisn0L1EXNODQo/zErDexnbv071cJi8qZ2p5Nhpuwoh764wco+FVfQqmtzHjbL7y5xZk=@vger.kernel.org
X-Gm-Message-State: AFuF++nlCm1fM+XGq5djSmfwVz8F2LOcxhtx+xGKkWCQA09F0s9+Z/SO
	FbAwTbOOWzHIYsYHV+oALucuVCbcPQB5D5fenUs1po4ZsVLfu0RiU8wJwvllFE9fdNNZczWB4ej
	5klNrZsiekNf4ZlsKa4UVL9CZib11WdHvPSmKPffbsS35GuSqJq7HfrT2DZ7bQHOTmQ==
X-Gm-Gg: AYBFou1bNgTnVunomqa7lAQhcqqmmlb3HQ5dKaPqGvj5IhV+a2Ps9rso5rbvLmsgOGC
	hO4Q3/xBfNKxfEHFCMxX4OD7z4B7n/kvLFFN9CBWwzI5PFtuvK6ud94YtqBEHFp9Qrxsdu6BRnc
	mVNk5hq0wfhqjPx8Wdm+5LcwcX56OHfYhz9ePxjGpDD4VlGNtQCDipimGL1Xx+Mma85d/vR0pTY
	ultPF9JO+RcIGW4uUOpDIvfO77uRiF+hhRBoJEZ4p8mVC+Pl+h7W5zADnU0y7n5IqJ9IYxoDOlH
	FdsZzMB87CmCeHbE10MAjY+cW3EwXlG2YtL1q65+Eus+YC5mz/zIkA/Cb6kbBffCwrh/Y0lXRsy
	+WViKREgZa+7UfCrWlgOrekth5rBHGS3e5lXZgysJ1TRqfj2sEQgjnJ4BBfA=
X-Received: by 2002:a05:7022:5f01:b0:14a:85b6:55a2 with SMTP id a92af1059eb24-14a85c59a20mr3632120c88.15.1790651877206;
        Mon, 28 Sep 2026 20:17:57 -0700 (PDT)
X-Received: by 2002:a05:7022:5f01:b0:14a:85b6:55a2 with SMTP id a92af1059eb24-14a85c59a20mr3632071c88.15.1790651876365;
        Mon, 28 Sep 2026 20:17:56 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:55 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:17:00 -0700
Subject: [PATCH RFC 09/10] firmware: riscv: rpmi-tee: add memory parcel
 operations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-9-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfXwp5VUaCvqqq0
 trdVuixrOqWLi65+Ch/GU2UsO7m7yUO93RByY1ovh1B3N9DiumNJHrF4jyn6FPuGzTVhVsukZvd
 PiEJPu2aVjv8Fpp435TtOCDyOv5/6i0=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb2de6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZqXtgL2Ob53jORvibrgA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX27EsIWCR1DrV
 lMGEEqpDk2GdMLx8GSo2+S14znF03oHYaT0bYA3yi4fXN4X82zWfsenlgpfIg/CfKZMgXuuBU1U
 nPsuRcWnR/GS2G8AgwXzWQz8RVHXwOgEQ5fwPfzG/olot87b5GlR8DT2SYM6i7ooWdnAOGL7CRB
 nNBprmH7IzpRDpR01jCTGmswmq8auYFBnBo8QIlQJEcqG3XEmN28Cop56YbctDGtqTIdA6TQpU1
 l/wL+nt+yxyna7dT4rJG1ZZ7+ScsLNE8jj1vJzo8jYqGP0v7d4fxmo3Om93lYtJmAj/gqsMNR+N
 RxVQJOC4jq8KWrHK6ogCK5vQPkVrhCmN5JnULxtpKDxPESrKjZKwa5iKb6MATe5M6Gc0eaTEHjR
 Da32Q83fXlqAL46yqT7iel4QqeFq9/tbzfWhgIjtYc/VqVNicdSpBaKwd891TLT1oBlzstHnJKh
 mxfdVIRMnEt50iyZg0Q==
X-Proofpoint-GUID: 6FfE8Ri_sby2fRopQ3Pz7qkQ4VgVJnOU
X-Proofpoint-ORIG-GUID: 6FfE8Ri_sby2fRopQ3Pz7qkQ4VgVJnOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290012

Implement lend, share, and reclaim of RPMI memory parcels for public
memory endpoints. Convert scatterlists into RPMI page blocks and
transparently split large parcels across multiple requests when they
do not fit a single mailbox message, subject to the per-endpoint
multisegment limit reported by firmware.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/driver.c | 497 +++++++++++++++++++++++++++++++
 include/linux/rpmi_tee.h                 |  58 ++++
 2 files changed, 555 insertions(+)

diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
index 7b06c1f96ba8..0004f54c7d89 100644
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -14,6 +14,7 @@
 #include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/rpmi_tee.h>
+#include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/unaligned.h>
 
@@ -38,6 +39,25 @@
 #define RPMI_TEE_SYSTEM_WHOLE		0
 #define RPMI_TEE_SYSTEM_SELF		3
 
+/* Memory service IDs. */
+#define RPMI_TEE_SRV_MEMORY_PARCEL_CREATE	0x09
+#define RPMI_TEE_SRV_MEMORY_PARCEL_RECLAIM	0x0c
+#define RPMI_TEE_SRV_MEMORY_SEGMENT_SEND	0x0d
+
+/* TEE_CALL memory-access flags and block format. */
+#define RPMI_TEE_ACCESS_READ			BIT(29)
+#define RPMI_TEE_ACCESS_WRITE			BIT(30)
+#define RPMI_TEE_ACCESS_EXEC			BIT(31)
+
+#define RPMI_TEE_MEM_PAGE_SHIFT			12
+#define RPMI_TEE_MEM_PAGE_SIZE			BIT(RPMI_TEE_MEM_PAGE_SHIFT)
+#define RPMI_TEE_BLOCK_MAX_PAGES		4096
+
+/* TEE_MEMORY_PARCEL_CREATE flags. */
+#define RPMI_TEE_PARCEL_MULTI_SEGMENT	BIT(31)
+
+/* TEE_MEMORY_SEGMENT_SEND flags. */
+#define RPMI_TEE_SEGMENT_LAST		BIT(31)
 /**
  * struct rpmi_tee_probe_features_req - TEE_PROBE_FEATURES request
  * @feature_id: TEE feature identifier to query.
@@ -110,12 +130,116 @@ struct rpmi_tee_call_resp {
 	u8 service_data[];
 } __packed;
 
+/**
+ * struct rpmi_tee_parcel_create_req - MEMORY_PARCEL_CREATE request prefix
+ * @creator_id: Endpoint identifier creating the parcel.
+ * @creator_access: Creator's residual access permissions.
+ * @receiver_count: Number of receiver endpoint and access pairs in @data.
+ * @flags: Parcel creation flags.
+ * @nonce: Caller-provided parcel nonce.
+ * @block_count: Total number of memory blocks in the parcel.
+ * @label: Caller-provided parcel label.
+ * @data: Receiver endpoint IDs, receiver access values, then memory blocks.
+ */
+struct rpmi_tee_parcel_create_req {
+	__le32 creator_id;
+	__le32 creator_access;
+	__le32 receiver_count;
+	__le32 flags;
+	__le32 nonce;
+	__le32 block_count;
+	u8 label[16];
+	u8 data[];
+} __packed;
+
+#define RPMI_TEE_PARCEL_CREATE_SIZE \
+	(sizeof(struct rpmi_tee_parcel_create_req))
+/* Size of one RECEIVER_ID[] and ACCESS[] entry pair. */
+#define RPMI_TEE_PARCEL_CREATE_RECEIVER_INFO_SIZE	(2 * sizeof(__le32))
+/* Size of one BLOCK_HIGH[] and BLOCK_LOW[] entry pair. */
+#define RPMI_TEE_PARCEL_CREATE_BLOCK_SIZE		(2 * sizeof(__le32))
+
+/* Store one receiver in adjacent RECEIVER_ID[] and ACCESS[] arrays at @data. */
+static inline void rpmi_tee_put_receiver(u8 *data, u32 count, u32 index,
+					 u32 id, u32 access)
+{
+	put_unaligned_le32(id, data + index * sizeof(__le32));
+	put_unaligned_le32(access, data + (count + index) * sizeof(__le32));
+}
+
+/* Store one block in adjacent BLOCK_HIGH[] and BLOCK_LOW[] arrays at @data. */
+static inline void rpmi_tee_put_block(u8 *data, u32 count, u32 index,
+				      u32 high, u32 low)
+{
+	put_unaligned_le32(high, data + index * sizeof(__le32));
+	put_unaligned_le32(low, data + (count + index) * sizeof(__le32));
+}
+
+/**
+ * struct rpmi_tee_parcel_create_resp - MEMORY_PARCEL_CREATE response
+ * @status: RPMI completion status.
+ * @parcel_id: Identifier assigned to the new parcel.
+ */
+struct rpmi_tee_parcel_create_resp {
+	__le32 status;
+	__le32 parcel_id;
+} __packed;
+
+/**
+ * struct rpmi_tee_segment_send_req - MEMORY_SEGMENT_SEND request prefix
+ * @parcel_id: Identifier of the partially created parcel.
+ * @flags: Segment flags.
+ * @block_count: Number of memory blocks in @data.
+ * @data: Memory block address and size pairs.
+ */
+struct rpmi_tee_segment_send_req {
+	__le32 parcel_id;
+	__le32 flags;
+	__le32 block_count;
+	u8 data[];
+} __packed;
+
+#define RPMI_TEE_SEGMENT_SEND_SIZE \
+	(sizeof(struct rpmi_tee_segment_send_req))
+/* Size of one BLOCK_HIGH[] and BLOCK_LOW[] entry pair. */
+#define RPMI_TEE_SEGMENT_SEND_BLOCK_SIZE	(2 * sizeof(__le32))
+
+/**
+ * struct rpmi_tee_parcel_reclaim_req - MEMORY_PARCEL_RECLAIM request
+ * @parcel_id: Identifier of the parcel to reclaim.
+ */
+struct rpmi_tee_parcel_reclaim_req {
+	__le32 parcel_id;
+} __packed;
+
+/**
+ * struct rpmi_tee_parcel_reclaim_resp - MEMORY_PARCEL_RECLAIM response
+ * @status: RPMI completion status.
+ * @flags: Reclaim result flags.
+ */
+struct rpmi_tee_parcel_reclaim_resp {
+	__le32 status;
+	__le32 flags;
+} __packed;
+
+struct rpmi_tee_notif_state {
+	u32 feature;
+};
+
 struct rpmi_tee_mbox {
 	struct mbox_client client;
 	struct mbox_chan *chan;
 	u32 max_msg_data_size;
 };
 
+struct rpmi_tee_mem_state {
+	struct mutex lock;
+	u32 multisegment_max;
+	u32 multisegment_active;
+	bool lend_ok;
+	bool share_ok;
+};
+
 struct rpmi_tee_child {
 	struct list_head node;
 	struct rpmi_tee_device *rdev;
@@ -126,6 +250,21 @@ struct rpmi_tee_transport {
 	struct rpmi_tee_mbox mbox;
 	u32 self_id;
 	struct list_head devices;
+	struct rpmi_tee_mem_state mem;
+	struct rpmi_tee_notif_state notif;
+};
+
+struct rpmi_tee_block_iter {
+	struct scatterlist *sg;
+	phys_addr_t address;
+	size_t length;
+};
+
+struct rpmi_tee_parcel_xfer {
+	struct rpmi_tee_block_iter iter;
+	u32 parcel_id;
+	u32 block_count;
+	u32 next_block;
 };
 
 /* __rpmi_tee_send() - Send an RPMI TEE service request. */
@@ -489,12 +628,369 @@ static int rpmi_tee_op_call(struct rpmi_tee_device *rdev, const void *req,
 	return 0;
 }
 
+/* MEMORY_PARCEL_RECLAIM. */
+static int rpmi_tee_memory_reclaim(struct rpmi_tee_transport *priv,
+				   u32 parcel_id)
+{
+	struct rpmi_tee_parcel_reclaim_req req = {
+		.parcel_id = cpu_to_le32(parcel_id),
+	};
+	struct rpmi_tee_parcel_reclaim_resp resp;
+	size_t resp_len = sizeof(resp);
+	int ret;
+
+	ret = rpmi_tee_send(priv, RPMI_TEE_SRV_MEMORY_PARCEL_RECLAIM, &req,
+			    sizeof(req), &resp, &resp_len);
+	if (ret)
+		return ret;
+
+	if (resp_len != sizeof(resp))
+		return -EPROTO;
+
+	return 0;
+}
+
+static int rpmi_tee_op_memory_reclaim(struct rpmi_tee_device *rdev,
+				       u32 parcel_id)
+{
+	return rpmi_tee_memory_reclaim(rpmi_tee_device_to_transport(rdev),
+				       parcel_id);
+}
+
+/**
+ * rpmi_tee_count_blocks_sg - Count RPMI memory blocks in an SG list
+ * @sg: First SG entry describing the memory to share or lend.
+ * @count_out: Returns the number of RPMI memory blocks.
+ *
+ * Validates that every entry represents one or more whole 4 KiB pages. An
+ * RPMI memory block represents at most @RPMI_TEE_BLOCK_MAX_PAGES pages.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int rpmi_tee_count_blocks_sg(struct scatterlist *sg, u32 *count_out)
+{
+	struct scatterlist *entry;
+	u32 count = 0;
+
+	if (!sg)
+		return -EINVAL;
+
+	for (entry = sg; entry; entry = sg_next(entry)) {
+		phys_addr_t address = sg_phys(entry);
+		size_t blocks;
+
+		if (!entry->length ||
+		    !IS_ALIGNED(address, RPMI_TEE_MEM_PAGE_SIZE) ||
+		    !IS_ALIGNED(entry->length, RPMI_TEE_MEM_PAGE_SIZE))
+			return -EINVAL;
+
+		/* One RPMI block describes at most 4096 pages. */
+		blocks = DIV_ROUND_UP(entry->length >> RPMI_TEE_MEM_PAGE_SHIFT,
+				      RPMI_TEE_BLOCK_MAX_PAGES);
+		if (blocks > U32_MAX - count)
+			return -EOVERFLOW;
+
+		count += blocks;
+	}
+
+	*count_out = count;
+
+	return 0;
+}
+
+static void rpmi_tee_block_iter_init(struct rpmi_tee_block_iter *iter,
+				     struct scatterlist *sg)
+{
+	iter->sg = sg;
+	iter->address = 0;
+	iter->length = 0;
+}
+
+/* Encode the next RPMI memory block from an SG iterator. */
+static bool rpmi_tee_block_iter_next(struct rpmi_tee_block_iter *iter,
+				     u32 *high, u32 *low)
+{
+	u32 pages;
+
+	if (!iter->length) {
+		if (!iter->sg)
+			return false;
+		/* Next SG. */
+		iter->address = sg_phys(iter->sg);
+		iter->length = iter->sg->length;
+		iter->sg = sg_next(iter->sg);
+	}
+
+	/* RPMI memory block represents at most @RPMI_TEE_BLOCK_MAX_PAGES pages. */
+	pages = min_t(size_t, iter->length >> RPMI_TEE_MEM_PAGE_SHIFT,
+		      RPMI_TEE_BLOCK_MAX_PAGES);
+
+	*high = upper_32_bits(iter->address >> RPMI_TEE_MEM_PAGE_SHIFT);
+	*low = lower_32_bits(iter->address >> RPMI_TEE_MEM_PAGE_SHIFT) << 12 |
+		(pages - 1);
+
+	iter->address += (phys_addr_t)pages << RPMI_TEE_MEM_PAGE_SHIFT;
+	iter->length -= (size_t)pages << RPMI_TEE_MEM_PAGE_SHIFT;
+
+	return true;
+}
+
+static int rpmi_tee_fill_blocks(struct rpmi_tee_block_iter *iter, u8 *data,
+				u32 count)
+{
+	u32 high, low, i;
+
+	for (i = 0; i < count; i++) {
+		if (!rpmi_tee_block_iter_next(iter, &high, &low))
+			return -EINVAL;
+
+		rpmi_tee_put_block(data, count, i, high, low);
+	}
+
+	return 0;
+}
+
+/* Convert memory access flags RPMI_TEE_MEM_ACCESS_* to RPMI_TEE_ACCESS_*. */
+static u32 rpmi_tee_access(u32 mem_access)
+{
+	u32 tee_access = 0;
+
+	if (mem_access & RPMI_TEE_MEM_ACCESS_READ)
+		tee_access |= RPMI_TEE_ACCESS_READ;
+	if (mem_access & RPMI_TEE_MEM_ACCESS_WRITE)
+		tee_access |= RPMI_TEE_ACCESS_WRITE;
+	if (mem_access & RPMI_TEE_MEM_ACCESS_EXEC)
+		tee_access |= RPMI_TEE_ACCESS_EXEC;
+
+	return tee_access;
+}
+
+static int rpmi_tee_reserve_segment_slot(struct rpmi_tee_transport *priv)
+{
+	int ret = 0;
+
+	guard(mutex)(&priv->mem.lock);
+	if (priv->mem.multisegment_active == priv->mem.multisegment_max)
+		ret = -EBUSY;
+	else
+		priv->mem.multisegment_active++;
+
+	return ret;
+}
+
+static void rpmi_tee_release_segment_slot(struct rpmi_tee_transport *priv)
+{
+	guard(mutex)(&priv->mem.lock);
+	priv->mem.multisegment_active--;
+}
+
+/* Send the remaining blocks of a segmented memory parcel. */
+static int rpmi_tee_parcel_send_segments(struct rpmi_tee_transport *priv,
+					 struct rpmi_tee_parcel_xfer *xfer)
+{
+	while (xfer->next_block < xfer->block_count) {
+		size_t req_len;
+		u32 count;
+		int ret;
+
+		count = min_t(u32, xfer->block_count - xfer->next_block,
+			      (priv->mbox.max_msg_data_size -
+				RPMI_TEE_SEGMENT_SEND_SIZE) /
+				RPMI_TEE_SEGMENT_SEND_BLOCK_SIZE);
+		if (!count)
+			return -EMSGSIZE;
+
+		req_len = RPMI_TEE_SEGMENT_SEND_SIZE +
+			RPMI_TEE_SEGMENT_SEND_BLOCK_SIZE * count;
+
+		struct rpmi_tee_segment_send_req *req __free(kfree) =
+			kzalloc(req_len, GFP_KERNEL);
+		if (!req)
+			return -ENOMEM;
+
+		/* INIT request. */
+		req->parcel_id = cpu_to_le32(xfer->parcel_id);
+		req->flags = cpu_to_le32(xfer->next_block + count ==
+					 xfer->block_count ?
+					 RPMI_TEE_SEGMENT_LAST : 0);
+		req->block_count = cpu_to_le32(count);
+		ret = rpmi_tee_fill_blocks(&xfer->iter, req->data, count);
+		if (ret)
+			return ret;
+
+		ret = rpmi_tee_send(priv, RPMI_TEE_SRV_MEMORY_SEGMENT_SEND,
+				    req, req_len, NULL, NULL);
+		if (ret)
+			return ret;
+
+		xfer->next_block += count;
+	}
+
+	return 0;
+}
+
+/* Create a memory parcel after the caller has validated its operation. */
+static int rpmi_tee_parcel_create(struct rpmi_tee_transport *priv,
+				    struct rpmi_tee_mem_args *args)
+{
+	struct rpmi_tee_parcel_create_resp resp;
+	struct rpmi_tee_parcel_xfer xfer;
+	size_t blk_off, req_len, resp_len;
+	bool segmented;
+	int ret;
+	u32 i;
+
+	ret = rpmi_tee_count_blocks_sg(args->sg, &xfer.block_count);
+	if (ret)
+		return ret;
+
+	/* BLOCK_HIGH[] follows the request header and receiver arrays. */
+	blk_off = RPMI_TEE_PARCEL_CREATE_SIZE + args->receiver_count *
+		RPMI_TEE_PARCEL_CREATE_RECEIVER_INFO_SIZE;
+
+	/* Limit the initial request to the parcel's actual block count. */
+	xfer.next_block = min((priv->mbox.max_msg_data_size - blk_off) /
+			      RPMI_TEE_PARCEL_CREATE_BLOCK_SIZE,
+			      xfer.block_count);
+
+	segmented = xfer.next_block < xfer.block_count;
+	if (segmented) {
+		if (!priv->mem.multisegment_max)
+			return -EOPNOTSUPP;
+		/* Reserve a slot against the firmware's advertised limit. */
+		ret = rpmi_tee_reserve_segment_slot(priv);
+		if (ret)
+			return ret;
+	}
+
+	req_len = blk_off + RPMI_TEE_PARCEL_CREATE_BLOCK_SIZE * xfer.next_block;
+
+	struct rpmi_tee_parcel_create_req *req __free(kfree) =
+		kzalloc(req_len, GFP_KERNEL);
+	if (!req) {
+		ret = -ENOMEM;
+		goto out_release_slot;
+	}
+
+	rpmi_tee_block_iter_init(&xfer.iter, args->sg);
+
+	/* INIT request. */
+	req->creator_id = cpu_to_le32(priv->self_id);
+	req->creator_access = cpu_to_le32(rpmi_tee_access(args->creator_access));
+	req->receiver_count = cpu_to_le32(args->receiver_count);
+	req->flags = cpu_to_le32(segmented ? RPMI_TEE_PARCEL_MULTI_SEGMENT : 0);
+	req->nonce = cpu_to_le32(args->nonce);
+	req->block_count = cpu_to_le32(xfer.block_count);
+	memcpy(req->label, args->label, sizeof(req->label));
+
+	for (i = 0; i < args->receiver_count; i++) {
+		u32 tee_access = rpmi_tee_access(args->receivers[i].access);
+		/* Store RECEIVER_ID[i] and ACCESS[i]. */
+		rpmi_tee_put_receiver(req->data, args->receiver_count, i,
+				      args->receivers[i].endpoint_id,
+				      tee_access);
+	}
+
+	ret = rpmi_tee_fill_blocks(&xfer.iter,
+				   req->data + 8 * args->receiver_count,
+				   xfer.next_block);
+	if (ret)
+		goto out_release_slot;
+
+	resp_len = sizeof(resp);
+	ret = rpmi_tee_send(priv, RPMI_TEE_SRV_MEMORY_PARCEL_CREATE,
+			    req, req_len, &resp, &resp_len);
+	if (ret)
+		goto out_release_slot;
+	if (resp_len != sizeof(resp))
+		return -EPROTO;
+
+	xfer.parcel_id = get_unaligned_le32(&resp.parcel_id);
+	/* Send remaining blocks as segments. */
+	ret = rpmi_tee_parcel_send_segments(priv, &xfer);
+	if (ret) {
+		/* On error, retain the slot as firmware may still hold it. */
+		if (rpmi_tee_memory_reclaim(priv, xfer.parcel_id)) {
+			dev_warn(priv->dev, "failed to abort parcel %#x\n",
+				 xfer.parcel_id);
+
+			return ret;
+		}
+	} else {
+		args->parcel_id = xfer.parcel_id;
+	}
+
+out_release_slot:
+	if (segmented)
+		rpmi_tee_release_segment_slot(priv);
+
+	return ret;
+}
+
+/* MEMORY_PARCEL_CREATE. */
+static int rpmi_tee_op_parcel_create(struct rpmi_tee_device *rdev,
+				     struct rpmi_tee_mem_args *args, bool lend)
+{
+	struct rpmi_tee_transport *priv = rpmi_tee_device_to_transport(rdev);
+	u32 i;
+
+	if (!args || !args->receivers || !args->receiver_count)
+		return -EINVAL;
+
+	/* LEND relinquishes creator access, whereas SHARE retains it. */
+	if (lend ? args->creator_access : !args->creator_access)
+		return -EINVAL;
+
+	if (args->creator_access & ~RPMI_TEE_MEM_ACCESS_MASK)
+		return -EINVAL;
+	for (i = 0; i < args->receiver_count; i++) {
+		if (args->receivers[i].access & ~RPMI_TEE_MEM_ACCESS_MASK)
+			return -EINVAL;
+	}
+
+	if (lend ? !priv->mem.lend_ok : !priv->mem.share_ok)
+		return -EOPNOTSUPP;
+
+	/* A parcel must contain at least one BLOCK_HIGH/BLOCK_LOW pair. */
+	if (priv->mbox.max_msg_data_size < RPMI_TEE_PARCEL_CREATE_SIZE +
+	    RPMI_TEE_PARCEL_CREATE_BLOCK_SIZE)
+		return -EMSGSIZE;
+
+	/* Check if receiver's info fit after reserving room for one block. */
+	if (args->receiver_count >
+	    (priv->mbox.max_msg_data_size - RPMI_TEE_PARCEL_CREATE_SIZE -
+	     RPMI_TEE_PARCEL_CREATE_BLOCK_SIZE) /
+	    RPMI_TEE_PARCEL_CREATE_RECEIVER_INFO_SIZE)
+		return -EMSGSIZE;
+
+	return rpmi_tee_parcel_create(priv, args);
+}
+
+static int rpmi_tee_op_memory_lend(struct rpmi_tee_device *rdev,
+				   struct rpmi_tee_mem_args *args)
+{
+	return rpmi_tee_op_parcel_create(rdev, args, true);
+}
+
+static int rpmi_tee_op_memory_share(struct rpmi_tee_device *rdev,
+				    struct rpmi_tee_mem_args *args)
+{
+	return rpmi_tee_op_parcel_create(rdev, args, false);
+}
+
 static const struct rpmi_tee_msg_ops rpmi_tee_msg_ops = {
 	.call = rpmi_tee_op_call,
 };
 
+static const struct rpmi_tee_mem_ops rpmi_tee_mem_ops = {
+	.memory_lend = rpmi_tee_op_memory_lend,
+	.memory_share = rpmi_tee_op_memory_share,
+	.memory_reclaim = rpmi_tee_op_memory_reclaim,
+};
+
 static const struct rpmi_tee_ops rpmi_tee_ops = {
 	.msg_ops = &rpmi_tee_msg_ops,
+	.mem_ops = &rpmi_tee_mem_ops,
 };
 
 static void rpmi_tee_unregister_devices(struct rpmi_tee_transport *priv)
@@ -599,6 +1095,7 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 	priv->dev = &pdev->dev;
 	platform_set_drvdata(pdev, priv);
 	INIT_LIST_HEAD(&priv->devices);
+	mutex_init(&priv->mem.lock);
 	priv->mbox.client.dev = &pdev->dev;
 	priv->mbox.client.tx_sync = true;
 	priv->mbox.chan = mbox_request_channel(&priv->mbox.client, 0);
diff --git a/include/linux/rpmi_tee.h b/include/linux/rpmi_tee.h
index 57c1843537da..c2dd99293481 100644
--- a/include/linux/rpmi_tee.h
+++ b/include/linux/rpmi_tee.h
@@ -10,6 +10,7 @@
 
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/scatterlist.h>
 #include <linux/types.h>
 #include <linux/uuid.h>
 
@@ -46,9 +47,66 @@ struct rpmi_tee_msg_ops {
 		    size_t req_len, void *resp, size_t *resp_len);
 };
 
+/* Access permissions used by memory parcel operations. */
+#define RPMI_TEE_MEM_ACCESS_READ	BIT(0)
+#define RPMI_TEE_MEM_ACCESS_WRITE	BIT(1)
+#define RPMI_TEE_MEM_ACCESS_EXEC	BIT(2)
+#define RPMI_TEE_MEM_ACCESS_MASK	(RPMI_TEE_MEM_ACCESS_READ | \
+					 RPMI_TEE_MEM_ACCESS_WRITE | \
+					 RPMI_TEE_MEM_ACCESS_EXEC)
+
+/* One receiver's access rights for a memory parcel. */
+struct rpmi_tee_mem_receiver {
+	/* RPMI endpoint identifier of the receiver. */
+	u32 endpoint_id;
+	/* Bitwise OR of RPMI_TEE_MEM_ACCESS_* permissions. */
+	u32 access;
+};
+
+/* Arguments used to create a memory parcel. */
+struct rpmi_tee_mem_args {
+	/* Scatterlist describing whole, 4 KiB-aligned memory pages. */
+	struct scatterlist *sg;
+	/* Array of @receiver_count parcel receivers. */
+	const struct rpmi_tee_mem_receiver *receivers;
+	/* Number of entries in @receivers. */
+	u32 receiver_count;
+	/* Creator permissions retained by a SHARE operation. */
+	u32 creator_access;
+	/* Implementation-defined value carried in the parcel descriptor. */
+	u32 nonce;
+	/* Implementation-defined 16-byte parcel label. */
+	u8 label[16];
+	/* Returned firmware-assigned parcel identifier on success. */
+	u32 parcel_id;
+};
+
+/* RPMI TEE memory-parcel operations. */
+struct rpmi_tee_mem_ops {
+	/**
+	 * @memory_lend: Lend the pages described by @args to its receivers. The
+	 *	creator must not retain access, so @args->creator_access must be zero.
+	 */
+	int (*memory_lend)(struct rpmi_tee_device *rdev,
+			   struct rpmi_tee_mem_args *args);
+	/**
+	 * @memory_share: Share the pages described by @args with its receivers.
+	 *	The creator retains the nonzero permissions in
+	 *	@args->creator_access.
+	 */
+	int (*memory_share)(struct rpmi_tee_device *rdev,
+			    struct rpmi_tee_mem_args *args);
+	/**
+	 * @memory_reclaim: Reclaim the parcel identified by @parcel_id after all
+	 *	receivers have relinquished it.
+	 */
+	int (*memory_reclaim)(struct rpmi_tee_device *rdev, u32 parcel_id);
+};
+
 /* RPMI TEE transport operation groups. */
 struct rpmi_tee_ops {
 	const struct rpmi_tee_msg_ops *msg_ops;
+	const struct rpmi_tee_mem_ops *mem_ops;
 };
 
 extern const struct bus_type rpmi_tee_bus_type;

-- 
2.34.1

