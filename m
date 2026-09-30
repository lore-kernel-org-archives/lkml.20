Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0437D51DB0E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793062; cv=none; b=qbgO8jWfng42L/R1zRd7+C7tgKNzAnl2RjZudq6Y6uok4eslOgTtcsQzndQI6ezYNpJw+oAE6ZmkJJEp+hc/GcjOneQBYFjfBiybZ8PgND5QJz+sf7C4vAoO8mSHoXuIDWgv7LbdVSqFl5fZgfgtxdoE/XE7CNdBv+6LN4ss55g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793062; c=relaxed/simple;
	bh=hZYpkknU50IPTqTLH/yzuqeNN6S6tqV+9vDdGUEOvlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OwMpjTYWXc/iL6aQq2T25y3ui5mPT2WuFZDCYvuDxpmTJzEO0fU9MM2zdnfRNEZzEPHiQFeksue3+2q+GOn76hZx0WGJ2RqsqcasU9tWHVG0pQGd4cnU6i6i5mZBBiuwfy/6+GVaqGlxC/g0sfnwijtjUqPdEGTOpmD3UEkf89c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luoEzeID; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAMjypOW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="luoEzeID";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAMjypOW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UIPJ7C3881874
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RvnzSJafvmyhZIkCGy51NSl5QzuGjrllVF2BLRNXpNI=; b=luoEzeIDGJtrWAGK
	kmVWWGYK0ASJGz9EGvVlXHYNrQvzXgaQu11x3fqocuFODoiBuI9iczcn6CqI175L
	OBAfGjZRTHmArs9q6OAR9HcP0QlOMnpK5LyD3vKYnOkG1BTpxR5McuQeAQV4kDVn
	YNQzK/YQqyA5hOjpeq9LQzeByq637Ch+h8mWo86MIU+JnnIX6g7yexExV6IUepYi
	+rs/9UcWG3m+bowd+9JI6dGmsoczibklv69y9u3+GNn33tih9maKBewUdTzqD5WR
	K+drMxD7E0KHegXPyEMjPUDzYKfpan221qXF3wEGAekJg/Vc9BBpM1PuoxlJAGnf
	0dwnyQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pj80wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:31:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c58d35c0aso1198533eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790793059; x=1791397859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvnzSJafvmyhZIkCGy51NSl5QzuGjrllVF2BLRNXpNI=;
        b=DAMjypOWBe2SRQ6Ij+k4VOCLQDS0r8ah9NhSlZyYgZoh/UsUaGuPIsMUNfLuhneBIf
         5eE53Bk8QIHNxYwUdxCN/oJmDektBojRXdTuEug4x3IgONfoCIVrxsGlYnPVeFP3I0+n
         z4XVEEgMejQ3Eem007ZqxQiW7Z9U7r9zr4jdPvLZmk4vwzy0PHvJpwuxilrxejgNSCEZ
         BFq8p//eHmAJzbO38BctfNxd0BG7brXUxXu5WwAh4ejlL6jhLIkxvCKAtLAkn44qdTdh
         kho3duTsq/AZ8wk/+hx51Y8TIz8aHwFM5AKfrj1plU/Zs4wczFCHLR6KuLTNBRHXxpMf
         L3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793059; x=1791397859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvnzSJafvmyhZIkCGy51NSl5QzuGjrllVF2BLRNXpNI=;
        b=FSTfRg6+d/d/TvVmNkVTk+6xsYhSH+hxtztdUKiYl5jGa/7P/WQTCOTdqpm/R7pEYW
         xCjhjsKIs6omST2JeItK0Z+xFZqLA/fGMOoPwC32JUvqgFgzkOxU7AqxRO1+RKdZyxTz
         RU6X3MpmXMPxPG5EZ7tzj5SlhjQ/+g7zbgJepfUk1ckwoHBhLzqKuiB1ZtzteoXOn/B0
         i9wbW/acQr7RL6Hxa72IjLSgGZT1Mmzc4PEFHMyHg9oPqUWLM8Zt5Zca2qUifKo/+zHz
         pu2zJyVtB7KM21aufI4sxwKtrjrrD6ZI92wVDb/gj2uhKyNvN+mWvUmVdViXNSBqnBJF
         jPQw==
