Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578471;
	b=kIKhmWck6CW+xD7wW1AGNZOyyBaIOAOvTzyXSosmHoX2+OmrmCSAiqMNOeGmmNMPa2jN
	 abzhz4x4OWg14nExydfpZYHaIKDDUxSjRYQqHcVWJ9cnCJbq6nSTMIhJeQjX/h/RKukrW
	 FDhsE/UU8i0aPvW2VTzFKPx2DCK96m8KM83Wsgwpb3ArwhurORdEuGm2UVCnM4XB5Kazp
	 uRBTWewv1eDYg2kvb62F/f7+bKa5lG3Ln+aS1Kt+8ljYZq/gee2e5QLrR4OvSHN1spJDV
	 yg74/JFB2/+sX7NvDn4YpRwB31tqsY7Sw/8j8ZR5YqC/IV1A1K2ONkZocWbpn1KbKuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lKIuPtXucGTuUrVP+08mQo0qmmFiAtXLjNuGxi16fbQ=;
	b=jmzF/fp+0v4WgWmMJYGu5FhOwHDWA+MdrxwjdaS9+ljQFFgEToy4a6WgqOh7hrJToqgI
	 /dJIT+OguIHyFgZwDFvDB0vP89TF5Ji1Jipz5/O1HY2A7jypFhFXDrr4mxCyKjGwqbtZr
	 rc9HfBYXFidFKzt1Pvw0GjjG/v9nogQn9vVmZxv4tJvBb1LfwpwZXmyKZugkWeVinbwHd
	 n7dnpee+Z/B0CygRjayGiReDIgBTvw5YvGkpM7Zx5pVR6FfEzg38hVSIzgjB3ZKEgUOCy
	 wHEP452rAgyk/JQP97S9n3uKkThWsW2BqF3tgvvov8EzHBnGEL9uigczEl9/3X0psDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Mw9yS/dk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxquBoFl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C244606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C244606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mw9yS/dk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxquBoFl
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5uhL3958146
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lKIuPtXucGTuUrVP+08mQo0qmmFiAtXLjNuGxi16fbQ=; b=Mw9yS/dk+tSEmZUZ
	/4PGeOp3wb02AZnS5ew0LavnrtXYp1V03Yt6CVm9vJadr+WHsJE6Q5Ox9Y1rJwzE
	R8lUX4HdSiL/DelTpMxlxZIh/DX3YpCab3fl8rBg+ee0XzPhhYRq2P5Osf2nD2TC
	b1ml2+5+00jI46BIIyPS7KpRDGlrfrVy52OIeeUhjQh4qI4kds0rhj+GvvPXUEGu
	CCFubzN6mEcZQ5Bo04qkV14omeG+huKbhqG0hlwBJBTCgakFvqruvrWtwaHTJG51
	StV96JyHONLGcgBI2cvAkPRu1hje6Cl7PYTKJf6d8DFPjC4dL0SwaeZ4fCCoVT7H
	BPJymw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kew4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:27:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338bd59032so466381cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578470; x=1793183270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKIuPtXucGTuUrVP+08mQo0qmmFiAtXLjNuGxi16fbQ=;
        b=YxquBoFlr1nGIaAj/rLZs2YfzzePXg/bh6+EQG6MqBN8JveFOS5hqUgt28EoU++PAi
         PQmUtfUKJkZtX96Tw0IerOuuB9aSrxkCqkOkPqIfcMOJPlo6+cXdiW1PmPkOrMczyZn2
         cqQ+j+jolp33gfXyu19P/JkO6fPDuT4+Gacm1hHDcBpfmOVjjvOAtOTfY+VR4rG9ETZ9
         D7SM6JQ7eOi4tnckTYmvRtnNdYZOKTr3f0QpYr5hqo8BzGsN8zsHIJEItC2PHzjoT/Xt
         dGBB87QetBHrlZtxYnLrebYg+tm5xw+Lt8SWKr3BmNkbKdOim1gKsMgJ4QlAzdablrIW
         T3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578470; x=1793183270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKIuPtXucGTuUrVP+08mQo0qmmFiAtXLjNuGxi16fbQ=;
        b=ktDezEaLCGyqHlS+fra/rbsEiHnoQk1mGdB5iRU3ndytwjnQvPlsJBwVdBwMZI2/gn
         Vzj9a2zCQW3NvvhRjHE+gFfSBd5IdDToEPlPvJ4xH2ZZdJ2b+mRgq6ZndKctiY+w0+Ms
         LOWG2F9J+z8lk/0WX9D/kV8zxLADq7K5eACXVyC4GJLsYzjT569JDyfGGWVK5e2ovLZE
         WzxXJ0r2T3caeSLW6iC5kYQjiOiqwpO7hr2+wbP9TZzmniSJZDAdyrKo+HM7ZEgmcBWO
         CNWyFhZVtkFC4w9piG+xiWXLN5b1YfTayLEdehKmtdsMIzFPzmqcxpef9hw9/0qMVfgM
         gcOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGaA0pPLuEtPSvdqcvCnHobIJTVeEHfJQBYqpNDfo5oa1gikfYkpoZIOmGoSYy1twgcQh76anI7svhXn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2VlLZyt4caB2SeZk9ONLdFiBnwFCh4kyS7oGFU7RCT6AdkRfp
	IjD4yee6Aes/UdEOY9Mgs67Gmf0l39NOVah9lGDieXEzmPLNOlM14+zE8LESeegKoC/81/L0zbv
	R8b9uUR1cKdXaFNpXSyfd6B7rbqGkxF4mBrk+7VHnsyn6XEMBsCpzkZi2OcD+nm/QCRE=
