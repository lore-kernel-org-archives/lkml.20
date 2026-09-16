Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCFD48FF77
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585165; cv=none; b=MnW6XzZCub56nqOrgfk9cVUyMRuVnY0G/aL8hjvrJzBG/lVqyFedpa+eaMVet6EurOaNogHD0A+3EX5ozSo0mAF/aMPVpXaMSUoqR2qqTmnXeDuVLpchzmA5QSU+mGxeeAtRP27oSPW4ptTI8KGPuVCDfXfUiWlLmkfkeFJC+kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585165; c=relaxed/simple;
	bh=iou8jtUT5lziFEwj1uPmEAa0iUVv2n/54nzBQHsydCY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oNZ5WCUaWwgall+MPvd4miA/ncwbKvioWzepkHsst8WaG78U4VUeW6mJQC4jXzUTh6hPmm9hwPdtgM266OTxAC2kh7eRx0jmd1HuHbk/785J4vkndKrzKqe1UivySm9rFhNlKqypQjw6eER6Byyjq86P4+RJPg+5KAhp4VORQSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SON14eeV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+EcT4jQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SON14eeV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i+EcT4jQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GH6Ovr3559506
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oNh5E4YjPV8Mu31/aT2lj/zyB3bKAAIBtti
	yNhLYqOs=; b=SON14eeVgYUiQGCrUv1gWqAVLKyoojRGGX/4C941WcnT/GAUi3P
	SRXlUmeGgSwzgadAU9HFF3av+UWpxqrnXdjd4OeVNw0iT3NUaoLvlCsvpfUkjyHn
	Ai+hFDtmiMVK8Ci0Pt+spyS28dQMAiJTrvzK/4/g/ahsajJpmmPbSDA6Hx6zzSPe
	AEnqfUv2MGUlbQnfDPMhAuVUjAV1D41bKG908FCfgBZWKSEL1cOOz/eif8996tQ9
	rocKNih9OQNFBrRl9oNROR+i92wV1idbH065McJhfmkb39lEduCM6G4u0kkjGngg
	03OoU2whbwccWYbV2YVkwCU3sB4sM0WuSUA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7h8f3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:59:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd753a52bbso940535ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789585142; x=1790189942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oNh5E4YjPV8Mu31/aT2lj/zyB3bKAAIBttiyNhLYqOs=;
        b=i+EcT4jQJV3o7jsVVQTH7pIhUFokVlchy2VXRbLBWTOhyBs9NfUdJGFyplqaxzqY2/
         5AAGV67zzH0ShoCvMkdiacdxUYm4dq81nPNoUicASiBdSEeBoZhC700iFz2Pdy0k9cV6
         8eAFL0ZQ2UXCN0BTvlWtLugPQsR68Ae3abNzpsH1N+ZUvwGMbU8DIKRRzDA9XmP7JXnz
         MwtiQTxUN3ur+0SQcRs9A+So5713d9avZ2xSOJKeGXBeV2Y8+fmA7JLFsqjadqiCP19o
         j0PC+y+jaFlwaxtJUk3Y2aL0lpTTldsr1mr+XqA+bV6k7TxUOF5hcZtqlK1F9Gj+AK2f
         tvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789585142; x=1790189942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNh5E4YjPV8Mu31/aT2lj/zyB3bKAAIBttiyNhLYqOs=;
        b=cf+r16RytdMVpBSE+TuVUE8eJ+AjSz98DZiKTMC9fT5BMeZEI2H5oMeR+bnbVLHEk1
         8UbF0lT4OYAzo3pf+IAEFxVuw6SlcGMMA4Nh+ZxZ0FQqZe7aUOWLzGGQPosYqfwgEP+b
         VGa0flKJ4RqFj4rE9KdCGrOCHLVxwC2hzAPsmHMCIsmuZglxJMJeywu6K6KT8IFyyeKO
         GofFkkgr9AUD7Aw5Xz9qwblC5ZvdAv8F+1/hE+Y6+CbdlegdjkVGMNWurkOjWOBcAzXO
         APOPyBqFXOkf4rZMPk+p1g3IxMX+//v7MhezbNDfMMw7tGqDNmxLLn1hcByTFxVHTcAL
         k8PA==
