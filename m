Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAFF5304CF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867882; cv=none; b=CX1aVVG0Nb9hksuHs7h1+qfGhl2V+ygEktsiyNzTOnxVmLOKaEgA87srfrc/3SDZDannpsBg+NyCRZcqVTjZjfQa5PD1Aefd285qZRP7wGVcHRSpHmigQ2+8DFuhHSINrxp7uuQHbLwj/dVMwpqqvlsiOuZjCQH1AymbGkiGLoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867882; c=relaxed/simple;
	bh=tPPHUwHHX/OafuDCROjZxTGu8vj6Vjkt0HYVBYYbz8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcJmswIXLKOIV/h5r875lE0TkgoMewuM+mYq95Bu+4Vw5IfIgb5q2uxm4NJoG6uFwRR5jSOAb4fnf3gvvx+yZtpCOQ/5P+WoBv7iCMt4gnZNNhY6b53oPat/Ki6WDOlVI9BMu9kw/vcGakYZ/WGVzuEdnGWUbDL+Mk4N/YFcFa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQYuw4V1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXWzDoJ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQYuw4V1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXWzDoJ2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DilY33776367
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 15:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLmJE0DDChv5rfubAsvD/8Fv46x8jbAyJKqtR/5CyPw=; b=MQYuw4V1LbV30dUo
	/WefhWEcZ8qicDp7kllnACFyGz35J5rUNtNHBQ1WnJ2WTtYYQujJyXc0CMx51Gcj
	ahskhjVybtmBIgJq2D0ib072PPNuzfd7aru+TSV85gqlW0uIWi4S+TXqOr2kXE9R
	M5InItqrL01f38ocyTVyQ7Cgf56e2caSHj+DgMGzm3i40HMWotfesFsxjnRcrZ0Q
	B8RBnw2PDftxETyqlwxwC0AqNeSIZWnvCvYZA9J9gNi7UtshzEAKQeIqV9F7vxto
	/6c5wZKOtVMzSZxdnD+K1tArZjpWP7QIQkODQZI8jvGN7qyo5c3N2CipvyQ7NeW2
	6kvKww==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2b949n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:17:59 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14388664b04so817958c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867879; x=1791472679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLmJE0DDChv5rfubAsvD/8Fv46x8jbAyJKqtR/5CyPw=;
        b=TXWzDoJ26IM9nzzpr4DVdyqNfr+AszjeRo/96k31lnNFRAqUBSne3U1PVL9uHq/+er
         ZOPopThpen2GB8NmSPKUA9fDhEgUgdSpbNY6so3hTAgM6opE/IAORPf0q7C4qPX1JoKd
         ZnL0WKSFdsY/iBstrhFJPvrpMVsTPjW97MwyDIjfI1WBodmWKsUz2c+UNbTwNiFx+yFn
         LFgz1NPgq+FHUmquTlW1MjFOYsU4CskcgwfOIYO2rVIAZOCYa+eAyE/ixm0RKHLl8AUZ
         kZsPp4h3Ql/bPepJ38dt2mK6VJsnLLwbQbKFLSCdK+2Q7TXjL3PFU7zBCBL3zYOhHQxW
         FroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867879; x=1791472679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLmJE0DDChv5rfubAsvD/8Fv46x8jbAyJKqtR/5CyPw=;
        b=T/vBLwcF51eaecwoLeCrs2DFbPxPD2c4LHF8y13X2COZmiTwel2+7TRfM6mbm7xzyW
         u3QoH8rAxvgT9/YC+NTH4sld1N8Rtrdb9vMHYEEI869g8zInkha6PpNPQ+Gq7zvDtTT2
         0csYAF6NFUSZUryvIQ0ywM7oXyBHAnmxekZGcjXGQsy5tI/EePodQqyvCjq8Mqa2NkEX
         JNOs1bxu/NZSfu5M4cBMZ0LV7C3B+5KPCk++sKWwBsSwp91+K2S8xVqujc95XWlYzlAS
         KsU2+oW9ynshnDvyNu41EowOClmbjDnZDYraSaOzGtnpbIeqTViZ4elF/Zo/RjOmpWyC
         7sMg==
