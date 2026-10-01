Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0F42EEE84
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859329; cv=none; b=CFLfEnumQHcnjPheC6JaDW8VZ1KKNyU+r0hBGdgkM2PfXADrhUbbyfPPNuquesRYq7FAsdwZeVDXItutrjCrkQoriN33Oj1qoGfWZxK7Mw1mdoQodcoxGHYI7dYYaIa+O/jIpKRu/3gpkDTU45cuktMT288zB9Ic8w4MZ5fimP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859329; c=relaxed/simple;
	bh=qoPcLQm6RddN3pDj1QW0g7pvfKX9DKJANAZC6bSxApE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHLF9Zs0Xc4LJVSNdZZBZgLewZSXADvz/Gjnjs/zkLRkp0DHCm1cr8USdISxm3pY8ahCJyKmTjQPEWpqn0SpmT+wyAoWgF5VmnSvdU7Zi+N7BfBWRP2PqR7yvtq4Lsm8XWNRn17Db799QmLU+aD1bh54uyRJ4XZlDkPZoSXVrJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VhwlsHN9; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VhwlsHN9"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so10349402a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790859325; x=1791464125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uF5zNxkaQ4jQ0BkeRTJjWKsCM/+7wEmC5bJ3Bsgmzk=;
        b=VhwlsHN9sY/rlt+6KP8n5JFpblwUiVvOjHu2sDpnsQXtFF+nUccB34LYb7TSr4Z455
         qwqKPs+uJafHuhB/kDpx2NjtjYsFz/auf2l4ZUxqWLFZgnNHbbm0jCd5F2O0g+Phuhoa
         ad/Dh625vyKbePOOmtPitTTCVpHbOYCeLUHYUgAYV+vvJKj9JcSrSiIaLKiV6PGMfEK6
         nqTUbN11Aj8P383EqXn84vUN4usuJumO8vxYw94vLM5aSbXK7KEPQEw4bsLbCIGIaDCM
         STflyYla/l+HuOK0FDKB3vHb5np0Di7MpUJuqOwoX/CO0V+2ESrmXl4yfW0KsMIu4hcT
         5jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859325; x=1791464125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uF5zNxkaQ4jQ0BkeRTJjWKsCM/+7wEmC5bJ3Bsgmzk=;
        b=0qL01xvneZ1aw0xcsJEdDf2LxaZJJfQFTNzXfQ2S7/IV4kj/MCa54kP2jB8e/GI2km
         R9cNJzP7p/zJ+cNagzAKjzotm62foTQ0o9kvQRXSNfcfcp7p5roj1KKK9N64ZVNd1yo8
         mHGCngvB4hpViFb51mSJpOZFMG4nBsZ2+paFS1IMJ4Jw9BtNq1jkpRe7yhi/asctUbC3
         Mk447YgcIzdYEA3lee6gN9Az4n+/KcjNAN2mXdW3jw+vCdhxus/ls+w7nvLnekNz0G/O
         7hmk2XthkQHoJ8IDVV6/qul4DPBauUifCuzxx5LZrQmj9HpzXJl0UhuRzgV3sKyNdzbP
         y/1g==
X-Forwarded-Encrypted: i=1; AKwUvBwdEb+Cd5zvSGn4jIyf11cYzzQtlukzIarMlc/IxlSxK2sAxgFGhFkxtDfqMwDGv0xbUeCRGZpUV31d5Gs=@vger.kernel.org
X-Gm-Message-State: AFuF++kInkIfUNfaXXBS2CqYiH+tDZFCyqjSaZYLRsNT+FZz/GPHLM/m
	ucg2nFJewkAd9kEIaMvs4GgB3lT0z8LOu9cXmem73HyYgzpG6/uPeSm7vu7Jygbuk1g=
