Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F416348CD47
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589637; cv=none; b=tP1R87c72CYap/XWk3I/ni1kAc2bE2tScpJCceNGjkrifT5ddilFpVDoNcQPRAhJDxLHZ9RJY17J3QZMJBCfumVgaLcdMxtV2HbjySrYbBkzeag+upTLbFf58CvSuoFfSZz/wui9d4p8SbogS74eqgKABp17c6Q6TPL1PHwKZIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589637; c=relaxed/simple;
	bh=+kKJYvjXri7s6v6L5H5Wt8m/tVO6Oh5w8G3Nmn49fT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPbYZbzBhHYti8NRsF1XjIN71p0fKdXLeFV+tyc6L9K56oH+RrT1SAYwtLEAvkucgNeWhsbN1c4cFeru16HLdrlFQwsGJrCxBw6xvwB9lZJpnYEkj6essNEG8v2a2fcyR2Z8R+cR9op0ve2eVEsWl2/cp3nZxYPIYBIG3JllC04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CC/R4dIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHzkmOkf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CC/R4dIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHzkmOkf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MDPe1446199
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRdl2ImDaA9RyrSIRrOpGmVshuJ8L6YSb8CpnEqxuPg=; b=CC/R4dIT36Ts/kmZ
	aFPJgXKkgMzASCZhR5udAfQQ8X4ejWDXhP2P47BCFmpHSBNkTGcXbyO6HSH0uglG
	zy4O2tee9jDsrmf+K0mW46ib21o6fMHg+h+NNwQcQyKtu5Vhv7fGymDm2Gy4tEjy
	uctOwm5uePi88dcHwRpUHMsKl7vg1n7V4fIU+kVqeYBfRGtxutV2PBjiS/YHffNF
	W9EGai6olRns8mVXACRbOKtDxHOKJYcus7w41wMLQA10xWITFgIE95+eoQdaQhRG
	TVivCNufXCOerQ+L0VkfJXswykf8UNbB3p6re2HpVLM6NXOdQP81AyyxJe4ILMOI
	7DKWdw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkr5p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:00:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-915a24a3d50so18799816d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790589632; x=1791194432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRdl2ImDaA9RyrSIRrOpGmVshuJ8L6YSb8CpnEqxuPg=;
        b=QHzkmOkf9+BIqaHdgAxFEjieU8ys9AZ7FN/lzmAXJITs85VnECGCAkcD6AuPUPlOqd
         xOtSwezrum48maMJrFqQz2ALLqSVqwJxlIl73MUndxvcaINAcfu1KRR1R6VjOKxYlbhG
         17Gjea80TEmcbEMoNP0rqhDoX9qHcTjoJvOORfBtrBwr5cKi+vGAV4euamotkMCuvjD+
         2g5C0ktHhitW4wCoob93bMtsutIOgi/nO6EOQuK8dGi5EQ1n9QYG8JiMdBsqzWH4RzYl
         yOhg5WPwLmbMeoz7Qfy9DvCshzd0DSUfF6HTQn5wWfX9cR8kd2wb+S1nHiXfZdnR6iFV
         OFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790589632; x=1791194432;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRdl2ImDaA9RyrSIRrOpGmVshuJ8L6YSb8CpnEqxuPg=;
        b=Pd8zffF6TIigFvdnBVj+6RvMcc457R5fmAVtK/GmrRJdhM2lelDgJNHg0U60aD1Nde
         cfT/NJKbCpKTGGY5V34UHJ9P6j3ZPVOnpi8bw4krcndAlBZCaieoGJLhZzVqBgsMH/CI
         O5oYV/XgTiMdkmUoDU3lK1sG1BQIpaS+pB0fYrjuhP9DmrYUiadzkCMP8bw4CA3XjDbG
         u5aWLlHnrgNVzdr6EFIRzHg0qvAM4xgeAuH/kKUoXXH+KZmf9Sr8T68waC3pd0Jd9skJ
         mzcPf4x887rNQe6I7reb4lA2tFySOqg3WF+80wBCQjC3ph5bHCBHYRojrW728i003w9U
         Gl+w==
X-Forwarded-Encrypted: i=1; AKwUvBzZtKJy+fSOMi3btCvcrih5sU/WbbkOOSNWX8y44FeRAr8pKf6oMsNZchCMF9OGrRavh8r+jfZnMFRQz8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfOyP6xNINsWxIl9tT3wjlBOJmdFFL7y/y3DT7Qc4HFKdz+jF4
	m5pUbjyeD7Dibf1jh39BSN5qix9M/ahPDJRrEIQFadW2cZ0gxnwYlPpzqs+7Kssx/BEESE7BYl+
	o33oSrq/nVQSgsbHM4pU/CPQLirTZvZQ+IPIvq7MD3CPqIBQLuGBUAnpFtTVw+CL0HGQ=
