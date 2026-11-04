Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804848;
	b=RHNXjN/GYpc+TOmq5keSv+T+BXCljzqz3GrcHJ7UP2aVveZ4J3/tNYo0Kwvf84nkps4a
	 muMJqMI7V7kATuf3NxdSS8Q5f/70IApgkHSqfC1JfVMPJFuR0lZwaXeGlwalBn8sT89Z9
	 N96jO/JZCQ0fkOPQkgnNjGLLm4ocWtQ2oxkQx7WkSfpMRIf1o4oKhxRmBiOmqfXhUGTUl
	 EYFj6tRXBTyQLgP6s2P1H/klgFuvO088Bu9YGLcci2EAt7LZNxQc7rZryYd6i4gNJ1fxD
	 iAaS+BsM+46CJOW8qYTOF12SmzBVtvbuY7foTW2Im1FbX7+CRC3DbGaD7V++ebr/0mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7VYDYvW+CwD5vPnIuKuoUcZjw7zRDhgYDMBwsljH6Ms=;
	b=Fxn+Ypap/jZfDUiwQJlk8EMZnFU1VmzFRRGNGSImTKCgCk3EnpB4rniYkjsggeGBRNQU
	 sd5f9XxiqwfsSTobuttHUTbC68CqY45e4zTChohV4caSW20gIGeMJ5oJEyxer43Ty651X
	 BzlOJZm/0qst4zo9slaN/16BaFpNsLI6RIgttpbktDV4ls0MVUsbdT2gjWUbEzwdha7bQ
	 AdeXarBl9XvSUGxRgVlPYc7thrqmiv0HsMqwQXar5gvC6A43nqoMvSAd3VFAU1MfAanrD
	 +lPNpbv5i67CvCCidWwFshLwHDgSt+yZBAmHSMKztXbyhW3g4w/wk9sSHr6qUQ/p73A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="jlxkiNU/";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6615606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6615606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jlxkiNU/
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso5662745e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793804846; x=1794409646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VYDYvW+CwD5vPnIuKuoUcZjw7zRDhgYDMBwsljH6Ms=;
        b=jlxkiNU/T0Zd5J2F9Ggyrr4UPnXYE2bQTFUXDcXUhkbRHBk9znBH/5ubAJFDrxWULG
         TL/JIVyc5cZWf58ZGwf3rnI6Wyn6anIcXxe7EKpBNXqaFi+klUUGxQnRK8BTs3HG1T5E
         dpXNR+/qIeuZNXP90gWFhiUSXKampHon35hGhkfJJR3DhWig6J6SG4VKqtbx6nzTrJwo
         NJ3mluh5vKukjW6Nt8GICrfn3Pu54LH2gbcptr2RgSkCLLhwJHktxf7APMDAEqtW4TST
         ZxjI+g4e//kzPziFJg8ITlHrRrD7hU5sIRE4+jJ+m7ETh4L2DOEpX04/ppr1q0sl0SNS
         gEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804846; x=1794409646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VYDYvW+CwD5vPnIuKuoUcZjw7zRDhgYDMBwsljH6Ms=;
        b=qWwZcp0rkcut+MC4C5Oqv1ohmS9uRm3a3uS03hmaDEWWuMW/ZQhaAZ1mZDRZtg3mOb
         D72YWBe82hToWXXgERw2zpHspds5sVYDOrTAfT/PdhG+0pu1XUfp7ndYtlrSTJdo4tij
         RcPwmekXWpYXQ8jq9b7XtSejWBaM0nbJsmwHSrKq+9YccwS3X/iTgPj23T97QM02YIZc
         1v2bXLCzw1FLtOxD8TF7oDBR2wQg5SaS8NuNXUPS2MAqwPVOxF5eMxbnaWFqoSi7Sxs8
         qj9Hw3ETOCKiKxNxW0R2oh3bWkVU+mJ8xYTCZOFSPlV/IWc29SM32TqH7NDmIsbdTFTh
         V2Mw==
X-Forwarded-Encrypted: i=1; AKwUvBysz0AL03g5mReg3RwZRcvxyfMG5yTrCBcsGC8tHt//gZCVBjqTchsJzBSJ/np5WTHBNFCkbSDbo8OeKK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LLT/iNmIoyCw2IgAvpIiG8bioU47X5KyJ8lE3csAfXRaSnYih
	0GFVfBlmO3yPhZaMYcsIrBSWsgDVz8mESQLJloMS15KFQRqGWBDUCE/OqemxI+kO1Jk=
