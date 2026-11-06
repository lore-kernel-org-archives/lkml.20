Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973343;
	b=c/9ca+GU3npYGBL/5lQWyLhup0/4y7XFMZxUq3xlmqg66gr3jIyW+uRw+XbV75n2JtCf
	 Osso5+9uNWATXuhwYbQmvx7PFPhsI3r723ugh4B83Lz71cn29yNdD9K6hqVkTuLtvZI0C
	 H3CTwuJbwBgtfXDP4sQ/aIl4rd7adrPC7g2KOdeuZgEXs4neQHs1meNuB+Jb4ODYc5WBp
	 /SnzdpO/828li66syBFiPEa5urUUEekSpOHueXrKnATVUKQJE9KImJuTokH+X/04d9hVz
	 lxVPDEDPV+x2taT6VqXPEQOSvj4hAxi78s4c30Bj5YLycKJf3e+CulGeB17F7Vrducw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5XyZUDkR6hNXTjrZPWq6NTK8zRtLjTIm0cxng3P1XAQ=;
	b=Jt/w3/kdStCh27eo4Q/aIINUomDqoqEP82+tIUVFXbnKWdNu5U76gaAlgjo5oiPlXOj6
	 MSOQYNv9uelWGFqjSNf6F09kesMeAlmCylU74L8yYa7d7YmCCKfRIRU4YcLzJlJopxzxo
	 xnMA45V5qPZtJdZckmInGKi3gwWSrF5pYmfGI0mCd9VBAt2ICAAUV2Cn7wfvc8Hv8cLFH
	 5zYbjVtmK5pNZX7iP29/OwZC6cxXF/JR1bzQHCNPQd3wRabLdbL/3E4L+jZwR+vqkLKUJ
	 uV95GI3a44mAtAcfxbusVZBzBat18NT6oMmssJC71cauEHa6ffpSqCgcHknBZcnatVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4YvrZVa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="J/v1pdmX";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C8B6082BD3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84C8B6082BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4YvrZVa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J/v1pdmX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Do6673173681
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 13:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XyZUDkR6hNXTjrZPWq6NTK8zRtLjTIm0cxng3P1XAQ=; b=A4YvrZVa+U+AiA+s
	DacDeA7iW7QDZvr54Nfr0uH46isVmJ0iPc5dgBObemnqHJLfBEXy+wDbrBbecaJX
	j2jzaoa6eXtLs0SRVysyv5IuJcFZN38VFYe9puGWfcUeOA2U4a8gl8c2stkanxIc
	4xcEwn2TXGc6SSuuO3GO+2LJg+vBA00XJMLLLg6wyDEAF0FhC+ehKNSqrvwmoe9D
	B512ev/TfdTMO6MB9MowFR7TSgfPZT+iBnFtGU2hSch8CLEtcdMOnwb0Dv2PcDcq
	OVmg9IlHDLbl/z71v5+ctzNXtjdmtviGsJPJCw45inIHmY5CXh3yEGIv7lD4CliX
	FCYNVA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9b374-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:55:42 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99939c0007cso34320241.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973342; x=1794578142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XyZUDkR6hNXTjrZPWq6NTK8zRtLjTIm0cxng3P1XAQ=;
        b=J/v1pdmX/SQGpRb7r1CIJasiLnlCx2sz+WFjmEE0YDb16ofYVHiMsqzdUKlEE7RsP8
         4NmzSE8Udg8diOd8fbDcBzBLPPGZiTTGesx07XzVUFsi2U9VGFXVt9tjlQNf9KHEBPW+
         20XrSscnQjC3V0bQ4x7Xv8hj0eCXxfQqKsgnxStgZ0ouLJlsIHYRegwW2LW32ZyEA92A
         pgAOd7Cee85aOaxKoaqBKrs17R39Hq1vfom6ew5kJK2AjC/eICWKoCGqyjsfjEnBgUlR
         GYzdkRVMCPXSRxnFeRYgliPIy8CUozRPJ3Z3RvCwvj2u0kgrehtbNrLXF1Y/+z/ig9ID
         Ud4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973342; x=1794578142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XyZUDkR6hNXTjrZPWq6NTK8zRtLjTIm0cxng3P1XAQ=;
        b=gACVbZv6qsxaLT9OkQuTnA36pKLf+LVXdNz6ryDcWrWJXrgvQ20cyGaTMWxNEUl3Jd
         S6XrwzwY02hv2VrmWxA6nFKNdQF6AVeKn/UOu8tDhQ8tjaHey7QeG4N3smq7M6byTMYR
         VRoQsZy7YFC/taHD2GNkoOT4zCir9alyn6TVieEjxfWJv2Ios8m9WfNrMv0F9XVAnRnN
         pmCrLQ/WcWAdoDHRkwYN+1gONvoQJX/c/2HyBi2iNRbC7jCt4d2IAjdZW+7y3if6/CUG
         SXAtFdnVDAhNFQL32HoC3kC1Q3p83Yku3VKQohUvwDnl7ic0Ewhsi0d1MKj1zek8/oFS
         mA+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTS7YKdYejb9H1V5SDq+1x/F651U9Wg7Zp9/JEsBRXwlXk2AKNJqPtu+mSy3IOo+1jZpBhDl5sYP20Xvw=@vger.kernel.org
