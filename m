Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD624489866
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549244; cv=none; b=pGlIwJu4OV1YmqIi4ON3zXpSH/VOuMk3ejNHI7wNcM59eXfcfUnPEBonbXl7HJuRFxSZrU5DkxNg0VAKmZC/zLPiV5It2BM9fhC928al8EJqfH6jkbvZoROTlN6xEvIdlVC5vgZjsqBtbeHtl6oeROdWrywY8PXfT77VZ7NM1vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549244; c=relaxed/simple;
	bh=qAinQBcS6NBAQ1Hv5hrmTKEuW3KpxxYsPgPOIKnm7tQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2uzO+ONUYNg/3Kt9UghmgPdO1hPlh/bACfLefuJagLCgL4sEDCi/yIIELuZA9Ozea+iKijDlF1643n4ZEHzN0GiBNuLoumtH/63iepc+0cO0O6ap3P9eFx2d13DCjp7pfj6BmyEIxFjKGMKCQe/z3w4Ym7ATov32C66LKEgNEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQ8x2u+a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SVsdMJuD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQ8x2u+a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SVsdMJuD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G69d9x1163416
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKPxqCC//VLDTZK4vYMRYmGXxh7RB8wKzEYO7LbabDY=; b=iQ8x2u+az3cDfEtv
	/HOIuKZVlwWFVRhnnmwyWZFKdlKJC0QcATyLln/38+iUAfbiEdPHne+LjLYPDi3R
	5kC1SFAvDic9LvVxs8LH9bIgRvFcHzdx6H8kyVDkghGbBHvAcTm1Cvg5LN9TEKIu
	uSJZBsJSnj42cM+n6Z+9Qr64vTi10BbWm1eKxtj10R5jUL4Tlq7ZDqCuEXsIOthj
	o1ig2cEDNd863fZsmWtoNxoGazrISVzLllgNxMQ0X60qBcK1Gl6uILFf594PwhRk
	axlzvl1y4FkKPwAt6Z7Yg5hNea0RTfHoI/u9FrZ+3nxdWAf6qi3nyQu/9UVgex5V
	zrQ3Vg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n63rqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:00:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so4295394a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549239; x=1790154039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKPxqCC//VLDTZK4vYMRYmGXxh7RB8wKzEYO7LbabDY=;
        b=SVsdMJuD8PYJQXEIaWiYhSLTlm3zg+3exQiIYSWgwecEGH0EamoghiKypGQyy7yylF
         7gfYrD+nXdTcT0bdiWyFvPXj0Tes1D01uxufhtFmkbN+eCVUYNiodE67YzFlxi04sErh
         MBhpu9QTxkXc+KMU3cprN0uPuLeq5P4hyuRL8o3rOszV7og9z2Dq+NFi6mjbsJbymbXs
         1qva+/g64k98EQUziDRgXAu6thTYPVOmBFRFmBcR/3V6MmBvvDI/jCsVSJIf4kNyImhN
         c51b1wYj3jDJ874BOSVigW5ml9In0ZyXkFHZRnNmhOF70vRkdIxilQ6t9/7jzElgYsjp
         qyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549239; x=1790154039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKPxqCC//VLDTZK4vYMRYmGXxh7RB8wKzEYO7LbabDY=;
        b=g3nA3B6HO/PmAVQlRfTYDQOKWvODKgKCRgpJZkhSagxEEzqKJrmZTZsmUF/jCb6jbW
         WC3dz/6zWc2mTXVP2mfkpnegn++CTtOoDBWRMgLGOs3v3txszgiE9u60rvT3JvfY4qC4
         gIrhKNKZ/MJ8lIc5MRSQ86/tzjJ8GJD2UiO1AFjAJzQ8yvmw8iH/lf7xvvnWp8U/GTpm
         UqJLUMrG1mZDOTWPnc8u2G5us9J6In5sQ/T50hrQ/JTGKuRpTg+ucXbkoPcw46ewL2jO
         elNgSFmx+Gf7N3i55oSRG93IO+gQ0eJZzmf8FAal4jyn5n4uTw6rbs0jgSennt6XHDj9
         CA5g==
X-Forwarded-Encrypted: i=1; AKwUvByCXXFk7ofj1nMMtbbPFZs+p+MIBZs/1hFfdveh2EaM9r/fMjaMPiFk0L3sA2fsu73IPl7wPK8aBx79lPs=@vger.kernel.org
X-Gm-Message-State: AFuF++kqAnNlRCbCI5NlmEXqKxSn+5sCq+X9WNPTV2el9x/mYVcHoA5K
	y6YSW9a2ykKu+iC2+bg99Iw5E4PcQ+bWgENnCuYC3IKaP0LRFq04NxSL6DHKH6rvH1NPlZd8vlF
	V1VZiVw/ztSIt/csyblPc9izBDDnTG0QBMjdsvgvoPA668zkJESwMgq7eCjGOTSJls9w=
