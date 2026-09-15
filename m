Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D023475338
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464215; cv=none; b=SsLWW02sjFm9YtyNPbqmLcU/pB8By5hcihFDCZG1mol8ScBUg5yUFFJZHBIp9gtgck6unjZEOEEBCKnrgnDfdP6rQvUhplGPhK5LRX9l7FCKQG+FezUKnzjuGi65LOV8rNfSWnD7oDu3AJ6yJTv5yE9Qs1+/tIp7k0gHttsXrxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464215; c=relaxed/simple;
	bh=k+B6OmVSZRHF/7PniO6p8HutiPOy9at7ASl9vPW22Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9ta/9rv2Vv314WENzGsl8IY4ap+xGL1Vt8ZgnLI+xOfjAUseQtyuFo8hJCEUjMWrjGBWha4lOkeMu6xeF+kGFSskl6KRPwiZ6qPtuz5Iz43wVcjHOhSmodIXic4CgrhIghFAuywPP0gp+9wew6YAlJz5teBlXfPRyWr50G+iRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvBAdIxh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XyB40/RQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvBAdIxh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XyB40/RQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7vH2167822
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5n50YcPWOwyVacMh95fTxMW4+kIe+YWNsQL2QT+trI=; b=HvBAdIxh2Kp/+5m6
	LNzP9NgnaHxpNQK/P7OrE/guR2KqcL3Had2yRgXxmgE4MuAKkdKNYaad1YV1Akkk
	N3dWH9oxOKTbdDQl+eEatyxEeTkq1PMMhipEnMEwzHBlCcQ8c7a+rAjoyhzMvbI/
	7c/BeI4koMNzcrsquPrDw3++2cCrKfUVaiyQbir6et1hqB5CBifqe5sLalSuYz8b
	l5tEaTj8L4tC98HiwFvq3SvmKYkIU5agRE2zae7URkaQaLi4VUk2U+M9/738444f
	FP9vRKTJ4HRFv3ygyb3t/bPXYhb5Opf7U5lztpxbzE4Duxus0lpb3oIgDc4PUK2G
	F97uFA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s99uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:23:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86917d18880so6611974b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464212; x=1790069012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5n50YcPWOwyVacMh95fTxMW4+kIe+YWNsQL2QT+trI=;
        b=XyB40/RQwfLUnhMMPFiQNq6xnneFQ3zBXJ58qtkJgyfIAQPWsNQjqFDb2C4nTHIN++
         TrQ0bSWUxAM/OJODFXLNDdVfylg5uLcaRuJ32u68bPkC/h7A9rG0/7EPgWSmatOfKnmK
         6aFd8eT/NAez+K3DQCZYs4DJMG2wDPkVKgXKyX7vNIjLJUIJBi+tTQShraRx+0rgv/aQ
         yz6it1bAQhXkXw9QhZGb8HXpCAMmx8TpKbvBpu1+BKPImryYYj6zMUUmYp7wC5ZXFv8L
         7pbS9S1u2PTPPZtkL8M35XI9Dwu+vubSSQxM/tE7IFtsjxjEDnuBcwow3QnMGCeomcV+
         vLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464212; x=1790069012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5n50YcPWOwyVacMh95fTxMW4+kIe+YWNsQL2QT+trI=;
        b=INNItbEry80fZCeIOV8KrxsATT/2y546wy/ZKCbli3kbsGN8EugJDQMFyjbf5qJIFG
         3ne9ZV3V5g6KUNb7ehMiqEJ94qMrStQ45lrimJgvOLR6p+i+0Ma4B/BdwsFv0K+egAdN
         bN/6911B1UcRJBXeYpPfCMGQMrlVh+N09myyxhLhgZxBl221OlexFU7qeKdle46vT9TM
         Gz6Y59juOM1vjWzzsruafrnLsKFmvTC6vp2UxsG0NSnG2Ube2bOKJ3g+3blIGCNCGvay
         hjEHLKk/F/nC7YArCRqE5B3vOAUcAtxvvb/i5IB6pMFAQPBwFattb6Nf/HCTxZkX5JDO
         +UWw==
X-Forwarded-Encrypted: i=1; AKwUvBxBoiNn+2i12+MNyFp6WGe3IssUqbAjbzjBE4EHCq+Q+9EZSqPn+V4ybZIZ83B1ilUNifVjmdLIwvs2VLI=@vger.kernel.org
X-Gm-Message-State: AFuF++kc7s4AvH5MxqhAiUnmQK/wtROLEJPik50SBUR0OosSKE+g1SNJ
	3oDTj/TauNzuEUoPjmJzdy07p10Uayn2T54JBIaa6d7pMazpH/s8ewbQyK1ACE/mQGsnBxO4phC
	F9icrdOfzcUH5x6Kj/22jmig8xSZLK4ldW/iHTBRiYvO3jpKUTNn9MxfmyeDTMfN1OTg=
