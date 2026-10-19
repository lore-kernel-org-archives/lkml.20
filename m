Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE624FC357
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419000; cv=none; b=GZAB3EW95O1BQWaaUzQe7BQxrpULkieoIkCrKP0I639k7DKLmdCfUgLaIAsmoGF3jxFXCScLlVqHIYe4QxULGmO0rz7XFnQ8GmdnirFtBykZ8mFM/PDlOY6bzsB5349BkNbY+66DSHh6rPAAsgpHDHsbg8cdbwAXw0x8gm+dbTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419000; c=relaxed/simple;
	bh=2zRswY1kMWQs0gXfYi4Jh01yqYcUt3kjlN5/njNXAJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DtS10LoF2jAEt25F1KbH+hDcUaE3leHWz+zcOHZrmn1YARLBEqzpLYdf1U18UU0NM8hjDv3f/IazKs5OTtLQ48aWu/ljOLQ1+VxjzgKeENuuy19tB3fhtsUqCJuCDWdsy4uQVpB5h42APZIlTCPb69kaMqXptiHulDqOi9og30U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gv4xxKaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4MAUhmr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gv4xxKaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4MAUhmr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0mve1457380
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouV6+Wxc1injxeExVghh4cJm0g67UbarNcdMufji7eI=; b=Gv4xxKaj8Cit20k/
	57e2jFRI5tvJOAlEdVycQAm7aD75a6O52Om3wlOvEffPEIz+R0cn123su6ldFroY
	uRCx/1kEWkanakST5W+jF3LNsjT6A4HJTgNuFzwZHm9tHl0YpqhZARp7YiWs7Dvr
	TXqdcIfDJwEAq+Yy9MF+4Pn9WyIU1y4JkwdQ+J/4MMz+yMFLx31NdZp0pcSi70fc
	pcSz3jny5qvDcEVP+/z4ILWaxN4gCuNTASCuxVdXLB2XBz5k/Ow+fj6MuWuxiUFw
	iqQJHvVlIJTLfWaju/LyZAyvF4K2GkUmGJvcoIrwdjEJsTGer+dMo+bA1JWO1jT8
	eSZsvA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65hhuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:09:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dfb24dfedfso19432385ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792418998; x=1793023798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouV6+Wxc1injxeExVghh4cJm0g67UbarNcdMufji7eI=;
        b=h4MAUhmrU82l6rJ/SL3QMlLa+Ewc9MjBbvuXWUiiHrcHg7vS7OOucEiXE1qmQfUjSM
         4K0rki5l7HQVpsjEye09we3SOi4uTm7ocB7vQmyHQWb6rWTFCRRaBbRXQH6dNbgYl8H0
         TNfJXlIL1zsE1PYGa37po4rh1H5XnVcQgq0N/o+U5wtI8B5bxbtetNA2w/FGrd9mrVT8
         kL2j/OvWTLnWwzDe2mVWnAWdHKzZF/2GPt+UlpWmO3y7KxiKLaRIVfTLQTzpwJGzcS0+
         lEIQiKGBQcH20m+H7csNyt7b62nIYSvd7xZcjUNYVbaLhW2fSl69nX4FzJomlPQaDaJa
         ORwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418998; x=1793023798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouV6+Wxc1injxeExVghh4cJm0g67UbarNcdMufji7eI=;
        b=bJzvitrWPNyVtRAFWyWySW9FUxRhSSF8/p0CNDXuH3NBA2GHkZFbt/bJbdwejKW/EE
         VDoeELwNBbuTZ3PzlFzBmPNP8jfSF2hMh8HGfEeGAzNJv3ELvun4IYmumqu+CqpjLKhw
         mEkyAKojV+6uxJN1TnT5HvIbUIV0v8gYy90ekr74APXCJWxTdcY1B5v0SA6pmpQoV4bI
         3Yf+GrtzCFEQQ+U8P0sP7N9nor7POaQxyLvA75DdYWiHTutiYdmda5/UG0Oex7y+0/B3
         U4doYGIkn6f6Af30iuU8wmwz1X4FmR/aesdU0utOvWcg4PYNV12mnVqoyGzWmsnyHamY
         Xmng==
X-Forwarded-Encrypted: i=1; AKwUvBzXtxGq14DnuUCuK6a26jSW+vs2+NGcXs5y/3ck2vhTgNJed/8sTx+mXlwICPDcZYi5VDU4NDWp/DcOMmw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIEG+3L30O1GLbDuAnDSHEIDoox+jX4TXNjSHhZotHbGZ8m3pU
	tKSXgJoRwqv+HO59ZrA+1GYB3qmsILRToIiQ2NwzNnSJgTkGcuhE7VwucaSEwswOzCxTjL+SULU
	EuKJqaNBp+FwvQGffHGhF8QSOWvFRVmcgmQ9FG/3t/YQ9JDG3iPE0plJtoY2bGEAfhjE=
