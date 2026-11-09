Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237395;
	b=Ep80YxZwJEW9azgJ+POhZjsEw58E+yEdJCIa8H4FhPqszzBIrHJELA+bdpi9AmL5lsvP
	 eyvGsHMHQCj+L6kYuxQnFacBpWYGJ0vKSoZdhCQ8nLb+36tdEIXeaux+F7Trq/N8tso/Y
	 +LKUAKbAnaUfWSAqNn7eVNIEaH9On2T7jp29QkmewMRfGnfAldm0BK6ye+XBWKWvm+z9x
	 MgvmEdMUD+1u8EYxB0MSB0Pw/Qo+aFWZ7eTd0Su6oSmJEWRt8cpTEnRosOA18G0FTyCrl
	 Zpi96fuQBxqfGk4uw8Yi96qMnQ/obw7Lk9Ln/aQVjTrwXwHQHBFksOB8IEOSriIsySg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jkscwoMz/NtwK7adTu7thVWKraeXz1/KWC75TgatP5E=;
	b=xbgVtwwGka7tx7v7zhGjdVfp+mezVn5TqYX0kywA0WVWqg6iHFp0D30tsrIE61IAoZit
	 08guzBhVhz/yOehzUI/SmMLRsw5NEqdbcQibkxkTQw+2UgHqATrsN0ZqXdSnt7WPJEdHS
	 hxAy35fL+AlgrNy4uXVP3bJGKsTXP9K5pAAaOmHzGPK6SWLz6U8qRhoX8PcmEx0xCLM8U
	 HSbA/kg/mcrnhOvaGRDxJuRMLefnzpbdoWvoINCAye3ASc35azTqbAquftw4jfouV2pKF
	 nmZVdEOFbumHoiR1Ds531LnXfsWK9DIXuqLEF4Rc3HddQIHaXysTxrl9zygfjeXDVUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Xs8Oszdy;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B12606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B12606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Xs8Oszdy
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so10941255e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794237393; x=1794842193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jkscwoMz/NtwK7adTu7thVWKraeXz1/KWC75TgatP5E=;
        b=Xs8OszdyHPnrMpzHZZO6hjZ6A2iLC0CKaCtZnwgj2MHJPWfpJLEAZq/hLIovII0Air
         kmQU4uSGZLoloyJyht8LaXc5LLx9E4P4zMskHlDWPz5z8UfByygqX2h6E8P6de2bs7GG
         zCUNfluH6GdU0bYfhCsy0zIiq/k8rL2bg/uzk4iuR/dmSlfuBGkQb4WTisfpuPXCtojt
         0htC1DRci+FVRlozeA/telQ8BkSTqzKzE+z3VBq8T3Q5P/+XEE18/TfjE1QsXRP+LERx
         rzWp+zvRamVhjiYE042jAKv/8+gU5ROH0QeKiDf+pCJ13Y0yVXWwEzlUt1V5UCgg84Iq
         +ljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237393; x=1794842193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkscwoMz/NtwK7adTu7thVWKraeXz1/KWC75TgatP5E=;
        b=UXGh9/uvJRoI82m5Ud7nSGaCZSUVCUW7Gk1mMN8qbak375AIGpbxNxq247J9g4lDjM
         SDftUh87F4YBnyvoP1Rsaqi/NVLq98mE6+glD4U5jpYX9lUEHZQABxSwiBYEwXFf5bWq
         hPTcxYk0NjrVHivsBKlYbzZ9zlQ2WX+yu3nhXcAME8pRjSTnKxxxxk9tivbSg4dDBmVd
         kECgPkVzajJmXOnNJtLKWIkKqS/pkq4wguctIpUAwPPWjgPSwuJn04JS7d6IbN+yDTFG
         rsp0e1gTFWJttAjDyriyZAK/mitos7q/D/74U9Wmmm/4KSWe4BNCIwth5gFDjkRWpgj/
         g6Xg==
X-Forwarded-Encrypted: i=1; AL+hErHCb5PfX/VnPLisJt35ktik1uMdqliYDzw/fJK3qAth/I7uCtwTQtYmZxaFCXu9qTWW7w7hbBFcWSGlF9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kQVl8CjuE62ZVFxJxbJfEyAesu19UoVch6diVXUO7Xa58NacI
	HkCTk5dCyQYaAnUXEjvX7tlo1BlsYDkFe+U2Zg7BMPZoxeyh984tdBNKFuCv/JCY+oY=
X-Gm-Gg: AYBFou1/UXd6W9i70GqAPJqEHqm+yd9kFNu9xlDFJucHKISSFAouyFxZ3ZM319I254s
	r45X4AcWoSkU0G+KJ3F7VbfOvrxT14R3w2n7o83DLS0jrDZwI+KsvkcEK3qvF9jjsqc0A57mWTj
	qL2pxg8i7f4JhZXSWuz540MLv1kswcvUCXAMsGZfKlBLrB9lHQ7EFfgiUV0qk4HViUKdG0xhXez
	6whjAoi84YaeNrN2+bUkLVug8Xi/I09uIqZexkWOVkUeU4c6Rf3PGZ2T0TcIKH15Q47a7s2g7P8
	8lITVkhqPUITLvrUp507wBMsKjxf4F4ozcVsO4jxrwxoyduu0uwTMRpFzCIxiU9OAedcmArf14i
	AEcvBCVBQ63msJpK3al1skfCnkxCuNXQuMDTvMQteJWoUxQEOTYvH5auFrkbcA8QjNoyWEwx20K
	m9xO/6q0aU+rfdBre1mLcZIWTmTxBjVogWfjUanwyhra8B9MuE52Ivod8ulyDzkAKvB1gBvCJO2
	FJGq5SnCQpg+JcguM4oVBO0t5FKK/YU3oBW4hS4eUB81wxy8N8Mf1MpWtecpTzVvSQXtubER/gK
	02v70wM/TMVmf5pvcnxJ3VxgbclOqjQAwQepOZjWFWq7kSMWMOFohZv8o7TAqrQR
