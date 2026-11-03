Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709046;
	b=u1/cYnl3QcxFms5ZYmbk9AZmigxS9zq+OI4FHUl+pDvW1GPvDBnyKRijsE/Rs2lLK+v5
	 FNid3H6LqYs5FGS588W7pp3xIKGYexW7eeDDTrq6oLznc/ZKBDkp8DU15O0GnrSSLzebs
	 ZH0uc2N7GMHagCbsFPK6kQJMvXgfTJXqaqWBzik20opw4O2u4x7zzu3h7coNbljKI3cA9
	 YPNMtwNNG+cRC79L0BKwzGoSWhhKiRv5LahDtcmiE3HxHuwgA/s9iyMQ2I0Pj51IwuNfe
	 vYhBg3EqVuHxE6ZJ0qNvtGOCcTLaxvHXtUo4ibZfVG5IeDfo71FzZJpAn1oiL0U4GvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3stn33i+P1qmHkcgrQZUldUGXQHr3+ePFZUQhGyd6NQ=;
	b=FWpLaPSerBxn7U1U9UCw3egNEvZ5NCwulhZdYCsMqkykYg1EuZ2KruL6ZbopoZDkJ3RZ
	 TYXRM7ELUWzQTXLY/omtGqKJeOlwzN1x3EYcuawLbkVIxP4JkI7OckDcWZu5TALyLlMBM
	 GslijVP//B12Oj/hCse1dKlIrc965acfZWbNdwhoXgSIosboy4V8tyBHkZsAdJPFCubDN
	 sbSGvZsBFGb6koq+fALryc/yOBQLoHH04IVCqHCcKD53G3ikn+E2KdEL+H89VG+ij7NBs
	 RHYxz2GdXpTAt6fd2DGkPVIVp4QtM3bNytcWPhPhYvp6uOXHm/7OtjQvQmUr08nXFDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=R8qTMSG9;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=LQzp9t4t;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E099B60850A8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E099B60850A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=R8qTMSG9;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=LQzp9t4t
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A39rrGg921161
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 07:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=3stn
	33i+P1qmHkcgrQZUldUGXQHr3+ePFZUQhGyd6NQ=; b=R8qTMSG9Jo1m2QojutdH
	XJLRV96rFWy9GW5tG5iuvsd4hHGxLpqwvTm38k5XW8dzy2KJLDLZzrskcSdKrGOD
	6cZwuq9BwLCi4nXpMr3ZYo+1o/6pci/2O5hiPSY121RNPzbzLItNsg0OHhYhXXTn
	NegkvRPI88GReBdqBp1YprLGsiYTEfWoKmAFWZAUa5HLLO+rpm6zCmhV3w34fE5g
	ykaw62RgQd7NCCYP/+Z4uvP9G8PDWrv+AYo4mY8xtSWR4+vAzbYZckrC/kOVLapR
	8eumUah4tBH/z5sUZulu8gxpK6f9vm3RyhJbhLBiNe1xGHbWdcurfKN5emr6Cqff
	gA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hq3y8at5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:30:44 -0500 (EST)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc0e78a4ccso631079137.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793709043; x=1794313843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3stn33i+P1qmHkcgrQZUldUGXQHr3+ePFZUQhGyd6NQ=;
        b=LQzp9t4trMnFRYf/KHZ4AcjI7+2WeXECYtysC3P9VXpEGweBvBUJlqTQDmTFx3xQiN
         thklZ5/rqtOMArdFEHet+7GWtXF+umjriAwNiyWpe3nM8/tJmhRqRV9xlXB8gXBbHlVF
         sh2LT3vQEH8ipqOh7snfbnEFgNRsWYKi8WUgWyfN0/Fkq/g9vedBcX85Qsd3W7RqTRyT
         7lVo621/+GC28Sju/jeOAf5t8dA8wlKGOsW9D1FbR5oGTj1DpWuyz8eLLruJUIvSm84e
         24Y2TvQ5AsiY7BmtCM8QDPjkXhKSibUrEwoBDRP4YGBBCrvsForWjHGBNZVviLK9Sfhp
         VKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709043; x=1794313843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3stn33i+P1qmHkcgrQZUldUGXQHr3+ePFZUQhGyd6NQ=;
        b=FqKBqzc1Emkdci/Dl574nbxZphyWApY6zRz8z9OKFehfxPvj+sOGHGg+a8ZFW4y1vE
         BBrJBj4NdDK90kKD0mfFuvI2Vi1pe/fB9Yz59z6IiDlx7U5kagKCzYSi8De+Evrc/3Bc
         ZkZ+g2tFgJBvtexTI7atdlJrXEnTujLt7OIxJmSEO2Nv0blvT1v717hXTvNzb4oMuk9R
         iRxvYvkdoCKFebXsvuLOPfuvgh6lGVayA/zn0SI5a+PXMtpFdLVvD7/cZxtXsv3acFHI
         tLRd2WJ/6VQQ+SCxYOMrkmYa+96x5ragBR7mcF7U9ZrgQSDUHrxOYtEIUOtjfsKXMhsW
         gbwg==
