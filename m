Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243107;
	b=NmIXSvt9JKBtSmin15WBOD0Xqv7knpH4qmUC3Mix1GrwB0cEyCh2e2dFBJh5Ji3CCTIu
	 p/P5wYBhOlQoLUIdV0tlctJ1vPU6EqSLS61QC3cavnvv3jsb7mtsp2e0VG5H/+XFUD9NM
	 XCpXlTpTaIuEaOH595+mi+SD3mnZtEFw3i0K2kaqeaMfdLPkkX37NaIdWtLy26Dz4sg5I
	 OrjXBOplTmfjmH0O+nre7NEG9M1XDFJ1XJuaOpB4u7HFbT8Cztq9f30X2ksEYo4qsAFDp
	 QX8UJyXwRSWTIbCaIiieWSgM0eSJhYVpd348P2/EW12J/3GfuVHVrU437LHLT0vZuhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7vNr4k+b01YY8p+kpU/hMLREhjgtpBFIV1zNsYWBE8E=;
	b=pRmtSZreYczOuIDPcSiEgpbIww+wUsDcY3JdOogVghQMGRR4fiNCHRg7XxIN+o5K/Vne
	 MpPjwUmIp18rKMv+yFMKI4+iQJ0eJZV00tV9jnrbnJBuly5+DaPBLWwyEgRPtYOHlREcr
	 d7pTmGRbpfw8OD3aDxUQa1g0+2OAgAhWylZDKqlF0vvA5vBWQMRyx+WGzwsNWqDw4Qghy
	 RH1JZZH7zrUENIWE8wzfAGxT1xRqvVbPzS/suhGOmX0Y7NPyWzQoHbwKczmyi2W0z+8ve
	 ztmK5caEV7lO2jnkl1qV0FLr1fdLrWaQCmSGZT1TzEpZpLvCDEE4K5s0RIXqiOdUlVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TIjGXxmE;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6567606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6567606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TIjGXxmE
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so13818515e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794243105; x=1794847905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7vNr4k+b01YY8p+kpU/hMLREhjgtpBFIV1zNsYWBE8E=;
        b=TIjGXxmEc0J+waHQH4AbvJETurA1qXTmtcJZrhP2R6CSK6YpADyo7cBBC97io0peM9
         QGQeqhXEbStvr5n9P0d1iRLifbWVAQZsqhqQ8OyQaDPWCNijYZsl34e77cR0sgfVT5h8
         e4KckryzxnMPS/2/pBzFvB0K5EVdDzV8W9AxT1pBD80HzekAGkdztbPSu75XIk98Ak1G
         Qakl8jmUjOn+4fQO6L4BoEDpPLTTgfk2TTI7Se+G9Y7mYO8/mcMMDwOkhnwEcOMu3O15
         9WdDiHJZ0iB8PBQBGxIfLH/SgkibptUQNE5MvCCLCMMzydXjyvoSz0ufR8m6ojT00lLG
         VYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243105; x=1794847905;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vNr4k+b01YY8p+kpU/hMLREhjgtpBFIV1zNsYWBE8E=;
        b=gcvL4AsonWyUVE1IvYoicXJ/rfK0X8yoXxn2ix7WrVTmW/cjhasoEZK3/8FZx4i0Ay
         QaOJH9WFsJ8gz/Cy8L32Ra/8cyUzSeBJUszOwb52FeUaqn3Dm263FAd7EiuWHnOWNmgJ
         eK8x+dlpek5LobBpJLmunb4ASaDctE5MnoJfGZAqAPtpToo4gO3mFs0w48V8WME4732U
         sA93Io031kUjlOcZ3Ow2acaynMVcLTVzVNVN1OvSnkya9PK78WzXwTS3118yozErOvXu
         J+hd6/HtPNfbVt/3hK3785MqJpj7FMUkReZZmqt93WUhPZ6+x6aln0+gyiowZ+rSOFaK
         2dbw==
X-Forwarded-Encrypted: i=1; AL+hErEZXCZgG597qmep7zc7mCUMF5etSS43SVGMhG78K5j/CL8FpjlCwJOkCfM9PJX6UwsxLgwJB36WeiDzs1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hg0g0QI23qxwfbScwBKBeAHNJoSPTGVvLCZoyKSuKkhr3J03h
	4nZEOvw7maYeWqixT5LIidoDA7BU9PsKXzhoaZvtK+vE76al8EeEhnZEgfjLqfPnTvQ=
