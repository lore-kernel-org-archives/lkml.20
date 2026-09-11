Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7849B43A7E7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122607; cv=none; b=R0RUHVMUPblK2DsQnW0S0yTU0hKYVlvKM0QjS5WnVM/539SPFRZE9575Y0p0ngb/VCuIXjtx1iO/4FlV/XgdQsWKMRHFoSN4mh4e2auR9URgPItPT8Q1DyVIFEJGtWLN/4L7gSy9nlFJ9wTZPg+49yOF2TbjAn7TD+1M1pw2ZD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122607; c=relaxed/simple;
	bh=pt+Rkw+jgQanPwhA/NuvAa5qnlnZ01yZY+rh1utI0Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k9wuU5z6m4HZc66IU++Dmoom+PW2WMVZL2s+r4zs37xvxU5q8dWSDR4mFaaBSgf6BzdAgx+aYOBT58dWRB/KoNzC5aiXWuSfcjvsJ6yiv08qqPVMrmcwEemnZcivURxhJI6PIwWcTxtVw/Ic1yeUZXRSTajK+aC+xF0O9rewBqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqEc/AEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEF8pdPP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqEc/AEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aEF8pdPP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kmG5423699
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfXCR8WLAG7aE7tsDiN6RRiR4IoTNhMtx0emBbiNuls=; b=VqEc/AEuTF7PpT3X
	olhkf2h9Bdq61NedwcggjM/bzc29Dqz8ssNS2ZdN1ZiCfLeSmWhxSzcXQdH4I3+o
	yzKEeScTa4eqLab3dXzV3JdHeElrraduNIQWSjE4Odv4OIFTL6Rcf9sVq7MQZwjQ
	GKAf5oooGSPR5hmf5/S7Jc/n5wLAICX+iB6rEnd1B3UonuOR6/UCMyMC/QhxPrtO
	x1I+5DxSKopjcWAvKpBbdir7T4WmIXWYl7f23ld7zJ8tBdeftMI1bMdL3VkNpe0B
	GiUZOF+//fEg2XroqxH30WeGrhan++NEkZTcIp9lGTyLO4orabT+NdHadu5cR2E8
	AGI/Hg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8h78y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:30:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so64631485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122605; x=1789727405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfXCR8WLAG7aE7tsDiN6RRiR4IoTNhMtx0emBbiNuls=;
        b=aEF8pdPPWC9Blthz5X+YC/3u9O0oLjUaPj/GmoTwiEnxcvbjjBF1p9K8lRA18B6yvO
         mX3V3zTtCT4Qc+nUUez2Qw7axdVmCA/IZYqouOEn68PY5brhBZy6vyKkyhEDbLB+ovWw
         QKQ3kE1j7lsWISLrbakcoD4qd6EMkpOw8NfVxCFRK5dUhZwHsaV9S4XQmarP7rs7jsXJ
         8s/EW4S42O1vSdLqMbQKogbFY0OK33Edqq3YwU4yrg99n3bPPTLF6qyugcKeBD4QPRp9
         cWHbNgGxVdzDci8/TjIJu4Al1RaanfqVoewHGRkMAPRUd3AhwmIYChOKvVlhbygCArtq
         SWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122605; x=1789727405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfXCR8WLAG7aE7tsDiN6RRiR4IoTNhMtx0emBbiNuls=;
        b=jXMvZjmC1W3KPRuzWGNQItko1Y/9AN5LGrn9bDUqSayGX5JfQ5LQ/7LGXXPYmuL2mu
         z60BP62vmEf/Q7SV0IQ0ZuSPn6bYLuim6CDRPyeKk5G4A87Qkq9B3hFo0o7zocxWIBNH
         9bOc+j/MP/8lLKfxuxfyIT7IKDW70OSQR0iUWWWtcRtfc1fjQgaEvd1CsYEFAjtY8Y3u
         oPZ2yf0Xm5xHWZQSnC/PqR9+IHffPCQlHv+lK/T4xAMaoFxbgEG7dK4q3oNli+UPWOoG
         bhGnMJaF0DY+3rKVPoyehDjAZH5RbyZ8hJK5FX/0KjFNhBIJwaGMOmtDDSe5rznywcI0
         Lw1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxIY6DwD4pMjsTxLGfN+Lw0WCLBqvyH2te/Eu5PELOsS1mCuzw49KB9f2nGOwXwt6TUbnKbK6RzyA1WoCM=@vger.kernel.org
X-Gm-Message-State: AFuF++lAdaqMgcf1tIIXnKjINU9EKk7AQAp8JCkqMh60gItPJ+/W0aTg
	FfmHNLhsWU2n9Dq5wUwUz/6q8l8Nhgs0t2dsM5NA9bu/BAed9l9BzmJJWL8Eqy5bbbDXJkz9JC1
	j/vDf8lmu0wh+02eHqQbgbYLulEd2/K0GSdKq7ToNYyU9B9Uh5OUtOg2MkdBJeXarAkI=