X-Forwarded-Encrypted: i=1; AKwUvBwZ0qGKB0sGVxcfCD1mAiB6EhLYimtWMql8PVKfDOV2grWKw5tFwX3yE6LZSqbvwFJearFTVRSjsB10+70=@vger.kernel.org
X-Gm-Message-State: AFuF++n07nEH9nYnFdClfQmGRZvnjT9guPNOEFhveMqWDLbOmmLd3j7f
	6+jGBEhXIhzNr7PmcQ164bOWYGidNH1vJN+3jn+J6IWixkl0+a0fqrfUicDdngyfMkK8HaOYH1J
	ncivDBMbBxkNkH3tyt1tMNNG6/qrdAMAOou19D40I8ZoqlGHGYvpjaTvnkj3cmDvt8AE=
X-Gm-Gg: AYBFou1taml+JxWrjuP/oYJBtuNHXjJH2AH5DwAowDbxW5eFu2vyk+YxVQjduFmII7R
	C0sPlhv6urwS/Vc1UJVqYWXcsLXgvW1q0M9jJm/nkOZPNXgYblqor5YSvpDzKdd787YkqpaKj4/
	4hkRsqm30TpVIUaOtJ0pbo7CFhC0eCFgDzrjeP3firWkUkYTiXSQ5wLkk6hTpH2bKHzW0MInqY7
	E0z6dBsUHUdxu1xSB7VdYyg0Xui0znDbwhogoPQxDtrRwQsAoN+9iJr3H/hs4T3hs/kGjw8f0kB
	ZFvg2fdA/TlzUk1uLNoAVVR/uujAmC/Dpu4eQHNz8n48gvLVRGUZMMgeoYMdE1SUemPRYUSU/JY
	pKcDCNVmEgrUm+9AWdgLV62FziiBrGzkbpA==
X-Received: by 2002:a05:701b:428a:10b0:143:f79:f662 with SMTP id a92af1059eb24-14dce22d73emr3187379c88.1.1790867878355;
        Thu, 01 Oct 2026 08:17:58 -0700 (PDT)
X-Received: by 2002:a05:701b:428a:10b0:143:f79:f662 with SMTP id a92af1059eb24-14dce22d73emr3187321c88.1.1790867877437;
        Thu, 01 Oct 2026 08:17:57 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f246d32d2sm115700c88.1.2026.10.01.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:17:56 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:47:23 +0530
Subject: [PATCH v4 3/6] media: iris: add iris4 specific H265 line buffer
 calculation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-kaanapali-iris-v4-3-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867851; l=6110;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=tPPHUwHHX/OafuDCROjZxTGu8vj6Vjkt0HYVBYYbz8g=;
 b=4GwYGn2JD+UI2iKHlin08jXTJrFEZZHKCh1LxQXWM4wFUOHK5y4XiEbaCpeJnT6FpDDTnYpO0
 g6D2PI2hTRvCP2zpXZzoOkVeGlsC1Rj2zq93FB4GekMrpFOkcoi0FWu
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: -M80BG5TJItUa7j6-s9jl2N5GNgmqxKg
X-Proofpoint-ORIG-GUID: -M80BG5TJItUa7j6-s9jl2N5GNgmqxKg
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abe79a7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=d6GF_uUdWyttvh-A5ooA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX/aIAOzithDoq
 6V0GMaZ/PPhYCdDks/WUndxZFaOyHEEYJSjliEOk9poHaHXFXaAcTEAbgwEaGvWlqFkCu+4ogGo
 0CZl2ayFt5FPTuue07JZAntffSLmPcg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX8CD/sVMMePo4
 kkN+V8oxEonRtbVUly1AaZKBzH4j4X6Z3a4BoyDVLPq3AEMUtWcMx6g1ybrWyVDe90vLGxsnDi8
 7abz1vAdjwWOIDkcziq0BKxBS5m4zOuzjcb18SEXYEDZMVRHZ8/nO+dNNZf2mzF3F6wGOps2V0g
 Nnup3YwmI7wcsWDrENMZCCHKLvE53QLBz0HB/5Z0jHg+uMIeJ/YhEkHuLe9PHvMTQK83ns/+AAY
 zji+JlzNNPOirBO2GU+OwjRtWRo+CvDXeMjWseeyD3XE8zUffQy2vMHKFDotzBpnL0XwyjgKeN0
 HxsPMurm6m/WFRLr/c8SbFe22fLGuSuSSonKxIkhASHrQhWxNCgdszpnRPDFOnegAAhwdF3zE4o
 JaMfa56e+d09ZTJTpDhm6AquGjvEReM6UXYIyYHkY6VgccEjIf6lHy/5LZv4N0Bh5izsVH/Zq+I
 QxG8MnFY0YYnWpZ3InA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

