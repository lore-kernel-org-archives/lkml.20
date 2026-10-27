Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142328;
	b=W+YFzvaTNOE0syunoF6PWZvRjvW9ztmT+Hh2Bqmlh4+y6JuMbSJnn+EfMCafZK6JkKHV
	 V5XuTwD0t7JF1+gAtHZxeg/tJXl/P6Ys3+BKbmMeVX3fYbPiv3tUFm3RKhq8gHPl6ZNl9
	 GJ8oH3qiAWw7DXs9m3dxU/JwXQP3FN8SVIW23/K/f1VAk1v/7ltAGtO9joBPBjlRMoszE
	 qYnypItdvxBgH+oogyHjD7JNgq7WbJp2fIwcYrqnbWQEvXi/MxImFeO4JLzEg5r6SlGDp
	 SkuNpo+lWhVPNDV8xfySr7ibMOrCVXcI3b3ATE73x7T5MPXTayqxEOk/F8ehdMKwI0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s64e3dkDh8bRM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=;
	b=Pi2GgWVWm1p6t5pERkyk24VpO6biA+X1g1VfbZ7BPXRNll3GoxXkZ3jWJP0osjO2zwVq
	 0H2nwWxJV4OFeuDjQkjAaBanq35c5KHQNHvelB5VPSuvwMVLq+4qfRCxJI6/I3VSl2bSW
	 Bevs6EmvFg2V7PekMrmt8NYIrBUZ6Ofk7W95RNqm25ZJGmrEqsqMNcxlylw5zKZn3fFWQ
	 ZFrLm5cWht5AvD5DPLk/1XkgD6Wo6HuW0y1QloGFYj/9GmD1BS1D0TYTGR+/2FKuNuNlb
	 ++Dto2kkTJpSlUMYVCOUpvmbWT7KsUaeqsy+l57YDSCO46xv/iiopc3Z5M3M6U/eYTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nXKMaPCU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZCpuvC3U;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B17606A337
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B17606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nXKMaPCU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZCpuvC3U
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKt7xc3284776
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s64e3dkDh8b
	RM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=; b=nXKMaPCUL+E+tC6x5Xzzpullc1L
	9bVs2OBJHdJqX/y+E8ZcO/vyrSX7C28PZGvv/+KRv9hvADqmcYaYaQPaCAtiUnwK
	rzgfaN49iW+jpAs5Gk5tvqZ1yXAIJxCJmXIJDY52j0madOQ0S3bouZM+mpDcMFpz
	px+qCoo42jmPkYQj6/UBNrdAoCF3b36FvvyC7LMNJwpJiaUvxHOfJzdbPahWftGv
	HAu9hVvLn4Xz2MKLo8awJYViML4kiDAxkInPuNXDAoE1KrPxsQneks5rXpe2y7MD
	vC8y/tvACwKKWCwSI7RgLVvWovIAo7vCMGJLjLtHQ9el4+nM9z/Hoijpl8g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6bbfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9995cea88so2703185ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793142319; x=1793747119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s64e3dkDh8bRM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=;
        b=ZCpuvC3Uwmw2xqJzLvK38OlwNTHmPqKSBQ4AU5xDWPQPzwBLj7CG80DSIoyk5XcW//
         4rPOcxIwp8Zfrx1gHWiKYsAUWeGndUbKja+s64LAk8w+O5goga+8Zv2JEpOhfiRaeRma
         P9oC3aZwrbroxKxKcrYm5vBTB42skVJwsjl+H+bvhcBby/68gtGXiVDryaUTwWhCFQYA
         NE/+L460+BMDkDr05LzeJWP78qrzeWhi4Z4lwogjGa/A6ProYJPMk352w409z9AOkEHn
         6VVeyp2bmUJTInU4/WceLs4fh39B21P7aMzi/H6+VIp7TyPmzP4O+Uxy6P/3Bh7FywxI
         o4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142319; x=1793747119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s64e3dkDh8bRM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=;
        b=DS9p394rdk2Tz/nQqUDscZb7p+yjX6b0i+mD90D87P9GeSXDheH+WL2ZgfoBudvFgP
         vMs0P0btUnXwc5xMQ9CexgFaSVi2UnOVPqzhc8z4m4LcNyU/MK+NFBo/+1UcXg7GxJZo
         wLMiuxLTYzoFyMxwieemOOCH0DXU2Hn1pE7gMnC89WIJLL5DYdWhYrIsohmgJnCZauMe
         y2NHtc4T0vWXj4ep5VIghOKfsaq053AEzLwMs0iBFCVJ81CZLF6SehxI1rUDtLJg02jS
         bVtYoTNfOudj3yEVX2OKIEUAM2h2t3mQq8asZPOn2QRJnlWFyY7HmUT9rwo1+eGhGBjc
         /rVw==
