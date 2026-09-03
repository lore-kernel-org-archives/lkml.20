Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9043911AA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429563; cv=none; b=UGg718G1MCRbCpMPvlH4gKOxVf6nium7VYxNR98RfZJSBCrZjG8cJNxfS6La9akISifK8PetwLN2IiQaCQurQ1Im5U00qyTECvbXzTl6cbtzwcF1AKEFi+8bbzeiBPS+e+2/sGRtHUicjf8UXtO2P5YcJbzDshR3+XvlEvyGudo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429563; c=relaxed/simple;
	bh=pbjog5xmN8riuJFlQ0dfBcbLDgqQgdkXFJF8MxDSFT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgLipX2P9MQZOAtu6nA/twD/cFvbcShXNp2pM7EKqMHtx8NOpP3gCJ/Z4X6u/O0RLL08WnhZ5fYVbhXgmbYeNHawZKdTIVPEbzpPH/3v50ePLdko9yVRaY4Rv34zFdTpM4OPtNKektmhGROka91gulX+ipOjLfMyMQfVS9BsgpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bpZHOrO5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUHz7K8r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bpZHOrO5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUHz7K8r"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683929SG3612426
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f04oX5MQbZvupFil8uMvBtUok17PIJf7LfVOd1JT1YE=; b=bpZHOrO57j5b26D5
	5nHsmTjqlcXb1X/XkBai9ChgC3bYSeNwxF/DnKApRCbxs9dtRYQjcZP9ZuS1zFYE
	69Os+cj5i3WzZHXopLUrNX74qiEF3Iko326JEYW94qP1mN2C/q4VJwGg4Twba882
	anlASfllzLzkyn0TkyRntfWskEjQn0xvAZ3tkmAMUw4UVWZmWuVo/2YrC19S4RQ0
	hRBhUcncg+tleTqHVGytYAdvwMrCOWT92yNK+Ja3vG+lOVrXUJIxEBp3Udl8beID
	HBRs8u+lAPAIYBnlher1DsS+MyF3p5Z1b0lbjgfW2i1xKv9IitG18fwfTRs29wjk
	DExvOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdra24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:59:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so3073629a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788429558; x=1789034358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f04oX5MQbZvupFil8uMvBtUok17PIJf7LfVOd1JT1YE=;
        b=UUHz7K8rZCgrAmxFT9JJrlxVTm2tTGQQIA0bulHFlbjqXtIytctOB74ESa5mncVZXS
         bR+ViKuNtr5JWWSFMFNVjb0ZiCXm8gQecRFxHSA+nYUu4Bf1wbyAXzRgKnP6NHmPG1zA
         prBpSCvWlhLHB/E0o4EMYXVJbU4EUCB0YCMu5sjO/clCF11Vjb5rsPEJF4yedzgIshIX
         6b5Jyp6gnzHJT827PdckLym7js00iWdTlyj0bdmwU80br5/jdOcElNntYg5kdHh7wDLN
         fVayhQzDd7mcoqiM/G0NUkO6XK1rpDTVxFflMAfBuWkPAhKtvfDkC2UnL4mLGZlNJhyR
         HvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429558; x=1789034358;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f04oX5MQbZvupFil8uMvBtUok17PIJf7LfVOd1JT1YE=;
        b=pV4+GxUnacOEWdFGpIZ2W7aQF6P1CuG03NO4JrveiNNbWVthGzSgb4pZVkL9HTSvhS
         hMpFXkRpVyms+vf61vywFfdz62DlMryC+/8Vu7B+J0SuuEvVK6AV23zg7JepphNxhKFB
         t/Mt2elq5N7xxC0Q3D7sc/MASz0PtM5Bcs9lGzQupd6VE5SvjPweCWgWS1123+d0jNad
         ImQh/JCXIHIC8+YFO4tGKg5/a5OfZuzqBZDb9vzTxWcMdn7Gvjw7c0eAf9np+NTW8OwK
         VL+JBN7t94ccduBdhOtgKDuB3PI+EU/MuaPrZf5YhjUM34YYN4vtW367IfjAeR+99dUF
         oSSw==
X-Forwarded-Encrypted: i=1; AKwUvBxuHGWA1tAf857NcrsNAV7hMq3+94z9tnzAClPrPqDowv7PrHyIcX0hO6X8GEvZdNp4LYYVwFW9ADdV+fQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mPol23Z8N/GZs0REXEqcDqaZkJfjTmpnvFR3vq60dHI3ezwTLg
	KcagC9UVC5AsJq6Fz+6MGJJ2nVuxKCLOLuKrt6mAGO4hJ64gPI5IzUM2ERtFkI3vMMKasHbg8iV
	7DCSZGgzuzp/nnLgCVNPwmLrbRYRJADhw1HPPiyaLtUSOXy93Kb5JHVjq9VaGzsXvbDg=