X-Gm-Message-State: APuU4Z84Wy8D10trR+K+VWe3aTI9/N32yadJ3IxhUz8yO0znDWzcg1e5
	IKZluT8jVcP2z+Nk6zc9joOrguU507tlbKFfgwkEuyuqKBiY7PHQmQVp0/E653vkLdQB5iQaT3n
	ZLLpbljRd4sZB3yjpe3lcC+dLhCQSjgISIZFrT4EXWkS1Tstx5w3rqYPzXZGgzoJsAvw=
X-Gm-Gg: AYBFou186fqNUonzBbvLFZbvl7a6gLu/XSAkgNqNJeUyJR8DcMKaEo60sEFJixP3ob+
	qIymPgzXPfW8i+ncv4RqhMk6Yb6I/M32/6hT4yTgxMCGGOeSecf2VSlb/GhyzRchNk55G/HcuIZ
	Fu7shHTra7nHenjIMs79LnyVXYpcKsyw+KCB5Hg6cUlBDIEwEr6bbJOf9hzJVuqmYQg2cmcpnTF
	sZQIbTNU/xpdzLkFu+2Y+e2YYSj+7B6Xb3zZnfTmLKnSTeyjnzsnksOI+494qE/j8gC+fZgVUt8
	Q0cvTHj8eJu59WpGk7wEyCxgZ1jLLTi6YgnQnIzixlFRVBvvw6fCvcT7KkahV1NnSii3xE2gEPd
	9BrN0LsHGfYznKGCWTxVzZeRP34OsJAWsqUtx4c7Udhs4EyE400qJC0D6OAQ4hHeemiUeuu4GpG
	yWc6a8RsATfFssl91xjPfXnexcq1/I1RzSdyBl2vcZ8aEJt2RIg3WqpC+GbodcjDNdcJ4zdtUCU
	H1WxTpsYdK54kmA7iRCDNGc1Gr9
X-Received: by 2002:a05:6102:54a4:b0:7c5:4da3:aefb with SMTP id ada2fe7eead31-7d2a16eba5dmr1219344137.34.1793973341446;
        Fri, 06 Nov 2026 05:55:41 -0800 (PST)
X-Received: by 2002:a05:6102:54a4:b0:7c5:4da3:aefb with SMTP id ada2fe7eead31-7d2a16eba5dmr1219327137.34.1793973340814;
        Fri, 06 Nov 2026 05:55:40 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:37 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:21 +0100
Subject: [PATCH v14 5/9] media: Documentation: uapi: Add qcom-camss ISP
 params documentation
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
Message-Id: <20261106-camss-isp-ope-v14-5-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: YIzYf58ba5kxgK9bvtTnGB51h0g8oyRG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX1hOmX3R9qsLD
 TjkIB/8kg795hQFPyU2UgDWSMTg5EQv4YrgKuz0IyEP5zC7tkci44LG3auV/Ly21joP+swPmHxn
 3vECUgwsYRenPFlnUi3KB6YsYGhGdARw1fsQq/W53iXB31JD0Ust8VlJzmNUtf0wUQy1rD3IfDQ
 Yps078my87owWpbAyJ7jf8WPMeYV0LiFbLOYVPmRFKvfk2FIjfmms5KFJdujJZhfiKXqsuhxN0q
 S0i4LXG1sU9qUC6G52n10keCOML04vwZ7OnhQwLPXbTOiJmC1F3SXfgNYFC4o/9NE4l5G+9YqGm
 9by/GZvc6d0umCyzMbm7CXvjzzBIYs88+8WN7VGZNvu1ucFsXA/LIwYgBE/TPxLWRdtzP8pNyMb
 uGfjUlS5C52hnCcRISbArbMdxWcRh1NoTYyWsUx54WJqWe0DFZ6e7Yn6HFQNdCQn/ZWLqXvdkCI
 Iiko6A7L2STPvS8Rhgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX1Yw+yJNb6s6i
 A52/KX6pSv2PbjgSXcg2ARWFi697lxrXztbyMw53mOliuMQZ3FtYU1Qw6WAdcupPsV/BAHydrXj
 TBfE5UQf8nrA8aPIrX/xk3UK1yFVSd8=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aeddc5e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Nff7jVtaK1xTle8F27sA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: YIzYf58ba5kxgK9bvtTnGB51h0g8oyRG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

