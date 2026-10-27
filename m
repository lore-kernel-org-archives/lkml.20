Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114912;
	b=MSQwit/hr0r0VJboFAFZVpLfbMuytjN14dOqP/ND2GkqrHdZY7ZXtlYMXAf7y7vLtWoN
	 6qa/LPXJG3d67XlC+jHfyRYBWVHGewf7qA3HYrwWQ0RowbLdZBoxWKUXPHaA933R2ZuzB
	 Akhpb42QzEauXA4G+Vp/vgno3BYrQJIDmWcA1gdLsEm5rO/adGMZnQeF0re3Dlf5f3X/q
	 SEkzaa1CFQXyVchcWDi1bGz8tGlyhJo89md/rRLv97cEjl1rpligB9lOeoo9t8eZi965y
	 7iRIAsRmnbdZpdvqvy/2+EwuSyS/CNHW0tzOPlb4AYH3mldb586Oaa6JXFYYIPzUxwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PeGMG0GUYQ69EwVs+BG01KfQYxsrLdk8FD6P+7s8JTY=;
	b=wluumAkfG8SzEjjJPXBwcDNsZpTVk8iyXyYlHtPUPhFyqHUzYKUluc497VSQuYWZKxG4
	 RaBaJd9eZhthzumFOD9A/N3emD/FI5Sra/zD/+45eWH8nMedJL3pkvvpUUYdiutJgXw26
	 jKORQLFDTnqHcXwb0lMsz5BsBmlemR6811ROMm0fuy3LDfIgne786zS0ppic2HCeuEknx
	 j/1+Ub9gZk6VPQESGxmPAw7eHWygaGs28e4oJZeuRS5vhEwMXUJ6lZkqtU5x3UJ1xxehh
	 ux6tMPd0v2skSw7k/YFnPg6cjlRlxyyuYJTdmoPduvsVvEjDE2/lKCk7yPemfdwUL6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FwKsuVyb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQDbrwnd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1CA60A2600
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB1CA60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FwKsuVyb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQDbrwnd
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKx4G3085804
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PeGMG0GUYQ6
	9EwVs+BG01KfQYxsrLdk8FD6P+7s8JTY=; b=FwKsuVybaVThb9tZF1gRV74vs4p
	XCQUWrT02CBRVDYhUzZCTnA1t561OHEr7pLzZ96unT1mqDbz3r2OYCLgXdIW2dbO
	CCp4Z5wZzfUBXT3R87ZCr0Qu9npQafLCbbioXjh6FU8uJsodL7Df+Wv9pOYimJHv
	ZQ3VSyoA8ApkQgQ3/hetVg+pAjCx+VJFbjuqSIxYkd/B0wdizLTT2n0yVGT10CRM
	jpU17IevJRwg/S4HFFOYHbIYZY6ebU+x6oPDKXrNLUT9ZwGceiyPRWcP1T0W2WqD
	Mh5JKET9YqPcNcH7GI1BBDW4/6hrQ0iUa7520TTat7a6mJU/mqXdU+HM4Kg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtb17r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05c820ecbso34254b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114909; x=1793719709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PeGMG0GUYQ69EwVs+BG01KfQYxsrLdk8FD6P+7s8JTY=;
        b=dQDbrwndShL+C172JePGo+QGjyJi2jg1TYiEMrurUY5/k5Y+CGHhoRxxrFv6Td9vzK
         vn5JuWVuAJ6BVqNYIf8opUbwQkK6SHx24fJqeZ9CJt6DlO7PxA4AQ3fV54o9t48YPhLe
         J6v1DmQNJkPMxZ8FiS8VjMLXNOOt3B2XFfN2rPpKhK2ovUWltwNpkvrBKNfvZKqDjDfx
         57TFnqCZF2jKdDYnbKB+ZRqzsdNy0EzVEOMH6HBVC6e8qx573w3HxIxeW4Frs6eIb1kL
         OJk0rSwibVewKuLCohGP/pQAKbT6ApnZMkAa5uv2L8l7ye5pu2WgURneK7U5m54aMoS6
         m6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114909; x=1793719709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PeGMG0GUYQ69EwVs+BG01KfQYxsrLdk8FD6P+7s8JTY=;
        b=1/mVsmif7q0G6YeBn3rpQwwuFUn+JgiXcqd9ypOz+PHH1L9lasknkz8d+uwWz8nVj7
         BH6jI2nhWdcqzct4dcpWexB3a+jy8CqP6KkwPmjO4LLe8tHv7Xbx3m2X+VdcKQBq/5vq
         H62WOavUP/OhAkfVNGHMYtVt7GtYnc0GFuHUDj+lunQrHhNjxZjX9318D3jDKVyAPam/
         5JRQUd0pAk8CjlGntVdWfzEN1X0t54H99ofOPuQrmjolfe+lVHUTbLK9ZWoa7LqsGxI0
         uE2Zwuv6PoDFhDHzNrY+d0J7qsrVx+CtbUCClIvYeGp5fLCjJcdSbiG0TrdF6nB7E/GS
         l2MA==
X-Forwarded-Encrypted: i=1; AKwUvBxVgsL28bNPUnSBuyoIsos5EOe26rIR/K4Jh0Ie4p6M4e/tokjr8KmN0DerOFYNNvTEOFJM69FJ3WQzTpM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAfqG50XPKPCriSoeWLzKrL6IbsdIj+/64Hwf0us9M9oP25ZlX
	msB/oyGrdhRsYbTl/XN3FQyy1j/d9Ceg6YowXEQJuPDoI3He8U+UQMACbtQsz9T0sNzep4H3Rhs
	78OL2TATnEJ55twgt6G5E5bN+977Yz6OA9q3AzhFEeJTNtA3hbf09pMJ75lMZYoSeiBs=
