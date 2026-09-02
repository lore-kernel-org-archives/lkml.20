Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D12415B6A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340947; cv=none; b=omQVbYpPrBMbjD2Rt30N5OFooilUoqUYa2/BbXkbt+t0zb91x0QeOO/LqwMjahCL/oWnxvIevKBajWly6/42CFjj4n15SnB8q3Zkb3mRAkt0lx5NWI6o08s+93cheTidG166zrJ+lCop2pQFwker9iUZLLMB7oci+U2eIfSusDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340947; c=relaxed/simple;
	bh=Ix9gy4iNaJC6TKz8JfDA7ApKhF58oPVDVuveegmoPss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgKFRc2nw0vubmA+oYk/JOvtAZZ7hU7cirTaq58ZPn+ARAcyx3BlTmAQyRa3Toc1KPJKRR6+tNCC6s9+eFDLTjCCfQhtQkOdoZIe0BcLOyjTdafrXLAIcKqPSkAUlJKr8bMTdAgeaS6lTO7kCPa6PDe8wIh7pbjNyN4hY0K7y44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hz8QZcL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kX8CLhQJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hz8QZcL1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kX8CLhQJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VkpV205032
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 09:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2B9311cIh3QhjI7jQVcMJXJqQDtRI7MudWJkahg+Q9M=; b=hz8QZcL1gUEAjyF4
	ifjO6XomZtCApAIVtzyZN5VGc/KBHr0C4BFQZGNxDWd/gjAePmX/FvTl1ac4XmCv
	JPaYtInDdPtRyXuAJ908ypIDApb9Dhhm40y80KMJiN5oSF8+YhwUkpHxp2UkbdPp
	IsuH1N6XJBOZCN4RnWMIyUqbFGwQfoEeOQkjqBNSbd6V2mabEUI++EJT6pE6EI/V
	fVmAC5tf5XmdF0ZH4fwMOzbjcCHiTKR3tq3ALApU5yHiQfsGTQ1ooRZMHo8wkO+c
	MdictcwhoVU42e5IceF9an6Vsq+1yehbhZmIfn1A5XwhMUk11r7Byr9bBoD6VgEB
	rKA67w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpbnu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:22:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc12e8e22b7so2068374a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788340945; x=1788945745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2B9311cIh3QhjI7jQVcMJXJqQDtRI7MudWJkahg+Q9M=;
        b=kX8CLhQJVCkjeQN6bvwZcZcsCH3Rh37QG4r2A3R/3gBSJMkTKoziVivFlfdnzOrFcK
         uVQabVl1smA6WyELZXrGv4BHM1CWqkWAM1QOfRWceJbstip0ETXg+hBKNiNdAuhGnNEM
         8crNGCEe9t7L/94xlwFqVQQHfOd64efLwUmAFiJ4p8YpbNRaNAahS4ZbwGR7X+Ppt2nJ
         DM8MiABVXgRdXq1sHCOmVMkTFdZvbhY92vVQdlHOlQqj+maEN4cBj447IypYv9ag6z3M
         3oc0wl4Qywwd27SKf5qtlvVYR48Z/YZ+FBEXa6g/V0GvyVRMf4wJvSOPTCKHLe/MgyZh
         yJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788340945; x=1788945745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2B9311cIh3QhjI7jQVcMJXJqQDtRI7MudWJkahg+Q9M=;
        b=nprAE+dLkw6Dzfs28W/e95C/nFoznya7gcY5mnf2yjPZXL7aBejQkzuqo0geT86elk
         avc+R5kr4YG+hQV5+3AnQNpQ+VhG28aUFNfCcWyrFSS3nOPWF5nYSeOgBHOHQWFBcHZA
         HkYoCOaivLyq7rI4MnHVqsM7fPtabRHgp+9eua7eziNmxqxUVmzDUu+u9qMdRvrMU13s
         zLwrn/CJwDzHGa7j05yl+4IwLrAr5zHXY5J0KMxGyltzhRbv6Vlht15y7M8CsErfHd+l
         cg+qsv1lbmxeKC/NRM3ZoGUJVVrHFCjFgYVa+6Brw08EEEDvD3UrGKLT2NldKUJ15gun
         QLyg==
