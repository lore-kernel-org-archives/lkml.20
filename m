Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7BE4A8434
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636797; cv=none; b=aSRrMJAynt8W6qYNV+D3Fpw/8aOc07fDLJkRrQ7oDFUp2sQXc9a03sCtCn2UB1Sf/WK+sj9jhW/PUYUPdSeTYcNEI/lV8eLdRO405lKa3yj4h+bcyIOQEilJFWu5SVwf2sokkB/fPt5ohfcP8Ee378d/BEhRAa2iQIdGqQHhcxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636797; c=relaxed/simple;
	bh=jR0f+965ALCclojlXTObfbbsA+I/1Qxp7MT4uW8dPrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VB3uw1K8cPsFhhYkiYk/VOXRRJ3DhSWhQOOTngNHo7GTvqXHMd3HKFu2aoxfCk4msunMm19+V6ER7R0AypFllb5eKv8E6kZ8MC8gRQ9sDkKqUBSrp1HM1rEahPIyrYzh8rGe9wdK6h95NyUa7IXg47k3NbqswIk6mtB/X35/qvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVaRDguQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZeYJ1YI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVaRDguQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZeYJ1YI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H8TaGn597726
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaF3l8gWukVCcronizMvQnjjACa1YTDhh2TzRehpSCY=; b=NVaRDguQVVwMLXsc
	ddriGoY/DhNaTRS+G7iDH+MDwrcvp/bnlSK3iSdJKKK1PT9iKzwme3uUS7qHM8cW
	6xbpZdv5ghryLKTPpoEfACl/G4spkcV0ljKVCICVAydF1J6GSznmQVysvo5tYl02
	4henH6BobeDEeiWLOi1P2o/Azj1Lwp737+nzQdaIEdB/s0mMFkYpZXG6VI17thH+
	96yYwbRF77nL6mtkypTHWFeTPxUxKWPDmiU6MeSGlcF+KGm9FXTdQbNi4SHIvxBR
	9t6S/ssmfc9qbSOtRTxONfaz8PAD2Gfm+fQDiTDAa+f/7pii3BZcDlEZAoEpVjrs
	0QrGZw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra86jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:19:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso1168785a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789636792; x=1790241592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GaF3l8gWukVCcronizMvQnjjACa1YTDhh2TzRehpSCY=;
        b=IZeYJ1YIm9cAad9N4pzKMtOo1NWv4qGSMAvxeZqo5dP+oWtCTtvT2uNXRBGhlqK5+X
         N8VvSrg2LjyaqUdcynAB0Zxq7gxNlizv4Eplt5jO66n55yPlNoHtfVhK+FF/gBqrBmeF
         Mv/13FVTgT59l6AUfzj1KdUMlg+xIjd/upOtj8/r61GQTUWcfvvkTJUbNh2BWmNa/OeT
         B83r/OUz4o60q6PXWZhb/vqP0w8G2SiQq/5wupY7yAP6/p0tgzPMietbNbV6sGXpPbrY
         QYbXvdPPJ93+Dp+s18eXzKyLwUNbhZjoAeo8Q9U95a35EcGff2XawTG7Is14l1iw7CnW
         uIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636792; x=1790241592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GaF3l8gWukVCcronizMvQnjjACa1YTDhh2TzRehpSCY=;
        b=qmuo4CJ0i0CfS2X+OfHJ1ssWOSHqRLcPv2B90o221BQPLRnhp/SqodjNcxFdT0w+FV
         VXs1cKy8/dZsnnHe2vN0IegSeUOeNy3iHzzphAP/pKBgVDM3iD7WOUqbjGV9hqrPtYT4
         R7sxG4HOYQ0YzlS4mkbmEDUC328iQAcY4jCPaeH6aGzhpMW2MYiEs+J79Nzk0uMM5Cox
         Iz9rea8OvaVK6Y55zNvfmcEnhTDOeimKXdCh1tEnPnNOL/L/G5YxbRnUUS8IjVKxR0Yb
         bgENQoOTJZAyeQlzCEDHv1YHFswg3jOGu004Oy+9TEW1d8vIIddwJomKBOady8RLStn9
         N2Pg==
