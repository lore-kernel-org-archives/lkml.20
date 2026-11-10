Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328757;
	b=0knMKwOK3sgcMW6rgPhjqeQhGgfR8XSW9d513o/+SroLYDiyH1Xv89ux7I8qgCK85ZEb
	 oJSXXV1HNDmyNdAa9yAJ4zGtt84Bdv40DXMVbYkTI825x+0F3xs0ETdA02kFFsbYDIs5l
	 BEqYaTZM4rLowVlmwGwH8bHW1w3/oVOosG7uL6sMCn6vCzMI64qEesvHb6FZrHdGAUg0m
	 vw+UMhs/+bQX+SD+f/qt96VDF8g/j3oDX5RRrCLGUBnGWxlg6GBJzx6cY+RYOWQT+zNfP
	 EKGK5Q8+oBTfPQOXdt+fmWUecTy5YiIvXVQtAhrp4JhbR8sFH42Czy8K7G0fxQ0glkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j+o2nprUYXBdBSz7frmpunKhFOcmNU/yzoBemgnoWw8=;
	b=fcFLJEGrhssA2d7KHI8KV6PS/fzge1HOsHm4lqPfgxAEcxVLM8SWTg3lWhKhs560jQMC
	 W9kKUc8z05FBaKt++wq/shlrnjJqD87rw59jhhx8L1C0eAvud//Fw/fUyr/HyLyAGipkd
	 NqyGv/9toDHEzNFLP1FnWahhQjAWr4nI0o+ZmOVxF0zpzC5j1VtHgAIdQSMdGou/ltQzv
	 zXrX6+2Hc3nMc1MFALiwCstdQehobIMUmPUV4P0cfmjiZt4XvImEOw7h9+DZhH7eI3gSn
	 PQY3p8ko3EPWRk04r7m8wIEP1zPW0X7KtRvq2rObCNJMClNpwiM6cBIKV5N66TwxSVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DIP+1din;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aHg4IrRa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0CE606A221
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE0CE606A221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DIP+1din;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aHg4IrRa
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF01nA3690965
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=j+o2nprUYXBdBSz7frmpunKhFOcmNU/yzoB
	emgnoWw8=; b=DIP+1dinwYv4heyRZM52uBIN3cW+o2MsOcpUw2ntV+TmYXjjFff
	StCqLUboE1IJukQPCN+jv4ghVDk1r1bYD2eAG1TXLvSciqquzLJGzJ+gOjW7w6Id
	ANsfElCvygG7Z3qtypLmkh/GZJwnkCnAjRRB+UkXkyNXDJ/yiBGyZY2oMQyHcShg
	i+sGsSNXF6zsdjJhO+lZ15iZCgQ5zoHFvTWIveACcfTR6t8E44NC4YKo635egg1x
	KC9mRyj02ze6ARc+rBlF9elJJ0BpMolT2ASY2F1WoOX12FoNs7Wjo8i31G2gHBuq
	+ZK7rAeE5sZwCgHZpW2kqp9Q/mbQx2K8RSQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03csqpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:14 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99870ee564fso1690277241.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328753; x=1794933553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j+o2nprUYXBdBSz7frmpunKhFOcmNU/yzoBemgnoWw8=;
        b=aHg4IrRaQO/ySMj4zNymyGlccBY44KOIammI7xlMbtsoKOr119HSqozkCSiPuV0GT9
         4W8DdgHLr/2DfgXmSLlMmvMLB9LFXMdhqsAKsFn+n2icvW5FKMezKp0+yL0IWGDQ/yK3
         bQRJHCXtRfaS9pyEwlZTDusLm0LJPs4Xf/aojfmkOju4spAQdXEcTIYtK/TSQklQM6IO
         eUMm2Vm1oDrHoeBhTpwfOJCEQGBoGLqAgHSXZtNH3tIoq00nhOeh1x2fTkrtGDxOUaDf
         4MldhMBOmslO9cTo8+8bHG01b3pmn3zLMNA+rHDVNcoCJZEVogz/eFpi2Xp5HFA2GNSH
         cY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328753; x=1794933553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+o2nprUYXBdBSz7frmpunKhFOcmNU/yzoBemgnoWw8=;
        b=AkkR3uzTs68ijuyCJUZxdEjleZ8X25aup6lP3QBLEXq/7w3CzajKZBitYwr4q8htB4
         j+5Mg/0Y/TJb+NONz5P2V12DNo6PmAcWvH2V7O8V1AOG04MUQ3ALYlZMhkkstiLxceB4
         REXhqHrATPeSq8vlhUPG7VyM4w5rpR4GVc4UjOnp4Trr/R5Xme920ibpZISrQVMt4Z0I
         E4L49qJv9hTKqP3O4nruc6dSWKJFwbO4EGi7f+dED8veGPztOEhVACbe/3q28HqH+2fX
         897fqoMxRZU2vrKmAsfS8BSDVS48fMDHMBYEcFjB+us7lPRSDZrZ0wRTqYJqetZGfRxT
         XNIQ==
