Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FA149B44A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954995; cv=none; b=SBoZ5r9X8qYLYg2uzKQ1ae1QpskskBMNlaNHh7exBWuLackGv4SE0EtCTQCL6MMZ84Kj4LyP6/4Fkg/oHouoAdQ9GFUtiaE3mHieQJIXekXcSM1VXtKW+pu3oFzvOA9yuMa0noamrS4gHIiwwXkqxC0gxc3ba9TbyRo1TOS/Hoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954995; c=relaxed/simple;
	bh=7wVZVFOBycVl1QiQwjux3Irgkh9JqIpG/CXOG7dWK5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RN7/p/uhpebC74UNoC/Q7T+tvNPyKZU2k/jYk8ycKGNUdPBDnjzzyHtoipZJ6LdASaDIjSXw/soUHu3QVFTNdV1uB3RLoR1SH7u3+m1ngJRZYTAZ+BDO0/N2+jb08Fr6c+UUB2qFdBm/6INl3YuJQeQA6zEEeeZCjnuYdoq5Qdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XyEBWpa4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fbhee+dm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XyEBWpa4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fbhee+dm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FHc0x2752727
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 15:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bkw3YBDFOEu19kurF50MpC
	Nfo5r6r28dnJOjgI9UeiU=; b=XyEBWpa4Rrb8sWpYcBXfcz8Y1Lbyv46i9ha8nI
	j54XONTTvjuVyDH0/0+lUmF79hN13PhjHzu9f++0YmBMOZEk9Z/a7v+n2i5DDaJh
	N0UZ3QXKnH1dvJWctZ0x2qesfTuiELtTg7R9X6J1O3XPAEyfO05ckYvEQYaCEvBz
	XHHK/iFcTD1NlD0EtVpwD9Cg1SGPMxL0OPjffJC9wy2GMKvKOCy3avQOqD+4wONa
	tPA2/8od2jprdWteECQCjHbilJR18tKtGzX4n7zjfm1+u0UBLHS6WbpbjyMDOrqn
	kH6evzH9QE//7cO1aO9h/hqXJJiffHHVWC8YZF4zHKCPW0lg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mt539-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:29:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e2e064b7a6so28232145ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790954993; x=1791559793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bkw3YBDFOEu19kurF50MpCNfo5r6r28dnJOjgI9UeiU=;
        b=Fbhee+dmWSTfSdUZ2csFFXAvutwQ/4w0wrgARlBk4sC74lV1rP/JFiFcmAMfnNfWkQ
         JNUHfWZG0O74U35xx0FiPPE/+njcVII29X8nE1XfmF0x8OLmjVXYGKhOidrEfwLeq3ii
         WP2Ima5gYeydeZFkqhOHiTz6/tZm2Vb2VKXuOXspH+bpmNjHBqKWQDGGhpLlKDABBIGP
         e2ZLcfDTuut6d3CUbZvaMr+lgHYpydT2BLsltHP4zCMXd6yW1HhbaW1v4dw9Jkm1bsun
         T6v+H7vBaN22xxLCLBI5uON8HrbqwJC2QNQ7wGonrl9VlTX155/p9h4URrwyDhRKlJKs
         IhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954993; x=1791559793;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bkw3YBDFOEu19kurF50MpCNfo5r6r28dnJOjgI9UeiU=;
        b=GAe1NHkqMZNIx/RqpVPNxv4c3jcFh0TSanb4zvnm40N+ftYKKfL8YHutgNT6wj09DN
         RbG/Le6ezW8JuvP4aAM77xfnUWAOhBptIwlTHCoszDIGhnrlO5Yjf9M6sHKzxeRD0Czf
         2YoMjV7Hu7m5d8EtwDm3d3oYC0ubTsKtdDMU1VOo9481Z7S5J1kbc6sVQjJ+ZLNP1X9y
         oUYuzhoVVjrBnGh6AwI7NfI5cgToh+e0Asm+58ZInaz6kZCgLb1Ed6GfVI1uiUXjnm2E
         qXllOrUMCN1EzW2v4BgEhQ0RiBTUXm2E5STSEnE6O3FtR65JZkwH/Sq2TW2/2gS3Tqc0
         1MHg==
X-Forwarded-Encrypted: i=1; AKwUvBxf1XJuAui3ZzdTt5Y+OJu15mUF10IiG6Mo4aElQrUv11hMBB/XF4A/pdVuLknEtyyiiCWHpuB/7JEWYMo=@vger.kernel.org
X-Gm-Message-State: AFuF++lkUDPTtgWiXOPlgP4w9o3jECyhIT9tLQqubGm4Pi4cwYzab4G7
	VSUHNL6mT71l9NXGm5F47kf9Yw9L42z9mkzyaugkP5Wz8znRONELKu612Q4wzrZr/nmQDyNe8LD
	aN+ItFVCNTi6wsyGmQnBoBWrnAWiisKhHNIsajdHP6o87u8+U0V3OsXNo8KbJA4iOHz0=
