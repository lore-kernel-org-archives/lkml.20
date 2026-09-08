Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39952BE28
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881075; cv=none; b=cC2fPTCofijhZM2g5ZYv+7zFv9kC85jpGlNMFRexUJFnpXmwJNBJ1myzDke9owuXIrSgYkDEtkbhZ3tl8vBE8OkBDO6odm0W7iTHy/WLlvWz1vogCf9W8qsRn2awigCX5vf9iSCnDIPbhqMcqx2VfZZNEoA63KE8c0QvvvaHuRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881075; c=relaxed/simple;
	bh=b0Cqqqr5RXysOo/IlbQaAaOsD61faw7dj63ogkvFqxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WtSLBTb44XwEnSnPCxESyszXZg+w5zMWHR8p6UrB4VGfyHMUfClzg0R6ycDEU5hPX26EIs1j9iNhSi1+GAonYu/h52u1KwVc6Z08Jc0AkDGqlFFX4TJf2RR0Mjk2/LB2gkZJtpQ9KIv8cGyKhLjts7tLlV7aCXpPeuawYowuq5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiBmo2ht; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kekev7tl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiBmo2ht";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kekev7tl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688F1M0M3342284
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 15:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csdoT9oCeHS//8bD/6QO58rYEQChTDH1xyFYL1OZaT0=; b=hiBmo2ht9/ogEfOm
	RWSCAFEKEtqiCWJdaZUQQQgm4vE4G6NlWPNpfLArLFzhSabrZSTg0hXdV76BdsHD
	pRR6YZ97X5FOklpoL/waKzVxWjS7P2Psxnu1xYDts0L4HlNvmo9I2A/vQyXsO7k/
	YjlEe8A6R58HZGJFcMZu7OryG5sPmOblo6fgIq0t07Ep0ULXOaM/VGfTPcV5SFcX
	gXt0SHK+KgGqgLbGnwtONKK/6fT9FS5AEOItw6XpKT0k9H7wtfhuAmG1i/4TBIWN
	EtXkzgc0NbWmBqEtTi06VKSDjjT/eU1SS4eN+1BlPyEZV8Cn5FPUpasUhuEkhjLc
	3ISQVg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjhkj12hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:24:26 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cc46a7765so367690241.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881065; x=1789485865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csdoT9oCeHS//8bD/6QO58rYEQChTDH1xyFYL1OZaT0=;
        b=kekev7tlxRgrFKj+Fa6VC+KNwnHGe2ow5Oag72ZbD90bMmY28wPK9Sa1nvv4CGbUNP
         EFTVQ2+oAo96A4SZxIGeWGpgoLf3JNXXADKYu4i23H4sI36XiaBt9owlVlFJ7/gQ6FQl
         MoiIYrmrvldx+LK2ZKzYt9NemoH1k3zjZC0Dz26cLnBoXRBR3J6H6uUayNb6zWmOBaXV
         Z3jvyq3r5q3FFPAsHIOfdg53ooqSt9YBZbOcDLY5Dh9O8rVRox0srPOev/1h7YpyBowo
         NiXIICRdWnp8PiABe9XNIUThhfLx9fgB/zwjwYad4gKOoWs4WktOrwuySd7vpArfoFo7
         rnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881065; x=1789485865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csdoT9oCeHS//8bD/6QO58rYEQChTDH1xyFYL1OZaT0=;
        b=l35hxDCm7bXtiV+mljjDC9Cv60EFsjDcyyI+3K5gvOydNJJsd2FIt2uX9DHXSYqoAI
         ktLWET8jGyWy0TFT7IfhHJP/q8YC7Mh89LQ5DIw8DbIxjSxbnxfiniNtKqNCgTlJpNDk
         NJMc4IUu/mzRuDiSMvr254fZ/qMtVqvNJAeKn8GnJ4hHy788EsMvWlorijoqbXJ2x0W4
         8aknVOHokjZeB3ZrGW8qq5s6fMKaRNqHK8V6b5JwVK59U640Vjgs2+imHCSLtuaH4WcK
         tJE/lKh3AhEZ7ob0aRC8DHxz6Pa3YOTUYpyc8PKj8V7IjgS7/C9D1Vn9LRcQYOj6cqOl
         p9Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxv4uNf/YPiZhgaGxCQiBZBtsDJ6jLyuUk6oep5f9SzYgCmYjZ1rcDa/j5yeMNzV1akVhQVCiwJFyWSs/A=@vger.kernel.org
X-Gm-Message-State: AFuF++liTMAqTFAHy3jhi/3u2QBumx+R2w6knng9SKjyntSxcWs+WW+c
	b4S/+8pDIJ2m9HxQ2WU323h5SCJnawUGkzHbPKrXGzwgPkU1WyBfG+TdDGGXvWp3s5ueFJ9+aSF
	9AZs/wN6E36wb/7jhUgZXwBILtplL1dziMO6pj9sf4GyPq3cYeoAJHXPd3cLywc5Yozk=
