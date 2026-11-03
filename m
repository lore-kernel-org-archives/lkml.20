Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736377;
	b=UqRc1kL1N0BUdzt11U+hwMR43RGAiX0pGcshfwNzvYQJndLmNMjMqm41fbiPuvBx6AYw
	 UgVDrKtwn84WuDynpf4reU3/aTCi0kfKbpUSUH9gZdxCOk52cPX4RcP9eghQZdvtu2zs8
	 rP9v11usr8F8z7cS90qBE5yJI+qx/Ko+r0ExkrtoCgpzb3Ptgs13vBpoDSEhknITnOFaA
	 ofcG9+grp4nQcwtu26/OjLEgaGtDcoajar+rZKUuh1DdloQdzpFiCKb6Vb9ds/k0sg6cU
	 1P8MPESo3Kxxk2mK1xcEjP9+YgW+bMlhGtfixVYB9RXbmsVQT3COHfYAUn2xZHj1LZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736377;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FQCnJ4CNRei6l1u7qB7F+y1q86ACcroiAcDcJoVp/GU=;
	b=wpeE7XKBc8nDEJz/ZFhsU5WMHPdO1anYucnSt9YlmdD63IjbfBUsEoyvaKJ44tVDHxJE
	 ye+0bKYjcB+4gZcQij0p7bqs4kxHX9536LzqP8KKKIyPIBrM8H1DZM/XjuQKJsZlF9iD+
	 nLCN9ls5sOVWLn66J90ov2HrzZh8DnqalVHQ4dINV314VyE8XUPMNP8ym9h9HA3hcchJg
	 j4axyz3KYiPiae1kMSjytMr7PREJAqiM5/chUIvtSQ/lx/Viuz65TwkGMAy8U8ip2ScVO
	 I+YgyZt37tUlKTduYomw/osJ0evunZfNP34Qa2mEgoGRnx3hC3OLpWssjWvpyevN6EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBFK6PR4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Oev7k/iy";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151C9606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 151C9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBFK6PR4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oev7k/iy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZDOO3666530
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 20:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQCnJ4CNRei6l1u7qB7F+y1q86ACcroiAcDcJoVp/GU=; b=dBFK6PR4CElr6wdP
	K9yjwcnDs3qh91+iaxF2b6AhJtX439vK47QbbEgK2GgAxGTXPY+C0fX+gyRuz1IF
	EGzYSE70cZSiECFVJ01XC0GikdQQ7rgTswroVKr6ONL2QRFIIQJVmyMQUN9Kh6PC
	Lq+/9NoI243AnURaXnVa43o7TsC/XQ/Erhh0zkgbzNTne6mAbv7mS+MpTQ92sj/8
	h0tS1JepSkt6nVLU51QMG5lQeIN9r97oWMkvhhzs+evmjNDB+z327VUg4qBYoqqQ
	HeuUxHUaahDdUcWtB1BiQrumKZnNntEXg8rEvj6Ior3wTgg1G52nGqUyPbr0ZVa7
	W/xBgQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubh27k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:06:01 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so3416988137.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736361; x=1794341161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQCnJ4CNRei6l1u7qB7F+y1q86ACcroiAcDcJoVp/GU=;
        b=Oev7k/iy+FMuoBy4bZd/rVje1xl4CEZxeOp52LVvKziIu0aSpxuQzNqaps5gjmOoOd
         7K1nEAaGeSU0DusT90fs6BQK+D3Dbwpj0hj9X36vYgSwfQu20JYCUVkGcWzJZapew0m1
         9FGNEuNMB40O4/exqpx7jU578P7EyPEOzCT3pSdK703w+SFOrLQxHam+V6i7I6/QWZjm
         ++4riTp79JAUpMKbuv4JqkMgmgj4q7TsgZJatUqrGACyjSTZIlQyvx2Z9Gbe5QkRiFWy
         RTljPcjoi2dy6QnZrUht76gZyaPjBApIA8rRMB73MJNsoj2OEgMj83C30QqkRgtycDV6
         pKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736361; x=1794341161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQCnJ4CNRei6l1u7qB7F+y1q86ACcroiAcDcJoVp/GU=;
        b=Gmi76fegjop3y6zm9DUzZKEBb6WJgoO8y091NOo0Bmb0kRa/jw9hiNtqnf5/aKFwVM
         S0kK6vjRvBSCfzQrSV21or7be9ldxWYLeaJ6v/AwWZ+n5CLe0GI8BbGcgzhjfeXSyaq6
         fm4brYOaZ3uot9RuCjUYIPCJOPvmC5f1NOKXE/OsioabZNOLndPOuFQfYTyZVavrYhAK
         Ce29lTjgviMbQkhFC4UNzr1cc9LHKMtBFSOWFUmHeBL3hCs5EruIxm1tSOOyhKQmenp3
         FeqUBCZFZ+NOoKiA26MSUc74zxpbqTlFaxaS5B8loVRWDSjCp3bpNNmHAw5HpqZEsTdt
         ixkg==
