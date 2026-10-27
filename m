Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142313;
	b=YfvJ65sCT3uEG959b3ZUV8XuPQZwiFvF6/XrjmQtZ0zdCJVTqfbjPV1Bs1Edq5lnCPPv
	 dkMsGPCW41m9nbT2/55WEm5hnRrv66nJEgPJWlx+JzpMe/9S2AoPNbCxnJbP8N7eW56mz
	 ZEF21iV4EACL5foBA/LP349axd5Vy1DrOHrFhinsndHAHy5rfjio43OSG5p69/sB2RbHf
	 2vTD+4RnnY/fq7qFPsiEKVxOhmLs8bsLDeK+w1dCRaEc2/L+Ep8URU1ayDxb5E0Dd4NyA
	 ooIzgCdMkVY2/N1HcsCSjgJnvhp6DVmBy54IDRfUe34nosYhXmdfQKpNr4oIQQHNh3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142313;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nwXaotoqXsySYhmtZoW8iErlGXBt4yCAJIzc7fNEC78=;
	b=jrfaLI0AxlGdxQ8rVrkgWu2/mNOlH6+D0c3FIE9uArLxkyCdaI3G93C//cz3JC9f8g5j
	 eQjCc32G5EV2Rzy8xPoQ3JpYJoIqebbu6WEQXQARMQFoQQGFoeOnC204QMEXT7nExVVpM
	 MJSr82o6Xm2t6mjvC2bw7onzmRY2W0xVpQsLp6dj4Oe5XsdXuhrCRFOw/ylCNhKmQ7nCU
	 fdh6i5jfuG0CIoJsIPGcncupxzOHjLZb3jQ47c53njqT1u28npW1RQm/5vZuidURt6TQo
	 r84ysY0cGwQ5sUBI8O+9LDVxI4mF3Tbcb1Rpv2FEgqMBDVJa3xwzV5gqkD5vmEMba4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e6cgj6DY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N7+UQ8nH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AA0606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9AA0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e6cgj6DY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N7+UQ8nH
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKtSsg2976402
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nwXaotoqXsySYhmtZoW8iErlGXBt4yCAJIz
	c7fNEC78=; b=e6cgj6DYA10IAmENer0b2vhHva3a1v9yqSmL971iqALvaC9WOTW
	imSeV+Dpy9yHzLozwDfE2cqc/5w3Nv/5m3yWNIcyamfjdEjOhFYTFGyEngn8rSEh
	/AMd7xNUOikq9ogBjQtO67gecdj67bjcDeI4BEAtdc0pTTVFIQ9EhfzBrhd4B/dx
	pfHkSZXrSPKwEO4FvbelRw+Y//ZVa7Uka8Ag+4GkSyfP4Pjq4d5i/9QHaFm0+877
	shUs0fKqsbhn9dWGKj31u9O2s0+yMd6UNCgaHntUFgR8wQacRIdzPk1vamF2WupM
	qcCneKTUat3PFMIHTHhLwIzks91j6/Yo2dw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5upu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so1092353a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793142310; x=1793747110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwXaotoqXsySYhmtZoW8iErlGXBt4yCAJIzc7fNEC78=;
        b=N7+UQ8nHjKq94bNRNYUvvFWWhi+Dx9JuvxcHBEQ88J2ED1F1c0As+O5e+xvHw1wz2M
         FPUIuybaKmhj9/3TqZfW3HF3kTmRYZktKy3qJFbG3GAxemrffoW7JARAHqJnihXwZ3uN
         mc8nuqUY/sz674dLWb2+ihhX+Kur57d43qKoj7lRL64BRjz+gk1S0m+ma4ksotIOGb18
         GjDLO/FoUQOz8kv+oihMiORXOUeaAd6hZuZVoUT74/LOXI6jIpCwn+Jel9lj7by2rtj6
         g4M/s4zp5q4kwyyRDvG399gcGWapIwpqNF37aRRo9mC31GEmTckojLwcFfv/mPf6mXLG
         nIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142310; x=1793747110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwXaotoqXsySYhmtZoW8iErlGXBt4yCAJIzc7fNEC78=;
        b=DsJxF6p/ra9aofXI5wYLy27VPJrX8LW1C2j9e/S7Fctu0x5MWjlnUrEBGu9GDz24PK
         r/HMHxL7l+2VP5EqCGKTqWjlBAMLV0KM8YxwzWPlqPmtsPA00nJmLNiToU7Lahya80aD
         nOFfU19uzXiUvQdu3brDj88Y6lqmrCKYdV2xEWTmShphObySWj88vUubqgSfTAT1lLyD
         +8D0xI5EYxXi4qvOlkeMdn7H3RQ0XKqux/c4KVdd0oZ0efxqNLyx/E7bgMuWTgZ2mJ5I
         Fdiwy+Ei15d8RJ0w4LAlh+jnLWal3Qx1ReIU0v3WZN/AyZOAEDFH/2oQ7wCw8DCgTYqF
         tDeg==
