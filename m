Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810191;
	b=M0AONdpmiHdSTjEeGWpJomtFI2WTdt8X/YkW40cv6iFM/Q9COB82g8X8TpW1Y2ZDYThE
	 f0egqUhdqibdT9gY8sQHWDjbXUn5/871/MSWWRzpUvCs1Wby8XovWcHnnmLFizC9D9BOL
	 sKMIthGuAtEbk9Mz7VmrDdUjWduqMNGYvoRc0J/9BVKV5eQpgzJLCBpCxrZJElntF66e1
	 GM7l62kncaLDfdb+fqUUL/yluPLAgu1tMoxe7FURyH0vFVAwsHv+1TG+C25d0gtrUXUT2
	 F4w+QqixEIyJam95D/KVPp1TXcHsnr/XKP93tD/w5WIXklqiKvSDDWcee6BhbHK262w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9Q97qnHrubmaTZHUF0bE0edWN/XleOsKgIjXjH28YHU=;
	b=eBNLd4RCoDp17T/z6Zh7THt6BQ+8XJndUqlZ/GqrnJmTPLyAhgnvRV/bjVlGmlgUzHQ5
	 1xRby5ATS6GYIsf1d4wtG8WCUYcbtvbjsVqLTAqQcW9S9kDifV4zqcbwNlFeas8jpzTWD
	 TehOx09HOQiudvIPM5Ku5EqD2Pa/fUs6KTknMPpfMTtQknkWlZzIkUhrYdUvN8NVTq0JO
	 xapEu2WwYLcBTm+MjmkOY77BGDT+3vtspBOT0I5U/D0L8spa/m9AXeEJPF8J3MmT0GdSv
	 oOdmawWwtel4/PdQfTeMjMpdGweXRSzJ0dG8lCsB+bUdMqZhr/kZQlXElNHuhZ15kug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ShPH+nR+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkOHByB0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98437606D81B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98437606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ShPH+nR+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkOHByB0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjFXL1692632
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 16:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9Q97qnHrubmaTZHUF0bE0e
	dWN/XleOsKgIjXjH28YHU=; b=ShPH+nR++KomY5SgjajC/D5f0fxgie58a2bOjo
	6pmVBhKn4bC2VH5fuEZEfXJk08YRoO9VjBVceiXeaq97T977R5fBWqw8naocWcoG
	sJdwpdN5yFmHlJgvDnJoP/OyCcQsPyqUp95vkboN7jK7M/8EijXCt8PBSwVjpsZl
	8zbjodETeI2Y9FNHcs22jgvLOhF2+BN4F2gUmimH3yRaNRZmzcbGnIntrTibI/OK
	qr/Ky7dGBjp8RbU8deOUb78Ia5wg6q1L3kZqmCLefhe0J/8Mt7lMsw9qqmriv8so
	AfIX4aV3CVlebJKHjJ5jYzqsuEHg2y3bFfiud5v9oSLrysYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br0jj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:36:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so292317985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810189; x=1794414989; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Q97qnHrubmaTZHUF0bE0edWN/XleOsKgIjXjH28YHU=;
        b=dkOHByB0acCDa17DbFUUlUT0s9sFIFWdICJs+9q4f3Dspze9OKJHqK9LrpN8SkOrDh
         9xzi2zlUgZniRzeCPMeMlnvgQgdEx/3Vs8+oQbS3Ch9KftNrVrY5HFGscBoZEuHUzff5
         Xw9lsaAeovLQt6U8e0xUJ9LysXXBWInUwxCBGwbJeqahzK7I772/wTehUXxve5Nl8ews
         cSLPdOBMf76px4rWW2XeFNHaTxn+jdv7+AyKh/D3x6hJtNTRt8BFdw83TnNzT1sotvO5
         xjPZrgPMhTvwP1w3tKIX8F/HoSqIlNOh7TddtgPqZgm54jI++B0HAKZ1OaduEOif6ndy
         59/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810189; x=1794414989;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Q97qnHrubmaTZHUF0bE0edWN/XleOsKgIjXjH28YHU=;
        b=gdDr3vsF6rm7NNt+McJxxoyFjn1d5fODbUXmsvs7ASxlOm8l1Qt5Id2jJEAzODzme+
         FABP5H/ODim3Rim1QZ6RsWdi7JGPVH+LWE9SkfbzByUTIl/hibiXV8YFfJ8duDBKcWr0
         xj6h9c4QFFS0G2iHvFUiixsdbjatP5Xft8f4vmQs9fR1BMzewyZJFI6mL0L0yTuGnyCC
         ZR3RkNiW0xOugoaRP2PaoVvpHnFyqCtJOHAhTP4Kbi/PlR8mUZzLAzioqdx8egI2mt/5
         qyIVsauJjdS81mah9QV5PPMyaCwIUulV+4APWL9xyihgAvSAUKnU5kH1cuCAY15bX+HM
         5svA==