X-Forwarded-Encrypted: i=1; AKwUvBwqIWKvPSkFkPUtJjgMrbY7k/IDIMtyL/GiGeyGvlf3AZFJhYvaiNHBXl81G0l+8KzfeW97ZCoNgozrqiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o9OujMigb5ZDsRrL5hx3tyiWQGCA249gAuXgiuWYU6WMSKvtb
	fgROHV/aPS20BbAA1uIvVRfQVqdHAVFhR13QtMBvWIAXcmUs+3c5dEr4Pzvr99ZSc+aNL9adTF+
	SyWFlfXh8fxZ3IAqcboAw+bg0ZRP/HPphT2XKaeFNwcsxGQ6xU2nszh/OZ+LCuELM/as=
X-Gm-Gg: AYBFou3RYGhNHccue17hoQmZxdNYL3zsK8M4jAYgc7f2la/KOWsRMJJp+QhmYuJXgGD
	weMBAhg84d6vkYKo9ubAaTKkxo5A7LBsdgIso+N/QHAxPQIVTQCoEe1ZP7nHHw24LcqZqU6LBnZ
	S/6h6Cav5XaBJ0t0Bzo1TbiVgQ0/UCBqKarGXMbNzvVs2XkHYey2sOWKcv8s4jqLBBBpvPjoCge
	qnjCpwGON9+5bSoHmUAosWytRlIsyNXV7+mdb+/aO1cbEadNvjOHpqnFM9Qs0hv8B3FPQ+nEsE7
	22Nf2bi5SeOArsF1GLQXsdfZEcqBtB6HJoIY9/1dieDhi83R7b8oId0UOtCQ4TH17b0vOHOu5e/
	vgYooYGmIBj2zaWyQWbNqx/75oPGK9IZzVcTbIfRwGYRyd8IUzDAuGzdtsro0nvtRZDdESkA99z
	4spbgyOVtiGiRNkVeSB3SsHI3tUNFfJaLpSibgpGlE2zaw6ImzPDoz7r9aqT8T7QvTbLLLVYG3b
	vWmRdUO+kIldze51Qh0u38e6Y9C
X-Received: by 2002:a05:6102:149c:b0:7ad:3ad3:997a with SMTP id ada2fe7eead31-7d072247aa7mr6264114137.5.1793736361076;
        Tue, 03 Nov 2026 12:06:01 -0800 (PST)
X-Received: by 2002:a05:6102:149c:b0:7ad:3ad3:997a with SMTP id ada2fe7eead31-7d072247aa7mr6264086137.5.1793736360431;
        Tue, 03 Nov 2026 12:06:00 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:59 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:49 +0100
Subject: [PATCH v13 5/9] media: Documentation: uapi: Add qcom-camss ISP
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
Message-Id: <20261103-camss-isp-ope-v13-5-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfXyQugowrYlQLg
 wLCdXId/NNe9+f5msCzikDVCAFXG06kI9g1EISzW9uRCjaWLf/cVUSELfB4yTd46DLNKaSMHoSs
 22Vi/3lTTn9++l6nLQPnYz2ZNobTWS0=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea3ea9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Nff7jVtaK1xTle8F27sA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: OZg6KOz148pjmlCBawc8gh915DOKogB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX8PNhHgk/Iijo
 fN8ikSuilGVWiEg+jdHJ8BrlIGNr8t2O3JvEfw7qZBla/+3qnho0g1g/F4mzx4dH7AxoS2rrBkI
 lcFHNKRkzxo0eh+2n30YYN7GfcCX6k8hDcs9MQsn1Kn5Vbpd9dMRFHCqLq1W4s0OuxjUQBRYyUH
 4duSwiGYW9ex6fGoMuQey7dzAOYCwl3XymNUVt+Xw/cpuyaEUXIsTueuFNesrikiEyy/wcDqIa7
 naaOv4rapZ31oNDprZr2MgxrgsI1uQjEpyLzFAAbOU4F134HR2GKGLBD++1FszgI6T7tanBbRm0
 tqH8+QPFbeuod7VsH3pYmB08QRrhkH0LQd/AY6oqp+YOICSVZqRypWF/AaHaHXr7nhbWSqoP3Kn
 /SXFIiRnXr5L7epLFfd8p3rRMVD2O8h+QdZgS9J8YkkQ7gp12MM4e2GPGUVQid9mHSiBgulsD9p
 LAR8VH+ctEAGkkHOSNA==
X-Proofpoint-ORIG-GUID: OZg6KOz148pjmlCBawc8gh915DOKogB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030080

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
index 0000000000000000000000000000000000000000..da0dd9b0884ea8b3c5fba7b5aa2eb1af80418cae
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
+.. kernel-doc:: include/uapi/linux/qcom-camss-config.h
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