X-Forwarded-Encrypted: i=1; AKwUvBxgFY76swOO3rANRwWzUP0Fzs/JIzCzi1srhxYwAasDDXdLfY4tVw/EAjroMCCL0saMEeiPTlmO4zISPG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy9NmyJoeR+FU7W81DIMP2aq3S/QRcWkkwuFFLhJCqawQAPHHY
	UAF2S2pMoITnN/QMb5KXPzI51XRos4YnCptw986O9CudKtW3WQnIwbcMJFS+DsN4bgJyHdPtb+i
	OMd22HNn5y88kIJx3EHTulnpz5css1bp6S7Sc8jsuJVenVFZNN3rhLz9rLyZN25XGVGA=
X-Gm-Gg: AYBFou3zGps4FLMRgANmlj8ntVVyiPYEmUAVQWe5LwQB23tMe+PJ/F3xxWbQ9SrSmB4
	y+C8PXAD2qMe7zRpN/ofHwK8DTsVGkXKIyhREXZvI2PQW7y4eu1YQLKj1kyLuPABVjJqUgYJRvo
	CLCHFajPcBEE4D6sW4lk9mLRIzCEyIMuTbrWnw6THtTPlHI6bTOBGuLAhCc8nNyY+qZnf/hifMs
	AOqxBgbKyVqlsQufGC3vOe4d3YdxLxXyauf18NyDNpyCwCYSyZShZ1fkOwt5HRTK4TRBAnHMO+w
	pMIQ/wxeua0A8CF2B2lbi3Gf4vynNzn0or7nS5CMPgrMYtzReDIXcEkSANCy49CFq3OZvo5nhoq
	o590lZV7oQBGO93AjXV7NANa2V6YYBWBaJ8Fh0HmQX05yRYWR1pMjqGMUtj5SIsoD1o3cHXaVAD
	zn9shu15Mqe2xS+tOfXFcJ904=
X-Received: by 2002:a17:902:e945:b0:2e8:34f9:735f with SMTP id d9443c01a7336-2eb004f3183mr6574835ad.16.1793142318517;
        Tue, 27 Oct 2026 16:05:18 -0700 (PDT)
X-Received: by 2002:a17:902:e945:b0:2e8:34f9:735f with SMTP id d9443c01a7336-2eb004f3183mr6574485ad.16.1793142318005;
        Tue, 27 Oct 2026 16:05:18 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c91e1bsm14488035ad.59.2026.10.27.16.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 6/6] drm/msm: Treat !mapped as an error
Date: Tue, 27 Oct 2026 16:04:49 -0700
Message-ID: <20261027230452.130031-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
References: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae12e2f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=IbsCIv0Bno-BzyZ2rGMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: j7yjAnB8JpCK9OtGMpwG3Mba7yejOsZx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX1/GqibqhLQzX
 H1wE4/p7LCmkydc1IvxCDCXnhD0rbfGx3EE8FuHHzut+5kv1yIpHtonOBEVRtR4Fb1QlRxULDk/
 SAGors9kCclVIoxGQUpOgt3s2lFKwsY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX9rWdFaMIuQ0G
 383Y/YYDBpa9xNsAALQYhgmR0xq/VchBquLjDYbVU89nT3PFsP5FTb2Fvh33I2LIEHGowytQN2J
 qGrmg//93iNJ4lXhwPODbN6ZLRWEMHhqA3ttaTd7qBSTzFuyT51v+LeH2Tw+X1Qe3xeZwzfESxb
 rdOD7gvpQNDbBp/6bq2HHmCPINLakU7ycNDc8fc3T3npoIkj2oU8mNIjR6QESsnRL3Z5uNzV5no
 Rf9xJtqDIGhLtfzprP/+a/sHvuz9IWSaNjV4z1atrkJgQSADma1Hkw6LdSPAK2ouSfm/3MZrHf4
 YnDwTMMYCj2EUaFbX94v4wlWwglJDJAyJZiN0fn2k0NGr/6S5mtpm9Ny2lmxWiHfnpRkxClSqyE
 9Em2flf3PVCEfeEuIC7MhFi78ZE3mqzUBNWS+6BLi2f+crG/p8DVjNIpxoGHu3Lvkv2cHJpBzbO
 v+Tja5tPvBOspgCnCWQ==
X-Proofpoint-ORIG-GUID: j7yjAnB8JpCK9OtGMpwG3Mba7yejOsZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270093

Rather than silenty mapping nothing, treat this as an error.  It should
never happen, but if it does we want to flag the VM as unusable.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index c2950d32c507..255972323f9a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -186,6 +186,10 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off
 			size -= mapped;
 			len  -= mapped;
 
+			/* If nothing was mapped, consider it an ENOMEM. */
+			if (!ret && !mapped)
+				ret = -ENOMEM;
+
 			if (ret) {
 				__do_unmap(pgsize_bitmap, iova, addr - iova, arg, ops);
 				return -EINVAL;
-- 
2.56.0

