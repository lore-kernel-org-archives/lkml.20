Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185824;
	b=iyCk9ORsjas/MdHnsjT+nA0w9G/5RKkiKJk/MqYvB4tIlFAhlcCIo26M4XHQKL42q05b
	 mqisfD0Y4y+E0CcCw5ImNW2E26UpcvJ3m9RM1mpWBCe8K1MSAMeagAONLRtMtt03puwOk
	 B49anln4EYl5wZnn0obMBhFDHJNyl4jHIlbu1px7cCCJmMt3N67ifwixLj8ML8b4KIF/r
	 vGg0swKVnnHyQey/9a4IuHGeZ/zjBRbUWtrjqunLvj4TXMRMBUixYjE5Q0QMTFbvJ5kR7
	 V9WCBB2n6EIgv6nMcuXvr5OoAD/uYi2i9+FcSkyGJ8gH5g4NHahUHrfH98rpacCERYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185824;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5zvZtmIGa6NExyZc8Y5XlEQJuWyGr6+9vTxKDmPXbhw=;
	b=naGZaExC2hZJZNNlIkHxAhQCbFPs/aVPYJTFbCfaD/MQ58rugCNTRSYcAITvJ30hOVSW
	 3bz9leNUxocgZLgS7+J1N0t8vV/PGYxHZNTUnWvJsnYE7aw1t26sGBIhwEMJipwWiU6Eo
	 vQTtfQAZlKj8BVUCQ2kAbmZ3KdTGaezYn2OQDNGxvqcPnTrHqQUW/9PR/eAwYKEFWNsO7
	 v/c+VZPTwhJ/bDbuLY3rw0iwRkZdL5GqHkZnYycAVUfs8eHUHa8HI3Q1LUjis7M3oug7G
	 tmLygarbK2b9Jg5WblMjjsFB4PPrBdAIgjEq14NuLhIXpEe90QhTgMBmsZ1OHMD4FnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B0W7TcKH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZY4+pEw4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFC9606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FFC9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B0W7TcKH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZY4+pEw4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K4XQ557251
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zvZtmIGa6NExyZc8Y5XlEQJuWyGr6+9vTxKDmPXbhw=; b=B0W7TcKHoZmbnhJe
	xQfsL+9qVBpPiG60ubo+Uosw2UOGOOoKXBeZh5hH3inv0s58sOmmqNHyUlXMIt9W
	pLfkXADu7oN2VeCVl46ylXB2aUra8H2RKSnyMkun8mLBQpDjF+Bd2wXqK+Ww6ID7
	TKS1LaQyocGLdUFvvdfEamGdbGvBoGIjAUF3Ej5RdSTzN8hqOb5hQL8/oO+y4yq+
	y1X5jw/q7d+1ZoU7CuXD9GHq6vZCr5TGXUkk08beAEvFgNkYw1PWbVk3MzwrQ7A5
	bX5aOJqZpi/Lcx04rzwVTIQz3GxW2hemDD1TucrOve+NhzLToh09eNK0337bMRES
	I5M4BA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tsru1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:10:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e94f72fb9fso7889915ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793185821; x=1793790621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5zvZtmIGa6NExyZc8Y5XlEQJuWyGr6+9vTxKDmPXbhw=;
        b=ZY4+pEw4xzKAWRqaz6YQc/58Jhb5Oujb+SQ0HOxom6x8U48lpwMndD66APvMfBr1Dz
         k7tiOWPttHtfrtfMZ1XfDMwubxPy1blxjcN9G2t7hSCJXyKF9VjriPUJvdVXXf4ICWR3
         +zG9O682HLlIGWRDh4x2z7WEE9eDTvlF/QfU7SCUrQ0N6vpyq/zoqPzAfEx4oHcX5LvA
         Cm9bGwRbvTPB7BHX39nU0waqT32bsYmMSCpiD4iYr6m8g7IOGVQnf9s8lsXV72YuL4+U
         SRcnJUPgrGu7U0ad+5m1x3lyOUqMR+Jo9T6JA9nqE7a7+BWTk4PLmdaBPzNpOMh0/yGR
         4PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185821; x=1793790621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zvZtmIGa6NExyZc8Y5XlEQJuWyGr6+9vTxKDmPXbhw=;
        b=mw5eYSlFwpd6YDahG8Gk6YwNEW1GyoRKvt35CJ6T1/C7qsCMERqjzbTF28tQokeQgB
         s9uDW6bljcW5cI758Bks6a8y3j4iRhXGbbWiZrUVgfbYMf53sWEK9ySgKAyoCnPcgi/f
         K/NRsTDGWLrqo+DxcME5L5Jh486XBCZhJYdpvLqQN3Gv2viq1NiiSaJPYvMPJ0kd+Lty
         DnLRKLfH/W3dxMxt93mRoxPLoyPt7lG/7qQOGQ08r93oCQhGlHIce+yfwvAiyx5nA8qZ
         3E10pHAYyZdTEmd3thOhJ+KioyaCYNi1QnDm1oKqB0KVgYwVuMrCMlUnXKfrOyFMCNtN
         jVww==
