Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395979;
	b=im0piEg6I0Rqq2gUz8LSqXPMbEaH66kLA2xcfo0QHPnmrzT1VWvJGF7RFrubF8BKZzJo
	 zPmq0WyfxXbJd84Xh3eHIH4ACFw5CWEd3ocMt02ZwnFybzDs3Vm0vQ4+5TlQ1IuqXTmTD
	 gLuw7FacI0BuHzuwERsYdorrrA/hRuuJZWXjmtH36oMLieMMEhnMlrekAFpzFok7PppHm
	 2ki8THgl9tz0yIvXPhiQJrPPl1hnYRd4PiKf/kXvuxt/jVccpXNtuQj6fH9f7W5sgmwPV
	 kWDquCFTsvixFcymIkX1NwlxDXLJpxyktMwrlJ9Zb8EReglxnw/LjSyZd4VbGV+7X1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395979;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=paS89U6ae6+JjAm7XDJVwYgoty+ZJJfzu7sx98FlssY=;
	b=gVkveHRlE0RMjdjm6NFpyW02fUu9iFFybGi8KltNf7/Da+t0OBfsqgN4KQRDJhotET/E
	 3O0ZUsT3tsU99bmsD49M63NRvs8o/r1PUJrGmYvEHPI1hOYP1LiXU7FDzaJC26TttHPzY
	 1A1nzJCEHkipfSJp0lsBaHhbqW7F+tVe7n7YZhgTXbHNluWqFNSq5op67oeI0Z99vuD1O
	 W4BmqgqOcqnkx4/r5aAlVs+luZ8O9tmL7keSUoTAV4MEnx3hm16mTcoujJqecUScs5OPD
	 71aubqvMnJV7KykUPU+lAh4RNfF3LzyreCpbqWvzChAxnFaNHt6YvcYOO0QP9562LTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YI3GF1n0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SoTWyd70;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCD5606A331
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFCD5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YI3GF1n0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SoTWyd70
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULB4k0800548
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=paS89U6ae6+JjAm7XDJVwYgoty+ZJJfzu7s
	x98FlssY=; b=YI3GF1n079bAY2C8ujlc8Po/Y3jsVu6gXtBMHCDwaYJgbTCKOwq
	vP31L01GlI+GjcvFCTWgzxfn324og+cD+s20RI4K0S1HAN8SX4e9EIj7VjkFoEff
	rAZrCZcRWxRa9OH2MobRaGCKphCp/JgPChiZmMLTUW4Upc8rXzzbueTw9nUnI9/3
	BDDR9ohj/DKvo32alfb4KPvpqL2FQhf4SA4UFawF/Wmg5VXg5ZLUyeOoPMs9HwjB
	VX+rhcNs6LK0fwuKpdCDb8DWTvRq8m93yMPcJap7wkdfRZMO++GFH0wnBigZ0gsh
	BtltwK4OZmZ/SM2sa6iPcx5me/tOtlfNTDA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x1052w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:32:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so2573178a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395977; x=1794000777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=paS89U6ae6+JjAm7XDJVwYgoty+ZJJfzu7sx98FlssY=;
        b=SoTWyd70Uu8G3L5iHParACLiuiThIyEmdqgYZXuO0Q29CEidR0B0nmK3iHCbsvs1/T
         mxYnWJNbsz5+xMFc7JAeagL1mdgVIRblNC+Kgk6uSppbN3EiHFjLmBjClomncEmACvnN
         FeON9XKD0ePa1A1YwDjC0WXXQJlU0UWSwMkbBt45g+6f9LpFlkO7HbuoI4BUi3IvN0T1
         9A8dIgwWMjCfUEgBAw965mEF4ds7H+NgVlCyBFv4lI0SGFVJeRq5VlPQrDYx5nTV/EEr
         MTDrbhIf+u+tDYI+UEofWLsD5M4wqtnuZ/AfSLt1wb1Dr5x1Kh1la7cNjXx0e6il3Oe7
         ZIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395977; x=1794000777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=paS89U6ae6+JjAm7XDJVwYgoty+ZJJfzu7sx98FlssY=;
        b=bGfjXEmqWERjtLZusNpWSbCA74AkcsThKP+LLwGq9KZKNiaN92Ng28L2bvV2SZnxoc
         +logaRmaFmzMq5cZfFnqodXcFeQbwyQOq6TIDSo//IaMEcF7Wp/qKbjarY8tDTI1T4Q3
         4xjHJSB1swA/o6GVmHaA+2X3EaswfDeGN/4Tjmdnh1f741BfhgguClEifdFVBf9TC8wO
         /yzBNVNuuz/Hsxc2O+V6J6gR8yQRfmCsq1EFpQZw2UGvQ1xaPW/x3OQ+OcmDVHrmUYN9
         WMjKJty33RBMagGWoBce8abHQ2uO10uIm5k/92g7KPQ6SAxnV0wDqxFiryN7h4kdefcM
         PyjA==
X-Forwarded-Encrypted: i=1; AKwUvByVb2HT1KtZmdi/m9Q/aCEjvOHsxRfgC70w2j4patRVuuhGugJOtZWdDn3eCQoZD2ZZqTjMYC91XBB3Xj4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLO6OIbcsYbIYdspovkuin8mh+IbQW3Pg1cauz0vkXc3jQ1XjGN
	2TSlcxLjYLtW7Ti1ooMHff66SYPo3RLZ3bRMDBoAla67BNEWrSp996FLygv6THsfZr9sB7ZXViQ
	gdbqqdgy/Mc2e9inmuZu5HK+8uo3EBWT4EULcDOCKnBo9MVyWXWBX5e3msYttni9rALBQjlIoXa
	67EQ==
