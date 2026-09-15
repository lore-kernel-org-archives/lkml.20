Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000EA3EFFBA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509623; cv=none; b=KWiUcBGTegJJnmB0vZHr7gMknGyFdRWqqCVPG6JgiD05bBX4SDOwlzueKqO+wGdYgLsZ7Tzf9h+KR+7T6EepsmN024dJQL2Np6qAQKJ8dqaeNEEMaArhQbc1/DRwQ8VfSnEzi0oASI+HEWSqBg1cBIjy3YzZ1CvVeMKbGGTMy5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509623; c=relaxed/simple;
	bh=5Y3wceAUSis4LyEEBP3vcPhXNhSkH4aQtluUG+lkk8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6sAh+SjnLvCYppQQYMSGix5MTsO1hJB9ct8h4h91D9ES8jyAn8DgRYRSoA5yw947s6vDogtoEXLVJq3JKJYsaU+u8zjrEE9rI/MXJQ/I4UDbaTDSPXwpJusNf3Xea2snWd6g45rPMl5GBbVSi19GJedsFm1+79kLGb6jUQO2vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JslOEOog; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PhZtVxBb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JslOEOog";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PhZtVxBb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYp3o3680606
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmWHRpNSCYIUBFB4IKMz89RjhQYOyuZ9OhQTzTXuRZk=; b=JslOEOogjob/69Lb
	xzqA2IWHMrSArn3ApsLpYc8VG1weqUtt/ptexWXAv4BErxg69Os7emxrvsziX9dW
	RWXhsMMS1n835m5fbfWqK6ZKyi9HEyoJBVJ45DJDQwplh4VVjIikcb21o7h6pVir
	tWAs0slQLmHwFdD9eOHjtyDj9wpHqmpDXE8dYQ8sFFhDNfYMg4w40qiioFiZJG51
	rw9x0JyfCv85P2PpjHWP4QmrEJHcQ42SaZW1Q5jnAH+ll84Ow4u3j7slaUry/LOy
	B3liJlf3LRmtmBn5XZkFWD0D0+p3rkfmWUjw4UtGf7Pb8mtcFdEcAScllEUMXYmC
	YeEzEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqe1r82x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39924189378so1703598a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789509620; x=1790114420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmWHRpNSCYIUBFB4IKMz89RjhQYOyuZ9OhQTzTXuRZk=;
        b=PhZtVxBbgDvfFr0g4Hvt/A3G+H3FNu0pAGQmA43V6H4ybcFGk4HaFA11Dh07WpiSdA
         DV/zJFw5vZ1i7+LeO2nnscvfppPBVNDfkOqKNhDqwgAWr2P5W893qiRxPWxylucCprZc
         QBv3PcqFvfBW6XEbRqTjvKKxABmTUOQGvtJt+30WT2PekX9HU4JqQEGdM5UOw9cWmpj7
         J2CdsE3lyycKKbIkYW1n9+A9qcayr37+NuA5oj50rXwxecRMkRMqfDjoK+HiV89worlv
         m8GLIYZU9P5Q5PeKjpxQVExiWnTT7oRlKmcTvO2sccMCW11WE5R3XkvmrHbVM5wfY/DO
         jICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789509620; x=1790114420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmWHRpNSCYIUBFB4IKMz89RjhQYOyuZ9OhQTzTXuRZk=;
        b=t7w9hYxwyXOzgqC16zCP9ROlpd0JE1z1hXUggLPbB55wRarFFAYj7yO3SYK7bFxq7L
         m4Hz1vAiiIjWDQRNvdsywv8NnFumR7iZ9L2N5D+5B3P0uicxEgZDEhT2A4ZWUM+6O1K/
         sBYVZcXZb1O1Uwo9BFvsuOQN/vmQvhDTsEcBIVmGExCW1THSAQpW/c8SSYLb3M7QsoZN
         ZG9kE1u0DmCZb5ZiDTZxXsVvNbuogCRln9nNsqnMlUsRjHFDu5lEse3NM50lKZn63mct
         pgif9uxhAmF45nXCfYl3255qHwU4krSQbqLeNOjTyWDTiRUcfOB4LvW0I98G7wB6aVqi
         McDQ==
X-Forwarded-Encrypted: i=1; AKwUvBy23DL+Beo66cofOkE0XgFgbiuLjmbbWgmTzxNjCJ66NQwuCBuVjSPe9BeCRYbZIyfCtP7kopsdj84ARgQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k5R+2HBlF60AxKYNz5KyiezFqCeJKQxKaphZIHjGVE94owOQ6r
	HptiHa6ojSIzQAzulCQ8nNEaUJ37rkdoT0yFmkIhiHTi40gGxU5tWAmKcUJXlF3k3OYWJbRt46S
	ZhCQsepL/fl2pze/7rmnWR5rvH8SVbmpMltQwbZ05Jl3DvFUD423VlBxZoCX88FAbboc=
