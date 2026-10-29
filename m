Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309031;
	b=KdZrY+Va9SFr1A5FBiYQRYBPyvMnNSzHiMY2Of5xMG0pghdJ/ItE6XyhKBGsdgfDnAjZ
	 v7FDkGinmkIfFhIQqah8X4xDCKoGaOKl7aczFgSx/71gVRRWNh/W2dbh5lr+Bypr8Wxkl
	 bOsCAYMRf6nF97iGUf/K2kFXTiNv+WQ1fK/1PF2OhQb+0sIXeu27wN+wsVSRka+KTlAjt
	 8uc+E3NJgsds9r5EEX4G70hX207kbTj+z6zVE8y0ZEzO+HO1jayAyUTWyEjAiF8jic3pZ
	 15lVhq+selakWKkV8jUU2/F2oMW0dYBK82z4xcdIxRqBWDkNoIIS0AN50aPiVUBO5kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kvbi14Ro2Jet/rtwBr/WGcCUE+sLT8/ztxkoluFqXzQ=;
	b=Ok6ICbhzT7gGnOq+kl5IKN7m2Ash47kWloS1106G6nMsnbFUOqYkfs9Z/mWPeBfad6Pe
	 tmDUq/4sIMjl5nFVVa374PwG9CzkUqP9yWnD+u+8V5xZwJIXnRwl7utnrjv8xWAFqo9K5
	 F1kNR9cWIs0vZ0RLRXwIvcgj04p9ls/vay4BHUTj0xidbzN7gn9dUkRN1kROtlKMHm2Qe
	 vVMkgLTImyM0OeK3cX4T+81u0ngR9n3uwKsqWf6R7Wnb/qRtwe3q5+eF2x/K+/Ysn7l0n
	 LibMFHY42Ylf+G3J0mbUzUcLLyy8c+escPEYjEeImByeegmd9OJRlu++Fc+Fn1GrT9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="juhMW/ei";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OKvEKU+k;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17783606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17783606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juhMW/ei;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OKvEKU+k
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjkrv1122822
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Kvbi14Ro2Jet/rtwBr/WGcCUE+sLT8/ztxk
	oluFqXzQ=; b=juhMW/ei599lYu0rJJYdPUNl7t3bA3+SKsV6j+954pbIu9Kj8eo
	Ciq6ohXOGQyAPNBqf8lCxt/sacTHwRTKTNXkZNYYxoLNqGU2wXydcw5IfxE5okHQ
	i0TPywtx/1Xb68BcgkEK5yA2AI8qMzmx3aumAVh3Z4wkXXMP+rGEg/KRsidyTFft
	Fcf6UooKpooD7wFPR0cEkiJSd6y+Tpgk+1c4eIaCGIjQvtiHKrBTDCo90B6F+YqG
	UoolplzT5fO0tfB6L7v4GIwI+yMuu6X54xZvT22B6coCxhlq7x0INmtrxg9y9NB/
	gIQ54PYY1jalU8w/LKiZtcQlO0pu+2snuTA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm8k4k8e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so34413a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793309029; x=1793913829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kvbi14Ro2Jet/rtwBr/WGcCUE+sLT8/ztxkoluFqXzQ=;
        b=OKvEKU+k/ViPDOQALWh/LfSmiDbVUi5Cuqrk56QhvkLMoAd+gIYS2xpuZo/La8FfwU
         K+ClGYA0g16A3D12/9FKg6TJHAtsk3rMq3ZNXOeCbVjWQMx7qYhLrPnWIQsvyIcReSpW
         ptetSGkkBeAzJmgMHRWwvH6VUf5Blv7kgZqkHPSKVSZZpjIGx93Xqa+VQy62Sxi3c3zV
         FVy7dQg+zGIZIWIGnXYjgOpOE/HNvtDOQ3bCS1Arqs2TM2JOGnJ5Ncot9m+wY1pnprhC
         rjaxNP1tcZbneVn+Sv6fPN1pVflnqVtBVvJqb1pAXr1EcfGTuSwF96lBAI2x0AcIkp0s
         i2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309029; x=1793913829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kvbi14Ro2Jet/rtwBr/WGcCUE+sLT8/ztxkoluFqXzQ=;
        b=MwpNFSpKhetWeeDhPXwGpdiht8G0wxk23k6H6P95q1jws2ITCdvJMVMT779fpFhtLD
         tZHSXpITTHb1rozncWYTkBlwgTffyGCOyAD0Cl7av8/B4kCI2Qg0SGr5kxhiyrwgUrpC
         l2/0LW/fQYk+ZjuMbPIkEYhrVM7MOBO8g+dwbneCid6NAj9R4R+qwfgfp0b9onhs29VF
         rpZefgYSnVKtZIKRl33eNr3P5EnE8rI9qBkUQNN7dFLUntnW55oRqbtLhd8B1+YGyfQg
         Hpt2eiWzoGWR/CYrjOXtwQnmbUeHEVC1eERXmKkiLSJTrbZx5++W1dOD70AmQnWGFAko
         P8Ag==