X-Gm-Gg: AYBFou15/E3hnb9hGg+Rwb0mPF5Zu/hkRT3zbgnMyxMUgJnQgu8tXtw1gZ9fuSuN5Qo
	CLIBRC1nXO/IXEuZtA8NW9ApIbsyq50AOQqHKmg9aJiloAFN5hpuM50ESrKD4zod9kr1FcDCkc0
	f0wKyZsXySTh0cxezV/+l2VY0FgzlndEkFD4qu2LhKS6tWBd5kNb4JWpWi1N0BMhmvw9vMAy7Di
	aj8G8JJdqSDqmJCmLyKlgpO9MNekjkId5j10T3IjjgtXrcI5bPzWYFMLK+yIgjys2X63ErQiiuu
	kjTJUjMkvLueteNASOETVhgMrlIELwriERu583rh8M2V5n/xZyUf0wcMFsYPwPERS76gK2o3B77
	Z9+hWAJoOFkv0e7ZRnZk3RK8=
X-Received: by 2002:a05:6a20:2d0e:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3db4039fa7fmr15609049637.6.1789464211807;
        Tue, 15 Sep 2026 02:23:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d0e:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3db4039fa7fmr15609012637.6.1789464211403;
        Tue, 15 Sep 2026 02:23:31 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.86.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ee07f2sm29591306eec.18.2026.09.15.02.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:23:30 -0700 (PDT)
Message-ID: <73db10fb-7778-44be-aced-562aa1039404@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:53:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/2] Monitor Yoga Slim 7x EC sensors without taking
 over cooling
To: Birk Skyum <birk.skyum@pm.me>, Sibi Sankar
 <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Daniel J Blueman <daniel@quora.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908135801.81436-1-birk.skyum@pm.me>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260908135801.81436-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNCBTYWx0ZWRfXyfFKsepdKso5
 qynBnpJ9BhfGLYIwZLen8+Cc2r+ivlgiumMF6QvkCXaSQ+RDNlWIuQu7IeUvocgLu5xpOM1m2jb
 iSJVcgQiw7J9Q0mnft15Wb2ASfuGVjQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNCBTYWx0ZWRfX/0GJInyUdatW
 //7W9JTeQ7XAmob3kJ5WJqCNqOkgNvwn21+VwwlECWD08kOBnK/OjbfyrmhuLq4ke7v9eWtjcTW
 uSpNWza/+Y1IP965jKij/UlKOAJJ1lXQBLsuBfM6w0O17t5EpdlbrrNRl6l/+gqiKyHVFJ1JTaU
 mkFJZWaRJZ5R3r8fuIxDGkHEFVYFV52Yn1cD0MNMkYQ5dqkOm2N8xw4cd1Q43v4t8wZBnzItqi8
 x4ntohEMNhoYfA89xeWi2c6iUfTbTasxXvTE15ni4NSN9UYQ3GqXSx62NfFtgsyCtDvkPmzdslF
 Op0KMBTrQ9wmaI6FpkYqkTGHuyLEv0y6K8MqObU2fmATNYh6v8yquyu5LribaXqWVtDfp6BJzpF
 /d3O+GyD9OBE3d5nXKAw+GKd1f0x+SHkchrlG3YgMIbcRqxMLw+3mPiLhXdFb9PqTGXDbBwptw3
 uAaCFj5ZCiO4rkHqKqg==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa90e94 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=YsbRjcmUuq6dkflYeO58cw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Aa1CV5B8TMOsY60AgGoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Z8L46hnnMnsh7RFQXYwfYABC7pyIbXFK
X-Proofpoint-ORIG-GUID: Z8L46hnnMnsh7RFQXYwfYABC7pyIbXFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150134



On 9/8/2026 7:28 PM, Birk Skyum wrote:
> Two design questions for this RFC:
> - Is this read-only match-data path the preferred way to accommodate
>   the Lenovo firmware alongside the reference-board work?

The read-only match-data path looks fine, but it should be integrated
with the existing LUT match data. We should not replace the current
match-data usage.

> - Should the pending Lenovo binding omit the qcom,hamoa-crd-ec fallback,
>   given that this firmware cannot satisfy the reference driver's probe?

If this firmware cannot pass the reference-board thermal-capability
probe, I think the Lenovo binding should not use qcom,hamoa-crd-ec as a
fallback. The fallback should be used only if the device is functionally
compatible with the reference-board driver, not only because it uses the
same EC chip.

In that case, the binding changes in Daniel’s patch also need to be updated.

-- 
Best Regards,
Anvesh