X-Forwarded-Encrypted: i=1; AL+hErFiq7kmS2HzC4yPXOWPEdPQDhSdOw9X9Uh/FJmoXD61apP/5KVW/rNNGlO7RsDqYvwiEC0EcCVBhU5hQ28=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aeFn5glCmDHzHOv5bd+FI7APEOA09tj/gUlUreGbb+slx+SQC
	pIXULzHRw9hFvYEne2DJoLZqsrS9zxrSyks7RCWniYGLhnuCM9NFPTj9vExl62OfmUHgxwguBO7
	33PRaXSa+zshyNYPzEFLxJctiOMB3iE3GwMMyP1W+gGPTHutiZbj8siqvSGX7qS4/AwM=
X-Gm-Gg: AYBFou1eCa4X7Vz29iCZtYuw0j2upTdJIGs4WCLBQGK3dUWYR/RbP9hnkVHex/8jQZB
	DCBcOz6qxQCKp08PTl/eFks2ME1DZFlYui1FhCTaS0u4lzyRmh2l7lkueP5N1hjh+dlLKrq0Zfb
	ITuX+BOWrcxBGhbucJjCS9ku3V3zg+JKKKzB6fqJKNLUMcedMlDmqKRDj0QwrwatrXL39GzCEQn
	ddLVt/pWHirfVn1duICpAflk1B0Xl3eixXWQT9DpPKkfIhfukYsFGHS0PS0tzBHenAnUn0CMyvj
	q9yTMInJbFTY5JjHaBImwbtYRhcSh0vR+IphlpOXcpanL7v3rv6oE/P7JZB/LA7X/mwo6ObBxBK
	wh+A2fxoHFE+h6Sl/mVBivZfUVfegFuC4dpf0WdQDuei1qDl1wf+f+jKrzzQYTBYG7NZzOAvt4w
	==
X-Received: by 2002:a67:e11a:0:b0:7cc:33c9:b3cb with SMTP id ada2fe7eead31-7d301befa23mr1131033137.29.1794328752724;
        Tue, 10 Nov 2026 08:39:12 -0800 (PST)
X-Received: by 2002:a67:e11a:0:b0:7cc:33c9:b3cb with SMTP id ada2fe7eead31-7d301befa23mr1131026137.29.1794328752166;
        Tue, 10 Nov 2026 08:39:12 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:11 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 0/8] Add Qualcomm JPEG V4L2 encoder for SM8250 and SC7280
Date: Tue, 10 Nov 2026 18:39:01 +0200
Message-Id: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _XIYLMRg_4JUD4IsQBSA3OtqrG8lUr2h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXz5+aXkHKyXLH
 TGovY1A85fMpVcp7kQOh+pgEbpvRyn+vIeV4G6GhIeXmpLM480lNHqWcnmR7kAi3wf26I0WorTp
 6yUlpaIphNAbmCOnkeLd/VqQJSnyR0k=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af348b2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=70q_-rFcRKED9NXvpuIA:9
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: _XIYLMRg_4JUD4IsQBSA3OtqrG8lUr2h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX+NiKyh3L7KzP
 L7A5yNR0wfO9xikZ3cHq2w2liXgdh3ddLUceB9O2rohw2aEg0bB34gkTLfQNPhdWCNKY0EJCg5r
 dO4IEcwSzKqbn78Ao5JSZau8TrhK7Pb+D+1BuWd5MXtsOGpq3NgjBzlU6h13rAru6vvnTMzXZBP
 fg8eIb+jMawKJH57AGEGrUgvuVDdKuDxjBVP1L6NzX8UeIpAy2W0zOpA3J6AedgTlHl/TOvjBQ7
 a0Yz5vmgbbjkuRLKV9s/GXAbW2ESR5eeXh+OEHMDvP3L2TymsWYFIXdMkv2LnW668t6eHzBRJwA
 iIPqS/cn49qh8MqX810/P5WuohupYYshF5ZCnn2kaDQiLPe/k/zbhVHlWt8nMb9Bf3GUQOhI8ly
 nQrtMp+e75xGIugl09PLBm2MoV+cju/PpxBNWxVjs+hqWMaXDIweGDX2+DCKEBQ1VOHczCUU6Qo
 xyX6oSXDWwIXGBSes6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100066

