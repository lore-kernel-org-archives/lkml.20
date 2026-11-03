Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720505;
	b=2XS9w6P1vRXQcASUSkJi/nw+pdgf4PtxrZWGCUoy/L7PukTlt1OMH7rJE7TN7OaHzA75
	 oABvtUGKfAneqY2ZrD9yxeSKrvRENLOJU1xSuPODjanToee0AikYBoF+ZP7W1QwyWDp/9
	 +6bbaqTs/l8HvnAr6qN3CI94BNhGVBPD/9W6Vxwae/ruCDO1QlHAHEqiMXb9MtJOA9NXL
	 Q6XUPZn5z0kVCd7lkDyYOacLChgAmPQ0c6+i8rql5vwqeqb41UibIABRkdOkOSPZRbvxo
	 ZquwuTJaiP+nBo/h5SqzKpZS0kEy9jPTlZo8emMk7V/KN5oT8Xf86uJ5kIWi5uxlMqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720505;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IzMiTnrI2mz4kpCwQybjOY7oK2MvPyHCT3cH+Bb+WXg=;
	b=YSzLgruzc7fgy+PFuX3lgXo+dXsmXJHFvuGyO74tN6T21llPYXI3OMWVH6eoAhuPMX3S
	 N8ByYw3PcHJdiVNbyBF8wi83iGrGiEBzAPkYiALfFexpSAoi4vDB+4HBtL3i1wWkQj3qK
	 uyFTHEQS4AXm+nfayKgYKX+LqjJ+UnW9O7BHFUb1B0wQOCUp83/awgIZaRa1mSFC4f8bI
	 grRJdQtqdIkS/a3ID5OJIeWwtHnF4ACUchDTHQvyU2MxdgDQ/Z0rG+tWjPsM/Zst2IAGB
	 WQc47g2ycl63XhRL3ez6JH6G3J20YI49Ua/jSs5OO4Y9+MiklXBQ0os2gcIiPS7vEvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DVGckj19;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVe44aMB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D2A606D81E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14D2A606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DVGckj19;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVe44aMB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA0w22001414
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzMiTnrI2mz4kpCwQybjOY7oK2MvPyHCT3cH+Bb+WXg=; b=DVGckj198oFu7rOE
	z7qfUmTF7wlY3rKAWa/tq3acGJbiKrdsxLauA5uF6FELx+SZ0PeIvU9301LE6kP3
	sAJKqSJVQvtErGEUeAS3Whv1c2XrUJNvcs4Bkn8JSWFgDpMJF0keaI8JWRgfvy4X
	vwRRveragS0WIJQHCqRRrOMiCssTlzc27iPPGllG7GQDyxXws39dF7OaeodkD5s+
	ZWsuy6WqBF4F8VVLr44Ld467op3qRisGrARKE7mO8//NRmdfhHXWAVqW5CfV593e
	ILjUf3upQIaWWhK2FfB2L9E2HJifoe+8GPZFtORstvCNjkEyoMB76in60IbN+hu4
	Vrbh/g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5jhf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:41:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so2574746c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720503; x=1794325303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzMiTnrI2mz4kpCwQybjOY7oK2MvPyHCT3cH+Bb+WXg=;
        b=gVe44aMB2FfSQTFbqYLMYSgsofQy+VQWSCNt2/BBm8NG1dI0o5b3iNwBE0Xcc3TRUv
         TLZIxbA8nmMcLDCxHGn05clhaItpnnc/HtEF6ea6/YWS/cQoZkw1cemCDhoQdOvKvJQd
         mQhaOdmX6R+8Xws/uPwxLlZFs3UyaucYjn1gAi/n8PPS5wU9XgdyCmYaJ9jX9xfRO1qk
         0X1MArYYdfXzRK6X4zUepK1u71aYSAzKF+0DLW/cwwf/E/n+9XCdZfon1oaf97MiOjH/
         8J3c8w3l9sL2c+0L6ZsfhVSqAmNOWKyAmxwkZVWZacJVZxg0UPW7LJzbNJWOjjBYIgrK
         oIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720503; x=1794325303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IzMiTnrI2mz4kpCwQybjOY7oK2MvPyHCT3cH+Bb+WXg=;
        b=kPCb+GcZxEExrAGM2cGLr0hrOYQIKTXiBQlPuiyYNlrsMoztB8PxukbQ6Y3QOfeOIj
         fheCm0ebT+woU3iiTyXDwuT6vfZhX6pGg4DVo7rmJcFi0PK0oG9nf4YnUEVaOBNDH8A5
         MzEWTeQIBaz3RTAHc5h1px3lrxRx/C1C9h9I5trMVvpkcsAD9XFbstzRZlX2/MI+VAgF
         xqauWFDT/zu20jSPXdNvyqakvYqhfloLPfWdWtbaZdN62NZCt+Hkrl9uqXYRKWomUfXy
         cT5VfYXneK/9PPqLd7bB7vB3KcEiig+g7Gs078KaXlyiqvNHHY0094TSG1ZUPseV4lwo
         YfyQ==