X-Forwarded-Encrypted: i=1; AKwUvBy2LHuJ0ja8OBrUQ4n2wXzyr1sUNyV69d7rHL551DQVYLPoWQ4Xx4kl/o5RlCBryz7jTjEAFKhY6nIwQFc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQXzMpKBChgri5OUJTMD88ZnLMRo6dZYMOdzY6P3+itJjMu3Xh
	1uGsmUBpp4wXNVLWfRin+fwsPLTz7EWhIiCemO1LwKf9nTn8l6E63FjZuAJ2Aey+he7KhBdxUa6
	Y3j8Dlde+vYKSBmbAT8jKjcmUPDstAE9x9k82exSv/6BL6BAxvfe6G3TfZCAdwAE8XRv4O21IDj
	o=
X-Gm-Gg: AYBFou0lXqsSIA6MlVd99FCVPEflEI5o2AXllULNl0wpq3zyqQtn2V1Sy7TnwCDUm1y
	NusqBHkML8sGnsOg0U19ibPnB9+I51cqDazXywCg6GweMucSwNPNwZbsWQ9nJJUqmDr3YtPhHVP
	W4RVKvRzI6Svq1mib+95mb1gWi0Vks8jka5HEsFV3RlLaAWwaeN3ORqFUAZCuhgOvqCOdoBnpB+
	aDX1+nV42TcXTKUwongI2n4wUV2GCgh4VtYqkdw0SgOTS/fQixklzVbYBCeY6BbU1Uf7MjW2tp9
	Jca4vDHAK7fbXEjjZ0e3N8DsSSrmQhIiUhP6F3FXkgp0OxidlYi1LybK49R+acQl5HtIMJeBMKo
	XdlCqXOp3L5hxn3UWBJuQIu+Op2iU9exx/sNTOv8Pn++gUXAQHr6A45WUZW0922IdBmt2xn/+AU
	p+lW+F+wpHrtQ2GlFPKDaNZQ==
X-Received: by 2002:a17:90b:3d4e:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3ae8981e41fmr175458a91.37.1793309028753;
        Thu, 29 Oct 2026 14:23:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4e:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3ae8981e41fmr175434a91.37.1793309028255;
        Thu, 29 Oct 2026 14:23:48 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e99b267sm5559785a91.14.2026.10.29.14.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:23:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: iommu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list),
        Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH 0/2] iommu/qcom+msm: Use identity domain for display/GPU
Date: Thu, 29 Oct 2026 14:23:41 -0700
Message-ID: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfXyV4tii9GxOde
 nVJ8Zqz3jEi7FDkZKie/8QdD6wY7MdcPpxHLhjmg5hjqgyo66XruStFHlex0myFuaftjbiWCgoX
 ePMoSbrPfcOTgO3uA29L507AKFrW+Z6OKwNU9OoMVOYw43n5LaI/+S1FTzwr8pqFFIQuYeOM16Q
 BPBvOwFBuVfBxn1yoi/mcCcK6rY6b7YoHouCFRTjytqYGnMwMriw956XYRlXo1B0heIfzeAc0BG
 HXrDpY/s1eEgPLNf5UPpJBqoeIuVc3FrCZmn7PkWUFAqROfEcsACyPI331rPS+5Li8gvB/BnO08
 8m/kTDUEnfpUf5UxlmSvx0vh1Wu8wetjgIbGQuHYpxX3wHx1OSTIrX9q/+y0cthnLk/mAaN0HFY
 eg5HRM7cYyuncWOgRQ996P1ZpedGNiOuhLhkp59+NO9BNv60byWgcfQzEeZb/Db7g610FmaGZPW
 HrDz8Md04mxijgw8OwQ==
X-Authority-Analysis: v=2.4 cv=LuAHWXdc c=1 sm=1 tr=0 ts=6ae3b965 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=wtkIETcKxqgH55doulAA:9 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: v2e6KXrk84fB70SS9zyu7VUZf8ggo9oI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX5BpYnYu7rV4A
 dBoN6RoyxdqLA1PeOcXpp8S2MHlPv9DJw0Juya0A2ly7fOgN+WTVUxhOlwFxI1lJXUTxg3gViOd
 I7STy9uLDCYkADIKk5GEzv7Tibn9JU0=
X-Proofpoint-ORIG-GUID: v2e6KXrk84fB70SS9zyu7VUZf8ggo9oI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290084

Similar to what is already done in arm-smmu-qcom, match display and GPU
compatible strings to pick identity domain type for them.

So far, we have an "evil twin" domain kicking around after drm/msm
attaches it's own domain.  Until now, that has been relatively harmless.
But it becomes a problem with [1] when we start using sg_dma_len()/
sg_dma_address() for setting up mappings.  Which is required to avoid
problems with CONFIG_DMABUF_DEBUG (dma_buf_wrap_sg_table()).

The first patch is at least compile tested.. msm_iommu seems to be
armv7-only.

If there are devices with bootloader splash, we may also need some
work on qcom_iommu_identity_attach() and/or msm_iommu_identity_attach()
to put the context bank into bypass instead of disabling it?  Not sure,
but that is probably going to require someone with such hardware at
hand.

[1] https://patchwork.freedesktop.org/series/175619/

Rob Clark (2):
  iommu/qcom: Use identity domain for GPU and display
  iommu/msm: Use identity domain for GPU and display

 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 18 ++++++++++++++++++
 drivers/iommu/msm_iommu.c               | 16 ++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.56.0

