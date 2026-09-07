Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B99346C4CD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778293; cv=none; b=K85Vk6kl0zOSNxtAgYCKm3eLEyG48Ipa17DX73AUtgn+6sV8rKaY8AmKqA9js68NSKj/7sprWFPCazyeLRDtk2N1SKnoo2fR/XoLX/dvASUt2OtIesu7HF1LKU2N17byqDHxOIjr02piKDCkFDJFkut4qgCgrjnLRt8E/qO5N3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778293; c=relaxed/simple;
	bh=nupwLSsfW8cD12YHy2y3+6n2CWouaD66aibHIiQuKQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwHIh8b9iOZRIEVt+nbK/K+08+Lt55GjhgyxbmUVMlKeCWzxRhkCvVDAOIg/07lZ3U9Avuwb1wo0+9datEp6MJMYAdGFZusvhUDq/Lx396NAw401/LP4wazxEOPi0HzYGp75+Tq9wz7S+0Z/wiw7nyBi0cKLs2PUDRm61V+Sl0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDlRk0NE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CdBcN10B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDlRk0NE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CdBcN10B"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An0JV3349075
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RrU10MxY4/YKN+GrpdRQ3Um2janr/NZ+BpP3hMIbOrE=; b=hDlRk0NExqfA1ne5
	/wiwyI7x9o9uICgTixK2z2OPERnPlxt4hV87vmGcwZv6xbiNaHJ3r8sFVyQdedtK
	mb0HHIigcLTvF3tBE8VRVGzqNwol+kKroOBaauPKJIkHeuIU+nIblI/6qQSlYoXq
	DTKAU8mqDbrS5ZZfbvuta0+bsV9l24r/M+bdGEgvTB/Oqgu4mR5SVwC5l+BZr/Xr
	XhGLa/dpJhGl0SdXJDTWPuwIsQL/PMW79wGDmNT+ZwH6NW+vofs9MwfFk/4o1cMu
	Wf0bmZlHzLvufzcFUo+nUlFw8U9W8teaQSC+q7nkDhBqMyCuzY3KduE1b7pJlNaz
	jTJlQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0dnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:51:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903622880so735367485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778285; x=1789383085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrU10MxY4/YKN+GrpdRQ3Um2janr/NZ+BpP3hMIbOrE=;
        b=CdBcN10BQ3+wmgIG1npcjxA+mk0QUsRj0hwb7QzKdCUMvKFOpUAT93mfgeAQyGLYz4
         G08Zl12Yz2aRusSmdrO2HSKOwo+bIq5VAUXVtn26L8KsqyOsVJQvcnpnvK6fzgYr1Ukl
         s3+VOxfAtRgInD4BNaLIQZFprGPSat0RdPxb+i0miGeJo0VAlYIzN2T8Ff3E1S+E5zmN
         bDF4qzIQ8/YGBRp688UVJbPMuTztzE8/4aR5tcl7n69PkT5oyBxFkX9AI1BKM7k94AMf
         2SH/sN3UZ61EGuil3qcd9RQi8rxRNhjrcSp6ZF05mMifmJNmvZjwyRopeMEliu1Xv519
         7yIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778285; x=1789383085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrU10MxY4/YKN+GrpdRQ3Um2janr/NZ+BpP3hMIbOrE=;
        b=j3ZlhK0lypwnhEjEMd4y/R+YETCOmPT4XWsLw2LBzXpl7pxPpzkZ3KivTzZ2+cvxCU
         OX3ZxSoBw0EmiEoHt4WFvW/6ClLRdr3V5pE8vGlJ4aiyZ8NFjPeAd4GsfHmM+fe42Mli
         uVjtb1a41STHua8xOYNeKv6ETxdCwbn31fbDb6hR8PGA50Kj6fOHtxHkZ0OleGpYS1xV
         9T9Mc5SWtixVEv+shWQzI+KDGhvzI/Sr6FBatF2EFJ7lxvD9WEQ3mLTRb3/8e3DpbZpT
         vUlwvtgqok0uwNHRmVANX3lPHesQ6UWa8D2n1PVYswJaYESCE5zIJTvsT7cxPz3/+tHB
         iHZg==
