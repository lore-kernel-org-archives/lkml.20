Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F1030D40E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296095; cv=none; b=F1X+Kx63jM5nnpWO0IcdntJYELLRNMqXKdSad/WpvCyW1AqCZy5FVC9wBSRJdwiYhiO1AifJj6TjHHM4fzr0d15HCw3trDYmfD8VPCCHkiMwOJm5KcDoxOduEsH647gM5Ny06oIsF/7xDsX46H3ocdGVACLJQD0kj+n9j0ec1y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296095; c=relaxed/simple;
	bh=F1xOH8Cv2QTO/PdtpfpJ4A2wP9Yac1w7ltfZ9UagIk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1acJ1symXvlUhqtaVtigubvSF7vM+N86xPZWB7DFdXA6L/y5Fp8/Tan0PCKieElAJf0+A2j5Fh4M7SbhTohyE3snSRBL3yZ2u0zWmp7AtUFsaQxKs4qc5JZ1dJcF85j+thKKmrRqIic9mUSSFLqtQD0L1auZrdvB4ZXulvT62w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+HAWHsI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxCKGY6V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+HAWHsI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dxCKGY6V"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMPPG34088175
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWiDRPUxvuc+Oi4qfhXW5cAHNiKdMjmxsxbPvaFsH0c=; b=h+HAWHsIMGgK7Qj4
	ExmKf2L3OWaQxQNKfuRVQpARTzUWQb+JIR7f0jve63wOXuUtwcp+UeuqLj6LueM5
	EVAN4DqfCTFaWbP28Ii6Yolsig+oEZFnvB+fpl1swqnLFn/xVWbjZ+46qeYkY5DJ
	MmNr2K20pFFxyw8iPik8Gu3e6zUtibLO/NkL9XpUbVRlEEKyiTKtkKtGtYXnnTBj
	6MaUfpv8Zm+m1XuJcGMpuZsxn921Q7AXB2dvsOy1ClossqPAXacJ/4aTOWCO9jy9
	b9Mpz92iJWzlj/7jaOSgY/NoDv/rxDc8Eb+8SYDH9JewTG+DEIiNuRe4NGRISkad
	t9yKwA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s936qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:28:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c0b54834bso31051eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790296091; x=1790900891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWiDRPUxvuc+Oi4qfhXW5cAHNiKdMjmxsxbPvaFsH0c=;
        b=dxCKGY6V/DSmnb4rGOXiYY9oRWvNurKvAXQ2ShwDJcZ+AJqHkzXfeK96iRiJSibXbI
         VUPiN7pucgARe/ovEqfyQ3Jv3Y+k0N0BEKWJrnhtjQi9azTk7N6tGa4H1WPxN+tmtb82
         L1pN6hs6fcgT7BMhm2qAH7uplfnUkchTvJ51GN4CXGv6Y7iDlBmYqDiryb8S7bbgbpX5
         IT8oYAZvUke6qAVRv0NzKhxRnDEEfBKAaUCn/4yk9SKvTSP8qOTSsy0D+L971fvMbL1m
         hM8AKjcTczhQNE8NV8pSE/leD3xHyMB2MYvOBDvlo9I3oYjCE3kDklXfSJja61qCceMF
         dN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296091; x=1790900891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWiDRPUxvuc+Oi4qfhXW5cAHNiKdMjmxsxbPvaFsH0c=;
        b=JANqAs/sxBclbW3VSSFmLofmgqlDy0TUt6ZR90gBUYguwukNTCn0kCSlFaoQdu6Ycm
         v0R/3goNJhc6rJKJYfuSrCdBQ1Iwspa+WY0fUc/CdkF+fil/oZfkna0cS31sID9rACbZ
         TxOX8qbNYS83PClXW6jS7uAuKyULRFCFt57ev6JpTNXxBoLknvMY09DFxQ27cwt1Wmvl
         /5WbLkdNu7+uo7ahUsIQNjbionqmiOlvSzXEKMszerq9DYTFxZewMoc6+97AHBfsc62t
         B1yRVSorNK29A+02e+ymqgHZnnBY3K1aeu0zG8uJLoQWErepmrFUChCssmGOqzsvoNlx
         wIFg==
X-Forwarded-Encrypted: i=1; AKwUvBxuyl8h/fVqjtHuYEBWWKDDiZ96GurcdnYcS5cbqifgrYzmq8eOhmWfuB69BIEP1umVJvUvG306zaLCKh0=@vger.kernel.org
X-Gm-Message-State: AFuF++nRvhCqChToLwHqoysqg9xBSnb7xQzwds+QjbIZGsSyHWrWvVO8
	Sb2DJWwC8gYGD1jl2H8vo3STc4ZR6leUk3OzkwgqHubb8YYQcyccPexh25E1irTLAI8Q6nf401v
	rIJI4Dtnz4we5PK7Qcz6z2zLzoXbgmFhaCpT4OyAfYl3AXDKCbsA6IyN+j9vptIy/+kg=
