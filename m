Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF8747CA77
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217323; cv=none; b=FhzbIyEFtBA8rx+5CYbz3pWb8z8nbC39+VliA1ba9MnjLKckd5s79L2roGCWanOSLuigHgjJVVwtFew0YnoGZBBH4lZhotAkHgKoti+gZqfjWTNlsPDywJzoOE9B6iQxHTAA6Ix+QY1qAq9UDQe423ldpwO1fkhyu5GSDCrV4Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217323; c=relaxed/simple;
	bh=b0Cqqqr5RXysOo/IlbQaAaOsD61faw7dj63ogkvFqxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ITVpSXYUyie4p8LbJl3J6oTfSsi20Ay+blin/xOz8P1IClO4jDJ4UxjN/HeE/RTX88ns1bmlfx58RJNltRGEC0mRNaNVplXs6g67lezy9hGAx1BMtbMvgA+W9N6xGPxC3ygV154rAiE98cmsP+lJz09RwhWEAFK2ZBt8Z6eoy68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agBy3CGY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=io+/SYFQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agBy3CGY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="io+/SYFQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBe20k3103344
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csdoT9oCeHS//8bD/6QO58rYEQChTDH1xyFYL1OZaT0=; b=agBy3CGYWFJ5DI4x
	eTq4qneUlnWTOtXb8bDHuABNK3AZxKJ0yLcBzvNsDbChUWZ7g477OBfwbQ9b9dJl
	lz/4ubWfYJvkkH/w9wGTdjpylkuY1iZn9x/xPqFOWneAzd95COlxTk7TStdW/6St
	84YpiPFgifrG/ZOjYe6ZWxn82GA5Gmyqr2o1gND/PQFuNoO8SfwamMu9//eDAD7h
	FyPeJcWgrhjQD/kMBxF5S6aH6AEDGzPqq0B2unkytcVga/wvsj8L7P0fal4rMSO7
	DmFocjphE/SITiiLtSjr41dydFZPavOJ1BXG5ebdbh+83Rb3h4VhdnEITAEu8HFD
	oaK0/A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8y6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c6725e7891so865376e0c.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789217320; x=1789822120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csdoT9oCeHS//8bD/6QO58rYEQChTDH1xyFYL1OZaT0=;
        b=io+/SYFQZ5Qxq19ee6ctYVNIoxXNserz9V+0d9+ozRePlX24zj9DVmn/scQrINyOom
         Okm1gI1W41ri4B9J50XDgutspSiqARPO0+1GRZBkfa2iczGOsCsSBY8AxFRGnNuaL2L3
         jJQbnBvMosn+qLdlXVDjRpdXJWORYIYy7qJow+MmsZPP1Oi3VEvcU6G8d6biF4XqZO0M
         OlE8SgpJVnRpPlWje8b1outN+nXMHXLoI63cTod7kDYhJrojiQzone+wuUPIn8ziI7nR
         rnrI8eZZGyRgCCQgnvoOSuYdZd0Od3jjGaZMrI7Q5wIx1LdaJD/GfZKEsi6KWyW46D24
         8l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217320; x=1789822120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csdoT9oCeHS//8bD/6QO58rYEQChTDH1xyFYL1OZaT0=;
        b=pho2QOR8CrAvTiaJ9aPLNO/wYyFifrXqrBispGretKcj6SBXUInInYmgrLm0A7sPJb
         SaCeEYGN8QviEP+N5roukXsi+LPDom1a6kCvQyO6bBruiFwyEcIt/cjN3CPg/1aC4nyw
         dMnMasscayCKIe7cnpc6bdo3FIiF/DL8idoTf+oy3lpNLk68ZeWxRdTC2mzzFZBIvrJp
         j4jtxaMg7LCgY9Hani4KEwfk0qto4m4+wgjhkAljbQf/ES8sbJKp/X09Dh+0d0jyns53
         0ekNMvV7RRoysSMU/M1fB9mY32JpL0OQPbGPpTu3LA2PNhfmPRGcUPt7LgsPpd2/GAvM
         AazA==
X-Forwarded-Encrypted: i=1; AKwUvBx30jvubuQWoXrqiPfynuYKDZk4gf5bs8+Q4OrQN6U4Lab30cO1GgNofKs583KlCWUdmMUUZn+QO+6xyWY=@vger.kernel.org
X-Gm-Message-State: AFuF++nEYqVfsGfHDWQSj89wQGoNB9pF7vpLLB1N9deVv+AaS3WmIq97
	WWsirN0B3FuId+N2pdLZvewp2LSCl0oMY/G0RzvPogP4O8hMld9qM6exgv88rrPLycsxo39gRc5
	LzaxfDK1WJXuJKBOF7nyGnsuvcVq5tXltqJEwz57n089Netqh4xj7dx7Uwh1hBkLYc9k=