Add documentation for the Qualcomm CAMSS ISP parameters metadata format
(V4L2_META_FMT_QCOM_ISP_PARAMS). The format is built on the V4L2
extensible ISP parameters system, with per-block structs defined in the
qcom-camss-config.h uAPI header, and is designed to be shared by any
CAMSS ISP engine exposing a parameters metadata output video node. The
Offline Processing Engine (OPE) ope_params node is the first consumer,
with additional engines expected to add their own parameter blocks in
the future.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 .../userspace-api/media/v4l/metafmt-qcom-isp.rst   | 147 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 149 insertions(+)

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
index 0000000000000000000000000000000000000000..a218b9aedb28a532358434d35303c2cdb93345f3
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
@@ -0,0 +1,147 @@
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
+added to the data member of :c:type:`v4l2_isp_buffer`. Userspace is
+responsible for populating the data member with the blocks that need to be
+configured by the driver. Each block-specific struct embeds
+:c:type:`v4l2_isp_block_header` as its first member and userspace must
+populate the type member with a value from :c:type:`camss_params_block_type`.
+Populated blocks must be placed consecutively in the data member, and the
+combined size of all populated blocks must be set in the data_size member of
+:c:type:`v4l2_isp_buffer`.
+
+The set of supported blocks depends on the CAMSS engine consuming the buffer.
+The block definitions themselves are shared across CAMSS ISPs; currently the
+Offline Processing Engine (OPE) is the only engine consuming them, through its
+``ope_params`` metadata output video node. Additional engines and blocks may be
+added to this format in the future.
+
+A block carrying ``V4L2_ISP_PARAMS_FL_BLOCK_DISABLE`` bypasses the
+corresponding hardware module. Any other block updates the module's
+configuration and leaves it enabled. Blocks omitted from a buffer keep their
+previously programmed configuration and enable state; until userspace submits
+a block for a given module, the driver's default configuration applies.
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
+      - :c:type:`camss_params_wb_gain`
+      - Per-channel white balance gains and black-level / pedestal offsets,
+        applied to the raw Bayer data.
+    * - DEMO
+      - CLC_DEMO
+      - *(none)*
+      - Demosaic: reconstructs a full-resolution RGB image from the Bayer
+        mosaic. Always enabled; not configurable through this format.
+    * - CC
+      - CLC_CC
+      - :c:type:`camss_params_color_correct`
+      - Color correction matrix applied in the RGB domain.
+    * - GLUT
+      - CLC_GLUT
+      - :c:type:`camss_params_gamma`
+      - Per-channel gamma correction curves (256-entry LUTs).
+    * - CHROMA_ENHAN
+      - CLC_CHROMA_ENHAN
+      - :c:type:`camss_params_chroma_enhan`
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
+``NV61`` / ``NV24`` / ``NV42``) or luma-only ``V4L2_PIX_FMT_GREY``. A
+configurable stage is bypassed while its block carries
+``V4L2_ISP_PARAMS_FL_BLOCK_DISABLE``.
+
+The following example populates an OPE parameters buffer with a white balance
+and a gamma correction block:
+
+.. code-block:: c
+
+	struct v4l2_isp_buffer *params =
+		(struct v4l2_isp_buffer *)buffer;
+
+	params->version = V4L2_ISP_VERSION_V1;
+	params->data_size = sizeof(struct camss_params_wb_gain) +
+			    sizeof(struct camss_params_gamma);
+
+	__u8 *data = params->data;
+
+	struct camss_params_wb_gain *wb =
+		(struct camss_params_wb_gain *)data;
+
+	memset(wb, 0, sizeof(*wb));
+	wb->header.type = CAMSS_PARAMS_WB_GAIN;
+	wb->header.flags = V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	wb->header.size = sizeof(struct camss_params_wb_gain);
+
+	/* Unity gain on all three channels (15uQ10, 1024 = 1.0) */
+	wb->g_gain = 1024;
+	wb->b_gain = 1024;
+	wb->r_gain = 1024;
+
+	data += sizeof(struct camss_params_wb_gain);
+
+	struct camss_params_gamma *gamma =
+		(struct camss_params_gamma *)data;
+
+	memset(gamma, 0, sizeof(*gamma));
+	gamma->header.type = CAMSS_PARAMS_GAMMA;
+	gamma->header.flags = V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	gamma->header.size = sizeof(struct camss_params_gamma);
+
+	/* Identity curve (pass-through, gamma 1.0) */
+	for (unsigned int i = 0; i < CAMSS_GAMMA_LUT_SIZE; i++)
+		gamma->glut[i] = gamma->blut[i] = gamma->rlut[i] = i;
+
+Qualcomm CAMSS ISP uAPI data types
+==================================
+
+.. kernel-doc:: include/uapi/linux/media/qcom/camss-config.h
diff --git a/MAINTAINERS b/MAINTAINERS
index e4ca41cdd8729625fe2f731cd443bdd4da527dca..234c4c69dec7e7264763f1970438c22d0cec11a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22908,6 +22908,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
 F:	Documentation/devicetree/bindings/media/qcom,*camss*
+F:	Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CLOCK DRIVERS

-- 
2.34.1

