Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463131;
	b=2SPgtpVsjPdZ7cGlptl5JJSLxrSuLmBPUA5Ywvs1ucji/nLrWjMEiYsDnCFJYHFhZhOK
	 rZtAc8HQCMtH4CyLgbZIY3lR8D2SOBjUj/sEzAP4IqHXwr9EMnns2ffwq7rObBuIaIpc/
	 CqaWpyNcWNm15vRbnaKhXEBjy6TyynsPa6s+88/7D4AsfJfD4S3Yd4uZKAQMjMH9bUvD2
	 0ZthjlmBh54YBVDUaercz4z+9K78oz4yhEOxDPH3aDTPuheWPcd6U40p1VMcYBShAi41+
	 xHTWEV+qWHcFhKX1vdjsV/nGaD4rtxHHyXd3IGvwWSJYZFbISVMpMqqCFgCE4QMVInQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KnpAwYJakalTKmDuW9ff0h5zFEmFAGhrl/uCVIa7jTQ=;
	b=BJm9yW0jBsuVKesvPwpGy4pVZqCFBH4O1CS/YpATMQAz3xCkMNvfK3rffJI5F5ezyGQ0
	 Tf1mly22eoATtnZp04BGwVqBS80gMVP0rVLNdb14ucjm9E3eXvv1g21k4TfiYp/w19Mig
	 +J5CKqfKcNddEa6IgoKoxZcWEKpsO1jHGH8Q0HzN4qjBL60Zgp/OvdZkUwaTzlJVJXYTj
	 sF3z+ihCnf9OxBAeS3bmHPBFBPuJ2tnzn36usgktoKPfN1tXTrp1OH7BbPIdPeFNocQex
	 4/dLZEuSqoEFoWrF4CdcwkNyz1DsktexwVGVS8hlLrtbggTdGHCsHANKuJhrdPYAS4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H4SQOspO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YFMAy8oD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE2D606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE2D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H4SQOspO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YFMAy8oD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD03811848683
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KnpAwYJakalTKmDuW9ff0h
	5zFEmFAGhrl/uCVIa7jTQ=; b=H4SQOspOPcIFuSqCRGnbv+gWCcxz9pp5QNxBVg
	Wt+7c+7IEB79lrGWRN1OtDvOZrgFGBf6MOHSAYx7wUZ2/maUuF0/H7V/sRDOry5h
	y/MmMEW2z8NpbxWrzTmABy5LndX4HWsLOiPL52/NY7dbG6LftOZlLqRZuSOahbAR
	WG2MRdudnYH4LIWKHVczVaD1re8jC51YNAuNupL5qTLhYPVI2c9ix00hFmR00o8c
	NBxXV2mJSs8/zK7BTqWhmFmwvuq6ny6YxUr7iUzeZBA5gMgJrKZSHyX2myJRIrzL
	sgwcw9TdhdIQOHMQ7+rAyOqiJ4Pav29lOWFUU1huGBVgPMig==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfsjs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c85c9a756so47441646d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463128; x=1794067928; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KnpAwYJakalTKmDuW9ff0h5zFEmFAGhrl/uCVIa7jTQ=;
        b=YFMAy8oD+bZ9CLRs+OJXeaRNfDTeJRn83zH5HmQTFQPRjqZTjr+P4Oddidr5y9rDKA
         0aC4sgX983gJI0LlXUHls5ojivEu3QExR/JV+wAZ94KRM8tzyPFuOfHA1SYCf4rtiGVG
         eIBut4NYCCrX69IgOzzopLwDwbPEdr3ORbbpO1WqZ7KhYHji2wlnq+cctRAaa+xQAOtp
         bPe397tGX4SLfBOLdOjM+etjE4TXgxHCBHiansg4KK0BZjm2DfZAaytguNvi2uI7Ifxu
         NEEZByj9PVGD5pktYJmvWcQRijXWNgkXjtutIvrrgg2vppgqfRJlsqFktV/evH/glQlV
         EK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463128; x=1794067928;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KnpAwYJakalTKmDuW9ff0h5zFEmFAGhrl/uCVIa7jTQ=;
        b=MJ5eTSOKKcDFP2VCP603nPFGC5sScTTA4+ecXq8q6LlW1FTkkQjHj2Ubui+49tubqx
         tLFzW0vadrd4DBhEgqSg9BP+uMOO6NgIgm7s/7rnIfMDzyQbZUZSPMT4s5GnlJpj47B+
         Xcu7Ul8f7V8hZ7xy/YfHWb10YB8oqlZiC1ioI0MlZBMzcDF1Footl3uk86t+41nSMfhB
         M7t5MQdnXIRTBZmRkafR4eyFhQmFdQndCmA2Ejpo/nWdZAOi2MgCNMDF7scGpv+eoQ3M
         832JgNMhsHGcFSlZAT1x7BGpXXGVbqNiwGCCISCNzZian6InPTSCfg+OvsHoX7EfL+CH
         eeoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdrQoLZ8M86e5aTC6ymGMFjPZeuvthMqpPrE/NUX9EbPVWl6BEc2KdaVT7ysFiN6ARi8jq41GAok5lOzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpNrJk68DApEfnXGGP8OwhsOvnObktfMUz1gwG9wy717xxARO4
	PXWJeQd1odyWnuq38g1M+5pM1NVLFPNxk0pr8kkmOoTvZ98Uq33DUv3fBUPRuxOvfxToHakFxg6
	SVHAtGx0NmDmmhdlwtCCZ+8R1H6g0SqQPZPetmnwcMV09+pw4nl0R3zgYqSLyPPqFMxA=