X-Gm-Gg: AYBFou0+jEkyK8ggyW4Grxg7IEiKFFcb1uHG5fxjP6ARm7P1o02Lvp/cIrl2X4ZyXj3
	DCuHics/bLLL3SDac1pMMmb/AXXZTtA64tEotCeD7qaDYGI4629P9ORKQ/Yzszh4PQJ7JX7PWPI
	82bqIdf6ZcL2MyhdSqKwnlLJwR+2qtLRckyWVUY/tWpMJe/Omk8vv1xOSvgizQeQSCRlb2q1Y/v
	ycdUMDU6EeCzA/xZuyGfrWUceIinLqJM1O+DRxnCCTqwMOCH67Xo+1kEZ1AnM+mm1N7nu0cgWP4
	r5Jj427GkW5nEJj7yAUzkITDRTyZnGFqFqClQBbT2+soldZKjzXr618MW+7SKnT/h4h9zbiez3z
	kgGr7I5t5x03JumCJfB3pzs1rNRrNsI31lhQXF2QOPPgbXJMUsWMlgXp1SXe0mYB9CpBEX2vC/l
	PHhhdZ6C8HQd/FJe9sDA==
X-Received: by 2002:a05:6a00:1bcc:b0:871:aee:8b92 with SMTP id d2e1a72fcca58-87238e87fffmr3531420b3a.15.1789549239408;
        Wed, 16 Sep 2026 02:00:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:1bcc:b0:871:aee:8b92 with SMTP id d2e1a72fcca58-87238e87fffmr3530914b3a.15.1789549235970;
        Wed, 16 Sep 2026 02:00:35 -0700 (PDT)
Received: from [10.149.106.38] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-872024e4369sm903692b3a.58.2026.09.16.02.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:00:35 -0700 (PDT)
Message-ID: <2ab936e7-6c73-4d55-9b92-e01baa80a82c@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:30:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix default entries for Glymur EVACC and GPUCC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa5ab8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=V4wNLzlG9kf4F8Mex7kA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX5J27ONFykSHt
 Z4Itk0QuyPrE5k+yqRuHQ47Ul44ynQMkuHAHdqIRwFVLoazI2dC1uQWtvGyp0/+VW3UW8y4I+vw
 jXtxoBRVyf7rYywWsw69btuw6PSpZe4ZY0yAg12r7CHTKyhgYFWHE2iaDzbn1Awly4Zjq9toKpN
 0VGwGqYr/CVOGBn4OWQ2HHOCl5CCe8UqlDPPIQrN9cRHortWFX0xeczVspoWFkXIfqpTrnCI4oE
 dgHen52ISYljq6+4lri5f0TfnOqCWypnsvEHWh/sqS4IOIvjigN/FN4dacZKEwyxRTBVVHLxlWS
 9rAj4ppwFhBAsNMP/KD8LAW2kfL1SuXH6UazD+BBp0raDcOdHrw6RpzMK4IMtjerkJDGqzghw4N
 Cusx1QUo7Zy4SNSqEqj5XBmo1546v9jQ+5BIPZ/OVm5ZFUQWZEgF4P1oVSf2F+fCa0PKgaS6w8A
 D01NvBvFDzMoqHkk5OQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX3DL3BCBsOy8D
 t1rLsx3IHpwTVkantu7ZAqzPMJqoIRxLd2BVdrAkd77vy9zD85qS54+aEd3Mgw8sjqDOF90HldK
 WaKoLxaffCk2ZkuUEIUoSjJ7vwNa/Go=
X-Proofpoint-GUID: rO2Kwd2NY5VtdZzJedLDnonOcVP9I_R7
X-Proofpoint-ORIG-GUID: rO2Kwd2NY5VtdZzJedLDnonOcVP9I_R7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160116

On 9/15/2026 12:28 PM, Taniya Das wrote:
> The EVA clock controller (CLK_GLYMUR_EVACC) config carried a duplicate
> 'default m if ARCH_QCOM' line, one of them misplaced before the 'select'
> statement, while the graphics clock controller (CLK_GLYMUR_GPUCC) config
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> Drop the duplicate on EVACC and add the missing default on GPUCC so both
> Qualcomm Glymur clock controllers follow the same
> depends on / select / default / help ordering used by the other entries.
> 
> Fixes: e291ec812dec ("clk: qcom: Add EVA clock controller driver for Glymur SoC")
> Fixes: 67e645285dd0 ("clk: qcom: Add support for GPUCC and GXCLK for Glymur")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

> Fix Kconfig ordering/consistency issues for the Qualcomm Glymur clock
> controllers: the EVA clock controller (CLK_GLYMUR_EVACC) carried a
> duplicate 'default m if ARCH_QCOM' line, one of them misplaced before the
> 'select' statement, and the graphics clock controller (CLK_GLYMUR_GPUCC)
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> With this change both entries follow the same
> depends on / select / default / help ordering used by the other Glymur
> clock controller Kconfig entries.

[...]