X-Forwarded-Encrypted: i=1; AKwUvBzbodEi/B7LOaQ/uEJUloV5jmQBliEb7PjlLZkdcw3xYBVABuMdLs6xqPCKU5/e4yxC7MVDsO32awKZZj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYITZgulS8PTzx2oJXSrTACRp0iNKgvIg+IHOq5eqIyPOZJpGYLW
	rAfHLinaQ74HzUw3N7AoC/rbAhSeNmWoJ1+/1Ib2py/Xj/wuduNZohNVBNUOSOYbSKTT/I6DPqg
	uFd+Xv1SKR6qOqXQg842PkCmLRU9G4Y5ItAUhombHhXk4gLzWIKZDSPBzPpk3Aj1ZTRE=
X-Gm-Gg: AYBFou3S9K04hFUxCJAeHb2/ksGZlEOSUiBun29QapWJXyE5HilSmG2F1I1E0xkIgRv
	TTTPNPWKt4MSfg+fnBocun3RNaQCS2W1ybsJhPnd+KDcy3ZwNm3AMHz0+MW5EKDCF5Kr1iytGXD
	ry51vu6BjF91Zog9eRIodPPRSstrNGNj8Bfkr8KFCxlV0MLPq4uSJ+8gwzc5kjcxj1nFuPdkKf8
	AscivMVgJlqPbFNGDHDmtVt3H3MfhYbafjAw2GpBkZab00lunxpgLzuGflPhhjVSsBME1bVAJJj
	ivPFlnPKiAocisx0YbfnrU5r6dhhF2QFS1OmuJb1tEQ7/y6t3erbxRBqF3xlbAeBY7aVSOif5PO
	tWTeMWyZSfdjNNQ9GiLjp2E+pyomkaPVXAdoJOSe5WTZAU5154CbLil/p9jwb+H1BnYctZj3T26
	sRYD6dFrb5z9nCLuCkgrsx1vkfDuawWYRdE2lHTyRxkgMqpTmvAbGIdJZrR61dVad+p4nKEVHj1
	AlM
X-Received: by 2002:a17:902:d50c:b0:2e8:3d48:4d88 with SMTP id d9443c01a7336-2eb00242781mr19066245ad.7.1793185821162;
        Wed, 28 Oct 2026 04:10:21 -0700 (PDT)
X-Received: by 2002:a17:902:d50c:b0:2e8:3d48:4d88 with SMTP id d9443c01a7336-2eb00242781mr19066015ad.7.1793185820636;
        Wed, 28 Oct 2026 04:10:20 -0700 (PDT)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eaf77e70d5sm13979695ad.75.2026.10.28.04.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 04:10:20 -0700 (PDT)
Message-ID: <4a51422e-01f8-4651-99b6-f7d3fcc588d1@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:40:11 +0530
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: mahua: Support GPU and GMU
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
 <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KKZxbECV4fEQSX2_5Xet6vMhH1lw0WVF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfX8e2fdy1Mu3n/
 cPoVSprWF+4Qa8MgNl5vnMJUTrZlP1v1CPDqBx2PgYF3PiIO5mHp1TCFGcuvFOceWh6RbrIVY76
 nd0Ij2UMkI2rFWNDiJwIsG388Z9xiLg=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1d81e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VMI7CB12i6EQ-IQ_HUsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: KKZxbECV4fEQSX2_5Xet6vMhH1lw0WVF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfX1DmGqeHXiwUF
 57dGrs2ImaTQeMu30H7hkoVJuCxsQvNr3BmzDpwOiValickMSNWNDyoZSBE5hvi69jPcyWYj8GO
 zed9ILotMOV9QLARbESE4Q6fIdsnmxC8I68sEBt57B27NM25GIRvr11mmxhnZ2RlKsmmB9DojXi
 JqtPW7vXOXHJKHLYG7br/fGGvr+AzAxRkLQ+QCst+jeMSm4RmuEvbcPcKI+x7HCTxIq0RQeqaPX
 1nCFIx6iPgtIn47dAcK2DJ1Kdq81vTXP5oTqCqisUns7v3x/uvYbXKPJy4W+qVhmpyIlUP73466
 URYVeVv+qiw0rTpRUtUC7/GduI18+ZCfLOofIbqN7mksX4UymLAI0we0jTgFbh+ONnmAVYKPF4c
 ZVbQGqn8GBWF6i8cfkdf8UnUz0eRJhfZh7kDIT7XnUaxIHePnifegqokgiNq4ymrgJWybkvtEUC
 02Iy8ybfBj04Lga04+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280044



On 9/25/2026 2:44 AM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Mahua SoC has a new GPU called Adreno X2-85, a slightly smaller variant
> of the Adreno X2-90 found on glymur. Override the compatible strings to
> correctly support it's GPU and GMU.
> 
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com> # 
Microsoft Surface Laptop 13.8" (8th Edition)

Thanks,
Gopikrishna