X-Gm-Gg: AYBFou33T0cA3Wz8CO47wm5ZlRWmGMAss4KGSb9y+v/A4WBIHb95iBZVyCB0PPtgZch
	ZBfGMC7lM9CQZtM2Ltxuj5LX+oAVgtSE5SxmiaPTg821j1H3owjf4WW9/VgD3ptUkBqB6uqOt4U
	IbF7pVr8xeVTdC45+N93GmpZKbnQzg6WA+aGuPEIwwQTrreAJLEnjzuqTpSq9L5BQdZBiI6CjaR
	kID/Nup2p37NEE7lvmma5jQqR83dvfT+k0dT4Lqrcw/I22it+gfeCmO9Zv9FA0j4w1l6C9ahG8U
	7JkGwVzRDBUZqafECBr3NrKKGDdyjJOKahZps5Eq3XW6+HuDD6ZTA+6BSBQDxsD7t4MAJg54J6n
	JHQFxnkx8YJWy8v6ebFt/5ENlU+Lk
X-Received: by 2002:a17:902:f54a:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2e9a6c24bccmr68072285ad.54.1792418997292;
        Mon, 19 Oct 2026 07:09:57 -0700 (PDT)
X-Received: by 2002:a17:902:f54a:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2e9a6c24bccmr68071855ad.54.1792418996622;
        Mon, 19 Oct 2026 07:09:56 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.233.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b09sm1459455ad.69.2026.10.19.07.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:09:55 -0700 (PDT)
Message-ID: <84ec68fa-358d-4339-aefd-ed100a4b7da5@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:39:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: thermal: thermal-zones: add
 hardware-binning trip properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-1-5a29be7e8ec5@oss.qualcomm.com>
 <20261013-jolly-abiding-wolf-bab43e@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20261013-jolly-abiding-wolf-bab43e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX+N/DatB3E3iO
 dIz/VeBVAcWYZpwMCzwCYmt4rw/DKDLPpYr6eWxnKBDqD4a2cxEutX7x1KvQlRLf6Lwr9oKYtUl
 1ReLMNpfp3MYqPFogntWyODHFnrBMT8=
X-Proofpoint-ORIG-GUID: d9LuNWOOcVSNHOs6tcfH8t5WEKyDO2A9
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad624b6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=A3JsiXT2jxe2NWqPQ1aCbg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-zH7FtNjIyeSShpWrKEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX7FxuVBptteTq
 GtsSf07vFGiJZhvMGOhFhl13+DfNKZBKfOMS5QFRcRVAxR7ZV54PsQQp0xTehBrwirPWd8M3UtL
 MNlmbjO7ksq2fhkQeprCIx+WPTMElXjADzHHXITNeitccDX8msiLNkXA9POKSsYEGRqMzrTkNwx
 5/cFaQozsOdswBYFbSCI8biAjUWj7Vg8nU3cDdBK7ktmf2h2FdwUmCp9yVIZ90MVFxDWCW26Igy
 QB2MF3hAbpd3PIzWj7hS+vqW+wwDlP8fBA+8e28h+tj5rfz0QNzRoetFPy6dRO4RSix/oydnT0H
 aESMBj/gDzoE4Mb+PSXYTeskFzoaFXDzSuMHVbqet/axACISouRR0hwP4UHCONQxxuAxx0rn8dQ
 w47ULqGMqDvTP0YErZUeQNjtMuQ7jSlfMp77zbJjg9hbAdJigEyTDJH0CeF9OZUjs8u10fuHyBq
 THi7KcxfffNMAXnUNUg==
X-Proofpoint-GUID: d9LuNWOOcVSNHOs6tcfH8t5WEKyDO2A9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190056



On 10/13/2026 11:54 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 02, 2026 at 04:16:56PM +0530, Gaurav Kohli wrote:
>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>
>> Differences in SoC packaging can be used to provide multiple SoC SKUs at
>> different thermal and performance characteristics. The underlying SoC
>> remains the same except for how much heat the packaging can dissipate,
>> thereby influencing the critical trip point at which an SoC SKU needs to
>> be throttled. This SKU-specific data is typically burned into fuses
>> during manufacturing and can be read back at runtime.
>>
>> Add two optional trip-point properties to describe this:
>>
>>    - 'temperature-bin': an array of per-bin trip temperatures, used
>>      instead of 'temperature' when the trip depends on the hardware
>>      revision encoded in fuses.
>>
>>    - 'thermal-hw-bin': one or more bitmask groups describing the hardware
>>      revisions for which a trip point is valid, modeled on the
>>      'opp-supported-hw' property of the OPP framework.
>>
>> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/thermal/thermal-zones.yaml | 53 +++++++++++++++++++++-
>>   1 file changed, 52 insertions(+), 1 deletion(-)
> 
> 10 days was enough for replies to feedback, so dropping from patchwork.

Hi Krzysztof,

Apologies for the delayed response. I was away on leave.
Working through the Sashiko comments and will post a v2 addressing
them.

> 
> Best regards,
> Krzysztof

