Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A236B3D16FC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454615; cv=none; b=WXOZd8hZmdt0yYMkdWTKAtY8cTYGhsHMgxfSHpVNIi0La/j7X2AfUfidJ7WK9uLYtIuMlxqlktxUV8vkpSwaLGSuHlrcX0+JRmIFMJdkA9/7aH8zxCdGQFgJdM5KWyJY2ldyjgi/YkNJfVwX1+jrVD7CD6MbwyDWOWtuZYzXAQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454615; c=relaxed/simple;
	bh=zr57d1ZsF5kLXjGYob37OWc0jqT5c2OOuPZtQUr/tHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0XPKdVk4fyMppEofwzjdFzuI9PdtJWyBxjhGwbIMKJs97yrEeAaszuDKDKRkgqe/fQ8omiXkoIXQBSwyhbtwL3Zkr+jTFB+gYP4WQRsQklZgqy/0vDVH1y5MP6U5QwomZ9PWsm8SNrQuOLK6L+NQKyqNYATdt0km8G0SFlSkBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T9aRWkj7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T9aRWkj7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a061a13884so24322295e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791454612; x=1792059412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnmV+GF5F+3o4WuN9B2P/gYsWL8ntjLMdxMPioE157g=;
        b=T9aRWkj7HzYv/eZ5IrAqIUTUJbJ9XNMldTeHN3zkdAsDd3u6CJ8bch3Kb/SCLFabO6
         YZKdlmq4rTQvwmVhk3jJGXaxNPMmHZpiTnqajCRD3YNV9q50fhHFFwQlYdO1OJ5DVdaI
         qqip85qEjEuTJD8FWsN2gVRzqJ4rbIBkh9uKOHWZ5nHp7oOwpkdC94c8ldRLcweAcEfp
         n60XS534iNS6O4nk65tFI1BY8YJaFR1Fs50UMvNP8BiDTxKucOOng+leH9cKPD0J3JEu
         6Kd5yHmD9HQzKwP766oXH/WmykryCPqO2zbueMFOG9mSdopS+n3TXzVs3tA7wcvPpB3C
         kDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454612; x=1792059412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnmV+GF5F+3o4WuN9B2P/gYsWL8ntjLMdxMPioE157g=;
        b=iE4TVB9N7PYLo1UIArG74WtI2BhU1vR0+jv9FW85w4RRtf3EIhvQQRDJg8UYlaNEiN
         tG8xORnu4V2zNwNtGD7v5mnO8VtUaR4hOMeFd/xpuRCyZ44LEWnTe3HmjmANXYnaznik
         8m1RfFRVIeXO+AqJNxeqskQKh6nH43OkXT+W1IFamAmvJ/CMyVp1cCXXgFnDmG961VT4
         gmL2mXfQuyKUbZNJkVmM0dWBKIhSJwzPh3JVwVTwZIwWKvhp1xO5yg6/eRpGAxi0I+xe
         8uZ9jvM5xtjkbEFJg9Kd+Vwc94eHc2XGc26TM8mkE1e23wR0wk9r9qbuqjg+GinP5nOy
         pi1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwlOyVIfDFUTWd/pKHy/ryrqSmfYHOkVmEVezuTNt9IFre4Awc2L/OjJRgAIFpTettar7wmUbAASvbTjzM=@vger.kernel.org
X-Gm-Message-State: AFuF++lUogxCzUVyizOoXc0CPBzZmA8jC692fkhemS7UnCyIr9Ky0akK
	KsVPqg1Z1PjpxDOQciEhxGwJgUk9KNZ2B4CkiJsKhj2n/MYMbqiYF3rki7pQJ6svUyQ=
X-Gm-Gg: AYBFou1VYg8jbvj9hKOqhYvd8ish4+/3EDPZcTwWI1QDK+3s7QoyhMEdn4GbpXD70TM
	9kRR5NJQQvziQtUI5BSQIcV/Ua9FySx/8kmx+dgV88WimTl2qEuVE1TX3pXPrOLcCbcK+VoTcJN
	Tk63v8pDyz2Bdp7Hf+2jw+LaJrEetv8XJJdg+bxdSGpXhtn5ulKbmmhRicvOieTsRkSuBv+5DUr
	1ZJbE/7TR3RZ0eP9pW+znzF+KWwvUCFX3jNJjcYfU7ltWPYh8CrNkv6YEtqWJpQrTuh7S5gBmE5
	Y8a9Cw368Iy+SkB6gPpCudInv80J0TEdb9AcC6FFa5/VjQnfujFpCbNL+9ArvUafHU2RfnCDTcS
	D+9ubve0hEzfEZtWQAGPK6RyYc7Y1faEOESmvzgt1hb5MO4VHPB6MGQQ98a9c2dJ6Yy+Yz9fdck
	Kw//p2xZHrmaV5S/A1ti6BZhpCn6EcyZ+yfzr52Jp+0l4nNW9YmvusM/OGNt7QDhhxUT91fJOig
	js=
X-Received: by 2002:a05:600c:820d:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a180423b6bmr85575205e9.12.1791454611842;
        Thu, 08 Oct 2026 03:16:51 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842abdb9sm57441605e9.6.2026.10.08.03.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 03:16:51 -0700 (PDT)
Message-ID: <a8373961-8ca5-4e8f-9f81-69d099bcaf3c@linaro.org>
Date: Thu, 8 Oct 2026 11:16:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] perf cs-etm: Turn on context packet timestamps
 in per-thread mode
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org,
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-doc@vger.kernel.org
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-3-00c4fd0701b4@linaro.org>
 <20260826153648.GK8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260826153648.GK8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/08/2026 16:36, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:49:01AM +0100, James Clark wrote:
> 
>> @@ -453,13 +453,22 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
>>   	 */
>>   	evsel__set_sample_bit(cs_etm_evsel, CPU);
>>   
>> -	/*
>> -	 * Also the case of per-cpu mmaps, need the contextID in order to be notified
>> -	 * when a context switch happened.
>> -	 */
>>   	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
>> +		/*
>> +		 * Timestamps are required to interleave samples from different
>> +		 * CPUs.
>> +		 */
>>   		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
>> +		/* Context IDs are required to associate trace to a process */
>>   		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
>> +	} else {
>> +		/*
>> +		 * Enable context packet timestamps only (no periodic
> 
>> +		 * timestamps). Even in per-thread mode with a single process we
>> +		 * still need to correlate trace to a specific mmap around
>> +		 * execs, which can be done with just context packet timestamps.
> 
> Could we use terminology that is aligned with the ETM spec?
> 
>    "Disable periodic timestamps but generate timestamps for trace
>     synchronization  ... to a specific mmap around execs, which
>     can be done with just timestamps of trace synchronization."
> 

Done.

>> +		 */
>> +		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);
> 
> It seems this will eventually convert UINT64_MAX to 0xf for the
> timestamp bit field. Why not use 0xf directly to avoid confusion?
> 

Then it wouldn't support the size of the field changing. I thought that 
was the point of the kernel publishing the fields dynamically. Hard 
coding widths and positions in userspace only caused issues in the past.

I don't think "...MAX" is confusing for what the intention is, but maybe 
a comment would be better than hard coding it?

>>   	}
>>   
>>   	/*
>>
>> -- 
>> 2.43.0
>>