X-Forwarded-Encrypted: i=1; AKwUvBwakHRHby5p3GeInMB+f8bUt7dBrIKpkkJCNGcMGEmTXnfGlOs/QDS9kTCYXOIShTV2WQ1CStITb6LZlF0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY5EnlwekE8yT6NQliyIzWfWdm7irLYtuy3UfiDbOWzKj2gFKO
	BlkFyvMWu9iUjSPOl6Pk4TD6KAwpDnUJ3PWG/1dzCJ5dYWAbUL+c0IzExm/muMDAFgXF7ca3r8g
	jKDKNkkZ5qkYyDl8/1vrjXltmcnGz2JJg8kpQQN+g1Xq0qWJ/No7XEJa29FDPApNclb0=
X-Gm-Gg: AYBFou2LJi+1DRXLGnVKqjsLjKJOiMvAJxA2q4PXoikugcNivbvreLhPaa4XOV0wCKO
	xrWgYxyWzC9n5Wk4n1Q6peOuRG/Zl/vsqoRIYB8HmEwQ2ABUuo8NgVz5w1rd+F0IiYo94pYd9oz
	aq4yQSMCpfXJP3gUEMaD4OXxwmmhikx9ZnzQwdcUVYW6b6TyzEb7Qr5/tb8naLFxbkiuEe9eyfX
	klScD2HIiUvn2HgIWfL1aQIRMiXQ5lUpb8gvt6B7yXPKHM4DEO8n5deeOWyB4NmNuvz7v7L2kTg
	Ku7+0QibTr+Jp/dD7KDjTUBwzHkwpvkO3tiEFvl16fP5XLJjYeaJ2IYTdydr18EsQlvJ0LcvSVP
	ghyx4tQVXU4EHNSh1+x/uCcLwrHqUTPSHI29RGlNxaNxMdkMezjDLbermY95a49gHCLbyq7YxFZ
	ji5vrvm/IEAsj93anD3Ai+qg==
X-Received: by 2002:a17:90b:4a11:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3ae5816379cmr248208a91.32.1793142310442;
        Tue, 27 Oct 2026 16:05:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4a11:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3ae5816379cmr248185a91.32.1793142309880;
        Tue, 27 Oct 2026 16:05:09 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a5839besm248297a91.11.2026.10.27.16.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:08 -0700 (PDT)
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
Subject: [PATCH v3 0/6] drm/msm: DMABUF_DEBUG fixes
Date: Tue, 27 Oct 2026 16:04:43 -0700
Message-ID: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX2U2kY4/Maxwh
 gt2N+TqvPtrguX5J6FmHnWq1j6oRYI0vG/ZL+v3RzE+fOfLUqxOcUcWzFeGmsDiPwzTzGYczSLs
 5onr1zpf7kYampU/ngbmMfRSFJEDTWk=
X-Proofpoint-ORIG-GUID: _4QwERMCCL2AkaCm2uowUyJOEQOsd05m
X-Proofpoint-GUID: _4QwERMCCL2AkaCm2uowUyJOEQOsd05m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX1Ym+19M+jIWb
 fa1zl5YkDtTWAbFhqfmO/bQdIwB1mXkB30Si6WCYT35Kfip4ILRQRR/4d5oA9T0Tl1oBrbr9muh
 yIGFmD99iYy7EQTJDNdU1TRuIGlrILAPtdpB/jw0z35MJq6rR/zndVZb0cC0mrBK3Cok+RdGC9I
 UxDojg3AeAWwTU3oaAsCuzv9IS+Y4ybT9i72Dj4BKWhH5QohgpA4smgBMX6/4UT8EczfV0qdw4+
 B0WdT7mqdpKmqe3YNhh7EIhiqF77D8IDUyPnYYFj0AdWfyHmH9VT2/hnVkCgtvROpezleQOqJMT
 eldws+sa2rk3jYck6b5MCn5Gnp0DvqdAvkxVpFFDQatQ7sZpbM4uJiiWOzzHAx+cwck30Fybjnf
 t+zCcVrukwFWqWXGEPmEx13d649llPtn3aEnpiLpqFmTmO7GLOTO/o+nC6SxwPZs4RS6BCRtrJP
 zEPCIOI76I9mDHbnI/A==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae12e27 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=puu_XB033Gd1UDA3wS8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270093

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

 drivers/gpu/drm/msm/msm_gem.c   |  93 +++++++-------
 drivers/gpu/drm/msm/msm_iommu.c | 210 +++++++++++++++++++++-----------
 2 files changed, 184 insertions(+), 119 deletions(-)

-- 
2.56.0