X-Forwarded-Encrypted: i=1; AKwUvBwAZ810KOl1TSGeEB+CY3JmQ8j/SHpn29XeLTZmOeVrHPzXZU2U7KflxYF5Y+3FS4NhoaSUsY/Ij29i1aY=@vger.kernel.org
X-Gm-Message-State: AFuF++nOyQaxJD1U/yJOizxjmfk4l7jYQal6jLJ6iaYoMFa0VaOlHeRt
	KfYUy9g6bllTF59dIa1KBE2/Tu6+kZLyQkn2vh6SZCIgyORyIW8b09aR5quRKPqX2NsDQO8l372
	8df1L1uMmIgKz1BBZQtAwsG7b4zgO8fpKeKr0bhea6cQYmnrBTjG2tc6NDVkQ0yqMHKc=
X-Gm-Gg: AYBFou1nb2gpr5XtLdt4I6L7fl17lp2fJo61JmvHeulVHcGyU2ECgFwYTdir+mHjQgk
	00HgIeYaHU7tfORUmfycEe/VxN8UaYfF4SnMtHquTVuElU/SaHavVbjSbXWzFD0RrJHI+wDSCoJ
	bGmPPOZKDwuujjv92dtEJASffFAf2jXOUTJCpJdYS9qha8Z3eazS3ZZBmxckL9WrVMAAuvIwvYK
	6+zR7+Ivw79/26yK+ai+KjZs2LC52hl3bDboaaOfKiZRmWEbqXJQOmT8S0TrpfI5Mf5igoSDyKe
	bBRvLZwkSk9/m9Ko6zgYruFmlwHVqHAahyvL4PxiPOEClhF9DOMFEVvLstOooWlRMs6sJkO9wx6
	acjJzADstX2uAeuabAa5hoL25b7R5eXjttYxd9FLZo0fvoIxp9F3H/k887dBTSruiNxrjakf5EF
	COYDpN9f6rc2eSZXq6TCjJ8eSgUf+He0exPxMuPwd3GKQQGY5kJfQ=
X-Received: by 2002:a05:620a:262a:b0:939:72cb:bae5 with SMTP id af79cd13be357-93972cbbc7emr1995802585a.28.1788778284494;
        Mon, 07 Sep 2026 03:51:24 -0700 (PDT)
X-Received: by 2002:a05:620a:262a:b0:939:72cb:bae5 with SMTP id af79cd13be357-93972cbbc7emr1995800285a.28.1788778284043;
        Mon, 07 Sep 2026 03:51:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:15 +0200
Subject: [PATCH v6 5/8] media: Documentation: uapi: Add qcom-camss ISP
 params documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-5-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9e972d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=JtaNpV_pjNJlRh9r0yAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 2YPK0SEJzhIs1d_7zcsuYIe3GcxAJDv0
X-Proofpoint-ORIG-GUID: 2YPK0SEJzhIs1d_7zcsuYIe3GcxAJDv0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX0ZnW18zigDJh
 N2xtYGdCjQVcdOV0wUXBbsfH/wmBLTbwFHsdPFC4vP2NzTP5rxcfIGow3y5qpGh5LKu4KmHpr0B
 amCggys6I0HXJ7MVteu4rEWzQeiwtCo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX5CHw8/SoXRnq
 +lUgudSjYhHCbXzVrQe3xeaIwMTedqKl19Bid6BWYBxPlIXfRv3k7SVjyPvy4ykYzhJw4cNlgtL
 q48JsZnT3Wn/Wj8i2363+s/VE1r4dPtbp4bb7xV6iyaSGB/0/J4aqIgobtsaF6xXCPmYhBoUya5
 YLH8BwOa3OH+C+POo5Sn7X7D583xT0sQ0dc6Atqxu+sVQilH0sHjjsYPBjTt7b7kNTC7oaDPKtw
 Y+FuFnAjasVtLdq2h2aaBS+qp9pssADqX4WZGNqb+8nywLQD/szHlLA/7lS/Yy0lulmOdN5cCHA
 QacWvaPGboYR9ifCOSnbeplXtwiZVWrw+h3+ufhinfaV2R8oiE10sbx6YBw/nv7imFemqC0QePf
 dNd7LGgYN+dngkCKLDf7dQRK1+myp6Vfvyfn72bsJf10+4gyyPgvNyYXi0GXRoX+qzV00trahaV
 ZvHzcmouoSx99vprquQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

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

