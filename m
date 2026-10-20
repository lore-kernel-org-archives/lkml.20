Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792468028;
	b=y00o6dry//rOZIukzg84sMSV6p9B4P6jJb/QKQuxPAu+JY0a/HZ5xSUAwvwhfDQEex09
	 HHCISuHzc2Clkx99wWW/k4HtaCV875mpWlZjJQ6ynXi46G1CQrYmgWYPs8vVJnI3MQHku
	 NPn5VcvAaF/jKXymNSl53rGbbCqFW0USGeB6YDLN/krW/vXiUaw91IQDaqS1evWua298k
	 dtzzHi7fu4ggESmvrErqAGAJv6LeuC4riCwvdJunz7kDrrw4GRA4mCV8th5yIxMHjF1Kf
	 06rdEyUs+rKk73tHoAEFdzGArZTjhS0aOMPYfjR65GUpt5f+mhQPhF0HVRRiuhUNH3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792468028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I8KcGkKJc5O5cQ+cPv0hwt4+vT8X5Kf/M9p0U3SJiPg=;
	b=A9EQ9+snqfHnTM6WZPNBEJkQMLXAgBB/73bXeTHDpjpf5rv+SRURNZVTeMEO1HW9DzX1
	 f7ctb2zHJr7h+oYxUAuQVeCzACI85dMSG2KVgVKiGwYSrhQ63Oel1ds8NLEny0fxZlRD9
	 2VylkIAmVUParQ18kxpP4k4iFMiV7UeTak2gUyYrQ6tN0QKktSq5VgCBnXGcvvX03rknK
	 rHJDB0VGd7S733aTkzaN3hRmUZqotr7vHY06inUU8y4VpsP69U8vmb7MR8RrjiwIE875P
	 PuAtpVGKWCtrox1vjU7wg3Mi3Q3XkttizYtgBJzERhDVkmTM1xh0orc0KQzzeYqAciA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZtQ0Ij9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aev5tig+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFBA606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACFBA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZtQ0Ij9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aev5tig+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K28iMS862985
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8KcGkKJc5O5cQ+cPv0hwt4+vT8X5Kf/M9p0U3SJiPg=; b=hZtQ0Ij9FPMQ+58X
	NYucubZW5beltibOfA2ge7ZfiBti0b2HSaGKzHAuOncNw3DmARjiKKlw2unaAQlY
	n0QJ6U3HBMPkYp7OV85GvYQ2Eln8DQx01mEVuRd8qAgp3Fj2MbUsuEqLLVBq16i3
	bMKkd9lh8ftq+1u8h7MTnunt3O47+c9hYxtgO5KH5TsVD7b8GBeOb4oqPrW/7FPm
	ytGsGxA30eFB5n7XVJB3XF6KGY/TGJZx0L2saBr2je4GP6iQBZIAR4kcTnjZHnsk
	8rdHc3mvj9efDUt1zhYs9L6BEL3+QTwEVCOkurbeuaRoaOp2ggSIkDn+/8Jat6NG
	gWAuLA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pgsh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:47:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad7030e886so290a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792468025; x=1793072825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8KcGkKJc5O5cQ+cPv0hwt4+vT8X5Kf/M9p0U3SJiPg=;
        b=aev5tig+4eWgmnAGV7JFaryuh0Vz5GQGb+BFW2akFTABc3Otve80gf2CdblBUlAGJS
         dy+e23Z3jeHV2CEZji5jZ7RxEO5K3LnpejlWgH5QcoieKa4lExKzE+54nRUD8ORAJ36U
         VtR4jo/hS1lOtdYr7i+xfTHwSdPI49QvqAaDsN/AKj/bZTwPPJXRswFtALYxqfhZ1SBB
         beAfXvlSc7aS7mOOP+/cCUj6jmt+9VxFf8Dl+oGv0zZrGwWZw0mvFKssqTzWsjUjaVdd
         0tNakIrpLsGzNHKQICuOfj5KpxEV24bg3mWXdVuFQgm/WvHyn1vqeadzA1zKcE2pYwIs
         f+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792468025; x=1793072825;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8KcGkKJc5O5cQ+cPv0hwt4+vT8X5Kf/M9p0U3SJiPg=;
        b=ze2lL+bw/DfwHn6uFCKtNMKXAYSP+6uBPzxbJ/ot+4qPrVlMCKeILNoE1dWrwUr8G+
         QcCQ3HoKQDfnRQkXzRwy/ykkYYKXSW8HXQcuz7nKe/VNhIsX+Cv1J1Rs+ht1EYF+v4fG
         uq3U/XTl8UNM6QLCqF8cnYtxpV6fAQZ3F7qkndg3QRJ1vFDP7FcKUqKDD3CsIbumaZDe
         NUANUh28ONsvq8V0Xu8cDla4pD56dZ/vzuMv/Lh2d3MXQfBTktm/Iv2jN2ysPmeDBywM
         80EtaC+MXdrI3tCeZGghyVJ89eGJUX9XcBaHGiOW2AsacQe3vH7YNmw9aZ4fpsNVSCn5
         OFVQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8W/KyJQM1AgBV3vE6zWIbWKNBIGaTDIVXQvjwsdRJ3ZNoENfmAivzzxIghcHYaIMI0oz1APbLX6CU/ZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBln8vFYCzu3HTCMh4TkxMj2jEFXC1GsYplzvYut0hvvtJf9P1
	JHSwDo0s9UkbH1a1vULiQjAwNxrsBP2iCU9fm7neJ517F7q9dA/yEGVJo6ELTZ8HCDAQEQ/5cez
	YS6ZjpGoPhHIr7O6MW82v3PM98WgzCoy02Amy20YBNeCG3XdV6or8YZMSDSHRzDEkBRs=