X-Gm-Gg: AYBFou0cn42epts2cpNC+MHzSLswVZYukkVXBkOhCW7NdcK0oIF7YfioK+ex4Y3F3Xo
	6PGCqqY7Bg3HD4Dfi/NrESWFxL2eyrkjnkF4mhtMXkSLbPIa6Xf1YfqTTtHWNe2TeRhJJKScb0Y
	XaopNy89qjZ642/uxqCJY7fVv/v0p9g9KOjfz6EYIoTrBqOflAD00jadvk9AvlrPaaI21R1tEkV
	YD5j4VJkb3J3yStZROUCq78OvkB6rxbHkvBmJyPRik9vLsCzK8S8623btFOcCVmpaqL51bfoEY0
	/GDSdrefmIRKI5MNveq/51N7J6QK1KM9f/DTl6zsJN5/mgMIUbzQbOK/MS63xfng41BbdXtmMGq
	ckSkxVPXemCCtoYqNAQJfEFd/wQ==
X-Received: by 2002:a05:6214:1ccf:b0:917:7e2b:d732 with SMTP id 6a1803df08f44-9177e2bde26mr4360886d6.21.1790589631553;
        Mon, 28 Sep 2026 03:00:31 -0700 (PDT)
X-Received: by 2002:a05:6214:1ccf:b0:917:7e2b:d732 with SMTP id 6a1803df08f44-9177e2bde26mr4359726d6.21.1790589630615;
        Mon, 28 Sep 2026 03:00:30 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-915e7afe81asm21547916d6.6.2026.09.28.03.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 03:00:30 -0700 (PDT)
Message-ID: <b095b037-ae76-4b0e-b73e-241e6d638764@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:00:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset
 controller for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260928-nonchalant-mindful-goldfish-910c9e@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260928-nonchalant-mindful-goldfish-910c9e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfX+w3hgP/n4Bl1
 8y3kzwtEe7jpAMbq6CDZ0dXqD5kaALHMDfm6X3uNouOZ5Bjeh4i35RAioX8HfXQA2mKNDv5vS2y
 Ve/KMdV9I0BhCxxDAv0vxy0ID+/zxVXQ4odiGGEGnpEjWF+wP8f3DhzrGiD1b4gCjfJjK+HQvkQ
 Vabnp2tkAWwWi9WHrzNZNRW6dGaO8WALTW9qFOCGsjaqx+GnTG2pjaOZ5Tkgj2/GqcPOnI8D+KG
 b/P4xAq/fiXG4jtYBQAD9CikwMMin34R1CRHjpOs4Oq8c+B9PC8E2S9OtNuamC1O7UzzxfGFQH3
 nkscl0Yx+a6Wg70DAyOk7vx+8bfhviL9djd+1LLkPA7x+a9r2F/iquISHQXD/a746JoLpidPkSs
 L35fLS439C3ZOKbbCzDthoyBknkjc/KBtZ0yX/cSzTUABIspCfL00t+bGT45Wh8rMvGUa8bNvOP
 y8SvkEO2os2C+vHpNcQ==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba3ac0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ffBAxg_qJ57NiJVD2GMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: WvgVd1kN-13_px6Az66AiSL1hnV4qeaR
X-Proofpoint-ORIG-GUID: WvgVd1kN-13_px6Az66AiSL1hnV4qeaR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfX75us9AqLGTVA
 qzEiyKTcPPA8U/MD4Hvgf8mtiiUP78S4ERuI1Im0C+TkvpIf6yZoZNQ/rPD15qnCupZON4m/JPe
 mVK5Vxxyip28lxRVV/+Dmzu5G2K2Bsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280039

On 9/28/26 10:59 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 22, 2026 at 07:44:22PM +0100, Srinivas Kandagatla wrote:
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm LPASS core and audio clock control module provides the clocks,
>> +  and reset on Glymur.
>> +
>> +  See also:
>> +    include/dt-bindings/clock/qcom,glymur-lpasscc.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,glymur-lpassaudiocc
> 
> Binding looks exactly the same as qcom,sc8280xp-lpasscc.yaml. Just add
> the compatible to the enum there, no need for a new file. Less code to
> maintain, less possible mistakes.
> 
Yes, I was thinking of doing the same.
> Separate header file for clock IDs is fine, though.
> 
Ack, Will do that in v2.

--srini
> Best regards,
> Krzysztof
> 

