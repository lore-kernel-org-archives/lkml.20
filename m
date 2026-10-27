Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106736;
	b=ohuZ6/l6R1OMLxX9gW2Q7kRrPUikaLhvPfzarb3OTra9wvEp62aqn7tc1wSy0gO/9hKE
	 qRR1SIjZkBVzawYwjoKc7K5QcFZbObjkagEQ6sMRIshWKveTteKx4w9Fbfic9mW+rzWtw
	 J2o+NWNHnYZ/UWUjMcmSC5IDAcmUDlhnK9gTgrutTOVNt22PLGA2ajIqHr6cbDLe5Dyiv
	 1P+IU1KzFD9KCQXfJ8Keh7OqaQRTniWVmUEuVUg5QWdBzlWTUcAMOkvL0pSiapY5kWQ4r
	 HcAWGzMfE7HFVzbV3eDZmv8VNoLbliBLjnotPhtbgiN0/Orjjh+JOtIDbmv+fXRDh2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=;
	b=MoyGeVXUHnBBEdJUrgYnApgvcNvk2gcDIyzvTVR8KlOlM3FiGV9zJuqPminyQMYQFMtJ
	 mUllsyuafKyuC1uIjwZmQ1eQLdYmW0Nq+TDIoUSWECoJQ1dG44OCc2ZCwVmcVstQGXaNZ
	 m8QHjIyOJUZlZ0MtLcpgYvnAhoPhU+A3nHDi2RfR6+DGRFmyTrm67AvSPGqdTRHvJxaZW
	 4hcs+3EVC++13R+rgu92198F+Wz0ZQtwFZYq2386Xo9JbC+NJ0LDUEojyTmAoO2sPbZYr
	 /l8LF9jRuGRp0kyRx3AAxya77/qtOW7OzJij6m+hlqq5Bl749/vcvACllsynYkjxk5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d0i6sBX9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AAw42nz6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA49606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA49606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d0i6sBX9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AAw42nz6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe0RP2523938
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=; b=d0i6sBX94Z5GJjN+
	2clrqpaZZ7pFbAJQv+7lWo2nSHGqPVYiQlDEho073CkcRpPw9bdHwvp9GzRYLtVi
	LHoXA1E0KX191jlWuNU3clKwM1s8GSCj/0KrC3sin4lRnMg2ZBvUULT3azjVPLXD
	vl6SXZHU9lDtTsU+4Kxc1yaEB5KFYEWzbT8BvgexbhzqP1oP1qlaAs9Vu+I4VyOU
	0KZ/nYyBoexKxMNakYR2K34ZA3pk8ksn2KXqrPZaohBG7HSjgUGW1jXFHt1Eb44v
	icRpKvhrdWYKiE0ZrJsMTYSYW0eHb+mCRkeMv2w7xRr7cVjUwMHsYkHhniqbKULi
	SdKubA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw217ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:12:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7318450eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106734; x=1793711534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=;
        b=AAw42nz65DBqkgcxnnscduH+TFqi5eW2svsImiffOsPl8VzpQMssa7Hm7c+YyL6UsC
         wE1Axf/BgpxPAX9eiO/LbJmVDbmLaOAAkg4t/I7zAo+6lvcksa83LGW9NCy8TMHojFd3
         aJhUijSq7BKh1PPZFoWb/Uyy9HI/9V/xBoOpzQ0tvXVuNWVuGQlfXHp5hzq5jziLB+t+
         yfQSL6b+GjCabWizFv41qu8pU7b0WcJcqhXxOTgX16zRr+Dc+XTYawZs78hHpkkJDWxq
         eqevOcyHKC1ysxWOFGzOvq708UqrA1ajEhyeHhLjkmgsd7Ss3nT0uUT/B/qsX9RBaFdP
         kZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106734; x=1793711534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=;
        b=WBx2bj1sKa6sRvgYb2Kud6suFuL7kK1U1daNeUnectrIjayKrTpqIuS2Bvz9bYMs5L
         eAq54HWOAK7MBPOGvcydDTlKDnTCUorsED9i8nNgOhVbVcjCNGdwRegvWOe1GqoAau9S
         JZOZiE9kNTsGGCw2uvtmHoUPDdESVYg+u6qJkGp/Fo+HWWnUb1Ih9imI5L8qU5DnaU/Q
         MpOPLf2MNsZxDCfL5Q8w4Xo8IfGTS2Xl3s2sEHRlmsBxmLuJ50tSFVQN5x7d9SBCoN3F
         9xlqaXtYEYiMOLYbMkvK1hdR6Fw7cfLm6N5q7T0TBpKfxQbo6BBFHn4qpHxrlNzlij0/
         CA8A==
