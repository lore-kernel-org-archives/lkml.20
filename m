Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA19185B48
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161543; cv=none; b=ASnpVn4H8sU+B0k5nw/dPA5RX9TfvrzLGzuxKCIdV4mhPqOQ+uTocCNrqreg1IPydEsl06g2W3KIUhnJzdhIVW/QqtR3r4H52U3dgZGX8dinh69CffiaTeC6KBtR5KvKeo5ZGylSiP1VGXgvwWrNwUMwy7GO6c1P/L8dsGatgLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161543; c=relaxed/simple;
	bh=K0jycMTvi6wKLbEUqdHCJShvK5Y3X5IYyfoja2Jkq5Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AKjEBKG8vvl+necQitJL0jqcycVtzZ6LWW8RlqO6i9QAcALuKuoRkUbPDiPBt1QYLWpurNSomBQDLBeT2QEGXa9OF0QeY0GBNfgzv3xYYlChFHreI7FJ+38/LU4fu202V3MK1/0f0XCo3cZOGVGjksB63tssP6WO+pmBJhxBclE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l99FXg0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f37NjvnT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l99FXg0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f37NjvnT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3hVB1623776
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPqyhRbpOf17HmSBmiSMBHQE6Y0S0sQtUmXib+0l6+A=; b=l99FXg0UpAhzLGUt
	+6Q8K/jLHntnFymV2NDkyNb2/Ac43ZvW+fyp23PDom3wqiO4njAyx8gJ4Bm2fMUe
	PtQISjo3y5sp7aUMRcS07CoO/FWLVnAxtoRRAoDsxodbKSx2cSgOm4bHW56s5QLY
	juIVBFLoQCWfsQVkubqNs07OL1niyWMNpqB4zpsIilSQAP5LYzckvULmNlhJLR+w
	DG+odcyk19O50xFE9mDVW7S3qcTKpjRWr1tAWlIm2eAekQJmLYCvdEsabz1LNEv8
	1WUWQJonr6QZ58zmXiadyGqCYGoEfTVR2HlJIET+g+TmQVLNmZ4H3hrdeIo4BfMN
	aCw4UQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma3ht9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:05:31 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-142f4306744so2124922c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161531; x=1790766331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JPqyhRbpOf17HmSBmiSMBHQE6Y0S0sQtUmXib+0l6+A=;
        b=f37NjvnTuEebAGQEvNyVdI08JSm4uVzZpcAgYxPjOBGiFYHiW5Le8hfP0D3xNU8mOV
         S1x5VAPdI5Mq39dHx8S/1wHCVKXozqCXZKyurjE3XVLGSkZroaeMYTnUskv22pWW60jT
         W1w+fVPQNQs98UTjy4befa3kXpI9IANnFBHUL704p6QqCVxbRBQmit0owpxoafiPaX+O
         NSq4cFkKjTE3pwqgM3kLBPsbrbV3viOndvwxD6s5O2E+wSBn9XofmcjipVRppXH9kfHs
         8inM1uXOm3bpYQJNDQKBSAAZQ+o9czByRJi9Uk5ZKrhlcOImdDeWx7HV+1CdHvvD8fT9
         srRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161531; x=1790766331;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPqyhRbpOf17HmSBmiSMBHQE6Y0S0sQtUmXib+0l6+A=;
        b=M3IyTYLcIGiUGVz/O1MtZ6GRusA7yUeO3dSNLZxZcrOTJGq01me98uAWtXPOrdIALP
         00dv8qK3cYmmMgVzbwqBMXksmzCsnYmR4AsUjTgeJeKzOkxPgUmLig1kYL8xCzKywfY2
         MxS0TG0N8rSN6oKdQ8iSbhPvM7ED8+0ZDwyBATv1t1KyoTzyKxvKS7UajQ0F2jn1q+SQ
         s1fpFmKKFhr5v6BakWdTvi1XdKo6QIHJ2+UtU6t4V268cUaB5n+hp98YUKqiWxWHu6An
         k9AHi3HuaCgc3GWeFE5ZKQT03n9sa7e8biQyKEz9YzW8b9ddzvKiqg0CP3ytx/e7qzwK
         c3PA==
