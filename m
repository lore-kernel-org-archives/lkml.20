Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911244;
	b=GhrW1nP7Hdwod8x2ATvIEWRvo0dl4+Ku/I6nB+Z0l2voJoqcBVcg2aMBuwCRI8jWtnwo
	 xPMvaFYj0BqL3x7AkeAxo1JBRuYQK4cH5kAvn4xnv7SVSxeq//bh0SqYjll+DZEr+5KPJ
	 61GHyJBUqoE3q1T//yPx3RIXv3vp4RZxiYvmf0JBOx+wLDeQy+HWbo9SL7Q14fpEG9PYC
	 Un7ZFsn2JR6kY7O/U0mrherPib4QbC0JIQepLv3h56FSd4qegNeQu4o94qxSaJgJ9FFr0
	 VqWQD5GI8ua3Algmd+jFGvGx59DVIWDTST3gw7XWqB+kiUNwnf9Ld+aeN+F+Paub4uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
	b=yEHKKflC/msOtch5QPkrGyLShNMW0dlQerbPG7J4UsCDhE1A5YqpXIqqAGvQpw6MGYu2
	 yXh6/4eeUeBG7m0vge/d/n3SMzkmytry0B9XRkEyXMRF3UMx9wRoY06Xy8y3I4YtG8hkr
	 89XGg6Ui6qkeINw2AjSP+dPPnVAafHLIUg4kB0fVgrX48pjFIkY1cKRQ45uZ0MJ4Huzy8
	 4YV+zLAEU4I3oww6JJ/JhyFhbNVitQuxIJf+eWD8Mv9StU3NsnIMt7r1pZKK2YOF4I73Z
	 pr56pXJCRyhz5vy31k8knolUNEQvRnR2D1LDWAg12CWet9eaFGKlU9vrNqpgv366PrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwSmFY0v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFf50S+X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD84D6082BFB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD84D6082BFB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwSmFY0v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFf50S+X
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5JMWR2599701
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lfoXwA9UTdo
	ZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=; b=NwSmFY0vH5c62ZXXuZTBhl+slPE
	XtIPJzzOLQqhsI6gZRN3kQCw22GTkzntcn5OgO4YW8IVSHtcxTgKIPiNM/76Mhn9
	0sHiDLupizm2OB5zoHICJuDt5A8O8341w+1q/RpOGCQZHK6FI1DkRYv0xVUwbjKA
	F+wtv41nO7wjMJ10g6QAStqgoNMGSrdjLr/d0/ppT4z8j9Sxihp86VcVmEBnO+MC
	A8Jot3JaP7cf1HidKtiZUlgaDSQb6RS43GfvO2f84xNZOMJPS0qZVat07to4duuu
	C+qLwCXb5b1j5nl/f7Zd8nHvjPRRDBX8lqB7wx51L/pyE2fM9JPXMz7L59Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvv0atk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:40:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso1263894a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911242; x=1794516042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
        b=hFf50S+XsZYkjJIlSBC23Sc0/hPCWCCG9Gwji4FzuHf23EU12xBG3LaYouulc2nolp
         W0jhW98sEWbbCtr98FdmVgKqsdtpBYcBj4XBkuBTcsvJaPtU8tVpuvRyYmLtZQ2Su54e
         weBBGAavsj6H9BGipUniMudFHLGlw8D/ccpeYSRcpG8qYiZTiYJDEzap+l2E8fSkV7Eg
         NYNF8NMRlBrRcOLTCQLf+AnmftXkpsm+B9dHCzBzjac6HYWWIWBo2ws9dJlgOWa0a0+x
         66rUzSx4Sg4fI1DJS3ThMmMTwX+qTa1H7UVQQ6bdeBltfFxijMo9rKMG7ziFlX6Pw7RB
         xASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911242; x=1794516042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
        b=0+vT9e/DsQJ5knfrrmmXOSWVy+/LbiBXFGV1zXcRQMkyqrWXJy23MLrWhXowFrSjZW
         6Ed/S5aO06eTAipHUR88VQruPMDo1edd5uC0MugUs6Y4Lt+wnvARfNHTUmiLk9AXFYzW
         Q6C6+aUa0VfIjRUQUFOjm5sfsvDEyr+jI2gU/yUBYR1cVjKqcCD5++9/GRp3ylvgNvfA
         cTsPDAbASYn9zpQ16NoGYhQtUJ256AwtX+t88PmKYMizTeZzw47UhTduh33gBIB6JIVU
         I77KM7EiXD+SJ/vWtKsDN7qDShlXHxduNPjvQh+u47C8sbO38FkicF9leOkQ6V4WxKgF
         vvRA==