X-Gm-Gg: AYBFou0isxzEmEx/1jNCPmxDmWwjy9RKbLeLCjnZ2Xa1JHE/kXrD74YMR0ygQJsC5dW
	tVTl6QJJE2gVog1yeAKV3uvQgxXcPMtlrRDR/xGqxGRJO6N8NlOzdhaMNXlku/fMtuQ64RzuVmi
	lVYCRhfU4nlZpbDi/luQ9UJG4NFJRrs35bR9waX6WZOp4NAHgvNxl79YAFi1gkTCxAyADe8slJ6
	Xj8K+huTRrxXoN54Ut7qtwto52hJW+7wbfOb+9cHzmCHSViT81nJfrh7vFNRtiaHIIYanSiZj4p
	2VhYXEp/q749n35BcI4m4EydubVVknfrXbrzKCG6nwHqqgHQqkUVh76m0DA8V6ugcG4ZxOI50N1
	0Td3uw4siBLlv7OX4ECA0P8R7Sqpyw+HKyxN44JtwcBkmz/a3x1Y3z1axKXF7c/JnOFH+t/xudT
	YzrCoa8OxVFUEVofHMZqc1bg==
X-Received: by 2002:a17:90b:28c5:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae897c652dmr2778870a91.20.1793395976754;
        Fri, 30 Oct 2026 14:32:56 -0700 (PDT)
X-Received: by 2002:a17:90b:28c5:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae897c652dmr2778859a91.20.1793395976351;
        Fri, 30 Oct 2026 14:32:56 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8454327esm5313128a91.4.2026.10.30.14.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:32:55 -0700 (PDT)
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
Subject: [PATCH v4 0/6] drm/msm: DMABUF_DEBUG fixes
Date: Fri, 30 Oct 2026 14:32:42 -0700
Message-ID: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXzjRCNOrggkiK
 kJ6nSzcLPOSXD4nj/p3+7G4INauVZIT4p6HxPRnX0TqzuAIMrkQwzVj7BowpZQ3PgFkn2B/1ZRW
 xE4A5Gh7BdaRjSRG9bGSI5qzZzrd53kptetm9JDz5Xevgcb43+BmvsRq4678MW/UdUsoIDTRn0b
 lujRPAhD3VF5LHEbx7p1Yhzy0qqfiZIbA/oLOpfbwsW98pGa6X/fKS5fE6s+o7HiNGynewI4g1B
 PG7nwOfricesVlskkr0ItEGtn6Z3EBOKIrKXOEYqjjSD2NlTsbaPw2Ruw8CSJh2X8BkddCDlRi0
 lczHtFngLVf8MH/drQFhEpQCTzEo2Um2aH9GBfGcm8PM57iZdPjmmrSkng2lvUAg22ttpVp8Quf
 3yBrppooTTqbboe1kO1QCdBonQhQgQ==
X-Authority-Analysis: v=2.4 cv=CLG/zhrD c=1 sm=1 tr=0 ts=6ae50d09 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oIYrXKFyhTD9TMpG1_EA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX8MuEJKcX5Wt3
 Uv8uPQmyon2tmoC/k3RBczb6z2h2V72ZusN9zBI4396PEkMDNMhSliVmXRtCB9jDNuhIbT4EU91
 O0DsQMyZQNs7TY9HWG8k0waUgFDxOcU=
X-Proofpoint-GUID: jdABaufA1XqZc0TtwIAGhOFGQTXM382X
X-Proofpoint-ORIG-GUID: jdABaufA1XqZc0TtwIAGhOFGQTXM382X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300085

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

Note, for older pre-arm-smmu devices, this iommu series is a dependency:
https://lore.kernel.org/all/20261029212344.346069-1-robin.clark@oss.qualcomm.com/

v4:
- Fix get_pages() error path
- Link to v3: https://lore.kernel.org/all/20261027230452.130031-1-robin.clark@oss.qualcomm.com/

v3:
- Fixing missing tlb flushes in error paths harder
- Do a single dma_map/unmap_sgtable()
- More paranoid error checking on map path
- Link to v2: https://lore.kernel.org/all/20261027152821.51144-1-robin.clark@oss.qualcomm.com/

v2:
- Fix missing tlb flushes in error paths
- Link to v1: https://lore.kernel.org/all/20261006131000.81501-1-robin.clark@oss.qualcomm.com/

Rob Clark (6):
  drm/msm: Cleanup if pages_to_sg() fails
  drm/msm/gem: dma_map/unmap_sgtable()
  drm/msm: Extract out map/unmap helpers
  drm/msm: Convert iommu map/unmap to helpers
  drm/msm: Convert map helper to use dma-address
  drm/msm: Treat !mapped as an error

 drivers/gpu/drm/msm/msm_gem.c   |  96 +++++++--------
 drivers/gpu/drm/msm/msm_iommu.c | 210 +++++++++++++++++++++-----------
 2 files changed, 187 insertions(+), 119 deletions(-)

-- 
2.56.0

