Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF4D3DAAC0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705770; cv=none; b=dy/0kM0FGpQJcJ3tiZTu4AFt62I22JPIv2wLBMZr8BZx99PjSYvILqIscPI116SGTrwicDJTD80pQ4o5VKoY8GSNIHw5HeAfj8hESCdxONv47DguKHQnrurb3rAGc+DRRxvf5za3twiCmVmMN3ZrmbLNfMU/he9d3a8xwBGlS5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705770; c=relaxed/simple;
	bh=SLS2J/inJ/xz1uivwN9BV3DhzJjwQFdcgOgS4Ib0jys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xg8H4c3XnpNyg694rOMhHvSYXCwDHCOu3KD5UtpXCMcAms3M2SA8WdTO4XYE3L/M/d6VOg0uiPIZkXypzbBHNGINF6aarWNOnHPexBuQHyOFewXgpn+2KpROIzATR17bz6du5OwZzCkpEjbyeaqtI+QbvgyjuKCw5VxsU50FSKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMowxlnY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/iSWKam; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMowxlnY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/iSWKam"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2UWlv262860
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCIBXw9ShbhLlQUDUJ12iBhDL+xTV61EhMEc4eN+bNE=; b=aMowxlnYR9fTaDsA
	jufzVGOm1uR0zB2j4iiEi7CWN+TvHYejXlmo4rdacNy/i/gQS3lMDwRoi9aedD50
	SprOgAefz4wewZE77kmPcYqQ6R38O3gAkmXIaEZFSKOThD6CTqJ1BR9htbTaAX4k
	an3W4yI6JigdO8yzvTyexWXvRFYpUCulRVlKuprzSJ/DcPYhjVYgbZvRBS7le7x2
	feHQItIKeiKPvlPW9ijk3iGrbiqA0u/zyXoUwP3iRpFAdDkYOIzOTwojmuOfUKkk
	CIrH//pDD2WZ3yErL7uvNLt1zDbVSevcY/2jIBT5KX1zt7k44f0P7xb3AxpbmbiK
	wYo70g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg41a6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so412420a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789705766; x=1790310566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCIBXw9ShbhLlQUDUJ12iBhDL+xTV61EhMEc4eN+bNE=;
        b=a/iSWKamgm3zMCA7+XP1F+OfPQ8PkfJm80CIf1aI14/+uJTbFUJgCv3X9Hs4ejzugL
         rWkxsvM7c0laHUipX6sk1gxj21J/JFQ0WTG3bDJRA1E9kmB3IMiw36b/haC/bEK6mrth
         o2fJA51+l5pjQriNjwPCfc9SG/HCEZVIK0SVUXTtb6NSc/h63JtsFnv0cG4c1n8ujH5+
         Rggiy1WGI7FqLBUt0md2VCJTwc/b0xAkK4Z7pArQj/+JtHw17JH0FTRYzjdeSW5ig7Kg
         bDQSk+aqIPFPM/Ryii1DwgTuy9cgiNaFaC7vL/X3rB1ISLzjYlWzDl7S8wgERxL0GmCS
         pznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705766; x=1790310566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCIBXw9ShbhLlQUDUJ12iBhDL+xTV61EhMEc4eN+bNE=;
        b=f4n5GfY4t3i1se8MuFYRCusAPlV3xnVMi1oMs9EH9xdXmfip6Fp2r7vBFwDfS12OS/
         /07vxUnV3Kk/IDHRm3+6ok65lSTjwDZMBpziaU7Y/3+7LJ8Bcasu7Jj67Sc4AmKn2kmS
         iL8dtc3kHm5Kckq9N3wdyY4h7D9y//ICJP23PiUM1+q8U1qOnzTjDZ71DU0aKb023iyM
         nRaxLc/5uaZxjJJn/WfrnrunHFCtYXck2sH4fnmHWUxAUIch+5AiUsUoZxya38t91hNj
         g18WGrIGrpgDw2zHa2WcUcLfw7luqf0sIddmQiuQhh337nMT6ugZxT1FdfhXX5LOm0ds
         dLMg==
