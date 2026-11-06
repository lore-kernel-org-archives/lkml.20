Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953531;
	b=HtYfhAiyGZTLSWLD1YLm45ov3s6ZR51roEyU8dmKHEXtpJynozJQ6BjMqkPJD6aIg81B
	 gQwomRCpsHOE9mecvaB3mh4ajnS+qYa/bZZ5MA2q+GkkWrgCZQ2dMKR9o8u4bjWB5J4eJ
	 WYsHiEzmirSclil3+V5++PinGS3UZu5OrLQWQjtgCzGjffJdTYYrJx4cUG1CoMLyBZokI
	 PULLmQm83pLJGM/ViIkEc8OZ8N1wM0uv7mVTZP+4CZ+xvgOuS/WxhPwb2auAPkFziimU/
	 5/q0aCpDXHe7gk9kXEHU0fWFklE+vSV0P+/yM73jzu3ElN6yxOmHf/K0uqLJqG2SZWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VG/P81aljIsvc9+P+5wwl0NYjMNELgd1rv4+wu05NJE=;
	b=ueiUg4qMvaAfUOZ4zorWNTh4I9nIZiwwkmYZ2tz2U9gCbgaS12Mi8wnthkv6EMvaGZaJ
	 y6DdunCAds5JStTtX2RobLdZpBja1oTnvTcoD8jz1nSFlBVV4x6LvZmHGaN8WHIb2XpH9
	 Scq2J/GQlzpAB5Hz8NbUYz4c4+KIoyIlEyiUqQAHWoHsY35m1nYYzAvhTHcacUgJF86J4
	 dhdUdIsHocf8Htxtv9NFGYwOrZ7Fv3tj9txZTDyTKK6hLSwG9GrTPi1wK8c2oG5XPUcQ5
	 UKKq5v1r+Hmfi0iE68GSxtHacgmlGBgDotLR8RNwodRWy3+wpUojGjJy3/TuaZVSmpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K6ETmfjw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UOMGXxpf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34E0606A33F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34E0606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K6ETmfjw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UOMGXxpf
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RRhW3907031
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VG/P81aljIsvc9+P+5wwl0NYjMNELgd1rv4
	+wu05NJE=; b=K6ETmfjwuse54NTVciSqpwsNMi2WisElu36r2gO3Kmvlx7TQ3wH
	rALt4dZaWKhC4yGlQuB245QjogJMyYQaGGStl6gAuHCRyLaNRxCJrLN+sne7xBgA
	hE4f6Qadvm5iduvoNaYP+WOTWtP7P3NgkSSvHTAh4UfTZ/6wS0Uhk0UWnwpjsUbv
	JELgMMc+udyfipLrVGZ0pY6VfQhFx13o6CNUdACC/rttBh/Z/fBhHuAg32WHUFN0
	lBlU1ERhcJrqAcw2JxfKIxUa4L0pPSRJ0bipT4GwTIwtyP2Zk+3PmZd5lFvznncF
	bnoyMAfd3Mq4GwryxxZEEHM/LdxFAJ4lHfw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pasty3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:25:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so88462685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953529; x=1794558329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VG/P81aljIsvc9+P+5wwl0NYjMNELgd1rv4+wu05NJE=;
        b=UOMGXxpfbFbUSIAzaxJF5o9TOCM4zg6Pp0G0U+mSInpeiXpdQe+EkkkZIev6wRtsQJ
         kGcVSqhdm507i8MR9MYsx0CgIq1SrYwjFDmEzAa0TufJREOtZNNgX4QTxKF66sUKb8c/
         GG0S/FlGBbNN57UGsNi7gFJikUsiWUzD4rVzfiyRqIxyyPh107yZgv1zqFiMvo9D+gGv
         CDKIajU2oqu0R43yLV293PRwYJJtkBw0hQo0GVlJUhX0SJviecghgPXJYfjrym0jdMCd
         yr+57+nnW6LRtodxjcGQaFvWQhZHE3zn53ngz0XgkjxYYm180uEynT4uHf9cy8xFzCpU
         7EzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953529; x=1794558329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VG/P81aljIsvc9+P+5wwl0NYjMNELgd1rv4+wu05NJE=;
        b=1qqiZHuqQA7fEFYoxMHwbBxahIkVvXvrX5hHblkHV3u7Xh4IiR17dHIgi48uhGZx+t
         cDgefob9/gVRWIHDfNqJhBkR9wHBS4B6l2F2YZRD5HWeowG8aNUiCg8UABXER74E9Hjz
         wsDD146BhbEVepjZ+KC4nkrJtdapu9NpC2KIBrH9r3Aiq7RhNdXUReSVe3C4dNbmbc6R
         EeQpNXq2c9Odu+QxFfqeWvQYS5zV6gzgRF5bqjR0Mvd15jka+9dO2k2xmpFcl7AUNAmt
         j3jEOZH58bdHUUAH97Ec07GMLEe2Aza7gI1dDVDAZpjcj6QqLi+ncimSzlfHsduka7Pm
         wpig==
