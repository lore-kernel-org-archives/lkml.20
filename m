Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB1A47D463
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217315; cv=none; b=c1rRNbWNyu4FPibiu/hr6DTP5NA7gFkJ0R6kb4otPbcWuCLh2UhijzpTUEnrn2lE8FXU+bdWyCmj/w1PXL1LuzZaLaErjyFt8rQwebvCdpL3OPLo+a8bNQC0PnRpJ4TExwZmRNcUw4H1u/dKRkgJL19e7AmBy/9lgr2tlmJOioI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217315; c=relaxed/simple;
	bh=QY9ysFxhmb2CtXGWZoEbLvZr15d49FXuEMy/zVQSVA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kszm39uT3ztD32MtfXrgaou6jJRZWsn1X4Nff6Ohdd2p7lMhGdDalZhcgI1axeq5TXTcEoedvMszEB8eVn8tg3hF2p+lQ1TEL+V9DQh2xQC6192+lb1fGr+DBx2QqRvRgIdW2tN7qfEDb+H9EJgju79wGtprtWS6gMKugpvuKS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGHgIF+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sc7brDMX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGHgIF+y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sc7brDMX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBe2ag2240362
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajJdRqrp/b4NGOrhwXdxyfHIWwR8F0qeHZQ4G6QppSc=; b=EGHgIF+yaDOOM4HY
	V9CwnZMaXh9qdyvB1FGYy0cc47pM3gKJPw5y4GSpcE2DCaT1glY+TRo1VuDinUna
	z7QYOD4/RcQwtJLRO8cFZlDVU0thar4r8OhHxn6iGZwn0SIsSjK22xEtRyQSk8Kk
	7HbVsH8Yzzg3ymCciiq0xTpl7g6ZKN2ay3l37czv/W3pZ0uLsGyxmjjJQykHPikj
	EF2bpX9+hfZ89wCPKQThm4w72McFBKjnXQlL9ncZJSTB2qbKCeOuv41tXp8Ld1kh
	zqOKvMhz9ZqoDSBbGiP/Oz4TOBnGTIHDpjhWDbi/JjmQhqNVRJ7qtv85JLNOihz+
	3aeJ6A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8xaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:33 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c851df59edso607741e0c.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789217312; x=1789822112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajJdRqrp/b4NGOrhwXdxyfHIWwR8F0qeHZQ4G6QppSc=;
        b=Sc7brDMX/PreXSIMaiKLZVNdZrtlC+uJ0sSyLbO6OxsdJb3nzkKKYbvruEoBsx7c33
         0PY7GcpvA5ot1z1a77WD5kDeovJvIP6xggoNB+V4aAFEVe3vVv9g3s2uQL0kzOQT7nbe
         zwHNLf4c+GVoAXGU6KDLefmVBjhpAAj6XLhkxGLfA1pEE5eRORVRC4YwQXc3HOPMsFsu
         y6MT0rKj4TuC500uWR14pdw/jfJErws+Qk1HApjtfRRjTQN75KtzqDab0JKsRKBo/hJU
         j/wyIZzqV90/yNlUC5lT5uQk1jNO7MqxFLYD0YdaVE1AzKHTj6Ee48n81fKw0jxjcCqa
         a71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217312; x=1789822112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajJdRqrp/b4NGOrhwXdxyfHIWwR8F0qeHZQ4G6QppSc=;
        b=WC/6uxctmvsTPfvpPJebyjV7VhGq1axn5zW9gnHiqxnBM/Uzv+uCv/ILrvIRyAWbxz
         LaNdxvmnflwosd9Er3bqBnKqTS7eY/TnL1JMEubE30wlhN4R8s4GO+vZnBGphLeyrJgV
         Chxo2wLjzvkEZ+wtS/UrA6zu3EOy+9edWpvBWxX7j/RdMgbjWBuMmByO9s1u8Vqy126t
         g61UcJPOGz5ggWy1g33pEGZ9ifFO/28PhwDydakDeFcGabY5W6lsPYXBOgRnWepJA6Wr
         ceszvlIIv9tL/xKcs8miH2J2TmX3y2QGXlxi95UYjdkzLh6fkYvF8cvOuc1hQOAqChX4
         acmw==
X-Forwarded-Encrypted: i=1; AKwUvByvxQntloKtxT8ArjO+OG6Z0oLfJyvr9AfnD2k3xVPZfrtN98abjO6cCqXNdvCVvLlIW1D+6cwntuJinmU=@vger.kernel.org
X-Gm-Message-State: AFuF++lkeoyYl+vdgLjGp6LELSiwvT4e2Ew9kPQP5NR+puvDNwMZjWxE
	WZXIax/wPa8Sd7HPWBdATjUExKl07WkYGH4icPD+CqQFy3EjV078zuFljJhwdkDyySycKNbJCc5
	Lw2R2GmpyFlEhulHf6oFnpXOk/7j6FRoThBQ0cUvOvSk6Tg/XPGF/3jsKUXTfYp1rmiE=
X-Gm-Gg: AYBFou2dGIuP0SFaUF7Wkd5LCiwL9+Sepafo+lvEUtaUN/5UiatKT7vD9b7La/RLFBw
	ffnQJ81hz6MJQhP5fP5SzNIFVUnqX3BW+cWIEmdjv0Xkw2z1qK7KMl/Nb49peQTrodyW5ZXNBex
	+PPl1oLVo7NcfQ6S39CB/E1k6c86jlSbrqWb120gFcVc3NWEB68g59mV9DeG2A2I0xtdlenYfTi
	rwOKcAbp77CVSOHNTIiu8ICUezart9qsqguUOp4gVmIbQbTkCFJ5J9z20Bt7/mijQ54cSdrLmVK
	XA2uTKnWDD3R7AFeAdl3wCod6w0hQFAV20S753sQeIhlmWz8NdZbsXVhAdNwnR2on8BjADOVUkU
	PvE/3OvmL6LFdkQu0T0Jb5M3Pf0XN35+t0RBI77V2SaZkKUwOJqnY41Ej6VcTBsz85wLngAYjAz
	nG7f9GTvuyuTqX
