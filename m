Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EF53AFAE2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851208; cv=none; b=VwrLqTbWCEYTuJ6tLyMa/64fQkPTeGnLDlpa4y1vXQU3dDuPPMfzxcNzd6rgA6gHmR+TpIAw+O77lpl9wNvcRiBE2U4nnZHzG9YRL/qHhdoNl/M90ufPW9WGCP/jaWXCbVVZBqZfcNbKtzvWzJ+J3eqA24jW7eglHrGOK2uWcVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851208; c=relaxed/simple;
	bh=t0zJVvurxnCeKDCTry+eL4VK5MXxqUoBdilHO4bV6Qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwPYJeJP/Ek8uxGW86aXWQzN0BJRQ/4VH94+GOmtyH9YS5mykUfp0nSsfMf2sXDo9aMwKmkoMleROSO/tv7P/VhPiFWmmj9FPJaImEANtgmHk44BGQjx3fgCuADj27bxCST3hxBnUtp+HBKZRZYy1Iq6i/oigaU96D97TL2/Ok4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HkOfm0tz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HkOfm0tz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso10103885e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790851202; x=1791456002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhz6ns8td9NvZN6ayBEXDaOQ/jthJX46fvpgHDR7D4g=;
        b=HkOfm0tzJnvK0QSC6Qr4pADkLBzx3YLDLjWQxZ9Bspi+3oHixiLOjK86lygSbXg9iT
         dCW9BZSRP8EQPQ7LFd6EV91mSjJohDAmEND38EKLuhf2eDHx8j3UccScjtUgft9mlQQO
         Vt2IXQ72ZFldyKi/5e+M2uOs5yJFMcMRwswkZtDgAMeD3XtrP3Ljh765ryTPqStMIBkQ
         nT0+0obRO5OB27BWYPdtSzIx381KlN2BhT2VuMb74jloPSBRO1SfGIEytbc+QmzzddCf
         ueRWz1i0Ndrb55oM/zWr/DkHxKzoWfdM5hv4+N9b56QLkxYO0DcuuB7rWqy8xTmOYJxf
         0JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790851202; x=1791456002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhz6ns8td9NvZN6ayBEXDaOQ/jthJX46fvpgHDR7D4g=;
        b=UPMcXN9xgoyVaMNSnnxzDxr6pPssg4EG1NdKsZfR/XSlpTUikyAhVriezuYfHf8/Ye
         dEi8krKA9xzsIufD4emkCYzjNEH421Z/bWHdf+t7orQVOZSlehtUutMUnHi7mUZikGDB
         o5j/Mtq7UD+TMTVbjK8bVA/7R3LUlC/EhBeCNsqmjPiS7M3nUEELKxLZAprJAb3HYKPP
         AlXiXUE7ETh1/iK0h/pQDK3D/xOk/2Qq5C7YIGqYCCM3ja9GDPa5LRtvuTJcSsR1Srt+
         YqJeyZS+EmZpfidINP6cviUs6UtwlBtjTwfTINqLbYNhMeg8gWhkZV6jg/TJjwb2R1R1
         fw0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw52Kg2Vrl5JpqgAbbwWpdBVBG+N0ZC5QJdsm4pJGG/DnJyaNN9aNroP2vgTO1iR4kAtxq2Ag1jF4H2eXw=@vger.kernel.org
X-Gm-Message-State: AFuF++lFkO9II8mP2CrQPnhtmkkDr8I4rKoCmhmQbpE/XtY6ka4FBJFl
	FyYYqN7fVk1oBmIOvIZ3qykPKYRsK8P9Rod/wn7PHddyhWdSrICl+id6poLANCYnW5I=
X-Gm-Gg: AYBFou2gHHOoC49PwRdGaiwcBp9lJfA8ULac3cQBybpMoSJjo3ekbAisLli/K9W2MBB
	1XviOWvSPw+7hnvTFV5elOGhBqKdaGRaltzupAylwTq9nucz28Qy49emlhoD0tndck8H9hi/oKp
	OmeD34ycPEPbCLQ3kfJPG2fqJz1nZcHdadDnuI9UlAw2ep79N63ay4Pz/tzIJ7sznQr9xUqczR/
	/eJhIChUKPSe0E+5xBrkyezYPTHNgCBEoL/X5wMdstl7Ob5uSOMQIVJiL85QujzWYg+0Mdln63Y
	7UcJwhFpZCaGwfamVRFrjvHNb/fIemy4EziHJFWWsdadbrmxw7LSsw7HqUKUF+kvqlszPoKLkLa
	UDk/EPxOOMG8cAMpqjExuwfAefTMgczVOUXcswY01kBTyrhWHgrzZWhDh+xBFwt7Vj6PYb0QV5e
	dYYE5kxG7SQe9eZ1F9SBv08mUyo2CRwDVgMtq8votClvXYW9gpAtmMoowFzQ4z3SaGVm6nxBfT3
	HM=
X-Received: by 2002:a05:600c:c3cb:10b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-4a01eaf5b29mr32874605e9.3.1790851201999;
        Thu, 01 Oct 2026 03:40:01 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm40417675e9.4.2026.10.01.03.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 03:40:01 -0700 (PDT)
Message-ID: <d3e34f2c-6838-4902-9204-f32b59f12f3d@linaro.org>
Date: Thu, 1 Oct 2026 11:40:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] perf cs-etm: Free partially created queues
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
 <20260821-james-cs-hw_id-output-failure-v1-2-9d532ddabcc3@linaro.org>
 <20260904171214.GA8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260904171214.GA8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/09/2026 18:12, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:50:30AM +0100, James Clark wrote:
>> cs_etm__create_decoders() can fail half way through and the
>> err_free_queues label won't free them. Call the full queue free function
>> here instead. If no decoders were created it's a nop.
> 
> [...]
> 
>> @@ -3520,6 +3527,7 @@ static int cs_etm__create_queue_decoders(struct cs_etm_queue *etmq)
>>   
>>   out_free_decoder:
>>   	cs_etm_decoder__free(etmq->decoder);
>> +	etmq->decoder = NULL;
> 
> cs_etm__free_queue() also calls cs_etm_decoder__free() but does not
> clear etmq->decoder. Should we do the same there, or drop this
> unrelated change?

Yep we should do the same, I'll make cs_etm_decoder__free() call zfree() 
and drop the explicit NULL.

> 
> Otherwise, for the queues free fix:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

