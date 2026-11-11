Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421522;
	b=PBUDhAfZw4jpN72L2fq9xb+nHeef3S8Fi3PRvXHoCmLE1VJu3PUFREP+5fA5bV57lw2n
	 VIzjQ9+TT0f9vfI7oUuoFCfpletFpBelJl0sdjRpibBSq+IQ6IMhpAQmFEQjqvethYpJN
	 yeBxh+m9a/QVs6O1+hTdbBdC7PbSFP2gfiiaGjWenHHzMrjiT4r1ilkcgcqsfh8wO9lXE
	 yRyLal4R4jomk3usAty7mtTj3c7C3dve91BnrlzOkSdMpIDLfT1B0j19JfIjKfepMng1f
	 X/WK28gz2uIl4fvQRphaJCj0bxvBepAh+4AFHEIQRJpkluPZRnB6UwLfgutuI1GzLIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Na1VDzrbvIvpjQE8LtaxXRNWvZdhl6ZmEpKFnkdTQY4=;
	b=tCYWG7jswJBXP5WQTra0rB3np/7NHvVh87u2UPNf1LoBnUllD+ZZ9d5A4Y5ZX4P7wt7T
	 U0+fnYLp+fQUH/LwMdTqZkc1/4YLYHTXLaTrJfHXXtmd/K1M2cWMtGm6XjUCZgg/Ihiju
	 jTTn1FycRrbSMCkOVjC3q/ECTojfgo8ZoCou7uNAo1XZbqI3ce+ycPAXUs7aSoKod2jD5
	 E97bdM7dlPdIfrXF2n6vb7+EmBcU9HUgrY+O8mUhxhRwYWDNCEr1TjImbqqR3wClMb8Cp
	 g/HLtU1wSVjjhlB3PEHC0Hf+pUONkYS9UIbsBaXLW4H3jqaQ0W1MceLsDvb6UgjQlZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s0JToAT6;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2712B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2712B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s0JToAT6
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490d59c3edaso84907f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794421520; x=1795026320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Na1VDzrbvIvpjQE8LtaxXRNWvZdhl6ZmEpKFnkdTQY4=;
        b=s0JToAT6ZHQx4THj03YrjW0djNOazFK9dfLFNZtkAcjPiM0gyoS6Jeqtsnju6Gmy19
         YQz3Vce9issGChX3Iulft6Mf3lylMFvotbddJm1CRXpnV98XkrB8OC9BxbO8YaWGiqIx
         WXw3v90wRZgxAUmBs5Z9bV+u8ee1ZGi95lY+7l7TbYLf3f/UZuPDsERQMgNRDk70to3v
         iux2p9qEZz54UR9E6dW2pd9un15ORwIVnR5y9z3Gl1/ZJLsCdwG3ukpFfTOL5fwwKOLU
         67HJmxOvK6GeFn8Lcx5JmJrGvPLNbMc2M5fnIF5UaurBb4+LSGGj22Xt3ULSLd1qFCV/
         rflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421520; x=1795026320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Na1VDzrbvIvpjQE8LtaxXRNWvZdhl6ZmEpKFnkdTQY4=;
        b=wEbbB/UcOPxDfQGF8D7F38MlFRaJAPRFEfVz53PLjQ/vNIvyzSNAhij0HAMmXTU/7y
         YEyh+3b65KKToiF+CJJJCPgLhfnTTyjTxRmm/awFINKJmf78bxS95trn0EJV8fO3BDxv
         V/LSSifCTzVonfcYTTP+m0PDKWyiPpf2Dz6AVHbMq4XA6KNbBkXjmmXymkkPiVPRyKqX
         9uLVJ0RsrwSzL6A47LivAbf1wHbtv1dTDJfW+GZfYT77OVz1HXauZY9Jn6zUKYLuWFDK
         3jKPAhsm4roaNpjvXp0L0djvXorG1MrCUq628qzqhG7sLZv0aS5b1TtJxAVn8w2INoxq
         d5pg==