X-Gm-Gg: AYBFou3cnWsXpd9zeDieY25XSbRecgseq2TrOH2dcVGRpDfSUwJAxr+nIYMT4kOh7KD
	7aKQVZgVJnfn99uz3k5agVIH7SpuJlNb8ETw8A7LNYL9Lx6h3YIL7JZ3OBUH3Ecyzvw9TFcfHmt
	isc5jh/vWfzZhp2TcaibyhgQpnRsgy5zGxF7J7SHA42p3EebTyXfW1xRuqDxegzek8+x4WhN85w
	bkw5nZbtoD8/Ct4HJo6Jwt0ZpIIi2OYVkd0Wj5pusJ0XrQaqaMcaafdaNFotK0QAhe+ybAnnvkb
	OPeQAEedtC8nspqYPKHQ0ZbncyqA/wpC8oVhRINIsllN+lbKjxY8RFWTWT9w+kQfFOj9d60c3IT
	O4MtzFW9sF4FiNGj7qakwZLLRK2dbwYFeTr5HrAfgHpFfe06pTfgOctaSpznW
X-Received: by 2002:a05:7300:d507:b0:33f:3750:4e22 with SMTP id 5a478bee46e88-3400181e307mr7020363eec.0.1790296090596;
        Thu, 24 Sep 2026 17:28:10 -0700 (PDT)
X-Received: by 2002:a05:7300:d507:b0:33f:3750:4e22 with SMTP id 5a478bee46e88-3400181e307mr7020312eec.0.1790296089816;
        Thu, 24 Sep 2026 17:28:09 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414485a9cdsm1873736eec.16.2026.09.24.17.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:28:09 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 17:28:05 -0700
Subject: [PATCH v7 4/5] media: iris: Add HFI metadata buffer delivery
 support for Gen2 encoders
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-enc_roi_enable-v7-4-6fa7413af23c@oss.qualcomm.com>
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
In-Reply-To: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790296085; l=13161;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=F1xOH8Cv2QTO/PdtpfpJ4A2wP9Yac1w7ltfZ9UagIk8=;
 b=0AZclOLHgJb52PM33CYduThs+EuIW2111mHA/vuTv5MnSpMbVMMsRXMwvCWoul3P5aftPIWLA
 lWGus99OHMCAkVifGe268V6nqDTdkilBXixYpQagdu36gEIyR3ho3nu
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfX29OuB90aGOqf
 JqBn/uu6spJqM8VlrJau1MVg5Zdf4ukm1YBSKNDDb7FkVtacERZSaWmntQVl4Joyr01lBbacDAq
 IsMuPfSMysDqQP1fGNl2gATsXCqLNKY4mippiIRIeq3EMXXtFJvuBR6MX265DnGfPfZypoeGudL
 r66/5Z0sHwQ/A6HD/3OlEmwhZs0tFMyt0Xqt+gyyuOvWMcbUNQ/571qIOCpmgtF8MvOsuwL3cLN
 FRgj07Jfj5RvWU6krov9FKw1g23jwQTKAcIMBMCSqWPts3xxDmWHZckLuk85UAseQ74VTHLWqIw
 cyhQUwazpAQ2oyeam3yFFvRK6i4fMJUt9MC7rrcbE/kOBoSd5yQPSN3HMuFzlOb5idE4hmN/Lsz
 3x+AxsCn41HMo6Y4h40/8fS4/QY3kb1JIMX01jK1PSN7vPAUmqJ7lv/61rqAW5tc9/aL6MEDDCQ
 u/RYMUtI22LqgV47M6g==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab5c01c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gkYz9yhuOFcMo22kqTsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfXzC5UoFREGgjN
 4uWI0Wn6kkOhFi02X3yL1J2jwJYXS8jDaIQ2f+uO2XWPEqQ6zwmDrtZLQCANvWejTy1isa4LFrx
 vzPPwBTvVIDm1WVasNDjHSfnOvHJb0w=
X-Proofpoint-ORIG-GUID: Y8DoHem9nsSMshoBexEdR1V5D1FYXhHc
X-Proofpoint-GUID: Y8DoHem9nsSMshoBexEdR1V5D1FYXhHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250001

Add the infrastructure to deliver metadata buffers to the HFI firmware
on HFI Gen2 based encoders, used to carry per-frame ROI delta QP data.

Metadata buffer structures (iris_buffer.h):
- Add metabuf_header and metapayload_header structs describing the
  metadata buffer layout as expected by the firmware.
  HFI defines (iris_hfi_gen2_defines.h):
