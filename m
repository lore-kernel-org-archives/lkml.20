Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA173E9C16
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459879; cv=none; b=YaXm3+ZtsnHzegJIiDGzZkJO9zCEX2iWp/oMWvv0CMkIl5y7ZlqXtTHaJY5bRF5BkmIykHU1fMW1W6tD9Lkb/3+BDsh5SmSnnbxKls29JNrTynOL5C1YrKAKOauPw8Z64gGtmxepfgCPCQw3KyOixbMA434tuHlH7HkrjaVLnVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459879; c=relaxed/simple;
	bh=nupwLSsfW8cD12YHy2y3+6n2CWouaD66aibHIiQuKQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYaEcVfTeIqcH74gKqNNQaCpcwLiZ7O+8M/z8PfAH/mqXYYcVCWHOIJv6U7W4pGoz08CVZwkhuKx3DXl/ZiOPD6MsK0q6BZ808NM88ACbKiErum3zofdCey63NHRSGb+xWyqeWtMcgJ+aaadl6LYO+fMaZ37TfxxtVQM6UrqIUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5HUkg8r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5tO6haA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5HUkg8r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5tO6haA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZBRc2983702
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RrU10MxY4/YKN+GrpdRQ3Um2janr/NZ+BpP3hMIbOrE=; b=T5HUkg8rutfMWG8o
	qhaJIqBphnu5E0X/RxmpXMZaFlJ2DkH9bp3+3x2yK3tOR3sO4/0b+scI3t+6E45W
	/NUO9CBS7UD7N4xUucwGi+QhmIMunW6jY4mUJYJdl/2cBqhHoRU/LF2tFWXKGn7i
	oFuQ7jmwTQpAbw5cJrmEktEI12Ac+2otaH8SuUEk836g4C5v+o+KUVdRFe0lXpJX
	uPB9CGSgZlgCv1iVHR7VhS8mLxBtUvlpoQcoF+Z0JpvFwtWyn85eGdlHxdKO5NVw
	BD0Gz+oQ2O2oRvoqsG43835ktntLpD1aRtFNwhr642ZZi2uo4Xms7UeOYijmp6ww
	jyCiNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet3764-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0c7126e7so450218085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459874; x=1790064674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrU10MxY4/YKN+GrpdRQ3Um2janr/NZ+BpP3hMIbOrE=;
        b=I5tO6haAhEP6Y9E46lWi4i9ozrA7NtEyYTLNzPL/JYr+AvsBEMJ3dA6h8sMQEwsKgt
         9rYmn7WU7bx4vvdtwmWKdJukMNRxluEr0UllzUjzcbnDlBQR5RMGjD5qfkS/nDrCcTiK
         afiOM80UtuLtWAZI5LX2izT48bJxi03Kwlcbi7HYCFW/rOa+vMLK4BOB2gf6ezWQxxqZ
         avi9gJ7fbpwb7i3fk7vSJU++U1tnugt33er6A860Jlfi9b/z2sE07/L1YXlwvmwNAhB/
         nZe7iqdPQuflwS0IYtoVWKbH8RVMug3Utsal7JoCmN0h9NatAmQ0LdFptlYcj0Ff9nWV
         h+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459874; x=1790064674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrU10MxY4/YKN+GrpdRQ3Um2janr/NZ+BpP3hMIbOrE=;
        b=fxynQDBC4lAzpZZ75Sh2nB8Ob4jem7wXnitpR6iBxakEUx8e/1dWNvTaIDlYeCgtRX
         CHRAac+ueWCANrzDYBMIKUmaMIOygJc0+PFm2LUs6srLVXSv6xJmbD0HCLqyK1uTrIDF
         7ct6F1cv/0PouqqfR0K6C8py1qUnmntATuuR/zopAYRr7pLNPD6KONlLz8n3LzA6L5Br
         Y9JVoGWufSeucEnLtxQMMa5HJ/nB1XPOM8fcqIIaXOk3LtuNfStCquoQyfIeUbO5ydMu
         VI6CQStPylllkvE4k9tTiHkvSDNmC/QkhDHWLX2R0s7YvNkLmcyBTofg8ZX+h+WufjEV
         Ev/g==
