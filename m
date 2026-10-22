Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656242;
	b=cxTgzMnLxmVJmMV3RFVWnojZruiNv56jPoBxwFib3IYlMR+TvnUQY3ovYst3I7po56QI
	 Pf4UxocXynnc1RmPokNMnnKoJ428u+ivE3scUNZCQr6gbf/CRph4A948C92rMQCc8d1aW
	 9z70XjJHkVsOrfDY3nM8gZd8d7b4dYS2JWAJL75WQc1nwPK0DrjsB66+eXPnBarG+quDD
	 O+wrUZ6fJIVxLK4gUlNpTzxFdYfV4kgAtzDT4QLfGuY0CxoikOKHDxH+a6pvb1Luy9XQ+
	 FCTA2JauNxWvbxg7BVk0RXm8kJT+iZr1drfVN3e8Lstew+n016IXrzTaARxtwkkFYcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=exPzNu3p9/IZE77xM5zZ2CBcVgSGazYkvGmm0/QzwBA=;
	b=5D/D4O7FhTy9m6EYc6tPrwh6kiVMDsAXcDrZmZVybD3+swO9+1Qya8tQWpToNtf0tbkB
	 CT1qs0CLie3aNTVi5sRitp4IbMe4vCuyZoQtU79jy6eVfGQXgz9qkixQBUdVm7V98rOL1
	 MH5/27VXruypLjKgA5JvPzdEZJ8KuaD0Fw16xooDVHha6X0V5WeiS71k9sGDVKdKz+Rm4
	 kgxFI6u03bbTHhIT/mpEtcH/qekmx2Q1g0EbmMXwpZnviPi3M/Nqy7EuOlAAyfFPK7WYJ
	 VRqoESgcbiDuVJMCpGeJ1WokuZiwuxQRS6JJiiHkl82mI00ETUTaJOkTEu+qd3NQcNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3BtI7f2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLAYpwo4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2CB606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C2CB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3BtI7f2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLAYpwo4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M709vi1996036
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exPzNu3p9/IZE77xM5zZ2CBcVgSGazYkvGmm0/QzwBA=; b=a3BtI7f2KXL74Buu
	aS5SOqqimHaSDYMMRfgtO+xlDpAMllSVmpaNRr++jcXpW1LIvgq/cEAcGy9SDw/7
	pP9oSg4VcnrbQmzE044o0rPWtB1tKSt3yPzRLeqFEhA7N+iVsqkxLqPkHLQfyMn/
	K2Ek9uGDL42k+2mM0za33L+j7kXHnH08/20PnCyEqa0Ba6ITWC9GqpvF7N6W5Ma9
	8J3Yn+I4J4VxcosI+1XvBVH/YFJWvC2MGzx44rcp+rVNQtWFhqjYks74YPfyNvVX
	SDxY06CUImMYKIyXk+v40Mv9ibKaKAE3oKL+S8AWBD9yiqtHS68NbcCDQQ9z5NYZ
	N1WwJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsaw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:04:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so37485785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656240; x=1793261040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exPzNu3p9/IZE77xM5zZ2CBcVgSGazYkvGmm0/QzwBA=;
        b=WLAYpwo4zLWjI7HFTjufKyICESyRSDHiswjPJzMaa0QtXQ9fGJSC6+9kTKNO86ZtG7
         IA7TSaCn+fcP//SjZZJ9OqrDHqqQmz67vPlA5+QYmJKYmp2exJmI8NK4jNRsc1LvTjxt
         zUYo6cJvnZF5goTE6awHhjKXCjE/xfb5xMCEgf1VhfyJEiASiHnOXJmSrlKhmBy94D9q
         v6f2wEXVQhaAE+pOkrt2VGkSnCjiAibuy2tglTRP/ANfP1lqTUcYVnpBYz5kJsVohe8G
         S5BErg8wqNlAwW6fq2+FdK03EnWELpPOR3Hg4/JsUHK833ZMah02lbo8VX1kwhUcMOc8
         cxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656240; x=1793261040;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exPzNu3p9/IZE77xM5zZ2CBcVgSGazYkvGmm0/QzwBA=;
        b=K1Tf7N9AIN4ytHL/28b90GWTfKxW2JX8VB4t8pdLv4yGmjBvtd1/JiPOFpTC29H1py
         3vfq0ZprvuDJPwDBd7b0SWRgC/OCRBkjXMctPRSSQLT81lwSD1oJJ3kC0GTtbWgwdb+1
         P9UJpBlJBLxpD+xbNadij4nVkfPQRHcDMGr/OsD9V7VT0iZkmP2njMpBAZb9UimXJaAD
         shvCvDlGlfLRGtePzUwiM1hi2bCF+U/BbUiVbwYPhfYZEQPZOforzNlHZLCULToQYr/u
         FsHkQEXFlwQkJLBMGwFksw54JRm2/J/bRU/JCAuUUilVY7CJSXM+nSAe5Ic2B0oNIubU
         OXmw==