X-Gm-Gg: AYBFou2SsoWjzkZTaDT82fr5d7/QgEo/C6UO8I9zoMT+YwDgCru0L5m1DYWSFkV+gTR
	Qx4gTO7ChvMlJ46GJyhoi1eaMjfSmARUobG9L0cRPEOBqm7PhqJSjH547g0VWVowmEvaCVn7bw/
	p2SG53xLNDbHQXz5pMZ2Dan7Tp01s0rNotfuQfvGbN6hW/zHBTco5fVN3e6+4+b2Y9CD+XeZTXE
	126quANp6Ww96XTs+oYouu49/LZdStOgKuCwHaEuWr0PXz1Dav/jt0mT8sL3hT0bVJFeUiiImtD
	AAV/+gECkA52mYeQxMPj29ofzHqZhw4TLr5spNAtOy42ieJ8Igg8FNwa0P+bFojatKxoZpB0A+R
	km7k4sFgfIpUhufLvVlMTvRNw38UxjrJXbhG5pcbEYb/KlVQL
X-Received: by 2002:a05:6a00:1da5:b0:89e:2a91:4fd1 with SMTP id d2e1a72fcca58-8a364e33a57mr7763319b3a.6.1793114909461;
        Tue, 27 Oct 2026 08:28:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:1da5:b0:89e:2a91:4fd1 with SMTP id d2e1a72fcca58-8a364e33a57mr7763284b3a.6.1793114908690;
        Tue, 27 Oct 2026 08:28:28 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a5f652aasm196096b3a.17.2026.10.27.08.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:28:28 -0700 (PDT)
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
Subject: [PATCH v2 2/5] drm/msm/gem: dma_map/unmap_sgtable()
Date: Tue, 27 Oct 2026 08:28:16 -0700
Message-ID: <20261027152821.51144-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
References: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfXxRiXD8thwb/l
 hePtH8j7gyKwF8J1fqcR9hl8wwJHGZLTjc5Ox4ttI2t8rY8qsKzcZnlnhJN2Ab7oB+++DoAZdXj
 yoFFTXcUfKTAB/esmJlgCE8xhT1fY4Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfXxDCSQzS0BpAL
 NtrSqWqYMIMqhybXR//opNcTuQBLPFESdb1izCl3mpilVPEJinwfTiryp0gMvVuBdV+AsyM474Z
 kLk7ckTI4KxvylYTjSzR6NnGqs4dOV5PgHf4sJadSUZ2ta5rI7NyxTH8kP4l3fHSLu/78TW0aSr
 OWh2wXjv6wkBr3ybmWBEjb4psO50z8VvcsrGl0VraUhZrFPOudk0ml9/PDPHNvvTCwfx/epVV5Z
 eFwbOZIXEbFn0A6vaU9++8GbvXxn6HwDTStsj+Qc8Xf/4OZHMlYdCWCvwicXILb115ZuuqvLbBd
 S8RxS+TJTPc87Sv5m2i/mip2wSPfVynG9Es9zv2ZHvNq5RlIoLbLrHLMChZVHxCFHBfdTTad7GI
 KFwA+eFTmHSEv6IL72OGoeUNqvaBViANed+oCSdqxb5CTOsV0A5XiVXmzPYpL6T2p1bSsa9r9aW
 8nWM8jdZe1xeAxY2PLA==
X-Proofpoint-ORIG-GUID: 35KHJrNP3xbLr0LywmuDm9ff1NafUzbk
X-Proofpoint-GUID: 35KHJrNP3xbLr0LywmuDm9ff1NafUzbk
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0c31e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270061

This should functionally be a no-op for us, since we are managing our
SMMU directly (dma_map_ops is NULL), but it populates the dma_len/
dma_address's so that we can use them for setting up pgtable mappings.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 181b9ad32672..72e3cd8bb1e7 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -219,6 +219,15 @@ static struct page **get_pages(struct drm_gem_object *obj)
 			goto error;
 		}
 
+		ret = dma_map_sgtable(drm_dev_dma_dev(obj->dev),
+				      msm_obj->sgt,
+				      DMA_BIDIRECTIONAL,
+				      DMA_ATTR_SKIP_CPU_SYNC);
+		if (ret) {
+			DRM_DEV_ERROR(dev->dev, "could not map sgtable: %d\n", ret);
+			goto error;
+		}
+
 		update_device_mem(dev->dev_private, obj->size);
 
 		/* For non-cached buffers, ensure the new pages are clean
@@ -233,6 +242,8 @@ static struct page **get_pages(struct drm_gem_object *obj)
 	return msm_obj->pages;
 
 error:
+	if (!IS_ERR(msm_obj->sgt))
+		drm_prime_gem_destroy(obj, msm_obj->sgt);
 	msm_obj->sgt = NULL;
 
 	drm_gem_put_pages(obj, msm_obj->pages, false, false);
@@ -260,6 +271,11 @@ static void put_pages(struct drm_gem_object *obj)
 		if (msm_obj->flags & MSM_BO_WC)
 			sync_for_cpu(msm_obj);
 
+		dma_unmap_sgtable(drm_dev_dma_dev(obj->dev),
+				  msm_obj->sgt,
+				  DMA_BIDIRECTIONAL,
+				  DMA_ATTR_SKIP_CPU_SYNC);
+
 		sg_free_table(msm_obj->sgt);
 		kfree(msm_obj->sgt);
 		msm_obj->sgt = NULL;
-- 
2.56.0