X-Forwarded-Encrypted: i=1; AKwUvBz4B8D7mVWi5n+M0drsnVqlCmGqgB7pwE07Aq0xbYWbBcW17rlzx00zdCY9pqySR5WtT6Y6VZGcI9ALb3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg871IPqVUIl2Nfihu5Ok/jYJEmHfHhgVf5xzuYPgop1OtGX+7
	iYAz89zgwbAgC0GKQ9SbkQROlBHMcX0dx38mvhkx6x838FfRMcIHpM1ovMlzLL3mho2GmsLh9GG
	8ftz8V00uULRWNuWbWCoTAziksOKxzzjJP3/fSMSEzckuQusgeZwbEg6atBvC/xP1GFDz8AVAmY
	4=
X-Gm-Gg: AYBFou1D8Z2xSAExpRRBdxvibndGXOQn+1aPzLYa87J65ns4vnc2fUhKD+pH+xum+xR
	1DONVeBoc0E/MSJpUw3/N9O1EhMM8q32iTOwqWBFUCo5cn0aw0lRmSolTIu+1c8maHigBRrBSI/
	IiBNtG2P0lAF933UR60+EKrSFFDnI9noBFA/gZNMG9p2TrnwAzgNFOXLec/2ReZ8QPMQJP4dyQp
	k9H8fWwBwoNxB54u65+onOh+v8UOMznVGfm3mqwgYHOWXHQvC+xoPzgtmFvKUEVEbMUnEgT48Up
	Zz1Z2gY2UO51sXo3gRQ/0XF0CQedMCmXk0U/cQa6eR+CMTH9uH6GOi2mt4wzH/9i4uDxILKS0vy
	YZOy0034H2Td7foYlZT+H2Qv1jA==
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr12973454eec.11.1793106733575;
        Tue, 27 Oct 2026 06:12:13 -0700 (PDT)
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr12973405eec.11.1793106732892;
        Tue, 27 Oct 2026 06:12:12 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a14383b02sm7325798eec.14.2026.10.27.06.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:12:12 -0700 (PDT)
Message-ID: <e2147521-c736-4cfa-b482-e534a2a11a72@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:42:04 +0530
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
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
 <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
 <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
 <junlahp3txwwj2bs6pi3lhlvidxcp3zgvszb74xbciv4n4ymvo@tfyhqi6tr7mz>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <junlahp3txwwj2bs6pi3lhlvidxcp3zgvszb74xbciv4n4ymvo@tfyhqi6tr7mz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfXzWTMxx5//8s5
 Yf7f7VJL/LYOO9FntxDrRD4TAbxZPsvv45tyyOjYl26iw99CcZtnxCRXvk+f0daW/sR+mXbfIO+
 NDKXq313xw9M04ub4b5YWnuw0QPQ/XtNqVRmdXGigLdENYCP4O+AGJjiQj9ZkfZVKzSc8cf6MYf
 /euAfsslZS1BwFU+7+J3Ehusv1KSOBfuVKvHGorkM0ZDohzq4bF39PhMlmgIy9P22TKBVLcbV+7
 +zpc0otlKSjzObKZ3LY/8AaUWuBpdnUtGe5F5NLwIXs/GGSrWjGTHFqxccBN4BXNQP7DZ4FN32Q
 XzMF5OG82IGALzD2EM7aLT0eiXgeWPuRomLdFjOOL7HgOvLAOLD1THl2faRh8YOrKRiRcuLasii
 R69ahfEWRVsH3KRTX2d82JkCwQIYev8ZL3IMI4AepVZaBEipmY+DlijZuyUw2yAZe7wtZ+7ygnP
 kezns1IutGS/embyL/Q==
X-Proofpoint-GUID: 4g1AkThUxsfFOhh76MfCPtcipyMZ_O4a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX4dowMiRVOfti
 HVyH6gU3x9wuTQ76eM/2JdOJASOmeZVID2AXFLMgwApcVD4aLKpq8awx5W9EzQKHnOLlEZFPtWy
 gZZQ4EPyB00TfLfxn1DPVQ2vBkBParA=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0a32e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=hn2XikViVj-BPx_B1YEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 4g1AkThUxsfFOhh76MfCPtcipyMZ_O4a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270052



On 27-10-2026 16:29, Abel Vesa wrote:
> On 26-10-27 11:23:25, Sneh Mankad wrote:
>> On 20-10-2026 18:30, Abel Vesa wrote:
>>> On 26-10-15 15:25:22, Sneh Mankad wrote:
>>>> To make the MPM design more logical and avoid probe dependencies, the RPM
>>>> notification is managed by registering for CPU_PM notifications.
>>>>
>>>> Remove #power-domain-cells property from MPM device.
>>>
>>> Can you elaborate a bit on how the two phrases above are related?
>>
>> The MPM driver now supports two ways to handle sending the RPM notification,
>> either in the genPD's power_off callback as power domain provider, or within
>> the CPU_PM notification framework. Removing #power-domain-cells instructs MPM
>> driver to follow the latter path, which as explained in cover letter would
>> help avoid probe dependencies.
> 
> This should go into commit message, I think.

Sure will include that in commit description.

Thanks,
Sneh

