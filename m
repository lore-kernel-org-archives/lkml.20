Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE143F4D4
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292211; cv=none; b=g7nQefHmaI79NxicVp3npfNA5PxrMTz7qM1cOpvXf9Qy/VLZ9f5TeEuh6ssI7AcFm744BhN/pLGhQIVVytKG9Q+TB5bfIC6YYNQBOqaIs/OBCmRXKHmtAefNi/E9T93xNn7lUWzz+B3/uMq4vjVQgMeT99G5ySdzuMYTH7KU04Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292211; c=relaxed/simple;
	bh=2cfMKw9pRFg8LcXRlhLyg1BnKURWF+/Cda24bTjRT9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=INaqQQ7AVz/GXxIWPntWYhYFBtOjjgO9Urm2SUdTFaAdbMGYeRYS5laPFaas4NREUYsjnGOV1Sad7ggPvFMQMbvwwHyymxFYWWtYAeiXlNxjLTtBzZTX3FUfyu4iYSUFgG/Rr7vbduNydLSMQBzFkPzZc1OuKKb3F6KyIXtIkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lq/MWvVz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXFyPZA5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lq/MWvVz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXFyPZA5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPOWu1172361
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 13:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=73d5If+5wvWXlbXefuwdSQV/JC4Ap97CpwQ
	NGrCWZNU=; b=lq/MWvVzF3A5DX8BLdVbMjHtEHTUIQtbyk/5CdJdvjhfBZwihQd
	CsZjRT+n0UIo7tvrpeB6wuIx/qbyikzNfB+PT1lQJUo/givzcoySvbL+rPfICod4
	EtqeTAC5rT586btgbI6JparjJ5Yim82H2ObvNkhP7BmG3SXRlRlt/C9/3169sO/b
	iaQWK3x1iR0NZNfMfge/bjlu1Np0WqdYFbhnBi94i8F8awciHXhKKsEsEg3j2RzD
	NA36UNuMLT9db5l7wC2hxDe7E4obTpWX6UnHqPlk/hK1HcFPE0XeeVVHWRdxeueo
	GxNf7jgbFjiV+rZxK66Q9j2d4nJysIVZr6g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwrjae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:10:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so31736205ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791292208; x=1791897008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=73d5If+5wvWXlbXefuwdSQV/JC4Ap97CpwQNGrCWZNU=;
        b=PXFyPZA5zFZBP+xxBupaumZoMH4HA2IewA3B70josVUKrQAPSo9hqZFeHJkG+XS4ke
         abt5UWgGqDxFLAKkp8M8H7Lp6vwNjEhDjt0EWCSAiUPZ5zrqIjwQSe888NoPdKi2eJvJ
         NKYYZvGNpZt0BXNCSZXYmNP/2bbmmFid4wW5ucbe1wpBwMWoDORwrrmbj3c+kJrTgDS0
         ZUYCUsmZwfES45D0QQN/q1UbpK8RowRBczglHRoo4Y1KUT5Y/jTUPzSl4/tj/pj/AgBT
         X36NIRd6FwSXpbRqwIWDjL3GulX3OT4VeF6iuTdhbw7rAL5qj6wVlgA+AabojK5CtL8P
         Wejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292208; x=1791897008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73d5If+5wvWXlbXefuwdSQV/JC4Ap97CpwQNGrCWZNU=;
        b=CljgtJzT16sGpTAMAUCeAQLtNRkoQ61n8OhVtMhI+qibBwSeBK6C1WeiRkYJgSB8qM
         7eQLfVuDoeg+UOLupBcOJn43E5nbDv29huBjKCxcBPGxrBlSIRkFRNv1uyXARRyfgm9f
         0eGtjU/zXa0f82WmW3shwuldO/52sg7kc41W20SPfNxJrBmMw9y0H9GzaIPV5v3aKqSZ
         sLbVIvk2LepMFPHs+FseG4ITGR/v2oZy2iruTocr6GmVlvhY8WZtoEetxC3On50RynI0
         h0YOwv1aZxkc/LQUwIZARmOE/YN6qbsvdXQ0ss6iZUIS0ly93neICJo3NtKMMPtGs6IG
         R1NQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVfokEIxwnrbJj6ttIpJF6GVByvj1P1FAMDrxYRf9lVMlsqgt0FBkm+h1FKd1ApqKWqKdSjBSPcI5bA6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxQGjRQRWe6OxKYv1GV2Oq4/2eA5DinzS5nhD25ER7atnSfpfh
	/jjYR5/Qb48s9oKmj2QMFy/7y13FoS+zGu/tcEl3S1/8hjxYmca+99RyZyaSRhT1ZM/GtcnpWh3
	xT2MBzgN/bifiTBxgJR/h6gW0Hfi4vDGr734AtXCJedomIePjCrkBiywXRZLNq7ms3RU=