X-Gm-Gg: AYBFou0OD9fJe1aw7H9vLecZTyNSPi1jxXiuliHs5lc5aeu9H6i6AUjRXFCPOmNvfUd
	H8Zu2El18eH4/qDHutT62DizyN70lwZ+yxzEoGKsuvZn8weR3J25TnY4fZaGEbu6s0c1ndlTY30
	wKZH7pGgPBtER5sogxFU06x/xsa0c2cSW9UGxUgZlXrVFDtrBVzlwZDdoUSq0dQv9pW66ZzB6xD
	kS00mFVNNvFnqWDzsMao2MUs0FHZbC2j5D1eQkHpIdwh+j7qLsE+CqbGOXscQ0MHs5D7F/V0/aP
	iHFX5Zk65RsTJOVT9vMYzWAapZ8ywGyisl06Ru5R/Me2IjxQVmPqvTHKwC/kXufIcqb41F8JPNt
	9pRHc8nAVdwz3D9scUIVy22rVPJkwOfL3zhgJr42Fw/UmJkiAIzRNAzLptU74DCwaPvQjcvyhsx
	VwHYT7DYKEMmeG8x3e5MmlbznQteFTMu1r5hWF99OuyR4K1eZbEfTiagEAJnZTxvEEh25eKcGD6
	KY9gLhQoAiDS3xTpn9sK6hzDs3QZbdQt8nIdKNNM6dAKEmt6nwmjQXnyEK349emHxx3VJTewibo
	SHI9/FIlZUvmWdF4QA==
X-Received: by 2002:a05:600c:4e05:b0:4b8:4af2:88b3 with SMTP id 5b1f17b1804b1-4b963c6d91amr84003165e9.22.1794243105036;
        Mon, 09 Nov 2026 08:51:45 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2c5asm361995e9.5.2026.11.09.08.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:51:44 -0800 (PST)
Message-ID: <06beb206-886b-4a40-a406-3d877443f5c2@linaro.org>
Date: Mon, 9 Nov 2026 16:51:43 +0000
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
Subject: Re: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop
 sites
From: James Clark <james.clark@linaro.org>
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
 <f8a2f477-2dc7-45a9-a2f0-f6e279ebf8f1@linaro.org>
Content-Language: en-US
In-Reply-To: <f8a2f477-2dc7-45a9-a2f0-f6e279ebf8f1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/11/2026 16:40, James Clark wrote:
> 
> 
> On 16/10/2026 17:55, Leo Yan wrote:
>> TRBSR_EL1 records the status of the buffer that just stopped. Clearing
>> it in trbe_enable_hw() postpones cleanup until another run starts. If
>> AUX output cannot restart, for example when AUX space is exhausted,
>> that clear never executes. Clear the status in arm_trbe_disable()
>> after disabling TRBE instead.
> 
> Why is leaving it set a problem though? That's not mentioned. Maybe 
> there is some later patch that requires it?
> 
> It seems like clearing on enable is cleaner because it only requires one 
> call to clear, but this replaces it with two separate calls without 
> really saying what the benefit of the extra complexity is.
> 

I see Anshuman left a similar comment on V1 and you said there was a 
race condition. But that explanation wasn't added to the commit message, 
and I'm not sure if it exists anyway. A late IRQ after already disabling 
the buffer would just hit the check for a NULL aux handle and not run 
the handler.

>>
>> trbe_handle_overflow() can start the next run without calling
>> arm_trbe_disable(). Clear the stopped buffer's syndrome and status bits
>> while TRBE is disabled, before attempting the AUX restart. This also
>> leaves the status clean when the restart fails.
>>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-trbe.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/ 
>> hwtracing/coresight/coresight-trbe.c
>> index 
>> 26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b..dd9c9330bb0c739795f300dafc6ce34e72fbf280 100644
>> --- a/drivers/hwtracing/coresight/coresight-trbe.c
>> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
>> @@ -655,7 +655,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>>       WARN_ON(buf->trbe_hw_base < buf->trbe_base);
>>       WARN_ON(buf->trbe_write < buf->trbe_hw_base);
>>       WARN_ON(buf->trbe_write >= buf->trbe_limit);
>> -    clr_trbe_status();
>>       set_trbe_base_pointer(buf->trbe_hw_base);
>>       set_trbe_write_pointer(buf->trbe_write);
>> @@ -1069,6 +1068,8 @@ static int arm_trbe_disable(struct 
>> coresight_device *csdev)
>>           return -EINVAL;
>>       trbe_drain_and_disable_local(cpudata);
>> +    clr_trbe_status();
>> +
>>       buf->cpudata = NULL;
>>       cpudata->buf = NULL;
>>       cpudata->mode = CS_MODE_DISABLED;
>> @@ -1095,6 +1096,13 @@ static int trbe_handle_overflow(struct 
>> perf_output_handle *handle)
>>       unsigned long size;
>>       struct etm_event_data *event_data;
>> +    /*
>> +     * Clear the status. No context synchronization is required here,
>> +     * since context synchronization will be performed before TRBE is
>> +     * re-enabled (see trbe_enable_hw()).
>> +     */
>> +    clr_trbe_status();
>> +
>>       size = trbe_get_trace_size(handle, buf, true);
>>       if (buf->snapshot)
>>           handle->head += size;
>>
> 

