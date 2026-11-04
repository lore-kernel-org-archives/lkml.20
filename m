Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815179;
	b=RML74wmSSGWqLmPZ6Xa10dvHz0+XW/zoGpdt6jtvuEfCpvecw8+ul7R7irvp3I+57smZ
	 QS7mYjYgnBnISOIf1WVNlEQhKT6nFy055MIQYbNxvXmw+KJEnyMKeaSZEZGI8k85M74Zb
	 HJuQjT3MIxNgZABuDpu7XWaoth69nGfYV9sqr1cOA1Ouewz91RGDmZdzWxmaZhW75ra2/
	 DXx7ZvrBQkjTn2bwhQE9LhEWXCRIMbdyeAiAA7Dy5ZJ9j9diR1f3qPSSwpMFcH/uo69PZ
	 H6btpxrY/POYh/IxONMaRQY9L2S1EeIAIyW0JixBaR+3ROI+tMkUMbBYOVj1S2h2LiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+i5Jiewm+DkVb+ElU+YnwS7BEOGG9HPyqCVLkTEmd1k=;
	b=WXHdQ2LoLVsrBBn6xsOfchiNj0+AhqNvK6TmVwiac66KQXoA82eX3r0BeuB/knR1WXlm
	 VukNgdlKjlFmnb2cKZXsPL/IdqnPly5xLdVq3t6Jg9yMav1LNf3bPdEy/5IqIpm4o9ITC
	 /UWMPLvEf+j4w4Ayss5VZMRVDuVfEyGo/opGxxBWgCi/NwqRhPlaV215Jr4gia8am704w
	 Tw+bYy+WT0TFg66OdjJkwYmivf/YrpuQxPL2d+IlZbclw9zdRmGLeXKCYYa15pnVmCSUZ
	 3mxerUNjLK70JrMEBeKV1EwRXkZPvzMQKJbr/s7o5gtp0BAqCQ4OVe7XRsZ8G1VPWsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mFqTjSC3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAQ3HHzO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBD2606D81D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDBD2606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mFqTjSC3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAQ3HHzO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj2k91899319
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 17:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+i5Jiewm+Dk
	Vb+ElU+YnwS7BEOGG9HPyqCVLkTEmd1k=; b=mFqTjSC3EfzL0D+BBHsZ/xS3C3R
	MyBf+Gbm/lURutPDtpss513t51WgdkY6ShTmm8/KDhGbO3bGQdLok3Je7tpN/66z
	zO10kFCEVVLCutLV1+bafOGgAFTy9EBJY1OGCe8WkJAyLdyd94Gz9yR+asOw3kA3
	38aeyKcHqX4Tg8V40h0lNkpvyeh5mulPioME0Q7gAzU1/EgYztiI4H0pqLRvT/xM
	038BAkzyCY7/NJgOBQ+AaVElN5lFW37spnmnJxkDKJh/3dFVj5JAKsJSv4YDQo6b
	a/PcwDMmz6Am6JpkBTqlSs8gtaqUloVNThqHIC8d+UXFpe90jBBll0qngpA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsgbf7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:59:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8dd9b9743so11536005ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793815177; x=1794419977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+i5Jiewm+DkVb+ElU+YnwS7BEOGG9HPyqCVLkTEmd1k=;
        b=IAQ3HHzOSHHhi2taDtqeEA0hFbey7s8ssA0WatDMbRlLACxfxaj4qai7VaJTnMOnN5
         1xfcRCLb5p7p1slRiMoaS3ihfyxn9xhiPg50psolYSg1pGzmFyhmEspe/NMFsyChHVYp
         d2KQgZ3iXJSfBj8/ldgqm/2nmxmUQInzmw0Uzc1fwOTr6S3itquH5szmWZFhTs2+d+qX
         VJkJ8TAoV9w6kDYimL/a9VpNv2bX2ge/Qqb625cm4eQvqO05NFGzgk7fkppGv3kkXFJl
         v9PtIT7FzDecoFT0JFp670AfcauHCQ7ofkE3SBz3nMFpp/DD3na59nJVcZ+shu5dx3eE
         rLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815177; x=1794419977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+i5Jiewm+DkVb+ElU+YnwS7BEOGG9HPyqCVLkTEmd1k=;
        b=YrVKEcNeSY7TsbE6viNrcee05W8thxF40Qm+gFXigSTjSNHuDr47WdPTJtA0pkS9fO
         BQ/vlHCDKQH19sdsKYu/GvKA+rhA2bKPhcRZRbbyvAxwcsPm/wfPUyCyPS02hbQwiHOE
         a9q12FoTWRmhcbrS7ALJjaHNEBxTvzFsYSa0w8s5HSuSs/xodXfvCrH8VUznImdKTeSh
         zUMMDlgfcFruCMmkx4P7i2oUAzkbKqf4dRV5iUrxmKLv2CXZrih0GlTiMIlSxk6rAKfs
         OjRzEuRIGXHmvH32BHyd4UFB0TOddgNofa8xImTquttKEHRHMAwIaVkG1TkXCeX2GCmj
         q3FA==
