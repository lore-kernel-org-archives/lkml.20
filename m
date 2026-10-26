Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007390;
	b=gWGHA2F65R5zpPuO9gB9SjsLVsezCnWrLj/wm3LEwpuaSvyPZC7ZNdLHN+pK98suagrI
	 MaiIhHemSnPNWOCxtjaNCfprYE/xNprp9DV+9SN5v7tDAMnXrgUi+QqsxCt4yn+z4CvSW
	 Rt9j2rOYqInPL0AOFJk4fetGCHpzqCj18lvZjd+P5DOqpgyx3xM52z6RL3VeLbBvoQKCO
	 O5R5om+Ax0mHQ93f0dVMqPIg4jk4JgR8nk8aEa+KQcZV5USs2PD/MvaetqTHuFAFwzEa5
	 oc8Y8rYg8yBsI8S1MYiGEq8NcdAGXPcKTPRIg5ugr2wai/MjWimPDOjw4hap0UTHtNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xZEbYJuiqAEmfWzwwBWYGmvrF+bVdL42cX97Jy2+Bwg=;
	b=1OlFQET7cTebFSi4SIIZSPQ9Gir40KylOPxlBj19SijiU2cYk7NPoqvZ8OnI4R2uRODd
	 s2HPzkmMd4UF8MztS66/Dr9i6MC2xsnd880Gf0LcKC+tk7yV+ubvB8IdxzSprVmiWBSxv
	 KggAQw39nmMtXwRvcL+quX/DRdqZOAlS6kxgeMhSFDx5FaOORy07cwNygW8edgO969IP7
	 bKk8Buk0r9ZqRpnbYohekFf5Fqycb0YllJGViE2ecn8qh+UlCEvH5igp/B9SUAFz0a5rW
	 MUwyvznmjB3m5ccd3J2elP6epzzMPsvURYcmPIvJAnMNyBatctU+A64FEyFcTRq6thQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UGuF96BO;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA028606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA028606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UGuF96BO
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so19377305e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793007388; x=1793612188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZEbYJuiqAEmfWzwwBWYGmvrF+bVdL42cX97Jy2+Bwg=;
        b=UGuF96BO/EuJ908f4AhL0jvn3+rdIHvpEwN2Q1ood6dqwA2CEIRBNTpveBrSaMLP1+
         +c7++5xsTyMXJtkZs8+G7AuHPvnOKcvQTlT4tx7OboTeQPBvm0Kvy7tEiF1h9kKAQh/S
         JBDu9bmVMC72RKP/Q8BMszrVhfownxcSR7rjJRU72w8+piehuG7/1WQrZD3eIEkNXUf5
         p71pgx+MoqRL7QcKRwYrMAha/9qwZasvo6ag6Tmw821LKUtLjQNrVUG4jfVsxrH3sWtY
         4swGptsu7JweC4UX09rEX335MlDfJcg7r/iJjK70WpPN3GF+Fcxk+V0GIyI13+GSDIwc
         3G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007388; x=1793612188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZEbYJuiqAEmfWzwwBWYGmvrF+bVdL42cX97Jy2+Bwg=;
        b=oYgye4pgVrVOwJ+uZh99cHoykz84h2YQdOxqfzL5GzaSdm0zyVNuwNVTTKBiy8gjco
         3L1PgQ2VmvZUli7udU4zG9aNY7LkqrMEoaWfsRLyxCppReQBiFMFvxE5srOWOcdhtr/+
         t1kPCyCTSGQyeyzpBD5c+z7mSUderWQ0QFXrwJoVVxV51kOYw8Po6/3/xFhnvujvJD3u
         z5qYiPvXJM5NS3++UFpvarFFAEo18BSHOS8Ic4scbwrva2xOGcs58nfIFHsuaVAADFw2
         M5CcIy5/pSyLZjwjXW9sSoWbZAnpD2UQeeq0GvLT+F7kJpzdXssHFy4POTpL7tIyeyvs
         xong==
