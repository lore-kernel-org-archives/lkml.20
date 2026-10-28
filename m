Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185723;
	b=qsbJ9Pxqs7Egt3IzYwexvp2+FA2Pvgp22r18eVDb78KDGUAPdv7oK/cAbhwrSi/W6dkL
	 mV9B5EZkkNytm7ilvaXm1JVttACcz0wOBmULT4YBhtfgEt6OUoEWRmtB/YVxif6FpK7ly
	 ZjZaLxTAKkl5LBNncz0xliugmumwPjTpcrj4cjLwTDoxwApx3tATnIxelq7IOxzrpLRNJ
	 SO2ooxi1QQtLCsIoB0fBPvYAxKtZlQdl5VGhaVwM8jSS5q2scwaY4BASnbSMA8gEB72rz
	 zY6a+Rl9Omd5Ob+nHrNG88no2gMf+QSdxDtCgnNv4z8Sx7Jg/bfsxltj8kcudJfp5lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185723;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=apv/d7It0m52vyv2iaiTrqLt1NFywEuHxYM+YrQheps=;
	b=IUw3UPqEeTQ14T1kuDCP8ePRj4ti/4mfjVZrotSn17I0Xjgh//Jqr2B9znIP1+kpesYv
	 H79gZ/i3eQ8k/VFDd/QV32y3cXKuvfjd5qTPlIlVDADMeyNitfjy/LKxU+edaVELek2mV
	 XP1/Sopj32gGmNoUKbs5mT0Mh+hLNdNs9bkhBrHBu165JpV5UYj2KAGKpz0LSlTdsvovL
	 3P+M68TOZ5EsSG6AQZLGC/48b+oOSusRAkAczpvNXdokFSmgePG0QVf9tiHAR6Anp8UqG
	 SaT3gQ2PQr1G0+KsGJlYvjuBdREuz63pkt16Td79kQQbF2LZ/RU53ydGN7k/0gDfpDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VTI+T6L4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y91F471c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41BE606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B41BE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VTI+T6L4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y91F471c
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K6IW1167788
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apv/d7It0m52vyv2iaiTrqLt1NFywEuHxYM+YrQheps=; b=VTI+T6L4Z9CiZiQF
	rw+rxOjjh/WXgmJqhzDU0iNumlGEaKCjHx8hm/nyMgBV/SbIPdc3rfDPZvzwZYrg
	LBGKwxV/EvH6oCffX5UeZxrjy/XkE15aNiaERvUelJSKGfxz8/0Yw5rajqh22Uu9
	YIltgvVvJe8k0mh3NuxOJ0RrsSFh08oJEc3YvsX7UOZ+hobzEKSaERniKcDOncyX
	mEfBafKgGtDqkxrFVFze/76pP6sJxzWOhVwLXUSMMTJORi/TlvUHIM/OhZPOdmbw
	YKEXQhGcdNWWCiKhHbWD7hroVXp7UXicw3mKUiTXsMpAQBItoNRQ2sPbDLH+47Yh
	F11rPQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7hvgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:08:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so723755b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793185720; x=1793790520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apv/d7It0m52vyv2iaiTrqLt1NFywEuHxYM+YrQheps=;
        b=Y91F471chSpQyRh02stbXtNnTIIhcmmVxr9bTrkiRJnOC+pXB70u/+Fj90KAuSUpxF
         RYnu+QDH73QB8Gyz0YLd/KfCcRohxgi+6KqBkjft/QAbQZ7X6r0Rq1ZvAAvAMIhJU6Rf
         iOGuECNhd9LrZhyKogzAVkmmk5r0T4tf35Z1GnxzXYBN9dsIe1tFP3BbMYKcdm8gfpR7
         BuNKGeZ3t3PTFwm+V5ZjaV2zvhFkPoHy7b7arNdV1OsZqW/rqsQQwgF1/R1QDcIlt3o+
         EX0+VJ7OtLCFSsGTwV8xumwjhogxVubBQorDS2ajJZGUCgdP2AquHlee2yUJP5LRoEqS
         AAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185720; x=1793790520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apv/d7It0m52vyv2iaiTrqLt1NFywEuHxYM+YrQheps=;
        b=yKFyJ+wiyocbPDhhQG8bYtWvZZKpi4bdf3hpt+qvBP3u/5L4ojW2klBks34QR5PhCy
         y1rKDmEJDxhbPZsQjnaLB1KPHFV05zZcpnmScftZu09Oxv8JnNkYoba+dOtJhi8+KIwi
         YO4Z8B2lP8hkZoolQJxReWwKDI1rTy+Laq0FozKmWUWhOQ6yfXPm2EEJw6qD9w/gB0Mk
         WeOpg4gEyWag25XSHe8Khjk4pEC39OE/VOLiezR3HMAMlwQ2ZZNXBvhuFh0lqYwFA89z
         itFs4EJTcYnKXOfaXmVJ5wa+1GeUNFW+/w57b73jM/HEQ6c6acIjd0Uy9JCW1liVnIVs
         boDA==
