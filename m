Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007692;
	b=5kdmE0oY55qKczcpICnYiI/zMcwKSkj0gZJP8Si5c1h5LyOlwXNP+7NL41qYbzSx5rhX
	 5md8wRM7EHWdTiSaCUjRf5Ed5rP22gp73FV+xxFPOuOnvuRNp2Dfl8SZlgPhKS8T0AT9T
	 a215yfBKMmq8RXpTOWP3idMHvFHXr8TsD1MAPgyd1EkOlrnI3iKrPv6dGslGbV7MMQ26P
	 Y0EZc2Vr3ik8LHF4/ezf+GljSENq8quiwLM/pGUXJ0SG6I35ZQiWF0BR2TN/jO/MVSOi/
	 X2URuNiIbZLf8ExWXvvEdp0py9avMZIEcrmB5BNCe3+yQbEH85NZLCVy5OQ7bBTOyYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jtOjUMLPVMIzOsKurX3BXE45pHwIm7WjBEObd/L5hnU=;
	b=ikxa1hgU+GMaehmOUuMpY3Q0/w8CXrsnx0wi+wSgIhB2Gg+9keNwgebAA5GGggraY3Sp
	 4OXuecCMCHlgHFeQwXgl7e3crBJGhPOhZjiKHPKEgnNjzu6DVXx5Ak53HbFBAiRQ+Uhtd
	 0Rl+SvUgazM/F1IavRlRJSjathpLn4FDsjhc/qNlgJMLCYlh5TY3kinEArgzPv4G/aK4f
	 pz5KnJ5nWkpJqnBYNuGd6jIBr6v9NAFS29lU9xqk4HK4LqA2cC2c4325BkmZoIqF98RqI
	 q3MPl+IXvOYQtxWGSzb6dsE+1KfYhwjTnM4JfJ5OLzA5rUkalWyNJLrBGeOpqdb4mHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bd7cZQyA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwwVyQPP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52F2606A330
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E52F2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bd7cZQyA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwwVyQPP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aPkW2222502
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtOjUMLPVMIzOsKurX3BXE45pHwIm7WjBEObd/L5hnU=; b=Bd7cZQyA8FERtPMC
	Tw6IJiAeOXlQKyEVxMJWsUOC0cc9DZrz47pkfs3hxjFdRfxZbYrDZSHWLnmY3xg1
	0QGxG3mzS3vx2GzCN+szDYr3jJr7PBL72Xz6IZ0Z1PlrkBkz82X/MhyMI6LS9CgA
	iLphsZK0ZlS6qcvqEXyhHVhzaTbtlVVqOTRjWTrKOrgfSIkjbWV05NB/cD7qDUtk
	YlO+8Jg+VFLMPYKxqJcZUTWVBxPzzsLfFEngBMAg+xvALDITXRmPf1X7c8ueRHst
	CTDAzjXhQv5pNw483LxhKBUMUlGdRp62IHsteSeMTB4JtB6YFhc2DCpiWufG/AcA
	KFsndw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9gsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:41:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so35663185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007690; x=1793612490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jtOjUMLPVMIzOsKurX3BXE45pHwIm7WjBEObd/L5hnU=;
        b=jwwVyQPPXcVAKmPInRRZbT96OGvupJzO6Y5foLKjn/2WivBNN1+UCDwrrHYQzD/LH5
         bShaG07+kzf8jbuu5A3uI7m8m63dv4NIWoIUHhfOB24dcXcVkNIgnKkYrqY+mRIr06+Z
         1E5AcqtrNu6d2e7dCJztCfmuI/ZqNTksuliWfivsxsolLt10pNGm1L6MpVt2bu+siDEZ
         ehufSUkAJdKiXgv7l+6CUajcm9RnC2lNm0dyLHD0SNog0n2yz/sj4QAuGx1wGV+tjjA8
         AhXJu4pTSPMzQXyhAWe/+OKgq7Q9K8c63eBl7ns0FtOjB0Xu1s45ZSAeUfJfyCjaEFtX
         RAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007690; x=1793612490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtOjUMLPVMIzOsKurX3BXE45pHwIm7WjBEObd/L5hnU=;
        b=nw23vy9wbTPT/PUvyD4D113qwCFvvaKrOD69H518z3+yHtKRbO2qZfe9B7xXFYHigk
         UIVN0kQbupSEr8vpWrVOmVWDNbnSOIJrr3vOivc5bAm7pMS0ghvXK1+PVjkNfDrSqCZF
         849GHcURgJaFjhLELgaBt5wQvwYJwi2iDKZWDZO9rgpr+i+Bb9xG7vh1MgV5Zhlf4Ru+
         ZNPonfOO+B3Z6yHiG1NnHJzdLl4OIASm8zepuwHxWJcKdAScsol9025HJwYnFkxbiaFf
         hhzD3a1WBT9u6Gg6FSIQttBBsPFYKvUGseoaeLHDB3SHDSmitfQkl/aV/kspzaBG2/Ko
         vceg==
