Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC86392802
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134122; cv=none; b=aBgT4sYTUfB8kj3XnhIrRSYvkOwjnvW7QA9szOxcOggjSTJ+xcCwuM7gXZ9t59nDsoix7JWQhd/wiwqLNs0+ufHBl7BKyWXx93undfTxuK9i3bqFRxWhYuB7ymVy6skN2VXN1uErfYO9K2H0RoPKk9QNCgL8rKUy8O7LPC2O+po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134122; c=relaxed/simple;
	bh=d7DoZGxXmBTMEh6miraAWbbRhEVsOJTv1RurUoDyzRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jdqqLWG6NIyYN6zzcCkHZN2RszBOQNdkItyUvm8R0Ul/YpYPhSbBfs15P4RQb5y+AUKrocjBwbN7kvrX5jarXG+ULAHB9E4AxL/GBEwRRx7YcZgYyOo8leU+Fz9jRY3PE0PYlegNKV+26P621GbNt6AmmSdn4bHNL410FlisW2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Urv4uzQK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYq+bJO3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Urv4uzQK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYq+bJO3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXO5x268297
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	akDL6vAW1ZtwmsqI1nhcqQqLQtuOREwfWnRLwSt4onk=; b=Urv4uzQKYoFG3rMJ
	u9j4LV/LAApSpi+eABBX9KoNLnt6eqIXhqkTPEYUwN/IzFe3IMPgv8pGhTC6AL3K
	rUGbp3TOPDr49Q9U8zHuLfwJlKa62zRj9nzCK8S6wg9LVALhxcLxhmOOKLS+VH/F
	lmQigeRbhmLVrKk+1OiPEsGzjQAECYomC5AwJ6qj/fJd9Q6ZaiqYJpZWDPa+1vf9
	p9pfxGQBk+28HKSt3fkc0oev36nlHCEFaS0TgFfWphg9jp9are12VeCugFcTUwpn
	C0DN37e3/tTboBZ+s8xcpR2AAm2Yf9ELykOOEm9kPLuIDg57kG3EHgLGf0qk5m0i
	JwC0OQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c1y2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso618358a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790134118; x=1790738918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akDL6vAW1ZtwmsqI1nhcqQqLQtuOREwfWnRLwSt4onk=;
        b=JYq+bJO38UCcEuU2+208hTJPWeYZWwuqFxeWnMxh/ZH/PnHbQFm1OgL197dvxoOxQS
         zWsI+Z1e2wCY/vaaQcT3J+l24DkX4sqja3sSLIGWoGM9rsPtQsQtLyY+80xr3ACxaQMY
         p6ujmB+kcIjGU8Hv82Guf/B3LwoihOyb4YvvDN4k3DcRBCcy1gewRIJFiC8uKSJXAy8F
         Yq2Q5ihesB+4mZ4iNzvmmx0Jrb5AMoK7Elly9Cv7dyjRM80djJPQUVMk/KhJovKYl5LL
         ha+Tw6brmcL+tbF+n3zo8XxaG2kslIwNiCfzEDlftA0qDrLivW6vTw8zIOk6O8KhqzZO
         sV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134118; x=1790738918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=akDL6vAW1ZtwmsqI1nhcqQqLQtuOREwfWnRLwSt4onk=;
        b=T3qqNEyXmvxDKJjMFM/wGNilcPwHtrEjL0wGXKh195TU0TYKRDgZPS+K4YXk13C84b
         cA9HLZhuGlGBaJiKlgFoP6zlwdNjCw/rHx98DJIB2VLkB6YoJMa2TsunSNclrgPvWv9z
         a8j8IqoWHlCc2ts7Alg/WuHer+vVcTf0FEo0QwiHvtzTIVWwpKGggcjxtLgcUv6l6h8Y
         itTkmI/TfqtrWhqmogoju6w/U6zUMZLDubVzkApbl7iwETIlYre+Hqfe25/Klw3kaO79
         pWjlHDD9JIPLPiDuLVQ70p+Kd93yZMGuFn4yRTf8x4DWCT9p6drcbHes0dNiuvNkQDsw
         fmbw==
X-Forwarded-Encrypted: i=1; AKwUvBxUzyGttVTOQcY0lgNrXS5BxKr4jYL4RZ0hwrdc9sY7jF1kq37FTt/BzAyTYF3KFuf20RuFdM7YBs9OJF4=@vger.kernel.org
X-Gm-Message-State: AFuF++lRocfzItWns5btD8h6FKPrXH8PKzNE3vUvNZi32YM7RbZYAFYC
	nzzilgScg/37WN0hlYDsTaowx5xcnKJSdBAR7YD1nPqvCmuCiojq8pJ0orFrw7McuuwCO1NuAAL
	knqPKPB8U3AIckP6GrUgd9iCn3zoZ+4Snr9s0bOHBI641P+VaWQPhcQh/bVIAI9WN9FM=
