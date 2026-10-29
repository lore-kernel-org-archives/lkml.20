Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793232968;
	b=TkKzQ1BRslVDLaqltXtY91CQMH+8GoMltwddhP9/iNRDuKI1tmWFzSzchocnkOHvXSfY
	 6BIV8fkBZU+C77g/g7ERMdRcYPZbErBvELdHA/heXTu/P6wIQKtgn6Do0jkSxzCuCQ5mX
	 YwSfxVfqAYXFk8JMnb69W4TWw23sVUB/Ysn/eLa5gM+qfaeUEqwS0tVyNeGzNm56Gbiv4
	 ChWdFo9pPQLRUaAa2V3IiLLbwKytbyRYWZ8UOLXFSHi8pe1zE/DnljYKNtkETvu76hSQc
	 CUXM42W+P3+YKuepy8hC0/mYmICnzsQZHog5s7xdH7UD1p+PBYh7G/J1Gvc1BZPJAiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793232968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FVZmdezsYb51EkZEyzeJ8dV+ufA7UJom5J2D4y7zwYc=;
	b=hpJraq/eWfF/gTr/PD2CyTR7AFL/imXxwEgqpGb+nPO/IFh45oYG0jZ0jnA9cL+BAlv6
	 Gz9GKSOAjikgz6U+QRhvqDXrpYD935NyIzKUXwHqW7KI9V8UzjufV0iN4PvgIn3WgYwwF
	 vYIgZSwWszgyzPp4BHoKWNvprdCyd2yyWaq0OQFbi5szBj4Dt69qGh6qslngTkz+dk5lp
	 ZnGpBzWOA1gY4Sc/909j6ESoGYUhL5yI0BOsPEzZ4jsGRaxEIvyVzEFBSa1hnCrPIn7WR
	 YhDMr8R1VUeR1HTmFYQTx3AE8Rk6ylKE1P6676Ht5V6WPy/z2Em00e3CI++PaIw1B7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V51woe7Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gn9PRVJq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F78606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64F78606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V51woe7Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gn9PRVJq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SMAfwg2429256
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FVZmdezsYb51EkZEyzeJ8dV+ufA7UJom5J2
	D4y7zwYc=; b=V51woe7Yjxtg51tV2f7EwvVl8gQP9G92ub519Y9jQgk/3dtUUo3
	WaDTGRw4AmwJ4KQCq2p+7k+xEF99QAH1VDjpYIAW9tGRtZ/UIBsKKBI6Xv7qGO56
	xV+8y5Yr+6S1qOl/XXT+LWOkIMjkmK2FP03/QniLUtKBJYL3qoWKaBXWhGEbxgMf
	CZZVe0bsyiLIKdhHFejLKxJf0kOOHPn8voahVimlNEEqpJ0c0Mk7CETJd0FgFVhB
	5LANraUAHEaVRMmSxivwe9KReohpfk1m8UuGHel0PI4o7SK1M5cm393bT/wqzB8s
	fEae5zTQK1AkTqtZGHGXPgfQF+pWHbYLloA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwc39j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:16:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05b68f851so164255b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793232967; x=1793837767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVZmdezsYb51EkZEyzeJ8dV+ufA7UJom5J2D4y7zwYc=;
        b=Gn9PRVJqmN9AS1B6gzb2zt0mD69RC4VGiDY6gpsHyMZP+eeEgWCGvkm/V8pACcLhge
         3hDsXXhv/Rl8AKCiySQHVAo6Qg2rFew+roBXzj2TJjga5UUkcYMn8gazrzJJkvBa8vnz
         gsJm6Nqgws8zupMlUTPpLEwKD+P561ojs+3SmoW5423L5h0OnBmYnH4Kl9FGMGLPIxIQ
         9zMahoYgp4iYgXkvoJbIcB1s5nfg9VFpzzyvyCjabynht5gp+NGtpx+NHKL6v1c+fTi4
         qoLzUmWsHwff09k/p34ZKODv4LlEnuLUNuTW6Zi9szQKezgzn9zmo5yZebYeT5zvGyRJ
         aBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793232967; x=1793837767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVZmdezsYb51EkZEyzeJ8dV+ufA7UJom5J2D4y7zwYc=;
        b=J3b+dCa2UhTzFqJYD2elI0gfm9DUveTsB5YyCSBuZ/B1ZYjjDZgsMmWfaqq3WL3XAE
         plUjGBA9FPdAgqHFSf2xmKvHQYjCSQHeoJsWH96D27TK3IsHCtzQFwrRuNNpK3zidMP6
         XOtyujk+GqhvzgeYJ394s2OuKQy8l1O0qotgoms2LT18yHgw+8SKg6VFi6z16uu9dJpK
         hmRHUZNsJR+rst0DEWq6ee4pAB+La7R1DBsBgtqWNhDuM2qkm/MBoX0thAbWqg/i3SP3
         h3bBZcNFwcklyByLj/dBN0iTYcmPMshqlS1rie1cMS9SioEXXh+u+ngG3b8Ru6gF4xx4
         71cg==
X-Forwarded-Encrypted: i=1; AKwUvBwa6rsQzc3uphyVMpQmnjIaq7WHaR+MtLbIZhYHE4GCJDTWXCmlVSZPXnK+/+ZRslQ1PK6gPcsIRpH9jtQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgxBPDaD/lkqDkeq03tUABNjqmyaD3qoSpflIyXMKhu08mJoPf
	ftLALXd/DXvJQuW963xfZxyeep6EcfEHzHe/wURBB/dxB7UZ+VmiaoC2ylwgB4xhYiOn3VCUIr+
	7xSi+pHJzZJ2FxQSfXStN2mAkO+CJwtozkmI0voqP+TTWPho1y/5J84605gair/sZY+Q=