X-Forwarded-Encrypted: i=1; AKwUvByf8tWw4+jamcZkJj+BO042Setc2CxqmkOZYWei8tpUROFO4suZu+offMszmLzTy2pqNzvgyJNkPiiMciw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FgVsDCeXl9MdmZE9EO5C407V6Dggkh+c2Sppvx+6z4hMHcthj
	CskH2FXM/9TmbZQJTwooVg9U/wt70Kw0HHO7ViVmNQboSi0IBL6zi4RM+W/S+qQ21u/ZCuFXy2C
	B3tuU0CWdI5AqOksmjpbAuD+Gooam4zgiad/2vZyT3HAGQttG4088p1rTBvoIcVOlJPYiLDflfl
	M=
X-Gm-Gg: AYBFou29EHUrUfmM/k691+opMNRnHK6lixl/JRNs65u4UFL2aRrdMISGVzoMqK64P2/
	FRii6gC5sZpTcvAjlrpc1VP5xVxAfeCXx2ivrnq0YaqYZDhs/nx7po8qCCcvo31pBJ/thq6Zv3/
	Pam/blAOBs1GKQ71T7txKBlqXcTTOZ6Iu4goNvFXw1p8t/74TfwvmFi/QDBP/X0fvRD9pTQdMW3
	hoFKHpqAehRCBxSGrxoqoq8W7EfLX/CZoVXy+GCdCmvIKOYkU+iLvrOrEWNvJn5A0b1UwF/Al5d
	fwQU/l9ZU99xTDEBh7Waxk1fcJOizDn3bSBzKcSeZNyjhVSrLDUFcOGppUQHpgCJSNwxEugBYKg
	8OcQcGyHCKlRfwvmY4kQLgA3QgKW92rQmP+nSU7X2Ip9Qj5OXXrjB6LATPUu8mpkQXiCDLn0XQe
	GsrpNPFIX1
X-Received: by 2002:a05:7022:f116:b0:187:7514:47f4 with SMTP id a92af1059eb24-1ac5d1cec2amr17475317c88.46.1793720503047;
        Tue, 03 Nov 2026 07:41:43 -0800 (PST)
X-Received: by 2002:a05:7022:f116:b0:187:7514:47f4 with SMTP id a92af1059eb24-1ac5d1cec2amr17475268c88.46.1793720502395;
        Tue, 03 Nov 2026 07:41:42 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:41 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:36 +0530