X-Forwarded-Encrypted: i=1; AKwUvBzZXk2xITvt0fwjurWZVKps5I2P78zOVwjRfdVD+yV/7fE31ZhjvCDoWDrYs3+sydpXKp504Wf9Id1uLz0=@vger.kernel.org
X-Gm-Message-State: AFuF++ktA3+V50XCXjVvr7VZm/Djt6O8oge/e6ISET2eNpY3WbBc0mTm
	H8E69k30+28BtojfkfAKxFU+XTu5zxexzMZyUXs8sIkN/JUOzmq0DOEuGKqB+PNmGT4cc6go1yx
	xI4BnBOzv0aKhYSLLNbODFVYRfB369B7C/EEpful8DicHf5xEHnW8MY+NaIc96QlQ3YI=
X-Gm-Gg: AYBFou2gcE6XcRpSnMYZx2dQR8/f09raJkUr8n0AQC/HcqbAkNbRu1sMv99wLycVkli
	nxgmsLRBWbDjIh8jAA+PibU6jJshJ2iHSyQYBPFmmIQ6d/nuCrDGl3uAY0+hAFo//icdiqtG6Tj
	V8L3QnabBWhHpcu1ZIbVOm+z8Ur/Cz5U3AK8oiRFue5T9/ewmjqGrx6G4FDGGoLAtnPfdsL1Zxs
	tts4DgVMeEr93nsoFuElBLcsnwNZk/GY2I2SGAQHo3wcd0qHpf6AvWnfPoOJP5r2Gvx9oKYYALX
	po+bptOGQlfjiygp0j9wqMhTQI6vSScxEL2hcBX/GzOL5Lmqz3MNv6COl+1bfFyz/XdlMPgBAd7
	s8O8TJporKAa4jJAQwKAqNGxW1VXZ/0K5REM=
X-Received: by 2002:a17:90b:1a8f:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39e1e42497cmr8260218a91.16.1789585142329;
        Wed, 16 Sep 2026 11:59:02 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8f:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39e1e42497cmr8260135a91.16.1789585141688;
        Wed, 16 Sep 2026 11:59:01 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm11790987eec.2.2026.09.16.11.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:59:01 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de
Subject: [PATCH] misc: fastrpc: Add cache maintenance for non-coherent platforms
Date: Thu, 17 Sep 2026 00:28:50 +0530
Message-Id: <20260916185850.3686010-1-abhinav.parihar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI2MSBTYWx0ZWRfX1RVVNOjJd0Cs
 XgsfnnLuegAP0kbuVgYIKVLJkjk2mbt/mmJz3mFDUu/E3olj7xJEmhibj4T3nJmlXriIsv5FIof
 JPfHsTynrlGH5K7cHGR0ORAiMDLeQ438KL0teR0ukBuNQLckD/vpStrzhwgnhuseSeD0ePaB2ay
 eIT6UQ6X/M7e4tSBQjpCnhSZVgJPG/D1futJYS0qj6JiBWyTkUq6N3tH+RuEIjFZhq0aw7vTe/6
 Jmo8v3u++4reqEN02kkUJocJcvX2WSAhb7Q3DjybqfPWcRiHLdzWTGEgXPkgd8wcoJqCh8PbpbP
 u8nn4muzBUbzJkNNc1LRTr/TxWe3kP7rFAMPOm/MXdMOuZ0ue/AiesKU9/8CZphsUebhruJW/iv
 Eetecn5wM3ThMgxKTj82uZlhtAgIFl0p2YO3t4jHhjeGmM876fy11+/HPbRllIIpCcGLv04tqZV
 kLGuIof16ZSb8cEqI6Q==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aaae6f7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MU9f_CYsPQiu3DAa9dAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: WJ0soY6gplQF5n8oRfO4Z0rpCINL0_Wi