X-Forwarded-Encrypted: i=1; AKwUvBzQhSIwVKDhAAIaETJ6ME2rab39UWJ7ZO2S1ZRQKUdo135I12b5l+rW1cPZ4Z9Ky32hqyJGBZx6G85O32U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wa687NtLoEnwMlf5PuuzUIoIl3brXtMYBoCSN60Zfmn25dKQQ
	q6RXlhYXzrObApd9V3lr/dTMKVJPqCg4ZY+5Od/cPaUDHlgr3NAvfUprNCZxLfP85Lp+Os6XQyK
	gDDrYcsJCnNKrGGr29448ttp4q58zqfLpHkgx9mxYxGWIsQE6hNqgbKIneL6ul2SEiWw=
X-Gm-Gg: AYBFou0bc2J3cNVAZgGGW7JW9SrpHsPyXG/KLJBCtEEAinHOZAIGqMCjcGi6NXRJqjW
	LZEL4aRumA2v52NbrtnsR4o38u8lfpNxFcsj6yN2SO7jx5krq2v3YXsSrGApAhKOmoRYY5+QduQ
	8t4etBYO3x1m0fD+bvV46y6uheItedcLytMOMvhB8uVyqjJ1jRekevpDijl4ImnINur9vZ2gDTO
	swaatQSfQdhvglCfbpoWkFdYfOiNX9oJf1wfWcSNchy0aXm/S3RK2cpL1PPCIa/0moMRS5qG2FW
	wW6SEuchd0CxDK7J8NV3iOC2TC9jharq/WcjneSjUDoQ/M5r/8RnmgVr47OsticC+my7A6YobYe
	4n5FmDfWzL+ZEu310IvPtQsbh43GPCuyIdyCfX6Vg5h5YPNjUWO2nhATdO9rR1pMV8JFJ17FtnH
	NbXy3uPZ6HhQXrk3i3zu5R8hT6Orp2PRuhS7Nnb3hKq2usMS5vaEZtq1OLYlIzhQ==
X-Received: by 2002:a05:620a:4043:b0:93f:31f0:6a7f with SMTP id af79cd13be357-9442172a5c1mr3042994885a.69.1793810188448;
        Wed, 04 Nov 2026 08:36:28 -0800 (PST)
X-Received: by 2002:a05:620a:4043:b0:93f:31f0:6a7f with SMTP id af79cd13be357-9442172a5c1mr3042988285a.69.1793810187938;
        Wed, 04 Nov 2026 08:36:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/msm, media: define the UBWC buffer layout
Date: Wed, 04 Nov 2026 18:36:04 +0200
Message-Id: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPRe62oC/yXMTQqEMAxA4atI1hNog1icq8gstEaNoJXGPxDvb
 mdm+S3eu0A5Ciu8swsi76IS5gT7ysAP9dwzSpsMZKiwhhxuzeGxC3GqV2yDV3RlTsaVbHNHkLI
 lcifnb1l9/tatGdmv3w/c9wNdQwP8dAAAAA==