The goal is to upstream a standards-based JPEG encode path using the
V4L2 M2M framework, with DT-described hardware resources and SoC DTS
integration.

The JPEG encoder is a standalone hardware IP within the camera
subsystem. It is modelled as a peer node of CAMSS directly under the
SoC bus, with all resources self-described in its own device tree node
(power-domains, clocks, interconnects, iommus). This follows the
consensus reached in the v4 review thread (Bryan O'Donoghue, Konrad
Dybcio, Gjorgji Rosikopulos).

Supported compatibles:
- qcom,sm8250-jpeg-enc
- qcom,sc7280-jpeg-enc

Driver scope and design choices:
- uses the standard V4L2 mem2mem and vb2 framework
- the JPEG header is written by a common v4l2-jpeg helper
- all resources come from DT (clocks, interconnects, iommu,
  power-domains)
- power is managed with power-domains (SM8250: TITAN_TOP_GDSC, MX,
  MMCX; SC7280: TITAN_TOP_GDSC, CX) and the OPP framework
- the driver selects the core clock for each job from the image size;
  the OPP table votes the SoC rails and the DDR bandwidth

Note on the camera NoC AXI clock (camnoc_axi): several camera blocks
share this clock. For now there is no upstream driver that aggregates
their votes, so the driver does this: while the encoder is powered, it
sets a minimum rate on the camera NoC AXI clock source with
clk_set_rate_range(). The minimum is 300 MHz on SM8250 and 150 MHz on
SC7280, the lowest levels. Another user of the clock cannot set a lower
rate. The series does not depend on the camcc icc-clk series.

Functional validation:
- tested with v4l2-ctl and GStreamer (v4l2jpegenc) on RB5 (SM8250)
  and RB3 Gen2 (QCS6490)
- v4l2-compliance passes
- throughput and DDR traffic measured for each OPP on both boards; the
  OPP bandwidth values and the reference throughput come from these
  measurements

Known limitations:
- no scaling
- width and height must be multiples of 16
- the camera NoC AXI clock has a fixed minimum rate; its bandwidth is
  not aggregated with the other camera blocks (see the note above)

Changes since v7:

  Binding (dt-bindings: media: qcom: Add JPEG encoder binding):
  - Dropped the camnoc_axi_src clock. It is the parent of camnoc_axi,
    not a clock of the block. The core clock is now the first clock.
    (Rob, Bryan)

  Driver (media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder):
  - The camera NoC AXI clock source is now taken with clk_get_parent()
    from camnoc_axi. (Rob)

  DTS (arm64: dts: qcom: sm8250, kodiak):
  - Dropped the camnoc_axi_src clock; the core clock is first. (Rob)

