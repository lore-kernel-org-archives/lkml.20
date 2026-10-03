Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2D82C11E6
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987458; cv=none; b=FCZaxvw1Hjx1hSfhaHyrXEeEuCY2hrexk4dgFKa4JgvtZz1l/4rbwmlABANkNQPRqnuaVMOHaR6WOh4S8h4odcSTcl3maynVzOEYfZnHX7RxjSJfkdHdkrsmnd55ALLEC6Ct2YtP+Zelk5kK+mBRvDFiPziYv1DSOjfZywPhYhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987458; c=relaxed/simple;
	bh=T4qe/ky6P713qCmilfQ+5NwYZw9WXGDP/jjKvtHyyOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JbybJxyubY+raF/4mW/JaPz0iwFs4wsJzO25/rXIuIlRKtAkEyRyeXHmYvjiUWj4rLP4twnkDHsl0pAk/GNQOLnQ2CFFU0uI4PDLMhxE3hfLaKcOc6Fre9cxzcwaYyRYfJv+tOX1esA98D1jKyRtcUwq+jKUVFicR5g3DlBYwf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsUC4jJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7c1XNFt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsUC4jJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7c1XNFt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne5iT2928174
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=; b=IsUC4jJ8h66qijVn
	UkchFA/dkBEwvanCbOlxO3nbTVVk5KjvbMq75+Xi6F6XyzEjTy3EHJLZJFBEAsQF
	und9ip5Nb170/D1UWBc8r5zN5A+Y7ZWz6/Qbkr/7VKNhMe/0S9HdV0tX33LTNVye
	8lzQghQaI9Je6ieUTCVvhKNtbxAF29QHiH+i5kQJsXodTq71fEf831YqWMl3CDlc
	vEeDjHcYYsJk0T6k7rQIgwEMD1w3soL2ciobO7kF1zMH53ir82Taf6cZxqnwoN3D
	ZuL67ZuH8B1AHqGjjLU24lVqJX+S+Ld/zgbPGTY4Smuog/lqNbcqIqFAGkfx9mQh
	ViQKZg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfvusy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:30:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91064f6e75bso10896606d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987448; x=1791592248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=;
        b=g7c1XNFtRFxwhez071ohMEhICBVOU0JG1MXD3602jB7i9gKJOfKmdqrgEXn+9LeiIW
         HpG/7FtdbiDp0uChbfdCEELNAlJ3V84/JA91L3gf6EAzoWqDa0ubY6OKHmfdIv4FKRDD
         WBg5JyITW+F15iCkkIHiJXK8iPjsVs/VNx3w0lw44gS9nhafwGTlLvLsElkyno4p/R8k
         80XrHVomTAB4kvbw0zV+BhlqBXChg9CZkvGe31apW4CA6HeQemaMKeeNMqUBx/XWW6YK
         sg+dMXIQWnv51ufd2UjEs9qnzVH+DTzPrFQKtf/tfoHRTUEljwgzyg5q0/FdNVqCYFxK
         qyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987448; x=1791592248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=;
        b=a3XiC0ZC0t2eCzGUxBoSW/q5liYGMQDgyMaYxpiJXEkiFNvU7WxRes+Un2Ubk/OCig
         BqxEHBxmjPlobmwRt6Fm+W7k17a93GoMpWIKYkPF4rjXi3aCDN8lvQZiZDEvyB6zLfWD
         HOvOu9VOSPXGb9DYm14LFZHV6orsGVOlIZfN+XsKkP8h7j6oVj2Raf2HxWf8wS9IBdY5
         nW2t017Nvs1tZIX7mLIFy8BR1wWwQ/kEksbzasizD3FGejGoQ7GWOLXNMOXHSlApuHZU
         DgR3ZCguSDtxh6/9+F2qCUtSlmBlZfiuoAmXXkyK7cZjkjUpBJGIn3ZW6u87zqkTOPfp
         ajHg==
X-Forwarded-Encrypted: i=1; AKwUvBwRn6BqluGIZpgZrnKEhF3oM7tNLRMxjUSZoDBQ9k6ZBRWioAlNbUx2sgVNctrZkSGtp+hd4pu49rcJ3mE=@vger.kernel.org
X-Gm-Message-State: AFuF++njIm2tOtveHP8kYqUpzVp1UsjnyOVoL/ze0Mh5vkzqk+OehoKL
	QMOgh+hm9sJhoEiayexGgNiZD2eZkfKKekyD545LF1iThX8aCFBtS97rYCx+Qd2bZ4dlNd+XKJH
	vY905BFemcVphpq5pBO9Wycz1/TySHXwMZTjg9w2z28dnaDgRGbHkM/B/cLvKrmdYyiA=