X-Gm-Gg: AYBFou0Xdio5y4WhkyNXJAiqa3WmD+mKCYuJJ7fsk94B27aXo3pj0LmEyNxOZj4eAvp
	Ry+6YpEV7McD++HD4WidqDrHlTEQTUwd/wpkAjc+/w0M510oghU0lXYerFJePJSb7c7VwoLqmaf
	YffANUSdejDqoEGGMzgPHBbdbjq+93s/Lv82IyMvz7pFQYaYs5+GVTpHcUe2mKr2xZPDwYupMlW
	hgIpmZtBk4JZi+PuI0ZeiDI3jkconjxqo/UH172aFFqBYPfMPAsPVdXaks5/kWRaVjlMvtUkHb8
	a15UYtY9vGISDxpPcX8mfw27nWq/aPAq9gYPzA1VCZlf97HVOIfsxQpY34EV2lPn+2ZYOYr3tI+
	glhmxeIdLOdYCLBtXEuJWKo8EJg6Z2Lj4Z0ZTVqscYGn1L/LFmRDb68DafDC4pf4R7nXi2egfz0
	CTo4VwTSdu
X-Received: by 2002:a17:903:245:b0:2dd:ad74:ac21 with SMTP id d9443c01a7336-2df69db6180mr12082515ad.28.1790134118340;
        Tue, 22 Sep 2026 20:28:38 -0700 (PDT)
X-Received: by 2002:a17:903:245:b0:2dd:ad74:ac21 with SMTP id d9443c01a7336-2df69db6180mr12082335ad.28.1790134117835;
        Tue, 22 Sep 2026 20:28:37 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3733sm3603525ad.41.2026.09.22.20.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:28:37 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:27:54 +0800
Subject: [PATCH v2 4/7] media: iris: add VPU5x internal buffer size
 calculations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_hawi-v2-4-016ec3d24b79@oss.qualcomm.com>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790134092; l=6705;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=d7DoZGxXmBTMEh6miraAWbbRhEVsOJTv1RurUoDyzRI=;
 b=Bue5huOOfbzCEuSl/l2y5hOKK3KQpkyPfJgiU328+nRpUU9hEZsKCadk8Xs+cFrQsDEGCgdSf
 XHRXPTiroA3BpKBNPRx6l4MVzcV4rJM9PFvAYK0c6J25f89hLrZTjNd
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: Kq76hmFF1V9RsYSIqnRTLuu-SX7yYUIp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX8O9LUuJz3Y/n
 eS+RqovsSL1ZmuCc4KREnF+Wde9NJ4l9wu+N9C50xfBoeoHo+gq8Y+rpT4wfpIpI5MuXxCx0fFK
 Bi2kr7SR8biQzT/Q8PqLpiMBHzYQUuw=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab34767 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TQKVwlwO4xRIBFL53c4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Kq76hmFF1V9RsYSIqnRTLuu-SX7yYUIp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX/FsjPpvE47SS
 pCpyv4NC+4OHSdu1up9JOd1heQC/ZCGArhPDclcXSt3ayvlceD/FbdexZygOmV7VaQ4sCxNQjI/
 Tu4YdkjJlpUZb6gyx0xamn9TvF4cGL9fWatMxa9k44Dks3JB3jAg/qJahyywsr/x/X4QRjuxN/T
 GiVZel3Y7u172KHzxy2kRLBkH8fHPO0LDCCCXEJQc/QAtzrISBfA8eBLZFxwLpT5T7KkrRD3yT7
 sztp8P51V+fhPWjUXBABtJAPF9a4lNE2vaEsZEEHP4bcRhnY0sOeeSEXzakAHQQfrohP4PSsRZ+
 NFIrlqJPMYRxlJKZbKzlAfWx/UeElMfcfdG4WR61xr6Uzb+wm6fYr7GD1WVW99w0y+QWAE6bFVO
 EqpiD8dJOfa1F8DM4UI3t/HVl72GMktMXekvdhdUuyol98Tsfs0EpEPDuK2JVP7yOxVvlDAEiAF
 H/e5BK/W9nXnsl4isbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013

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
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  4 +-
 2 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index bb8135bd238b670fb5806120493b2603d9c2b0fb..cd00785a04870620c04bc4b52b35eda3c730bc93 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1895,6 +1895,54 @@ static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
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
@@ -2222,6 +2270,51 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
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
index c7020931a642f0484b6f84af7ab51242e1845458..46210a2ec4942642ef61fc09cb0cc414f109607f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -64,6 +64,7 @@ struct iris_inst;
 #define VP9_UDC_HEADER_BUF_SIZE	(3 * 128)
 
 #define SIZE_SEI_USERDATA			4096
+#define SIZE_SEI_USERDATA_UNREGISTERED		256
 #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
 #define H264_CABAC_HDR_RATIO_HD_TOT	1
 #define H264_CABAC_RES_RATIO_HD_TOT	3
@@ -121,7 +122,7 @@ struct iris_inst;
 #define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
 #define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)
 #define SIZE_BSE_SLICE_CMD_BUF ((((8192 << 2) + 7) & (~7)) * 3)
-#define SIZE_LAMBDA_LUT (256 * 11)
+#define SIZE_LAMBDA_LUT (256 * 13)
 
 #define HFI_COL_FMT_NV12C_Y_TILE_HEIGHT (8)
 #define HFI_COL_FMT_NV12C_Y_TILE_WIDTH (32)
@@ -289,6 +290,7 @@ static inline u32 size_av1d_qp(u32 frame_width, u32 frame_height)
 u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu5x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif

-- 
2.43.0