X-Gm-Gg: AYBFou354ZCAOBXUfbeWOBK2gRpf2uzHlfkvfqkhBt5ErvwNyAAqkOWq9JWZlbUsR2p
	xRIPX0Ocd7xSRE20B1fY4PYT2Fka4UXRKGYYFwC8Fr0R/moLr5JGvm0Yij8WJkYsDy0iXrsMz/l
	65tWVfmx5jZ93jh3Qf3EO2CnzLEQVgw0WJ8AO0YECE5ww4Oe3cncVj59P4mmPTUtJbJLnnvO8ai
	fnZb241e33O/9zNNgPZuqQ9QuIhQ9nR9WiWhl52MC/yeae17Lrvi5ir1TKHiKzBvEWoQFCidnk+
	nja4ALHzRwLqjPa/NODP+1Siw1asuBytjHbFXEilJ4NVRm3vzZlJunhMr3Sa1+MFFQZsGDXsZNe
	2g99IJM72oEoJsiywAG2KMcJ7EsA/FbL4COQNJzG1EstiMIb1ybG/xlupSmYyzwszp+RF/g==
X-Received: by 2002:a17:90a:acf:b0:3ad:183f:5e3a with SMTP id 98e67ed59e1d1-3ad183f5f57mr3604818a91.4.1792468025298;
        Mon, 19 Oct 2026 20:47:05 -0700 (PDT)
X-Received: by 2002:a17:90a:acf:b0:3ad:183f:5e3a with SMTP id 98e67ed59e1d1-3ad183f5f57mr3604804a91.4.1792468024799;
        Mon, 19 Oct 2026 20:47:04 -0700 (PDT)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d4004efsm2113209a91.5.2026.10.19.20.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 20:47:04 -0700 (PDT)
Message-ID: <d2c3fa0a-348b-4015-b2c9-b97d8c7964c8@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 11:47:00 +0800
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
Subject: Re: [PATCH] cpufreq: longrun: fix typo in kernel-doc
To: Manuel Ebner <manuelebnerli@mailbox.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20261017071434.1250140-2-manuelebnerli@mailbox.org>
 <9c312de6-7c73-465f-93da-d7a75cf3be8c@oss.qualcomm.com>
 <c635054081da35e61ccc25cf356f6356ca8580ba.camel@mailbox.org>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <c635054081da35e61ccc25cf356f6356ca8580ba.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad6e43a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8 a=C86PBj00trpwstLOT_sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-ORIG-GUID: 2uqNgo7c8jryBWGoRorpiZpyo2GZVJ3n