X-Forwarded-Encrypted: i=1; AKwUvBx7jY1zR3umkbseQzVydNCXb3WeimLENJYqDvO6fsExIj4tmm+qlJkfmo4zV9JkxCcPJV+NhE9IZNz63QU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiK3gs/YvRiUx9PrCa89c8o6p0YziOEuLc1R/uXAd3SQezRzH2
	zrYG/3XOqFJSBohLg2SL5E2K+9FzvdoLWBs/0QBNUZrTClhae9KR+Mwk6JXqhsQTStgF86prWJ+
	dCgPuvsIl/JSCDOWHVNns2YVlpxvjUT4uqe/5nMjyyRj6j1MnqZU0MjYWRUdnV3hOUnM=
X-Gm-Gg: AYBFou0uIgur/cngE8ZDvqJriyIFAq1cmqOGhgw35x8ibrzeKEPo5jyJUWBtscosQPj
	o5ZHvXNKYMwSqwrnpK/dFAPAeLB1LhmfFLbeE+6B4Ez5AMkHAcM8qK/MOnYlB2Aze+ocSJ76N++
	rzt+7giC6x0C/bRXqH+ouSNA6gvh7Z4i8ciuZYGn68GB+dFG3fzOJw3K5ME2R4N97gZhqMEKpec
	2l6BWsuqKcg+bTHCe6dhjQ7MLXoRKPQp917DYEqkiuPWwxVUvAUJDG+V3YgkwaSuc+3QsG5vHRm
	PmDWI8Mtcwlogm5t90Nyj4noCgBfrXSZdVF74u4dpa4XawUIzNVurdtL7+RH9LwBcq8bUJsMlsF
	C86W+hrL42tPUnu/iQuZjOw==
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr887370485a.5.1792656240198;
        Thu, 22 Oct 2026 01:04:00 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr887366285a.5.1792656239728;
        Thu, 22 Oct 2026 01:03:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4031104adsm1477349a12.14.2026.10.22.01.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:03:58 -0700 (PDT)
Message-ID: <4069a590-607b-474e-9e3e-f7e744d3dabc@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:03:55 +0200
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
Subject: Re: [PATCH v2 12/14] drm/msm/a8xx: Switch to generated nonctx regs
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
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
 <20261021204244.67160-13-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021204244.67160-13-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NNeL1Ps35KAL_zGxNAddJGQ703lmJrJi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX+et5KFp+dCd4
 6txkrJut4gMfbLlh6jWd/PECD8Fp7zTcFeGHKMsQhRFDMyjPSPzqr8p4ukwPfH8axJ3BHm/j/MM
 WAcO91GgXw93AlTcph02c9QajrnKdvE=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9c370 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ek6KEbicoYwQu6oDvHsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: NNeL1Ps35KAL_zGxNAddJGQ703lmJrJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX1gDmJUppmIWk
 F3FSqTICOJhc6m5nAlvLk34JU1BHXL4QMVfjopfomgM/MtFkxJ/ZuMiyescX5LGPtMKP9xvhiOT
 hFSXuxnKv40fWZQas6DlgquRN9eBS3I4nOt1HwnLtXuDi9caShU1rNA99R7hnnRF4NM/gGUpsXN
 PLqRCGk8opm9aj5nxE3Z2Z+hl5dWeQTAiAAQae1KB9xYFqwJFU7BwZl/KRtf3DG3ENzBLc/Ipd1
 JZDVt6vsEfMcHkQWrNmDbqaMJVciG4OQuhuYB7m6RtOCEdQK77M8FOVMg8F3ntsizVEqrlX6yXS
 psa6kd0HkvcWW0D+by+KVFmZtBK7fnwykybEYrHGEmC24/cNNdOOn4PEE7dVMozXZoPFy1+NXKT
 H7ml4DOJSmstF8tTfssf8fhpbJrJ2xmoPlL10UIZ9VseeqEA7BCGuM8ybF+pfKYn6HmQNPQPFEB
 7UrUNgzSJlH6UcxSsJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220031

On 10/21/26 10:41 PM, Rob Clark wrote:
> The generated headers contain the current (at time of generation) hw
> recommended values.  Using these directly makes it easier to stay up
> to date.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

For context, here's an LLM-generated change summary:

What changed
- RB_GC_GMEM_PROTECT is gone from every generated table. That matches the code change, which now computes the value.
- Every generated table adds GMU (GMUCX_*) entries, and most also add RBBM_INTERFACE_HANG_INT_CNTL.
- Several hand-written entries are missing from the generated tables, for example RB_CCU_DBG_ECO_CNTL and UCHE_MODE_CNTL on a810, and RB_RBP_CNTL and SP_HLSQ_DBG_ECO_CNTL_1/2/3 on a840.
- Some entries keep the same register but change value or pipe scope:
- TPL1_DBG_ECO_CNTL changes from 0x10100000 to 0x10000000 on a810, a840, a845 and a850.
- TPL1_DBG_ECO_CNTL1 on a830 changes from 0x04000724 to 0x720 and from PIPE_NONE to PIPE_BR.
- PC_CHICKEN_BITS_3 on x285, a810 and a840 changes from 0x500000 to 0x400000.
- GRAS_DBG_ECO_CNTL on a845 and a850 changes from 0x01000800 to 0x00000800.
- UCHE_HW_DBG_CNTL on a850 changes from 0x01410000 to 0x01010000.

Konrad