X-Gm-Gg: AYBFou0ikfEv6z1JVddVF6CCTNO8Cw7Sk4SR2XiYC7grrQanF6lsCnQ5uc8Xlt9S0RA
	ZW0J1Rx/qEHUkS7LQRv3AGvrxj+MAsAz4B0yUFAWPqwvHsYamfyKi81f3aDWbM25iHYUJoFdgyC
	nlaC0CevGCzmUDKGXh3Wm6GEvHmz7IPgY1qcXfnHwmc+ZZQIl0um0QiVsnMNEqodfAL4S2WCCdt
	o9qNb98E5QPsFLIf37MZDmAau+hs7cB+PMOnweBjMmPG+fiAYN/Hfv6ZGZfE5+iixpQ3NgERb3i
	eFEFN589Mhjq6SbxNTxfxmhcP4BEgSymQYv/Z4mqGq8vutUSCufFn0FqGvk2VgYJC2N1AVnposp
	2ZVGdux9kb1EXVVln8GwmGlQ2LLkY9uMp6yOCSAUUOzVWU5n8268jeJ4XKaYRLmz52YSDuH7E4a
	T3AmGVXLtoaVKd
X-Received: by 2002:a05:6102:390b:b0:779:5049:87b2 with SMTP id ada2fe7eead31-795a0ea85cdmr1722624137.0.1789217319818;
        Sat, 12 Sep 2026 05:48:39 -0700 (PDT)
X-Received: by 2002:a05:6102:390b:b0:779:5049:87b2 with SMTP id ada2fe7eead31-795a0ea85cdmr1722614137.0.1789217319453;
        Sat, 12 Sep 2026 05:48:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm8825701fa.34.2026.09.12.05.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:48:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 15:48:28 +0300
Subject: [PATCH v3 8/8] drm/ci: mark pixel-format tests as passing on
 SC7180
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-fd-kms-fix-smmu-v3-8-a7ddc6fe2032@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=b0Cqqqr5RXysOo/IlbQaAaOsD61faw7dj63ogkvFqxI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpUoX05zXcOAfkFqrJSW34pjmtrAN5/+czbqJT
 E1f17mbnJmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqVKFwAKCRCLPIo+Aiko
 1Z58B/4r2dJLvpGdfeJ2mE2IkR4JV4FYoW5wZOTXRVl4nIfbVoDce6hkOP/+xHDWzJH2r5DsTU1
 ++CAFw1FgE5GjA2pfBne8NG4Rv2N0tsuIJNfcw9WHPAK+n0UWD8WngN0CASzx/8zQ7mhz/ltPx7
 JD9hnynNn3gd4duwzUfyLB7ar5xpS7T6qeFPnWn3qt/IsflzBzGd2JiR4L+IQkzZn3ODhWybqGu
 Q+4yRseusadrwzDOl9UDU6FFZtvLRKX7Rh9BruzLQbOkqVtBRBgXPH4DygGz5dEF+Vvl9MTWE9u
 f0YQ3zN0PyJeFu9eeXYiYBaus7Vc2BIS66ncbEl2g4OLri6v
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa54a28 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_1_hEmUK9n4M9CbZuSUA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfXwO5CPue3oyMD
 xnIwpE8ubLT5jpvDF+Qu1jpFtaQxBva3M6KN85OonzZkwwp6uWvE0zyHWJn45FH5Y0kGWHzR152
 WuzZyd4aWAmV3ASReVOvSJGlSnyk+zE=
X-Proofpoint-ORIG-GUID: n0gN0yfMW0LZq-cW1O1vfPu7I63cPoqe
X-Proofpoint-GUID: n0gN0yfMW0LZq-cW1O1vfPu7I63cPoqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfXzErUoW9+Rh2l
 WFyvD4enAMRLtAxsJqyvVjzFwjhNcmJV8xLIUTbfx30jUKKqrZqdEovDymbqvKumhKtjALF2oEg
 vES/WH0sCqOQksxSR7S1cj5ODqNLs8EdAz9XMrPYbQlfwPieBk+tAHyR3ciIqTBbNPsWLiY0jAi
 mQn2n3jwzCCWTmu21UCBaKk8JmsL1E6gNDGvk2lrB1PicrcvOVMKNlCsGRXgW7jEYExnqQD5Pyl
 WWS2CQ04Q7HuqBGsT3YU07PC29joo0eNwNUmgYcujFDHB6e58h7jilQ1APPqrPyrXjm5Ml+f6i2
 cMYSeM0k0neoccKWyyC6D72kh+ABWinZDegt4bFmu7CGp7cD4hGFECRskz8wFfwQVh1dsc5B9qP
 +woKWuJ0tr0atC+1zDyM10yRzFGtiag2brebBmwvrFGGbNIS6bD9mnx/6wJ34LHeAp77tnqej3e
 LsWoP4ttRRZdtCT009w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120184

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