X-Change-ID: 20261027-ubwc-format-docs-7942079e1472
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2859;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4SH0JW1dB6WJf33quabAd7eWZqAqkw4IMlKiqa5Y7Dg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq6173l4RVxdwRlHhknfY4lR4Zsy3zNSfsaf1M2
 G+W9EjzeIyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaute9wAKCRCLPIo+Aiko
 1QfaB/kBUdmO9yyqMW6ounuavi0h7rwPMCooaVSZ1lAWrvU3DhazqXlPzOzE007FWwQ36OjMeTU
 WcVph6vBSUSFtxdEz4ikzgDuN+b9NUPDF0AkhMR/ch3YJ6sZ46UJM4DHKy+KRo3pnsP6XJ91UuL
 /UZw363rTFmiI/Az5TBj2mEzq5mhxRutwCoAjWwqhWqxShKc2+o5UHkY+COMcEfe7TP52YFeWoH
 6xUxbFwtPr7EwPuF4ZZBvqQJ0mchfsPR1YWPMEJAo20H7+AmM4I5Nkn7shnMLz35G78lhhTs8kF
 iQwL8udwqPdjUA8GBrxiKHy/MGK7TWD28DmoyHeV98WXTV7A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX3Zca3Gh68/7W
 RXiC7rHvYR1R3LC6fce4ib5MmlRgenZ/HqH0Srz4r/O0vFrKSLavhd+JCQT1A0CD7XhUxw9ykkD
 QciG4gZYZCkLSkGbVdsS/PSOyF6NtRL0wm9KUGwUE6Fs0QrW8JwH/6zzKX3kWwJkx4bg0Tbb0gV
 TE8/BX9eQCoJ2My/vP3zif+xCsED+qqEaCZhgkXR+ClwTTvAqeDdeSUhmrRXBt9ctv1o4Y8HzZK
 ztEj1t/2LB4E1TrC3dul6GMIHXPXiq8Yx0jNpUxNyJ6AGcLvdzjpNu+G47H74yKLSMOCfcueyIj
 Kd4/dGwoI9rqtWIjEVcHVDhqT5fgeAMbvKO17okFm/Q+XiPmD87ktSlZswS0s50jLPczZSKfPYp
 vMJ7FgjMsz8kGQUTS80vWZ8PXLj92QKO+EDjPmiFZGhDim8hh0sB5OQMw41/bBIK0kjyY+XEQG8
 YviSAyvh7RY7OvNvzIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX93/JnECTrGcj
 VmlnOe07GJoJ03HWWeZZlfZXx2i6CwObEdTzR/T+vpkRDy5IOo+AkWYNlgmQo21YoDP4Qszo9uy
 6T1wOjuQQZ6zJmDe7ePJsvzLKYPTamU=
X-Proofpoint-GUID: c-Hen4in5s-SPqBv3wgTIkQl7Va8cbiv
X-Proofpoint-ORIG-GUID: c-Hen4in5s-SPqBv3wgTIkQl7Va8cbiv
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aeb5f0d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=D__o4bQJyZzLvQ_PEqcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040066

The layout of UBWC buffers (DRM_FORMAT_MOD_QCOM_COMPRESSED, V4L2 QC08C
and QC10C) has never been written down. The V4L2 formats are documented
as opaque with four or eight planes, the DRM modifier as "macrotiles".
In practice the video decoders, the GPU and the display controller
exchange these buffers, so each side has to reverse-engineer the layout
from the other drivers. Nicolas Dufresne asked for a contract to know
what the V4L2 plugins have to compute when passing decoded frames to
DRM.

Writing it down showed that the display driver never validated it:
msm_framebuffer_init() checks UBWC framebuffers as linear ones, so short
buffers are accepted and the DPU reads past their end. Patch 1 fixes a
misleading comment in that code, patch 2 moves the layout calculation
out of DPU, patch 3 checks framebuffers against it.

Patches 4-5 document the layout for DRM and V4L2: metadata followed by
data in each plane, strides, line counts, tile sizes and alignment,
with the chroma size rounded up as DPU and the vendor headers do. For
NV12 the CbCr plane follows the Y plane in the first buffer: DPU has
always fetched it from there, ignoring offsets[1] and pitches[1], and
turnip reports offset 0 for both planes, so this is what existing
userspace relies on.

Patches 6-7 bring Venus and Iris in line with the documented QC10C
layout: Venus reported a wrong bytesperline, Iris called the format P010.

Mesa 26.3-rc rounds the NV12 chroma size down for odd sizes; that is
being fixed on the Mesa side, before the layout reaches a release.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      drm/msm/dpu: fix the comment on the RGB UBWC plane count
      drm/msm: move the UBWC plane size calculation out of DPU
      drm/msm: check UBWC framebuffers against their layout
      drm/fourcc: describe the Qualcomm UBWC layout
      media: docs: pixfmt-reserved: describe the QC08C and QC10C layout
      media: venus: report the QC10C data stride
      media: qcom: iris: describe QC10C as TP10

 .../userspace-api/media/v4l/pixfmt-reserved.rst    |  63 +++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |  84 +----------------
 drivers/gpu/drm/msm/disp/mdp_format.c              | 100 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h                      |   3 +
 drivers/gpu/drm/msm/msm_fb.c                       |  39 ++++++--
 drivers/media/platform/qcom/iris/iris_buffer.c     |   2 +-
 drivers/media/platform/qcom/venus/vdec.c           |   5 +-
 include/uapi/drm/drm_fourcc.h                      |  54 +++++++++--
 8 files changed, 247 insertions(+), 103 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261027-ubwc-format-docs-7942079e1472

Best regards,
--  
With best wishes
Dmitry