X-Forwarded-Encrypted: i=1; AKwUvBzUuaAQNXp1VcM//x4VbyApS8k8bfQWj8E9RwYgaFK9WKlrHStEeOhXn9jc2vUUOgpArhq17iKTmhiq7Yk=@vger.kernel.org
X-Gm-Message-State: AFuF++kDOlLiYJHhJygGGMVrx2hZPLa2+0DMd/7WT9+FEenN40Qh23P0
	NfYsFlbFGQGSznrdsZSBEDs1Qt259LrTc6kW9GslYMRYFyRlOzQ0A+MXlrcTzGwIEgJUT9FLwxf
	9cytYVHJyFKAohMW0pj+1tcQuTzRrKgDnHoAzgvXdGYd9d+ZXURc+kW0AME26481F0OLYE1f2A3
	s=
X-Gm-Gg: AYBFou3dPqDqQqt3C72DSPN2RT331qsmIqrc8Ys0t+JsUXwzZ2RKE2No6oUPw+OjgSn
	1ZXg004sF8BeFgYU87Qpnwyr5Yk3r8S1Dge7aM/qPt2pe6fRgyZFb/bFfZCf7KN/tnzq76YdqM6
	ttk17x9eju9P/mVpzZ6ORm1hEYW5K5qLk2kcUmHZ90pHpLp8DwObQaEqF53ibuLYN94T960bi5a
	F+qF20admGCciga9ydPw3ynzx3GPHzHh4K/HH1KMOWAqunLXLHjK4YSx/lN3CIkU98m7UNJX4nR
	SWaiQfPbrbXls5MBH1K9VQYbx/OYwxbZtbaMFnYF8y+ivSyTCkVkTCYHseWSnLivtrWPcDcIfTz
	uJv6jGFA04DRHh9zXbOA44sgTGBjBABI=
X-Received: by 2002:a17:90b:54c3:b0:399:ecd:d68d with SMTP id 98e67ed59e1d1-39aee26286emr5767877a91.22.1788340944665;
        Wed, 02 Sep 2026 02:22:24 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:399:ecd:d68d with SMTP id 98e67ed59e1d1-39aee26286emr5767708a91.22.1788340943425;
        Wed, 02 Sep 2026 02:22:23 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f7d77sm4998797eec.12.2026.09.02.02.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 02:22:23 -0700 (PDT)
Message-ID: <38984608-4b5c-4355-ad85-8c5a1fb78cb2@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 14:52:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: tpm: Introduce tpm-qcom driver
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
 <20260831-tpm_qcom_driver-v1-2-6f16fa6924fa@oss.qualcomm.com>
 <apbXKZrjFdK1vrny@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <apbXKZrjFdK1vrny@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97ead1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OCHYf-eeibxfj-F0XOcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: cslNXTc2c4yLInC4z5rR_N8o0xc9I82f
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA4MSBTYWx0ZWRfX/9Fe5ZmtoT3O
 GGbwloCfxdf1aCBlDm2qbp1w+BcUTN68iHGms855BCCxOsaK+6vclVkbyWhg6nLvODrdwbH0VeB
 WY+xMU7TBfypJhQ261TyBt6mGHnxmOQ=
X-Proofpoint-ORIG-GUID: cslNXTc2c4yLInC4z5rR_N8o0xc9I82f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA4MSBTYWx0ZWRfX8RFtlox+H1XZ
 8mBvnZgPrgdFhqkMZA4R9I/inT1euhN9QDnIEVywCw4PsIWkB2jquYxTncu7jYYFqY3s3fJMWf6
 z+4scm4oXliOWIuuq8O8EYqg2uX2koDG1tvQkN3fT79esyufVE1bVFGeFF6VXFo4Y51mBTyeX3k
 zqMyotuWsjoHeKxKSzPux2xH4KfcOkBlZyHOYzJeoydoa3XV4mQ/b4UUkdAvioiaryIqPMzbXfS
 6twWZyfjaUYSWshReqDLuhMjG+5/k4hqqjh5gnIvoNN3UCxsXt49ya+aBF/L2SCD64h+ulcr/dD
 MmgDg8S0U64wD6wXfDPvNd1UjSOBxm1cxNC3Y3XzPIMpq6pFQMyQV5ImWwFMvzMNYti1O+feE29
 0l1l8jr3AU+lb3hrnsMY75SJQnJLO64NnyOYbIY8TQqXSsA5RZI9IPuQZATGl4Oe1J/LJTFRPKW
 Z28YsSx3EOUadHac61A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020081

