Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114909;
	b=rgdmrZufH1BPCDACH3zMxcgwT9c7IJIvHUMdN65BFsHqfzqBgKhXvofMRfuVo9Ac11lE
	 +zo64Q1La0MAuj2E2iq7PNk5ucZtkyI913DbjwBfhzpE6ft6q+2P0QKAqK8KfkDZ7JlIw
	 VfXJro2INSwpPmCy8kIQ/YhOe92dEukvFaJHPO560bOMuCsD2aK2fjZlve60W7xkyhIm/
	 2NxiQszidj2g3YZOgJQWLjOpyWKmlFdDvSEo/9SllnYdXpnEdYbENGfb0KZiHKscLUCW5
	 zIaRdnXlXmOeIxCikwUNvBA4D6JoBJRHuS0oXV6MV8gk6WkMFmkDMPROBr3EE83vgHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j11pQ2O0YT41mdxr21xy8gY+VUqxGKTMnbtrD9kSBmE=;
	b=g0dpglhwrTiKSzUyPZ0H/qCSX71wV/nKhZikw73/y3WctVttgD5Q0Yl4wd3Bl5S/y6do
	 ++dNk4SdQqB0lwfT/Gj5fj52svZ6Eq38apLBgwCdNnr/fT5d4oqEWqYyWyJYHuucrbAr2
	 JD5WBFHjnL55sxPAD5k8fDjrxpEJFXGNuEWjG9D7fklelabyBesa++3+gsXQovpxQckgR
	 KtGZNW4/BTnJY2hwIKWEIX5iaeWmrcgk79lju5EqOirrM+q2EwZhCsLkFexGSTrsEEojw
	 t9XHuxMGVECUJAIaaAsXMbWvVM9TkFrSjx0gRIqoYR+D3p2geizbPxsGBoUdEfTQ5sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBy+oZfl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJLKqphB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859DB606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 859DB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBy+oZfl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJLKqphB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL5Ke2242302
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=j11pQ2O0YT41mdxr21xy8gY+VUqxGKTMnbt
	rD9kSBmE=; b=lBy+oZflsvqtslCvzxtqG0c4xqH7dnJJhmMPkws2GM54rtmXjgc
	rTmyT0qxzT1t5EYzEkX6wjtNSg/Mhm4C/6WkBi55R4hnUhbqGE7+F3XGvfKXtaRo
	02phNg0ttJLlDC3fMAgYq7TXj6eMBnpBOfY6Au+gJBv94F2gbP0Yjn02q8rG9Kkb
	D0x0aLsL14PzGcI0mrhVOyxNhqEWOQ0Eo0bnA+kt5W7LRX/mFND5t3JbHCz/OaZy
	eOPGkQpU71kCwarIs4Mfpt5+Uh130y6mOl6iLn67RloI6bap3dq5uRTe5KfEzR53
	TkLwLc06N0IrPcw1ZY8y/lHFlFy/0i1meHg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5sy94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so13695b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114906; x=1793719706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j11pQ2O0YT41mdxr21xy8gY+VUqxGKTMnbtrD9kSBmE=;
        b=VJLKqphBtJEnkJYionBOlZEH2eCXiXkmAI8owrz2buMC5RbL7TC6W2mPYvSp1scYs7
         /JKeayW2GiE3v3VGB+0H6o5zi5j8lq5xbH0w8OerfSP9z04ZLdTK8TE3rk2CblYcdBLt
         xPL2ifWhlySwWIsGYL/SloutRK/xkqc3swDRC+UN5VBkM2iJdmmLm5GXvZyJYXZjOSu5
         bR0Z5FI6jnf5+ngJZAyEVaNMdBO7AMXhwOsg8BZWenpuTYTevhR18vEBqwSMLaXLoWwu
         QufCaLIqQZHyB2sb70aiJ2F9Tdu6PmEIrK7bxbzkAz0aDdfMYfGoW5pZyqx7V9fmEpvl
         8lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114906; x=1793719706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j11pQ2O0YT41mdxr21xy8gY+VUqxGKTMnbtrD9kSBmE=;
        b=CR1Mj21G8Z+xdfadKDFXeUbs6l7yUzQyL90061eRplXbnvaRkWM1ed1kveqpmyg5W0
         Jit76sKWJavJb75ztnpaGy1Jb2+CoWLzZRH9vub6TLz3NB7wDcvM811iAdz3FJlEPpmD
         qxui/7z/gc495zNIumjCB8ij3a7t+IOOjP/mBUFnpzUVZLTcKiDlwUzh5rD2dkuQegPO
         p7xSpqjgyvYWQe6dLVEQHQzJHgzSXfl0sn9i2epFzQ5cWdTc9Oik0QD2NtlD3qCaXOg1
         6stE0XRGiAuHHPeH8PL4VyAZURL3dApRI4AKpCLwZr1hEANCdpRZ8pbOvvlck8V1YNnO
         aPnA==
X-Forwarded-Encrypted: i=1; AKwUvBzL7wxC+PO1j2LcI+fHbc3/2JH6EINu7r/wgMYhdQv4wFR5k+jyE/KdHMrHywXzix2GNZ8a8B8cnD1W0zw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIRqSb/Ukr2ODRN6Yy3piQlYiRcY9avcVr25Y89rh5whgwI0am
	YqXHM0EI3TTKQq0B4p52HtlOkF/hqYAEeqdmCll4Hywn1Yej9WhgZfmrUwTuET0SS3pIOo4H419
	VHZYp/4Q231EQfnc5EJpHjV2RX3VXs6ZVg02cyJg8TQcXhZgfKD3Oo7R4ia8Tg4WfPAE=