X-Forwarded-Encrypted: i=1; AKwUvBzPkT8SNT8/gw63+MYuRB2ZOZ5HH9C85+Kn/k8129UJDJWu/Eybj0iyv9cDw5Sbe5b02UvadSu01RdB71A=@vger.kernel.org
X-Gm-Message-State: AFuF++m37pVotSPXbiVKFcptDS+4mh9BMtxlPMyyOA0NyHJLNzfp8faU
	jZpyEnEaKAqC1Wm9tz/bD9dGobi6WkCR8xlOUhKZxBAzvnz0zV/qHFpbyBJOic7uA+UzQSlfhMN
	TjYa5y24OCfU4ILx834SJL3uNZD5VETQTLay4hjDeJqb+NS3GjMdRC3asewvpufJBEQY=
X-Gm-Gg: AYBFou1i6X1xweYGh7z++udp65XVKGldwclDU27wSyF8OYmkE/4+ELWF35oWMjxZaM9
	VtjLeJQZw11smmnKZcSgUA+kN/ixFzrzmbDQZdO+M9OaY50AA/S9k7ronZLDswNdUgKpE93D+MX
	0zAO1TBGeHqGiu0FOi8GhlvYh6GAZhb4Q56EakhEk47GVjBmEkWCACdwA+lhYCKp1CRkGKomh7e
	Ll1gTQLWkZOYNLhctzPIhBd/4dfO2trFONLvsHwVV6HlQR1PTT2QdbyLptReZ4K3W1B02JB+u+Z
	DNEvbeNfKMQU3B22VN48ND3hbdPfz8/hau55PhTXsFG87vInC5uF1r8xti4jHdb8LIY/2gYvzTF
	O0e3y9Gv26MH6eEdZaxlFmL9ePeWAfzOWiyG6knVGUoV3UuKFXC+/Gioi+65C
X-Received: by 2002:a05:693c:41d0:10b0:34c:15b5:b4e7 with SMTP id 5a478bee46e88-34cdbcd280emr4556457eec.2.1790793058875;
        Wed, 30 Sep 2026 11:30:58 -0700 (PDT)
X-Received: by 2002:a05:693c:41d0:10b0:34c:15b5:b4e7 with SMTP id 5a478bee46e88-34cdbcd280emr4556379eec.2.1790793057870;
        Wed, 30 Sep 2026 11:30:57 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db491fae1sm750926eec.24.2026.09.30.11.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:30:55 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:30:28 -0700
Subject: [PATCH v8 5/5] media: iris: Add BUF_ROIMB_DELTAQP metadata buffer
 for ROI delta QP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-enc_roi_enable-v8-5-2c908f30e963@oss.qualcomm.com>
References: <20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com>
In-Reply-To: <20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790793031; l=13611;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=hZYpkknU50IPTqTLH/yzuqeNN6S6tqV+9vDdGUEOvlI=;
 b=IfPd8wMyLP3r+tnVBDAy/EgcTDYXaAlQ59voSJS2ZiBoQqPJixqlNc+TyD1BPGyp4qk3zGLM9
 t7q50M8LIMdC2ZAZvP2e5lIfIN8EX1WTseD3ldBlWY6mtmn6eZLMGF+
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abd5564 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vSfK5Sz1eu9jql6VJIMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Cqt16gZvIiMQgRXh4b00CMdyGM-l1xlC
X-Proofpoint-ORIG-GUID: Cqt16gZvIiMQgRXh4b00CMdyGM-l1xlC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfX+Jt27uOY3g2u
 i+SlTyDi8JuL++8Wz0KjT2TCIK7RsMDyKLes+1qNVaFdmZLUgNlu/uUJwQpEoEoSNfyufIBLaS2
 X1bzbVyWxMfz+ZK6eb9QPtGrQDQ88LI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfX155JLmqXk6Mt
 63IRe4JwR9bf4RRgpMCm46+g94ibVSBGnECO4g2/LKeeRaQkbC0ENAVeGyGh6JJHGXtrQeWWF71
 goL8HLZQuJiLFfVGfYPrl1Rz/M4GMMuaSdPqgcoYFBPVwF/vZn5n9pTifFsmCk8T6CnaOpkOozn
 qhwAK9tJ6Xb8ZkXeLlVpzc7r1etjQtbWh4uINn8isoLpO2D1Ie7T+lh+DR8d8wyXC8F/JrZGzRk
 RHazRN45fAVK6x3wyT92l/80pJozKRNVs3TFpw8eG9FfeuFMMqXz4cRpig67SiFn+ws65q2IUdH
 O8SsswHEzS4s0AqVSG3hXUgGYQdP84+3hV+AlMOfpZdgmR5HgWgg/yD8x4g+ORtG3qktBCXlMEE
 fpgtVDzSZN2qEJBXnlboR6CjxPiFOhgHlecTkzFIgVeb43kmdyyzSyRMezV/AYuxC01YraeNJ1b
 T2VhBHBI8Fo2WNfyeuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300075