X-Forwarded-Encrypted: i=1; AL+hErHS1XVKhp+r/oK0i3qNPCCl6xF/2SEMoPc5GGn7/WyxU79fCoztcHZ7IsHghl7Ct/Bttw2ptIXZnU5HIIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S2oIlYX3B9S0OMJEC5g9g+/TuPOtRPAuYWB9Pi5xbNMJAGBOD
	ul0YqxyIndda/O0una9DgXwTwc+T6Am2SIKmhVDgH7Fqa3ouImtDrIwVkQ7fA0jq3wE=
X-Gm-Gg: AYBFou1VEW/CmI6b6tCasbcmcryUAnlIoIB20S6BrGGf/vgxLdcIJy6VarxswX++0ZH
	NFEbxjfUJ2kgtV+Nt8CJsFWroiXcDulRW0woHB0+OhpzcUyLPOT5bBkmLSc72kYeUP7X4adMz6N
	6MGm+QuPZo2cU2ZoZ6JVYRwWSCwwsak1PVT/dh/OkIRTsY/cRTExf+U7gslCLSBKbpA6PaFBCW4
	mPAkH/rF9o0t7RlR2JAy9YhgEkNEKI5kg+U//+2pepcw1O04h9PtblnfIEt6v9u5nbMOI5PxT6z
	wKkxxQ25WOaSYh7oPQUQsvHgW+Qn1C99E/VUYHBB7xnRwoR3XX6UsbtEQuHaJjiYkYC3lagxCM4
	P3jc8MGCiyMCAKsyIHBGZJUz7KFugMEVof2E37U+x+iet22F0+lhLhgLZ5ph4dtCa8/rW9NymKS
	zhOm2wEasewGDNuZgt+dhcTV07AZ5hGH70uM40Sl1q94T4wHicGhFeyWyFmQLO8D0QXwoHJndUJ
	5EcLTTnRoGVlp2jhBwZODUvUE+1dR8KxxQtUS8ViCHaTP5tV1shlzHyxvnAiwd5tJP7OeeFP7TB
	OKUylDKAQ53efyRpNfRAq8xN1pMszufnwQ==
X-Received: by 2002:a05:6000:5c6:b0:499:527f:ce55 with SMTP id ffacd0b85a97d-49b02f37714mr463058f8f.27.1794421520524;
        Wed, 11 Nov 2026 10:25:20 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836a9951csm12579057f8f.56.2026.11.11.10.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:25:20 -0800 (PST)
Message-ID: <2e2b2e01-246c-4730-95b0-2ae0e7281db2@linaro.org>
Date: Wed, 11 Nov 2026 18:25:19 +0000
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
Subject: Re: [PATCH v2 19/23] coresight: trbe: Reload the AUX buffer on
 overflow restart
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-19-3f57cf3199b1@arm.com>
 <d93b9120-197d-4b01-a9ab-8df01657716d@linaro.org>
 <20261111174626.GF9176@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261111174626.GF9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/11/2026 17:46, Leo Yan wrote:
