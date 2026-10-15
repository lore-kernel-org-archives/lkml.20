Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AED492E2F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053582; cv=none; b=YVAtxns84wri6LNiYAzgD4+qDEpA6t3jlylAkjSAeBZJ9y0htvIWtzVan/GEnVrrWoGw1C2iKeB/2PW+UZTMNozzQRAcqqCGLAVtq/b73LE8KuXt0c29pUjlweTSgyZXq12M5ziUskpJb4azaxpy1bfCT+BdwZUSG36D8Xtk/e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053582; c=relaxed/simple;
	bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oLxR9Oqdh/dAi3WaA8sjzPiZ1cXemZAmm1dx+P8Kd2B5Iyfuowm3tKphelzg0XVLkRtl8lY0U+JSBeo1oYFVxMZbGBCEsxN0a27zgfKf+baW6XDAsx+nPKRC1cdbmRS0PQDoKj/dJ0kfbBjvYFZGzHCR9qXGib+bYxKEWIv0I8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+e8eLWn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWA8q8TG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+e8eLWn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWA8q8TG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F765AU1672232
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=; b=a+e8eLWnUNrT4+2V
	QV74KKIVMR3Q52obrwt9sH0ki7L8tY1BaW3QSaTajSoS2cyiaVvyfq0f0vfZ0p7v
	a8cDGafIuf0R8adE/SIVGsXCsekZjtsqF6NDZIXaSAQvDTZSol6akUleizrqiygz
	/s9hOCh0KK3XK5JPSOtgPDLorokOzoAJPpGXTas+iWLCsStNw696RjuuKjZYJQwR
	1XUjv2HwfaFjnAdwCDW4/Q+tfcr3Qf+XCLd9q1Kd0UEMqdLEpkLf2ZCwseIudj58
	IyeWk4a8UEOpdBRLEJZrbVJfSOFehwkM0evvmve6hT9edE3d6ziHv2ttIRKn6TEM
	Ae6WBg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhbeba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:39:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179d9cde17so12956076d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792053580; x=1792658380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=aWA8q8TGwylrcd5ZvO6S3XPyuTByEaNNVh5egur8DUVDRXqdEu8CgJTlgTxLaYtWoF
         ZjXJ2Wk9iPaWtwZuck8S9wdZUZKeK+ZgMLc46FkT7welv1kgUhH6HkllCnmPjQ3GWAr1
         9kCrebRYGkKn1IGCIk//6Jc1EDjxsvvUddrZsXGyHDX/9hkWbYeXEsMo02iVEXh3ZxD/
         vE/I04+JqAqJTLLr1S3USor7rzfnA18hUOMcyoLwQ0tvloyv2PW7P0/YPAwqxywakKuK
         jFouDIgZ9DO2k5+gB2ES9tUgT+N6jNgpfvcT6zSfYcfrYBx4PCSRyTV/fNJ9CrihTkP/
         NixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053580; x=1792658380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=PZ/MNVLgG0RPmT/vCpo011H0a9GlrXBZVkqEOrv372XEI8ZEwz0iVVuGzcvre/xsao
         fiZrrurVI43dgS+bSnenXayqEmLYK6PVyJyOl3czmN3dh91k8Ypn0qB3XGDS1LJkk+gM
         2cNCooG7Zp37pbiJx/vG3qqdr/8xI/DA/AX8W/dpA/NJD6K8l2joNMqGkM7MyGp5cFdd
         m0hB5belzLv6v39i+sm83WhyaHndIOsF5blL4o3l9L695LS6HEf4/dsit/aElWtLAHc3
         6E02hf80Dcjm1fnXi+Po8awvI+H7HcDSjxe6vFJoviwgAL9LC+WLz0/BcQPxIvo54ynx
         ZJQg==
X-Forwarded-Encrypted: i=1; AKwUvByt0EcAWaJdk2GIfJIREKvFn7QPxmDDOEEvbjWMyZhipLRPP5whF1YFMx6F6z/hby1sEDSjnspb5FjQ1S0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzFaVU76iUx2FQ3CF5W1cDBRQvzkq4msuRbsQbZwBlJ7tdA+5u
	UOmvUx9YUWtdlzNRlJ09aYa5GqU+5ig/sSFpmQpRPCpGmSo13+WW6BTvDODBKL48DOprSyBTynk
	XvA3Vuvu/YBE6JXSHB9gTf6hbQPyrk7g3/SDVpyt8zooERdDJ1XimS2TQz7gF/cG4FK0=