- Introduce BUF_ROIMB_DELTAQP as a new internal buffer type to carry
  per-macroblock ROI delta QP data to the firmware. This buffer is
  allocated on demand when the application sets ROI parameters via
  V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP, and is queued alongside each
  raw input buffer as an HFI_BUFFER_METADATA packet on HFI_PORT_RAW.

- The metadata buffer layout follows the firmware-defined metabuf_header
  and metapayload_header structures. The s8 per-MB delta QP values
  supplied by userspace are widened to s16 as required by the firmware.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     | 114 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |   4 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  29 ++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  24 +++++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 8 files changed, 177 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177f5e1ab83b90a3c8c80e0b4d1f02e..a7f1d74360d6a490959b27936fa5bbc61a7d9358 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -5,11 +5,13 @@
 
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
+#include <linux/slab.h>
 
 #include "iris_buffer.h"
 #include "iris_instance.h"
 #include "iris_power.h"
 #include "iris_vpu_buffer.h"
+#include "iris_hfi_gen2_defines.h"
 
 #define PIXELS_4K 4096
 #define MAX_WIDTH 4096
@@ -705,6 +707,20 @@ int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
 	return iris_destroy_internal_buffers(inst, plane, false);
 }
 
+int iris_destroy_roi_metadata_buffers(struct iris_inst *inst)
+{
+	struct iris_buffer *buf, *next;
+	struct iris_buffers *buffers;
+
+	if (inst->domain == ENCODER) {
+		buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
+		list_for_each_entry_safe(buf, next, &buffers->list, list)
+			iris_destroy_internal_buffer(inst, buf);
+	}
+
+	return 0;
+}
+
 static int iris_release_internal_buffers(struct iris_inst *inst,
 					 enum iris_buffer_type buffer_type)
 {
@@ -928,3 +944,101 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 
 	return 0;
 }