X-Forwarded-Encrypted: i=1; AKwUvBzP0NoNEjGG4BAQK+gJ3iNH+XFGOw/AtrcSJW5p3jphxpwwLUnrzTitUt/u382GHtiAJFOB/jr2e3FXAgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y1Xgi2nwiD+SYupf3T/NcrWUDXSZ5RhwvOYabKQUlPkIv1JDV
	uSJpE/aDt0K2+MULKoBWKki3aBMGubUoR18MHeT3wxAVDA7UGxfHypwAon/5bVKa9U89wWdU5ii
	YwoQPOOtbA9NZWDwwzBPTuaXQ+SKkoNq4YZyGWdRtnVeI44HzaXZQzgnMxh9d7AY93Lp3tTnoZV
	QOOA==
X-Gm-Gg: AYBFou2Wj9UMVFyzYhnub8g8i36QfStP+cejM3qQYGaMllb1W7HiN2V1WN2D/Ax36mx
	3QRNzBANUMahkp8Fs2OfE+liL+taTXQTZdfNYSmo2fvl1sH3FT7RYqUjWWJkuUdx5zvaG6K5bpy
	rNNoD9z2QBujCEMh7UePkOk90LASbvZlcsOmuhzCSWBBreS9TJQPTJb7VRlivpAg8KtGmidutV8
	BHQ90gYq99OmVcReOBl5P8UX1+oIVyPz76FFCDtzbhHr/jKUeJKlgMqb8AJtSANyJOl0x0Wd1EL
	NoNIHdTG/DHlAPUd4O1TbW+Bc0ugIropiyF7jLsqNO0Xd6Hdruh7l7tmoxlH2EFpqHmcCYgJ61D
	B8D0B0YTJsay6yNixMa2cj4aivM8OJmOYuE48ZnUGVE/yDjQ2bE6LhIS0kYg0cqKR08CUg3HIgk
	bgY44917HMfJ47i96jXXyuoGJLpkn0Gu+t2KbRfgIx6XIkZSquz+IohWC5i9Y=
X-Received: by 2002:a05:6a20:7f82:b0:3e3:1013:466b with SMTP id adf61e73a8af0-3e928a79de8mr16140210637.64.1793815176655;
        Wed, 04 Nov 2026 09:59:36 -0800 (PST)
X-Received: by 2002:a05:6a20:7f82:b0:3e3:1013:466b with SMTP id adf61e73a8af0-3e928a79de8mr16140190637.64.1793815176183;
        Wed, 04 Nov 2026 09:59:36 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46443e37sm1465823a12.1.2026.11.04.09.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:59:35 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 1/6] drm/msm: Hold runpm ref in set_sysprof()
Date: Wed,  4 Nov 2026 09:59:21 -0800
Message-ID: <20261104175931.28475-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
References: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeb7289 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=TtZx0lvJKI4lzRINSrcA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: _eNSxPCVckxvslVRpInLxxdoaNrtvd9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX/iInHPUjd064
 pzFZ+C257NMJEDKgeR4m59Jff3Qx7Tshkj9gh71qzjPBlmTZhLkKEQ6sQXgW5xya3dMAXjPgYl3
 Bh0+aEkiHEYB/wLFLqLLRquGoWby8Tpy+kn+/yyjfK3Zs/o61H1aBAtDqonU7kiMqPQhNndMMY+
 DRYeG7vEGZvM4MMozGTt34lbf2O2CsAcQyDsriQR5Sc23ORJ++vz/jOEXX9MNaDFcO71ZGVnO2H
 RZSBrIATyDmi054nB0TNj4i8/2m/5CiZnNx3wF1klCBYyV8wgIUXyEFscbB3iHx4o7Cel4RkZQe
 WS0TDm2jQV5YRdim0PXGIqnk1BUQf1xvGU2Dh/30JxIfruzrz5zU8KIv5e1gJglFrqvknAify9c
 gluVAf55FZQOm5rpEK9AMsdkEfTiaB90k4Bf8VkL+NDv+om27yPEYE9z2AI0O6sslh45diJo5DI
 EvUzn5Bgdr3TomtDSfQ==
X-Proofpoint-GUID: _eNSxPCVckxvslVRpInLxxdoaNrtvd9O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfXwErwSfgbhuW/
 x3F9CTk/2erdM2pt5z801IVkvNQoa39LFy1ikv6PXjfoYn5i3q+egNpiERBkebkyKGeTj6m5Udo
 +cwxu8muNN6AnmhS9I/RcFO5JhKXnfc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040071

We should be holding a runpm ref when we try to set/clear GMU OOB
requests.  Apparently we'd been getting autosuspend lucky before.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c         | 2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4b2798efd9da..7fe273bf74d2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -362,7 +362,7 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 	 * It is not possible to set sysprof param to non-zero if gpu
 	 * is not initialized:
 	 */
-	if (priv->gpu)
+	if (priv->gpu && ctx->sysprof)
 		msm_context_set_sysprof(ctx, priv->gpu, 0);
 
 	context_close(ctx);
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index d307cdd17d90..e3e7c401fa5c 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -9,6 +9,7 @@
 
 int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof)
 {
+	guard(pm_runtime_active)(&gpu->pdev->dev);
 	guard(rwsem_write)(&ctx->ctxlock);
 
 	/*
@@ -21,7 +22,7 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 	default:
 		return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysprof);
 	case 2:
-		pm_runtime_get_sync(&gpu->pdev->dev);
+		pm_runtime_get(&gpu->pdev->dev);
 		fallthrough;
 	case 1:
 		refcount_inc(&gpu->sysprof_active);
-- 
2.56.0

