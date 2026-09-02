Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93BE377018
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339172; cv=none; b=VkFVzHHYEy4SHBfPupTI9kqk58vROUPkcLE90W7XXa2VWh58HVhOHcym0oSTjg1hvB408OkaHufQ7SDN74kCqpbLu4ryBnb2NN/A+S9StFLfVli2SGCftpiOwBFczLU3RSg9H2nVPLlBfuv+5upgVUTwq2hFV86iGkima1CkgXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339172; c=relaxed/simple;
	bh=X95ZryWFwTnrdYhunoZ104EY1HeVyiQenMazNXj+huk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ka8Bi9bj/FBU7VLWweaTqu+i7R5IS1CS8fPjh59XYiBTNBazsuHCMgtZwDFcxa+6qi4ltWEpQyrAUfCsEcfM0FJhB3ySgz9v8O8nDWzsieoOMVhXyNFCQhxf4+310+/8q2Z0/4fBsZrw5+bnmcWJoDk15XTJYrOBT6MB8JXoxzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBia1EH/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaB6SEkG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBia1EH/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PaB6SEkG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826Vl7C960804
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 08:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+bCUXw24EZY1K4A4XHY6/ihELt7ZoTu1yafnTeOtpIw=; b=HBia1EH/LROF3Ldp
	TqYLTOWgOzzU77WgC5zRDL3434yBU9+CEM34cZhfl2FG8iaRnq+hD+YdrjcwiAP5
	0TtS8CAP4z5JPS7uz+Hbe1PcxiH6tqtn2Genh+qZSZ7z5g9HQ/lqff/CH0lPCkkR
	VoltKTFOQmgnJm+hGjbKqQkX7XPy9Hg/wyRGxxQ0SHvbKZGR9Zo/O2EIakZrHT/9
	c3F4eEZuQh2HGoY50UYqI6ogeknog1PIJxa1b1NUrKiRTNTJocVWDoT1VgzslesE
	EB5wjwbjtWvc99Uo5IxNjmDSwdEM+aCvI6WFR0gSVNew02UBb1DZxBODJNkFTboz
	+7+qZA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0u2cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:52:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-399311947f6so1619895a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339168; x=1788943968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bCUXw24EZY1K4A4XHY6/ihELt7ZoTu1yafnTeOtpIw=;
        b=PaB6SEkGzvoMaggLjxjPJ+Pww7qqijrSd22ERvh0MsxitJRROnuFEuhovE5x4c+vHQ
         iY24wsfUcOVKjLcY/J1hp/3l1tM1Z4As/xMJx4clPHAQ9UYlwECqlb4ZpiTU4pIjjsiD
         ag9TOnXwb16o/EtHl+1Y6chbe8/NfulJUMP5pwQMFKkiedg3ol/vYoeZYd8X4uMuwSt5
         SAEh80Fg8KK1CZa3toc43qOhq47MGBnHL2ixLhAHr052DAEXOKbrUTYZO6aYGRBGtb64
         oViVins83ZgexlWp1yXiowpJvp5YUB0/+jd6dOy+qtL5z7z2fREsuoMJlX5U4nbn9xrr
         I/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339168; x=1788943968;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+bCUXw24EZY1K4A4XHY6/ihELt7ZoTu1yafnTeOtpIw=;
        b=QhuYeIizN4STo+msfOfEGkanCg6d21+X5OgeXk9IWTcIiuEro9Cw36kGD3euQTgCnR
         6Ol1Fu3r7GMjXWa3Q4NYjLRCLPc1TgZfWJkcsaiDeKJKv3Jy9PTYePDWgxHy4JR7zTJT
         nC5LzYvSJbmcp17n5b3upAoIMyREkC0YWou8UdaSmX4LgZ/zy5fkTpCl2yLNrIaUQ5Ch
         xKGFU9BZUCsMewb+eGcnnLfOWmYEDSBg7v3ZYKKNgtENTmi9nXh2tJftcqbNRmdBpUkQ
         E/aLaYi/HxXV3OStRsU5M0kBfkJ52dHgViHK36tag09kP1OUcL52YMmLgbjLYcN5WN33
         3cNg==
X-Forwarded-Encrypted: i=1; AKwUvByNghhtS6gDOyqNjByGrxQHJt5s420CoK0XwppWwwisHizj3B9XkJo0pWcBsigIRiZNcoRLtaOznXanZ7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lT1NYvCNwnZwpTKk4HZFNPvKx/Lk0XLI6HEukyXPS700OD67IR
	O8HpaqBjA8ZDatp/Xt9A9cmjLNEtDsdqoe5VMAs6MPXuguTxW6pM6egGLXFNhyaOiSKBTYdZ51A
	ICDibxmO0qKFvIC+ExaPp3RkZcLsWRbOcSNRPXUgLJBSwmVMzF9ZGfLd7WGqmMmuCH1s=
