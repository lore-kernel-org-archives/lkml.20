Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D756245561F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128375; cv=none; b=VES58M/IpSF4FiBYbJ242/rnxwg2UdWQGBetv4V/3F3YVSk1KKOxgDrYEl4sLxr9N48jbvNJLfPmfjB2hD/6wzOWxMsxjuFQ0ppKURoT80Yvg1D0FvhhMSLbxAGkMZrWwxjgB03w2yiPGCmQQr/6CDqbvxipjtnrsmYgB0mfbH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128375; c=relaxed/simple;
	bh=XJUFz6GcwNRW6BTf0nycvvgZK23d+K+rSVUyrEhtYKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcaGw2Fp+V7w+F1n17d12yFzo9PsNt0md4O1tmO0llKHDBrrDldBFBAt5H2pu44GpONJaBb4/RYm4hCC68EhjAKQi49XB/k+7jSJ0da7dc9JzvLbla8JgOXYPFrez10npZhFho3UFS8MXrOH09rrQMJHsMyt68gkcXIc6hTeoO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOhwOsmp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRp5heHD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOhwOsmp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRp5heHD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BAqEm04105274
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgrwA1Z9PHyXQlqTdlGnhADBDGm+J8HYNvXJ8nGfO2Y=; b=MOhwOsmpU0rKdFg/
	wI9UqRpQDnxjD1nycjH4fAKO5N+x2PzVEFKY2M+SmAJLcD6wUp47mB6DD5da2504
	7JxIVOKHXMLc0dyyypBVaTq7vh1IPuBM5kFZUpCkYK7dzA+5QHQXF4LDIr2Uh5dl
	MgIZwpznrQ+SVYtAxBVVeuT7Cw9rN6mZMnFORRYSN+aHncB5vvuD6m5vwPfPfbXA
	QPta9SyQSWU2842bWUK2pJcewB6KkpD3qZhEIKRJ0gAHxROuyJFljddga1fpIEBL
	ten4aMJqjbaMf9R6qIrUlSbTQWYUxpZTQFUg+gtf8wvOL+4mPEYvkFamiah1EKfG
	PUR4Cg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg1s83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:06:09 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c83124d530so1005291e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789128369; x=1789733169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgrwA1Z9PHyXQlqTdlGnhADBDGm+J8HYNvXJ8nGfO2Y=;
        b=QRp5heHDmT5UwlD2j54rf3rcKQ41EiwNtXbLVs3A0lPbOskn7FBQrHD4KYPoPSN8Lr
         nR1WfrAeF2L4VrkmLui9NL6blF1bwhpGAxdEiPmLqihIylD/KI+wVBeejrf4pxm27zwz
         XW2SuZoqTgFF4soawAjbN28okFQpc+rYvXRm5EZJNPBtkFTVp7skzjg5lAXe4KybI++a
         nsB38w2v4DVGQG2AhXvj8H8unwx9+xcdwC0GTp+DNUKhVMSunXmc2ZqIfnDQ5OvemBBa
         3mTsNeJ7mPjQ0gedyt/pIZEg7lxT+wfB4KloUlnXrIfG9r4VYU+ZabwIa6L6JKqbz/sy
         il2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128369; x=1789733169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgrwA1Z9PHyXQlqTdlGnhADBDGm+J8HYNvXJ8nGfO2Y=;
        b=tSXlGv5Kn6VrAng2Ry08SeCXZjO4qpvJuN0ngSvx3i4L9vMWH3GBtrXjZvquoX4T4X
         BTOlybeeNGqnp1RObX9hxfuREXbn5ElxMIAaJX0XQDwqcMNCq6rXkVpQUg08aFRHSTQb
         WxCtmbF6VzQIoJ4T0et9VzPMop9mjtnlr87Q9IWwnJ38qzXDouWwq9XXdfjAWMCNBNHb
         wROK6LEb4X9bHiMgST6pN4WjtEbc8jwrmnZ2gwHcx82cLglFXcIOMGMB/V8cFCNDF9r+
         4F7j/cam7VuUlXhzPO5NaDokACmDiPN+51jexPtb5E2LHhYczP9I2IWyJjbvucDpq8fn
         kdDA==
X-Forwarded-Encrypted: i=1; AKwUvBykJ9g0Sd/V1rlyrGaPgnasYvTR5MuqD50tZQQoTbkf4j+dVk8vLeq967EZsgMXdDS/+Q1+iziLOtlYL1k=@vger.kernel.org
X-Gm-Message-State: AFuF++mfvR4wBH7nkBhCATvhZC8U4K1UYUyE5lInwuQvWo7dM8vNtt3d
	yDC7kLzEc9xS38ufoH3bdv5ryZTKR48rJqWKWGEAcbbS9qHT3cS4iZNThYo0BRzrjkPEVJf4JY+
	kac41lnXArtIzqcgVWmsIlIYYNcbGS8vqe0sTxoFIpyrvr7+JKcp9T/tSAaVvrcovzRZiOinN4J
	E=