Subject: [PATCH v6 05/12] media: iris: Route buffers to the matching
 context bank device
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-vpu_iommu_iova_handling-v6-5-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=9250;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=vwzqT96g7rAdvP6850uz65Esg1T7NG0Rd0DqficHNJg=;
 b=8UuBwpvS4vwccuanxn0H5Go+RrU/26/Q6sNZrK6RMmg5Y8XyHBfuZqv0C1f2LuwUs7M/S46yQ
 cGVi3CeKjuABd/B07/EN1qphfhbqr/ghu3DG4zyky/F8b82HmiQnsCN
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: RINLoz4gFakkqoJDCPtNAkRXbB6jzKdP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXyo7m8gX8eDQR
 yCSEgzvqRjgrvETd8NnriR8OATZzKAUyGpHawoqlMlryCUaFF5ER7aLOfm42N4IXiH/zCro9u4M
 vmf6SHCWSU3/efhhEH9Bsw+yoItNUBY=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6aea00b8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XoEKZCkTUFqVY0t_PIAA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: RINLoz4gFakkqoJDCPtNAkRXbB6jzKdP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX5NLmxbO6V2f7
 u91AGci1Qas3jelSDjxYFOuhHrolXDuYKkB3IznfbpTpOxzhOpDoe7vtRU8pQ+gdalWDRi7nj2U
 vvKaWNnQMNEkhBwfKhfHKLl88+BzgvyM7E3NOzAWOg1Ef4CsVhLhANquZpBwr+lA3q0r7x1TUBO
 qeKWnTAYCymkKwOg8V0thDydNu+BZyGlF7cy3mUFz1Vn5um1aZHt/8lUPrty4d9MFBg8uE93SQ9
 1MVcpbw8ZeLrLE01kTQqslPkbsHL8uj7il1XPwCsqALIJTEEUnh+0dk6/La6XWnzhqxi81Kyl4t
 SovRqGWBRWP3nn7ENQiTiVGT7Lda0SXvV+xyyKBnBdMvFe3An3UKB58spm3El8U4FIoog4wcllW
 6kS6yPIjRA8EBWTXOQoLaC55YlBrdw44eGw+OqZAm0pewV6NHqa2o/2RVQLrXya14snrNye5DYE
 208FQVwkxEv7AOYNolQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range.
Add iris_get_cb_dev(), which maps a buffer type to the owning context
bank device. Bitstream and internal buffers (BIN, ARP, COMV, LINE,
NON_COMV, PERSIST) belong to the non-pixel device, and uncompressed
buffers (DPB, PARTIAL, SCRATCH_1, SCRATCH_2, VPSS) to the pixel device.
BUF_INPUT and BUF_OUTPUT depend on direction and are resolved from
inst->domain: for a decoder the input is non-pixel and the output pixel,
and the other way round for an encoder.
Fall back to core->dev whenever the relevant context bank device is
absent, so platforms still describing "iommus" on the parent iris node
behave exactly as before to maintain backward compatibility.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c    |  8 ++---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++++----
 drivers/media/platform/qcom/iris/iris_resources.c | 41 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +--
 5 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177f5e1ab83b90a3c8c80e0b4d1f02e..6e03d13ac1a792c539bf8fe6d26354aa29d7b3a2 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -531,7 +531,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 				       enum iris_buffer_type buffer_type, u32 index)
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
-	struct iris_core *core = inst->core;
+	struct device *dev = iris_get_cb_dev(inst, buffer_type);
 	struct iris_buffer *buffer;
 
 	if (!buffers->size)
@@ -547,7 +547,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 	buffer->buffer_size = buffers->size;
 	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
 
-	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+	buffer->kvaddr = dma_alloc_attrs(dev, buffer->buffer_size,
 					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
 	if (!buffer->kvaddr) {
 		kfree(buffer);
@@ -650,10 +650,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 
 void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
-	struct iris_core *core = inst->core;
+	struct device *dev = iris_get_cb_dev(inst, buffer->type);
 
 	list_del(&buffer->list);
-	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
+	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index 545bbe75e1740eb872f59a45f0cd9becaa2fed51..aa5d05a1d910634c70ca7b07e11327b154079df2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -245,25 +245,26 @@ static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
 
 int iris_hfi_queues_init(struct iris_core *core)
 {
+	struct device *dev = core->np_dev ? core->np_dev : core->dev;
 	struct iris_hfi_queue_table_header *q_tbl_hdr;
 	u32 queue_size;
 
 	/* Iris hardware requires 4K queue alignment */
 	queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ)), SZ_4K);