X-Forwarded-Encrypted: i=1; AKwUvBypB6cFVruowVvAp584KVEZAJu83S/tlju85KfWcDPTmiwM1r1OGksTfySbWkpRMUiAIaRbgSfAdsuKmHM=@vger.kernel.org
X-Gm-Message-State: AFuF++mjZIf+0Jwg5MxGDpGsXlkpklcSCUOW0vsNxDqfDkOOgspgg95L
	WS5tltVwJviL4hLdiavn3l00vuqJg2cFjtONZsLXVgyNEt8J4nacze4a5hf5KOuGMa3KDNQQvwg
	1UDTwY7w82Ucp+xj+a0NGqpks3w6+h0BHT684z7rnFiyevBdT32bpkiIik0xYKBxNIQAZPmjtTi
	z6Rw==
X-Gm-Gg: AYBFou1HSWmrgeDE/QIYNMD85Lf0PPiDNIugUiNLoEHMbdAMzslR0w9IhhN6Cl2zRXj
	AXAGDKqynpS+BEWEj1wI6QxxzmDNtQP6ScvFl8jgQvoTt/K+s6WRUduPyGZWzHBr5a6jK2xXq/N
	5VBObg4FUQBjo147vsY4Sn9dLIQIZWRboglXYYe2T07i7BM1Mwv/HjeJGL2lHUd+bI/PMVHW31h
	+vRpdqobDRN1WN1kazCQPLJQUPIYN/tdpyMm7iCWBjcnVL23pDJV60SyR9aHWLMHMMGIXAOapKS
	n90eACFgZeNffu/MfJ2E5CpjowUBSYF5qsRF0OW+7ojEfgP7xqAFNZXO72IrCmO2EVesyiCoK8l
	hIG581LFVxS/TAMhT575o/3X871/HrzmLk75w5hloIlDjYfMQ3ZDkUBGMJ/wEvjUx8n5iMngq/s
	orDAeIzFGLCEFppsFHhIRSAK93iiI9h1eX0bMSkd/0btsqvAI/5r0=
X-Received: by 2002:a05:620a:90ca:20b0:93a:3d22:312b with SMTP id af79cd13be357-93a3d225797mr50221085a.50.1789459874339;
        Tue, 15 Sep 2026 01:11:14 -0700 (PDT)
X-Received: by 2002:a05:620a:90ca:20b0:93a:3d22:312b with SMTP id af79cd13be357-93a3d225797mr50217185a.50.1789459873787;
        Tue, 15 Sep 2026 01:11:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:13 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:08 +0200
Subject: [PATCH v7 5/9] media: Documentation: uapi: Add qcom-camss ISP
 params documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-5-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX6oKAIeEC6mg5
 XiF5Ezhoh3/0tvORpFRFw78636k4PW4wmXFJZkFJ0/cKMHKOlis/2PrvFdlxsW2xQ5oN2zn0oco
 yLPCP/jV24rDpkHzLZGwOA9fTrscBXo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXyrSFFFjbHlxz
 qtW54uv38/DOkr0Y0aCH/s92RqDTAOB7BXxK566Pr8r2ta+63Nz/VUCk1wQ3D1DN36d9R08Uauf
 PShc1Yp2+E4Huv0QnBvdPe90evVOSnAo6MCXCNwhakB5mp56A6YkRph+PQMTIPyVtbFDdn0KGtd
 aKo/14GYDmARcIy6o+WMEn4IquW98+CtX5ANHSn0asQxeNU4oxdasRfAGcLWFIqmx7bcbmOb/Gj
 66OJXXqCnGpSvte4vY6Gghnt8kHqAQhCHlfwac3rzscT7fiXU+p8Fep4rlPbnRCF4+WHeS3F82j
 dNGPEZdUITCRoG24E5UzswPjxo1Ef0F0qUc8wGhVO23BoJHYESqE8sOXUe1ePsjqhxnj50MAHUx
 nV9BpGtqGqcosRy75kStH1VvPHZWJXFJT2l6DXjG1AN8bMTk2unNF4To84xQ7PlDp0Xuw7K/ME1
 GGsASCkx6xbeRRoOvrA==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa8fda3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=JtaNpV_pjNJlRh9r0yAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Nc7TnW1u5SqEwj5wwPih3nryTq405pjA