X-Received: by 2002:a05:600c:818e:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4b963c85687mr70833595e9.21.1794237392747;
        Mon, 09 Nov 2026 07:16:32 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm165199245e9.4.2026.11.09.07.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:16:31 -0800 (PST)
Message-ID: <97331297-3f78-4f6d-ab24-61cf329647af@suse.com>
Date: Mon, 9 Nov 2026 16:16:30 +0100
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
Subject: Re: [PATCH v2] module: Fix use-after-free in module_put() tracepoint
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: mcgrof@kernel.org, da.gomez@kernel.org, samitolvanen@google.com,
 da.anzani@gmail.com, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022184517.66438-1-atomlin@atomlin.com>
 <2fd1031c-7a86-45cc-a595-bbd13e102d43@suse.com>
 <zjuuet74suq7dujrlt4pfeoajtksegfrslsmokgvfjg6o6pghk@dbifrqvwrnaw>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <zjuuet74suq7dujrlt4pfeoajtksegfrslsmokgvfjg6o6pghk@dbifrqvwrnaw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 3:28 PM, Aaron Tomlin wrote:
> On Mon, Nov 09, 2026 at 02:47:31PM +0100, Petr Pavlu wrote:
>> On 10/22/26 8:45 PM, Aaron Tomlin wrote:
>>> A use-after-free condition can arise in module_put() should a thread be
>>> preempted immediately after decrementing the module's reference count
>>> while the module is concurrently being unloaded.
>>>
>>> In module_put(), the module's reference count is decremented via
>>> atomic_dec_if_positive() before the module pointer is passed to
>>> trace_module_put(). Consider a scenario where CPU 0 decrements the
>>> reference count without reaching the baseline MODULE_REF_BASE level and
>>> is immediately preempted: it relinquishes its reference while still
>>> retaining a local pointer to the module. If a concurrent CPU 1
>>> subsequently drops the final active reference, the module's reference
>>> count reaches MODULE_REF_BASE. This permits the module unload sequence
>>> (via delete_module() or the initialisation-failure tear-down path) to
>>> proceed and invoke free_module().
>>>
>>> Function free_module() invokes synchronize_rcu() and subsequently
>>> releases the memory backing struct module via free_mod_mem(). Because
>>> CPU 0 was preempted outside an RCU read-side critical section,
>>> synchronize_rcu() does not await CPU 0. When CPU 0 eventually resumes
>>> execution, it passes the dangling module pointer to trace_module_put(),
>>> which dereferences mod->name and mod->refcnt, culminating in a
>>> use-after-free. This sequence of events is illustrated below:
>>>
>>>     CPU 0                                       CPU 1
>>>     -----                                       -----
>>>
>>>     module_put(module)
>>>       atomic_dec_if_positive()
>>>       [preempted]
>>>                                         module_put(module)
>>>                                           atomic_dec_if_positive()
>>>                                           // drops final reference
>>>                                         free_module(module)
>>>                                           synchronize_rcu()
>>>                                           free_mod_mem(module)
>>>       trace_module_put(module, ...)
>>>         mod->name
>>>
>>> Resolve this by moving trace_module_put() prior to
>>> atomic_dec_if_positive(). Because the caller holds an active reference
>>> to the module at this point, the module structure and its name are
>>> guaranteed to remain valid throughout the tracepoint invocation without
>>> requiring preemption disabling or RCU synchronisation.
>>>
>>> Fixes: cb0b50b813f6 ("module: Remove preempt_disable() from module reference counting.")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
>>
>> This version #2 looks ok to me. I plan to pick it up on the modules
>> tree.
>>
>> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> 
> Hi Petr,
> 
>> The additional version #3 [1] seems unnecessarily complicated to me. It
>> is ok to report the value of module->refcnt before it is decremented. As
>> noted earlier, other code, such as xfs_group_put() and objagg_obj_put(),
>> takes the same approach.
>>
>> [1] https://lore.kernel.org/linux-modules/20261103163103.13195-1-atomlin@atomlin.com/
> 
> Thank you.
> 
> However, I do prefer the next iteration [1], since the use-after-free is
> resolved without altering existing tracepoint semantics or introducing an
> off-by-one discrepancy in the recorded reference count. Finally, the fast
> code path is fully preserved when the tracepoint is disabled.
Why is it important to preserve what this tracepoint reports? The value
isn't off by one, rather the tracepoint would now report the value
before the decrement.

I'm trying to understand why this case matters enough to justify the
additional complexity in version #3.

-- 
Cheers,
Petr