X-Gm-Gg: AYBFou1cDUvF1Sc/ky6vzlO00cW7SDXujs9woiSxSST6pTp3gepTebcLpWLKnh5nxsi
	HUFlu7n6WWt75ZZZceqdGAwXg3wtYvskwzEqgbqgYAuFgTYfVaEPmLdCyrE714Lus7JxLShBZol
	jXVlbpxTgQeMy1fTniaEUoUjFv9be2bCTeUBqAYt1ovklXeZ/1tyap6rwZkOH53NL9ZyyUiwAsr
	/cJqs1DzNE+PBngd0IO597zL9Z2GPi+mrWv4q/rNJAX2P270ld1g5jOfm4KugZhwUCaMOncsKap
	w41Bs2bBqe/20kiMvVUcXlUF5kTzDAQot+NWc6EWzmBDhluP9WtuhHMe3aD65dV+ZKHn0WeGizM
	ghSaelLn0Vw34DqHLrTWRwemookUjdpM9nij1Ibz9JNotZkY/4kQnyoeLcoiC
X-Received: by 2002:a17:90b:4a92:b0:39d:f130:8f12 with SMTP id 98e67ed59e1d1-39e1e284702mr356294a91.2.1789509619023;
        Tue, 15 Sep 2026 15:00:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4a92:b0:39d:f130:8f12 with SMTP id 98e67ed59e1d1-39e1e284702mr356263a91.2.1789509618455;
        Tue, 15 Sep 2026 15:00:18 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1e38sm1878345eec.16.2026.09.15.15.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:00:17 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:00:07 -0700
Subject: [PATCH v6 5/5] media: iris: Add BUF_ROIMB_DELTAQP metadata buffer
 for ROI delta QP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-enc_roi_enable-v6-5-29dd4c8bccff@oss.qualcomm.com>
References: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
In-Reply-To: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789509606; l=13722;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=5Y3wceAUSis4LyEEBP3vcPhXNhSkH4aQtluUG+lkk8A=;
 b=VMwd7NCYPuGZj/VU7pQRZVW4wso0+wJxbdHC9xD7lQYNZOfwQK4N737zgzGs/cstHSxYlUpGx
 JsL3OzNZtVCBkYOSoCPYp069+1RINu/VNikN7JE4LnCRxX7/mCFK3hD
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX7IkQFMtVOn0D
 BJCZVjZTFAKDkINiLO689ECVzeOsI5rAz3CRUx+0c8SkPnK3A0VcPowj4qpXzFKmu166eIQdXZX
 TUoYTrOkYJajd3e99R+GdJo05PJTF2U=
X-Proofpoint-GUID: 4H2ArGOrBQ8NAVuhMa6ZiifMhohz5JdM
X-Proofpoint-ORIG-GUID: 4H2ArGOrBQ8NAVuhMa6ZiifMhohz5JdM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX8M0sam5pD8le
 iKflKTfEFGp/GXnLaOXupbIyWBI5tHOWKmxR7X6JZtXNLHpUrLDssh5FKXisA5rEipsJQGF7KyO
 kU2UFdtts4akP1hOgTtr2l83dtoj8SQC08VZWFXhwMO7HtQBLHt5amvf3LxFukdFUf+0qBfQ/d2
 46qviatCwfrWIt03BCopTerh0EGj0OdnlVZZHCW8Dt6hTuFpo8DNFfd/eFzvaZsaFUuTe6N7FWp
 S1juR6I8yZYBHkqhYAkBqyG7rS0XDJDEFo/wagEbWx4H/PRPr3r9Xhp8Wn+yLEYFSh79KFmMJ2y
 Df+G0KMI/b2gPRqYhJmNlpYczWkyNEXCa7gdEo9/O5cHHwGytDAKpieRrGsjFUENQfScbJHIy0L
 FXMepsOViOBevWOlXYLOIZJNzDYYZ1r6OwwDwFtiXxfU0iShKMnRiJ+fXD6e7LYfLnmfNa+OhAu
 lI+1MxHhSxdy2dwuxIQ==
X-Authority-Analysis: v=2.4 cv=ZIhCCn7b c=1 sm=1 tr=0 ts=6aa9bff4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vSfK5Sz1eu9jql6VJIMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150321

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
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  37 +++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  24 +++++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 8 files changed, 185 insertions(+)

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
index 1ce8eccdedbdeb840833bd92edb3f59dd6962d7f..2ab20cacbc2b79ac4cf28eda88b15cae332c4160 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1624,3 +1624,40 @@ int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
 
 	return ret;
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
+	while (lcu_size && !(lcu_size & 0x1)) {
+		n_shift++;
+		lcu_size = lcu_size >> 1;
+	}
+
+	lcu_size = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+	lcu_width = (width + (lcu_size - 1)) >> n_shift;
+	lcu_height = (height + (lcu_size - 1)) >> n_shift;
+	size = (((lcu_width + 7) >> 3) << 3) * lcu_height * 2;
+	size += metadata_header_bytes;
+	buffers->size = ALIGN(size, 4096);
+	ret = iris_hfi_gen2_session_alloc_roi_metadata_buffer(inst);
+	if (ret)
+		return ret;
+
+	return 0;
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

