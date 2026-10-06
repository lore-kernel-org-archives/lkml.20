Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FAA39F16B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326576; cv=none; b=qdTd1XAB6Juv9R9r6EOe3cDmF2mSsv6WFYeE8/RTRs/Kjw/7vsx0b9QKMU1149xAV18Xg85nKgBN2VBYCAFaBZ6uAj668RTpWD+7xlf82qz93+xqTllXVctFCxy7TXmT7IdJF/qhsXNMvnDxTw2RRJ+65cAXJ+u4TFiXBHlefBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326576; c=relaxed/simple;
	bh=vM0EwhbARsu2KYt3Br6pX+ijG+DEketIDBsRYlzlhE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DClW/TDtLEyx+Q8jSUaHMdj8GhmGW1uGrfdq+f3DClbFRAiWNDLHElniP8Pmne5Aondu2ze2mVefdTut/2u2CnSoBk/NRFzPLMy2Y+7rb72QUuF33vQlNhZ1oqIOZOgQPEoppd+ULSwUb/eMuF07XAKzcDec8vwg4H+QUqlXjWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwAAUjRt reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwAAUjRt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeOI42049194
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V7aQkaIwwMO
	nBDWn2MdMRVdz4QUOz9HQ2TkkLsW+DyE=; b=NwAAUjRtRuf7KOoPufdm9XDe3IT
	GMaCvKWE1jOPw20mdKzLDLjWTeEYOsgK+kkF55naCpJU+Rvi/a0/pax+Yc1d6TE4
	V12ZqLMtW5jM5PiOlHUTBsRVb85lE9C3aLf4HUDq7SSoaV3o+FPQ774AD72vUo0Q
	VSHA27hgF1rtQ5iRDkF7hQoTViMdJoqfc9U4kVLel7F72IXO70+1VkJFMSAKQcy5
	ufhApaX9nvc1LleTXUo19S7RzBGP0rZoTU7iLHS6WEqHRqdNHUDVpmbmME75kelW
	K3QqjfFhNmO18MydGWu1Qq3IIY3eekK7Opx2zeQzkf79XFAhl+pK7w+HaNw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54621h0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:40:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91977cdfdf6so35667666d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326457; x=1791931257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V7aQkaIwwMOnBDWn2MdMRVdz4QUOz9HQ2TkkLsW+DyE=;
        b=pYTyCfKgMa1Ip/jyzuFKJT/sQqA1qTjNpzCDDczqxxIiGLpV7ebPu16e7t+YdoNmGC
         EkHeLBYKRGcmJD2XOKUpwJ/UAjufK20RJwJYlyXSUxKvJCxEU3maT1ppBM4J4dysNvAJ
         Pdqk1lsl7OmALy0iiKda2ZsXHPR8mdLLa4lrpvB9e2UGOOybW0+w11SgKEoCwEAr9Q7T
         bTBd5WEWWQiVhgT9xcAJF0eikf1xmoaINvMBlmqCQCftxqWvZAe4uMJ/1ZzohOeXwL2q
         4shGrnm7NW0PAphtqw/MEyJYHoxLtoT5N309YAmhtWob/pR1LibpN5j5J17TpshFenHY
         LpQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK0pWnmdLxwYc5PDi40CzMsiLJsSXtO2GnuksNTTB5QmKu05imPg3Hk0/UT2qh5eFMPgYjfKHcVJXw+KM=@vger.kernel.org
X-Gm-Message-State: AFuF++mjvQ1gnz2i9MKW3pw/ZmGRvvDHo/cZJoewUFQQKNy9PIZG39lj
	GGrM/h/F44P3f6ERKcX4IEzqwOq5N6v8rz8yeODMDtH8HcQI4knttKp1IJKBpBFB0XKoe2s5Uv5
	trCuV/VfJdlunI2E710qGpUX1Brr1niNu1V4YlvxaU0Juv7BY7ma4r504GBjSTxK8KkM=
X-Gm-Gg: AYBFou2p20qvwePIMa+Dfr1KBfvhk29VxElobkOICssfUOPKUff/xn6JaNHUq120dti
	oR0zeDtL1ONLCC7hb1Up8NH667E6l7CJRC/zDS7Izq1T8JPZwzjrT/aDyswJw0wC3oflCfS2zjW
	XV8AaoTOSUXC21VRltHaqNBFl/noysyD2dx+A4EwksTwdETqD6e4IYyI2of3D0K8L87aSyR8ZNh
	EbDOrDwVjmibNEkipn32IlE6EVg2ji+yvLndSifYIkUjebbrIRtiKQZElUXwn7+SdFpDdVKBGG4
	SElSwk7A3hH+5FtnH/iueVsum+wLfxqE+NgsjdwD1RMt9aP2O1e00jM8e8Y=
X-Received: by 2002:a05:620a:800e:b0:93e:9809:3372 with SMTP id af79cd13be357-93e9b87c0f7mr66567585a.83.1791326456628;
        Tue, 06 Oct 2026 15:40:56 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:93e:9809:3372 with SMTP id af79cd13be357-93e9b87c0f7mr66558685a.83.1791326455775;
        Tue, 06 Oct 2026 15:40:55 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:54 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 17/45] media: qcom: camss: add common IFE subdevice core
Date: Wed,  7 Oct 2026 01:39:25 +0300
Message-Id: <20261006223953.3382273-18-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7CjRc26txIn1w8mriQtKjDv5zDrSHE-p
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac578fa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=s0U3kRtrIjIIz645ZGwA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXzaMjd6ACGduF
 9G5emjrdJ7EbSX8mKI0wRJ9yXt80bPbwWqjt0CNLQa/Dy+vNbNSZPOlnW+Li6MJ1pi0kCVNVH2B
 zyH8b7Swz97RZObDZfLZF3cemJbtE9o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX15+oG4djm4MO
 CwGO3309+DI1PrBsRZuPt2Jg3phvMSP5sJaZtEPNHBkN34lwANMI5LMxHNuuovZfeKt8fBvx9Bs
 WN7u5LOqgRl0p8bVM81N9O3iAMWOcKFUlj02ZzGI3xT9jagoAot881bJol6O1eQ9E8U66E8fyhl
 ngJg+2rNKci82u5qf/HGOLHF9a+qRwRQ+hwvYBzBS9zGZSXo8dTxQCvmm7nzRwwgwwV45eA5xsg
 I0jMxgruO2xKRiTy0317/fhle/sf9gckSJxczkJS3g8AXeb5d5QWb9zQA6WXbg2zxCRnMIsDLO5
 l1vHa1bAC9Nyh3Wjo8y+WU676IoSvR4prpVKYBIyVOV1mPUZQlCJSgWfMLeHicHeW3oszwfMfaD
 zwTvohwCuSWS49c90dZDWYCAKqqQbFYIj2lwn3bAsrsxOARXjlAlGl8cPeRy1Zq8EU7Qy7FYRtV
 aHPYS3sw4KvfFZE/s5A==
X-Proofpoint-ORIG-GUID: 7CjRc26txIn1w8mriQtKjDv5zDrSHE-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the common IFE subdevice core. It manages routed streams and
formats. It also handles buffers, hardware pipelines, and media
entities.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |    1 +
 drivers/media/platform/qcom/camss/camss-ife.c | 1617 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   46 +
 3 files changed, 1664 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 547da75b24b4..057c171e08b9 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -14,6 +14,7 @@ qcom-camss-objs += \
 		camss-csiphy-2ph-1-0.o \
 		camss-csiphy-3ph-1-0.o \
 		camss-format.o \
+		camss-ife.o \
 		camss-ife-bus-v20x.o \
 		camss-ife-camif-v10x.o \
 		camss-ife-lite-top-v10x.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