X-Gm-Gg: AYBFou0VpxQ99jYMWrdMZ1bdWHnb6JgO4xgWJ6FLSxwRE9H0rr2U81u/LfvTmYv9bZX
	EKb9ALk2dMiYoCDSTQDcy0Rym8Ykbrzx8UFzJKNuv+eIABo96yhtw4GJOCxE/NwSMP1zMeUf7nZ
	w0iYXj2n7kK+GoHYwRg/NT1PencHjT/x51t8fToBtNlxtQ7PHFM9ZXz8/9669rbEBLD1xUhAoJf
	yYh+AiXoA0+dtEnezFbX6RGZKcl+aKKPfwKavaN0NKOUiRd+SwJexTlE8eWPiY5DNzcPmoXh16d
	gTh3o573j776tCEZT1TOk9o23MhzPGV84gZCK2TIddEVvN/reWMJlKHmUURJd07zinL1UK+xPFt
	bBgV0c4Z4FYiHpv5f+JbvoIG6Ab+aD6d44eSEYYx/rJr9utluqsAOI/Wu9qcjQKJhcMmc68bl5L
	xcbse6WXLTK4km
X-Received: by 2002:a05:620a:1a20:b0:939:f89:3688 with SMTP id af79cd13be357-93cf1751b05mr840052585a.42.1790987447722;
        Fri, 02 Oct 2026 17:30:47 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:939:f89:3688 with SMTP id af79cd13be357-93cf1751b05mr840047585a.42.1790987447198;
        Fri, 02 Oct 2026 17:30:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:22 +0300
Subject: [PATCH v4 07/10] drm/msm/dpu: clear the DSPP pointer when no DSPP
 is assigned
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-7-2a44d4d8ac77@oss.qualcomm.com>
References: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
In-Reply-To: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4qe/ky6P713qCmilfQ+5NwYZw9WXGDP/jjKvtHyyOo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEye7h6PI3d1u3vhX5DTJ/vYsFb3Rk56RGQKF
 l0e27V5m8uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMngAKCRCLPIo+Aiko
 1TLbB/oDFXqDK7I3TzcVpkY8ny3IntudCZOJfJvFl2nGnOvsIDftB1iDwVluubR0odIwh/veNro
 Lw2AFIl6tPybNje67aPMwssRrSCiEPCFtRLV1mjfLYquWiuHkw7oJQvysmCYPRFfrNT6skcrUIn
 LJVZZfCVRf5O2/nuZzQnjw+s29xoqw9hp5R6W65UZb2snMTW82odzR80huairosXfECJd5HwOw8
 MbpklDSLPu+I8DXXcOui2ivfKG/vayvlMl7MeMFaWcoW3MbJY9XgVufKAIPJO9tlaqE8cCrU8he
 Fk08QDzCf0IM1zkFGlo0h/PLBUb6MsIzRivKpI4YXNiYe1ej
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _qNVq9A9ttOZk5XpwDpYmqvFsZJ8aBOH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXxOjyGLV10PEx
 taZsve2j1LonXwNvki3E6//yy8NdNzN4YXZe6mfE94v8JkmATBaG4SQRLulUQRc+Ym5Z7T8MJx+
 EnRmXNIxPvUCpHvK6jnHMFVDzASqKSo=
X-Proofpoint-ORIG-GUID: _qNVq9A9ttOZk5XpwDpYmqvFsZJ8aBOH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXzUrKIKDf8525
 6Bka6yMhM66MbwFlssKyv45aLuK3XTAdvoyvnyFUNsttHF6trzX2TGKBYJo0apFGMMjqQTwGsBe
 B2DVyptb+QPLMiET6lw2lRS0QpgYYINAfUQXBhjv4A3zptxVyF9f1vcVK2uEFqgs7p4Blo4K7Vu
 eQr0h6xvt7BkeHC6JEW+SU6vKGtA/3ZMMAvg0Xg8FcglwWmr9jy1Ixnzvzq1B2WescE2A/8F+4w
 PF27/4z6ZdjWJ6dBNcTBo0ku6pvODi1Ph+KXwssShJdisdOaLcMVEn+uWmgxhFyv4nBgGBt+Od4
 0nJihsgiifKEyVz2dJWW2NWTIOnZapc4ro/0/mVoUgXtzbQjAAJq90pHV/YFkHJq9EqT+FSVEji
 UOTfPO7/RJT5iqghTB4EpPe8gGkqxv6jQtlCOiXaf7h8CEqmQOXOy4wFq9yHi0G/KKRR9fEnNtI
 pPGqUxN8BV4g3Fs1bWw==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6ac04cb8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jpbDcG_WXHA3xrgMYRUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

dpu_crtc_assign_resources() only stores mixers[i].hw_dspp when the new
topology has a DSPP for that mixer, and dpu_crtc_duplicate_state() copies
the state with kmemdup(), so a crtc which once used a DSPP keeps a pointer
to it for the rest of its life -- across reservations which no longer own
that block.

Assign NULL when there is no DSPP for the mixer.

Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 1f8fce366a1d..2ff0dab33710 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1480,8 +1480,8 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 
 		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
 		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		if (i < num_dspp)
-			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
+		cstate->mixers[i].hw_dspp = i < num_dspp ?
+			to_dpu_hw_dspp(hw_dspp[i]) : NULL;
 	}
 
 	cstate->num_mixers = num_lm;

-- 
2.47.3