X-Forwarded-Encrypted: i=1; AKwUvBy+gwiVsk0kgXKph3++wLCO46oVmBGgtNJZmG6Aeehx+CdK7WOe9K0bg2ieskqnFPxl9Gxpdbs7/tpu1VU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o10Qdh6VEKffVEa3w1IZ8JK4XXBZWRvXVWvpmH9AmeWAu9u/f
	4rMOGBX8rLjkzLHAzpMd6VPLof2T6J7hNEPRQ/M3iHuKAFckNfNbp4SSswFbpvQuHz9wml8oONC
	llFSvq9KK/3PkLrT2H1J+Y1nlOnhO0V7nhzQHEPbYzZGmqtc10JC/GFcUWJ0kvvJZOwI=
X-Gm-Gg: AYBFou0mrY8n9UfSJsB6MY8yjl+Jd1Z6smrgUBpEvdUREGGHN6ffZQvmwCUIf0Sa8nQ
	30rft0vkRu2fgeGl4nbJkan+MXSXtqYWqdwC80n/DjxZXF1ueF/m+XNtNLyamEgFECaie2kQHVd
	9NJcAKqNMxGLVIFfq7IFQryl6mmounWWqIicXpheuvFK69J0GMOsMUfTb/XQt6BgB0GRluCqCxT
	Vhr3eRvoIKI2IqvWliKosSetDIVi8T82DsYMj7bc34+WIt/ycz/5MSBk9G3kXUxBYSLKzHRGWZv
	+Z3EmJKQVCcT3CYIBIF9qoQRo79+/rBcO9+aBVGot2EHqm5PG7VBO3bevdWV2Fq36O8UQF++V5h
	ZRuevdffLSfHRxD8Rgq+5x267/f7MLdEkxyUr7ByqC+0B8kMGG/AsLf+9yDFxUnf3nx1B+GI3lD
	kRb0+ePeZO+jfS4/zfkU+6A7YULoW2qCNBU9GahglrTMNtG+7cDgYhazkAx1aq
X-Received: by 2002:a17:90b:1643:b0:3b0:8947:fad2 with SMTP id 98e67ed59e1d1-3b0db70e040mr203468a91.53.1793911241735;
        Thu, 05 Nov 2026 12:40:41 -0800 (PST)
X-Received: by 2002:a17:90b:1643:b0:3b0:8947:fad2 with SMTP id 98e67ed59e1d1-3b0db70e040mr203434a91.53.1793911241219;
        Thu, 05 Nov 2026 12:40:41 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42932sm616255a91.6.2026.11.05.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:39 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 09/15] drm/msm/adreno: add temporary __maybe_unused
Date: Thu,  5 Nov 2026 12:29:35 -0800
Message-ID: <20261105203057.66520-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXwdcHlN9RtDNF
 VY54FFR2L7Dj/Qcu/dl11PldHE1dQxCtDYm8weETn8ELXF6YCn7IsXogFetsr99AtPf4ELP17UC
 YJxPY5KyKxB7xKSz3BvogtSlTwYZPZo=
X-Proofpoint-GUID: uECMAaw9clw0y4SoYb0_kNRBNyoHScMa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX7ND2P6zN9LWG
 tcHzBWJ1aioOtf34nBNMSLRBHOORQM27AaYnEG1kN5A+bA1JefofITl/4lq14RYva9ruBjwMoeV
 v0xLFX+U1f84Jrvt8na7eGwGNAGIc52jbWDHZt3c6dm3kTBNa/enShzMJsRH2AO128el24Qxr+c
 oBjEwuesWu+6YTdby/7YpCZqqA8vHpNXqVSJQqJyO9jMu+OyIni4yGkGBUNbWNIFa32P6IbqrCM
 LJkUYeDQK4s8wacQPqQGN+vPm3iWmyl8R7Mw/UOE4YYKqyX8884MdqpVV1wnYO8RF3DXPVey3sp
 5Srqlz4oaJCoMi+Ctxa8t9PN3nd6Nge0OMU6hBqFHlEPeEp6BWpLsfNmI+CVDfn+a/uJ/bTmDgi
 7PGKBzOq5JDGBA8Sc6Yr5hdR5WslNp10+/PRQxKPxWDVcwmo3WXaDxSl6aad5QQjw1SxUms0SFy
 8kIfzwkwMYenS1HJlXA==
X-Authority-Analysis: v=2.4 cv=dKUzC+Zb c=1 sm=1 tr=0 ts=6aece9ca cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5VHPQfPT90DSkkNPp7MA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: uECMAaw9clw0y4SoYb0_kNRBNyoHScMa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9e0d37ec9c15..2408adfeeb23 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