X-Gm-Gg: AYBFou0CyrAs35L4MCG3BRcMmN7AkYkpbJaTE5Px2xEMSHChjNcHYTCVpBpk3RKkt31
	bAV0p/zcx8sTfFvpN2IW8s1ZFLq2lORNEtNR5K92RxpRwus0j4IX5vw24nMGWgjqIL8cfZpajI7
	bKENCxtY0qc+dwcI2Fkx+MJzc2xxzDEAQ+nrsWbYSj8HVzWwiMFvOgY+BzMrZb1eQqZz5R+LHUq
	MDmCjzyEwa7KdMdHEA9CNiLib4jA57RrpH/BuCzynFkQ95OWKpUZOD8AhRdcTa1WU59Lb2eEyic
	RaWuLjVXO5U04/QRsZkGiz0xKjsbCQDwAnw2rEolJwCBjprSTyn9C0tpATPnJjmK+VWg9DOSFBK
	Ins9ar23fvwoGbkFJB1dt6QI=
X-Received: by 2002:a05:620a:710d:b0:939:5c30:fcb8 with SMTP id af79cd13be357-939ea0e6e28mr448633685a.6.1789122604424;
        Fri, 11 Sep 2026 03:30:04 -0700 (PDT)
X-Received: by 2002:a05:620a:710d:b0:939:5c30:fcb8 with SMTP id af79cd13be357-939ea0e6e28mr448595185a.6.1789122600092;
        Fri, 11 Sep 2026 03:30:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm38651965e9.1.2026.09.11.03.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:29:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:38 +0200
Subject: [PATCH v4 5/7] drm/msm: Properly handle msm_ioremap() without name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-5-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pt+Rkw+jgQanPwhA/NuvAa5qnlnZ01yZY+rh1utI0Qg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9gU0RExYusnudZ0OMSrcweBZUWjDZMb+M8pu
 xhoxU79/VWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPYFAAKCRDBN2bmhouD
 13VaEACFaCKDETdpPto0n8tND9AnmPJrBouZ3DiV5VMplFHEEzVYq79foQF2rjqKv263AU9zq+3
 JIWOx+5BF73BcsRrq5QIvQ7blWqANQTHgHriYqXprcy5baVa0he5oIynANoIZGXzLWLj54C08yK
 DpFvI7aOZpAchp0JCUbOtgLMdFHZI2j6EdqSJYa5xOKIvokL26l0WkT/lA8fQ4ZQPCcMUUhzxYT
 iMYAc8UDbse3YaQUCjHZS3SLsQcKQoYSgHE20MN7beFK5f55ru558QjCN/lWb9wluhSw6V7jgyk
 b5h+6TifujFZL3ipkLiEEBDx8Sncin3+oDzNqgKc+5t+WBWSAOIO7+/Y2pwulk3+PDd9y0MSjAW
 QR2gmN27rQ/a62pMIJEDJEH42LjUjGUESrCUWrhKWxhgvmrdZDpttf1Hdf+6PdXyA45f5jiMwJ2
 IC5/13KIi+FWip/HxEMPIurxCj7mKgKAdyqpVmgcuBk1nnvxa3I16OcBy8nMqA2r+LBFet0gfUq
 XPB77l7QlFmKPKqFiAB7H6Ik3As0cPkYgkf0tiRrNG4L6z7zbELYeppwyVslAZTimh1eOGeYF/8
 TbTVKCmSzSeT7WEHoe6FY3Qu+ITbN5AJCECIuR7C50IHN3ul+Sp2Bfg/rfOKUwUg9Kc3RMCiRk1
 Jw/7z7tye3JvP2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Her33pLx5qNVOLQPfrqEc9FDW26vYWkt
X-Proofpoint-ORIG-GUID: Her33pLx5qNVOLQPfrqEc9FDW26vYWkt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX8Pic2GvZvw5f
 TKTS2y7iCFQA4y/9n/aPHAHIktmmd7ydsYTjXkIO1qinyIfZvZ0lA8Lr3EcL2qIdcVKFe8FXa/j
 7diaC/v72CAIqfb1fzCL+SkYikon6cnPHVhSqlMuf13tu8CgNezuVq1q/ZfM3tCZBqOBHxoRUKc
 ZIONOcGSXKyo3aqpACu+BkHz/6gCF7RFMzT8piaQ3nZ1TtbEylY47CovxscIqbvaYj/hhjORW6O
 O5pe5R1U/LdeRX0n5bOi6tdoxdockB3/k1dV9tc3sC+ygH2tEsI3XbpENvRAVMRtH/d8isf0u0m
 RLWOCItKJeRqxUVtkQaleBfmVm9ZOSaUv3KJ9zjDw3nRojXONfM/cBapJcqpFjaxNWeWexvJ3Gr
 1k4WHy+885YY23q5+iAWcqvXHgUyGCBWae4eDJDbbeWrBLeHMrzGB7QKNnKLR/7i6p26d5sywwK
 +HwjQ0lUq7D2pAOzQ8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX+paEJK0yWTxs
 QrduV/I0Zt0xdghWTs7g3kULGQ+CPrNVyvTbJjZVh44AasZQxD2aUZuHJFnOY7ShxMCylfvVaJk
 HwXweRumhh+021WnAh9EI/NOsq45G94=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa3d82d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=or9nyMeYumr6D7LEzWYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110146

msm_ioremap() accepts being called without name of the region to map and
in such case maps by index 0.  However error paths still use the name in
error message.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index a6efe1eac271..99221b0d7e3f 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 
 	if (!res) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
+				      (name ?: "#0"));
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -86,7 +87,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 	ptr = devm_ioremap(&pdev->dev, res->start, size);
 	if (!ptr) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n",
+				      (name ?: "#0"));
 		return ERR_PTR(-ENOMEM);
 	}
 

-- 
2.53.0