X-Gm-Gg: AYBFou2S9PiR7e9a8MtZ7HahMXOqEMtQ0EOU+Viqr3yx5GN2204/hkmTL93oshYtZmo
	zj8fdfYtFz7j8Z9ztSyyPvcfVgBOC9dr/1+0PrDOAILRaG9fjqw/k6+hOoJds42LxLx3fRTkWVX
	3RDLnWUD5ppM7x9KzUx1BpjGzlNKnwG6TvgfRgeZea9Bc07ITVm6Zuurr+Zxzok2kifJ4AqoC/v
	VdK/eRE9XYUCa21WU2JwpfusAkecg64n3SPElIYpau1NmHHI+DKz0JOE4ZSbIV/1Phyn13iDWxl
	VrhW7bJXxRuCJpAFN7qPYxvsSxX+OlW2YoZszH3hcsCSQBfQQEbNHFzN6F9zW0Xbaw+E/z7WSYu
	BqVtuBvOmTm3hN0foD9fcQg==
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr26674681cf.5.1792578469474;
        Wed, 21 Oct 2026 03:27:49 -0700 (PDT)
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr26674471cf.5.1792578469077;
        Wed, 21 Oct 2026 03:27:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7826csm65275266b.27.2026.10.21.03.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:27:48 -0700 (PDT)
Message-ID: <31b06177-69e0-44f5-9f84-28dd86a4e5a3@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:27:46 +0200
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
Subject: Re: [PATCH 3/3] thermal/drivers/qcom/tsens: Disable hardware on probe
 failure
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-pm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261021085749.3786101-1-daniel.lezcano@oss.qualcomm.com>
 <20261021085749.3786101-3-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021085749.3786101-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX5epO9FLM8wIi
 WfH8lHaQwHD9eJoq+1aNfWyh4PLpfC1+s9xhSpasz0afCf8Jjh245fw1xLgrkGa58tiQXXZD6+7
 ufAVcWZkjnsnAV5dWcEL4WBIiwgpft6NhZR1GuxOmZ/+NGhKjbBnmPfnBeyJfDzXjoCVYdQL1Kb
 D8l0qGLMd6rqYFcAxx/8XrBAJIEizEPgOiQpMo+d6xyAvqRs/nyApENhMox1pGf5rRCUZkCnpBX
 V4Upv3THShbAIVDmBhanwGbtcoaSES3P5cZKYPVPnWIG+wDEONBU6W5a/AgCewzhLAEZ4PqBwNP
 usfaHvruFQWAe/wTZf+o/3tN2HZ5VcuVxue8/YsjZ/dCKfrgdksFGIjBGOqCloapXLXqTNnm6H2
 N2ehZQLilpcavMv4aUlWgWiOIhHSTMDo5kWnoRQvWes4FhX8NU/LAW4LwcxC6nnbu4sH1mYOKf7
 OoBt+Si6HK5MUh9p2JA==
X-Proofpoint-ORIG-GUID: R1aKlnrTaya6Pnx9NWKgEfo25TAWYOnm
X-Proofpoint-GUID: R1aKlnrTaya6Pnx9NWKgEfo25TAWYOnm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX+VKnES0b2sR+
 Ya/bPR0hvec/R+AZnQmnoqEwe41TgzUFwmQgUrqTEvF8ED8nnLLdsDHVDjDlwxdgS/93JOZ88rl
 I/vaJ+tRi+848qRmjZUZ4hNfNMRdLqY=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad893a6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pCP4VrvfTVqM1MFBOCEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210041

On 10/21/26 10:57 AM, Daniel Lezcano wrote:
> Hardware initialization enables TSENS interrupts before calibration and
> thermal zone and IRQ registration have completed. If calibration or
> registration fails, probe returns without disabling the hardware. Devres
> then releases any registered IRQ handlers, leaving the interrupt source
> enabled without a handler.
> 
> Factor the hardware shutdown sequence out of the remove callback and
> invoke it when calibration or registration fails after successful
> initialization. Disable hardware interrupts and call the optional sensor
> disable callback before devres releases IRQ handlers and register maps.
> 
> Fixes: 634e11d5b450 ("drivers: thermal: tsens: Add interrupt support")
> Closes: https://sashiko.dev/#/bug/linux-4b873699-7a0d-46e9-b768-169916c70d1d
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Cc: Amit Kucheria <amitk@kernel.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
