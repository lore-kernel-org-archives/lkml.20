Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7F2419FDA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791236304; cv=none; b=U4OWPJrcPu7svPxcYNplGlVsXwiVxBQXCsh9cQ+4mH4bJ0ugsqRFixVPjCq0dsd5mGYZNxYgEuM55e87/eXDsD7W5TQZqFc4uxKOuSenpmCFJKgggrFRvQYhM6AbJNOKIkW41veSQujirWCDXrq+pvU3cfh2kqhFqjyEubTE6nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791236304; c=relaxed/simple;
	bh=+KDSubqD3jQa4/Xwz0cip6Lv8VQQCcUdHRSROJKnEUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JV1eOMxV4j/0tIMMLA1YFroCRBEhbTcpdvY9FGrJjnuhV4RdVxjixOA4Egwsc7LCqX+P1AsjbmpLrX4kiVFiL9DYmUd0eAarOtJqc77WNrb1rTx7Moe/Ys3sp13kRuQMhU+aAsJ9+kTHzMJ5swx6PL/nseaWFXLO/9cKqVM4Imo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evJIcJxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ip5YDjcY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evJIcJxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ip5YDjcY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KNVua1536840
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 21:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eu4Rut9Asvk/s5cBScnFj7XRJChy7CvGbQBU1qrOmYo=; b=evJIcJxifW2UbYAD
	Bvq65+vDA18eB9dcsY1k2vv88kC9Uc73gAwx3s21mtAQNO4gFT3JZ/4Eak5y0QXO
	kRc5l5fGwZXFf13ljQETo836xjqM1Yhp39F8JUXMXV+2+7spzGUcP3ulUdWwT9sn
	roT+UDMHb/tmVmbOsIXzNYpvc0ecWxObjYzu/mngNWDBlnByG9d23Q/fh6pXeOcC
	sqRjsaha2H6BoU+zWVkV1VTC6mjb1vvZ7DN+7KEAdioRQfoOdxXceZdlGgUt7LrS
	RUclPpqGlkPLi0YpGeB+haxyRWmXIRrRxuaeWsofrgF8fhBB+MNdkS5tKIsyOTnF
	BlTFwQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dnchm4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:38:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34ec12eb01cso389162eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791236296; x=1791841096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eu4Rut9Asvk/s5cBScnFj7XRJChy7CvGbQBU1qrOmYo=;
        b=ip5YDjcYN67nfsgOIwyZg+S86fqKkCy7dMHHwEaeY8gDd/BSN/JcGH4/pl9APZjG7k
         1l8D+2XU3nLnKSKsCu/ckSHoQmza64dVh04IJT7x4c82U7C8hGsS+nhVw2nfy05q2Vsf
         UtM2Kquz4HhiKFRtRwJpsU61ARtprXVL+KWOpfEjcGzGUImEvQU3m/whKps6O7ESUnlT
         t0IdowuO+czNVQtnEdlj40gMF5KIoatYyq2Lepf7xgLsMaZXbqHwRp868icAgoFfZur+
         UuwmfDjkoTSjfGGOx1buBiUr3nP6aCKEUzNSGED2G/TR2zUscg6ziq4vXOvBgaIDjFv2
         +Q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791236296; x=1791841096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eu4Rut9Asvk/s5cBScnFj7XRJChy7CvGbQBU1qrOmYo=;
        b=PxkTC94pbmHPMhcNiZwOlDRios+BIbAj0QIVo3S7/ilfxQ/A7VPbD6opO6KYkKmkFw
         /7c+lI7ptR7gqS0b6h0ISBX+z63UjiQaFWwq0MIEA3x6nWvyURBKzg3jrPVMcXDJte2K
         v4OyU3ubMuwIWDRXQmBscID2gf0CbemxhhVAnxzJ+j5I2OzFhyLuremN+RSyoWa012j1
         PWrSdctElh8eaucq67qN/lzPMRgsRqOKNytF1wlqiAUPrKtK3Hp7EWlRIvOFaiFwdkP9
         TynuhLawn/9H14w8X6i9U3m/suRbUKalQy57+9Gb/e8gjZr/rwjDDWMEcvY2aGYA19Nt
         b22Q==
X-Forwarded-Encrypted: i=1; AKwUvBwxsJAjjbQxkHWequib42RF5kirlFfh58XJr5FGMuak/3doGiHuoy81WWR0bFTiIdtj6C4tcS+GYv5c7+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPDAoVPlyH3HdaJcRvwLoMKOBlV8KahUFiwcjsb2R1Iy+EArt8
	0JuiGiqEOujLwooCO5f9Aq3cd5lJFmQbxiOTM57RbX7ZEXvEX03mIX0sCmD6d/TDmSwjf4a1/0B
	YzEPUwhW404h0DSx5XQsCjGqy0M7FgPQRHkDtnIsz+Qq+IcM1CChjJMSLYAcpBx+K4e8=
X-Gm-Gg: AYBFou2tnDT+HRfSOG1FyDP3o3leX1K9ak+4/DRQ3B81cijKqTSFk5cPmVM+ehU8sHD
	31JcsE83vDmcqBGjv9a55ZRuTpfLbBh8P6c0Aftfv3RtJxOy1+MtCcplCc2gGMkceg3wsi2VOMb
	BsJLlBD+t59u5jAKbRZqxe5n4llaRuxbanZaqXKZbvvRBXO1t5IQZbP4G3zUeK//qTRvJh9UZKZ
	3DLTsUlv44IwSbkxKQmVJGLDG8TVFpwyAcfE9UaCd/ExEO2SRVA8ZDpvlwre5Cz7Sr9AX7n7cLR
	nxzO+df1V1aFw6RsEONakhEhRjVEZMO9MiIgGy24HeuZv93m4+ZL/fkglaUhQsr7PpExw3tOjyn
	CLTAeXMR5U4IZssYshfjUgbcR+sNbSzUvaboa3eelPeaReVsui1LQInFol+kB
