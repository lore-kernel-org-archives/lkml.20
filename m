Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC23AFB18
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430139; cv=none; b=pkKyfomk3Me50GNTfXuN/vrBJEL83e+fbiLN0Zvwbo//ZyWyF5Zl4wVmRbClXHxm/YHIBO/5/FKXn6ZlSI8f7z9d57AK4EgKYp+EndjUfco4q/+NDQztY4BBiZMqHI2A+WniDmobW/nwAmhb2wXrv8hsz+wv5ZGcgyyqfFDVjrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430139; c=relaxed/simple;
	bh=yK8tXZ4W2qFOIHjQKJc/I82o5d2kxSmh4bqvJiWnd0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZP0ZXjMp2ChRZTJy83htyyAMbdKapGlrnuvdVnoOnwoJ3LVkj0xlsmT0K/oFD1FAbskt8WH+vzJ4oi3XavK5DPbbDVaxaFmmFwUgdLUAlx1D9KzZSsgRr7bQHY0VrUxW28rK/atSvff16FR041SrEhc9acVPh06Uacmw41zx4KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e0uQRsbM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hl3M02vM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0uQRsbM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hl3M02vM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hPqc607525
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 03:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mApVFjc9rhNzsGXcLCP/umDupri6qQf4ON6W11wUO6o=; b=e0uQRsbMNM1GTMkf
	mqDIqtYpWvndDndgkwyOQJb48yWJ5yfhAIKztKOzBu//TC5mk4Nf8YhbOr2XcB/Z
	4Na0nbpmTzS9oqQElhyPIPqSgD96t8j4sp35cixqBIaBVDOkxLsPUAXcZ9wwKG2h
	QwCMxr5pKbxDuo1QNJhx9hTlLvhvwopCLrufxvEtWROhKcOFkM9bZq2ElM/aQ0As
	WgLE9t8dv6s7AKoljuV/3Uy/RAbrKbAbxH2Ek/XZL+c3E7VzxWIlbdsa77665shL
	UekeiVvudhEmytOrsk9B+Gcyahmn448KhnEWDA3izRTgIbUY9tgKhRtNGqn49UkI
	m2AKGQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2rwqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:28:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30f1b904861so6339049eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430134; x=1792034934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mApVFjc9rhNzsGXcLCP/umDupri6qQf4ON6W11wUO6o=;
        b=hl3M02vMyHucStW4iatYDi6IPdo+z3ltn320zUWcNyk7yvCnFVzGk2xHxHS/ZtCzA0
         FDIT7XnbU7jVLASvlN5zU1cLYZWY669eFEWqGij13aOPyWYl0vCGYKHENbRxsQ6Fms6h
         VaZXdTyMD8idENxHEIAEmccywQOvBHsYKTiMqgAdRGkJHib9CusqSf1+FeyNPu9s3cLX
         sp4u54fMMhkXyJnzWaWybIv7RHh3WPUHUIL4tz2hcYbJV8EC9OjCLIBH9EERGdK1SaR1
         QtoQJeMUiPtzc1Jki1VtA1RizEc916Du3QAq9zv6YIhCKseuouWPYJQ+WyxU+r93aZMn
         oFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430134; x=1792034934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mApVFjc9rhNzsGXcLCP/umDupri6qQf4ON6W11wUO6o=;
        b=xitxPpwUwuyCkYyPMsDWIi2vx2JiwRs1pcnCegZlBd/+ub1+WBQDoE62G7KJ7flV32
         yfcTW+KvrX9/FEXzz0ma0MPoGSTldpUU0khAkkPd7A3HXgNKFVIYcx5YIMcYcsrGS46w
         A2a7lQ2MwUSoTAfruc/5fZl7L767bOiIKhKgpukKB2Et/n0G6t4JW9lhSyG8NDAV0CY8
         WcGbEjVCToHBmlItIP2ugBPqeI0+0AtDHGFYqmAnW/Vkv1Dk3E5M2mrz17oQbECO+Gcz
         6fKLi7jtfj7cKZfrLoIJZ03yG0pIWaqUa6j8fRuC5XSg1HXLD7iV8HwId+2XuLuzfBMK
         6F5g==
X-Forwarded-Encrypted: i=1; AKwUvByvvhH5wFL0MjAmwO1571W46W4Mwen7ee/wl9UjRCK8KE+wVsld5g7c8qpxaJFzqpKIsJC6lA94ZtXse0s=@vger.kernel.org
X-Gm-Message-State: AFuF++k0aI/KsCNhmoHwkeIKLyPUWS3yIA95WPP194E3jqUWSUN0yilm
	e4BpUSonneP5dHLwrq8hO2UXwtl59K55wu7HLP/Oa5Xl6Lbt2eVo2m9YjNI7Ji0Tphcqbp8YRK5
	RSI/a8287ktDvHK+w1h8WYKP+UJPXnXnVUqDr2XJybr4aH+ud8n20+9BI+xxCY/fiOA==