X-Gm-Gg: AYBFou2pBzGRFTKPRiV3KfZh1Zt3Q4251dWKKR4kF7vJNaeQyMGik+jz1Dy9JY4/2fG
	m+DzArOBTXz0h3AqwkqXmGzodlMM++rKGX5n3ilvuQqTYazOkAfMuDPmIBTg4UmATIXxUFbekbt
	xxLcjQYU9c9xW0Dx9kLwfTrGICid96SvVjB4Nisr6BCS5VAeTwYMxgRRKO60qydTUfJxY0RhfLZ
	IN/giM6S1Rbx+UwKVLEwHueekm8W2cvKw1QhBiKXN385T7ICeR0vx8KXv4AFFR1bTDz42i0lYrP
	XRLTLi1gNn4GHSwFHMjq+BeSat6Qt6jOI4JJSUuVpZOCXLNpRTWtT6/TWVnLzcI+s+U91MEKs3Q
	tG/Jze2M5xtfb1ilPqv/y6kcgdPYAFwhyFpL+sKTDz3DqX+G9kXST+2fYWLaIbC+JmBfKbqqxwi
	VmFPlSFxjfNMyMpEBxMSi6W+jh6cfKtWxkjLhUuk4vURdxYvz1PbqwfV1rOiFOEQOUXTKy4TyTR
	/0j0T8mL//6IqwoB7lH1wRQaD3EWe9jXzPqY95qer8z/hpa0E94LtsZuhuUig0+zoiJsiGjFOiK
	mnrhrYLQfpz1We9zZyKFOwNXRUo+xqaN/kqkn9r8TOg+RIKuEkVxTzI=
X-Received: by 2002:a05:600c:4e14:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4ac187a80bfmr378940895e9.30.1793804846351;
        Wed, 04 Nov 2026 07:07:26 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8648sm4578795f8f.9.2026.11.04.07.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:07:25 -0800 (PST)
Message-ID: <54182c51-8dfe-46fa-9369-5e4e31a63796@linaro.org>
Date: Wed, 4 Nov 2026 15:07:24 +0000
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
Subject: Re: [PATCH v3 04/18] perf cs-etm: Use per-CPU queues for per-thread
 mode
To: Leo Yan <leo.yan@arm.com>
Cc: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org,
 John Garry <john.garry@linux.dev>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
 <20261102-james-cs-unformatted-per-thread-fix-v3-4-dbcb0c281b9b@linaro.org>
 <20261104142412.GI9176@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261104142412.GI9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2026 14:24, Leo Yan wrote:
> On Mon, Nov 02, 2026 at 12:15:18PM +0000, James Clark wrote:
> 
> [...]
> 
>> @@ -2215,6 +2209,29 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
>>   	 */
>>   	cs_etm__flush_all_stack(etmq);
>>   
>> +	/*
>> +	 * Per-thread mode still uses a queue for each CPU, but that CPU can run
>> +	 * different threads. When the TID from the AUX record on a CPU changes,
>> +	 * re-initialize the thread using the AUX record/buffer fragment TID so
>> +	 * we can start decoding even if the context ID packet was cropped or
>> +	 * they're disabled.
>> +	 */
>> +	if (etm->per_thread_decoding) {
>> +		struct cs_etm_traceid_queue *tidq = cs_etm__etmq_get_traceid_queue(etmq,
>> +							CS_ETM_PER_THREAD_TRACEID);
>> +
>> +		if (thread__tid(tidq->decode_thread) != etmq->buffer->tid) {
>> +			thread__zput(tidq->frontend_thread);
>> +			thread__zput(tidq->decode_thread);
>> +			tidq->frontend_thread = machine__findnew_thread(
>> +				&etm->session->machines.host, -1,
>> +				etmq->buffer->tid);
>> +			tidq->decode_thread = machine__findnew_thread(
>> +				&etm->session->machines.host, -1,
>> +				etmq->buffer->tid);
>> +		}
>> +	}
> 
> Why not use PERF_RECORD_AUX events as an opportunity to update threads,
> similar to how we handle PERF_RECORD_SWITCH_CPU_WIDE?
> 

In cs_etm__queue_aux_fragment() we check if the TID from the AUX record 
is the same as the one on the buffer, so it doesn't make a difference. 
They're always the same:

		if (auxtrace_event->tid != sample->tid)
			return 1;

We can't use it directly in cs_etm__process_event() because we're not 
decoding in order with Perf events yet. In my WIP JIT patches we do, but 
it still makes sense to continue to use the TID from the buffer because 
you don't always have timestamps available to update threads when the 
AUX event comes.

>> +
>>   	return 1;
>>   }
>>   
>> @@ -3288,7 +3305,9 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
>>   
>>   	if (aux_offset >= auxtrace_event->offset &&
>>   	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
>> -		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);
>> +		/* Old per-thread files have no CPU (before v6.4) */
>> +		int queue_idx = sample->cpu == (u32)-1 ? 0 : sample->cpu;
>> +		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, queue_idx);
> 
> For per-thread mode, auxtrace_event->cpu is -1. So this is why we
> resort sample->cpu to retrieve CPU ID. This makes sense to me.

Yes, and it's only set on AUX records since we started always doing this:

   evsel__set_sample_bit(cs_etm_evsel, CPU);

Otherwise it was -1 there too, hence the condition for old files.