+
+static int iris_fill_roi_data(struct iris_inst *inst, struct iris_buffer *buffer)
+{
+	s8 *p_array = (s8 *)inst->fw_caps[ROI_PARAMS].p_array;
+	u32 payload_offset, lcu_width, lcu_height, row_size;
+	u32 array_size = inst->fw_caps[ROI_PARAMS].elems;
+	struct metabuf_header *mbuf_hdr = buffer->kvaddr;
+	struct metapayload_header *mbuf_payload_hdr;
+	struct v4l2_format *f = inst->fmt_src;
+	s16 *p_16, *p_temp;
+
+	memset(mbuf_hdr, 0, sizeof(struct metabuf_header));
+	mbuf_hdr->count = 1;
+	mbuf_hdr->size = sizeof(struct metabuf_header) +
+			 sizeof(struct metapayload_header);
+	mbuf_hdr->version = BIT(16);
+	mbuf_hdr++;
+	mbuf_payload_hdr = (struct metapayload_header *)(mbuf_hdr);
+	payload_offset = sizeof(struct metabuf_header) +
+			 sizeof(struct metapayload_header);
+
+	memset(mbuf_payload_hdr, 0, sizeof(struct metapayload_header));
+	mbuf_payload_hdr->type = HFI_PROP_ROI_INFO;
+	mbuf_payload_hdr->size = array_size * sizeof(s16);
+	mbuf_payload_hdr->version = 1 << 16;
+	mbuf_payload_hdr->offset = ALIGN(payload_offset, (u32)256);
+	mbuf_payload_hdr->flags = 0;
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		lcu_width = (f->fmt.pix_mp.width + 31) >> 5;
+		lcu_height = (f->fmt.pix_mp.height + 31) >> 5;
+	} else {
+		lcu_width = (f->fmt.pix_mp.width + 15) >> 4;
+		lcu_height = (f->fmt.pix_mp.height + 15) >> 4;
+	}
+	/* Firmware expects each row to align to 8 LCU */
+	row_size = (((lcu_width + 7) >> 3) << 3);
+
+	/* Firmware expects 2bytes of delta_Qp, int16_t */
+	p_16 = buffer->kvaddr + mbuf_payload_hdr->offset;
+	for (int j = 0; j < lcu_height; j++) {
+		p_temp = p_16 + j * row_size;
+		for (int i = 0; i < lcu_width; i++)
+			*p_temp++ = (1 << 11) | (((u8)p_array[j * lcu_width + i]
+						   & 0x3F) << 4);
+	}
+
+	return 0;
+}
+
+int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst)
+{
+	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
+	struct iris_core *core = inst->core;
+	struct iris_buffer *buffer, *first_buffer, *next;
+	bool found = false;
+	int ret = 0;
+
+	if (!buffers->size)
+		return 0;
+
+	list_for_each_entry_safe(buffer, next, &buffers->list, list) {
+		if (buffer->attr & BUF_ATTR_DEQUEUED) {
+			buffer->attr &= ~BUF_ATTR_DEQUEUED;
+			list_move(&buffer->list, &buffers->list);
+			found = true;
+			break;
+		}
+	}
+	if (!found) {
+		buffer = kzalloc_obj(*buffer);
+		if (!buffer)
+			return -ENOMEM;
+
+		INIT_LIST_HEAD(&buffer->list);
+		buffer->type = BUF_ROIMB_DELTAQP;
+		buffer->index++;
+		buffer->buffer_size = buffers->size;
+		buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE;
+
+		buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+						 &buffer->device_addr, GFP_KERNEL,
+						 buffer->dma_attrs);
+
+		if (!buffer->kvaddr) {
+			kfree(buffer);
+			return -ENOMEM;
+		}
+		list_add(&buffer->list, &buffers->list);
+	}
+
+	first_buffer = list_first_entry(&buffers->list, struct iris_buffer, list);
+	ret = iris_fill_roi_data(inst, first_buffer);
+	if (ret)
+		return ret;
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index ee2d24bb69c57220b0a735d9b4aae4434a33daf6..df9d018493f3ec37fd5e6b0ba049dba0b5ae76e9 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -28,6 +28,7 @@ struct iris_inst;
  * @BUF_SCRATCH_2: buffer to store encoding context data for HW
  * @BUF_VPSS: buffer to store VPSS context data for HW
  * @BUF_PARTIAL: buffer for AV1 IBC data
+ * @BUF_ROIMB_DELTAQP: metadata buffer for ROI MB DeltaQp
  * @BUF_TYPE_MAX: max buffer types
  */
 enum iris_buffer_type {
@@ -44,6 +45,7 @@ enum iris_buffer_type {
 	BUF_SCRATCH_2,
 	BUF_VPSS,
 	BUF_PARTIAL,
+	BUF_ROIMB_DELTAQP,
 	BUF_TYPE_MAX,
 };
 
@@ -139,5 +141,7 @@ int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
 int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
 int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
 void iris_vb2_queue_error(struct iris_inst *inst);
+int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst);
+int iris_destroy_roi_metadata_buffers(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 142c9712bb0b05bea2cf656be636e7449e361512..9b42d0e81dcce8e4b1ccea0b2959b4505808226f 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1620,3 +1620,32 @@ int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
 
 	return hfi_ops->session_subscribe_metadata_delivery(inst, plane);
 }
