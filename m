Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367938;
	b=iChQzpm+fL3f3nuKvcdz/CXJI3hdT6A3zPLk4BvcFtqAJ33zoSkZgPXaP9G2uaM+XVpJ
	 xjVSDh3dMf8BAx9wegwBLv5nRSVVsRvxkh3vszxTyIeeM7CD/+RTOXR9bB/pRVwtnQCy1
	 dVcB8yBnKvDrm7Zk0lQsyA5HIvhEVxZgPqru0+hlsULp4yg6j5Z43Q/22OTyr2W2oGKaV
	 HJ7pPqY0d9j9Tg8x22qUDdVFgjzXyXHHeH4OV0K0wKRgIp+dX1kyrP9wuZu66hjqewLD7
	 jlw6p0MASWGbDa/a8AoLB9ZzJBnM5dS/XQi157JSP21yKBRflbVkwr7C+3BfWCUwTBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z7RefKSkci+uXJgzjfw4jQaFdMnrtYZxZse0l14l6vk=;
	b=bZxz33JstCBmUfa079E0/F1ihI/HtODEwgBT7GqA5uH1fUU7RHp+I/dhut/I7TKqYjny
	 Yt/ixP8HKKXtAB5X65PHeIoqbADWU8IXB7WU4nId+cv+ND4qaaGxQPzt/mvo1ZdtbeWHR
	 gMODP6UM8pHL8WpOrrGWZAHzNIJNTTwGF1vMHRBWG11VtphIuUx/+II/nMTvUkoBp1YoV
	 zdG3BML6NunyEDPjNr9m5qhqN9TwK2JYNoeWSjhhcUHaN3A0xwsit2puWD1RL9DrCXpRF
	 4qMckE38ONIc0oAaxB4bznaMLk0Dqggx7SNER0DGhW9USN6yvpb5uvpUqlr6oB0k40Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=maEvt2lI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDbQkm3j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF275606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF275606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=maEvt2lI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDbQkm3j
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGCn52541777
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7RefKSkci+uXJgzjfw4jQaFdMnrtYZxZse0l14l6vk=; b=maEvt2lI8k4WY84L
	2oduaH3eiBaN1PC8OirEJ8hnzMjqnOyAuNt+MLUTGW98VT5Z67r1tGFybH85QFO9
	ALwXULMC3HpNpDZ02BRx2IHct13LbBeq/C1526AP7zf1fX+cjmmziAOYZIHxuuwX
	ImJAG0dApv5lzacusWc5COfnRIzX4mh/pllhp87To4Qsib6jBHuTnPX/Kc2h1Wzn
	Lvm1azLIYh4tm3+oG8L5GaaZgT8yCDJvDw4nkAlJfI6PZbKflo+PkUuIH4v01QF5
	H0jp+1zXjSinDYbqQ/z/4Mnzv4jwN1ewQKZ5k8jRAdWvr/gBjUPR0ZBwOiqc/9Vt
	R3oVfA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk9np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:45:37 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c100f6f8ffso22034137.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793367933; x=1793972733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7RefKSkci+uXJgzjfw4jQaFdMnrtYZxZse0l14l6vk=;
        b=LDbQkm3jsyYymYWU8Z3kDiCmc6yYp2ZbT4MndaJX+vassacSsUAlM/O1s7mexxjUUv
         /N39WoyA5tiXTDhEnjGF0z5Xi1oPOb0ZWwjODPUiUz8JCEYjHrjMyYxWUwu42otO/9uk
         h20WPKdtnbAS/3AVhLGXKYroXX98D1L6F1VCJlIoUyGIPrgj/La0TvptPiTLaztcTyJl
         MBwxfcV7PBTWJKjUIBCg8OXoOr1kSy/e/BM6+okklatRQORrmdXbU6cFzFhBugMI6x4L
         3do0RzmOImDvZ5ZWObTP9LHUzx+dzB09BxYGfS9uieTYYtMyvm+3IRPoEDXlixZOTd+F
         aiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367933; x=1793972733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7RefKSkci+uXJgzjfw4jQaFdMnrtYZxZse0l14l6vk=;
        b=RlVDCfOfkNnGEn6hFjpocGVnFaAqJs6ctc05HtPLcntQXaC28gZBFzsbmdOP9Te8RU
         zVaOY9mTSJk6vIsBaUOHOZdFJDr2q002qkEhgBVeJABt9nUCaS/pZx3uDdnzTCV0udHW
         Ak83mXSjs9nMMR88uTjKOYuHeE97pYCQA82HaMxopYqOo5slyVtNr8qvXOmltAQvvuPS
         UjmgFR9tAK86wvcZzkZU6UtnL130GuhRSdwvyU0lYBekRta5pTPKEeKHgSoZNHcJdbye
         NBuyLiX+ug3ay7qxUR3KAW7uPdUkgAYx9IGAkr8Dz2VMm8frc+YSxCaRGCOjuMvc39aY
         tA4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwkQ2hnhuk5UzT3VkoOjd2RXHvVVdWtGxzoinnZpyyMKcUuDkI4+KBh8e+/UBm7mJrXJXA/H82+195wRkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1jImNUh4QfJ5qB69HngrpRSxqdLaHBMdF/zPN893sLW+McyJP
	1l21ppvYEn8wfCcqgQ+gSs+SVZW8zL/bu2TDm5eP3fsAk1OeW/zxNdq/wJ3wDs0KrxNAXe5e/Bm
	+GtJKUco4D9Wfn0ZIoXhsLp2v/ecbHo5FsKofzkdF6BGwIjetXGN1SG5eCoavzUQ7Djo=