X-Gm-Gg: AYBFou1wIO5OcHK9stvzbuFC37mczi796sY6L6jlFdeszTQcqaOffVZjlqW15zfNkHH
	0KGi8fc1UX697qcf0uOTFwJRE0mzyOen8lS8/BXZe2PYJKAcfkWb9OVkHcm9kxxgr+BUX6lh+mp
	Y4mmJvkqC8ltQGLiq5U8mDUb076xpjxE4SVwKbvPtqdjFNNXAXkcTkPxhkx2FJdd973eC0B23bP
	ujblN/U848N9ELeljpPRj5+rbcqBbxuLGY8/tCsA4nS0I05rRXtSTSWGJiZvoi/A/KRdC89hX8+
	NgXJJ9wruFBShanhit4QAJCnC1DmiNxOUZVsr08070DeImREEDu0M4KBncpUCm7F04a6FO4fPGs
	80E+THDg1Zh3i4pmYhpAZpXKTCL94gLGUVeq2glFtlZq8xA==
X-Received: by 2002:a17:902:e743:b0:2e5:d2b8:3504 with SMTP id d9443c01a7336-2e5dcda0eadmr10857065ad.22.1791292208027;
        Tue, 06 Oct 2026 06:10:08 -0700 (PDT)
X-Received: by 2002:a17:902:e743:b0:2e5:d2b8:3504 with SMTP id d9443c01a7336-2e5dcda0eadmr10856665ad.22.1791292207546;
        Tue, 06 Oct 2026 06:10:07 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5e0634c44sm5960435ad.27.2026.10.06.06.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:10:06 -0700 (PDT)
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
        linux-kernel@vger.kernel.org (open list),
        linux-usb@vger.kernel.org (open list:USB TYPEC CLASS),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Pooja Katiyar <pooja.katiyar@intel.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>
Subject: [RFT 0/5] drm/msm: DMABUF_DEBUG fixes
Date: Tue,  6 Oct 2026 06:09:51 -0700
Message-ID: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfXyhYDYh1rCB30
 mYxRj2wdPNKgyT4se/044kFM6J8oYR99TjkHEi7iBikmYJCsPwMNP1JX3au+86tzOWXIqY6i26q
 wkO2YJH7KuzjCHqbcNsKBlow805EdL2WmHHKpQDuX1/08YTl0wOl0LAhQXH2tM/1EcOmAWvYvMe
 bn5y9KtYRimQ47K2zhDJ++QulYuLAUxCuRQ1+6qqDolpN8z2i2WQaiPKjSoKSHL/xZ6SkW6CseO
 OQ/21h7rH/9xLllneQnrFl3rBzFIKiUuQ5SWFt32bHXqg8z1ZROJFAjkgCOn/SCR3ONUiNKERwL
 MB0QZ/S9oBCgAFR4PxO756bcJqv8X4J2Nli++Lr/bbQrUdYkXZ1Q3xEZzTrFkftILQ/F63/Cckp
 NLtdcnqTj7l3PzVcwJxv6bbZeuUgQDK4MkrnNvjuHrqwpTQw7NyhPzr+ZHjwYqVLSMOkSUk+LM5
 Zzv/JaPQgT9t02qsM3g==
X-Proofpoint-ORIG-GUID: B21dV450zZz9Thn9m2B2VBUkw4yTT2c2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX1RkRySWrSt30
 um5u+CPdHfxV0Q6vRTQVcXwhW0nueLUn4T/y53qVopKCairkYfo0nQzWkDEeiB/DsDeYk4iWPy6
 g4r0ECgmBPi9JKjUkKBrY0z9SwUpwx0=
X-Proofpoint-GUID: B21dV450zZz9Thn9m2B2VBUkw4yTT2c2
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac4f331 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=puu_XB033Gd1UDA3wS8A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060052

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

Rob Clark (5):
  drm/msm: Cleanup if pages_to_sg() fails
  drm/msm/gem: dma_map/unmap_sgtable()
  drm/msm: Extract out map/unmap helpers
  drm/msm: Convert iommu map/unmap to helpers
  drm/msm: Convert map helper to use dma-address

 drivers/gpu/drm/msm/msm_gem.c   |  57 ++++++----
 drivers/gpu/drm/msm/msm_iommu.c | 182 ++++++++++++++++++++------------
 2 files changed, 153 insertions(+), 86 deletions(-)

-- 
2.55.0