X-Gm-Gg: AYBFou1zeS6HxBsdq1VaktTMw2sDqcH0X1ImC7MCRcYaMZFX9T2r6P7JjsKLSnxlErb
	ZLZn6S3DfJJe/cvmfBOQgAbazeMx19W4Z6CzEQ0v3JdyK8EZ/c30RvUCK0oP8JfOtZTqX1+Lim0
	X5Vc/PrFJ2d67aMVUZgB3s94MH5PNrv3pSKERvWXMCrU98BSMn21cYeLPBHgH8f4WIlpq5X9I0i
	0uQiL6JjMChaqAmegO6sACSrMgxdPz7iMahedAM+6zHT8/6OuRlEH8ztjrLg8jladRcfQkRz+jp
	i3ixYKHprk94OHiUKEtXkCzXAT4tNmPDzwpc/mWNznFh0T/5x81Qx3IX+941bNujRC3zc8LYuQt
	5zIkbxknPfJHdFVfFgkAEt7E8HsRkiNKllopq8/uLuUxNasUp+/FP0rTigl2bW3OgYDVP1fId7t
	5FbFVHQnEVLeAL
X-Received: by 2002:a05:620a:8082:b0:93b:d7a2:dd2e with SMTP id af79cd13be357-93ebd28c77dmr2879346085a.62.1792053579526;
        Thu, 15 Oct 2026 01:39:39 -0700 (PDT)
X-Received: by 2002:a05:620a:8082:b0:93b:d7a2:dd2e with SMTP id af79cd13be357-93ebd28c77dmr2879344385a.62.1792053578957;
        Thu, 15 Oct 2026 01:39:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d702a5sm1175500e87.15.2026.10.15.01.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:39:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:39:10 +0300
Subject: [PATCH v4 3/5] dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sdm845-hdk-v4-3-b532b9f4029c@oss.qualcomm.com>
References: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
In-Reply-To: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JE+UE7YxD5k/Q4vJWHJoJXyEzJelSlS/4YLN
 XbzqSTj9eiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCRPgAKCRCLPIo+Aiko
 1eV1B/4hKCj9iu/cD3weh9fVlRyrjQnZHnHtqQAuqn3ZDqCC6Td7Z6Hs0cpl7CC1Ro47a9/slbI
 nvIh52QHz+UX2j7qKjXnOfPS+x1nD32l7y57jRphcO17lIWx48x3SzNhCbBxTvBBBETGoEe/dfE
 Iu3lXPoO08mDAC8lgM6PvEQUUXSL3TZEMnXkEVpI6+gp9mlmLHu/nwt7nKCHD1AwJHA4hr08Jsp
 DK2TeowQOA/zZXMfAH4BCnhStOupCr3A2Ps3J89Nqa3yqqdHw5DzSbot+TAr9AZ52JfIJAii0MT
 XnwgqGnah0p4rwDtovARkKmY1eHH684LpYDbMOVOXhBJ/wkg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Is8j7zjYSXcQVSoRWhU0OGqH5jHEXEZr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX4Q0mXIK8Rach
 x2/f8TsoofInEvmFE2C/cjA1hCDvIl2ta1R+bO8uTvg3+bz8ntHh90jrp1WBsytpAUydUFbJTH1
 GbhG0p/HPcR+FZ9DvLLqFSp9BkhiXn8=
X-Proofpoint-GUID: Is8j7zjYSXcQVSoRWhU0OGqH5jHEXEZr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX8PgK/NY6K2Hn
 HHk88t0qJBlsg2PWxD5glHJMYRqx5KqeFnKzmp/5ZLHRsdYGAUp6qdjlSP6Coc8uFojxc023gjy
 7dc/NqYDbcRj9c28kJ9hywvVUrZflIzakMIlc5yTtPF7odbL4uR2+UwjK9UMrnUMUraOGXVlE3i
 qTQ+rQ+a4UmNpPbPgVwFBMJjWxOUKEuqUB2Wx77i8bM5CbTeRQHe0oT5m2/DkVfXA3VvO1ZwtQn
 0nlq671bLPBoh2VkZYLDH5ot8GRoi1tmuq4mVXEu41jxDvFmOGIx8ipFoMmaGxxin5fI/6HWo0r
 dUZrPSQRoWGFarIhydzsGeD3aVpJLCoSfs9u4w45zfadEzcfdtmsHigsuY67D5W46hA1ldQ10C2
 qnt956bTLrpgovKnPP82HeMZgv93vZzuru/uKFGMSD4sAZcXJpgmNJG9gzT3Zr1O3vWHEeuQIvS
 dAQWwH7pt0z/LWSeDhA==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad0914c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=9nMZPvWkDyzw5AdY2PIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150034

Document the mobile HDK for the Qualcomm SDM845 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..dec58f8818df 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1003,6 +1003,7 @@ properties:
               - lg,judyp
               - oneplus,enchilada
               - oneplus,fajita
+              - qcom,sdm845-hdk
               - qcom,sdm845-mtp
               - shift,axolotl
               - samsung,starqltechn

-- 
2.47.3

