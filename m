Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B074AA3ED
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050048; cv=none; b=dABA5U/Lh49rSe295rOvnH8I7AOA5UUzRkUwQenoLdSf+rAIMSbcsK2yM+XhX2SvR8hIXn9Mhyo5yYcz4/POyO+DVVGi0cY8IhkoojZiHV25+/48GdQtYjgiSk4Dp/vQH8d0iaRvAk0CTeomsGXgvdS40u56osi0oAliEee5UJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050048; c=relaxed/simple;
	bh=pTPCAX8/CsBLoyOLjrC5Lj6V4R1as0wD8+LPwQqJmJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YMrCVr8boyby5czmYHlP6fwB5BsY44nd5IUKq2XIn1Zr1rfdy1kXlrVT1HqdfIVZPqour/Z6tK+OhjGCcA7CUDjJbkrpJAtUhBIYo9KCvzB1VxdnhQE8Y6ye39VEGJ/VqiHDzIvHY9iTzKfZWCcMXz/VqERLhbR0T5MivMHQZZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIdTD/9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XTkrt4qZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIdTD/9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XTkrt4qZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wbSC1889509
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vF+/3sIhapVNAvd6rUI9asvRG05C8hSNvhBnFb72r2M=; b=SIdTD/9Q1pJ7cRvT
	Ep5lZJ9TJoyJw65D5IM01kpMOplvmPeoPV+ixOSMXq6ROKKRAy6tpjON4a/BTQvh
	u2cnjPDWlEtH82VVQ1LHSmeYGj8yo8HJgZw5q5wSWMO1e/xNmmTbGQ/uZrG1Kqza
	VZFjusIq/Wzouc72g0bnJOApxNcMOJHRwQ83h0pdHv3Ud6MCjTupBxs164wMNfyp
	mg5aYtQmgOsfpmi2CY00Q+G8/hkvkaKqI/dT2VwNgEKup05JrbejAbp/LO61AJ6Q
	DtWAP9djkYOU6GyhQs5EIc8wT/KCK/85avZ7rzZEuSNAu1tuBH/DQ5YIo1a4KEKh
	O/ZLsQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda0snr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:40:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso1148078a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792050042; x=1792654842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vF+/3sIhapVNAvd6rUI9asvRG05C8hSNvhBnFb72r2M=;
        b=XTkrt4qZcjz31cz1tzekMINdfntGcVKf7v6bT06XUssGcjJS4JP5J49cGcLm+eTbyS
         6bOu92BzPy31u6je7N0MGhMDE5dCFVMFKmkQLZv8kkY/mmdnVyx3giOv/p0NR8fkLyHB
         vqxZmO9pNZXEQdj6sKHtnzJOC91w5ikHbuHm0Kg94S7gLi1nAvBTeukZQ/Dr7h2WNV8W
         ugFMJmPwL/t7yGnz14mduIdfujarhFGVYmP94EkABBU+X1+JFfPS4204UMAoSjPFXIjD
         VD0ddGpDIn2a09PPZc+iu7jxXVS3BMpRviJn73dKiMymgxJrrE9+PVshowBb8fx198on
         YVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050042; x=1792654842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vF+/3sIhapVNAvd6rUI9asvRG05C8hSNvhBnFb72r2M=;
        b=aaK7qTd36HcHEtlSomqKyO5kxwRfyHtQKsv2KI8uJuOwMuAjX6//ACv9FTBacRANU+
         6VQ8rCnQfXdGLQBFmmVaKAVrF9IbbU1EkYq2NUG/NeimO9bg9PJ7eOazxHy1JiCEeVLf
         d0bjL1W2HQcXCQjiXc9I8aGa3mRwzk6KYa+wZKzKU3Alf+DVDQKq29rfJe3Yz8jMaDSn
         Ym3Z15kwgpbTODeU9C5rYqNXNwZVWDR7BGrKGMSWHAoqraxkqQciUjZOraT2HTMigsfw
         2S1KO82OmHp3iShR38AnCvWP0MfbFZx55x/sEQusp/cPGUVCm9Fh14Y2Je0khxXv2l1K
         LG7A==
X-Forwarded-Encrypted: i=1; AKwUvByzlyqOHXE4hBGoNQyKvxB3gEEVW7rCtpJ57v4O2HK20I5kHPTkjnjk5ntk4QpMSMSx14ijhcumG0JgnNY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/Xl4Imxv3OZ7nos16XtwgMcuIQqauZwU/V6mwewHEsnSdUenv
	MzTObXpbO32jeN3XEmOHsHRaB8E1J0yhCOekknp0dEu7yITAuBb8hFW2GXzx8GVaySt+x54KIvA
	c/F+f5MmXAC1cYy3dKYVOFnpENDh7o8TMhmYXAcuJvfU75TdiG+ZLlQ/ktmDjQmPl4lY=