X-Forwarded-Encrypted: i=1; AKwUvBzpOnW67Rgo2jpHlSQgdnuC3lL98fU+n3NEwghs2S8+/Ac5CrFFuUF84/bb7YDik548qOU7iwDD9k8mouw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/23tTnuvBvWVL6KQQu2Po4sqWh3Xu5Tw+QvOaGu8Abh5+LKVJz
	1at5icCoB0bDtX+3bGv8enhSn7uq9rx95wOBjv6bgWEhyDgdIUncBDEANUObD/VKlxaJaRzHrln
	ZS0wvHiPcrem3vRhL7reMtu5/713FH2FF/NFH1F0G1L4qcWP4zCBf6ui3ShhlIdzIA7w=
X-Gm-Gg: AYBFou0w/LU8YNP/R7b/Q7hcnIPULtlPx459SJh9QbZM7NNpsalRmt7/YFQIn+t9ZTM
	jdtq2pK+uWYhSC1z4hhS4BHIm7qWngahXcYTVum5Zd+CoppPPGRb7+E/ICcGYoZSAsgmUfxjV0P
	Cg1AZ6lVzP/aTDKuEpFITGcKA/6xbNnCqCE3djl/Q6aac7va+NgAWK92tVAAmclQNM7fqHr8s9V
	hBXLi899Q4y/YpKqXdhXz3iTQCmh3oI83KxkYNoJzBinOxLAnTt1Q2/+HK2FhpLb50/bvLlxLtn
	TXemcvgvEbl0gwFxx1tBKUjME1SVH3IPxagNgInz6/vCXRemp7rbAXkAoyvGxvhW2p8Y9ZgOyWz
	Yl7lhKt4fwhGva+en5plgo9SiubK9Klrsy2k8FRjYBVto5Tv3xnsuwEGqeMW+WuZjVnrijCT/9Q
	==
X-Received: by 2002:a05:620a:4015:b0:944:192:85ef with SMTP id af79cd13be357-945f34ef796mr273534585a.22.1793953526727;
        Fri, 06 Nov 2026 00:25:26 -0800 (PST)
X-Received: by 2002:a05:620a:4015:b0:944:192:85ef with SMTP id af79cd13be357-945f34ef796mr273529285a.22.1793953525720;
        Fri, 06 Nov 2026 00:25:25 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:23 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 0/8] Add Qualcomm JPEG V4L2 encoder for SM8250 and SC7280
Date: Fri,  6 Nov 2026 10:25:14 +0200
Message-Id: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX4zE60Ma0QFBP
 SE4iNSLfz8aksXohhAL7C/cNKdXud1+XNNvdYe7nTZFdWx6MBKWDbASnxfjNZi8DZmA0fS7bMsA
 4c2234wO5s58UGkCJmd6LGh8vKAyA3UFQjUqsZQOnIaT8CMEM6iJaNNN4meiyqgeuzgRQSG6t83
 st5o+N+Z4E/ch4DSHI0i/qq0lLZow4JNl2x3KDIXvcKMdtuvGBQAJLVJVrDKE1kMxSSIvWqUDm9
 SND93VoqP+wVV4YRttWIVh3SLOlzjc/BaXSYw5CN8gdGSxHWgxmapt2K3/QIQXpPMmtU3lN1MG5
 qL/znbGwwApSpZaRRC+b2Gm/0Du7r1b2fby7tQED+mG66qrTyDumvWC7gxbFI/Od3ywycAZucjR
 eo0fi+x3GfTXgm0Sdp7KDlKlmbBw8AB1wjTW2BqwxTtZ+/iQ2EXtGitAaN1gKZWahZC6Z0JxFkI
 mleaHNGFCdTM3oL4XcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX+seEANsjH9F3
 JYVBlb7oe7qxXRnpH/XHDjGkDAZUgds9xAIQIeI/mpwbMPhSUx0Vof4LmnIaUJyXaTu7AmxM3kI
 nPa0h3UyGueExFvcB921W3eTjglbx3k=
X-Proofpoint-GUID: owZa3rZtpCJyHWfRPuwadZQWVcICXZq5
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed8ef9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=70q_-rFcRKED9NXvpuIA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: owZa3rZtpCJyHWfRPuwadZQWVcICXZq5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060033

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

 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  |  193 +++
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |   69 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |    4 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |    4 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   74 +
 drivers/media/platform/qcom/Kconfig           |    1 +
 drivers/media/platform/qcom/Makefile          |    1 +
 drivers/media/platform/qcom/jpeg/Kconfig      |   15 +
 drivers/media/platform/qcom/jpeg/Makefile     |    7 +
 .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  375 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  122 ++
 .../media/platform/qcom/jpeg/qcom_jenc_v420.c | 1527 +++++++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v420.h |   43 +
 .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  215 +++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1176 +++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   13 +
 drivers/media/v4l2-core/v4l2-jpeg.c           |  165 ++
 include/media/jpeg.h                          |   79 +
 include/media/v4l2-jpeg.h                     |   31 +
 19 files changed, 4114 insertions(+)
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


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.34.1

