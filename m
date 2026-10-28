Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192420;
	b=mlRcN9oVMWBLBm1o6J3GU1Mk29pPRuQGc1NpQ93wz8c7IVVnk3acN8OlyUZVV/n/dE6T
	 T3E8ds0bjovkL9VeEDIFWsSPw8n77tnAC4gARkEuf9CsaPzYVemOKG9uqKHeAfEOAvtTg
	 zxkCOaL9pA131dKlrVL3wi9c5H5/zBPObb1ukeyL/7pfgefbh7wkEV2/B5rsE4qqwfqXp
	 XG7VF4iiID1QzyeH9p4kv/KqOG9WSh3Ng2a1ExFktlvSrp0zS+kzDHRzOyizCVa+rPfJ0
	 hPPJNCgwXPYlhcaPtoBxJoorA47+IOjNT5dPYcAVWzEaPB7jjq5UBu91nlT364+0zTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MvumFNp4ir0ZQ0AN2j9JePujNRHtA7/CNuMQF2kMQPk=;
	b=kzU5ujY9GDin66fNSa1Q5ZzjFPBFY+IuOfDu5ILlReQXOmXwT0D1j8iUAzv00FMf8CN2
	 xk7Udbg9GbMOxlnbr07VsmEcJE7k7x3GPccEiJKKpGGHv7Pb5htibmV4VUJIt6B8ZWkdh
	 njOKEte57WUwB5N3U44S37tszmvStaxuoRdSHS4PvQn+Pr6uCLFgosP0AXWeuUdK7Y4k7
	 Os48QFiAj2zlE3lB4A62lVAN7DQ5i4Gs2Eye97au3jJ834JnxilYSViQaK0TNjehmEvgq
	 fBuW6J9Bq6YYyPgTMw3dtHXsWcQPzNgmcIe9j3egpviTT9ACVC5y1QPVhJzT53Z8I5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tbUoRIa5;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF770606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF770606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tbUoRIa5
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so8336255e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793192418; x=1793797218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MvumFNp4ir0ZQ0AN2j9JePujNRHtA7/CNuMQF2kMQPk=;
        b=tbUoRIa5gYIobr7aTdIk7Jmnr9LGuF4ShZZYDiWJM8abpadIdyPaY8nkF5m3n92Lm9
         hjdYC1xbFFuBI648LSN9G6gq0shptMIMm5Mg6cqJLgu54CV+aBkED5oe9kLwC5e35Ueh
         eEPeFhER2gMZzMDXLLQo9UqBFZHBqNGwv90hy5eUR7Q1j2DnXGlm+gVrbaTQSWvA0FEw
         f1kmLxsnq61Z2yu43PxkN19orQMRuIM5M6sAMg2vhtfBqzymKPEDGL2tdUrcMmSRO1c2
         fbFkAqWJAhfejNvjhaq9GFbx+pjswkDlwPHEW57D0OaNlvsOewd6U35ceJ3bR7PDYrcx
         j45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192418; x=1793797218;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvumFNp4ir0ZQ0AN2j9JePujNRHtA7/CNuMQF2kMQPk=;
        b=hifCTFOb0W6sIMMepMcydL8WzZpr7SgAAndFG6jMtqEKRxasFmADrsD/bK1ENi4oby
         InvCDDXyJIjBDJA/WnVVC4CTi6Gbmrxqqr/NjUclkPSgbM5wf7MUHp7u/ZmCaiy1Der4
         ydz8QqUG7KsxuSbg19hEKiaE4vO87W+Vqk+wLDW6WYhMdFtXd5Eau4eufnrSh5MpWZab
         8hHruIQOBv19nc481D5vaMYujyJ5cJoS5NLzYh2NAKpUqQKIr9rqcmr6h8ds6cgft6iC
         5IhlLjrZfL7nB1j3iYnovLRPVEYIoLQC2JUM+mwh4kvPtYgMAztxJmtAAAWgFofBG5Jm
         VmrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLd/M2irjOFt/bMsFR46xrUnbe4bs4irEFPXjugkVm1Gp4LwGADJH0UQ6cfn+as4eFhhz9E5ut/qAW0sQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYICSHFSfwmNRTSXmbZkcVXmX92icKH0KyuMOJcBS8TsJNlhpcjn
	BwBSKpCPmbWviZnTlEHgu2Fgd5rIPc68nlw1B0H3FAtn1QwzclWqRhdfl0JFPSXquxk=