X-Forwarded-Encrypted: i=1; AKwUvBwNMuEViFSaTlWHdnilIPJe4MT/8kiNVTaaPmOx3Mb4GX4ja/Hql+LJ4I95h/1frUHB7/cUoKhqcjOrPvI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVEbvyoSOJx3HeYI0I9nV45p51V9veJvysCbtJDd1DHnuK/sAu
	H5BFs8HAEybTKWmaBkmSnxlhXjK+Tmt8JIfxoHOp/zpdIHTMIkXYEufDIdB4yRNCtgs=
X-Gm-Gg: AYBFou2uvxXnsYtCAAHzRd7qm7/pVmHXyUgoULmkdme7mxWYcKV07B2/oxb3mZh0RRS
	FPSNHPLcVNTvzIf0ZxNoFFsxCVWFVFsKQdR5eAeAKD8P8xkJ1B5qLcwlzU3NDFv0VqrxJHwjweb
	OtNL4+lfuvHk+fGdaFMcvPIADZDNCxLYa8u9wUPeJhldlbd6+6FUyLp2woBRN8KJ2Yn8YWjaVBx
	QCKnvSiYcVaWL10Ty0/tj+ICWgL95nfzkuh8GYns9D/459ScWJX1+mJXtIVqN3CQbt4cmOzZ/WL
	l1FtBBgtvE3LU8+pVinHhQi3/Afs+IQznRz/Ll4daInicDe7lhHXTHTqsCKd0+7VTW8Onma90bD
	o/PT6+PmQY50RzT4/5N+P+ZYfN05vVsQHYxbGDJgSHn84xFZPjh2zit1fP3NDT6YC7AAqtrxytq
	vRxrw9Pwxu+VeH8CCMr6pS2PWmaJOgHiV6wKvRUeO0X5pJfVGfWA2obrycos0YncwRNRnnCJB9S
	3UT6+vFKfeMuJVrC42vHgOanYh1wdinuykcK0IdPPSuXRZz0ecqsOGQ0X3H
X-Received: by 2002:a05:600c:6749:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a35ad01261mr104560415e9.2.1793007388160;
        Mon, 26 Oct 2026 02:36:28 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bdd59sm118131875e9.4.2026.10.26.02.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:36:27 -0700 (PDT)
Message-ID: <93c294c5-157f-42bb-9940-79082ac37c74@linaro.org>
Date: Mon, 26 Oct 2026 09:36:26 +0000
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
Subject: Re: [PATCH v2 4/4] coresight: Add pmu_pulse/extout_pulse
To: Amir Ayupov <aaupov@fb.com>, Daniel Pereira <danielmaraboo@gmail.com>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261025063846.3112301-1-aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261025063846.3112301-1-aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/10/2026 06:38, Amir Ayupov wrote:
> On Mon, 12 Oct 2026 22:09:35 -0300 Daniel Pereira <danielmaraboo@gmail.com> wrote:
> 
>> On Mon, Oct 12, 2026 at 04:05:23PM -0700, Amir Ayupov wrote:
>> [...]
>>> +  perf record -T \
>>> +    -e cs_etm/pmu_pulse,aux-action=start-paused,timestamp/u \
>>> +    -e armv8_pmuv3_0/cpu_cycles,aux-action=resume,period=1050031/u \
>>> +    -e armv8_pmuv3_0/trcextout1,aux-action=pause,period=1000,call-graph=fp/u \
>>> +    -- ./workload
>>
>> The CPU PMU name depends on the system: armv8_pmuv3_0 is what ACPI
>> systems get, while on devicetree systems it comes from the compatible
>> string, e.g. armv8_pmuv3 or armv8_cortex_a76. Maybe add a sentence
>> after the example, along the lines of:
>>
>>    The CPU PMU name depends on the system; the available PMUs are
>>    listed under /sys/bus/event_source/devices/.
> I'd rather drop PMU specifiers as this is not something this patch
> series focuses on, and examples above avoid them too.

I agree. Making the docs overly verbose makes them less useful. And I 
can't see a use case where a user would get stuck converting this 
example to their own system.

>>
>> I applied the documentation hunks and built htmldocs, no new warnings.
>> With or without the above, for the documentation part:
>>
>> Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
>>
>> Thanks,
>> Daniel
> 
> Sent using hkml (https://github.com/sjp38/hackermail)