X-Forwarded-Encrypted: i=1; AKwUvByC4hVXHgMwbWBI0CkBa8Y8Kn6d0yp2lKx5rjxUncmzrCoLikhdmh7T1tj81HZhM24JpdsnF00CTnl2RFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uU7ciP0WO6acRmyhHQUyTxv7uEmX4aiwdSXU0/AFP63ky02nx
	w5XuScBqxB4nRrdHZv1Rme6QNY49wEy/l5FRFjiRfGNfjicqmaMhKKNcJi4IRr17Ynk+nHJQ7Yc
	akeOhr1NzaHTBlK5FdSgPsWjbdGkpf9jofxGJHQP7rVviY5X6eiKQ2xrsIi8Xiw==
X-Gm-Gg: AYBFou3T1WTRvq+waC2fS9zQYZpnoG19N32SOH1OF8oawWgC49M3Zc0l2YNlK7yHOI+
	Tx/g7UBnqzb69pfR3Fj1oQMzo5icKFi9OSUORXsTpQm9fWYczxcDX2B3qE1K4pvPj1/VoJpVzU9
	mSa1KTyI4ZbcN8yzQOUCDQHsqXi96CpLInVS1zJES7xCaMhz0JpWxRSz5SKWdZ5s8ZGnMXOnZVn
	0qkJ/xqi1EQsx90bB4H+XomXVADmfZJQ9vbJ6SxQvN0Ympfmd/nDxqVLspSYEUQHd2d9IYZlg7b
	wguxN9JRw7hszNDmGYMyCPi0uD1fpIRH1GhPbZjeRzkHHt7f/ltbm0KcujMZ2klAr7b3BJ4AW/m
	jwO3R/tMURFM5sk8QIf2XmGho0+N5F5+xNj/2WGbEJu860eLcJ3Stpi1BRl/3GHFI4mHtEL7hrN
	weyuzUjK5xG0uaZXnDdJf8if0ivRmapvYmuEQ=
X-Received: by 2002:a67:e70a:0:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d0726cfedfmr4269653137.19.1793709038621;
        Tue, 03 Nov 2026 04:30:38 -0800 (PST)
X-Received: by 2002:a67:e70a:0:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d0726cfedfmr4269647137.19.1793709038045;
        Tue, 03 Nov 2026 04:30:38 -0800 (PST)