On 01-09-2026 19:16, Jarkko Sakkinen wrote:
> Short summary has a different driver name that is implemented i.e.,
> it should has "tpm_qcom", not "tpm-qcom".

True, let me make more generic like "Introduce Qualcomm TPM driver"
instead of having driver filename in commit title for any confusion.

>>  MAINTAINERS                 |   7 +
>>  drivers/char/tpm/Kconfig    |   9 ++
>>  drivers/char/tpm/Makefile   |   1 +
>>  drivers/char/tpm/tpm_qcom.c | 371 ++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/char/tpm/tpm_qcom.h |  82 ++++++++++
> 
> Rename it as tpm_qcom_tee just to be aligned on how Microsoft's fTPM
> driver is named.

I'd say firstly microsoft ftpm driver should be renamed.
For example, MS ftpm is based on optee(session based context) whereas
Qcom tpm driver is based on qcomtee(part of same TEE subsystem but uses
completely different mink-ipc based sharing mechanism).
So, it's completely different driver compared to MS.

My suggestions:
 - Rename MS driver i.e tpm_ftpm_tee.c -> tpm_microsoft.c
 - Rename Qcom driver i.e tpm_qcom.c -> tpm_qcom.c

I see pattern like tpm_{loongson/atmel/ibm} etc. so better to follow
this convention?

If ever need optee/qtee to specify, more namings can be tpm_ftpm_optee.c
and tpm_qcom_qtee.c?
Personally, I don't prefer tpm_ftpm_tee.c as it's all generic name with
no optee specification.
 >
>>  5 files changed, 470 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 47b04968e79a..cfa5b66823c7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22636,6 +22636,13 @@ S:	Maintained
>>  F:	Documentation/tee/qtee.rst
>>  F:	drivers/tee/qcomtee/
>>  
>> +QUALCOMM TPM DRIVER
>> +M:	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/char/tpm/tpm_qcom.c
>> +F:	drivers/char/tpm/tpm_qcom.h
>> +
>>  QUALCOMM TRUST ZONE MEMORY ALLOCATOR
>>  M:	Bartosz Golaszewski <brgl@kernel.org>
>>  L:	linux-arm-msm@vger.kernel.org
> 
> this change should be a separate patch.

Ok, let me make MAINTAINERS entry as separate patch.
Also, i noticed none of other driver are being even compiled as 'M' like
atmel, ibm etc.
Any obvious reason behind this?
Should i enable tpm_qcom as Module in this patch only.

>> +	print_hex_dump_debug("tpm_qcom req: ", DUMP_PREFIX_OFFSET,
>> +			     16, 1, req, req_len, true);
> 
> Please don't do this. It can put production systems at risk.

Ok. I want to dump some contents on failures which makes debug easier.
Instead of dumping entire req/rsp buffer, dump tag, reqlen, rsplen etc?
>> +static struct tee_client_driver tpm_qcom_driver = {
>> +	.id_table	= tpm_qcom_id_table,
>> +	.probe		= tpm_qcom_probe,
>> +	.remove		= tpm_qcom_remove,
>> +	.driver		= {
>> +		.name	= "tpm-qcom",

Whatever naming we'll decide, I'll update same here too.

>> +
>> +/* dTPM SPI transfer optimization:
> 
> Block comments AFAIK should be
> 
> /*
>  * <TEXT>
> 

Let me fix it.

-- 
Regards
Kuldeep