X-Proofpoint-ORIG-GUID: Nc7TnW1u5SqEwj5wwPih3nryTq405pjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

Add documentation for the Qualcomm CAMSS ISP parameters metadata format
(V4L2_META_FMT_QCOM_ISP_PARAMS). The format is built on the V4L2
extensible ISP parameters system, with per-block structs defined in the
qcom-camss-config.h uAPI header, and is designed to be shared by any
CAMSS ISP engine exposing a parameters metadata output video node. The
Offline Processing Engine (OPE) ope_params node is the first consumer,
with additional engines expected to add their own parameter blocks in
the future.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 .../userspace-api/media/v4l/metafmt-qcom-isp.rst   | 145 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 147 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index b5455229837e707c24e134438d5e2fd12cb3bf37..25b46af4d9f7faab37000076c530e9aad5b4a076 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -20,6 +20,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-intel-ipu3
     metafmt-pisp-be
     metafmt-pisp-fe
+    metafmt-qcom-isp
     metafmt-rkisp1
     metafmt-rppx1
     metafmt-uvc
diff --git a/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..da3dd5f3a5899d4c24c80c74b56e3e7b62b3ad50
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
@@ -0,0 +1,145 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. c:namespace:: V4L
+
+.. _v4l2-meta-fmt-qcom-isp-params:
+
+**************************************
+V4L2_META_FMT_QCOM_ISP_PARAMS ('QCIP')
+**************************************
+
+Configuration Parameters
+========================
+
+The ``V4L2_META_FMT_QCOM_ISP_PARAMS`` format carries image processing
+configuration for the ISP engines found in the Qualcomm Camera Subsystem
+(CAMSS). It is passed to a metadata output video node using the
+:c:type:`v4l2_meta_format` interface.
+
+Rather than a single struct containing sub-structs for each configurable area
+of the ISP, parameters use the :ref:`v4l2-isp` parameters system, through which
+groups of parameters are defined as distinct structs or "blocks" which may be
+added to the data member of :c:type:`v4l2_isp_params_buffer`. Userspace is
+responsible for populating the data member with the blocks that need to be
+configured by the driver. Each block-specific struct embeds
+:c:type:`v4l2_isp_params_block_header` as its first member and userspace must
+populate the type member with a value from :c:type:`camss_params_block_type`.
+Populated blocks must be placed consecutively in the data member, and the
+combined size of all populated blocks must be set in the data_size member of
+:c:type:`v4l2_isp_params_buffer`.
+
+The set of supported blocks depends on the CAMSS engine consuming the buffer.
+Currently the Offline Processing Engine (OPE) is the only engine defining
+parameter blocks, exposed through its ``ope_params`` metadata output video
+node; additional engines and blocks may be added to this format in the future.
+
+Blocks whose header does not carry V4L2_ISP_PARAMS_FL_BLOCK_ENABLE leave the
+corresponding hardware module bypassed. Blocks omitted from a buffer keep
+their previously programmed configuration.
+
+OPE processing pipeline
+=======================
+
+The OPE is a memory-to-memory engine that reads a Bayer RAW frame from its
+``ope_input`` node and writes a YUV frame to its ``ope_disp_output`` node. The
+parameter blocks configure fixed-function hardware modules that the frame data
+passes through, in the following order:
+
+.. code-block:: none
+
+	 Bayer RAW in            RGB domain                      YUV domain      YUV out
+	 (8/10-bit)   +------+   +------+   +------+   +------+   +------+   +------+   (NV12/NV16/
+	  ----------> |  WB  |-->| DEMO |-->|  CC  |-->| GLUT |-->|CHROMA|-->| DSC  |----------->
+	              +------+   +------+   +------+   +------+   |ENHAN |   +------+    NV24/GREY)
+	                                                         +------+
+
+The stages, and the parameter block that configures each one, are:
+
+.. flat-table:: OPE pipeline stages
+    :header-rows: 1
+    :stub-columns: 0
+
+    * - Stage
+      - Module
+      - Parameter block
+      - Function
+    * - WB
+      - CLC_WB
+      - :c:type:`camss_params_ope_wb_gain`
+      - Per-channel white balance gains and black-level / pedestal offsets,
+        applied to the raw Bayer data.
+    * - DEMO
+      - CLC_DEMO
+      - *(none)*
+      - Demosaic: reconstructs a full-resolution RGB image from the Bayer
+        mosaic. Always enabled; not configurable through this format.
+    * - CC
+      - CLC_CC
+      - :c:type:`camss_params_ope_color_correct`
+      - Color correction matrix applied in the RGB domain.
+    * - GLUT
+      - CLC_GLUT
+      - :c:type:`camss_params_ope_gamma`
+      - Per-channel gamma correction curves (256-entry LUTs).
+    * - CHROMA_ENHAN
+      - CLC_CHROMA_ENHAN
+      - :c:type:`camss_params_ope_chroma_enhan`
+      - RGB to YUV color transfer matrix.
+    * - DSC
+      - Downscaler
+      - *(none)*
+      - Chroma (and, when required, luma) downscaling to produce the requested
+        YUV subsampling, e.g. YUV 4:4:4 to 4:2:2 (NV16) or 4:2:0 (NV12).
+
+The input node accepts 8-bit and 10-bit packed Bayer RAW formats (for example
+``V4L2_PIX_FMT_SRGGB8`` and ``V4L2_PIX_FMT_SRGGB10P``). The output node
+produces semi-planar YUV (``V4L2_PIX_FMT_NV12`` / ``NV21`` / ``NV16`` /
+``NV61`` / ``NV24`` / ``NV42``) or luma-only ``V4L2_PIX_FMT_GREY``. Each
+configurable stage is bypassed unless its block carries
+``V4L2_ISP_PARAMS_FL_BLOCK_ENABLE``.
+
+The following example populates an OPE parameters buffer with a white balance
+and a gamma correction block:
+
+.. code-block:: c
+
+	struct v4l2_isp_params_buffer *params =
+		(struct v4l2_isp_params_buffer *)buffer;
+
+	params->version = V4L2_ISP_PARAMS_VERSION_V1;
+	params->data_size = 0;
+
+	void *data = (void *)params->data;
+
+	struct camss_params_ope_wb_gain *wb =
+		(struct camss_params_ope_wb_gain *)data;
+
+	wb->header.type = CAMSS_PARAMS_OPE_WB_GAIN;
+	wb->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	wb->header.size = sizeof(struct camss_params_ope_wb_gain);
+
+	/* Unity gain on all three channels (15uQ10, 1024 = 1.0) */
+	wb->g_gain = 1024;
+	wb->b_gain = 1024;
+	wb->r_gain = 1024;
+
+	data += sizeof(struct camss_params_ope_wb_gain);
+	params->data_size += sizeof(struct camss_params_ope_wb_gain);
+
+	struct camss_params_ope_gamma *gamma =
+		(struct camss_params_ope_gamma *)data;
+
+	gamma->header.type = CAMSS_PARAMS_OPE_GAMMA;
+	gamma->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	gamma->header.size = sizeof(struct camss_params_ope_gamma);
+
+	/* Identity curve (pass-through, gamma 1.0) */
+	for (unsigned int i = 0; i < CAMSS_OPE_GAMMA_LUT_SIZE; i++)
+		gamma->glut[i] = gamma->blut[i] = gamma->rlut[i] = 257 * i;
+
+	data += sizeof(struct camss_params_ope_gamma);
+	params->data_size += sizeof(struct camss_params_ope_gamma);
+
+Qualcomm CAMSS ISP uAPI data types
+==================================
+
+.. kernel-doc:: include/uapi/linux/qcom-camss-config.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c9dfb48e900df71a86d4686d3ec2c..b5593f814b60fcbcd88f4b4aad25880d19825dc0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22363,6 +22363,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
 F:	Documentation/devicetree/bindings/media/qcom,*camss*
+F:	Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CLOCK DRIVERS

-- 
2.34.1

