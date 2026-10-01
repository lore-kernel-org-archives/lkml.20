Received: from mail-ed2-f39.google.com (mail-ed2-f39.google.com [74.125.228.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE682BD022
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859427; cv=none; b=Cq8EpjlEVFt1SQmYyMCOSI2HB4RCXAiCmjGXCGcgILS88Ib0cX1/8hVATACvkoCIHV0p1yHKgnJk8AkcsnoXfNeWzoTM86R45rcDP0Jxqo+3BscDB1qwRW6Os0FrFXH29kjs+RYIytl9OBFZtgzOLrTVgoQussbOmQfMwA9EJXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859427; c=relaxed/simple;
	bh=bsRlP2nsrfFj/+87vKFLlLT8dcH7hzwkQXH4dS3a3Rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6M4WE3zlWa6/xar/oFujRcyfOsIVz0atxcJmim061f2kJitG5fqI1C2One1hUyCiiFGUTvpevNyxR0OnBndCRWAqH7iEB6rY45oUcV9IRxY7nsSIkkMF2q2DEx6c5OAoYaSFkCvjE6j4Kagi/ooo7WOgY25Sl7N5aG539hqC2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hfSx1pjX; arc=none smtp.client-ip=74.125.228.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfSx1pjX"
Received: by mail-ed2-f39.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso7931520a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790859424; x=1791464224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WYQcGuErMUo2kj8MYEXUp1hSIeKyP4od7V3q7dorkY=;
        b=hfSx1pjXmboJR3SzkNEhS1ycDDKTLmYFoOKZnk3uL2zTOQBKLFefhZNqU8VO7HodvE
         Fr3L7R9ej61NW2+AZL0SL8+KNIu5znUzfQSl2aD7+n+Zf3AdpwIw+wY0g8iCsfm8ABeF
         3jyS7fIHH519zYPrGHbCtVJCJlEtspWZmLkoFng8C8VxjtpqtJr6YQhFJCnua3CbWTsu
         k08C75Sa2+PohRaY59RsUZNp7JzpBO30acxnu7Yv/8tSqdBWjzvuSZfkWqhUel5jYdve
         wXvlXXZ0ur0L5fPjEbX9LauScvi+UYPAB2bylvMgJ7PghjfI7Od9TnEcYOyYrUiHYp4s
         csVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859424; x=1791464224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WYQcGuErMUo2kj8MYEXUp1hSIeKyP4od7V3q7dorkY=;
        b=uvn96gJKCRLo6ijUYazRm7A0GJaYRjC8FHuhmz4b56CIM6TRt2bSwdKkUflG08gkpm
         pjoB4TnjZzT7cddou3+Cw27WJjfuVoGe0YYYFfJtRguYpETUTrJChhIkWkBC0sX7UuiF
         nOs09TfhnHOlfPFBwicC9IXRxpgqirQiNIjTpWApi58sxa8D4TFa/sFCJBHarPI+WiJi
         qNBXyE8QHKIgLtOM7rSUhGE5C76AD/RJWcy9KS1lP7LPQ9kfC3BjLeS3VK0S6dO3dWIN
         j+USkR1b0Q4Re/+muF7TrizUgy/7M7AfKjiGltrswVQG6JMP4ZiIA9jNQB1fvrHRfuu8
         DSDA==
X-Forwarded-Encrypted: i=1; AKwUvBwee+Ggk0jSAa6na58WOR+WW5zFeNanXWsJBgV160NgTnDUDMX+0VLnlmVJCxYjGinxxx63f0MgeE/S8Gk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0Kilws9WDALlZv7pfCf78c0zlSu7AUdXAdpIT1TzW9gi/I5cy
	eF7lRfUI6+dVWCfqJe3eNAZxtqRgNWmNBjrXnYlel3DNeHnE1dGg4wTvCtPpxBGhUgM=
X-Gm-Gg: AYBFou2AVsFgaxjZDwvxugSCFgKY0/2vfjXaiPgkCb53/DP6jMV4m19yuV5IoSBab+L
	Nic71lMo4s6F3MBHy0u+6wtN7VIrr5kczTkCwICpMa8tm34OrdpEEItjgd7Goyo80gTpT4PLirE
	UGUJtJTFFYxpeK1sc8NTg/tHjy3Z757M9un1AxZD9ElAvmBdt8Uvx4Wk4iFNqP9e3lDrL+8iprG
	Gw0HVZoNivx3CxOWvOHiQOM4TWhpHL7A/dzqgtv1VQNDA6sWpb9i9Cytl0iKKOYILra7UnWkvDv
	LoSmXjhmKqM6eca62zoqy1quF6PxoAM0AfMPBR5fuVWZ1rB5dMqnHhvIkAErvfvQBmcyF1wEoAp
	0YUTNOi9Ozd+hmZF8RNVUIhcDq1A17iIaOT8yJ37dsiZECMGEbc6WJ4yRARCNpU58pCADBN5fSx
	r3jfUO1IijiBJwaaFsvnCEde1fIAMfajSPPim1HAs+ywppLk1jtHiVxdI/BvJq8sPwZd84UDNk
X-Received: by 2002:a05:6402:401e:b0:6aa:f809:ef3f with SMTP id 4fb4d7f45d1cf-6ae19895d15mr3847262a12.5.1790859424120;
        Thu, 01 Oct 2026 05:57:04 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae42b0782dsm1136509a12.0.2026.10.01.05.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:57:03 -0700 (PDT)
Message-ID: <b8fe413d-c927-4efd-8988-edf4bf1fd905@linaro.org>
Date: Thu, 1 Oct 2026 13:57:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] perf: cs-etm: Respect --no-itrace option
To: Leo Yan <leo.yan@arm.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Suyash Mahar <smahar@meta.com>,
 Amir Ayupov <aaupov@fb.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
 <20260821-james-cs-hw_id-output-failure-v1-4-9d532ddabcc3@linaro.org>
 <20260904174503.GC8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260904174503.GC8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/09/2026 18:45, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:50:32AM +0100, James Clark wrote:
> 
> [...]
> 
>> @@ -3603,27 +3603,49 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>>   	int err = 0;
>>   	int aux_hw_id_found;
>>   	int i;
>> -	u64 *ptr = NULL;
>> +	u64 *ptr = (u64 *) auxtrace_info->priv;
>>   	u64 **metadata = NULL;
>>   
>> -	/* First the global part */
>> -	ptr = (u64 *) auxtrace_info->priv;
>> -	num_cpu = ptr[CS_PMU_TYPE_CPUS] & 0xffffffff;
>> +	etm = zalloc(sizeof(*etm));
>> +	if (!etm)
>> +		return -ENOMEM;
>> +
>> +	session->auxtrace = &etm->auxtrace;
>> +	etm->auxtrace.free = cs_etm__free;
>> +	etm->auxtrace.evsel_is_auxtrace = cs_etm__evsel_is_auxtrace;
>> +	etm->auxtrace.process_event = cs_etm__process_event;
>> +	etm->auxtrace.process_auxtrace_event = cs_etm__process_auxtrace_event;
>> +	etm->auxtrace.flush_events = cs_etm__flush_events;
>> +	etm->auxtrace.free_events = cs_etm__free_events;
>> +	etm->pmu_type = (unsigned int) ((ptr[CS_PMU_TYPE_CPUS] >> 32) & 0xffffffff);
>> +
>> +	/*
>> +	 * Don't go further than the minimum required to identify this event as
>> +	 * auxtrace with cs_etm__evsel_is_auxtrace() so unleader_auxtrace()
>> +	 * works.
>> +	 */
>> +	if (auxtrace__dont_decode(session))
>> +		return 0;
> 
> TBH, I don't look in details, currently auxtrace__dont_decode() only
> exits in the common util/auxtrace.c, why other AUX trace can work well
> the option but cs-etm.c needs particular initialization?
> 
> Seems to me, we even don't need to do any initialization in cs-etm.c
> if the no-itrace flag is set.

Because we have 2 peek() passes over the file which can hit processing 
errors at this point. I assume other users have a fairly trivial 
process_auxtrace_info() callback which can never fail.