X-Gm-Gg: AYBFou3ck2w81mFVzGS973cb85Uk61GzRCECCS8DyWtuL+k1mZ3KB/WD54mp4I9xy3a
	hZaqcyWwRqWFBy8xXIoWzroEa91fuy+VyNR5LrCgXEmxlOVoP5q8jCBKR1TYMTdXH3Y2giLwV4Z
	a0a8lnZjItSbyUH0TAgTnDMUPyvLMY8v0jurMtfKgNKvSFxA019KR3KW9qNhTLDns7/9OSDV67k
	QwLtB6YrDn3s77DYaupd97njlz66BhrYka7GG/4O3Le9gHFvT+7JBAP29G7xcy1BNq2jT73yONe
	lRqzfaFyWFEDK0Qqhv2BijM1pAHBNPkV+AB6BJycwYlE1m5G1xYmrVh9lerkGWgYmHIm1GI+oHN
	OcDCCWrnTBQtEZYDpR+BSkTHQ/W+mZvGTFGDyV0SzNXNHFiU=
X-Received: by 2002:a17:902:cec4:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2e49b807643mr24166885ad.55.1790954992678;
        Fri, 02 Oct 2026 08:29:52 -0700 (PDT)
X-Received: by 2002:a17:902:cec4:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2e49b807643mr24166545ad.55.1790954992174;
        Fri, 02 Oct 2026 08:29:52 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ac12esm9644065ad.41.2026.10.02.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Andrei Kuchynski <akuchynski@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hsin-Te Yuan <yuanhsinte@chromium.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linux-usb@vger.kernel.org (open list:USB TYPEC CLASS),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Pooja Katiyar <pooja.katiyar@intel.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v2 0/6] drm/msm/gem: Drop use of pages for imported dma-bufs
Date: Fri,  2 Oct 2026 08:29:37 -0700
Message-ID: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX8nN0Koyc4nL7
 D7XwRK94Db+OTAMFdbC28S4a4l15h/P7wOQDOT19RwjNnNO/NbbZFcgMzbjYNxwQuEsOpYh0gek
 kF6b7aiozpITMF+Pd3hsWscSS7DCEEQ=
X-Proofpoint-ORIG-GUID: R5aOqMjWxvqB42Z84Kd1ddi6GWzr35UI
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abfcdf1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tIciJ6vaqEqC_qAMQbIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: R5aOqMjWxvqB42Z84Kd1ddi6GWzr35UI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX5FWVW2Oq4T0q
 SsIiXlHcuMwqXLL14f1gYGwiYm7xz5uPFzQZVvm2v35UBQqRKfWGfxpSCoUrP5J13IQKSkGwuR5
 3aE47xtn67Zo++ShtjQvowOb24VygAeRbi04RKuptlVwTWV3Cu83gD1KZkdYh5TGMjGUX/CxN2Z
 xHleaTKjDTp371Isth+FO7Q662HFOamiP46NQg7mwHj2M2fHidjgi6RAXw2+B1fTkTP5Fp43azu
 ESBx1S39VNjnbqPBf2OcmkIzmDpljXd+AOpX6h25KHqyvgjlrUOY1cFZJoi0jtui+bO3iQMEtqK
 8fgL6m5oKtCWwcuIQ5B2ZKoPXsn6uo+CJLKPFWFAY4/9Px60RWN7C4j+vVPvF149bHwmXN/Frjn
 OVOmXmR0RJKRt3weL2EhqVvgCYizMF6uDyxGlntrFAxYFGu1rJN6T7hBrlG2iIpw+uhKqg22heE
 L9YcG3Avu8GdIkmty4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

The use of msm_obj->pages _mostly_ served to mark that the obj is
resident in memory.  Mapping to the GPU, etc, all works in terms of
the sgt.

The exception was the fault path.  Resolve this by using dma_buf_mmap()
for mmap'ing imported buffers, like we are supposed to.  With that and
a bit more cleanup we can drop the use of drm_prime_sg_to_page_array().

This doesn't solve the issues with DMABUF_DEBUG, mapping to the GPU,
either via iommu_map_sgtable() (display, and TTBR1 for GPU, aka the
kernel managed mappings), or msm_iommu_pagetable_map() (userspace
managed mappings), still requires pages under the hood.  That will
be harder to solve.  But this is a step along the way.

Changes in v2:
- Drop dead code spotted by sashiko in 4/6
- Collect tags
- Link to v1: https://lore.kernel.org/all/20260926183051.25754-1-robin.clark@oss.qualcomm.com/

Rob Clark (6):
  drm/msm/gem: Add helper to check if resident
  drm/msm/gem: Mmap imported dma-bufs via the exporter
  drm/msm/gem: Use get_pages() directly in vmap path
  drm/msm/gem: Stop exposing a page array
  drm/msm/gem: Stop calling get_pages() for imported dma-bufs
  drm/msm/gem: Drop use of drm_prime_sg_to_page_array()

 drivers/gpu/drm/msm/msm_gem.c       | 107 +++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h       |  10 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c |   9 +--
 drivers/gpu/drm/msm/msm_gem_vma.c   |   8 +--
 4 files changed, 78 insertions(+), 56 deletions(-)

-- 
2.55.0