- Add HFI_CMD_DELIVERY_MODE (0x0100000A).
- Add HFI_MODE_METADATA (0x00000004) to hfi_property_mode_type.
  HFI command side (iris_hfi_gen2_command.c):
- In iris_hfi_gen2_session_queue_buffer(), after queuing a RAW
  (input) buffer, check for an available BUF_ROIMB_DELTAQP metadata
  buffer and, if found, append a second HFI_CMD_BUFFER packet for
  the metadata buffer in the same command, tagged with the same
  buffer index.
- Add iris_hfi_gen2_subscribe_metadata_delivery(): sends
  HFI_CMD_DELIVERY_MODE with HFI_MODE_METADATA and HFI_PROP_ROI_INFO
  to instruct the firmware to expect metadata on the input port.
  HFI response side (iris_hfi_gen2_response.c):
- Add iris_hfi_gen2_handle_output_metadata_buffer(): locate the
  metadata buffer by device address and transition it from
  QUEUED to DEQUEUED so it can be reused.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.h     | 18 ++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 16 +++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 39 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |  6 ++--
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  3 ++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 27 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.c       |  4 +++
 10 files changed, 114 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index ab8e5d953101a786ade20540ee3c3ed226160cbe..ee2d24bb69c57220b0a735d9b4aae4434a33daf6 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -107,6 +107,24 @@ struct iris_buffers {
 	u32			size;
 };
 
+/* Metadata buffer header */
+struct metabuf_header {
+	u32 count;
+	u32 size;
+	u32 version;
+	u32 reserved[5];
+};
+
+/* Metadata buffer payload header */
+struct metapayload_header {
+	u32 type;
+	u32 size;
+	u32 version;
+	u32 offset;
+	u32 flags;
+	u32 reserved[3];
+};
+
 int iris_get_buffer_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 9f84d28d00ab25555f1d2259f7ef0ed0786a0271..1ce8eccdedbdeb840833bd92edb3f59dd6962d7f 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1608,3 +1608,19 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
 
 	return 0;
 }
+
+int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	int ret = 0;
+
+	/*subscribe to metadata delivery only if ROI is enabled */
+	if (!inst->fw_caps[ROI_PARAMS].p_array)
+		return ret;
+
+	ret = hfi_ops->session_subscribe_metadata_delivery(inst, plane);
+	if (ret)
+		return ret;
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 5180d53d3c904cad460b2760913b475d0ff1bb55..9957b69366f50310338a0c1470d9744592655c33 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -50,5 +50,6 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
+int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519962cb958b0e330a6d018310c3450..5692375cdd357f9b00760053ffff5af4bd9cce9c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -131,6 +131,7 @@ struct iris_hfi_session_ops {
 	int (*session_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_close)(struct iris_inst *inst);
+	int (*session_subscribe_metadata_delivery)(struct iris_inst *inst, u32 plane);
 };
 
 struct hfi_subscription_params {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07b7bcd8db21d4345bc900356b4ec3..cf88dbe11e8e9faef826e661d8e9909fd7f16b94 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1307,6 +1307,24 @@ static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
 	buf->timestamp = buffer->timestamp;
 }
 
+static struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
+						       enum iris_buffer_type buffer_type, u32 index)
+{
+	struct iris_buffers *buffers = &inst->buffers[buffer_type];
+	struct iris_buffer *buffer = NULL;
+
+	if (list_empty(&buffers->list))
+		return NULL;
+
+	buffer = list_first_entry(&buffers->list, typeof(*buffer), list);
+	if ((buffer->attr & BUF_ATTR_QUEUED) || (buffer->attr & BUF_ATTR_DEQUEUED))
+		return NULL;
+
+	buffer->index = index;
+
+	return buffer;
+}
+
 static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
@@ -1359,6 +1377,26 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 					inst_hfi_gen2->packet->size);
 }
 
+static int iris_hfi_gen2_subscribe_metadata_delivery(struct iris_inst *inst, u32 plane)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	u32 payload[2] = {HFI_MODE_METADATA, HFI_PROP_ROI_INFO};
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_CMD_DELIVERY_MODE,
+					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+					      HFI_HOST_FLAGS_INTR_REQUIRED),
+					     port,
+					     inst->session_id,
+					     HFI_PAYLOAD_U32_ARRAY,
+					     &payload,
+					     sizeof(u32) * 2);
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_open = iris_hfi_gen2_session_open,
 	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
@@ -1372,6 +1410,7 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_drain = iris_hfi_gen2_session_drain,
 	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
 	.session_close = iris_hfi_gen2_session_close,