X-Gm-Gg: AYBFou05vG1Z4QTsgtsFqC0aIytgdxOdRipHPHQDKIHLdOSQL2NXz4lWjQGdYjNJhsZ
	6IZLRtZVisNSCh6GzJ316uIk1yTyvdgTOXcLy/IYeNDmMpsp8CVZneGiUstrNGlwUw4oYoc4lWH
	IZ5PqfWFqvgoDh7RPnqhWErmUqKVfKTeTTGLS21Fj9eXNux1lBTgOsS50D29xNlL+8RAsMbCJKN
	M2JyXw90jCmAad0iwDo7oA4YLiNofDL3FglIOTkP9e1zNWzbuaBnajNQ2nbxZ/D62tSy3agLB8a
	YtZF753bPpWt90HGyMNl7P2js5wn5KcsVXb4N7iT7/gj/TzVnR6hmmIrnttge2TUElNLcJs/PyS
	nwJTHj2lJp4F6QuYwH/T0ClE/Uzogjk6RQNxDyv2PLE25IkrAFMwWdIAdb6czWOZjYRRasRJ4ND
	g/sEVx1nvhbnmOv88SSCp2jNEWx/v3X0ywiCSgHsW6QMhFqiPc5gWiqfNRK4kmpg==
X-Received: by 2002:a05:620a:2b89:b0:943:f31a:c0a8 with SMTP id af79cd13be357-94421630598mr826643385a.17.1793463127697;
        Sat, 31 Oct 2026 09:12:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:943:f31a:c0a8 with SMTP id af79cd13be357-94421630598mr826637485a.17.1793463127027;
        Sat, 31 Oct 2026 09:12:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0720e3csm666666e87.28.2026.10.31.09.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:12:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/4] drm/msm/adreno: keep the GPU timestamp monotonic
 across power collapse
Date: Sat, 31 Oct 2026 18:11:50 +0200
Message-Id: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEYT5moC/32Nyw6CMBREf4V07SW0lJcr/8OwKOUqNZZibyEaw
 r9bcO9mkpPMzFkZoTdI7JyszONiyLgxgjglTA9qvCOYPjITmSizWtTQSVC9x9FBMBYpKDvBTep
 alnnDu6ZicTl5vJn38Xptf0xz90Ad9qu9MRgKzn8O7cL33n/DwoGDqPJCFL3iUuqLI0pfs3pqZ
 20ag7Xbtn0BHw1wi88AAAA=
X-Change-ID: 20260828-b4-adreno-timestamp-f4c846391b97
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iUPiR6Fwwwm76HjO6myts5MQhGFZw924ukeGRKJiGZU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5hNIjrJ7ma/fmE2HB2R3lfL6UedlIjnc+2MJe
 IRRC4wpS7aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauYTSAAKCRCLPIo+Aiko
 1W2cCACK+v1s3+d/M9djYv31k3HzpmIDFp1pDkAq4m0GtcmPbfhaA/6MtYZ2BP/Ssn+9GLMvv6k
 +HG+34ddyJk+yWdeKs57i06WrvmpbnQ+OKR4TlqGCJmWFkbLKAtGik0Rp9qk1GoB5OYio0h5zZE
 11DfzWo5FnLqDks8GwB2x8O3jUQDN94WmPebQlyUi1FZv+R3zgnrKz9lle0QuRWOR5fOoS+xodB
 DLNotlmoUndNv5D4GJ2Y7f7eGhD8EkTSqRjQC/evSxokz70qNLNTiFLUDy8y1MGKE7W8Fs17Ccf
 kjfHeX4D9N+FrW6gOFHsEBAf7HPX7NDMZKpD7Ut61dSkRksw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfXzVLGfC8oqgd8
 0W32+4OcABkzGVxW2x17UOEB8X/MOon2Ttx8PVOwFw3IC3xiljQuYbHUAj3crzUrDzAPtLtpmgI
 kXlkxEAD3CS3VGRT0SjfLZY1I1zlsvQ=
