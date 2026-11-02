Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617630;
	b=VTzn0807oTw+5OPSdpbHbSFfu4xHtJIoxT81ExspAn9iG4OTyA5cdzxRfmdLLvubIKGV
	 /6XpocaTdFyXkxe5dzTgGUUKC1AJjtlro97GgC2WboBluMtoXC+EfkSPHl5RmhQ9jkuLt
	 s+P6o8KeN4JUL4QykJJPHAiwwDNZgdLPSWfvQ4e5fwogHj5wXzg7Yd3occxv0Kx+prnFL
	 vK4V2VY8ewMV3yMBd21tDhzx+LRx/qIonN+xKX//oJaz6OScrU7u7taBmo80o0WBisEXU
	 O6ytJeITfhiQPqCngkPXZbtf5GZnxePiLkWd6yJuJFNy09RRl7gnvILUV9pJJRHySww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=us+y4KpJBze+sBMisIIItx/0Q9rWzDs7/LBvnzrOOkg=;
	b=2XGFhqeJnkPjEdZ1TnWnzOvq9L0mPRTB5XWktS5i48/LAcl/LgcP5GyHcc21Q51NWkDs
	 SzuiCrxi753G9p/7vEopvqdvkED/AxumPYzkeue/zTFFngaGGLy/kAe4WfBHZbeci7m8U
	 wZ/Ls9Os/asL1UjQj1pLHtKErdoOisCoJsBZbv6FRKCDu106jbigew18KwJpdM3Kgejzf
	 RgBs0i8HygcD+KDxm3oUHHHa8nW0N9MHvLNvdcXCsxjJ/30hZtUzLt0aN/es0rdHz6+WY
	 FqoeFpQGn8vO4N86RSibJoeX2A6/fI38sxyHUKLOci+Rmn81znbLivTvifZZ/zG+fUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YSJI50GD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYqsu5jN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D24606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D24606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YSJI50GD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYqsu5jN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMNp1821156
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	us+y4KpJBze+sBMisIIItx/0Q9rWzDs7/LBvnzrOOkg=; b=YSJI50GD0pv74wxx
	f3/5v2zO5MQ7f+HswW7GkMNtUAIAS52RHsRHKgHOK7SddPmYtKZRYA7+iBjkCL2U
	QIds5uoQwO0TOUn881hDy/+sp0EnCGWHqkTo/NAi5v0AMGpfUQcUdFtDB2B7G1D8
	2oyeFFT5OFExLZIoN3YVgeanM6vmkHkgXe5dnw1spnaCmpG2rRMO8A4d1acazYt0
	Nm1/UxRaOsM/fK6JA/QJUDtTFjUEpT84WpaOqAScgwqRwfAkYE5Qvl/D/xfGYE6F
	cOPzWSBch+fpF7NRs9Ewqtryj1q/jEDMD/QyzmS1bWUAJVuI4PfK9OY7jboP0eNr
	uUzKcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hc2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:07:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so54266085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617628; x=1794222428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=us+y4KpJBze+sBMisIIItx/0Q9rWzDs7/LBvnzrOOkg=;
        b=WYqsu5jNhJ8fgCVb/t7fuIkPZCtVJ5IJT1VeMOZThBG552xUHeV/8syk5edxtvU8Yt
         B5bLIJDDww4qIqk82MbRNG2W5LFCWoBmL+/4MPPspUpLDlBj2ry7KbHGkC1IPQ76h5Um
         bK4NeMCa2nlhzA3Hzp6AswyJMyf9Yy5hENPlBd2GzYUjmrYPZNsSJHqIRI2ayVufHE0y
         m1WfINKSrnGQ7lw9T/xy40K4xf/UFepjntZUu3oVg/SOFcJBuxokeStJ/piIt16sLJjy
         3W/3SleTTFaUPd5F868wm1GFxYw5xe7ZuuSXiJX/PGIQ4GtRquiXGxdY2uz6U+jHAc26
         9Rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617628; x=1794222428;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=us+y4KpJBze+sBMisIIItx/0Q9rWzDs7/LBvnzrOOkg=;
        b=hIgbyHmcI8/4Cbu6qywFcwEc1I0P4EUp0gT6jyYIJ3iA89YLSNdYBmK9BV0C3fUXnt
         edDMaO5GKya0A9NjmJGgyXJidIaJt/MI7xHVgL1DqmrC7BLijdfksijjJTTJxSTNrg+8
         7YhqFAOyk+yuM8fuHz0fq1nYZmbZoHy0gyGS4LqubyxddTLloCLPdQ0JpsljWrfkF47j
         JFI722QvigxD8KJGjYHtM3oe0DWENn/A/XQ2q4/hTUeTGwKrYI8grqC1GN7XyCa6EKle
         GN1JhL0XwWQ2NT21T3ACgNTdRqfusJCs7EbeFXQ+mU0e9hrVGF2AplA+phG/VsmrgIkZ
         ljpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVwLCTuTxy7x2dUiGB/E7DXrCRvYBGA5aVNnermTBwIAouI22DaL1XPXiyBPClYpycy95tjbP3vFluAcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR0UUQf6q4PEGkQmQQhkJlPCJbykIiWm8hcA64eEA7hS4/oYDK
	A7DPDlf8WqGUOoirG/P5lb2GtdHYbpK9CXplTpXSXLLgblRqSGYZY733vNmNEMKTRFjBd110n6d
	pdTtXbJE5f6U4QFE9JQ5T8A/V5Vv/V8LJ3XGfKq8uhh0mlZ8u+YF/ekDbnkXETRH5oiI=