X-Forwarded-Encrypted: i=1; AKwUvBxombI4F3J5co0rPAZlMzEjth/gV+cym8ob2NHQbxr4SOFR07zWY5lS5L5uMCS7usgZCQgfwNvXXtE+aOI=@vger.kernel.org
X-Gm-Message-State: AFuF++kubYdcx8LWMZ3PZYOfNUrGUxjxh6x6iRlku75x5d2WFFCWSQ5A
	s0coNjD2iJm9W8XD4hv6kxTAmmd2hDro8wypIBr6CwR4T4MZhyDlgs2NdrKKr2eTTsC7edEILOA
	Sd9unxcDb0bfelhD4BO7mmrACBwy5cwfneXyIEdqYhklsRBKwlf5cRNTcan8aHgRJnEA=
X-Gm-Gg: AYBFou0w33P5SxvIGgcgNLA2HZnZwOuNI2y3BtxEEGP7WWyhmqvekdUSTMf6D8sJEnH
	ckeiLUuPWIcAHemt/CBM3iFljMTV53IK6hccvV19mwHKQUZJozJgsHVcqb4Qq/muLdRIg8WVIXQ
	bpptW8F5jGuC6aGx5mWi5zcrZWA8ISBcW9Y6dc7g3zA/LfI2KQZlKj7l42L4QgFAXZTFVh7/Olb
	qrx+fqRFdOby67ZQNSPcpWiGIx7HABJz5J8gazVV42xCY4wbTr/VkW3mOSpFtK/LYq79Fv7b2R3
	XP6Z5E9cvx42EDHT9zPXurDNVJvSHx1VOD4NHyLDNdDr2UAXauHeQl0tL/TluCW0NMGUjrGvtx6
	tjiN4JAP0KuRElng48YqOnEBy9Iszzl8=
X-Received: by 2002:a05:6a21:1f89:b0:398:8870:b58f with SMTP id adf61e73a8af0-3dd8c36b679mr2696758637.14.1789705766482;
        Thu, 17 Sep 2026 21:29:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f89:b0:398:8870:b58f with SMTP id adf61e73a8af0-3dd8c36b679mr2696723637.14.1789705766023;
        Thu, 17 Sep 2026 21:29:26 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c4dba322sm214595a12.10.2026.09.17.21.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:29:25 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:28:44 +0800
Subject: [PATCH 5/6] media: iris: add VPU5x internal buffer size
 calculations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-add_iris_for_hawi-v1-5-ac60fd15c98b@oss.qualcomm.com>
References: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
In-Reply-To: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789705735; l=6876;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=SLS2J/inJ/xz1uivwN9BV3DhzJjwQFdcgOgS4Ib0jys=;
 b=dtcoH7e8zZ8GVz2n+cLkdmEugNu5REVW8os+9FFJKtfpPcf4VYusV+gbNJW2n2XbDMx/RA+IH
 ECaaD+X0FC3CM5zEW9g1Wv2w1MQZRemJm804IkzkDdWL9YXURtQfcQl
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: YeX-UOe6Zqp2aKR6dlY0OuRK8bb7SsFQ
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aacbe27 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TQKVwlwO4xRIBFL53c4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: YeX-UOe6Zqp2aKR6dlY0OuRK8bb7SsFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX4EyTEC3Aigbc
 Axco7ywZTduQyQhfhS4+asQ68cj9+PkQiwvxW6wun9xgvJEcqFTuYwzxNqxhoAIR0T62XSIExaZ
 By0aVnGSliyOlinCeJ2v02Xq347zZhYU9Z22kT7Xwb6p46u1uz5dZKYFpGYRFVfLiNfcDv9gP4H
 H7XEvRv0GSUYeigRqrEp/TmAJYERzm/IZ6jxY3pEBOiqpjhhGeG8WRWUsqtDH6FewHesm4ZkHWL
 kb2Oy2nELEGcGKcpvkaHqMd1pzKetkiTMFzTeyw7Vb0Jchs3pHLKgfzzXNQgBfLTIWzjaL/LP3Z
 6U8KUYgzVPIFFwoZryOkw9CkAIGhgyzNnCewkSPoJ4GSoGsK7WzWQKWQDF6SBHM9lKgAAiNbymj
 SocAQnEGGyQnGrwtqlsu25MQmsMSOLBw4l8C7B0pFYOTZbXySE+qRZAa9TAP3rbMXMFgr94eEG8
 1JFFdiLyfb5qTQCXGDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX9ZPzLf0Vdwh/
 A6vT6t/CHJPkhOSiSuR6oDjeRyupPwRrKWtFNmFyhjb0Zw/2La+boPHIxgT+Ap7giR/MuQ7r77N
 gIrlCoF8Trrr2Zpic4k4V452Zl+Noyg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180056