X-Gm-Gg: AYBFou15TPjm9Axrv+CVx8q7qWCE+O5bNn351uDrpQgn6G8UaaR5QTBdTAWTKxwKwqI
	BorusP8HrDOJ6dOXOMiGauJMK44dgHeVliJ1jPkx2GEu3mrr70twEdb09FGpYT5D9eknZF6uzo/
	XIyp3B3PVLlIhmTOK0VzrMK0J2jIML0AQEeyS+zw5DjjQMBR9o1m1MqB/wnsR7BJxhERj9JzL44
	VwyGRoOQERDItsNp9xICwPKv7kn9FIf3wJGBt5IY+U2INL4uk90QoPW3UjZxMB9+ieOqMnegF0L
	EKswPj0oFQSwAto+58IDoIFPxXvcq6kQBphh/We7ZzZVIbRKDkyRnnoK859cstsOqWcPRGe3pPh
	b0bT/pWsZ/Kaki2l/8nFnLA0/JCZakQ32PwT5kySZlKH1IXWT34CttIaGFX5bDuQ+4KoTCYo4
X-Received: by 2002:a05:6102:3570:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7d072756011mr1169893137.1.1793367932850;
        Fri, 30 Oct 2026 06:45:32 -0700 (PDT)
X-Received: by 2002:a05:6102:3570:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7d072756011mr1169877137.1.1793367932304;
        Fri, 30 Oct 2026 06:45:32 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4a9a1sm66267166b.58.2026.10.30.06.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:45:31 -0700 (PDT)
Message-ID: <842cc3c7-996e-4628-b5ec-736eeaab2e3b@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:45:28 +0100
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
Subject: Re: [PATCH v3 08/16] drm/msm/adreno: Fix PROTECT span length
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
 <20261029201730.151754-9-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029201730.151754-9-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXzLVVDtm7l08X
 j/EE/75XXLm5Sm91MaIMY7yOc6+20Rpl73oZnkrmhmjts/MPCwgB3oCgL2eFgYO4xfpZ46ncmTL
 t5fm1ZqfFSj/yZN++3kSsbBm59GOU8C6DUKx4UCYz9m3CBzJAUmfpNDGqOsMm2Kj+HvVHNcB2Vg
 DwiPgvPXGEs4RDwD87UGPwQbvDEpLhxVVNXcIK0o1eSY09FCP8T5UKV/5cyd3HGma040YmsC6gw
 +j98BE7w2KnVZUJRRu2YPTPuxvwt1/C/VHMpwEncT5NivCSn83XQRGeEZNecB0JrX6D53lj2SCI
 px/ld70EAfBapmY0Bizy0MiRSJwjrvuG3uHQOVL668eoMRphdDngyyWFq1yHjVrPgxhZxD8kwjl
 NtuXPpgNjhKauLzKGQPMU5EK/Ac8Rm3yc/rq73qRONnXoF8z9ho97DGwIGMTh+aYbWT3BCdNIJT
 F+cDC3MiioCeqh9EbsA==
X-Proofpoint-GUID: m6C0QCbqfrxy8aD1Flfml2gHnvQkxu6e
X-Proofpoint-ORIG-GUID: m6C0QCbqfrxy8aD1Flfml2gHnvQkxu6e
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae49f81 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5KacoALlGbuERgKT6uUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX9DAtiz3FIXBR
 7xN3BqQ0cXKKXTqJKVIhGvgNbZFpDxD5Ij7WfEnBfbZgJZgp93Aie+9mGl7mwy102rvahSsL6du
 e7fK80ZBb3ERYCV5MBlQ4A+yJxGnTKQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On 10/29/26 9:16 PM, Rob Clark wrote:
> Don't let the length bleed into b31.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