X-Gm-Gg: AYBFou2I3zLmKJHWE1HTa6Ro137j3l6jY+X8ik/XDBG7fvQrAHjeKrxK1VIrbg/SD60
	+e+/aHNmQBTHBsUKnuF1uxNQCrnzNPr3kxr8q2MUxvCaUnxK0VHM68WFvh0VZ3LQTmudqUDrkfE
	gdLgqFbFk8pvhWxMVJGjdx8toDnqkZd8K5TmR2TFe7pVoTNrUav1Q3vgK2yzXqtOYS9MEI8lkKn
	OHoI7EW/fwEwqcSsmMfbfq6ZWJBmxKp/1YLaN617ZoKH5CWokzwcl60hkfzfYOlEd3NceGibWjK
	x/s+A2uMzIplmv5HhFK80GH5qQmluYMiMx4FbsLMxXpavxNtb+0jLrRl0Bzja3tsOEG8lZSlaiD
	R0GtwBJ5wCCR/17WrkYR0SuA8+8CovP3ajmXpT823nbIvVT6bYg==
X-Received: by 2002:a05:6a20:9c17:b0:3e2:26fc:2e1c with SMTP id adf61e73a8af0-3e7bfa9cea9mr7731251637.39.1793114906381;
        Tue, 27 Oct 2026 08:28:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c17:b0:3e2:26fc:2e1c with SMTP id adf61e73a8af0-3e7bfa9cea9mr7731232637.39.1793114905906;
        Tue, 27 Oct 2026 08:28:25 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad33b99b2sm985434a12.26.2026.10.27.08.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:28:25 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/5] drm/msm: DMABUF_DEBUG fixes
Date: Tue, 27 Oct 2026 08:28:14 -0700
Message-ID: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX8sYkqMCQRApi
 sksRYDta4I0JrmV01yJlX8WHl7M8Sx/elSWYoog9B32WxHgByLpjruF8JM6H4NxflcQn1RtWz9X
 kAFOBeBwhsz3OvEWnS3vbmtIsOxZTlo=
X-Proofpoint-ORIG-GUID: ztXHDG1dJruEmwuV95_z3etEpS9MfUm1
X-Proofpoint-GUID: ztXHDG1dJruEmwuV95_z3etEpS9MfUm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX0MNdnU1K+ghn
 BHrbt4ssoBdEN59Vz5rM+NTN7UwyT5BBpBvKxUquh5Te9af0dfLF5b/Fy3pJt+w6LK4MyHUvN5R
 CbpSXO59QMhJrUqzkIBgFCJOIMBIEQ5SnaTW3E49RnlPu/1GiITpa8/mPEtcQGYoiXnwLZqoXCV
 wQi4Is8rvuEK9ZBLdvWrkmauTHH5rVaHSKz+aXmeBQ9+zM1oa/mnl33KGjh9vPwK5pG1KJGm23n
 NZFeYJRLyx+wezclTCq6xrNzIzW0rOBVWCowjddlv2vXE8WiqewCTZK6/uAAFC5fEDjIzRAmJkf
 Ui6/9yRxTeP89smNGpIUVXC82MZP8Ix0iGS3bQfk8OMGGAU2xfCe3QKUGNm/ZzO9wLAgwLMwq/0
 fwmIf/J1DsTggAtMrEL4u1VQweoIgF+qeTQccYIczGMQ+Rz/70wN1QCMXih+rHjA9T8J2dysfqT
 bvTY1jneNFocVPEHfgw==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0c31b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=puu_XB033Gd1UDA3wS8A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270061

With DMABUF_DEBUG=y, the page information is stripped from the sgt that
we get for an externally allocated buffer that is dma-buf imported (as
opposed to an exported GEM buffer that is re-imported).  This is a bit
unfortunate, since we need that information for mapping the buffer in
both paths:

1. Userspace GPU pgtables (TTBR0), where we use io_pgtable directly.
   Fortunately this we can fix ourselves easily.

2. Iommu managed pgtables (scanout, kernel GPU buffers (TTBR1)).  In
   normal usage that iommu subsystem envisions the dma-mapping and
   iommu-mapping are combined.  We can't really work around this but
   we can stop trying to pretend to be a normal iommu user and just
   go directly to the iommu_domain_ops.

This all depends on being dma_map_direct() for the dma_map_sgtable()
to work.  This should be the case on modern things that use arm-smmu.
It's less clear when it comes to older pre-arm-smmu hw.  It's possible
that this series causes those things to catch fire.  If so, look to
commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to select
direct mapping") for inspiration.

v2:
- Fix missing tlb flushes in error paths
- Link to v1: https://lore.kernel.org/all/20261006131000.81501-1-robin.clark@oss.qualcomm.com/

Rob Clark (5):
  drm/msm: Cleanup if pages_to_sg() fails
  drm/msm/gem: dma_map/unmap_sgtable()
  drm/msm: Extract out map/unmap helpers
  drm/msm: Convert iommu map/unmap to helpers
  drm/msm: Convert map helper to use dma-address

 drivers/gpu/drm/msm/msm_gem.c   |  57 +++++++---
 drivers/gpu/drm/msm/msm_iommu.c | 190 +++++++++++++++++++++-----------
 2 files changed, 165 insertions(+), 82 deletions(-)

-- 
2.56.0