X-Gm-Gg: AYBFou1qlxfNB8pllSSUtP50nG3qjRfpjY5Oa0XDyPJ8d4sLX4AIzUkxfgSYcq+wLKS
	HgFKIpeKrgvj4v39CZakz0r9idZu6cxyR4eQI4dcW4HO1WLo3lhIBR7llDT8dFVRQs504+1Wkoc
	y3QD/3LBwiCHPwpeLJBych8uXaSi7pdbSElNl25v7xSrDOH/oOKHryTfIMly4yOjVtla65L5RYS
	vVuN+wf2atFZY0dRcHr/9py+uueMdwrZgOX5tx5J53+GFYyP/TXZZJ1CTFznWxJSseNwWAIrx2H
	Enwmbg5QMZClU/W33IqUYdAZZu7PTI+93y3RMERotowQKcZTnDe8ZiUxSFYHOlCCvhifRq2pf4c
	Pi6wJub9z11QUagC9k1Td5olsjtaNBrR6B4S2LAL2JFA9pnuD/TZ+sMlr2IYSLV5cWqt96WrC5Z
	dK6C1CL2eV87ey+B5T6/ri/oo=
X-Received: by 2002:a05:6a21:4383:b0:3e2:157f:681a with SMTP id adf61e73a8af0-3e913bc2b3cmr636182637.30.1793232966807;
        Wed, 28 Oct 2026 17:16:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:4383:b0:3e2:157f:681a with SMTP id adf61e73a8af0-3e913bc2b3cmr636154637.30.1793232966222;
        Wed, 28 Oct 2026 17:16:06 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc90d74sm4508324a12.20.2026.10.28.17.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:16:04 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Soften no-firmware message
Date: Wed, 28 Oct 2026 17:16:00 -0700
Message-ID: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: cGqtZdZxjuFNfgPB9l2-2zC7uk9I8TR9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwMCBTYWx0ZWRfX5eoUQEeAq3EX
 KH9zOY/VGuLjVfdMmHChx+UlPkuQZkYQJ4mLGaJ7hW5u7OX5g9oXP1M7IYrz4EXP1dkPAuw1KZg
 Z48sMeDli11lEHp+DptwbERMMmuAFzs=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae29047 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3K5eXpJ1Jj6lJJV-ZGAA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: cGqtZdZxjuFNfgPB9l2-2zC7uk9I8TR9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwMCBTYWx0ZWRfX4RsYL6ZKclbh
 RlNxA2s0ZYEfP3zyvjC9C5JvtvXra85hwKJEeDhHLQziIM0aLAvQ/9Gt9u9QPMX+ZshR4UfvQR2
 4QkYLXkTBNtSehr4MHtZvAp5En/n0J6JxlYFGBcMgcLu5fQqywF3cy1iatpiOlSRo+mqoYLREhb
 Zn7E209YJL30i/M5yTS4stqh9DUNDHPhGioiyMY7MnFJrMQsZTWmfNIP2A/PXvjWEPK7VIbwRfi
 na53RmbT/E6X0YKQvia4EHeCGn7aEResreqq5zFX2ohEvN/7nmkB4jG546YbDwjpRAJ0ffhVghW
 CGFyZhyK6TW6DUpN7SBAmIRGELWchyIiL5s/78zPT70xzG3IOyZmZ70MOhLejG+4yQ0LUO5ee+T
 xcDhQS+sIUgAn9fVavFA7Ptysw7ASiAVryu2bDrdziTROeU153vQXX5BswssCWtckIQyrKh0gmc
 br0tKIs2mSiUU/p29Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290000

It isn't _necessarily_ an error, the driver will try again each time the
device file is opened.  But if you don't have GPU fw in the initrd, you
end up seeing this error message at least once.  Which seems to confuse
users.  So try to re-word it slightly.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5832dc25d6bf..6db6cb7eb287 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -558,7 +558,7 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
 			adreno_gpu->fwloc = FW_LOCATION_NEW;
 			goto out;
 		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
-			DRM_DEV_ERROR(drm->dev, "failed to load %s: %d\n",
+			DRM_DEV_INFO(drm->dev, "failed to load %s: %d (will try again later)\n",
 				newname, ret);
 			fw = ERR_PTR(ret);
 			goto out;
@@ -578,7 +578,7 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
 			adreno_gpu->fwloc = FW_LOCATION_LEGACY;
 			goto out;
 		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
-			DRM_DEV_ERROR(drm->dev, "failed to load %s: %d\n",
+			DRM_DEV_INFO(drm->dev, "failed to load %s: %d (will try again later)\n",
 				fwname, ret);
 			fw = ERR_PTR(ret);
 			goto out;
@@ -599,14 +599,14 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
 			adreno_gpu->fwloc = FW_LOCATION_HELPER;
 			goto out;
 		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
-			DRM_DEV_ERROR(drm->dev, "failed to load %s: %d\n",
+			DRM_DEV_INFO(drm->dev, "failed to load %s: %d (will try again later)\n",
 				newname, ret);
 			fw = ERR_PTR(ret);
 			goto out;
 		}
 	}
 
-	DRM_DEV_ERROR(drm->dev, "failed to load %s\n", fwname);
+	DRM_DEV_INFO(drm->dev, "failed to load %s (will try again later)\n", fwname);
 	fw = ERR_PTR(-ENOENT);
 out:
 	kfree(newname);
-- 
2.56.0