X-Gm-Gg: AYBFou3oVDvIXVaiCVtoYiQsSXH0bTknaQhpXugNmmsoUfN2Xp2/0E12o9PKL7dnrE7
	kfvFSwvV32dJegIPTWMAbumnAwgwrGIGwciNcDMyCV5a6zYCpwB92YPRFFBXEp35w1Mn/KvVZr7
	DYAFpqw6c7T4yVTjdBo3P8vsIKm2+0QJzOX6jAks/Lyf2+yLHOhUTe4Wg+/wbA/Dbe43XTVEiEV
	7Va8x1yk2Nchp0BpSuJUmv/7brmGjsf2M76R+Naq0Dtw9XtkUXTTtssDaCUHRndfibtlwU+exKU
	eUYFH5blgb4VoF1Txhnoue/9AI0lcL4LeXPPIQ4fIIr0l02vkpyur5mVwRwsa2Rh3OXlSDXITvA
	+zY3NIb3lSMTiNgtFZQekgxnubAm+bVjSxo8i52oWdhsV6SOoq/M2Eh/g8g==
X-Received: by 2002:a05:693c:4143:20b0:343:8d77:1d97 with SMTP id 5a478bee46e88-3515de5db65mr5691048eec.39.1791430133816;
        Wed, 07 Oct 2026 20:28:53 -0700 (PDT)
X-Received: by 2002:a05:693c:4143:20b0:343:8d77:1d97 with SMTP id 5a478bee46e88-3515de5db65mr5691012eec.39.1791430133132;
        Wed, 07 Oct 2026 20:28:53 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:52 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:15 -0700
Subject: [PATCH RFC v2 09/10] firmware: riscv: rpmi-tee: add memory parcel
 operations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-9-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfXzo6pQyX5UaIr
 mi4ee8cwNuDDK0gA+gKkxwenobaS4akk/IJnTJH9/T1uunBvO4EPlq3G1NdNkFVeeQh4SxTD1I+
 M473FXKAlHoLEjUxi7YCnBsjdlc3C3w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX2jM5ECHwEJ2I
 lwk4JFop/4v8N8NG2NR+v17Aru6yHPorBAnn5TMZ8is5zrjiT+7F9f2CIQv/+1G1qupl+dIcFx/
 IyN8U08Wrad6b7TaBt9i/rOJGrJ5423F/LUQ1NhO2BJn8DANgMzOd8tRpgB3Zr8MZeh3wL7RLNE
 m4CexHzotKxvonYvt3e1OqK7uiBkrWYa7eUSsFWRNC32vhAWAwqQUrlKFN0tAUhTv+kBk8J37mP
 fMCSt7cN2mu67YQ/M7Mw4ZLI+hWJb79mYQSWB9wnJDZJpLNAg3liBOUxHN2HjlRpoXqZlYry5Xm
 J6ZRZCRGPik1McbCqJNLb+v8PnjaloClseaNL+1elT4wP6U7WqFwOD4P3lp/ICJjPfvIwNgspqo
 aWRy7vaC1//UiqprFDwD+Ysj4UejWM1iVbCLtftw5ivkCsRXwJ1SCWgpCSbLWT7SJmT93fSjICo
 vQibkLRkwYAebBb5tpw==
X-Proofpoint-ORIG-GUID: buUJnxD66p7Gsf-uvG5AtM0gXZhCoPr2
X-Proofpoint-GUID: buUJnxD66p7Gsf-uvG5AtM0gXZhCoPr2
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac70df6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZqXtgL2Ob53jORvibrgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013

Add memory lending, sharing and reclamation through RPMI memory parcels
so service drivers can exchange memory with TEE endpoints.

Support segmented parcels when memory descriptions exceed the mailbox
payload limit, respecting the firmware's limit on concurrent segmented
operations.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/driver.c           | 477 +++++++++++++++++++++
 drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h |   6 +
 include/linux/rpmi_tee.h                           |  58 +++
 3 files changed, 541 insertions(+)

diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
index b43a09f5e853..690561ed949d 100644
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/rpmi_tee.h>
+#include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/unaligned.h>
 
@@ -27,6 +28,20 @@
 #define RPMI_TEE_MEMORY_FEATURE_TEE_ONLY		1
 #define RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED	2
 
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
@@ -73,11 +88,116 @@ struct rpmi_tee_call_resp {
 	u8 service_data[];
 } __packed;
 