X-Gm-Message-State: AFuF++m8GZjsDu5HdTf1uwJm2TbORNzvPpJpzeWiJ55PUvuCxaqNAFf0
	dFoOsS9S61hN8Rce1ZYTqNZNe/6bbOAd2rJKSLtN/FpLYXU75/XGDgb3Rbm1qtyG3Xdnf+f7WUt
	7WvfySUE6vthFLgZAZOlAyMPV2nLSvX7LEY0r2brrWXEwKYJdCtVkSoBcf2MDOho2W4A=
X-Gm-Gg: AYBFou2zWHWRpqwprkxDHQnUX3IQN+rrHQCpFSxFo5TQMGppPdIoxYYrCaz5MlHF6zS
	rkVO/yDj/udC4pWdZsQ6oAvECsrLs2bwOQOBHVUTfDXZBDtMTxZmyc3uiWHphc9B/QKerns4Ln+
	+0OU4bQoB49d1FRCoRFDfAc27lIvkJpHsyIJKzTCdpZ9HkgAt7pI1/B3mVVrU5+x5bw67HATyNx
	A06jXcYjPq+c9sK1EjzKBP9V93X8L7338PfXq+sskP402D4Rm37PuQ04sibXxZwYJimfnZ6/hfB
	Pg+yqA/PkkTN96fONN/fzUFbPUYjRNkKWtcBsfl5bnojqnA0GryExOpQHS360G34LJKUd2Lrn7v
	GvMIdrl8wwQwMVcyKitaMphO7S7+JF4RtprxiiD/mqb+6I1RnjHmVuAb8PfSfBQ5R
X-Received: by 2002:a17:90b:578d:b0:39e:3427:6174 with SMTP id 98e67ed59e1d1-39e342763a3mr7623269a91.15.1789636791758;
        Thu, 17 Sep 2026 02:19:51 -0700 (PDT)
X-Received: by 2002:a17:90b:578d:b0:39e:3427:6174 with SMTP id 98e67ed59e1d1-39e342763a3mr7623209a91.15.1789636791319;
        Thu, 17 Sep 2026 02:19:51 -0700 (PDT)
Received: from [10.133.33.134] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35b589c2sm4063022a91.0.2026.09.17.02.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:19:50 -0700 (PDT)
Message-ID: <5f3f2dba-17c0-49e6-a0cc-df92436d26e7@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:19:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm_mpam: Only schedule mpam_enable work after first
 successful MSC probe
To: Ben Horgan <ben.horgan@arm.com>, "ping.li" <leeonion.muyu@gmail.com>,
        james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, reinette.chatre@intel.com,
        fenghuay@nvidia.com, Andre Przywara <andre.przywara@arm.com>
References: <20260818130646.663778-1-ping.li@horizon.auto>
 <20260908024846.2063161-1-ping.li@horizon.auto>
 <558c0816-604a-49b6-8843-66ea5df28d3e@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <558c0816-604a-49b6-8843-66ea5df28d3e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfXzKm9yBBt0wkU
 o4t5dvYRanwSfUK14aCJsS3fvAi2xHf6Q4vs95x5XcoXYOy1OOdaVJYNYDl0II0zSN4u3JftNG7
 GOgHogSy27+ucYrU7dArNWCG5Y1JmpU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfXzwuMn/8YEMOM
 uLxMOB/0vvylw7Y3LkpKCnVm5OGjtNxNxhRfj05eA9q+FNfVuGhs5e5lqPIFal5gr11QWLtgRhw
 bVacTN2a2Bc8RdXpHRGGjV6414DmRCwzGWMlRpvL/FlzsKfipgcxbQhV0oOFMX6d9bY6X5PI+MJ
 1CwT7JwLsS3sg0U1AY1svkHHcE5VEdyd5NEOsYAtvGO81nGumYqc24DoacFy6tedAMDbYbooEX4
 YbryXdWfbagoS2EZQhMYqY4kmRJTHK2jTZ6B0hYDq/5uoDuxYzKqL61W1kN9F2+CE2/n+HYZfqD
 hGA+vZ4LI8C9cI9/UKUH3ctMGpoRv5HwoGxCsOM1VRk+Hyn3IzQ1Yt7BnqFwKLMoeURYnB8YKcG
 w5yOWymaR4PISeGmj9rAyDVoiveG636G97QU86LZ1PYaBn81oJUQ6NLmVprWD56BKFr/qZr9sVD
 N7fv+jBMu/GJJ2GEc4w==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabb0b8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=yP3gvSyKkkfAjxbymkgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: BUqB4LPc5XnU-s-_VKBOyMdDIsSvCM9x