VPU5x firmware uses internal buffer formulas that differ from VPU4x. In
particular, the H.265 decoder persistent buffer needs space for SEI
unregistered userdata and three-dimensional userdata, and the encoder
calculations use a larger lambda LUT size.

Add a VPU5x buffer-size dispatcher and a VPU5x-specific H.265 persistent
buffer calculation while reusing the existing helpers for buffer types
whose formulas are unchanged.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 93 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  5 +-
 2 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index faebb54728660cc621f8822dabf2e44ce8c55c58..9a44d627b413fa61c7d97cad95d182d3107b9ee5 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1868,6 +1868,54 @@ static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
 	return 0;
 }
 
+static u32 hfi_vpu5x_buffer_persist_h265d(bool rpu_enabled)
+{
+	u32 slist_buf = SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265;
+	u32 frame_info = H265_NUM_FRM_INFO * H265_DISPLAY_BUF_SIZE;
+	u32 tile_info = H265_NUM_TILE * sizeof(u32);
+	u32 per_pic = NUM_HW_PIC_BUF *
+		      (SIZE_SEI_USERDATA + SIZE_SEI_USERDATA_UNREGISTERED + SIZE_H265D_ARP +
+		      SIZE_THREE_DIMENSION_USERDATA);
+	u32 dolby_rpu = rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA;
+
+	return ALIGN(slist_buf + frame_info + tile_info + per_pic + dolby_rpu, DMA_ALIGNMENT);
+}
+
+static u32 hfi_vpu5x_buffer_persist_av1d(u32 max_width, u32 max_height, u32 total_ref_count)
+{
+	u32 comv_size = hfi_buffer_comv_av1d(max_width, max_height, total_ref_count);
+	u32 seq_hdr = SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA;
+	u32 per_pic = AV1D_NUM_HW_PIC_BUF *
+		      (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM + SIZE_AV1D_ARP + SIZE_AV1D_METADATA);
+	u32 frame_hdr = AV1D_NUM_FRAME_HEADERS *
+			(SIZE_AV1D_FRAME_HEADER + 2 * SIZE_AV1D_PROB_TABLE);
+
+	return ALIGN(seq_hdr + per_pic + frame_hdr + comv_size + HDR10_HIST_EXTRADATA_SIZE,
+		     DMA_ALIGNMENT);
+}
+
+static u32 iris_vpu5x_dec_persist_size(struct iris_inst *inst)
+{
+	struct platform_inst_caps *caps;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		return hfi_buffer_persist_h264d();
+	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		return hfi_vpu5x_buffer_persist_h265d(0);
+	} else if (inst->codec == V4L2_PIX_FMT_VP9) {
+		return hfi_vpu4x_buffer_persist_vp9d();
+	} else if (inst->codec == V4L2_PIX_FMT_AV1) {
+		caps = inst->core->iris_platform_data->inst_caps;
+		if (inst->fw_caps[DRAP].value)
+			return hfi_vpu5x_buffer_persist_av1d(caps->max_frame_width,
+			caps->max_frame_height, 16);
+		else
+			return hfi_vpu5x_buffer_persist_av1d(0, 0, 0);
+	}
+
+	return 0;
+}
+
 static u32 size_se_lb(u32 standard, u32 num_vpp_pipes_enc,
 		      u32 frame_width_coded, u32 frame_height_coded)
 {
@@ -2194,6 +2242,51 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 	return size;
 }
 
