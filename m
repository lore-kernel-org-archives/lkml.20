Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C1B3AF65F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491538; cv=none; b=niGjcGWR6YHDtLIYHxXTf50gVHD3wJTv5nSkofUZcC6gDUHiQO0WtNWpd2VCNJLUqsgrrL1DMnpeCBYpv2Gvqkz8Zs62Zi0nRrP/lAx1WwIDuH/fkeZ6svlKUOtnBPMJY1UiYzPbFe+bTIyYToKFfxsKGRUk98t89yfB9xXkVRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491538; c=relaxed/simple;
	bh=Y95yniYLVZizFK9LcvuTZpHxT3C+HIs4lMFSHQEGUeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNBkzroAxPrBsXzNZiW1UMX4IzldpvUP0kPysJ5A5nwFSIHf8Fv/Lu3y6MiwCOojnHKpQqI9f2ZfjBaSrMmvp/YcaVffmjYFbD12gylDGIT/hyXRrPrsng5d1ncJk059p4w9LnhV9zxrJP1IMxImHaERP/YXV3KPaPJVjQ/ExNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXa1PWzk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nv7s/qxK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXa1PWzk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nv7s/qxK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6842lW601792461
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 03:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYxawr2n1gJxIiwBliti1lTRD1HZQn72h83Vvz9XPv8=; b=YXa1PWzkYa+PpBQn
	yuthV/+n/nwhMJa97ivv9cQNpOyPlzFI4yiMZgzn/I0VF0eweO1V5+DnPLtAaUHK
	DPnMlBRjPKq/U+m7OsqL+aNtLw6vBIrhkqkHtqFJIFyVEwsuQmZhtmsQV+uUxXBJ
	bmr/tAoa8/orQHhesVqwOmd3u7b0W0ltF5ysnAFmZY6OmRNJ1qUURWrkHz1EOybZ
	CzNdYgCQ9nOrLUd7pQZvZ0BGNVI2el1i85dk1XUkCedwr7lxitiOgDQ/2DAaLJZW
	jVp6tWNi9jcJM0HWZ2ZXZFlTZXpV66rpR7SKgFQh2f1O8N3TZjfFCv/904R6QMYu
	paJcJw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfk920dxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:12:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c1cc5206so747928a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 20:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788491535; x=1789096335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYxawr2n1gJxIiwBliti1lTRD1HZQn72h83Vvz9XPv8=;
        b=Nv7s/qxKXPR+kwV3UDJeEVJjPl6zxVH9acS++VVJ1uKgyaac//H/KWV6R2YIe281yS
         Fu8Wi2wqtdnuJzmqQjRFbkX8kRVxcWzcstVuPoOa23zH7rrULIVONl9MuRLU5fC5gCVo
         soomSaXbeeRnJ/+K25xqgxlOtke7MfaSj1IFlPxI4tkeNS5bCF0CpQj3Y2K3xbo8Zmjw
         5vKjA04LV7ia/bbvS2JDW53zPxC3fMo/BzbV4evbBi4tOrwnXr9orQr6Itnpn+61GUeJ
         ASfdSF3hMUsR5BEFo7AA2PyW3/8VjOnKztlpwnM8RBeoFpvwZipYaoJuRLjCIGNcksi3
         mwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788491535; x=1789096335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYxawr2n1gJxIiwBliti1lTRD1HZQn72h83Vvz9XPv8=;
        b=hmwLaFBmMBwAtV3n9hTPedZHkt8Qx/bbkNgc2yBeNZccDCMbemoxVBKq3LCxewmc2D
         ZtvFPIA57a3BzLk2SO9uIMiPWjZ3iTbZdW4517YhTgQ1tAKY4LuKd1J9BPCQXVI9af9u
         JtuS1qClo1wiv89ehsDD5OlcKtuEpwwuI1kSz61twdl2UQmu9QZ4c8JEKU65tiS6Saw3
         gmDLx/uKkPVfZgf2WQKFsm+iTK6Nmop+TemzpVgciKp0lXsVBhnY1lQtcxMvSNrGs0xW
         IPK7YjeHvoEbM01HD6bhTn0irfMJZPK4DZ3A3TwkeM+UVSsInrJlf98IuDoQoNcnULfr
         IeSg==