+	.session_subscribe_metadata_delivery = iris_hfi_gen2_subscribe_metadata_delivery,
 };
 
 static struct iris_inst *iris_hfi_gen2_get_instance(void)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 08fc1036013de29e51747a6425ae7bb805ca3e0f..d0661f5fe6a6f39295dad8950edb2f1a85893216 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -20,6 +20,7 @@
 #define HFI_CMD_DRAIN				0x01000007
 #define HFI_CMD_RESUME				0x01000008
 #define HFI_CMD_BUFFER				0x01000009
+#define HFI_CMD_DELIVERY_MODE		        0x0100000A
 #define HFI_CMD_SUBSCRIBE_MODE			0x0100000B
 #define HFI_CMD_SETTINGS_CHANGE			0x0100000C
 #define HFI_CMD_PAUSE				0x01000011
@@ -175,6 +176,7 @@ enum hfi_flip {
 enum hfi_property_mode_type {
 	HFI_MODE_PORT_SETTINGS_CHANGE		= 0x00000001,
 	HFI_MODE_PROPERTY			= 0x00000002,
+	HFI_MODE_METADATA			= 0x00000004,
 };
 
 enum hfi_color_format {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07d830cc8502ab5f28001312991ba8..aeb0426a05694f219f82145cd84a28287ed3075e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -100,9 +100,9 @@ static void iris_hfi_gen2_create_header(struct iris_hfi_header *hdr,
 	hdr->num_packets = 0;
 }
 
-static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
-					u32 pkt_flags, u32 payload_type, u32 port,
-					u32 packet_id, void *payload, u32 payload_size)
+void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
+				 u32 pkt_flags, u32 payload_type, u32 port,
+				 u32 packet_id, void *payload, u32 payload_size)
 {
 	struct iris_hfi_packet *pkt = (struct iris_hfi_packet *)((u8 *)hdr + hdr->size);
 	u32 pkt_size = sizeof(*pkt) + payload_size;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
index 25b9582349ca1a0ce6efc0b146a3abb798485c45..613eb500609f745daebdcbdf9a25b85cb9465a79 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
@@ -121,5 +121,8 @@ void iris_hfi_gen2_packet_session_property(struct iris_inst *inst,
 void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
 						       struct iris_hfi_header *hdr);
 void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct iris_hfi_header *hdr);
+void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
+				 u32 pkt_flags, u32 payload_type, u32 port,
+				 u32 packet_id, void *payload, u32 payload_size);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8c2644c7f6e85983d7ad7584fc0cb570e4813ae4..84b629b957442c024dccc18b354ac9a7e541abaa 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -77,6 +77,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
 	case HFI_BUFFER_PERSIST:
 	case HFI_BUFFER_VPSS:
 	case HFI_BUFFER_PARTIAL_DATA:
+	case HFI_BUFFER_METADATA:
 		return true;
 	default:
 		return false;
@@ -452,6 +453,30 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 	return 0;
 }
 
+static int iris_hfi_gen2_handle_output_metadata_buffer(struct iris_inst *inst,
+						       struct iris_hfi_buffer *buffer)
+{
+	u32 buf_type = iris_hfi_gen2_buf_type_to_driver(inst, HFI_BUFFER_METADATA);
+	struct iris_buffers *buffers = &inst->buffers[buf_type];
+	struct iris_buffer *buf, *iter;
+	bool found = false;
+
+	list_for_each_entry(iter, &buffers->list, list) {
+		if (iter->device_addr == buffer->base_address) {
+			found = true;
+			buf = iter;
+			break;
+		}
+	}
+	if (!found)
+		return -EINVAL;
+
+	buf->attr &= ~BUF_ATTR_QUEUED;
+	buf->attr |= BUF_ATTR_DEQUEUED;
+
+	return 0;
+}
+
 static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,
 					     struct iris_hfi_packet *pkt)
 {
@@ -499,6 +524,8 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
 			return iris_hfi_gen2_handle_input_buffer(inst, buffer);
 		else if (buffer->type == HFI_BUFFER_BITSTREAM)
 			return iris_hfi_gen2_handle_output_buffer(inst, buffer);
+		else if (buffer->type == HFI_BUFFER_METADATA)
+			return iris_hfi_gen2_handle_output_metadata_buffer(inst, buffer);
 		else
 			return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index a945992f63aa8a0c40b8d6bc473d0bc90270e6cd..21ba9639d17b2c64e8fa33b4aacbd1946fc4dae2 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -498,6 +498,10 @@ int iris_venc_streamon_output(struct iris_inst *inst)
 	if (ret)
 		goto error;
 
+	ret = iris_set_metadata_delivery(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		goto error;
+
 	ret = iris_alloc_and_queue_persist_bufs(inst, BUF_ARP);
 	if (ret)
 		return ret;

-- 
2.34.1