> On Tue, Nov 10, 2026 at 03:12:06PM +0000, James Clark wrote:
>>
>> On 16/10/2026 17:55, Leo Yan wrote:
>>> PERF_EVENT_IOC_SET_OUTPUT lets events share another event's mapped output
>>> buffer. For AUX events, this also selects the associated AUX area and
>>> sink configuration. Perf normally establishes this sharing during setup.
>>>
>>> Consider the following hypothetical live-redirection sequence, permitted
>>> by the inspected perf-core paths. P is a parent event and C is its
>>> inherited event, with C->parent = P. A and B are mapped AUX destination
>>> buffers owned by separate, disabled cs_etm events in different task
>>> contexts. All three are per-task events restricted to the same CPU, with
>>> compatible output settings. P has no mmap of its own, allowing its output
>>> to be redirected while A and B remain mapped through their owner events.
>>>
>>> 1. P's output is redirected to A. C inherits from P and begins tracing
>>>      on the selected CPU, so its open AUX transaction and TRBE hardware
>>>      both use A. P can be inactive while C is running because their
>>>      events are scheduled with their respective tasks.
>>> 2. A userspace controller calls PERF_EVENT_IOC_SET_OUTPUT on P to select
>>>      B. ring_buffer_attach() calls perf_event_stop(P, 0), which returns for
>>>      inactive P without stopping C. P->rb now selects B, but C's existing
>>>      handle and hardware still use A.
>>> 3. C's next buffer overflow invokes trbe_handle_overflow() from the IRQ
>>>      handler. It saves buf for A, ends that AUX transaction, then calls
>>>      perf_aux_output_begin(handle, C). AUX begin follows C->parent and
>>>      reads P's current rb, rebinding the same handle to B.
>>>
>>> This is a hypothetical API sequence, not a reproduced TRBE failure or
>>> an observed buffer switch in normal perf record operation.
>>>
>>> Without reloading buf, __arm_trbe_enable() calculates the next buffer
>>> using B through the handle, but its workaround and hardware setup still
>>> receive A. If B has never been enabled, its missing CPU association can
>>> cause the normal-offset calculation to dereference NULL. With a snapshot
>>> buffer, hardware may instead keep using A while perf accounts output to B.
>>>
>>> Reload the sink configuration after perf_aux_output_begin() so the buffer
>>> and handle refer to the same AUX transaction. If the buffer is missing or
>>> its CPU association does not match the interrupt's CPU data, truncate the
>>> new transaction and leave TRBE disabled. Truncation requests perf to stop
>>> the event; a subsequent normal restart installs the buffer and its CPU
>>> association through the sink enable path.
>>>
>>> Stopping inherited writers during output redirection remains a separate
>>> perf-core fix.
>>>
>>
>> Shouldn't we do that instead of this? It seems much better to fix this in
>> perf core rather than here which is hard to understand and appears to be a
>> bit hacky, and doesn't apply to all users of aux buffers. I would expect
>> that even when using PERF_EVENT_IOC_SET_OUTPUT, the buffer should be
>> consistent between start and stops from the point of view of individual
>> drivers.
> 
> This is only a hypothetical scenario. Fixing common issues in perf core
> is right thing to do, but I'd rather not spend time on this until we
> can identify a real-world case.
> 

Can we drop the patch then? Doesn't seem like there's much point in 
fixing a hypothetical when we know the real fix should be elsewhere.

>> It makes sense to add a workaround in the driver if we can't
>> control that behavior, but the code is in the same repo. Maybe we could even
>> just leave this patch out and do the core fix later?
> 
> Let's see the simplified flow:
> 
>    trbe_handle_overflow() {
> 
>      buf = etm_perf_sink_config(handle);
> 
>      ...
> 
>      perf_aux_output_end(handle, size);
>      event_data = perf_aux_output_begin(handle, event);
> 
>      buf = etm_perf_sink_config(handle);
> 
>      ...
>    }
> 
> The overflow handler ends one AUX transaction and starts another.
> Although perf_aux_output_begin() returns updated event_data,
> the buf pointer still refers to the old buffer, potentially causing
> a mismatch in the hypothetical scenario.
> 
> In contrast, Intel PT and SPE use the updated buffer pointer returned
> by perf_aux_output_begin() to program the hardware, so they don't
> have the same issue.
> 

Why not do it the same way? Get the updated pointer from 
perf_aux_output_begin() and if it's different, reprogram the TRBE.

>> Unrelated to this, the sashiko report that says there is an out of bounds
>> read if the output is switched to an ETF buffer seems to be pre-existing.
>> But it's something worth thinking about.
> 
> I roughly remembered the comment mentioned a race condtion due to swap
> TRBE and ETF buffer _within_ the same session. I don't think this will
> happen. (I will double check Sashiko comment).
> 

What do you mean by session? Do you mean multiple events owned by the 
same user? AFAIK all you need is access to an ETF event fd and a TRBE 
event fd, anyone can get those two things by opening events and use 
PERF_EVENT_IOC_SET_OUTPUT to connect them together. But it's a 
pre-existing issue.

> Thanks,
> Leo