X-Proofpoint-GUID: zLXYRHw46rDzTJpDtocMloqoKnvIjpbX
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae61358 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Laz_JB3cWz3Dvis22pcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: zLXYRHw46rDzTJpDtocMloqoKnvIjpbX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX70r+6iquLewP
 Gf0arwJ41sSZqP43VBZhkLDAyrW3YCk/dJYkRy1SY6NHjAV7sZMVDaM8gUYRnBGMCqG5WPKr9e5
 lXlpf3mosB0CybKTJnAYOmkmqQebejMsRaoOaCuwGU+QBhKqgoPnM61CDUyEn/Z9tQTdoQPIzDg
 NbZB1uKzwZv2hs1+jb5zSL3kPpf6xcWlKDPRAhaGOvouPSIlWzyPxQKtK4ukDtB5RBYfTMvuOS9
 MxsbT0qWPTN1oswNhE625gt4F4BjUx0gozzzSIM+vsz3Dv3SdlwMjB8tZTsCog/VCKRhV6hHTmi
 YzuuVunPRDjTqFhJI6MrKy4mv0Uzfszt+43ejWCyvKQPEr/aMl6bmfmBJNfprEV0ngE7yQbcrZg
 FNEFhPs4Rsuk9PxaDRVFH8zMjMlVeFNB5A1EvxoUl8wWyzGElA9OkoQoEmMoGpFONakCWM186e1
 nqtTmVZK5m+Su72/fBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

Before a750 the always-on counter behind MSM_PARAM_TIMESTAMP, which the
GPU also writes for its own timestamps, restarts whenever the GPU powers
up. This is the case on the GMU-less a5xx and a6xx parts, and also on
the GMU parts before a750. GL_TIMESTAMP, Vulkan calibrated timestamps
and clGetDeviceAndHostTimer() go backwards after every runtime suspend.

The counter can't be written back, so keep an offset that makes it
continuous, advancing it by the CLOCK_MONOTONIC time the counter was
stopped. Publish the offset in a new page that every context's command
streams can read, so that userspace can add it to the timestamps the
GPU writes, and report the counter with the offset already added as the
new MSM_PARAM_TIMESTAMP_MONOTONIC. The page isn't mapped to the CPU, so
it needs no sequence count. MSM_PARAM_TIMESTAMP stays raw. Where the
counter doesn't restart the offset stays zero, so userspace takes the
same path everywhere.

Tested on a512, a530, a540, a610, a630, a643, a650, a660, a702 and
a730: the corrected counter stays monotonic and tracks CLOCK_MONOTONIC
across runtime suspend, and the GPU can read the page but not write it.
With the Mesa changes GL and Vulkan timestamps stay monotonic, and the
OpenCL CTS device_timer test, which failed before, passes.

For the corresponding Mesa changes see [1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45806

---
Changes in v2:
- Left MSM_PARAM_TIMESTAMP raw and let userspace add the offset, so
  that it keeps matching the timestamps the GPU writes (Connor, Rob).
- Added a GPU-readable page for kernel state, MSM_PARAM_VDSO_IOVA (Rob).
- Added MSM_PARAM_TIMESTAMP_MONOTONIC for the CPU side.
- Covered the a6xx GMU parts before a750, whose counter restarts too.
- Dropped a4xx, whose get_timestamp counts GPU cycles, not 19.2 MHz ticks.
- Split the change into four patches.
- Link to v1: https://patch.msgid.link/20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      drm/msm: share a page of kernel state with the GPU
      drm/msm/adreno: add a timestamp offset for counters that restart
      drm/msm/a5xx: keep the timestamp offset
      drm/msm/a6xx: keep the timestamp offset before a750

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 13 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 21 ++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 66 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 +++++
 drivers/gpu/drm/msm/msm_gpu.c           | 15 ++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  5 +++
 include/uapi/drm/msm_drm.h              | 25 +++++++++++++
 7 files changed, 153 insertions(+), 2 deletions(-)
---
base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
change-id: 20260828-b4-adreno-timestamp-f4c846391b97

Best regards,
--  
With best wishes
Dmitry