X-Forwarded-Encrypted: i=1; AKwUvBzCtt3L4P0zU2R0Ed8OM+hXzQJQNWmwfaROY3bIU5R5Vo4nMOFHmSqKKT0NtgjUDmCWdtAK8nfKBZt9YU4=@vger.kernel.org
X-Gm-Message-State: AFuF++l6djG6WS4gGqDgfcvCKk2WxHjsjzai5xZV9wEyfxMETv81My3e
	MNfq2rzO9v74L4MtUsgJ5lfo+NqoZfsGq3cP3YA7cEAIBLj5SqZpW/MF/aU8HYyZUT/m1KahcX8
	OJIOHE3E7ddlT/VAwPOTfvKBYsx3oUhbo9Bjl4uI7II/X7To7G+w60KirAbKTpaYY8Q==
X-Gm-Gg: AYBFou3CzdfyRFNime7NFpbPxrtJ6z7+U1R2Gbw+lR5uADyXEFnK/06gmILUYBCanlh
	nD8PKrDgr4Z46E1oUxhGwOREcd3gXL3lR/ZJzKEWSFr5vXetPw7GzmbGGgQvvfgOeK6eL3XGTtf
	e7dWDx8HzJlWSZtBfl3dn1FZk7ciuvWWW+Og0nVZJXasSxEr4NXh7DajGHy4R9g8Q5W6ZtRAAPi
	DmDDInOCSy0YqYstSsdIVUxhdOB2+u6Yu08OrJzirD7rl9bQzjK9AH83kywLPgaRPwJrs8Ap3Zm
	t2DAJsMx/eWJu7zSDoiUfla62WHkiMBN/kH5KECie0nsgdz9fDtOagerLWxhW9LzmXpe9EMGdL6
	6boPowlIua0MzHLcADrqKmnFTVymrNctJ8Bwr9xzS
X-Received: by 2002:a05:7022:7f0b:b0:13f:c02f:60b8 with SMTP id a92af1059eb24-144f9166ab0mr2272810c88.6.1790161530703;
        Wed, 23 Sep 2026 04:05:30 -0700 (PDT)
X-Received: by 2002:a05:7022:7f0b:b0:13f:c02f:60b8 with SMTP id a92af1059eb24-144f9166ab0mr2272778c88.6.1790161529904;
        Wed, 23 Sep 2026 04:05:29 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm7741663c88.6.2026.09.23.04.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:05:29 -0700 (PDT)
Message-ID: <1188ca90-d3c9-40ce-ae8a-56262b4192d1@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:35:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: Re: [PATCH v14 3/6] reboot: add parsable tokens for power state
 change reasons
To: Matti Vaittinen <mazziesaccount@gmail.com>,
        Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20260921-pscrr-framework-v14-0-a16290003b7c@oss.qualcomm.com>
 <20260921-pscrr-framework-v14-3-a16290003b7c@oss.qualcomm.com>
 <f4d2e209-1c89-447a-a5d1-92696b51b614@gmail.com>
Content-Language: en-US
In-Reply-To: <f4d2e209-1c89-447a-a5d1-92696b51b614@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -XPnB7E7ToxjU_IV3DVULx3hSC7W3Au5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXyV++sYcus4IV
 w+ixBAf2tmeq+4dkeVHVEzkGLgzm2Zy3KDmKGiihGTTTmXeyhNGPSpsNhERXwYwu2Z6b9YO3iEc
 nvmQW+/fKUMqlWP6u7Sxm9SXoyQ67W8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX5nk6XeIgEk/h
 YTHJjTM8PpSopFCaTTBp9XrrAAsrgFgDt3+3hBqpGaLxB9O+zw6i0QT7n2donalyLtIbx246tjy
 47EMwSwtq7NH/DTnos95kMe2xIp6hDCXJ/aCxNxuKBbK1t6g26vT268qiQidHbEKsKmQQef6oxq
 JoIreKeTBRU+1iK3FGxKiH/Dqwoz28aQGMbiSo0wQ7RBb/zwuP262+8S9wdiq0pXCgcnwQfhDAO
 UMhxNNnGycpsdrPrY3kZ4kaswWHq1Oj403HA0HRM3ZBiiKAsESqmP5WEUIf8gG3SciDFCdDEPul
 114f6z2Q4IxmKIV0Ucl5fGaLyoX/jjDDPLznSLwNGzpL1PMhGurkmIMl3B6iSkY1P9T3lMTkv/X
 9GFR3g/uLzhMWnq8WTO324962+HCQAH2zDwLxjIYOio0/Pxnn6lNF545+UMZea8KVGfjQLDE4Nn
 YKP/iXs3RL5QTHlZpQg==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3b27b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=6S1-GrwmiCmPnoYEXswA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: -XPnB7E7ToxjU_IV3DVULx3hSC7W3Au5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