X-Gm-Gg: AYBFou1GANeDXBypRddOIOcrHEHuCUOAzWIvPpmNjScwU4uVAvj2Wx4Jj9XSgLFjKMU
	Mbk650NAGV3InTN3u0rrcYpEpYDz34saQFkBu7L+uKOed43azG7BfGHfNfyIBhIag0n76odL5Es
	FMkWIyGVAlvLdY3rgaM8MKs/mdV0NN+npGzah0+GG0YNRVTfJw/MoCMibMvRVhc1xuQnF743O0G
	FKmOr/H8omPV66o5mLw6e5SkGbaILhf/1RiGM5iED91PKqfUcG1sxhcsRXLd+vdBN45vDHmNORy
	O17GmftnQCnN+H0EqSErUKDZVFHU24w8mQtziSyXIsUm3ych7jhQ4xu59QC5NRWHDeEmmvXxsUK
	jLc1M8K7yQSIzKQPVFajKWu6hEAFx+5bM0q64PYLrMFuKn7lsXk9SHKkRAyLi8VUtLmouv3mrDQ
	GF1CCVAmLp1WC3qeMtAl/uGYMh85ZgWInZeV8e8h9mDEasWk1jJQY6b+CYQIFLpXKwD2XOQTKuQ
	Zo=
X-Received: by 2002:a17:907:7b82:b0:c29:f5d8:9c7d with SMTP id a640c23a62f3a-c2e23d403f1mr389127766b.44.1790859325594;
        Thu, 01 Oct 2026 05:55:25 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce362esm150229566b.30.2026.10.01.05.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:55:25 -0700 (PDT)
Message-ID: <28c735f7-5d1c-4127-b748-99cdb3b48645@linaro.org>
Date: Thu, 1 Oct 2026 13:55:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] perf cs-etm: Synthesize missing HW_ID mappings for
 raw trace
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
 <20260821-james-cs-hw_id-output-failure-v1-3-9d532ddabcc3@linaro.org>
 <20260904172924.GB8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260904172924.GB8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/09/2026 18:29, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:50:31AM +0100, James Clark wrote:
> 
> [...]
> 
>> +static int cs_etm__synth_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
>> +{
>> +	struct auxtrace_queues *queues = &etm->queues;
>> +
>> +	for (unsigned int i = 0; i < queues->nr_queues; i++) {
>> +		struct auxtrace_queue *queue = &queues->queue_array[i];
>> +		struct cs_etm_queue *etmq = queue->priv;
>> +		u64 *cpu_data;
>> +		u8 trace_id;
>> +		int ret;
>> +
>> +		if (list_empty(&queue->head) || !etmq || etmq->format != UNFORMATTED)
>> +			continue;
>> +
>> +		if (!intlist__empty(etmq->traceid_list))
>> +			continue;
>> +
>> +		cpu_data = get_cpu_data(etm, queue->cpu);
>> +		if (!cpu_data)
>> +			return -EINVAL;
>> +
>> +		ret = cs_etm__metadata_get_trace_id(&trace_id, cpu_data);
>> +		if (ret)
>> +			return ret;
> 
> Since this is an unformatted queue, can we simply ignore the trace ID?
> Instead of fetching it from the metadata, we could insert 0 to create
> the trace ID list.
> 

It's printed in the raw output though and it's useful for eyeballing 
which CPU any bit of trace ran on because the AUXTRACE header might be 
off the page, and it makes output consistent with ETM:

   . ... CoreSight ETE Trace data: size 0x10000 bytes
         Idx:0; ID:22;   I_ASYNC : Alignment Synchronisation.


I don't think it costs anything or is complex to do this, but if you 
really want to set them all to 0 we could do it.

> This would also align with future refactoring to remove trace ID
> handling for unformatted queues.

At that point if they're all going to be 0 then we can ignore all 
processing of HW_ID events for UNFORMATTED. Instead of saying 
cs_etm__synth_unformatted_trace_ids() is for 'fixing up missing IDs' it 
just creates them outright.