X-Received: by 2002:a05:693c:6090:b0:351:18d3:dc3c with SMTP id 5a478bee46e88-35118d3dd9fmr18193441eec.0.1791236296040;
        Mon, 05 Oct 2026 14:38:16 -0700 (PDT)
X-Received: by 2002:a05:693c:6090:b0:351:18d3:dc3c with SMTP id 5a478bee46e88-35118d3dd9fmr18193386eec.0.1791236295381;
        Mon, 05 Oct 2026 14:38:15 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm1064954eec.14.2026.10.05.14.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:38:13 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:38:10 -0700
Subject: [PATCH v9 5/5] media: iris: Add BUF_ROIMB_DELTAQP metadata buffer
 for ROI delta QP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-enc_roi_enable-v9-5-831c24135cb1@oss.qualcomm.com>
References: <20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com>
In-Reply-To: <20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791236289; l=13633;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=+KDSubqD3jQa4/Xwz0cip6Lv8VQQCcUdHRSROJKnEUY=;
 b=ppaTtHaP31d6c5S6y32aliA7iqsonJvd/OZobwFlhBP3l1Mii31i7fNDAD7qQ9AuorQza3Iur
 gYmLNvHPbdJD6RHPAPaa7SRvE8XPg4ZqfWmaXsQ/6jMD9psHtYtNZ3n
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA4NSBTYWx0ZWRfX1WK0K57jPCJS
 AFs9hpiVBXXZedCK4Zm2Ws07H8PuerxaMYEdyscx+FUiT9UMW+PNmfXy5YyIAT8aaQKMXtwV2yi
 1L4fD6X+eBSXjvtIBh5Byj9fo/lTeCg=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac418c8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HI8hsyUrwsAx7SOJuGEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: yIgBkz8LlrCoV5YTzpX2o2IqQ1CCHjny
X-Proofpoint-ORIG-GUID: yIgBkz8LlrCoV5YTzpX2o2IqQ1CCHjny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA4NSBTYWx0ZWRfX1DvvApx56xWE
 lPQDeOSLofoo6pW3isbMS2Ox6b/+gmxEccQnv15uqNEzgYCfgzSF4X+baiorCv+65IoRPWK4arg
 gc8a7MXTZlLDKI8C/2KwTtiqWtstQ7GP3kNLemDNohWQAfD2a4XbS40eSQrsz1Slf2uMSMEVywj
 9HUtI2sGkkV0d59CEBng4FawEOhX4cy+BKsf8V3iZB4qtGp34o2dFr/QI7wS3mv4dQMC3Hqrq+N
 ZeZ8SHYGRx/drQFMqjycTRKBejXCLQtcM6IzFypEinThEYzu7PjmNexRAGHKwqPyIrt4JsihNb1
 uWTUZK4lBRS+gAYUBOG6IHCrmR1l6UU5Q9Ldu+ccS64tq5MolhuqA3ljUvW0dmwBq0Y57/VFty7
 fXAadBJ3V7irhQ+wSGRNMRIGR/iBjwlF12VnP7KT8avZhydDaX1presRrk/ZTIelA1juudqJIw7
 OuccWAkwJ+noobDIY7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050085

- Introduce BUF_ROIMB_DELTAQP as a new internal buffer type to carry
  per-macroblock ROI delta QP data to the firmware. This buffer is
  allocated on demand when the application sets ROI parameters via
  V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP, and is queued alongside each
  raw input buffer as an HFI_BUFFER_METADATA packet on HFI_PORT_RAW.

- The metadata buffer layout follows the firmware-defined metabuf_header
  and metapayload_header structures. The s8 per-MB delta QP values
  supplied by userspace are widened to s16 as required by the firmware.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     | 114 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |   4 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  28 +++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  24 +++++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 8 files changed, 176 insertions(+)

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
index cd5597b2cbb69f0608fb8f21bd813e11c1f97693..fc6499598926af071fbd9f989c01e638d98efa29 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1716,3 +1716,31 @@ int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
 
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
index ef2c09485ad93719e4acc7f395899d7f67cb5b2d..d5fb33a8e2a19035a0ff5eb412ffb8167e6098f3 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -52,5 +52,6 @@ int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_c
 int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
+int iris_set_roi_params(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 0f4c6f955f4f408c45c50796332b47c116f52982..36d2517140ce67821962c200093a9887e5b6b392 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1822,6 +1822,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
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
index ea1fc96077fdce83db9c6a6c1f753ec7978b0673..4f8f0b78f7b7559d985ea627f9a3224f36fb6f18 100644
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
index 05aab6e3005d5c3788f5dfe5857f2d6b782e7a83..ba56aca5c0d102869dcf7ad6c050579283000cd7 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -199,6 +199,7 @@ int iris_open(struct file *filp)
 	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_ROIMB_DELTAQP].list);
 	init_completion(&inst->completion);
 	init_completion(&inst->flush_completion);
 
@@ -321,6 +322,7 @@ int iris_close(struct file *filp)
 	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	iris_destroy_roi_metadata_buffers(inst);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
 	iris_inst_put(inst);

-- 
2.34.1