X-Gm-Gg: AYBFou2llukP5EQHkQMCH1lI4kgbPdhpWLzCgfSTAOintw2pTMO+uyT1chHHvKgdoBi
	P6zc5tLZXBeRZISSRmoCW4Ym1WVxwlT8HHVOV8zo2r9SQYwk/Nrnu8p5lyCEFEwdT/W30Q2ZW6p
	v9GokawA0MTOfjgpniTZ/vb7mR/mXm5ZCZH6NounIcR4L9XS2T9YpnoJVxFGWTmhVvWm/gQnXFu
	JNKU6BdVmtk0ZUQNRvjvxqwcn60Cgk56VcJcTy8uKJ/czYhrJBbbM18Aev7sTKj9Dro5SqJpEHA
	3TCb2TWlbsQX/UegGvEQxVNyWX7aQHgmuNeRYfY4nEOVR/LVZJOrgGkGsu1fCtT8QMjRsuuh6ca
	YEMT5nxzvq77FR+FQHzgu++hWN64l5nGpQo8167FvKMRSI9XCcXMVP5Xbhr6zjHCS8F4QPylfKC
	mn3/7rSqMcHwMl
X-Received: by 2002:a05:6102:4486:b0:782:df51:aaa8 with SMTP id ada2fe7eead31-78f7423f9cbmr14199137.6.1788881065154;
        Tue, 08 Sep 2026 08:24:25 -0700 (PDT)
X-Received: by 2002:a05:6102:4486:b0:782:df51:aaa8 with SMTP id ada2fe7eead31-78f7423f9cbmr14162137.6.1788881064611;
        Tue, 08 Sep 2026 08:24:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fe10asm3103722e87.47.2026.09.08.08.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:24:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 18:24:14 +0300
Subject: [PATCH v2 6/6] drm/ci: mark pixel-format tests as passing on
 SC7180
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-fd-kms-fix-smmu-v2-6-9391815742a8@oss.qualcomm.com>
References: <20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com>
In-Reply-To: <20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=b0Cqqqr5RXysOo/IlbQaAaOsD61faw7dj63ogkvFqxI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqoCib6Y5Pj7I8tllYLOX/kLmn67Beb5i/WqL5t
 cBNeZzNayeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqAomwAKCRCLPIo+Aiko
 1fAUCACtazS1FGVD/8UxL8J6pmSEvyvjL6Iu2JeX3qFMXLwKH8qc9KO0dvBoC1hlU17CsRksxy4
 V3jOzlqx1wAp7t/aSKKw2PUA1kUdYadfv06Gi8hC9tTyUckEgN6XwhMyf4Z6Op2BvYorKfrOovH
 0sEzp20XF2rcu2p3mMRrcf7Dyn+rJ7S4SQrjiO3Zs/jMG8ARjuZCtq4LoGLTlRg8wQfYaqx19j1
 6RFK54kVyyeUz4+94hyoEtdTq/dB0MCeuFdSr29zpKs3PM7ujV8rY/wwu3Dp1Gpc0YVfNaBK4MW
 a9y5H6yvL6TUXKH3oe2Ij1Hk0x/WYihYtdM41qc6Yh/IgyWw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfX5UNU4Uctpp8e
 dzlXUtk5bh8mLQqwPS+kg9/6wSFeuqW5aTo/cGkC0hmpL9OHB0Xe+Ko1DIRSzowndOCA7poo0m7
 IOW6GXQNUPxmftLpEUGRW/ZY9NsTav0=
X-Proofpoint-GUID: ZNXWczKDk5u5VOY31QgoBezKJL73VOqZ
X-Authority-Analysis: v=2.4 cv=VYjH+lp9 c=1 sm=1 tr=0 ts=6aa028aa cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_1_hEmUK9n4M9CbZuSUA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: ZNXWczKDk5u5VOY31QgoBezKJL73VOqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfXzPqXmDHBFB8u
 WQq0+KekY61tMwNb1iPjude0ZYROIphdjmOg37u3pR8HuZilUroTGOyGT36+XQ4xuQAxSGDOKhD
 1P55f4Ub/3iSlsj81mRxfAdkWFFTZoC/3HT3YVY9+WqLlUgbBbjpKc4ypDR1s7YpZ0+6hgKVAJz
 uP1N4vAmS9pjxezXE82zsCLmIEUfjjhIMhZctZTJsHRHDPePT+xFCjt+wulKtTs1Vm8gI4r9hNT
 3E8VA3owq/dZcITNghMzohDy5i6o8BQ8jtoxjFOdRliPtcCSI9i0fc7os4iPdshbL5IeVDkfNn8
 lZAFJOI6Jk5/WqfTdSuKPyHNic1Lhvsni2ue5HjkJY0nS9SrI0UFezcmflX8VHCsDBrYqd5rVYN
 uJsE/1myrngmB9ekbbL67jFlTFcneYchD4Q1L4/D9BQ3KUfMGIaXjEtAtsIHwJou4T2Q9L+u419
 cN7h7Oc2M3H2+Y1hO3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080166

kms_plane@pixel-format and kms_plane@pixel-format-source-clamping timed out
waiting for the first CRC once the test had set a legacy gamma LUT.  They
pass since "drm/msm/dpu: only reassign resources when the encoder is
reprogrammed", so drop them from the expected failures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt     | 2 --
 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index 2daf4ab879a9..ea3013faa37c 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -18,5 +18,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index 2daf4ab879a9..ea3013faa37c 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -18,5 +18,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail

-- 
2.47.3