+/**
+ * struct rpmi_tee_parcel_create_req - MEMORY_PARCEL_CREATE request prefix
+ * @creator_id: Endpoint identifier creating the parcel.
+ * @creator_access: Creator's residual access permissions.
+ * @receiver_count: Number of receiver endpoint and access pairs in @data.
+ * @flags: Parcel creation flags.
+ * @nonce: Caller-provided parcel nonce.
+ * @block_count: Number of memory blocks included in this request.
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
 struct rpmi_tee_child {
 	struct list_head node;
 	struct rpmi_tee_device *rdev;
 };
 
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
+};
+
 /* rpmi_tee_send_with_status() - Send an RPMI TEE service request. */
 int rpmi_tee_send_with_status(struct rpmi_tee_transport *priv, u32 service_id,
 			      const void *req, size_t req_len, void *resp,
@@ -326,6 +446,355 @@ static int rpmi_tee_op_call(struct rpmi_tee_device *rdev, const void *req,
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
+	*high = upper_32_bits(iter->address);
+	*low = lower_32_bits(iter->address) | (pages - 1);
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
+				  struct rpmi_tee_mem_args *args)
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
+	req->block_count = cpu_to_le32(xfer.next_block);
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
 static const struct rpmi_tee_info_ops rpmi_tee_info_ops = {
 	.msg_limits_get = rpmi_tee_op_msg_limits_get,
 };
@@ -334,9 +803,16 @@ static const struct rpmi_tee_msg_ops rpmi_tee_msg_ops = {
 	.call = rpmi_tee_op_call,
 };
 
+static const struct rpmi_tee_mem_ops rpmi_tee_mem_ops = {
+	.memory_lend = rpmi_tee_op_memory_lend,
+	.memory_share = rpmi_tee_op_memory_share,
+	.memory_reclaim = rpmi_tee_op_memory_reclaim,
+};
+
 static const struct rpmi_tee_ops rpmi_tee_ops = {
 	.info_ops = &rpmi_tee_info_ops,
 	.msg_ops = &rpmi_tee_msg_ops,
+	.mem_ops = &rpmi_tee_mem_ops,
 };
 
 static void rpmi_tee_unregister_devices(struct rpmi_tee_transport *priv)
@@ -431,6 +907,7 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 	priv->dev = &pdev->dev;
 	platform_set_drvdata(pdev, priv);
 	INIT_LIST_HEAD(&priv->devices);
+	mutex_init(&priv->mem.lock);
 	priv->mbox.client.dev = &pdev->dev;
 	priv->mbox.client.tx_sync = true;
 	priv->mbox.chan = mbox_request_channel(&priv->mbox.client, 0);
diff --git a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
index 0c3cfa0f14ec..4df47d52724a 100644
--- a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
+++ b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
@@ -8,6 +8,7 @@
 
 #include <linux/list.h>
 #include <linux/mailbox_client.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/uuid.h>
 
@@ -19,6 +20,9 @@
 #define RPMI_TEE_SRV_PROBE_DOMAIN	0x04
 #define RPMI_TEE_SRV_PROBE_ENDPOINT	0x05
 #define RPMI_TEE_SRV_CALL		0x18
+#define RPMI_TEE_SRV_MEMORY_PARCEL_CREATE	0x0e
+#define RPMI_TEE_SRV_MEMORY_PARCEL_RECLAIM	0x11
+#define RPMI_TEE_SRV_MEMORY_SEGMENT_SEND	0x12
 
 struct rpmi_tee_notif_state {
 	u32 feature;
@@ -31,7 +35,9 @@ struct rpmi_tee_mbox {
 };
 
 struct rpmi_tee_mem_state {
+	struct mutex lock;
 	u32 multisegment_max;
+	u32 multisegment_active;
 	bool lend_ok;
 	bool share_ok;
 };
diff --git a/include/linux/rpmi_tee.h b/include/linux/rpmi_tee.h
index a76055149996..10f6cae4a3a7 100644
--- a/include/linux/rpmi_tee.h
+++ b/include/linux/rpmi_tee.h
@@ -10,6 +10,7 @@
 
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/scatterlist.h>
 #include <linux/types.h>
 #include <linux/uuid.h>
 
@@ -70,10 +71,67 @@ struct rpmi_tee_msg_ops {
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
 	const struct rpmi_tee_info_ops *info_ops;
 	const struct rpmi_tee_msg_ops *msg_ops;
+	const struct rpmi_tee_mem_ops *mem_ops;
 };
 
 extern const struct bus_type rpmi_tee_bus_type;

-- 
2.34.1