Hi Matti Vaittinen,

On 22-Sep-26 1:07 PM, Matti Vaittinen wrote:
> On 21/09/2026 20:44, Faruque Ansari wrote:
>> psc_reason_to_str() returns human-readable labels that contain 
>> spaces
>> (e.g. "over temperature"). Those are fine for logs but unusable as
>> values in a space-separated sysfs list or as a write target.
>>
>> Extend the single reason descriptor table with a stable, space- 
>> free
>> token next to the existing label, and add psc_reason_to_token() 
>> and
>> psc_reason_from_token() so consumers can emit and parse reasons 
>> without
>> inventing their own string table.
>>
>> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>>
>> changes v12:
>> - new patch
>> ---
>>   include/linux/reboot.h |  2 ++
>>   kernel/reboot.c        | 77 +++++++++++++++++++++++++++++++++ 
>> ++++++-----------
>>   2 files changed, 63 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
>> index 08a7549bbc40..4c5327dd7645 100644
>> --- a/include/linux/reboot.h
>> +++ b/include/linux/reboot.h
>> @@ -244,6 +244,8 @@ enum psc_reason {
>>   #define PSCR_MAX_REASON    (PSCR_REASON_COUNT - 1)
>>   const char *psc_reason_to_str(enum psc_reason reason);
>> +const char *psc_reason_to_token(enum psc_reason reason);
>> +int psc_reason_from_token(const char *token, enum psc_reason 
>> *reason);
>>   /**
>>    * enum hw_protection_action - Hardware protection action
>> diff --git a/kernel/reboot.c b/kernel/reboot.c
>> index d5a45db82c3d..e53fb31bad06 100644
>> --- a/kernel/reboot.c
>> +++ b/kernel/reboot.c
>> @@ -1084,34 +1084,79 @@ void set_psc_reason(enum psc_reason 
>> reason)
>>   }
>>   EXPORT_SYMBOL_GPL(set_psc_reason);
>> -static const char * const pscr_reason_strs[] = {
>> -    [PSCR_UNKNOWN]            = POWER_ON_REASON_UNKNOWN,
>> -    [PSCR_UNDER_VOLTAGE]      = POWER_ON_REASON_BROWN_OUT,
>> -    [PSCR_OVER_CURRENT]       = POWER_ON_REASON_OVER_CURRENT,
>> -    [PSCR_REGULATOR_FAILURE]  = 
>> POWER_ON_REASON_REGULATOR_FAILURE,
>> -    [PSCR_OVER_TEMPERATURE]   = POWER_ON_REASON_OVER_TEMPERATURE,
>> -    [PSCR_EC_PANIC]           = POWER_ON_REASON_EC_PANIC,
>> +/**
>> + * struct psc_reason_desc - Descriptor for a power state 
>> change reason.
>> + * @token: Stable, parsable identifier without spaces (e.g. 
>> "over-temperature").
>> + *       Suitable for use in sysfs values and as a user/kernel 
>> contract.
>> + * @label: Human-readable description (e.g. "over 
>> temperature"), for logs.
>> + */
>> +struct psc_reason_desc {
>> +    const char *token;
>> +    const char *label;
>> +};
>> +
>> +static const struct psc_reason_desc psc_reason_descs[] = {
>> +    [PSCR_UNKNOWN]         = { "unknown",          
>> POWER_ON_REASON_UNKNOWN },
>> +    [PSCR_UNDER_VOLTAGE]     = { "under-voltage",      
>> POWER_ON_REASON_BROWN_OUT },
>> +    [PSCR_OVER_CURRENT]     = { "over-current",      
>> POWER_ON_REASON_OVER_CURRENT },
>> +    [PSCR_REGULATOR_FAILURE] = { "regulator-failure", 
>> POWER_ON_REASON_REGULATOR_FAILURE },
>> +    [PSCR_OVER_TEMPERATURE]     = { "over-temperature",  
>> POWER_ON_REASON_OVER_TEMPERATURE },
>> +    [PSCR_EC_PANIC]         = { "ec-panic",      
>> POWER_ON_REASON_EC_PANIC },
>>   };
> 
> nit:
> Is there a reason for having the label as a define while token is 
> a plain string? It may be just me, but I would have expected the 
> userland contract to be defined in a header. (It may be just my 
> false expectation though!).

Thanks for the review.

On token vs. label: I'd prefer to keep token as a plain literal 
in reboot.c. Unlike label, which mirrors the shared 
POWER_ON_REASON_* definitions and is used by code outside 
reboot.c, token is introduced by this patch and is only produced 
and consumed by psc_reason_to_token() and psc_reason_from_token() 
within this file.
Since there are no external users that need the string to be 
shared, moving it to a header doesn't provide additional benefit.

> 
>>   /**
>> - * psc_reason_to_str - Converts a power state change reason 
>> enum to a string.
>> - * @reason: The `psc_reason` enum value to be converted.
>> - *
>> - * This function provides a human-readable string 
>> representation of the power
>> - * state change reason, making it easier to interpret logs and 
>> debug messages.
>> + * psc_reason_to_str - Human-readable label for a power state 
>> change reason.
>> + * @reason: The `psc_reason` value to convert.
>>    *
>> - * Return:
>> - * - A string corresponding to the given `psc_reason` value.
>> - * - `"Invalid"` if the value is not recognized.
>> + * Return: The label string, or "Invalid" if @reason is out of 
>> range. For a
>> + * stable, parsable form use psc_reason_to_token() instead.
>>    */
>>   const char *psc_reason_to_str(enum psc_reason reason)
>>   {
>>       if (reason < 0 || reason >= PSCR_REASON_COUNT)
>>           return "Invalid";
>> -    return pscr_reason_strs[reason];
>> +    return psc_reason_descs[reason].label;
> 
> nit:
> I would feel a tad safer if the psc_reason_descs[] was always 
> guaranteed to be initialized up-to PSCR_REASON_COUNT. Having the 
> enum and PSCR_REASON_COUNT defined in one place, and 
> psc_reason_descs[] initialized here, adds a window for: "I added 
> new enum value, forgot to update the psc_reason_descs[]". Can we 
> add a NULL check or are we on a very performance critical path here?
> 

Thanks for pointing this out. I'll fix it in the next revision.

>>   }
>>   EXPORT_SYMBOL_GPL(psc_reason_to_str);
>> +/**
>> + * psc_reason_to_token - Stable, parsable token for a power 
>> state change reason.
>> + * @reason: The `psc_reason` value to convert.
>> + *
>> + * Return: The token string (no spaces), or "invalid" if 
>> @reason is out of
>> + * range. Round-trips with psc_reason_from_token().
>> + */
>> +const char *psc_reason_to_token(enum psc_reason reason)
>> +{
>> +    if (reason < 0 || reason >= PSCR_REASON_COUNT)
>> +        return "invalid";
>> +    return psc_reason_descs[reason].token;
> 
> Please, see my comment above.
> 
>> +}
>> +EXPORT_SYMBOL_GPL(psc_reason_to_token);
>> +
>> +/**
>> + * psc_reason_from_token - Parse a reason token into a 
>> `psc_reason` value.
>> + * @token: A token as returned by psc_reason_to_token(). A 
>> trailing newline is
>> + *       tolerated.
>> + * @reason: Output; set on success.
>> + *
>> + * Return: 0 on success or -EINVAL if @token matches no known 
>> reason.
>> + */
>> +int psc_reason_from_token(const char *token, enum psc_reason 
>> *reason)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < PSCR_REASON_COUNT; i++) {
>> +        if (sysfs_streq(token, psc_reason_descs[i].token)) {
> 
> I suppose my comment applies here as well.
> 
>> +            *reason = i;
>> +            return 0;
>> +        }
>> +    }
>> +
>> +    return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_GPL(psc_reason_from_token);
>> +
>>   /**
>>    * __hw_protection_trigger - Trigger an emergency system 
>> shutdown or reboot
>>    *
> 
> After all these years in the business - it's hard to be as 
> confident as I used to. ;) So, I won't say [aloud] that my 
> preferred way is the only correct way. Please weigh my comments 
> and decide as you see best, this is "good enough" for me if you 
> don't agree with my suggestions.

I agree with your suggestion and will incorporate it in the next 
version.

Thanks,
Faruque Ansari

> 
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Yours,
>    -- Matti
> 