-	core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
+	core->iface_q_table_vaddr = dma_alloc_attrs(dev, queue_size,
 						    &core->iface_q_table_daddr,
 						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->iface_q_table_vaddr) {
-		dev_err(core->dev, "queues alloc and map failed\n");
+		dev_err(dev, "queues alloc and map failed\n");
 		return -ENOMEM;
 	}
 
-	core->sfr_vaddr = dma_alloc_attrs(core->dev, SFR_SIZE,
+	core->sfr_vaddr = dma_alloc_attrs(dev, SFR_SIZE,
 					  &core->sfr_daddr,
 					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->sfr_vaddr) {
-		dev_err(core->dev, "sfr alloc and map failed\n");
-		dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
+		dev_err(dev, "sfr alloc and map failed\n");
+		dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
 			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 		return -ENOMEM;
 	}
@@ -291,6 +292,7 @@ int iris_hfi_queues_init(struct iris_core *core)
 
 void iris_hfi_queues_deinit(struct iris_core *core)
 {
+	struct device *dev = core->np_dev ? core->np_dev : core->dev;
 	u32 queue_size;
 
 	if (!core->iface_q_table_vaddr)
@@ -300,7 +302,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	iris_hfi_queue_deinit(&core->message_queue);
 	iris_hfi_queue_deinit(&core->command_queue);
 
-	dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
+	dma_free_attrs(dev, SFR_SIZE, core->sfr_vaddr,
 		       core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->sfr_vaddr = NULL;
@@ -309,7 +311,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
 		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
 
-	dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
+	dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
 		       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->iface_q_table_vaddr = NULL;
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 883ef7e752915243e6a2cbf0b459cc83762f4c5a..9dbf209e3d4c0ce8c75341ce87be1ed87eedc6ee 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -12,6 +12,7 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_instance.h"
 #include "iris_resources.h"
 
 #define BW_THRESHOLD 50000
@@ -140,3 +141,43 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
 	return 0;
 }
+
+struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	struct iris_core *core = inst->core;
+	struct device *dev = NULL;
+
+	switch (buffer_type) {
+	case BUF_INPUT:
+		if (inst->domain == DECODER)
+			dev = core->np_dev;
+		else
+			dev = core->p_dev;
+		break;
+	case BUF_OUTPUT:
+		if (inst->domain == DECODER)
+			dev = core->p_dev;
+		else
+			dev = core->np_dev;
+		break;
+	case BUF_DPB:
+	case BUF_PARTIAL:
+	case BUF_SCRATCH_1:
+	case BUF_SCRATCH_2:
+	case BUF_VPSS:
+		dev = core->p_dev;
+		break;
+	case BUF_BIN:
+	case BUF_ARP:
+	case BUF_COMV:
+	case BUF_LINE:
+	case BUF_NON_COMV:
+	case BUF_PERSIST:
+		dev = core->np_dev;
+		break;
+	default:
+		dev_err(core->dev, "invalid buffer type: %d\n", buffer_type);
+	}
+
+	return dev ? dev : core->dev;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db095ec05e53c894e048285f82446c6..a9a5bddb19c24917de4c5dba52567934b77e5c59 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
+struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d5c3788f5dfe5857f2d6b782e7a83..f41a00cf698af32602c25fa50c1ce817b313f483 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -126,7 +126,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct iris_buffer);
 	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	src_vq->dev = inst->core->dev;
+	src_vq->dev = iris_get_cb_dev(inst, BUF_INPUT);
 	src_vq->lock = &inst->ctx_q_lock;
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -140,7 +140,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
 	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	dst_vq->dev = inst->core->dev;
+	dst_vq->dev = iris_get_cb_dev(inst, BUF_OUTPUT);
 	dst_vq->lock = &inst->ctx_q_lock;
 
 	return vb2_queue_init(dst_vq);

-- 
2.34.1