+
+int iris_set_roi_params(struct iris_inst *inst, u32 plane)
+{
+	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
+	u32 height = inst->fmt_src->fmt.pix_mp.height;
+	u32 width = inst->fmt_src->fmt.pix_mp.width;
+	u32 metadata_header_bytes = 256;
+	u32 lcu_height = 0;
+	u32 lcu_width = 0;
+	u32 lcu_size = 16;
+	u32 n_shift = 0;
+	u32 size = 0;
+	int ret = 0;
+
+	if (!inst->fw_caps[ROI_PARAMS].p_array)
+		return -EINVAL;
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC)
+		lcu_size = 32;
+
+	n_shift = ilog2(lcu_size);
+	lcu_width = (width + (lcu_size - 1)) >> n_shift;
+	lcu_height = (height + (lcu_size - 1)) >> n_shift;
+	size = (((lcu_width + 7) >> 3) << 3) * lcu_height * 2;
+	size += metadata_header_bytes;
+	buffers->size = ALIGN(size, 4096);
+
+	return iris_hfi_gen2_session_alloc_roi_metadata_buffer(inst);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 9957b69366f50310338a0c1470d9744592655c33..7587dfec052a320863889eb15203416b9c527a40 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -51,5 +51,6 @@ int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
+int iris_set_roi_params(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index d628bc6748438b19dac01cd11cb9f8da0b8500af..4d40d6733e5877a302ce63fb0b4a61b8f284e6dc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1789,6 +1789,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_ROI_INFO,
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
 			 CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_roi_params,
 	},
 	{
 		.cap_id = MB_SIZE,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index cf88dbe11e8e9faef826e661d8e9909fd7f16b94..a1b0c4982f0d789a807f22a1dffdf61decd20d28 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -134,6 +134,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
 		switch (buffer_type) {
 		case BUF_INPUT:
 		case BUF_VPSS:
+		case BUF_ROIMB_DELTAQP:
 			return HFI_PORT_RAW;
 		case BUF_OUTPUT:
 		case BUF_BIN:
@@ -1267,6 +1268,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 		return HFI_BUFFER_VPSS;
 	case BUF_PARTIAL:
 		return HFI_BUFFER_PARTIAL_DATA;
+	case BUF_ROIMB_DELTAQP:
+		return HFI_BUFFER_METADATA;
 	default:
 		return 0;
 	}
@@ -1328,6 +1331,7 @@ static struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
 static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	struct iris_hfi_buffer hfi_meta_buffer;
 	struct iris_hfi_buffer hfi_buffer;
 	u32 port;
 	int ret;
@@ -1349,6 +1353,26 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 					     &hfi_buffer,
 					     sizeof(hfi_buffer));
 
+	/* check if any metadata buffer is available not queued, queue it */
+	if (port == HFI_PORT_RAW) {
+		buffer = iris_queue_metadata_buffers(inst, BUF_ROIMB_DELTAQP, buffer->index);
+		if (buffer) {
+			iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_meta_buffer);
+			port = iris_hfi_gen2_get_port_from_buf_type(inst, buffer->type);
+			iris_hfi_gen2_create_packet(inst_hfi_gen2->packet,
+						    HFI_CMD_BUFFER,
+						    HFI_HOST_FLAGS_INTR_REQUIRED,
+						    HFI_PAYLOAD_STRUCTURE,
+						    port,
+						    inst->core->packet_id++,
+						    &hfi_meta_buffer,
+						    sizeof(hfi_meta_buffer));
+
+			buffer->attr |= BUF_ATTR_QUEUED;
+			buffer->attr &= ~BUF_ATTR_DEQUEUED;
+		}
+	}
+
 	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
 					inst_hfi_gen2->packet->size);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 84b629b957442c024dccc18b354ac9a7e541abaa..f63e0a7723e8583da818c2b004e367c1dd3d94f7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -58,6 +58,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
 		return BUF_PARTIAL;
 	case HFI_BUFFER_VPSS:
 		return BUF_VPSS;
+	case HFI_BUFFER_METADATA:
+		return BUF_ROIMB_DELTAQP;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index fcbc60016beec693f2ce27927a09a2d51494bc38..fae3d113a9dc990f06167ee0b7fb8fab24a0552c 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -180,6 +180,7 @@ int iris_open(struct file *filp)
 	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_ROIMB_DELTAQP].list);
 	init_completion(&inst->completion);
 	init_completion(&inst->flush_completion);
 
@@ -299,6 +300,7 @@ int iris_close(struct file *filp)
 	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	iris_destroy_roi_metadata_buffers(inst);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
 	mutex_destroy(&inst->ctx_q_lock);

-- 
2.34.1