X-Proofpoint-GUID: 2uqNgo7c8jryBWGoRorpiZpyo2GZVJ3n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAxNCBTYWx0ZWRfX7s/nF4qk9QuP
 vEIkZ9BYG0imPCs7pKb9mp7QD+zLoslLgA9Kgp2mkE7RJsUIJZPF5Mz34Us8/3tPxzA4jP5A3X4
 AuxM1LOND8LwFue8Q7bq6Xm6udeT12xbdYkioJ1q65g/17KdTropzLY2XgS3nh8+WTh/eTphOV9
 5JlFRrGaOU2/tdABWzj7FexW4VqrHl9KAfvRXfxGcUpi9tWM/1qnDLJvBJOfypyercTtYsx9+/d
 1Vd646SJqb+1hyt9bzDGoT7VIFkO5ky8GhRi1bnupEO4TTNgNzscUMPiqiDpmVY6Y9EBby4q/dK
 WyRVeYRDVK5KuS7448xIcDd1TRoyGWcGB/frwWiQHQtQmzmIhgXCwQFS4Hh/zZmVV87rBExgDL7
 p4rwp0wCw9I9Vm2e59B9tk7iLb+vrwfOTJymQ0pPW2319LyHeOvSePSJ618GuN6GtM4aBE81b/U
 QDfgCh6eiUScWyLbx5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAxNCBTYWx0ZWRfX6xsRzz7vSWpF
 w49x8D1GjnTp1Z/Tj4mcQNoaOD6mMehsXgUZ+uplmHmlcH7peAs7gwoptovu+Ggy8fP3ne5c7nR
 j872TYnizdzFOBubPF3imIQA6ngucg4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200014

On 10/19/2026 4:51 PM, Manuel Ebner wrote:
> On Mon, 2026-10-19 at 11:37 +0800, Zhongqiu Han wrote:
>> Hi Manuel,
>>
>> Thanks for the patch.
>>
>> On 10/17/2026 3:14 PM, Manuel Ebner wrote:
>>> Fix typo to fix:
>>>
>>>     $ ./scripts/kernel-doc -none drivers/cpufreq/longrun.c
>>>     Warning: drivers/cpufreq/longrun.c:126 expecting prototype for longrun_verify_poliy(). Prototype was for longrun_verify_policy() instead
>>
>> ./scripts/checkpatch.pl reports a warning which should be acceptable to
>> keep unwrapped as it is tool output.
>>
>> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit
>> description?)
>> #9:
>>     Warning: drivers/cpufreq/longrun.c:126 expecting prototype for
>> longrun_verify_poliy(). Prototype was for longrun_verify_policy() instead
>>
>> total: 0 errors, 1 warnings, 8 lines checked
>>
>>
>>
>> Also, while reproducing this issue, I noticed another problem,
>>
>> ./scripts/kernel-doc -none drivers/cpufreq/longrun.c
>> Warning: drivers/cpufreq/longrun.c:21 This comment starts with '/**',
>> but isn't a kernel-doc comment. Refer to
>> Documentation/doc-guide/kernel-doc.rst
>>    * longrun_{low,high}_freq is needed for the conversion of cpufreq kHz
>>
>> It should use /* instead of /** and may be worth a separate patch.
> 
> Will do.

Thanks

> 
>> But
>> since this patch is only intended to fix the typo, the patch itself
>> looks fine to me.
>>
>>>
>>> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
>>
>> Small nit: please consider to add the Fixes tag:
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> 
> Well, thats the init commit, should it still be added in
> future patches?
> Can pre-git history be referenced?

AFAIK, yes, the usual approach for pre-Git history is to use
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2"), the initial Git commit.
Many patches have used this Fixes tag, for example:

https://lore.kernel.org/all/?q=1da177e4c3f4

> 
>>
>> Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
>>
> 
> Thanks
>   Manuel
> 
>> ...


-- 
Thx and BRs,
Zhongqiu Han