X-Forwarded-Encrypted: i=1; AKwUvBygqX3S8g7PzpM7Tjdc5lxQxAIaR3Cj2eUprm2XnqHFAuzJPmSobhMzwa4BQ/LwjQe0JJcJ+4xhWaeozy0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDdPTTnlKO3D+7Q3ceNHqjc7YAVSPBc/mf3R/TrK/3Burhb7BC
	w5lWn1inpyDbX+C3CPx01xXKvwwb2u2Rh22j1fMzDOKuVAb0jiY/yQmzhx4vgPQv619fT7J6tab
	FntDIpP2Tv9cMQot+nFpPHYtdvG4hMWb7TiH4N4IA8M0sihexuP3JVw3i5vTGXPFC0cQ=
X-Gm-Gg: AYBFou2Qwj5q5l9wmD4fvqZdCmZH+GoOKPQmsAIiwxAHJ0hcyJp4PR393beMiiLwKZh
	QsiBhs4Mx8WVgoG2o8Gkwo4WFZj1oViJsHE6BygmHzfdroXopPrkEU+cjPq9snAuLjnfbAwxylf
	c7rC9wS+u1SmLULpZMpZRWQ6apF74LJSCd9vCgU4dKMMFuaooc+hKtOgnxRqAGYwKNX+zp6+qgo
	WR7X/4424PWI6p91/nKGFhZkDGHTmfAEocoepGd+V58mqLByYmtilCjt22HKcV98gRqT66quAj5
	FeaSoA8PwPQarUQt2Hh1J4Fmx7dWl3kYys91tkGf3IyvtKd1yud4rvODYoxpehtlI6IG16LHkVz
	wmLkHfcUckdA/5qwvx9uRy7U91yKigmQdCxJ1X9f8q24L3h2LR7S5GXRyvaV6fueIKkYpAffcHL
	GZnT9uWO9Cx9xYfDXlbhR7//xjAuqHbU+ygG49iqhW3NvULgpWqGfi1sja26ygLyz857gmvXMYN
	vHJ
X-Received: by 2002:a05:6a21:46c4:b0:3e1:d43e:3675 with SMTP id adf61e73a8af0-3e9020e8011mr1722644637.2.1793185720585;
        Wed, 28 Oct 2026 04:08:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:46c4:b0:3e1:d43e:3675 with SMTP id adf61e73a8af0-3e9020e8011mr1722630637.2.1793185720153;
        Wed, 28 Oct 2026 04:08:40 -0700 (PDT)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662e3a4sm1000512b3a.28.2026.10.28.04.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 04:08:39 -0700 (PDT)
Message-ID: <7b2ff0ec-74c8-472c-9ea4-1195bbf04e1a@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:38:30 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/a8xx: Add Mahua GPU support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfXyKKfOOlNp37V
 DrK7ycGg61/f20P/w7ovtOKhJCkXQxzBpYemtwgmfr1GBdcHYPgzeh/bw7h91laGI8FQcHyNE1Y
 Rhy9GVtK7j3/NSJTRFpyyiOwnOdrnEg=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1d7b9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VMI7CB12i6EQ-IQ_HUsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: tp5B0veCM175oB-v_krsGLZhmpkGrH5m
X-Proofpoint-ORIG-GUID: tp5B0veCM175oB-v_krsGLZhmpkGrH5m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfX23/6Stshd/SD
 1Wcq/kCqwA2zkA+rmTnmIxN8HbZW9t0aee8+1Xyr8Rw55fNsjsHgG6f1vl1A7IByofF4B8wFIqo
 oGhsfPILxTkF1X9ZMqJr09VaNIoUhHfWtpFgIT8f25rNZYOddSyHxzkq6S0rhK/7c1Xc1bXqRCk
 LELDO/bbU/B4cKSTLgN5NtEoyh6KrEKg00g+8p+ZOs+CQV24VLtj9G6EhGKVxTpZOWYfX96m3KS
 DCeFRJnVP0sHws4Muig9Yg71Jlm4lVOo93LHWIQEpjTwpd0fWIjeB8E9wy3F3XNgptaynJ6ia1n
 q3R9K5m2Bx85b82qGmnwn/IuVkDMtwYtc4U6iPzMU3pXHv0soQs1kOOVsFkCGD5zrmS+200WgJv
 TayVV/S7HJS7E8YKZbPVd6CSJGg2VBpfvFENftkPYwIjSg9hF34ZVPrvim8mKIqQslLNlTbf1Wf
 EAseUq6ASVdf9er1dBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280044



On 9/25/2026 2:44 AM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Add support for Adreno X2-85 GPU present in Mahua SoC. This GPU is a
> smaller version of Glymur GPU with fewer slices and smaller internal
> memories, but shares the same register layout. Also, the GMU chipid is
> different when compared to Glymur's GPU. Add a new catalog entry to
> support this GPU.
> 
Tested on the Microsoft Surface Laptop 13.8" (8th Edition), GPU/GMU 
enabled in the board DTS on top of next-20261026.

Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com> #
Microsoft Surface Laptop 13.8" (8th Edition)