Changes since v6:

  Series:
  - Added SC7280 (Kodiak) support and RB3 Gen2.
  - Split the driver patch into media/jpeg.h constants, a common
    v4l2-jpeg header writer and the driver. (Dmitry)
  - The SoC nodes are disabled by default and enabled per board (new
    qrb5165-rb5 and qcs6490-rb3gen2 patches).
  - No dependency on the camcc icc-clk series any more.

  Binding (dt-bindings: media: qcom: Add JPEG encoder binding):
  - Added qcom,sc7280-jpeg-enc (titan_top and cx power domains).
  - New clock names: core, bus, config, camnoc_axi. (Dmitry)
  - Added the camnoc_axi_src clock.
  - SM8250 power domains: titan_top, mx, mmcx. (Dmitry)

  media/jpeg.h (media: jpeg: Add JPEG baseline and JFIF APP0 constants):
  - New patch with the standard JPEG/JFIF values. (Dmitry)

  v4l2-jpeg (media: v4l2-jpeg: Add a baseline JPEG header writer):
  - New patch with a common header writer; the qcom JFIF header code is
    removed from the driver. (Dmitry)

  Driver (media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder):
  - Added SC7280 support.
  - Power domains are attached with devm_pm_domain_attach_list(); the
    OPP table votes the SoC rails with required-opps. (Dmitry)
  - Fixed the clock/OPP order in runtime PM. (Dmitry)
  - Minimum camera NoC AXI rate with clk_set_rate_range().
  - The core clock is selected from a measured reference throughput.
  - GENMASK()/BIT() with FIELD_GET()/FIELD_PREP(). (Dmitry)
  - JFIF tables from the common V4L2 JPEG helpers. (Dmitry)
  - qcom_jenc_v420_* names; removed the qcom_jpeg_hw_ops table.
    (Dmitry)
  - Removed the custom performance controls. G/S_PARM is not used
    either; the driver selects the clock and bandwidth itself.
    (Dmitry, Gjorgji)

  DTS (arm64: dts: qcom: sm8250, kodiak):
  - required-opps on every OPP for the power domains. (Dmitry)
  - Interconnect on the mmss_noc camnoc SF path to EBI; added the
    camnoc_axi_src clock.
  - OPP bandwidth values from measured DDR traffic.
  - New kodiak node for SC7280.

Changes since v5:

  Binding (dt-bindings: media: qcom,sm8250-jpeg-enc):
  - Removed GCC_CAMERA_HF_AXI_CLK (hf_axi) clock and hf-mnoc interconnect
    path. The JPEG encoder uses only the SF CAMNOC port; the HF port is for
    real-time capture pipelines. (Loic Poulain)
  - Added RPMHPD_MMCX and RPMHPD_MX to power-domains. (bod)
  - Added power-domain-names property with entries "titan_top", "mmcx", "mx".
  - Added power-domain-names to the required list.

  DTS (arm64: dts: qcom: sm8250):
  - Removed GCC_CAMERA_HF_AXI_CLK (hf_axi) clock and hf-mnoc interconnect
    path from jpeg-encoder node. (Loic Poulain)
  - Added RPMHPD_MMCX and RPMHPD_MX to power-domains. (bod)
  - Added power-domain-names = "titan_top", "mmcx", "mx".

Changes since v4:

  Architecture:
  - Dropped patch 1/5 (devm_of_platform_populate in camss.c) entirely.
    JPEG is now a peer node of CAMSS, not a child node. (bod)
  - Dropped patch 2/5 (camss binding unevaluatedProperties). (krzk, bod)
  - Moved jpeg-encoder DTS node from camss@ to soc@ level. (bod)

  Binding (dt-bindings: media: qcom,sm8250-jpeg-enc):
  - Renamed binding file from qcom,jpeg-encoder.yaml to
    qcom,sm8250-jpeg-enc.yaml to match compatible string convention.
  - Renamed compatible from qcom,sm8250-jenc to qcom,sm8250-jpeg-enc
    for readability. (Bjorn Andersson)
  - Added power-domains property and required entry. (bod)
  - Added iommus description with SID value 0x2040 for SM8250. (bod)
  - Dropped soc{} wrapper from example; node is directly under soc. (Dmitry)
  - Added Gjorgji Rosikopulos as co-maintainer.
  - Patch order corrected: binding before driver before DTS. (krzk)

  Driver (media: qcom: jpeg):
  - Removed <linux/mod_devicetable.h> include. (Uwe Kleine-Koenig)
  - Removed dev_dbg calls from OPP clock selection path. (Dmitry)
  - Removed camss_dev field and pm_runtime_resume_and_get(camss_dev);
    PM is now managed independently via power-domains. (Dmitry)
  - Removed incorrect device_link_add() to parent; not needed in peer
    node model.
  - Moved file-local defines out of qcom_jenc_defs.h to their respective
    .c files. (Dmitry)
  - Fixed dev_pm_opp_put() placement: called before rc check. (Dmitry)
  - Replaced _DEFINE_DEV_PM_OPS() with SYSTEM_SLEEP_PM_OPS() +
    RUNTIME_PM_OPS() macros, consistent with other media drivers. (Frank Li)
  - Fixed Kconfig source order to alphabetical. (krzk)
  - Updated compatible string in driver match table to qcom,sm8250-jpeg-enc.

  DTS (arm64: dts: qcom: sm8250):
  - Added status = "disabled" to jpeg-encoder node.
  - Used 0x0 instead of bare 0 for zero cells in reg property. (Dmitry)
  - Dropped opp-peak-kBps and opp-avg-kBps from OPP table; no upstream
    aggregation mechanism available yet.