The H265 decoder line buffer size calculation for iris4 (VPU4) was
previously reusing the iris3 formula. While this works for most
resolutions, certain configurations require a larger buffer size on
iris4, causing firmware errors during decode. This resolves firmware
failures seen with specific test vectors on kaanapali (iris4), and fixes
the following failing fluster tests
- PICSIZE_C_Bossen_1
- WPP_E_ericsson_MAIN_2

10bit tests
- DBLK_A_MAIN10_VIXS_4
- INITQP_B_Main10_Sony_1
- WP_A_MAIN10_Toshiba_3
- WP_MAIN10_B_Toshiba_3
- WPP_A_ericsson_MAIN10_2
- WPP_B_ericsson_MAIN10_2
- WPP_C_ericsson_MAIN10_2
- WPP_E_ericsson_MAIN10_2
- WPP_F_ericsson_MAIN10_2

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 59 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 16 ++++++
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index faebb54728660cc621f8822dabf2e44ce8c55c58..a99b8030e3dd052da1b7f70b9701f88c8ae50e74 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1814,6 +1814,63 @@ static u32 hfi_vpu4x_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yu
 	return lb_size + dpb_obp_size;
 }
 
+static u32 hfi_vpu4x_buffer_line_h265d(u32 frame_width, u32 frame_height, bool is_opb,
+				       u32 num_vpp_pipes)
+{
+	u32 num_lcu_per_pipe, se_left_lb, vsp_left_lb, top_lb, qp_size;
+	u32 fe_left_lb = 0, dpb_obp = 0, lcu_size = LCU_SIZE_16;
+	int i;
+
+	for (i = 0; i < num_vpp_pipes; i++) {
+		num_lcu_per_pipe = (DIV_ROUND_UP(frame_height, lcu_size) / num_vpp_pipes);
+		if (i == 0)
+			num_lcu_per_pipe += (DIV_ROUND_UP(frame_height, lcu_size) % num_vpp_pipes);
+
+		fe_left_lb += DMA_ALIGNMENT * FE_LFT_CTRL_BYTES_PER_PACKETS * num_lcu_per_pipe *
+			      FE_LFT_CTRL_LINE_NUMBERS;
+		fe_left_lb += DMA_ALIGNMENT * FE_LFT_DB_LUMA_CHROMA_BYTES_PER_PACKETS *
+			      num_lcu_per_pipe * FE_LFT_DB_DATA_LINE_NUMBERS;
+		fe_left_lb += DMA_ALIGNMENT * FE_LFT_SAO_LUMA_BYTES_PER_PACKETS *
+			      num_lcu_per_pipe;
+		fe_left_lb += DMA_ALIGNMENT * FE_LFT_SAO_CHROMA_BYTES_PER_PACKETS *
+			      num_lcu_per_pipe;
+		fe_left_lb += DMA_ALIGNMENT * FE_LFT_LR_LUMA_CHROMA_BYTES_PER_PACKETS *
+			      num_lcu_per_pipe * FE_LFT_LR_DATA_LINE_NUMBERS;
+	}
+
+	if (is_opb)
+		dpb_obp = size_dpb_opb(frame_height, lcu_size) * num_vpp_pipes;
+
+	se_left_lb = max3(((frame_height + LCU_SIZE_16 - 1) / H265_MIN_SE_CTRL_BLOCK_SIZE) *
+			  MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE,
+			  ((frame_height + LCU_SIZE_32 - 1) / H265_MIN_SE_CTRL_BLOCK_SIZE) *
+			  MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE,
+			  ((frame_height + LCU_SIZE_64 - 1) / H265_MIN_SE_CTRL_BLOCK_SIZE) *
+			  MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE);
+
+	vsp_left_lb = ALIGN(DIV_ROUND_UP(frame_height, LCU_SIZE_64) *
+			    H265_NUM_TILE_ROW, DMA_ALIGNMENT);
+
+	top_lb = DMA_ALIGNMENT * FE_TOP_CTRL_BYTES_PER_PACKETS *
+		 DIV_ROUND_UP(frame_width, lcu_size) * FE_TOP_CTRL_LINE_NUMBERS;
+	top_lb += DMA_ALIGNMENT * FE_TOP_LUMA_BYTES_PER_PACKETS *
+		  DIV_ROUND_UP(frame_width, lcu_size) * FE_TOP_DATA_LUMA_LINE_NUMBERS;
+	top_lb += DMA_ALIGNMENT * FE_TOP_CHROMA_BYTES_PER_PACKETS *
+		  (DIV_ROUND_UP(frame_width, lcu_size) + 1) * FE_TOP_DATA_CHROMA_LINE_NUMBERS;
+	top_lb += ALIGN(((frame_width + LCU_SIZE_64 - 1) / H265_MIN_SE_CTRL_BLOCK_SIZE) *
+			MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE, DMA_ALIGNMENT);
+	top_lb += ALIGN(ALIGN(frame_width, LCU_SIZE_64) * PE_TOP_RECON_DATA_BYTES_PER_PACKETS,
+			DMA_ALIGNMENT);
+	top_lb += size_h265d_lb_vsp_top(frame_width, frame_height);
+
+	qp_size = size_h265d_qp(frame_width, frame_height);
+
+	return ((ALIGN(dpb_obp, DMA_ALIGNMENT) + ALIGN(se_left_lb, DMA_ALIGNMENT) +
+		ALIGN(vsp_left_lb, DMA_ALIGNMENT)) * num_vpp_pipes) +
+		ALIGN(fe_left_lb, DMA_ALIGNMENT) + ALIGN(top_lb, DMA_ALIGNMENT) +
+		ALIGN(qp_size, DMA_ALIGNMENT);
+}
+
 static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