X-Gm-Gg: AYBFou2mPysAAvV5V5G2yumkliJA5qWeVs31PT86lwv+SOPVel8n8v6n4tyE9WPRxM1
	aPaH3Y9MUT0k5Up8ylPRwvN+H/DpoLRhmBMZktgHVR+tW8+roo15v1m4B8BEwu6nAQj1FoAECjG
	4Xi7GSFER5Q3ihhIglau4HlyKaSk6cmElgvnEpXarHDCiiY3XAVEozrpOkJVP0BdwVcS4tlLyyr
	SZc1FDlyvr5zR+h3rXfASDEsyBhzQaPSEOtQ+Hu92ec06zNG6+s1B4KMGH9dIeVE3NZRZiT208z
	tWMaGxxwhu4mY2ptzpfoZ9svjWuKj2ua11Pzy2bJRbPs7naiRkpRrXFXhKpPF4rQbrQpsIzBaOe
	c7p5KfA2tgA8tPy1euY21BsLr4dXBg5/8FDM05B4ei76/S/NJ8K5agG3bExc2St8+YA==
X-Received: by 2002:a17:90b:4d08:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39aede9344cmr4202223a91.5.1788339168516;
        Wed, 02 Sep 2026 01:52:48 -0700 (PDT)
X-Received: by 2002:a17:90b:4d08:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39aede9344cmr4202193a91.5.1788339168061;
        Wed, 02 Sep 2026 01:52:48 -0700 (PDT)
Received: from [10.133.33.183] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm10447855a91.12.2026.09.02.01.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:52:47 -0700 (PDT)
Message-ID: <163b2dba-0af9-4594-8067-be9e711bb4b4@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 16:52:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix trace ID search skipping pass-through NoC
 devices
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Richard Cheng <icheng@nvidia.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
 <20260902082209.GT8904@e132581.arm.com>
 <28d5c8bf-87b1-4172-94a8-0e1b7ba1f083@oss.qualcomm.com>
 <20260902084538.GU8904@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260902084538.GU8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX+0TatRRMJNo4
 msRgqARZy68e6LeJKp/YlF4IuQdRV+odcImLb2f5pqrUBzsXSPLhb3+bxosL4/Izai9QfXioQvc
 itWlPuNtFpy2eyuulkUtleMeF7oNQjafXS9CTbWDorzWnqkwHlFGgFBgYC8yzwieuNV56QaXRyS
 2lieClbLroc0lrrc6GDnyiUI9TTvNGtccd6eWxTgjjRVmUPN/oxslcuIFZA47YEAiaGliVkdx7/
 EPLHlNm64KxcI4iD/rJfFN7eJZpFNz3VnwCwXF9Hwd8+0YqhwUVZ1m4gNdJhpfTtKER9ejW/CpA
 kkAG95YX0S2d8DUKRSt09AP/M1L8BOznPsvxr0VkyE2IXimX5OXTfLAAM5uYXHbocPcIWMUR+CO
 TlmXwESe5MaR3vsU8s47w7roLBf8lQybHrrPRi/6EWSg2z8AVts+4RNiMZwXyn74eKeD11CY/HS
 Qwp52BdhazBKUz40ZUQ==
X-Proofpoint-GUID: _AY4FzYpgh6A-5CaM2ahQu5Wz81w-zco
X-Proofpoint-ORIG-GUID: _AY4FzYpgh6A-5CaM2ahQu5Wz81w-zco
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX18qfxyR1eXuW
 h68sPhbl5uuV8GGB27u6v7g4RRNTNwdI1SMm+3V5OZ00lA9r4qPXm0shZ9UcFSUpkYEpcGPZJUh
 4c6uau+XeXnUcKPfgYaLfYsjG9JCTpM=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a97e3e1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ASdo0e-X16dllrNbtIEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078



On 9/2/2026 4:45 PM, Leo Yan wrote:
> On Wed, Sep 02, 2026 at 04:35:11PM +0800, Jie Gan wrote:
> 
> [...]
> 
>> Hi Leo,
>>
>> Thanks for the suggestion.
> 
> You're welcome!
> 
>> I will fix this in the TNOC driver. I agree that there is no need to use
>> additional error codes to report the failure.
>>
>> I will post the new fix patch after below patch[1] to be applied to avoid
>> conflict.
> 
> The patch in the link has no fix tag, but current patch is a simple fix.

I called it as a fix because the TNOC device cannot be probed by the 
AMBA driver unless the PID is manually assigned. This is a hardware 
limitation rather than a driver issue. The problem is resolved by 
switching the device to use a platform driver, so I didnt add a fixes tag.

I will send the simple fix first. Depending on which patch gets applied 
first, I'll respin the other one to avoid conflicts.

Thanks,
Jie

> I'd suggest to give priority this patch - this is friendly for porting
> to stable kernels.
> 
> If there have dependency (based on your local test), you could explictly
> mention the dependency in cover letter and resend the tnoc probe series.
> 
> Thanks,
> Leo
> 
>> [1] https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com/