X-Gm-Gg: AYBFou0dRFRvcHxbuTST7+kQn6ipCOu43f42D+ug69ZzQhvv5Xf25IlMOEP8bUyXPH5
	BJBj1r/yy2eWYoqL86j0e+rUugqQr4APtGajEcwpcs7+Ov4btaAD9o1XJnxB5tJ3nVXL+AnnzEA
	g5I8qMk7bzbHjQXkB4I2JL44Lo63YKA1kqN/WvK+PRR0V0zBfAKc4Vhr8NjDkKJ5DC63sEOOrNc
	em5QyNikuqypKpv9RJ6M8xEeeE7+D/ELBK95djk0o7fRsj1vrgsnUhGKVZCchP3wsIbYF9FoLHN
	LIxXdjmIx4PzoHscCJHYXzsRT6hSzPJuvm6WtxOBgrtGqlvGp92XzLlPPN7+7UCmk3AAFFQgjD5
	OB4QwiohqCxyB0M9wtZrjNRAbdkfOQh3i2LuQolnpQ6SeGYBorFIIWHaeRellMSLpdULqNlbkkx
	JJokG3o23zwrepEED3870mQSowlSuRXkapY+lR484DTUJPJmeVNZShRzy1D8Cggh4hH7hk3Lcsj
	geoK9K4UbGRIH/bBLbH0hyrvh94/Tj2Kt/fHYRJk0MSxm86ugzdXt7guGiOzjfxg6c82N3LV01p
	TZU9w5d4G0G7VYascKw=
X-Received: by 2002:a05:600c:6085:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4a996a9e304mr37363745e9.5.1793192417917;
        Wed, 28 Oct 2026 06:00:17 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a977edc20csm39272515e9.3.2026.10.28.06.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:00:16 -0700 (PDT)
Message-ID: <59d1e508-365a-4960-9938-d4fbc4141590@linaro.org>
Date: Wed, 28 Oct 2026 13:00:14 +0000
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
Subject: Re: [PATCH v4 01/10] coresight: configfs: Don't assume active until
 cscfg_mgr is set
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>
 <3eda6e99-291f-40b1-9fd8-13ca193b5fa4@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <3eda6e99-291f-40b1-9fd8-13ca193b5fa4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28/10/2026 10:14, Suzuki K Poulose wrote:
> On 16/10/2026 11:46, James Clark wrote:
>> Perf's etm_setup_aux() calls cscfg_activate_config() and dereferences
>> cscfg_mgr, which can be done after coresight_init() has initialized the
>> Perf PMU but before cscfg_init() has finished while the driver is still
>> loading.
>>
>> Fix it by only assuming cscfg is initialized if cscfg_mgr is set.
>>
> 
> Is this possible though ? The component drivers are dependent on the
> coresight-core being loaded and this is not complete until the coresight
> module has been initialised.

No component drivers are needed for this path. etm_perf_init() creates 
the PMU regardless of whether any sources or sinks exist. Perf can use 
perf_event_open() on it immediately (although it would fail eventually), 
but it would be after hitting this part.

> 
> Or the other way to fix this is delay the etm_perf init after the cscfg
> init, which clearly is the order of dependencies ?

That's what I tried initially, and that's what Leo suggested on V3. But 
cscfg is dependent on the core creating some sysfs files first, so the 
init dependency is currently in the correct order.

> 
> Cheers
> Suzuki
> 
> 
>> Fixes: a0114b4740dd ("coresight: etm-perf: Update to activate selected 
>> configuration")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-syscfg.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/ 
>> hwtracing/coresight/coresight-syscfg.c
>> index 2bfdd7b45e49..7e3c9844bc00 100644
>> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
>> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
>> @@ -26,6 +26,11 @@ static DEFINE_MUTEX(cscfg_mutex);
>>   /* only one of these */
>>   static struct cscfg_manager *cscfg_mgr;
>> +static enum cscfg_load_ops cscfg_get_state(void)
>> +{
>> +    return cscfg_mgr ? cscfg_mgr->load_state : CSCFG_UNLOAD;
>> +}
>> +
>>   /* load features and configuations into the lists */
>>   /* get name feature instance from a coresight device list of 
>> features */
>> @@ -581,7 +586,7 @@ int cscfg_load_config_sets(struct 
>> cscfg_config_desc **config_descs,
>>       int err = 0;
>>       mutex_lock(&cscfg_mutex);
>> -    if (cscfg_mgr->load_state != CSCFG_NONE) {
>> +    if (cscfg_get_state() != CSCFG_NONE) {
>>           mutex_unlock(&cscfg_mutex);
>>           return -EBUSY;
>>       }
>> @@ -662,7 +667,7 @@ int cscfg_unload_config_sets(struct 
>> cscfg_load_owner_info *owner_info)
>>       struct cscfg_load_owner_info *load_list_item = NULL;
>>       mutex_lock(&cscfg_mutex);
>> -    if (cscfg_mgr->load_state != CSCFG_NONE) {
>> +    if (cscfg_get_state() != CSCFG_NONE) {
>>           mutex_unlock(&cscfg_mutex);
>>           return -EBUSY;
>>       }
>> @@ -902,7 +907,7 @@ static int _cscfg_activate_config(unsigned long 
>> cfg_hash)
>>       struct cscfg_config_desc *config_desc;
>>       int err = -EINVAL;
>> -    if (cscfg_mgr->load_state == CSCFG_UNLOAD)
>> +    if (cscfg_get_state() == CSCFG_UNLOAD)
>>           return -EBUSY;
>>       list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, 
>> item) {
>>
> 