X-Gm-Gg: AYBFou2690lPsjov01hfOsWw6FHL/BXg6NWDXEeDHFd9U1RZqJdo94CdP2uhPsvIwU4
	YN1emdo8npugV42v+fdVkUw6GKA9L5YAqcRjGysiTMxjqF6Mgtkd0if0zYFMe1Cf8rvxo4WNIOj
	gyGxK+zZCRZc+OnZif+78xpNLxxmiqd6iDPyB9Tdp5esio47baLwZvt82OzjKKru7s/ddGeUFq5
	9/qKj++S4yejYgQALJSoI6bkWsyvt4PT2Q2K44Vo/SR28tDdoOt4oebEcKOldNVL53057NcqdKV
	LCU5FfLtP0jfzXOPkvYyQUXYk7YmJ5ZMrkh0CC/yW956My7M5CZ4NrHmm3gG9PRY3zZywiE/BIu
	MUKCSpvd04f8wKtnNLw==
X-Received: by 2002:a05:6a21:111:b0:3cc:92d9:80cb with SMTP id adf61e73a8af0-3d9adec692bmr18368206637.12.1788429558361;
        Thu, 03 Sep 2026 02:59:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:111:b0:3cc:92d9:80cb with SMTP id adf61e73a8af0-3d9adec692bmr18368156637.12.1788429557887;
        Thu, 03 Sep 2026 02:59:17 -0700 (PDT)
Received: from [10.64.71.54] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d47e5fbsm703336a12.31.2026.09.03.02.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:59:17 -0700 (PDT)
Message-ID: <0e2d4957-cef2-4553-9035-70b9f1796e4c@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 17:59:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/15] arm_mpam: Fix get_cpumask_from_cache() to clear
 mask on error
To: Andre Przywara <andre.przywara@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-12-ea6397bead59@oss.qualcomm.com>
 <2ffd1231-2f59-446b-94c6-000fb987980d@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <2ffd1231-2f59-446b-94c6-000fb987980d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4NiBTYWx0ZWRfX5LCl5/hxUc70
 poLhoGac1GLOCjr1DMtqMjMjoE3ufrjDl3GURr7ReQ+7m3rDoeDxx1ICzwjdetOaG6DtWmK+toH
 1YABxwHFtQphhKnwHdn3PBr+DlGjzHw=
X-Proofpoint-ORIG-GUID: XTdE5iRtoHrUV4xdqhtO044dCAxdcNJ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4NiBTYWx0ZWRfX1kQBtbe6ABEh
 WXH6Q3JydY80flo0F9afrXjSr+34Xa9/qpp1EN07HSbdpT/625IAwfhuf6h/8nj9D9DFzyYKwyU
 B1UjavqoD5Tqh+WFV9aqksSlLQPaOz4GSH0HvYCg8D07edXhqoiEImUHKu+C/YUbUkCd6eP9lF4
 Asr/FBSS2oMDBljLXm5tjhgpO66ruDj8IiqAipgxQrYadQPLzJECFm4/StmetCxglKaBOpwO6WW
 OdY+LjyP/71LQHzIsz26eyMU1YbXal8mNzDhTFEruT41BJvsH2/KKhPF0SFgHn8cYPXrkVdcy/1
 jj+7P6/Fj1vRL0uJrjWTlDIZrzpH1lsDM/plqnkl+YWK8wqjRFPMTI8oILMklYpX44YFPEBQyJF
 CJxdRIoZzge7jSsZeTh7HGPUIRERIW92aUjnOBKiwAgaqw7d1lS1CKoUmLl1yJKDzfyINXPnnXy
 PHgnDiHCZCCB3N8oDrg==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a9944f7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oN0nXjMPxspDpnDYFegA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: XTdE5iRtoHrUV4xdqhtO044dCAxdcNJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030086



On 9/3/2026 12:03 AM, Andre Przywara wrote:
> Hi,
> 
> On 8/11/26 15:30, Yin Li wrote:
>> If mpam_get_cpumask_from_cache_id() fails, the affinity mask may have
>> been partially filled before the error occurred. The caller has no way
>> to distinguish a partial mask from a valid one, so it may misuse the
>> incomplete result.
> 
> But it returns an error, in which case any caller should ignore what's 
> in the affinity pointer?
> I am not sure that clearing the mask in necessarily the right solution.
> Either we leave it untouched (which might be tricky), or we check that 
> the callers restore or discard the affinity mask when the function 
> returns an error.
> 
> Did this trigger any real problem, or was it some bored^Woverzealous AI 
> review tool pointing that out?
> 

Hi Andre,

Thanks for the review, and for the honest question.

This came out of internal review with AI-assisted checking — it didn't
trigger a real problem, just the observation that the mask could be left
partially filled on the error path.

You're right that a caller should ignore the affinity contents when the
function returns an error, so clearing the mask isn't strictly 
necessary. I'll drop it.


> Cheers,
> Andre
> 
>> Clear the affinity mask before returning the error so the caller always
>> receives either a fully valid mask or an empty one.
>>
>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index eac3bc695fd1..d8856864e89a 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -243,7 +243,12 @@ static int get_cpumask_from_cache(struct 
>> device_node *cache,
>>           return -ENOENT;
>>       }
>> -    return mpam_get_cpumask_from_cache_id(cache_id, cache_level, 
>> affinity);
>> +    err = mpam_get_cpumask_from_cache_id(cache_id, cache_level, 
>> affinity);
>> +    if (err)
>> +        /* Don't leave a partially-filled mask for the caller to 
>> misuse */
>> +        cpumask_clear(affinity);
>> +
>> +    return err;
>>   }
>>   static int mpam_dt_count_msc(void)
>>
> 

-- 
Thx and BRs,
Yin