X-Gm-Gg: AYBFou3LkbS7MsSPUzM49tAYLVYNZeEm30XavVVpTFYeBzfn6K/3Yx+IUNxHXDrVPcH
	fPwU3t8SJBHgL2IcRMCSIMWSB1ADohjaXMb7VI8LDL5N2MDPdzCIGJsIIBJcT1ETGbwsH1P4ItD
	9iAml6nlFpz5wzgqJlKZy7jDRqeJ6ZAHZoANDeUa1JshwdY4ha4fg41J5H+WP1FAPfG21sh6iM+
	dEV9UC+LPCtJ4LTenF/4R98VGLYlB/VJIRLIlFhxCD2TVDAECPlSzZBirDox/sMD8cbPeBR3R9E
	eRmVkCcdaAVydpb+IWxb6bD63EID8376Qto7DDW5ngEJOqcbV4CGeAZoe28rqsXNajAP6A1iaai
	hAG8AokmdBa42RPmkQ/KAgguaFTe0MW4mBK0=
X-Received: by 2002:a17:90b:2d88:b0:3ab:e789:ce88 with SMTP id 98e67ed59e1d1-3abe789dfbbmr10015449a91.65.1792050041528;
        Thu, 15 Oct 2026 00:40:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2d88:b0:3ab:e789:ce88 with SMTP id 98e67ed59e1d1-3abe789dfbbmr10015411a91.65.1792050041033;
        Thu, 15 Oct 2026 00:40:41 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e944c23f17sm14014825ad.27.2026.10.15.00.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:40:40 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:08:31 +0530
Subject: [PATCH 11/13] drm/msm: Support KMS backends without a display IRQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-jshekhar-drm-msm-dcp-v1-v1-11-48aad0fe4f72@oss.qualcomm.com>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792049920; l=1124;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=pTPCAX8/CsBLoyOLjrC5Lj6V4R1as0wD8+LPwQqJmJ0=;
 b=bpN+2azNrend/0/v4WZOz4wDoLmEO8sJ90IY/xsoZK4QTV78nMaroxlzAY8V/oq+gXHAmu18l
 9Tt1n5goJYjCSa0YqzJqvqdZna5CUksVpN7ANJ0NieJo5BBw41WGD38
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfXzxWQlxrhDwON
 X0SrTHSBJPH/sn3Ff8XUsRVZIoEzV39h80UlNqX956h3KMFK/OW7tfQfMxcgDhAk2L7tTAmqeCN
 YBhgv6LWyKpXqfLyV2XzQxBBkofiqT0=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0837a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=g9RcmOnx5enkyd0xrYgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: gIPN76Uwlk9KgfyR8pWmNqEftYvGkScP
X-Proofpoint-ORIG-GUID: gIPN76Uwlk9KgfyR8pWmNqEftYvGkScP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfX1BWqJ6BeVNjb
 istoQfk+/53wqkhvC6TqyWnLaZR+WY2HrNEwA3SzGsDJ3AfOXp1bQqnGuITfMB583IbuptUSyRF
 5EhmT17mCUlR6+Sv9jece+3cTfyAzsfTQU2eYhzMYdX/o6W7YXSiqWvizc2hcSwRFIxTMjjYhgW
 p0SUMWftNF39BucFQ7u3cg+wEdPylVu7hrJ7xpn6rZqW/e8fwhhxYwBR4FgkpVX+z7rhRLr4TFQ
 +aXPHLyAy1eafGLBxzQhYJCIyQCTiFfkB9O4ksQPuSsPWCkvMkyzOSqGdhYOY44w9qDBYGz/449
 B1ckVktHH7tjM1O6O85V3VHxo1OstW/+67L4D41CqdeqssCjt/sF4wXbpmpEHH+J40lwnJ6l/Lb
 71UW3NmhejWRKhkDXLu4YezyQlUpcKArSWK7QuFVaEQaUM+rIJWsbej3Wr/t18Og46XFFAxN2bx
 0ugEjZYYFjOm2uGaqDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150030

Some MSM KMS backends receive display events through firmware or
another transport and therefore have no host-visible display interrupt.
Rejecting such a backend during common KMS initialization prevents
it from using the MSM DRM framework.

Allow KMS backends to use IRQ_NOTCONNECTED. DCP receives VSYNC and
frame-scan completion as asynchronous HFI events over VirtIO; its IPCC
interrupt is reserved for power-notify acknowledgments. Existing
IRQ-backed KMS implementations retain their current request and
teardown flow.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Assisted-by: LLM
---
 drivers/gpu/drm/msm/msm_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..1870a7008ead 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -72,7 +72,7 @@ static int msm_irq_install(struct drm_device *dev, unsigned int irq)
 	int ret;
 
 	if (irq == IRQ_NOTCONNECTED)
-		return -ENOTCONN;
+		return 0;
 
 	msm_irq_preinstall(dev);
 

-- 
2.43.0