+u32 iris_vpu5x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
+	u32 size = 0, buf_type_handle_size = 0, i;
+
+	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_dec_bin_size         },
+		{BUF_COMV,        iris_vpu3x_4x_dec_comv_size   },
+		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
+		{BUF_LINE,        iris_vpu4x_dec_line_size      },
+		{BUF_PERSIST,     iris_vpu5x_dec_persist_size   },
+		{BUF_DPB,         iris_vpu_dec_dpb_size         },
+		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size    },
+		{BUF_PARTIAL,     iris_vpu_dec_partial_size     },
+	};
+
+	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_enc_bin_size         },
+		{BUF_COMV,        iris_vpu_enc_comv_size        },
+		{BUF_NON_COMV,    iris_vpu_enc_non_comv_size    },
+		{BUF_LINE,        iris_vpu4x_enc_line_size      },
+		{BUF_ARP,         iris_vpu_enc_arp_size         },
+		{BUF_VPSS,        iris_vpu_enc_vpss_size        },
+		{BUF_SCRATCH_1,   iris_vpu_enc_scratch1_size    },
+		{BUF_SCRATCH_2,   iris_vpu_enc_scratch2_size    },
+	};
+
+	if (inst->domain == DECODER) {
+		buf_type_handle_size = ARRAY_SIZE(dec_internal_buf_type_handle);
+		buf_type_handle_arr = dec_internal_buf_type_handle;
+	} else if (inst->domain == ENCODER) {
+		buf_type_handle_size = ARRAY_SIZE(enc_internal_buf_type_handle);
+		buf_type_handle_arr = enc_internal_buf_type_handle;
+	}
+
+	for (i = 0; i < buf_type_handle_size; i++) {
+		if (buf_type_handle_arr[i].type == buffer_type) {
+			size = buf_type_handle_arr[i].handle(inst);
+			break;
+		}
+	}
+
+	return size;
+}
+
 static u32 internal_buffer_count(struct iris_inst *inst,
 				 enum iris_buffer_type buffer_type)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 8c0d6b7b5de85f7d7aaa8fc36218e8d095419569..46210a2ec4942642ef61fc09cb0cc414f109607f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -64,6 +64,7 @@ struct iris_inst;
 #define VP9_UDC_HEADER_BUF_SIZE	(3 * 128)
 
 #define SIZE_SEI_USERDATA			4096
+#define SIZE_SEI_USERDATA_UNREGISTERED		256
 #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
 #define H264_CABAC_HDR_RATIO_HD_TOT	1
 #define H264_CABAC_RES_RATIO_HD_TOT	3
@@ -116,11 +117,12 @@ struct iris_inst;
 #define SIZE_AV1D_TILE_OFFSET     65536
 #define SIZE_AV1D_QM              3328
 #define SIZE_AV1D_PROB_TABLE      22784
+#define SIZE_AV1D_ARP             9728
 
 #define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
 #define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)
 #define SIZE_BSE_SLICE_CMD_BUF ((((8192 << 2) + 7) & (~7)) * 3)
-#define SIZE_LAMBDA_LUT (256 * 11)
+#define SIZE_LAMBDA_LUT (256 * 13)
 
 #define HFI_COL_FMT_NV12C_Y_TILE_HEIGHT (8)
 #define HFI_COL_FMT_NV12C_Y_TILE_WIDTH (32)
@@ -288,6 +290,7 @@ static inline u32 size_av1d_qp(u32 frame_width, u32 frame_height)
 u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu5x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif

-- 
2.43.0