Received: from ?IPV6:2a00:a040:199:85d9:1574:610d:e406:d9d4? ([2a00:a040:199:85d9:1574:610d:e406:d9d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80333sm26747161f8f.32.2026.11.03.04.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:30:36 -0800 (PST)
Message-ID: <7651371f-c3a2-4f35-b817-6ffb32d6587a@columbia.edu>
Date: Tue, 3 Nov 2026 14:30:34 +0200
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
Subject: Re: [PATCH 1/2] iommu: free dev->iommu when iommu_fwspec_init()
 cannot allocate the fwspec
To: Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Kevin Tian <kevin.tian@intel.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean-Philippe Brucker <jpb@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261031-iommufd-folio-dirty-v1-0-2cef66d2d6d1@columbia.edu>
 <20261031-iommufd-folio-dirty-v1-1-2cef66d2d6d1@columbia.edu>
 <7e209fb2-4bda-4207-9109-c67c8df41e05@arm.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <7e209fb2-4bda-4207-9109-c67c8df41e05@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX+jxmuNWFcoHC
 eEf1DP+YzyA/NgW4sohIF+bfuTLoRG8m0O/1zNr5ItO6cvbGEcrh6rcC9pcIUADH416X/XaujcB
 XC6Wu0r6QgdboELBDJepHKa2MqBwsdp5N+KIJuqSXR3LwwRuhRJ4Ipo6LKBuW30x3565cP5REj4
 DjIWto47vZ956OUIOhZ9ifsMETkiLiIvfik7j97R66G3a0mDEbX0TQS11h87+yULjyFxKBHL+3p
 NFt8Y8iMMK16/UEutI8aQy4VUpq7wRN68iKcA9o8GspugLq9I8rp6GAi90bSdMH1948TBA0uxg7
 G6EojjE7RfXxKjic6Pr0EqVFHzFPCVZEQ/2zp55sK7elPkyhFX0FiJ6jsBpyqTp9ojx+dnA7r3h
 gGU3/uTEzuQsWEIwjYg8amWhenelQAc5zL+5CyKQZhaGuP1YiCVbm7DUx3m3OXTVSW6izbBiGzZ
 t/7nBUlPjUl6eaA/GqA==
X-Proofpoint-ORIG-GUID: wyHcuB_gVqjr-1hUoZ1KosRks92CbwT2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX1LvVTB7q5HI3
 uFrekRmrTFbguQBqGh/AY6Kvm5hSky5om2M2X1hmLTT9mSm+AWhAiBPqpkFlbP/wQtyzu39E5HN
 zCz+sRmnixUWUKy3HHVKH8hVkSOmcSPwvVZt8bgwghJ0+zllLNZ5
X-Proofpoint-GUID: wyHcuB_gVqjr-1hUoZ1KosRks92CbwT2
X-Authority-Analysis: v=2.4 cv=TLrQ2Fla c=1 sm=1 tr=0 ts=6ae9d3f4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=PdLWhGWvWCS_fz1MqksA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=10 clxscore=1015 impostorscore=10 bulkscore=10 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049

On 11/2/26 11:51 AM, Robin Murphy wrote:
> On 31/10/2026 8:33 pm, Tal Zussman wrote:
>> iommu_fwspec_init() allocates dev->iommu with dev_iommu_get() and then
>> the fwspec. If the fwspec allocation fails it returns -ENOMEM but leaves
>> dev->iommu allocated, and it leaks.
>> 
>> kmemleak reports it when iommufd_fail_nth injects the allocation
>> failure:
>> 
>>    unreferenced object 0xffff88811c138b00 (size 192):
>>      comm "iommufd_fail_nt", pid 783
>>      backtrace:
>>        __kmalloc_cache_noprof
>>        dev_iommu_get
>>        iommu_fwspec_init
>>        iommu_mock_device_add
>>        iommufd_test
>>        iommufd_fops_ioctl
>> 
>> Free dev->iommu on failure if this call allocated it. iommu_init_device()
>> allocates it before calling into the driver and frees it on its own
>> error path, so leave it alone in that case.
>> 
>> Fixes: 72acd9df18f1 ("iommu: Move iommu_fwspec to struct dev_iommu")
> 
> No, the bug is clearly the early return in 2a918911ed3d ("iommufd:
> Register iommufd mock devices with fwspec"), so fix it there please.
> iommu_fwspec_init() has always been designed to be called in conjunction
> with iommu_probe_device() which handles cleanup appropriately. All of
> this mock_device hackery not using the proper probe paths is enough of a
> pain as it is...
> 
> Thanks,
> Robin.
> 

Thanks for the review!
I'll change this for v2.

- Tal

>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>   drivers/iommu/iommu.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index cd1bca7ede9a..69be8819e05d 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -3074,6 +3074,7 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode)
>>   {
>>   	const struct iommu_device *iommu = iommu_from_fwnode(iommu_fwnode);
>>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>> +	bool new_iommu = !dev->iommu;
>>   
>>   	if (!iommu)
>>   		return driver_deferred_probe_check_state(dev);
>> @@ -3088,8 +3089,11 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode)
>>   
>>   	/* Preallocate for the overwhelmingly common case of 1 ID */
>>   	fwspec = kzalloc_flex(*fwspec, ids, 1);
>> -	if (!fwspec)
>> +	if (!fwspec) {
>> +		if (new_iommu)
>> +			dev_iommu_free(dev);
>>   		return -ENOMEM;
>> +	}
>>   
>>   	fwnode_handle_get(iommu_fwnode);
>>   	fwspec->iommu_fwnode = iommu_fwnode;
>> 
> 