X-Proofpoint-ORIG-GUID: BUqB4LPc5XnU-s-_VKBOyMdDIsSvCM9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170127



On 9/10/2026 5:25 PM, Ben Horgan wrote:
> Hi Ping,
> 
> On 08/09/2026 03:48, ping.li wrote:
>> From: Ping Li <leeonion.muyu@gmail.com>
>>
>> mpam_discovery_cpu_online() sets new_device_probed unconditionally after
>> processing each reachable MSC. Once an MSC has already been probed
>> (msc->probed is true), later CPUs sharing it skip
>> mpam_msc_hw_probe() but still leave err at its default value of 0.
>> As a result, new_device_probed is still set to true, causing
>> mpam_enable_work to be scheduled again even though no new hardware was
>> probed.
> 
> This patch is an improvement but, thinking again, it looks there is scope getting rid of
> mpam_enable() altogether. Rather than walking the list after each hw probe we could increment an
> atomic variable, similar to what is done in mpam_msc_drv_probe(), and then just schedule
> mpam_enable_once(). What do you think?
> 

Hi Ben,

Seeing another atomic-counter based sequencing mechanism in this patch 
reminded me of a similar issue I explored while working on MPAM DT support.

At the time, I experimented with removing the fw_num_msc pre-counting 
logic and moving the discovery callback registration to a 
late_initcall() stage. The motivation was to avoid separate DT/ACPI 
counting paths and allow discovery to proceed based on successfully 
probed MSCs.

However, I eventually dropped that approach because it relied on 
synchronous probing and would not behave correctly in deferred-probe or 
future asynchronous-probe scenarios.

That made me curious about the motivation behind this change:
   - Is MPAM intentionally designed around the assumption that all 
firmware-described MSCs must probe successfully before discovery can 
proceed?
   - Is the count-and-compare model primarily retained to guarantee 
correct ordering under deferred/asynchronous probing?

I'm not suggesting changing the implementation, just interested in 
understanding the design rationale.

Thanks,
Yin


> Thanks,
> 
> Ben
> 
>>
>> Set new_device_probed only when mpam_msc_hw_probe() is called and
>> succeeds.
>>
>> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
>> ---
>> Changes in v2:
>> - Drop the Fixes: tag, as the extra mpam_enable() calls cause no real
>>    harm: schedule_work() merges the duplicate work, and mpam_enable()
>>    is a no-op until all MSCs have been probed. This is a cleanup, not a
>>    bug fix.
>>
>>   drivers/resctrl/mpam_devices.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 2f09f4b78bd3..fefdcf588932 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1866,13 +1866,15 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
>>   			continue;
>>   
>>   		mutex_lock(&msc->probe_lock);
>> -		if (!msc->probed)
>> +		if (!msc->probed) {
>>   			err = mpam_msc_hw_probe(msc);
>> +			if (!err)
>> +				new_device_probed = true;
>> +		}
>>   		mutex_unlock(&msc->probe_lock);
>>   
>>   		if (err)
>>   			break;
>> -		new_device_probed = true;
>>   	}
>>   
>>   	if (new_device_probed && !err)
> 

-- 
Thx and BRs,
Yin