X-Forwarded-Encrypted: i=1; AKwUvByPHZVNxY8y49d8rgv1um7jy9d9pHiFvC4VjjAdeCQ2x9q7cF7QLCC2fPKThi6F54vKoH+SZ7Y8fSNGYQA=@vger.kernel.org
X-Gm-Message-State: AFuF++lo2kdRajNx7pJon6uwbYYqCYAO8Oa7c4Wz+yVuzHixvBTHeib5
	5LdnoJEW52GvQvek62FdmNWHQ1+8WYL9EPR4GgkJfq5mD04xRuhbeBvZdQRhewRASd/5GWzu6Ie
	GMNb3PpF1g5noMWGket2B5lN60PDxvU4cAOAVjjodSFQw0+p9kiINQ/H1v2LuKK4vLaM=
X-Gm-Gg: AYBFou0eiklozBiRZe8vJixKvjAY2rpijJZsQFHUUu9i7wKKqhXZCS9BLi+R0KOqb3U
	vYpT2K5iqwBRBMtWVQwcBh0scNTWBnjBKj0z9/IKptmi7CTuJBCIYF8BmCJAY7eTfkV6Qvi8b/n
	/ldeD3xIjQnRMeuqWsjukn/IWgdj12lp2oRguGPffsIXARTG7DqCFf0U9g/P/fpLdjhT5nV9mKb
	wQMOoiVVSu4Z3gd4yzEI3tUVEGz+sUYtvJ8gFKUWSW0Un/4GL4qBFHI58qNjq3bUyHJvHiL1tjn
	pPA+5boYarQLogLYeuFuwDFXeMQ+EyAQBuBQ23RfM27l88OLKU5msbi0ekuCBe0mgpKdPABVEMd
	UOQH21iyj8Pa6np5FOoKCbDHuu33VuCoR7pkoeyOsocQ7nKUSh0bZGjI7B/Lvj9tA
X-Received: by 2002:a05:6a00:8c11:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-861662d4cd9mr5413479b3a.2.1788491533074;
        Thu, 03 Sep 2026 20:12:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c11:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-861662d4cd9mr5413384b3a.2.1788491532557;
        Thu, 03 Sep 2026 20:12:12 -0700 (PDT)
Received: from [10.133.33.207] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152e2f1e0sm581870b3a.36.2026.09.03.20.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 20:12:12 -0700 (PDT)
Message-ID: <460cc3a2-c9f8-493b-9958-9e0c9a80fdd6@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:12:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/15] arm_mpam: Fix MSC MMIO window size to use
 resource_size() instead of end - start
To: Ben Horgan <ben.horgan@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>,
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
 <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
 <93eac14a-5ee5-40c8-accf-f623cf0e76de@arm.com>
 <74b52fcc-10d0-4d45-8675-4a3431ff4b03@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <74b52fcc-10d0-4d45-8675-4a3431ff4b03@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDAyNyBTYWx0ZWRfX0XlEXHGXFvfI
 nbEv9yVM4ND7yFWY3DLTsSR/7UFYPJqs9A+D9ibSEmTordWU/Du2ZX16lZudY0feNx+nwcyYoxX
 Z2/GAXiR/E9CcesyP45HwA45KK8Fq+hRoQr+GQcc63paLRfISPnjtuI6mM6SNCEOqLwu+XbZhNs
 +hhQL8Tw4HUjzbW8ML/zcHR69TAFGVWW82J4pRhpBRF8AVGYxX7p/i/SIWKRPUjaQ8Qjf7n2CCM
 0L6KPHm6F7DJDhm9DyB3kz5lC6kYB4YxQrZFbRzjumGc38zITikfTzyvdum0ol+0YW3H8Fwghsb
 Ms5qBCNl0pXg9WRow91nhEe72ibZ895cG6hSEDalBIWQsQetfrSmmBOrFF7fW/L5Yhlf625wFJY
 lqyHqybtQQwGoJowRF65b8kqMs+uMv0dstq4Y4HVr0gq1mOv+5uKddFDPBeig3LTCDwr1qAk5Au
 ZxuCm7SsCi+QlAA1vbw==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=6a9a3710 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=ZptWdTKgE_tpimiw5rkA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: M4uIhU-eS0kFjVe5_IrIMqI4pxByUUj5