X-Gm-Gg: AYBFou05AM9Qpq4KEPBJ0j401iGfy5rWSyFJ9Js0AhRf8YMdh11JCZH+NlMOirtQJxK
	mS//yIZDfMERFEQ8mYsWWvZDwtuv8TFTpPjMSbBxnnkaof70TAHiu646g1a6zB99640Mbp8EOE6
	tM48gY9Yqqnjy3oYU8iB6G+P/sfP3/Xv+fkPgsO4l98rGxjPTYaYa5c4zoBytNQVYR2iIKWGQXz
	Fh3LRxNb/uGHmGCRX105juhbhha6usYMkxi93++5kYJifpQGcLmDqGEtid75g7Vn5b3geLURYF4
	9kL1TRe6BSSkumRDu3y+BqHXaZin86CtcWElyHMoJBcrQpxmr/quj4zj/cwdq7o1sG+5nWog5sq
	NZyLvOp+PSt5eeQuOAUr8AyIvtItf/aF7g5T/vpGjg+IulBqV/tkjNtXea8mcxQY=
X-Received: by 2002:a05:6122:e20e:b0:5bd:a5e1:c7c7 with SMTP id 71dfb90a1353d-5c84606e9afmr5296234e0c.1.1789128369345;
        Fri, 11 Sep 2026 05:06:09 -0700 (PDT)
X-Received: by 2002:a05:6122:e20e:b0:5bd:a5e1:c7c7 with SMTP id 71dfb90a1353d-5c84606e9afmr5296158e0c.1.1789128368909;
        Fri, 11 Sep 2026 05:06:08 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea4fsm5487308f8f.21.2026.09.11.05.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 05:06:08 -0700 (PDT)
Message-ID: <b84c1dac-3774-4d17-a1cd-90323c7faced@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 14:06:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: Fix power limit documentation
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        "open list:POWER SUPPLY CLASS/SUBSYSTEM and DRIVERS"
 <linux-pm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260821153949.2914201-1-daniel.lezcano@oss.qualcomm.com>
 <aqHQPhfxUkJlQJmv@venus>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <aqHQPhfxUkJlQJmv@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6RTSM3l6A-rhE7AsDspdFkDlB9EYhl09
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE2OSBTYWx0ZWRfX/hvSlh93f+Y6
 Z0aQhZp0IKjSClK2lmu6nWTgS+vy8pQjIb8+V+UsKmQwMu/EB4G8XKqwXkFipl2iMOMW5IG5gWg
 eL8YuSebNUmAaWys8JqvwmvuNJ0ONOM=
X-Proofpoint-GUID: 6RTSM3l6A-rhE7AsDspdFkDlB9EYhl09
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3eeb1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=yhNJaBuevSlPmpvmu6MA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE2OSBTYWx0ZWRfXyv3c9MzwqhMt
 d9egdHKeBFkx1KxbKr5GGHPcS5CSJg7v4pRYhmaLZKWzlrVMwl9vLlR9TMXAbnW+M7i5r233oem
 AFLcOSyiY90vUEYigK4JNHr5zRCXQCSyaBiscOzM7VqguQooz4KbtzpOXB2JRWLS3fahsF5oWCj
 Qt5FwozmETp4prYbo2Mi66cGlni/Ho2+LBZb/gNVGuZV8+Yh9cvo7YyUJ8HTUF/IaPhBzeRMCpB
 Cgy/RdVA4wd7/go6X+UrnjUDgxi6HWcJW+6Ez9ngq+3STGx2KJNwwHwnGN44MTp+bOeCkMMQyIX
 0pGg2DTOcu+Lzo/nSJqKNvDaBHfxYEw8TXIiXCgT3gPamTJAMn+yxf9UgwI03hBASkoiMdNFjdk
 2L46pcrP8sy9pmBx9rFc/Za+vweY9swJ/Z4xKx62ne0WqZTh+G7gaskQoMkTmJU1TaHc6KTIpAL
 Rcrqx2Xy24AiSmxxWpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110169

On 9/9/26 23:33, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Aug 21, 2026 at 05:39:49PM +0200, Daniel Lezcano wrote:
>> The documentation for the input current and voltage limits recommends
>> using those properties for problems that can be solved using a power
>> limit. This contradicts the recommendation to prefer input_power_limit
>> for such cases.
>>
>> Similarly, the input_power_limit documentation recommends using the
>> current or voltage limits for problems that can be solved with a power
>> limit, which conveys the opposite of the intended meaning.
>>
>> Fix the wording to clarify that input_power_limit should be preferred
>> whenever a power limit can address the problem, while current or
>> voltage limits should be used when it cannot.
> 
> Patch LGTM.
> 
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
> 
> Is this intentional?
No, my scripts again ...

Do you want me to resend or can you delete the kernel.org one ?