new file mode 100644
index 000000000000..cf1474e5bce4
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -0,0 +1,1617 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/align.h>
+#include <linux/minmax.h>
+#include <linux/pm_runtime.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-event.h>
+
+#include "camss.h"
+#include "camss-csid.h"
+#include "camss-ife.h"
+
+#define CAMSS_IFE_PREFIX "ife"
+#define CAMSS_IFE_IRQ_NAME "msm_vfe"
+
+#define IFE_IMAGE_SINK_PAD	0
+#define IFE_FIRST_SOURCE_PAD	1
+
+static bool is_rdi_hw_pipe(enum camss_ife_hw_pipe pipe)
+{
+	return pipe == CAMSS_IFE_HW_PIPE_RDI0 ||
+	       pipe == CAMSS_IFE_HW_PIPE_RDI1 ||
+	       pipe == CAMSS_IFE_HW_PIPE_RDI2 ||
+	       pipe == CAMSS_IFE_HW_PIPE_RDI3;
+}
+
+static bool is_pix_hw_pipe(enum camss_ife_hw_pipe pipe)
+{
+	return pipe == CAMSS_IFE_HW_PIPE_PP;
+}
+
+u32 camss_ife_stream_id_for_pipe(int nstreams,
+				 const struct camss_ife_stream *streams,
+				 enum camss_ife_hw_pipe hw_pipe)
+{
+	int i;
+
+	for (i = 0; i < nstreams; i++) {
+		if (streams[i].pipe == hw_pipe)
+			return streams[i].id;
+	}
+
+	return 0;
+}
+
+enum camss_ife_hw_pipe
+camss_ife_pipe_for_stream_id(int nstreams,
+			     const struct camss_ife_stream *streams,
+			     u32 id)
+{
+	int i;
+
+	for (i = 0; i < nstreams; i++) {
+		if (streams[i].id == id)
+			return streams[i].pipe;
+	}
+
+	return CAMSS_IFE_HW_PIPE_INVALID;
+}
+
+static bool is_stats_type(const struct ife_pad_desc *pad)
+{
+	return pad->buf_type == V4L2_BUF_TYPE_META_CAPTURE;
+}
+
+static bool is_meta_type(const struct ife_pad_desc *pad)
+{
+	return is_stats_type(pad);
+}
+
+static void ife_pp_notify_sof_event(struct ife_device *ife, u32 seq_number)
+{
+	struct v4l2_event event = {0};
+
+	event.type = V4L2_EVENT_FRAME_SYNC;
+	event.u.frame_sync.frame_sequence = seq_number;
+
+	v4l2_subdev_notify_event(&ife->sd, &event);
+}
+
+static int ife_event_subscribe(struct v4l2_subdev *sd, struct v4l2_fh *fh,
+			       struct v4l2_event_subscription *sub)
+{
+	if (sub->type != V4L2_EVENT_FRAME_SYNC)
+		return -EINVAL;
+
+	/* V4L2_EVENT_FRAME_SYNC doesn't require an id, so zero should be set */
+	if (sub->id != 0)
+		return -EINVAL;
+
+	return v4l2_event_subscribe(fh, sub, 0, NULL);
+}
+
+static inline bool is_ife_hw_wm_fifo_full(struct ife_video_pad *vid_pad)
+{
+	const struct ife_pad_desc *dsc = vid_pad->ife->pads[vid_pad->pad_index].desc;
+	const struct ife_hw_buswr_ops *buswr_ops = vid_pad->ife->res->buswr_ops;
+
+	return buswr_ops->is_fifo_full(&vid_pad->ife->buswr_ctx, dsc->wm[0]);
+}
+
+static struct camss_buffer *__ife_hw_wm_dqbuf(struct ife_video_pad *vid_pad)
+{
+	struct camss_buffer *buf;
+
+	lockdep_assert_held(&vid_pad->ife->bufs_lock);
+
+	if (list_empty(&vid_pad->processing_bufs))
+		return NULL;
+
+	/* Add check with last processing buffer in WM */
+	buf = list_first_entry(&vid_pad->processing_bufs, struct camss_buffer,
+			       queue);
+	list_del(&buf->queue);
+
+	return buf;
+}
+
+static void __ife_hw_wm_qbuf(struct ife_video_pad *vid_pad,
+			     struct camss_buffer *buf)
+{
+	const struct ife_pad_desc *dsc = vid_pad->ife->pads[vid_pad->pad_index].desc;
+	const struct ife_hw_buswr_ops *buswr_ops = vid_pad->ife->res->buswr_ops;
+
+	lockdep_assert_held(&vid_pad->ife->bufs_lock);
+
+	buswr_ops->queue_buf(&vid_pad->ife->buswr_ctx, dsc->num_wms, dsc->wm, buf->addr);
+	INIT_LIST_HEAD(&buf->queue);
+	list_add_tail(&buf->queue, &vid_pad->processing_bufs);
+}
+
+static bool __ife_hw_wm_queue_next_pending_buf(struct ife_video_pad *vid_pad)
+{
+	struct camss_buffer *buf;
+
+	lockdep_assert_held(&vid_pad->ife->bufs_lock);
+
+	if (!list_empty(&vid_pad->pending_bufs) && !is_ife_hw_wm_fifo_full(vid_pad)) {
+		buf = list_first_entry(&vid_pad->pending_bufs,
+				       struct camss_buffer, queue);
+		list_del(&buf->queue);
+
+		__ife_hw_wm_qbuf(vid_pad, buf);
+
+		return true;
+	}
+
+	return false;
+}
+
+static bool __ife_hw_wm_queue_all_pending_bufs(struct ife_video_pad *vid_pad)
+{
+	bool buffers_queued = false;
+	bool next_buf_queued;
+
+	lockdep_assert_held(&vid_pad->ife->bufs_lock);
+
+	for ( ;; ) {
+		next_buf_queued = __ife_hw_wm_queue_next_pending_buf(vid_pad);
+		buffers_queued |= next_buf_queued;
+		if (!next_buf_queued || is_ife_hw_wm_fifo_full(vid_pad))
+			break;
+	}
+
+	return buffers_queued;
+}
+
+static void ife_hw_wm_queue_all_pending_bufs(struct ife_video_pad *vid_pad)
+{
+	struct ife_device *ife = vid_pad->ife;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ife->bufs_lock, flags);
+	__ife_hw_wm_queue_all_pending_bufs(vid_pad);
+	spin_unlock_irqrestore(&ife->bufs_lock, flags);
+}
+
+static void ife_hw_reg_update(struct ife_video_pad *vid_pad)
+{
+	const struct ife_pad_desc *dsc = vid_pad->ife->pads[vid_pad->pad_index].desc;
+	const struct ife_hw_top_ops *top_ops = vid_pad->ife->res->top_ops;
+	struct ife_top_ctx *top_ctx = &vid_pad->ife->top_ctx;
+
+	top_ops->reg_update(top_ctx, dsc);
+}
+
+static void ife_hw_wm_add_pending_buf(struct ife_video_pad *vid_pad,
+				      struct camss_buffer *buf)
+{
+	struct ife_device *ife = vid_pad->ife;
+	bool buffers_queued = false;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ife->bufs_lock, flags);
+	INIT_LIST_HEAD(&buf->queue);
+	list_add_tail(&buf->queue, &vid_pad->pending_bufs);
+	if (vid_pad->streaming)
+		buffers_queued = __ife_hw_wm_queue_all_pending_bufs(vid_pad);
+	if (buffers_queued)
+		ife_hw_reg_update(vid_pad);
+	spin_unlock_irqrestore(&ife->bufs_lock, flags);
+}
+
+static void ife_hw_wm_flush_bufs(struct ife_video_pad *vid_pad,
+				 enum vb2_buffer_state state)
+{
+	struct ife_device *ife = vid_pad->ife;
+	struct camss_buffer *buf;
+	struct camss_buffer *tmp;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ife->bufs_lock, flags);
+
+	list_for_each_entry_safe(buf, tmp, &vid_pad->processing_bufs, queue) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->queue);
+	}
+
+	list_for_each_entry_safe(buf, tmp, &vid_pad->pending_bufs, queue) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->queue);
+	}
+
+	spin_unlock_irqrestore(&ife->bufs_lock, flags);
+}
+
+static void ife_hw_isr_reg_update(struct ife_video_pad *vid_pad)
+{
+	if (__ife_hw_wm_queue_all_pending_bufs(vid_pad))
+		ife_hw_reg_update(vid_pad);
+}
+
+static void ife_hw_isr_wm_done(struct ife_device *ife, struct ife_video_pad *vid_pad)
+{
+	const struct ife_pad_desc *dsc = vid_pad->ife->pads[vid_pad->pad_index].desc;
+	u32 done_addr = ife->res->buswr_ops->consumed_addr(&ife->buswr_ctx, dsc->wm[0]);
+	struct camss_buffer *buf;
+	dma_addr_t buf_addr;
+
+	do {
+		buf = __ife_hw_wm_dqbuf(vid_pad);
+		if (!buf) {
+			dev_err_ratelimited(ife->camss->dev,
+					    "Ouch wm done without buffer! on video %s",
+					    dsc->video_name);
+			break;
+		}
+
+		buf_addr = buf->addr[0];
+
+		if (buf_addr == done_addr)
+			buf->vb.sequence = ife->camif_data[dsc->hw_pipe].next_seq - 1;
+		else
+			dev_err_ratelimited(ife->camss->dev,
+					    "Stall buffer found! %s  %x  %x  wm %d",
+					    dsc->video_name,
+					    (u32)buf_addr, done_addr, dsc->wm[0]);
+
+		buf->vb.vb2_buf.timestamp = ktime_get_ns();
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	} while (buf_addr != done_addr);
+
+	if (__ife_hw_wm_queue_next_pending_buf(vid_pad))
+		ife_hw_reg_update(vid_pad);
+}
+
+static void ife_hw_isr_buswr(struct ife_device *ife, u32 bus_status)
+{
+	unsigned long flags;
+	int i;
+
+	spin_lock_irqsave(&ife->bufs_lock, flags);
+
+	for (i = 0; i < ife->npads; i++) {
+		if (ife->pads[i].vid_pad && ife->pads[i].vid_pad->streaming) {
+			const struct ife_pad_desc *dsc = ife->pads[i].desc;
+			struct ife_video_pad *vpad = ife->pads[i].vid_pad;
+
+			if (bus_status & dsc->rup_group_mask)
+				ife_hw_isr_reg_update(vpad);
+
+			if (bus_status & dsc->comp_group_mask)
+				ife_hw_isr_wm_done(ife, vpad);
+		}
+	}
+
+	spin_unlock_irqrestore(&ife->bufs_lock, flags);
+}
+
+static irqreturn_t ife_hw_top_isr(int irq, void *dev)
+{
+	u32 status[IFE_TOP_STATUS_MAX] = {0};
+	struct ife_device *ife = dev;
+
+	ife->res->top_ops->irq_status(&ife->top_ctx, status);
+	if (status[IFE_TOP_STATUS_ID0] & IFE_HW_TOP_IRQ0_RST_DONE) {
+		complete(&ife->reset_complete);
+		return IRQ_HANDLED;
+	}
+
+	/* Handle first SOF, EPOCH and at the end bus IRQ's */
+	if (status[IFE_TOP_STATUS_ID1] & IFE_HW_TOP_IRQ1_RDI0_SOF)
+		ife->camif_data[CAMSS_IFE_HW_PIPE_RDI0].next_seq++;
+
+	if (status[IFE_TOP_STATUS_ID1] & IFE_HW_TOP_IRQ1_RDI1_SOF)
+		ife->camif_data[CAMSS_IFE_HW_PIPE_RDI1].next_seq++;
+
+	if (status[IFE_TOP_STATUS_ID1] & IFE_HW_TOP_IRQ1_RDI2_SOF)
+		ife->camif_data[CAMSS_IFE_HW_PIPE_RDI2].next_seq++;
+
+	if (status[IFE_TOP_STATUS_ID1] & IFE_HW_TOP_IRQ1_RDI3_SOF)
+		ife->camif_data[CAMSS_IFE_HW_PIPE_RDI3].next_seq++;
+
+	if (status[IFE_TOP_STATUS_ID1] & IFE_HW_TOP_IRQ1_PP_SOF) {
+		ife_pp_notify_sof_event(ife, ife->camif_data[CAMSS_IFE_HW_PIPE_PP].next_seq);
+		ife->camif_data[CAMSS_IFE_HW_PIPE_PP].next_seq++;
+	}
+
+	if (status[IFE_TOP_STATUS_ID0] & IFE_HW_TOP_IRQ0_BUSWR) {
+		u32 bus_status = ife->res->buswr_ops->irq_status(&ife->buswr_ctx);
+
+		ife_hw_isr_buswr(ife, bus_status);
+	}
+
+	if (status[IFE_TOP_STATUS_ID2]) {
+		dev_err_ratelimited(ife->camss->dev,
+				    "Violation on ife%d status 0x%x", ife->id,
+				    status[IFE_TOP_STATUS_ID2]);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void ife_del_pm_domain_link(struct ife_device *ife)
+{
+	struct camss *camss = ife->camss;
+
+	if (!camss->ife_genpd_link || ife->id >= camss->res->ife_num ||
+	    ife->id >= camss->genpd_num)
+		return;
+
+	device_link_del(camss->ife_genpd_link[ife->id]);
+}
+
+static int ife_add_pm_domain_link(struct ife_device *ife)
+{
+	struct camss *camss = ife->camss;
+
+	if (!camss->ife_genpd || ife->id >= camss->res->ife_num ||
+	    ife->id >= camss->genpd_num)
+		return 0;
+
+	camss->ife_genpd_link[ife->id] =
+		device_link_add(camss->dev, camss->ife_genpd[ife->id],
+				DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
+				DL_FLAG_RPM_ACTIVE);
+	if (!camss->ife_genpd_link[ife->id])
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ife_set_clock_rates(struct ife_device *ife)
+{
+	struct camss *camss = ife->camss;
+	int ret, i;
+
+	for (i = 0; i < ife->nclocks; i++) {
+		struct camss_clock *clock = &ife->clock[i];
+		long round_rate;
+		u8 freq_idx;
+
+		if (!clock->nfreqs)
+			continue;
+
+		freq_idx = min_t(u8, camss->perf_mode, clock->nfreqs - 1);
+		round_rate = clk_round_rate(clock->clk, clock->freq[freq_idx]);
+		if (round_rate < 0) {
+			dev_err(camss->dev, "Clock round rate failed: %ld\n", round_rate);
+			return -EINVAL;
+		}
+
+		ret = clk_set_rate(clock->clk, round_rate);
+		if (ret < 0) {
+			dev_err(camss->dev, "Clock set rate failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int ife_clr_clock_rates(struct ife_device *ife)
+{
+	struct camss *camss = ife->camss;
+	int ret, i;
+
+	for (i = 0; i < ife->nclocks; i++) {
+		struct camss_clock *clock = &ife->clock[i];
+
+		if (!clock->nfreqs)
+			continue;
+
+		ret = clk_set_rate(clock->clk, clock->freq[0]);
+		if (ret < 0) {
+			dev_err(camss->dev, "Clock set rate failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+int ife_get(struct ife_device *ife)
+{
+	int ret;
+
+	ret = ife->camss->core_get(ife->camss, ife->id);
+	if (ret)
+		return ret;
+
+	ret = ife_set_clock_rates(ife);
+	if (ret)
+		return ret;
+
+	return camss_enable_clocks(ife->nclocks, ife->clock, ife->camss->dev);
+}
+
+void ife_put(struct ife_device *ife)
+{
+	camss_disable_clocks(ife->nclocks, ife->clock);
+	ife->camss->core_put(ife->camss);
+}
+
+static int ife_core_s_power(struct v4l2_subdev *sd, int on)
+{
+	struct ife_device *ife = v4l2_get_subdevdata(sd);
+	int ret;
+
+	if (on) {
+		ret = ife_get(ife);
+		if (ret < 0)
+			return ret;
+	} else {
+		ife_put(ife);
+		ife_clr_clock_rates(ife);
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops ife_core_ops = {
+	.s_power = ife_core_s_power,
+	.subscribe_event = ife_event_subscribe,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static int ife_setup_vid_full(struct ife_video_pad *vid_pad,
+			      struct v4l2_pix_format_mplane *pix_mp,
+			      struct camss_ife_wm_config *wm_cfg)
+{
+	const struct ife_pad_desc *dsc = vid_pad->ife->pads[vid_pad->pad_index].desc;
+	const struct v4l2_format_info *info = v4l2_format_info(pix_mp->pixelformat);
+	u8 depth = 0;
+	int ret;
+
+	wm_cfg[Y_PLANE].mode_config = dsc->mode_config;
+	wm_cfg[Y_PLANE].packing_fmt = dsc->packing_fmt;
+	wm_cfg[C_PLANE].mode_config = dsc->mode_config;
+	wm_cfg[C_PLANE].packing_fmt = dsc->packing_fmt;
+
+	ret = camss_get_pixfmt_depth(pix_mp->pixelformat, Y_PLANE, &depth);
+	if (ret)
+		return ret;
+
+	wm_cfg[Y_PLANE].width	= pix_mp->width;
+	wm_cfg[Y_PLANE].height	= pix_mp->height;
+	wm_cfg[Y_PLANE].bytes	= wm_cfg[Y_PLANE].width * depth / BITS_PER_BYTE;
+	wm_cfg[Y_PLANE].stride	= pix_mp->plane_fmt[Y_PLANE].bytesperline;
+	wm_cfg[Y_PLANE].lines	= pix_mp->height;
+
+	ret = camss_get_pixfmt_depth(pix_mp->pixelformat, C_PLANE, &depth);
+	if (ret)
+		return ret;
+
+	wm_cfg[C_PLANE].width	= pix_mp->width / info->hdiv;
+	wm_cfg[C_PLANE].bytes	= wm_cfg[C_PLANE].width * depth / BITS_PER_BYTE;
+	wm_cfg[C_PLANE].stride	= pix_mp->plane_fmt[Y_PLANE].bytesperline;
+	wm_cfg[C_PLANE].height	= pix_mp->height  / info->vdiv;
+	wm_cfg[C_PLANE].lines	= wm_cfg[C_PLANE].height;
+
+	return 0;
+}
+
+static void ife_setup_vid_rdi(struct ife_video_pad *vid_pad,
+			      const struct camss_ife_pipeline_cfg *pipeline_cfg,
+			      struct camss_ife_wm_config *wm_cfg)
+{
+	const struct ife_pad_desc *dsc = vid_pad->ife->pads[vid_pad->pad_index].desc;
+
+	wm_cfg[Y_PLANE].mode_config	= dsc->mode_config;
+	wm_cfg[Y_PLANE].packing_fmt	= dsc->packing_fmt;
+	wm_cfg[Y_PLANE].width		= pipeline_cfg->in_width;
+	wm_cfg[Y_PLANE].height		= pipeline_cfg->in_height;
+}
+
+static int ife_vid_pad_enable(struct ife_video_pad *vid_pad,
+			      const struct camss_ife_wm_config *wm_cfg,
+			      bool *first_ife_output)
+{
+	struct ife_device *ife = vid_pad->ife;
+	bool streaming_started = false;
+	int i;
+
+	mutex_lock(&ife->state_mutex);
+
+	if (!vid_pad->streaming) {
+		const struct ife_pad_desc *dsc = vid_pad->ife->pads[vid_pad->pad_index].desc;
+		const struct ife_hw_buswr_ops *buswr_ops = ife->res->buswr_ops;
+
+		for (i = 0; i < dsc->num_wms; i++) {
+			buswr_ops->wm_config(&ife->buswr_ctx, dsc->wm[i], &wm_cfg[i]);
+			buswr_ops->wm_enable(&ife->buswr_ctx, dsc->wm[i]);
+		}
+
+		/* Enqueue all the buffers for processing on pending queue */
+		vid_pad->streaming = true;
+		ife->stream_count++;
+		*first_ife_output = ife->stream_count == 1;
+		streaming_started = true;
+	}
+
+	mutex_unlock(&ife->state_mutex);
+
+	if (streaming_started)
+		ife_hw_wm_queue_all_pending_bufs(vid_pad);
+
+	return 0;
+};
+
+static bool ife_vid_pad_disable(struct ife_video_pad *vid_pad,
+				bool *last_ife_output)
+{
+	struct ife_device *ife = vid_pad->ife;
+	bool output_stopped = false;
+	int i;
+
+	mutex_lock(&ife->state_mutex);
+
+	if (vid_pad->streaming) {
+		const struct ife_pad_desc *dsc = vid_pad->ife->pads[vid_pad->pad_index].desc;
+		const struct ife_hw_buswr_ops *buswr_ops = ife->res->buswr_ops;
+
+		for (i = 0; i < dsc->num_wms; i++)
+			buswr_ops->wm_disable(&ife->buswr_ctx, dsc->wm[i]);
+		/* Enqueue all the buffers for processing on pending queue */
+		vid_pad->streaming = false;
+		if (ife->stream_count)
+			ife->stream_count--;
+		*last_ife_output = !ife->stream_count;
+		output_stopped = true;
+	}
+
+	mutex_unlock(&ife->state_mutex);
+
+	return output_stopped;
+};
+
+static bool ife_hw_pipe_get(struct ife_device *ife, enum camss_ife_hw_pipe hw_pipe)
+{
+	bool first_output;
+
+	mutex_lock(&ife->state_mutex);
+	first_output = !ife->camif_data[hw_pipe].stream_count++;
+	mutex_unlock(&ife->state_mutex);
+
+	return first_output;
+}
+
+static bool ife_hw_pipe_put(struct ife_device *ife, enum camss_ife_hw_pipe hw_pipe)
+{
+	bool last_output = false;
+
+	mutex_lock(&ife->state_mutex);
+	if (ife->camif_data[hw_pipe].stream_count) {
+		ife->camif_data[hw_pipe].stream_count--;
+		last_output = !ife->camif_data[hw_pipe].stream_count;
+	}
+	mutex_unlock(&ife->state_mutex);
+
+	return last_output;
+}
+
+static int ife_hw_pipe_enable(struct ife_device *ife, const struct ife_pad_desc *dsc,
+			      const struct camss_ife_wm_config *wm_cfg, bool *first_output)
+{
+	const struct camss_ife_pipeline_cfg *pipeline_cfg = &ife->pipeline_cfg[dsc->hw_pipe];
+	const struct ife_hw_top_ops *top_ops = ife->res->top_ops;
+	int ret;
+
+	*first_output = ife_hw_pipe_get(ife, dsc->hw_pipe);
+
+	ret = top_ops->pipe_config(&ife->top_ctx, dsc, pipeline_cfg, wm_cfg);
+	if (ret)
+		goto error_pipe_put;
+
+	if (!*first_output)
+		return 0;
+
+	if (is_pix_hw_pipe(dsc->hw_pipe) && ife->res->mod_ops) {
+		const struct camss_pp_cfg pp_cfg = {
+			.width   = pipeline_cfg->in_width,
+			.height  = pipeline_cfg->in_height,
+			.in_code = pipeline_cfg->in_code,
+		};
+
+		ife->res->mod_ops->config(&ife->pp_ctx, &pp_cfg);
+	}
+
+	ret = top_ops->pipe_enable(&ife->top_ctx, dsc);
+	if (ret)
+		goto error_pipe_put;
+
+	if (is_pix_hw_pipe(dsc->hw_pipe) && ife->res->mod_ops)
+		ife->res->mod_ops->enable(&ife->pp_ctx);
+
+	ife->camif_data[dsc->hw_pipe].next_seq = 0;
+
+	return 0;
+
+error_pipe_put:
+	ife_hw_pipe_put(ife, dsc->hw_pipe);
+	return ret;
+}
+
+static void ife_hw_pipe_disable(struct ife_device *ife, const struct ife_pad_desc *dsc)
+{
+	if (is_pix_hw_pipe(dsc->hw_pipe) && ife->res->mod_ops)
+		ife->res->mod_ops->disable(&ife->pp_ctx);
+
+	ife->res->top_ops->pipe_disable(&ife->top_ctx, dsc);
+}
+
+static int ife_output_enable(struct ife_device *ife, struct ife_subdev_pads *pad,
+			     const struct camss_ife_wm_config *wm_cfg, bool first_pipe_output)
+{
+	bool first_stream = false;
+	int ret;
+
+	ret = ife_vid_pad_enable(pad->vid_pad, wm_cfg, &first_stream);
+	if (ret)
+		return ret;
+
+	if (first_stream) {
+		ife->res->buswr_ops->irq_enable(&ife->buswr_ctx);
+		ife->res->top_ops->prepare(&ife->top_ctx);
+	}
+
+	ife_hw_reg_update(pad->vid_pad);
+	if (first_pipe_output)
+		ife->res->top_ops->enable(&ife->top_ctx, pad->desc->hw_pipe);
+
+	return 0;
+}
+
+static void ife_stream_disable(struct ife_video_pad *vid_pad)
+{
+	struct ife_device *ife = vid_pad->ife;
+	const struct ife_pad_desc *dsc = ife->pads[vid_pad->pad_index].desc;
+	bool last_stream = false;
+
+	ife_vid_pad_disable(vid_pad, &last_stream);
+	ife_hw_pipe_disable(ife, dsc);
+	ife_hw_reg_update(vid_pad);
+	ife->res->top_ops->disable(&ife->top_ctx, dsc->hw_pipe);
+	if (last_stream)
+		ife->res->buswr_ops->irq_disable(&ife->buswr_ctx);
+}
+
+static bool is_ife_vid_pad_streaming(struct ife_video_pad *vid_pad)
+{
+	struct ife_device *ife = vid_pad->ife;
+	bool is_streaming;
+
+	mutex_lock(&ife->state_mutex);
+	is_streaming = vid_pad->streaming;
+	mutex_unlock(&ife->state_mutex);
+
+	return is_streaming;
+};
+
+static int ife_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state)
+{
+	struct ife_device *ife = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev_krouting routing = { };
+	int i, ri;
+	int ret;
+
+	for (i = 0; i < ife->npads; i++) {
+		struct ife_video_pad *vpad = ife->pads[i].vid_pad;
+
+		if (vpad)
+			routing.num_routes++;
+	}
+
+	if (!routing.num_routes)
+		return 0;
+
+	routing.len_routes = routing.num_routes;
+	routing.routes = kcalloc(routing.num_routes, sizeof(*routing.routes), GFP_KERNEL);
+	if (!routing.routes)
+		return -ENOMEM;
+
+	for (i = 0, ri = 0; i < ife->npads; i++) {
+		struct ife_video_pad *vpad = ife->pads[i].vid_pad;
+		const struct ife_subdev_resources *res = ife->res;
+		struct v4l2_subdev_route *route;
+		u32 sid;
+
+		if (!vpad)
+			continue;
+
+		sid = camss_ife_stream_id_for_pipe(res->num_sink_streams, res->sink_streams,
+						   ife->pads[i].desc->hw_pipe);
+
+		route = &routing.routes[ri++];
+		route->sink_pad		= ife->sink_pad;
+		route->sink_stream	= sid;
+		route->source_pad	= vpad->pad_index;
+		route->source_stream	= 0;
+		route->flags		= V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+	}
+
+	ret = v4l2_subdev_routing_validate(sd, &routing, V4L2_SUBDEV_ROUTING_NO_N_TO_1);
+	if (ret) {
+		dev_err(ife->camss->dev, "Fail to validate ife routing %d", ret);
+		goto out;
+	}
+
+	ret = v4l2_subdev_set_routing(sd, state, &routing);
+	if (ret) {
+		dev_err(ife->camss->dev, "Fail to set routing");
+		goto out;
+	}
+
+out:
+	kfree(routing.routes);
+
+	return ret;
+};
+
+static void ife_apply_constraints(u32 in_width, u32 in_height, u32 *out_width, u32 *out_height,
+				  const struct ife_pad_limits *limits)
+{
+	*out_width = clamp(*out_width, limits->min_width, limits->max_width);
+	if (limits->max_h_ratio)
+		*out_width = max(*out_width, in_width / limits->max_h_ratio);
+
+	*out_height = clamp(*out_height, limits->min_height, limits->max_height);
+	if (limits->max_v_ratio)
+		*out_height = max(*out_height, in_height / limits->max_v_ratio);
+}
+
+static inline void ife_apply_attributes(struct v4l2_mbus_framefmt *fmt, u32 field, u32 colorspace)
+{
+	fmt->field = field;
+	fmt->colorspace = colorspace;
+	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true, fmt->colorspace, fmt->ycbcr_enc);
+	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+}
+
+static int ife_pad_try_format(struct ife_device *ife, const struct ife_pad_desc *desc,
+			      struct v4l2_mbus_framefmt *fmt)
+{
+	const struct camss_ife_pipeline_cfg *pipeline_cfg;
+	const struct camss_formats *sup_fmts = &desc->sup_fmts;
+	unsigned int i;
+	u32 in_height;
+	u32 in_width;
+
+	for (i = 0; i < sup_fmts->nformats; i++)
+		if (fmt->code == sup_fmts->formats[i].code)
+			break;
+
+	/* If not found set first format as default */
+	if (i >= sup_fmts->nformats)
+		i = 0;
+
+	fmt->code = sup_fmts->formats[i].code;
+
+	pipeline_cfg = &ife->pipeline_cfg[desc->hw_pipe];
+	in_width = desc->pad_flags & MEDIA_PAD_FL_SOURCE ? pipeline_cfg->in_width : fmt->width;
+	in_height = desc->pad_flags & MEDIA_PAD_FL_SOURCE ? pipeline_cfg->in_height : fmt->height;
+
+	ife_apply_constraints(in_width, in_height,
+			      &fmt->width, &fmt->height, desc->limits);
+
+	if (is_pix_hw_pipe(desc->hw_pipe)) {
+		const struct v4l2_format_info *info;
+		u32 min_height = desc->limits->min_height;
+		u32 min_width = desc->limits->min_width;
+
+		info = v4l2_format_info(sup_fmts->formats[i].pixelformat);
+		if (info) {
+			if (desc->limits->max_h_ratio)
+				min_width = max(min_width,
+						DIV_ROUND_UP(in_width,
+							     desc->limits->max_h_ratio));
+			if (desc->limits->max_v_ratio)
+				min_height = max(min_height,
+						 DIV_ROUND_UP(in_height,
+							      desc->limits->max_v_ratio));
+
+			min_width = roundup(min_width, info->hdiv);
+			min_height = roundup(min_height, info->vdiv);
+			fmt->width = max(round_down(fmt->width, info->hdiv), min_width);
+			fmt->height = max(round_down(fmt->height, info->vdiv), min_height);
+		}
+	}
+
+	ife_apply_attributes(fmt, V4L2_FIELD_NONE, V4L2_COLORSPACE_SRGB);
+
+	return i;
+}
+
+static int ife_pad_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+			   struct v4l2_subdev_format *sd_fmt)
+{
+	struct ife_device *ife = v4l2_get_subdevdata(sd);
+	struct ife_subdev_pads *pad;
+	enum camss_ife_hw_pipe pipe;
+
+	if (sd_fmt->pad >= ife->npads)
+		return -EINVAL;
+
+	memset(&sd_fmt->reserved, 0, sizeof(sd_fmt->reserved));
+
+	pad = &ife->pads[sd_fmt->pad];
+
+	if (sd_fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		ife_pad_try_format(ife, pad->desc, &sd_fmt->format);
+	} else {
+		ife_apply_attributes(&pad->fmt, V4L2_FIELD_NONE, V4L2_COLORSPACE_SRGB);
+		sd_fmt->format = pad->fmt;
+
+		if (sd_fmt->pad == ife->sink_pad && ife->res->num_sink_streams) {
+			pipe = camss_ife_pipe_for_stream_id(ife->res->num_sink_streams,
+							    ife->res->sink_streams,
+							     sd_fmt->stream);
+			if (pipe == CAMSS_IFE_HW_PIPE_INVALID)
+				return -EINVAL;
+
+			sd_fmt->format.code = ife->pipeline_cfg[pipe].in_code;
+			sd_fmt->format.width = ife->pipeline_cfg[pipe].in_width;
+			sd_fmt->format.height = ife->pipeline_cfg[pipe].in_height;
+		}
+	}
+
+	memset(&sd_fmt->reserved, 0, sizeof(sd_fmt->reserved));
+
+	return 0;
+}
+
+static void ife_update_src_pads_fmt(struct ife_device *ife, struct v4l2_mbus_framefmt *sink_fmt,
+				    enum camss_ife_hw_pipe pipe)
+{
+	int i;
+
+	for (i = 0; i < ife->npads; i++) {
+		struct ife_video_pad *vpad = ife->pads[i].vid_pad;
+		struct v4l2_mbus_framefmt new_fmt = *sink_fmt;
+		struct ife_subdev_pads *pad = &ife->pads[i];
+		int fi;
+
+		if (!(pad->desc->pad_flags & MEDIA_PAD_FL_SOURCE) || is_meta_type(pad->desc))
+			continue;
+
+		if (pipe != CAMSS_IFE_HW_PIPE_INVALID && pad->desc->hw_pipe != pipe)
+			continue;
+
+		fi = ife_pad_try_format(ife, pad->desc, &new_fmt);
+
+		if (vpad) {
+			struct v4l2_pix_format_mplane *pix_mp = &vpad->video.active_fmt.fmt.pix_mp;
+			const struct camss_format_info *info = &pad->desc->sup_fmts.formats[fi];
+
+			/* Update video pad V4L2 format */
+			v4l2_fill_pixfmt_mp(pix_mp, info->pixelformat, new_fmt.width,
+					    new_fmt.height);
+		}
+
+		/* Update source pad format with modified format */
+		pad->fmt = new_fmt;
+	}
+}
+
+static int ife_pad_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+			   struct v4l2_subdev_format *sd_fmt)
+{
+	struct ife_device *ife = v4l2_get_subdevdata(sd);
+	struct ife_subdev_pads *pad;
+	enum camss_ife_hw_pipe pipe;
+	unsigned int i;
+
+	if (sd_fmt->pad >= ife->npads)
+		return -EINVAL;
+
+	memset(&sd_fmt->reserved, 0, sizeof(sd_fmt->reserved));
+
+	pad = &ife->pads[sd_fmt->pad];
+
+	ife_pad_try_format(ife, pad->desc, &sd_fmt->format);
+
+	if (sd_fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		/* Update current pad format */
+		pad->fmt = sd_fmt->format;
+		/* If it is a sink pad, update the corresponding source formats. */
+		if (ife->mpads[sd_fmt->pad].flags == MEDIA_PAD_FL_SINK) {
+			if (!ife->res->num_sink_streams) {
+				for (i = 0; i < CAMSS_IFE_HW_PIPE_INVALID; i++) {
+					ife->pipeline_cfg[i].in_code = sd_fmt->format.code;
+					ife->pipeline_cfg[i].in_width = sd_fmt->format.width;
+					ife->pipeline_cfg[i].in_height = sd_fmt->format.height;
+				}
+				ife_update_src_pads_fmt(ife, &sd_fmt->format,
+							CAMSS_IFE_HW_PIPE_INVALID);
+			} else {
+				pipe = camss_ife_pipe_for_stream_id(ife->res->num_sink_streams,
+								    ife->res->sink_streams,
+								     sd_fmt->stream);
+				if (pipe == CAMSS_IFE_HW_PIPE_INVALID)
+					return -EINVAL;
+
+				ife->pipeline_cfg[pipe].in_code = sd_fmt->format.code;
+				ife->pipeline_cfg[pipe].in_width = sd_fmt->format.width;
+				ife->pipeline_cfg[pipe].in_height = sd_fmt->format.height;
+				ife_update_src_pads_fmt(ife, &sd_fmt->format, pipe);
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int ife_pad_mbus_enum_code(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ife_device *ife = v4l2_get_subdevdata(sd);
+	struct ife_subdev_pads *pad;
+
+	if (code->pad >= ife->npads)
+		return -EINVAL;
+
+	memset(&code->reserved, 0, sizeof(code->reserved));
+
+	pad = &ife->pads[code->pad];
+
+	if (pad->desc->pad_flags == MEDIA_PAD_FL_SINK ||
+	    pad->desc->hw_pipe == CAMSS_IFE_HW_PIPE_PP) {
+		if (code->index >= pad->desc->sup_fmts.nformats)
+			return -EINVAL;
+
+		code->code = pad->desc->sup_fmts.formats[code->index].code;
+	} else {
+		/*
+		 * RDI pipeline does not have capabilities for format
+		 * conversions. It always follows the sink pad format.
+		 */
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = ife->pipeline_cfg[pad->desc->hw_pipe].in_code;
+	}
+
+	return 0;
+}
+
+static int ife_pad_enum_framesizes(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct ife_device *ife = v4l2_get_subdevdata(sd);
+	struct ife_subdev_pads *pad;
+	int i;
+
+	if (fse->pad >= ife->npads)
+		return -EINVAL;
+
+	if (fse->index != 0)
+		return -EINVAL;
+
+	pad = &ife->pads[fse->pad];
+
+	for (i = 0; i < pad->desc->sup_fmts.nformats; i++) {
+		if (pad->desc->sup_fmts.formats[i].code == fse->code)
+			break;
+	}
+	if (i >= pad->desc->sup_fmts.nformats)
+		return -EINVAL;
+
+	fse->max_width	= pad->desc->limits->max_width;
+	fse->max_height	= pad->desc->limits->max_height;
+
+	if (pad->desc->pad_flags == MEDIA_PAD_FL_SINK) {
+		fse->min_width	= pad->desc->limits->min_width;
+		fse->min_height	= pad->desc->limits->min_height;
+	} else {
+		const struct camss_ife_pipeline_cfg *pipeline_cfg;
+
+		pipeline_cfg = &ife->pipeline_cfg[pad->desc->hw_pipe];
+
+		/* Ife does not support upscaling. */
+		if (pipeline_cfg->in_width < fse->max_width)
+			fse->max_width = pipeline_cfg->in_width;
+
+		if (pipeline_cfg->in_height < fse->max_height)
+			fse->max_height = pipeline_cfg->in_height;
+
+		ife_apply_constraints(fse->max_width, fse->max_height,
+				      &fse->min_width, &fse->min_height, pad->desc->limits);
+	}
+
+	return 0;
+}
+
+static int ife_output_configure(struct ife_device *ife, struct ife_subdev_pads *pad,
+				struct camss_ife_wm_config *wm_cfg)
+{
+	const struct camss_ife_pipeline_cfg *pipeline_cfg;
+
+	pipeline_cfg = &ife->pipeline_cfg[pad->desc->hw_pipe];
+	wm_cfg[Y_PLANE].wm_id = pad->desc->wm[Y_PLANE];
+	wm_cfg[C_PLANE].wm_id = pad->desc->wm[C_PLANE];
+
+	if (is_rdi_hw_pipe(pad->desc->hw_pipe)) {
+		ife_setup_vid_rdi(pad->vid_pad, pipeline_cfg, wm_cfg);
+		return 0;
+	}
+
+	if (is_pix_hw_pipe(pad->desc->hw_pipe))
+		return ife_setup_vid_full(pad->vid_pad, &pad->vid_pad->video.active_fmt.fmt.pix_mp,
+					  wm_cfg);
+
+	return 0;
+}
+
+static int ife_enable_remote_streams(struct ife_device *ife, struct v4l2_subdev_state *state,
+				     struct media_pad *remote_pad, u32 pad, u64 streams_mask)
+{
+	u64 sink_streams;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, ife->sink_pad, &streams_mask);
+
+	return v4l2_subdev_enable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
+					  remote_pad->index, sink_streams);
+}
+
+static int ife_pad_enable_streams(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				  u32 pad_index, u64 streams_mask)
+{
+	struct ife_device *ife = v4l2_get_subdevdata(sd);
+	struct camss_ife_wm_config wm_cfg[IFE_HW_PLANES] = {0};
+	struct media_pad *remote_pad;
+	struct ife_subdev_pads *pad;
+	bool first_pipe_output;
+	int ret;
+
+	if (pad_index >= ife->npads)
+		return -EINVAL;
+
+	pad = &ife->pads[pad_index];
+
+	if (ife->mpads[pad_index].flags == MEDIA_PAD_FL_SINK)
+		return -EOPNOTSUPP;
+
+	remote_pad = media_pad_remote_pad_first(&ife->mpads[ife->sink_pad]);
+	if (!remote_pad)
+		return -ENOLINK;
+
+	if (!pad->vid_pad) {
+		dev_err(ife->camss->dev, "Invalid video node for source pad[%d]\n",
+			pad_index);
+		return -EIO;
+	}
+
+	ret = ife_output_configure(ife, pad, wm_cfg);
+	if (ret)
+		return ret;
+
+	ret = ife_hw_pipe_enable(ife, pad->desc, wm_cfg, &first_pipe_output);
+	if (ret)
+		return ret;
+
+	ret = ife_output_enable(ife, pad, wm_cfg, first_pipe_output);
+	if (ret)
+		goto error_pipe_disable;
+
+	if (first_pipe_output) {
+		ret = ife_enable_remote_streams(ife, state, remote_pad, pad_index, streams_mask);
+		if (ret)
+			goto error_stream_disable;
+	}
+
+	return 0;
+
+error_stream_disable:
+	ife_stream_disable(pad->vid_pad);
+	goto error_pipe_put;
+error_pipe_disable:
+	if (first_pipe_output)
+		ife_hw_pipe_disable(ife, pad->desc);
+error_pipe_put:
+	ife_hw_pipe_put(ife, pad->desc->hw_pipe);
+	return ret;
+}
+
+static int ife_pad_disable_streams(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				   u32 pad_index, u64 streams_mask)
+{
+	struct ife_device *ife = v4l2_get_subdevdata(sd);
+	const struct ife_hw_buswr_ops *buswr_ops = ife->res->buswr_ops;
+	const struct ife_hw_top_ops *top_ops = ife->res->top_ops;
+	struct media_pad *remote_pad;
+	struct ife_subdev_pads *pad;
+	bool last_pipe_output;
+	bool last_stream = false;
+	u64 sink_streams;
+	int ret = 0;
+
+	if (pad_index >= ife->npads)
+		return -EINVAL;
+
+	pad = &ife->pads[pad_index];
+
+	if (ife->mpads[pad_index].flags == MEDIA_PAD_FL_SINK)
+		return -EOPNOTSUPP;
+
+	remote_pad = media_pad_remote_pad_first(&ife->mpads[ife->sink_pad]);
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad_index,
+						       ife->sink_pad, &streams_mask);
+
+	if (!pad->vid_pad || !ife_vid_pad_disable(pad->vid_pad, &last_stream))
+		return 0;
+
+	last_pipe_output = ife_hw_pipe_put(ife, pad->desc->hw_pipe);
+	if (last_pipe_output && remote_pad) {
+		ret = v4l2_subdev_disable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
+						  remote_pad->index, sink_streams);
+		if (ret)
+			dev_err(ife->camss->dev,
+				"Failed to disable stream on remote pad: %d\n", ret);
+	}
+
+	if (last_pipe_output) {
+		ife_hw_pipe_disable(ife, pad->desc);
+		top_ops->disable(&ife->top_ctx, pad->desc->hw_pipe);
+	}
+	if (last_stream)
+		buswr_ops->irq_disable(&ife->buswr_ctx);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops ife_pad_ops = {
+	.enum_mbus_code	 = ife_pad_mbus_enum_code,
+	.enum_frame_size = ife_pad_enum_framesizes,
+	.get_fmt	 = ife_pad_get_fmt,
+	.set_fmt	 = ife_pad_set_fmt,
+	.enable_streams	 = ife_pad_enable_streams,
+	.disable_streams = ife_pad_disable_streams,
+};
+
+static const struct v4l2_subdev_internal_ops ife_v4l2_internal_ops = {
+	.init_state = ife_init_state,
+};
+
+static const struct media_entity_operations ife_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_ops ife_v4l2_ops = {
+	.core	= &ife_core_ops,
+	.pad	= &ife_pad_ops,
+};
+
+static int ife_video_start_streaming(struct camss_video *vid,
+				     unsigned int count)
+{
+	struct media_pad *src_pad;
+
+	src_pad = media_pad_remote_pad_first(&vid->vdev.entity.pads[0]);
+	if (!src_pad || !is_media_entity_v4l2_subdev(src_pad->entity))
+		return -ENOLINK;
+
+	return v4l2_subdev_enable_streams(media_entity_to_v4l2_subdev(src_pad->entity),
+					  src_pad->index, BIT_ULL(0));
+}
+
+static void ife_video_stop_streaming(struct camss_video *vid)
+{
+	struct ife_video_pad *vid_pad =
+		container_of(vid, struct ife_video_pad, video);
+	struct media_pad *src_pad;
+	int ret;
+
+	src_pad = media_pad_remote_pad_first(&vid->vdev.entity.pads[0]);
+	if (!src_pad || !is_media_entity_v4l2_subdev(src_pad->entity))
+		return;
+
+	ret = v4l2_subdev_disable_streams(media_entity_to_v4l2_subdev(src_pad->entity),
+					  src_pad->index, BIT_ULL(0));
+	if (ret)
+		dev_err(vid_pad->ife->camss->dev,
+			"Video pipeline disable streams failed: %d\n", ret);
+}
+
+static int ife_queue_buffer(struct camss_video *vid, struct camss_buffer *buf)
+{
+	struct ife_video_pad *vid_pad =
+		container_of(vid, struct ife_video_pad, video);
+
+	ife_hw_wm_add_pending_buf(vid_pad, buf);
+
+	return 0;
+}
+
+static int ife_flush_buffers(struct camss_video *vid, enum vb2_buffer_state state)
+{
+	struct ife_video_pad *vid_pad =
+		container_of(vid, struct ife_video_pad, video);
+
+	if (is_ife_vid_pad_streaming(vid_pad))
+		return -EINVAL;
+
+	ife_hw_wm_flush_bufs(vid_pad, state);
+
+	return 0;
+}
+
+static const struct camss_video_ops camss_video_ops = {
+	.start_streaming = ife_video_start_streaming,
+	.stop_streaming	= ife_video_stop_streaming,
+	.queue_buffer	= ife_queue_buffer,
+	.flush_buffers	= ife_flush_buffers,
+};
+
+static int ife_init_pad_indices(struct ife_device *ife)
+{
+	const struct ife_pads_descriptors *pads = ife->res->pads;
+	bool found_extra_sink = false;
+	unsigned int i;
+
+	if (pads->num_desc < 2) {
+		dev_err(ife->camss->dev, "IFE resources define too few pads\n");
+		return -EINVAL;
+	}
+
+	if (!(pads->desc[IFE_IMAGE_SINK_PAD].pad_flags & MEDIA_PAD_FL_SINK)) {
+		dev_err(ife->camss->dev, "IFE resources define no image sink pad\n");
+		return -EINVAL;
+	}
+
+	if (!(pads->desc[IFE_FIRST_SOURCE_PAD].pad_flags & MEDIA_PAD_FL_SOURCE)) {
+		dev_err(ife->camss->dev, "IFE resources define no source pad after image sink\n");
+		return -EINVAL;
+	}
+
+	for (i = IFE_FIRST_SOURCE_PAD; i < pads->num_desc; i++) {
+		u16 flags = pads->desc[i].pad_flags;
+
+		if (flags & MEDIA_PAD_FL_SINK) {
+			found_extra_sink = true;
+			continue;
+		}
+
+		if (!(flags & MEDIA_PAD_FL_SOURCE)) {
+			dev_err(ife->camss->dev, "IFE resources define invalid pad %u\n", i);
+			return -EINVAL;
+		}
+
+		if (found_extra_sink) {
+			dev_err(ife->camss->dev,
+				"IFE resources define source pad %u after an extra sink pad\n", i);
+			return -EINVAL;
+		}
+	}
+
+	ife->sink_pad = IFE_IMAGE_SINK_PAD;
+
+	return 0;
+}
+
+static int camss_ife_first_source_pad(struct media_entity *entity)
+{
+	if (entity->num_pads < 2)
+		return -EINVAL;
+
+	if (!(entity->pads[IFE_IMAGE_SINK_PAD].flags & MEDIA_PAD_FL_SINK))
+		return -EINVAL;
+
+	if (!(entity->pads[IFE_FIRST_SOURCE_PAD].flags & MEDIA_PAD_FL_SOURCE))
+		return -EINVAL;
+
+	return IFE_FIRST_SOURCE_PAD;
+}
+
+int camss_ife_subdev_init(struct camss *camss, struct ife_device *ife,
+			  const struct camss_subdev_resources *res, u8 id,
+			  void __iomem *csid_base)
+{
+	struct device *dev = camss->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	void __iomem *base;
+	int i, j;
+	int rc;
+
+	if (!camss->ife_total_num || id >= camss->ife_total_num)
+		return -EINVAL;
+
+	ife->res = &res->ife;
+	ife->camss = camss;
+	ife->id = id;
+
+	rc = ife_init_pad_indices(ife);
+	if (rc)
+		return rc;
+
+	init_completion(&ife->reset_complete);
+	mutex_init(&ife->state_mutex);
+	spin_lock_init(&ife->bufs_lock);
+
+	/* Memory */
+	base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
+	if (IS_ERR(base)) {
+		dev_err(dev, "could not map memory\n");
+		return PTR_ERR(base);
+	}
+
+	/*
+	 * Initialise per-engine contexts. Each ops backend stores
+	 * the MMIO base and any additional state it needs.
+	 */
+	res->ife.buswr_ops->acquire(ife, base);
+	rc = res->ife.top_ops->acquire(ife, base, csid_base);
+	if (rc)
+		return rc;
+	if (ife->res->type == CAMSS_IFE_SUBDEV_TYPE_IFE)
+		res->ife.mod_ops->acquire(ife, &ife->pp_ctx, base);
+
+	/* Interrupt */
+	rc = platform_get_irq_byname(pdev, res->interrupt[0]);
+	if (rc < 0)
+		return rc;
+
+	ife->irq = rc;
+	snprintf(ife->irq_name, sizeof(ife->irq_name), "%s_%s%d", dev_name(dev),
+		 CAMSS_IFE_IRQ_NAME, id);
+	rc = devm_request_irq(dev, ife->irq, ife_hw_top_isr,
+			      IRQF_TRIGGER_RISING, ife->irq_name, ife);
+	if (rc) {
+		dev_err(dev, "request_irq failed: %d\n", rc);
+		return rc;
+	}
+
+	/* Clocks */
+	ife->nclocks = 0;
+	while (res->clock[ife->nclocks])
+		ife->nclocks++;
+
+	ife->clock = devm_kcalloc(dev, ife->nclocks, sizeof(*ife->clock),
+				  GFP_KERNEL);
+	if (!ife->clock)
+		return -ENOMEM;
+
+	for (i = 0; i < ife->nclocks; i++) {
+		struct camss_clock *clock = &ife->clock[i];
+
+		clock->clk = devm_clk_get(dev, res->clock[i]);
+		if (IS_ERR(clock->clk))
+			return PTR_ERR(clock->clk);
+
+		clock->name = res->clock[i];
+
+		clock->nfreqs = 0;
+		while (res->clock_rate[i][clock->nfreqs])
+			clock->nfreqs++;
+
+		if (!clock->nfreqs) {
+			clock->freq = NULL;
+			continue;
+		}
+
+		clock->freq = devm_kcalloc(dev, clock->nfreqs,
+					   sizeof(*clock->freq), GFP_KERNEL);
+		if (!clock->freq)
+			return -ENOMEM;
+
+		for (j = 0; j < clock->nfreqs; j++)
+			clock->freq[j] = res->clock_rate[i][j];
+	}
+
+	return 0;
+}
+
+int camss_ife_link_entities(struct camss *camss)
+{
+	int ife_id, csid_id;
+	int rc;
+
+	for (ife_id = 0; ife_id < camss->res->csiphy_num; ife_id++) {
+		for (csid_id = 0; csid_id < camss->res->csid_num; csid_id++) {
+			rc = media_create_pad_link(&camss->csiphy[ife_id].subdev.entity,
+						   MSM_CSIPHY_PAD_SRC,
+						   &camss->csid[csid_id].subdev.entity,
+						   MSM_CSID_PAD_SINK, 0);
+			if (rc) {
+				dev_err(camss->dev,
+					"Failed to link %s->%s entities: %d\n",
+					camss->csiphy[ife_id].subdev.entity.name,
+					camss->csid[csid_id].subdev.entity.name,
+					rc);
+				return rc;
+			}
+		}
+	}
+
+	for (ife_id = 0; ife_id < camss->ife_total_num; ife_id++) {
+		struct v4l2_subdev *csid = &camss->csid[ife_id].subdev;
+		struct ife_device *ife = &camss->ife[ife_id];
+		struct v4l2_subdev *sd = &ife->sd;
+		int src_pad;
+
+		src_pad = camss_ife_first_source_pad(&csid->entity);
+		if (src_pad < 0) {
+			dev_err(camss->dev, "%s does not expose sink pad 0 and source pad 1\n",
+				csid->entity.name);
+			return src_pad;
+		}
+
+		rc = media_create_pad_link(&csid->entity, src_pad, &sd->entity,
+					   ife->sink_pad, 0);
+		if (rc) {
+			dev_err(camss->dev, "Failed to link %s -> %s entities: %d\n",
+				csid->entity.name, sd->entity.name, rc);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+int ife_register_entities(struct ife_device *ife, struct v4l2_device *v4l2_dev)
+{
+	struct v4l2_subdev *sd = &ife->sd;
+	struct camss *camss = ife->camss;
+	struct device *dev = camss->dev;
+	int ret;
+	int i;
+
+	ife->npads = ife->res->pads->num_desc;
+
+	ife->pads = devm_kcalloc(dev, ife->npads, sizeof(*ife->pads), GFP_KERNEL);
+	if (!ife->pads)
+		return -ENOMEM;
+
+	ife->mpads = devm_kcalloc(dev, ife->npads, sizeof(*ife->mpads), GFP_KERNEL);
+	if (!ife->mpads)
+		return -ENOMEM;
+
+	v4l2_subdev_init(sd, &ife_v4l2_ops);
+	sd->internal_ops = &ife_v4l2_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		     V4L2_SUBDEV_FL_HAS_EVENTS |
+		     V4L2_SUBDEV_FL_STREAMS;
+
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->entity.ops = &ife_media_ops;
+	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d", CAMSS_IFE_PREFIX, ife->id);
+
+	v4l2_set_subdevdata(sd, ife);
+
+	for (i = 0; i < ife->npads; i++) {
+		const struct ife_pad_desc *dsc = &ife->res->pads->desc[i];
+		struct ife_subdev_pads *pad = &ife->pads[i];
+
+		pad->desc = dsc;
+		ife->mpads[i].flags = dsc->pad_flags;
+
+		pad->fmt.code = dsc->sup_fmts.formats->code;
+		if (!dsc->limits) {
+			dev_err(dev, "Missing pad[%d] constraints\n", i);
+			return -EINVAL;
+		}
+
+		pad->fmt.width	= dsc->limits->max_width;
+		pad->fmt.height	= dsc->limits->max_height;
+
+		if (dsc->video_name) {
+			char name[sizeof(((struct camss_video *)0)->vdev.name)];
+
+			pad->vid_pad = devm_kzalloc(dev, sizeof(*pad->vid_pad), GFP_KERNEL);
+			if (!pad->vid_pad)
+				goto err_msm_video_unregister;
+
+			pad->vid_pad->ife = ife;
+			pad->vid_pad->pad_index = i;
+			pad->vid_pad->streaming = false;
+
+			INIT_LIST_HEAD(&pad->vid_pad->pending_bufs);
+			INIT_LIST_HEAD(&pad->vid_pad->processing_bufs);
+
+			pad->vid_pad->video.camss	= camss;
+			pad->vid_pad->video.nformats	= dsc->sup_fmts.nformats;
+			pad->vid_pad->video.formats	= dsc->sup_fmts.formats;
+			pad->vid_pad->video.type	= dsc->buf_type;
+			pad->vid_pad->video.ops		= &camss_video_ops;
+			pad->vid_pad->video.bpl_alignment = 16;
+
+			if (dsc->mode_config == BUSWR_CLIENT_CFG_MODE_LINE_BASED)
+				pad->vid_pad->video.line_based = 1;
+			else
+				pad->vid_pad->video.line_based = 0;
+
+			snprintf(name, ARRAY_SIZE(name), "%s_%s", ife->sd.name, dsc->video_name);
+			/* Register video node */
+			ret = msm_video_register(&pad->vid_pad->video, v4l2_dev, name);
+			if (ret) {
+				dev_err(dev, "Failed to register video: %d\n", ret);
+				goto err_msm_video_unregister;
+			}
+		}
+	}
+
+	for (i = 0; i < CAMSS_IFE_HW_PIPE_INVALID; i++) {
+		ife->pipeline_cfg[i].in_code = ife->pads[ife->sink_pad].fmt.code;
+		ife->pipeline_cfg[i].in_width = ife->pads[ife->sink_pad].fmt.width;
+		ife->pipeline_cfg[i].in_height = ife->pads[ife->sink_pad].fmt.height;
+	}
+
+	ret = media_entity_pads_init(&sd->entity, ife->npads, ife->mpads);
+	if (ret) {
+		dev_err(dev, "Failed to init media entity: %d\n", ret);
+		goto err_msm_video_unregister;
+	}
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret) {
+		dev_err(dev, "Failed to finalize subdev: %d\n", ret);
+		goto err_media_entity_cleanup;
+	}
+
+	ret = v4l2_device_register_subdev(v4l2_dev, sd);
+	if (ret) {
+		dev_err(dev, "Failed to register subdev: %d\n", ret);
+		goto err_v4l2_subdev_cleanup;
+	}
+
+	/* Link video nodes to subdevice */
+	for (i = 0; i < ife->npads; i++) {
+		struct ife_subdev_pads *pad = &ife->pads[i];
+		struct ife_video_pad *vpad = pad->vid_pad;
+
+		if (!vpad)
+			continue;
+
+		ret = media_create_pad_link(&sd->entity, vpad->pad_index,
+					    &vpad->video.vdev.entity, 0,
+					    pad->desc->link_flags);
+		if (ret < 0) {
+			dev_err(dev, "Failed to link '%s' and '%s' entities\n", sd->entity.name,
+				vpad->video.vdev.entity.name);
+			goto err_media_entity_remove_links;
+		}
+	}
+
+	ret = ife_add_pm_domain_link(ife);
+	if (ret)
+		goto err_media_entity_remove_links;
+
+	return 0;
+
+err_media_entity_remove_links:
+	media_entity_remove_links(&sd->entity);
+	v4l2_device_unregister_subdev(sd);
+err_v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_media_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+err_msm_video_unregister:
+	for (i = 0; i < ife->npads; i++) {
+		if (ife->pads[i].vid_pad)
+			msm_video_unregister(&ife->pads[i].vid_pad->video);
+	}
+
+	return ret;
+}
+
+void ife_unregister_entities(struct ife_device *ife)
+{
+	int i;
+
+	ife_del_pm_domain_link(ife);
+
+	mutex_destroy(&ife->state_mutex);
+
+	for (i = 0; i < ife->npads; i++) {
+		if (ife->pads[i].vid_pad)
+			msm_video_unregister(&ife->pads[i].vid_pad->video);
+	}
+
+	media_entity_remove_links(&ife->sd.entity);
+	media_entity_cleanup(&ife->sd.entity);
+	v4l2_device_unregister_subdev(&ife->sd);
+}
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 1f63a32809ed..65582ff7db23 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -11,6 +11,7 @@
 #define QC_MSM_CAMSS_H
 
 #include <linux/device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/types.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
@@ -20,6 +21,7 @@
 
 #include "camss-csid.h"
 #include "camss-csiphy.h"
+#include "camss-ife.h"
 #include "camss-ispif.h"
 #include "camss-tpg.h"
 #include "camss-vfe.h"
@@ -44,6 +46,28 @@
 #define CAMSS_RES_MAX 17
 #define CAMSS_INIT_BUF_COUNT 2
 
+/* Per-subdev host private data attached via v4l2_set_subdev_hostdata() */
+struct camss_host_priv_data {
+	bool is_sensor;
+	u32 id;
+};
+
+/*
+ * The Camera SoC has four fixed levels of performance,
+ * and each level defines clocks and power constraints.
+ * These levels are used to set frequencies and bandwidths
+ * without the need for calculation or adjustments for
+ * each engine.
+ */
+enum camss_perf_mode {
+	CAMSS_PERF_MODE_MINSVS = 0,
+	CAMSS_PERF_MODE_LOWSVS,
+	CAMSS_PERF_MODE_SVS,
+	CAMSS_PERF_MODE_SVS_L1,
+	CAMSS_PERF_MODE_NOM,
+	CAMSS_PERF_MAX_MODES
+};
+
 struct camss_subdev_resources {
 	struct regulator_bulk_data regulators[CAMSS_RES_MAX];
 	char *clock[CAMSS_RES_MAX];
@@ -56,6 +80,7 @@ struct camss_subdev_resources {
 		struct tpg_subdev_resources tpg;
 		struct csid_subdev_resources csid;
 		struct vfe_subdev_resources vfe;
+		struct ife_subdev_resources ife;
 	};
 };
 
@@ -113,6 +138,7 @@ struct camss_resources {
 	const struct camss_subdev_resources *ispif_res;
 	const struct camss_subdev_resources *vfe_res;
 	const struct resources_wrapper *csid_wrapper_res;
+	const struct camss_subdev_resources *ife_res;
 	const struct resources_icc *icc_res;
 	const unsigned int icc_path_num;
 	const unsigned int csiphy_num;
@@ -120,6 +146,10 @@ struct camss_resources {
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
 	const bool csid_vfe_fixed_pairing;
+	const bool embedded_csid;
+	const unsigned int ife_num;
+	const unsigned int ife_lite_num;
+	int (*link_entities)(struct camss *camss);
 };
 
 struct camss {
@@ -133,12 +163,21 @@ struct camss {
 	struct ispif_device *ispif;
 	struct vfe_device *vfe;
 	void __iomem *csid_wrapper_base;
+	struct ife_device *ife;
+	enum camss_perf_mode perf_mode;
+	unsigned int ife_total_num;
 	atomic_t ref_count;
 	int genpd_num;
 	struct device *genpd;
 	struct device_link *genpd_link;
+	struct device **ife_genpd;
+	struct device_link **ife_genpd_link;
 	struct icc_path *icc_path[ICC_SM8250_COUNT];
 	const struct camss_resources *res;
+
+	int (*core_get)(struct camss *camss, u8 entity_id);
+	int (*core_put)(struct camss *camss);
+	atomic_t perf_ref_count;
 };
 
 struct camss_camera_interface {
@@ -171,6 +210,8 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock);
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 			unsigned int lanes);
+int camss_get_pixel_clock_bpp(struct media_entity *entity, unsigned int bpp,
+			      u64 *pixel_clock);
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
@@ -181,4 +222,9 @@ void camss_buf_done(struct camss *camss, int hw_id, int port_id);
 void camss_reg_update(struct camss *camss, int hw_id,
 		      int port_id, bool is_clear);
 
+int camss_attach_host_data(struct camss *camss, struct v4l2_subdev *sd,
+			   bool is_sensor, int id);
+
+void camss_delete(struct camss *camss);
+
 #endif /* QC_MSM_CAMSS_H */
-- 
2.34.1