X-Proofpoint-ORIG-GUID: WJ0soY6gplQF5n8oRfO4Z0rpCINL0_Wi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI2MSBTYWx0ZWRfXyhQ+hvPkeAE3
 pBV6SM4+4AvNr7RsVQJ33vAiU8lH6fdccgHAyKG79OPmB3Km64XFSZ5mjiN2RHJnxZSC7VUxNup
 n+hHDJlozc7qtDaiA8ubFs3QkGZH4d4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160261

Some platforms using fastrpc do not support DMA coherency on
HLOS. On such systems, explicit cache maintenance is
required to ensure data consistency for RPC argument buffers.

Add cache maintenance for argument buffers when operating on
non-coherent platforms:
- Flush input buffers before invoking RPC to ensure CPU writes are
  visible to the DSP
- Invalidate output buffers after RPC completion to ensure DSP
  writes are visible to the CPU

Introduce helper functions fastrpc_flush_args() and
fastrpc_inv_args() to perform the required dma-buf cache
operations. These are invoked only when the device is not marked
as DMA coherent.

The coherency capability is determined using the "dma-coherent"
device tree property and stored per session context.

This ensures correct data synchronization on platforms lacking
DMA coherency, while avoiding unnecessary overhead on coherent
systems.

Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---

 Patch [v1]: https://lore.kernel.org/all/20260604194811.2437567-1-abhinav.parihar@oss.qualcomm.com/

 Changes in v2:
  - Fix buffer overlap handling to ensure cache maintenance is performed
    when input and output buffers overlap and the overlap calculation
    suppresses the buffer's mstart/mend range.
  - Add a do_cmo flag to track buffers that require cache maintenance
    even when their overlap range is clipped.
  - Invalidate output buffers before sending the RPC request, preventing
    stale CPU cache lines from being written back while the DSP updates
    the buffers.
  - Use DMA_FROM_DEVICE consistently for both begin_cpu_access() and
    end_cpu_access() when invalidating output buffers.

 drivers/misc/fastrpc.c | 77 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d4fac2caca86..83d04b9d2ea0 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -217,6 +217,7 @@ struct fastrpc_buf_overlap {
 	u64 mstart;
 	u64 mend;
 	u64 offset;
+	bool do_cmo;
 };
 
 struct fastrpc_buf {
@@ -292,6 +293,7 @@ struct fastrpc_session_ctx {
 	int sid;
 	bool used;
 	bool valid;
+	bool coherent;
 };
 
 struct fastrpc_soc_data {
@@ -655,7 +657,9 @@ static int olaps_cmp(const void *a, const void *b)
 static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
 {
 	u64 max_end = 0;
+	int max_raix = -1;
 	int i;
+	int inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
 
 	for (i = 0; i < ctx->nbufs; ++i) {
 		ctx->olaps[i].start = ctx->args[i].ptr;
@@ -675,6 +679,9 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
 			if (ctx->olaps[i].end > max_end) {
 				max_end = ctx->olaps[i].end;
 			} else {
+				if ((max_raix < inbufs && ctx->olaps[i].raix + 1 > inbufs) ||
+					(ctx->olaps[i].raix < inbufs && max_raix + 1 > inbufs))
+					ctx->olaps[i].do_cmo = true;
 				ctx->olaps[i].mend = 0;
 				ctx->olaps[i].mstart = 0;
 			}
@@ -684,6 +691,7 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
 			ctx->olaps[i].mstart = ctx->olaps[i].start;
 			ctx->olaps[i].offset = 0;
 			max_end = ctx->olaps[i].end;
+			max_raix = ctx->olaps[i].raix;
 		}
 	}
 }
@@ -703,6 +711,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 
 	INIT_LIST_HEAD(&ctx->node);
 	ctx->fl = user;
+	ctx->sc = sc;
 	ctx->nscalars = REMOTE_SCALARS_LENGTH(sc);
 	ctx->nbufs = REMOTE_SCALARS_INBUFS(sc) +
 		     REMOTE_SCALARS_OUTBUFS(sc);
@@ -728,7 +737,6 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	/* Take a reference to user, released in fastrpc_context_free() */
 	fastrpc_user_get(user);
 
-	ctx->sc = sc;
 	ctx->retval = -1;
 	ctx->pid = current->pid;
 	ctx->client_id = user->client_id;
@@ -1067,6 +1075,64 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
 	return 0;
 }
 