X-Gm-Gg: AYBFou2bBnqmHYm6Z2VhBOXZ+2QnCWO31fPj7v+t8TIGX9zKXOEfvHKxWnuLMz5Jc1N
	15SkEN2yy4H7FBRhU+EWoVrJZihccjhKEcfKCLm2AACdHYDK8vOJ2wbLHq4MCTQmWykW8cK4wnm
	j+S03cdKeKWHBjDfvYyzOy8oE0bttrtIcG46EUbai9M5qXdlG7k3R/ZQ4qeaJjsv36ifzZ8DIr3
	e9qGdWke0QUmrIfYGOPaGyVzgnTHbyZlYrcU0GKM2eiQtKpATF47o7+jlkBcEWbI2W4uiZ3/IgS
	iTmggcjI/13AUW5psUxB9mjhkgJT7Lu93dAM73KqjEaCE9cc3vHHq+j+3AZ/amAQ1ifGtr2cZm6
	FddJJrUl/ON03dJWclgIme+HXSCzXoQY5yhfIk9f69Mxg6VygxPwie1elTHqXqVorHaA/Rpo=
X-Received: by 2002:a05:620a:870a:20b0:944:127d:f192 with SMTP id af79cd13be357-9442179be1fmr1537820485a.5.1793617628066;
        Mon, 02 Nov 2026 03:07:08 -0800 (PST)
X-Received: by 2002:a05:620a:870a:20b0:944:127d:f192 with SMTP id af79cd13be357-9442179be1fmr1537815585a.5.1793617627632;
        Mon, 02 Nov 2026 03:07:07 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabecd226sm373928566b.74.2026.11.02.03.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:07:06 -0800 (PST)
Message-ID: <fc32b535-e06d-42b1-8806-3f3a2a9843e0@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:07:02 +0100
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
Subject: Re: [PATCH v4 10/19] drm/msm: Add cleanup help for disabling IFPC
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
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
 <20261030211928.45761-11-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030211928.45761-11-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ztgO5SyvAozZl0XEz10_pZPB63uJLWgO
X-Proofpoint-GUID: ztgO5SyvAozZl0XEz10_pZPB63uJLWgO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX1lOYCxqU1ssG
 zQ6lOEef50aOuWoFtDstBT/mwcoH5ZF8kbgkqcWN9jbAWFags1c6eqRorKH4eI1ZWqXA8P3P7KO
 INRovwP35JOJLMx/a3Oj4WTHA/UMkaI=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae86edd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cWb5AwZ_sP_0w0E8whcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXzpvefBrOg5m5
 Mto8V3+e42/31SuiRI6auWYHVo82KZ2JQYQ0oD9dtVVg8NEF2S7MLB8eQpTuqkmPSj9LzjqSw7S
 jmt/NC0K/TdSLjEiitCBt2/jQmcMiiBmz/5DcekMFfCnQSoGur2+Csz8lyFa0GUf+06CrNG3JJF
 WX8yi64nY3PkACxMEbxLeNQsrx8FofJnoAswfJXhP/zOREsA4wUeYzUqJ5kdfNS2iSMx/AJqKbo
 HMqQWflp7N4GnflCJsPcHKBV5vDVwNVFPXgJ3wZCYN9XlfkcHXfBLkPlOB+XiSY707syGF8ivH3
 yYG4iS0NMo3mhoXo2G1J4bU1omjFwiWTaKvSpzKemtPTqdn4In5ncGwWhf1KwWO1Qi4jyhVSOAU
 KkzKDgLReN7+VirTxOefZG5Mz69nbDHlbnO1mcDXx/efP3q6mugnlvn1JTWZQDhbnlcIONQSY4d
 Hbvp+D3tw8i1yO+gLoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

On 10/30/26 10:18 PM, Rob Clark wrote:
> Simplify error path cleanup for IFPC-disable critical sections.
> 
> Note that this moves where we re-enable IFPC until after the
> wake_up_all(), but that is harmless.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