X-Forwarded-Encrypted: i=1; AKwUvBz40w2QrM/dCpX6A6AzYCYMt0LneZToDawBGjlcZeuyHw8EOYWwU9szEJPdDWwJ6PJHFETzGm9bzPabNvI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPp++jpRYchgwGJRmXfhvkx7tq0qNtjKQ/JWQ8327un0xBLXIe
	Jp1sRRKUxyZQo9F/dLVmKan3phxOslZ/P1Jmx6zImoSGD+/Si0ItddCkyOWT1QoL/YZ0+1nAbQ8
	WWdMHUdztcr/6zdeRaDOFSEyDCx/UFR/MHNlSZNEMRiGfbogTnQnOFYM4vX0qTqqyZWA=
X-Gm-Gg: AYBFou3E3UzQ2XCffO3TJgkPeEPfvR4ZwfRJWly1HGpovmUqL9+dkqGeBGe4Vo7G9xg
	9nVJaOW3RQGnOS25sG0eRKivNp8ftou9p5bXuLb9ZyxcfbsNz7z5QEygMabklbEP9iOYkBYtxG+
	oeQ/u8LtBRTp7G6Bb7FxfpCUYJnx6sY1dcQIXeZDCPjF0ztbLFGXD57Q617Yu7QhVYJ0quK8Qcr
	beB1LW57oRH8+NojFYDdJrHbnu6XhBy+iUrupWdQRvwAxuTY0iO+azjrFyqPM+sxgscCRLV1fHf
	SvjqgNVQlgGHmqZnxp66K+hVmxclMiX3Ho1r3R9VMhtLNbIiyzhlA0Fq4s0G2eYJYveVIfUEsrk
	L59z94mg/kB0E+sDnea5rug==
X-Received: by 2002:a05:620a:899:b0:939:eb09:4458 with SMTP id af79cd13be357-940ef8dcadamr954270985a.3.1793007690223;
        Mon, 26 Oct 2026 02:41:30 -0700 (PDT)
X-Received: by 2002:a05:620a:899:b0:939:eb09:4458 with SMTP id af79cd13be357-940ef8dcadamr954268585a.3.1793007689733;
        Mon, 26 Oct 2026 02:41:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650890sm308885566b.51.2026.10.26.02.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:41:28 -0700 (PDT)
Message-ID: <9bfefd42-8562-4915-9d5b-8fdfd2cb6d8f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:41:26 +0100
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
Subject: Re: [PATCH v3 09/14] drm/msm/dpu: don't tear down a failed hw_init
 twice
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-9-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-9-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eHV-cSXaRCHp1Wv8Hfph60P0na5eEJH4
X-Proofpoint-GUID: eHV-cSXaRCHp1Wv8Hfph60P0na5eEJH4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX4dMAn0Ab461P
 SyUNAxZcnHkBpLQ1TM9BzGtgiFQNvjJFKskcA9Kt+txl+WyMdooUSZLe0o2CYSqzTqM+E9OKJ8o
 yK/yVQtYBj6vCRqJCV/KyJ1i54FbIEN0qbdEb9saQqJoSIIwB/wHq3q14XluZGnTaQtd3UN2r2X
 naxHSHuK3ziCR0pKRuuawSTlVLPWW4OvnPneJKWti1ZghlWo1SipBqxqt3qvmecNbg7qtTEqlD4
 pLFOpmark5zjtkzIfzJRhGM/DFJV1vUrg22M+zpLX4YMruBfsr3nSCPt2Gdom3eILbxx/aM0BiZ
 Xp7i4ZbpRGFsRaYbJ+nswfNN+UtX5lvaWdlvmEAnFK11QSeVVm2KjHRIX+nk4SNcBYpUS0NBFiG
 5QuWO3W4OBJPbAwsex5tSjJys+K6ovh08dpmyPELFBmdz+np4WSSrXsAjzYU4rX8lgjZzy0TJi7
 nmBZSzrKAY5KQ9KB/rw==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf204a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6EvNe4Iz7nrDccDV2EAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX4hfWTrcAHA+f
 wx9CKD3F3jDrCmu1CMd7vs6VVUQd4Ted5LBcOncR7DPd0BfzU8rhVL9yZP99N46lr+u8+PgTX04
 WA6uAgv8aDi8vOn8pXt11In7pCPElEM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> When dpu_kms_hw_init() fails it calls _dpu_kms_hw_destroy() itself, and
> the caller then runs the ->destroy() callback, which calls
> _dpu_kms_hw_destroy() a second time. Since the global state object is
> finalised there, the second call deletes its list entry again and frees
> its state twice.
> 
> Fold the hardware setup into dpu_kms_init(), undo the steps of
> dpu_kms_init() when it fails, and tell the caller not to run ->destroy()
> after a failed init.
> 
> Fixes: 49e27d3c9cd6 ("drm/msm/dpu: finalise global state object")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