+static void fastrpc_flush_args(struct fastrpc_invoke_ctx *ctx)
+{
+	union fastrpc_remote_arg *rpra = ctx->rpra;
+	int i, inbufs, outbufs;
+
+	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
+	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
+
+	for (i = 0; i < inbufs + outbufs; ++i) {
+		int raix = ctx->olaps[i].raix;
+		struct fastrpc_map *map = ctx->maps[raix];
+
+		if (raix + 1 > inbufs)
+			continue;
+		if (!map || !map->buf)
+			continue;
+
+		if (rpra[raix].buf.len && (ctx->olaps[i].mstart || ctx->olaps[i].do_cmo)) {
+			dma_buf_begin_cpu_access(map->buf, DMA_TO_DEVICE);
+			dma_buf_end_cpu_access(map->buf, DMA_TO_DEVICE);
+		}
+	}
+}
+
+static void fastrpc_inv_args(struct fastrpc_invoke_ctx *ctx)
+{
+	union fastrpc_remote_arg *rpra = ctx->rpra;
+	int i, inbufs, outbufs;
+
+	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
+	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
+
+	for (i = 0; i < inbufs + outbufs; ++i) {
+		int raix = ctx->olaps[i].raix;
+		struct fastrpc_map *map = ctx->maps[raix];
+
+		if (raix + 1 <= inbufs)
+			continue;
+		if (!rpra[raix].buf.len)
+			continue;
+		if (!map || !map->buf)
+			continue;
+
+		/*
+		 * Skip invalidation if the argument overlaps with the
+		 * RPC control header page.
+		 */
+		if (((uintptr_t)rpra & PAGE_MASK) ==
+			((uintptr_t)rpra[raix].buf.pv & PAGE_MASK))
+			continue;
+
+		if (ctx->olaps[i].mstart || ctx->olaps[i].do_cmo) {
+			dma_buf_begin_cpu_access(map->buf, DMA_FROM_DEVICE);
+			dma_buf_end_cpu_access(map->buf, DMA_FROM_DEVICE);
+		}
+	}
+}
+
 static struct fastrpc_invoke_buf *fastrpc_invoke_buf_start(union fastrpc_remote_arg *pra, int len)
 {
 	return (struct fastrpc_invoke_buf *)(&pra[len]);
@@ -1191,6 +1257,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 		}
 	}
 
+	if (!ctx->fl->sctx->coherent)
+		fastrpc_flush_args(ctx);
+
 	for (i = ctx->nbufs; i < ctx->nscalars; ++i) {
 		list[i].num = ctx->args[i].length ? 1 : 0;
 		list[i].pgidx = i;
@@ -1376,6 +1445,8 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (err)
 		goto bail;
 
+	if (!fl->sctx->coherent)
+		fastrpc_inv_args(ctx);
 	/* make sure that all CPU memory writes are seen by DSP */
 	dma_wmb();
 	/* Send invoke buffer to remote dsp */
@@ -1396,6 +1467,9 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 
 	/* make sure that all memory writes by DSP are seen by CPU */
 	dma_rmb();
+	if (!fl->sctx->coherent)
+		fastrpc_inv_args(ctx);
+
 	/* populate all the output buffers with results */
 	err = fastrpc_put_args(ctx, kernel);
 	if (err)
@@ -2393,6 +2467,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
+	sess->coherent = of_property_read_bool(dev->of_node, "dma-coherent");
 	dev_set_drvdata(dev, sess);
 	sess->sid = sid;
 
-- 
2.34.1