X-Proofpoint-GUID: M4uIhU-eS0kFjVe5_IrIMqI4pxByUUj5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDAyNyBTYWx0ZWRfX+xld3w9xTsZD
 7hCqUC9gqgo800+iyELrvtYI0tFnGRCsKK/iseUjyW/hOlpl0ekL4pK1j+kOACyQsRvYo3Jr5Ea
 4S1FSKvf/gMNuk20PjEl6HJHhJOgzg4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040027



On 9/3/2026 9:23 PM, Ben Horgan wrote:
> Hi Yin,
> 
> On 03/09/2026 11:20, Ben Horgan wrote:
>> Hi Yin,
>>
>> On 11/08/2026 14:30, Yin Li wrote:
>>> struct resource uses an inclusive end address, so the correct size is
>>> end - start + 1. The previous calculation of end - start was off by one,
>>> resulting in a mapped window one byte smaller than the actual resource.
>>> Use resource_size() which correctly computes end - start + 1.
>>>
>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>
>> I just got a kernel ci report for this one which asks for tags:
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
>>
>> It doesn't look to give a useful fixes tag though. I'd go with this as that's where the error was
>> introduced.
>>
>> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
>>
>> Looks good to me.
>>
>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> 
> Scratch that. As Ilpo points out,[1], there is no functional bug but just some misleading naming
> which never the less would be good to fix. This does require > in the warnings becoming >= though
> and there would be no need for fixes tag. Do you agree with this analysis?
> 
> Thanks,
> 
> Ben
> 
> [1]
> https://lore.kernel.org/lkml/03055fbc-281f-4ed9-9282-4853d560e17f@arm.com/T/#mdb57d40c888ff4ce656a9d9a00ecf5d99466530c
> 
> 

Hi Ben,

Thanks, and thanks to Ilpo for the detailed analysis.

Agreed — the current code is functionally correct because 
mapped_hwpage_sz holds the last mapped byte (end - start) rather than 
the real size, and the ">" check matches that.
My patch switched it to resource_size() but left the check as ">", which 
actually breaks that balance and introduces a real off-by-one — the ">" 
needs to become ">=" once the size is accurate. So there's no functional 
bug in the original code, and no Fixes tag is needed.

I'll update the patch to switch to resource_size() and change the
corresponding ">" checks to ">=" together, so the naming becomes
accurate while keeping the behaviour unchanged. I'll also reword the
commit message to describe this as a naming/readability cleanup rather
than a bugfix.


>>
>> Thanks,
>>
>> Ben
>>
>>> ---
>>>   drivers/resctrl/mpam_devices.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> index 1e082fb60e30..5d1854d97371 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -2296,7 +2296,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>>   			dev_err_once(dev, "Failed to map MSC base address\n");
>>>   			return ERR_CAST(io);
>>>   		}
>>> -		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>>> +		msc->mapped_hwpage_sz = resource_size(msc_res);
>>>   		msc->mapped_hwpage = io;
>>>   	} else {
>>>   		return ERR_PTR(-EINVAL);
>>>
>>
> 

-- 
Thx and BRs,
Yin