X-Received: by 2002:a05:6102:94f:b0:791:40dc:a1f3 with SMTP id ada2fe7eead31-795ab7ff924mr1518640137.11.1789217309232;
        Sat, 12 Sep 2026 05:48:29 -0700 (PDT)
X-Received: by 2002:a05:6102:94f:b0:791:40dc:a1f3 with SMTP id ada2fe7eead31-795ab7ff924mr1518626137.11.1789217308812;
        Sat, 12 Sep 2026 05:48:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm8825701fa.34.2026.09.12.05.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:48:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 15:48:22 +0300
Subject: [PATCH v3 2/8] drm/msm: fix framebuffer pin refcount leak on
 prepare failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-fd-kms-fix-smmu-v3-2-a7ddc6fe2032@oss.qualcomm.com>
References: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
In-Reply-To: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QY9ysFxhmb2CtXGWZoEbLvZr15d49FXuEMy/zVQSVA0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpUoWuEQvk88wTjsRw2D/AVDzN2lbBytzilskT
 5NdOBZAIBWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqVKFgAKCRCLPIo+Aiko
 1eXqCACCrqtXMD33umlggPg3i7lcdVLQG61UoaTPUeXoqbI48UaWmLOy87sJQPm+jTsx+/RPxTk
 I6007iHQP9gHbzHMDO/pWTtZMmFK3+9fdC83MsdQcNKnNacWTdrCA2DymBREkO5K+gAeIUejAqh
 FifPvmeGlN67zyVnyPwD6DedZS4QahCEzLLs6WBIDvesfGFu71tFxAQ3v5iQyxzkDuNa+GL4LHL
 r+1UUVcpFVwlyfW1/5Z6as3IpFYMipUE3ud3WdKTpsBhpKTfe8gK5npHvVmyS0Sv02IIjPk4Zdj
 vaAhBbVgVt8IF9dF75jzf8s5RX+kXidh2OVg3h8hVZz4ABKQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: LwjjziHLTSRwhU2lTpN2UlMz1sIXq58z
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa54a21 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=tvlXP28v7VYLJ75qtzUA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX0AZhd3D64N5U
 jgdGjGJBVpMJ4YCzkJSrm3AIm0RjzVvEVLKqeRXVyezSSNEFKkFRLesETt3tZPi5nhxQdhZhD4E
 kyocPoYqMO//zk7LhmAcEzNVzTcCe2M=
X-Proofpoint-ORIG-GUID: LwjjziHLTSRwhU2lTpN2UlMz1sIXq58z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfXycYlbZuDJSIa
 aVGyGXLrwBtb0eGPZG6Ci1cXzxyeQe7Opts9lM2GGrs5NV2VNSESBam5Kg2630v52dSHT2FgsC8
 Wq9ualSqMfzGuJ4SaKEr2Wyn97jcL23N8BFK/fKVWxlcTZr9raYgVZisFAi3sbnK3LPYallM2tO
 FCoJTh9dW6uYPWKEvigvLe8HpzFj3BoNQyVdKnFbC8plq9TZHyw5KBoW47K9j+HAGxpNFVLJtiC
 JEmsaojdZ/M1GCLrfkRKEwNSn5BjuKpSWyGIFBee505Tr0W51UiCJOcddAmMaXXbCXI26r4DNbV
 1K9BTI+F9vGMgAUhN/IQTbY1a1GbuWs4LPoI0661cS76xAmtHk87HE2Iq2+Lw3J6ExRY6wcdqc0
 /XbFTMv/FGGXS1OFSPHVmnZk7iQv/Pb+LkfriJeW4fOepUSbRC514+lLrvK7R1wFdRz6M4RIHM/
 vrMOfK7tvMZw1YATUQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120184

msm_framebuffer_prepare() bumps prepare_count before pinning, but returns
straight out of the pin loop on error, leaking the count, the
msm_gem_vma_get() reference and any planes already pinned.
drm_atomic_helper_prepare_planes() does not call cleanup_fb() for the
plane whose prepare_fb() failed, so nothing ever drops it.

Since commit 8ac37c88f991 ("drm/msm: Refcount framebuffer pins") a
prepare which finds the count already non-zero returns early, assuming
iova[] is populated.  With the count stuck, every later prepare of that
framebuffer reports success while iova[] is still zero, and DPU scans out
from a NULL base address:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
      iova=0x00000100, fsynr=0x3e0023, cbfrsynra=0x1c00, cb=11

Unwind properly on failure instead.

Fixes: 8ac37c88f991 ("drm/msm: Refcount framebuffer pins")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 77415302e6d8..552ca5cf0745 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -102,13 +102,28 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
-		if (ret)
+		if (ret) {
+			msm_gem_vma_put(fb->obj[i]);
 			break;
+		}
+	}
+
+	if (ret) {
+		while (i--) {
+			msm_gem_unpin_iova(fb->obj[i], vm);
+			msm_gem_vma_put(fb->obj[i]);
+		}
+
+		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+		msm_fb->prepare_count--;
 	}
 
 out:
 	mutex_unlock(&msm_fb->lock);
 
+	if (ret && needs_dirtyfb)
+		refcount_dec(&msm_fb->dirtyfb);
+
 	return ret;
 }
 

-- 
2.47.3