Changes since v3:

  CAMSS binding (dt-bindings: media: qcom,sm8250-camss):
  - Added as new patch 2/5; allows #address-cells, #size-cells, ranges,
    and child nodes using unevaluatedProperties: false.

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - Dropped soc and camss wrapper nodes from example. (Dmitry)
  - Removed opp-level from all OPP table entries. (Dmitry)

  CAMSS (media: qcom: camss):
  - Replaced patch 1/4 with Bryan O'Donoghue's original upstream commit.

  Driver (media: qcom: jpeg):
  - Cleaned up driver patch commit. (bod)

  DTS (arm64: dts: qcom: sm8250):
  - Restored camss interconnect-names to original values.

Changes since v2:

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - IOMMU stream IDs documented in binding description. (bod)
  - Dropped "Properties documented:" section from commit message. (krzk)
  - Dropped clocks minItems constraint. (krzk)
  - Renamed clock-names to match hardware signal names. (krzk)
  - Renamed interconnect-names to reflect path topology. (krzk, Dmitry)

  DTS (arm64: dts: qcom: sm8250):
  - Removed cell-index; use lowercase hex. (Dmitry)
  - Moved jpeg-encoder node into the camss block as a child node. (bod)

  Driver (media: qcom: jpeg):
  - Sort obj-y entries alphabetically in qcom/Makefile. (krzk)
  - Use devm_mutex_init() instead of mutex_init(). (Frank Li)

Changes since v1:

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - Removed qcm6490 and sm8550 compatible strings; SM8250 only.
  - Fixed clock-names block in the binding example.
  - Dropped reg-names: with a single reg entry it is unnecessary.
  - Removed description literal block scalar (|).
  - Dropped _clk suffix from clock-names.
  - Added iommus description in the properties section.

  Driver (media: qcom: jpeg):
  - Migrated to devm_clk_bulk_get_all().
  - Migrated to the OPP framework for clock rate management.
  - Switched to RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros.
  - platform_set_drvdata() moved to immediately after allocation.
  - .pm uses pm_ptr().

Atanas Filipov (8):
  dt-bindings: media: qcom: Add JPEG encoder binding
  media: jpeg: Add JPEG baseline and JFIF APP0 constants
  media: v4l2-jpeg: Add a baseline JPEG header writer
  media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
  arm64: dts: qcom: sm8250: Add JPEG encoder node
  arm64: dts: qcom: qrb5165-rb5: Enable JPEG encoder
  arm64: dts: qcom: kodiak: Add JPEG encoder node
  arm64: dts: qcom: qcs6490-rb3gen2: Enable JPEG encoder

 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  |  190 ++
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |   67 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |    4 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |    4 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   72 +
 drivers/media/platform/qcom/Kconfig           |    1 +
 drivers/media/platform/qcom/Makefile          |    1 +
 drivers/media/platform/qcom/jpeg/Kconfig      |   15 +
 drivers/media/platform/qcom/jpeg/Makefile     |    7 +
 .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  379 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  122 ++
 .../media/platform/qcom/jpeg/qcom_jenc_v420.c | 1541 +++++++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v420.h |   45 +
 .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  215 +++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1175 +++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   13 +
 drivers/media/v4l2-core/v4l2-jpeg.c           |  165 ++
 include/media/jpeg.h                          |   79 +
 include/media/v4l2-jpeg.h                     |   31 +
 19 files changed, 4126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
 create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
 create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h


base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.34.1