@@ -1829,7 +1886,7 @@ static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
 	if (inst->codec == V4L2_PIX_FMT_H264)
 		return hfi_buffer_line_h264d(width, height, is_opb, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)
-		return hfi_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
+		return hfi_vpu4x_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
 						  num_vpp_pipes);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 8c0d6b7b5de85f7d7aaa8fc36218e8d095419569..d482906712243ecb8b5478a4419fc16cb9efd6ce 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -150,6 +150,22 @@ struct iris_inst;
 #define BITS_PER_CTRL_PACK             128
 #define NUM_CTRL_PACK_LCU              10
 
+#define LCU_SIZE_16 16
+#define LCU_SIZE_32 32
+#define LCU_SIZE_64 64
+
+#define H265_MIN_SE_CTRL_BLOCK_SIZE		8
+#define FE_LFT_CTRL_BYTES_PER_PACKETS		1
+#define FE_LFT_DB_LUMA_CHROMA_BYTES_PER_PACKETS	2
+#define FE_LFT_SAO_LUMA_BYTES_PER_PACKETS	1
+#define FE_LFT_SAO_CHROMA_BYTES_PER_PACKETS	2
+#define FE_LFT_LR_LUMA_CHROMA_BYTES_PER_PACKETS	8
+
+#define FE_TOP_CTRL_BYTES_PER_PACKETS	    1
+#define FE_TOP_LUMA_BYTES_PER_PACKETS	    2
+#define FE_TOP_CHROMA_BYTES_PER_PACKETS	    2
+#define PE_TOP_RECON_DATA_BYTES_PER_PACKETS 6
+
 static inline u32 size_h264d_lb_fe_top_data(u32 frame_width)
 {
 	return MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE * ALIGN(frame_width, 16) * 3;

-- 
2.34.1

