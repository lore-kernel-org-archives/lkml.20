Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B213CEB9D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537956; cv=none; b=N6a6RrbCpTPR1ae4fd6UsoIp/13l93gPOVhl8CJxRnnK7YIxC6+jUIR2bS6Emux9eYrrQNooidsyz+ym1wS6JH3kpNylDV5+6z6+aSdvzw30qauI2ydEV62Hso/z7aqZOs3Z6LztCGoWJJ1ZMqFoXWifMlby9/nN17vF3XNrZG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537956; c=relaxed/simple;
	bh=i098y0mnHm57TQorRg/tN8rNvRK0uv5JFbnfSKqREz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6e32Y1b0cTBiM5EeExbsbXG+tP3lA+okZnx1QvDW9YZEjB/qkuq5KdR2lGDI7Rs/vMrte/Mh7MCQRxxP15gkvKZAZjsLguXJsIKi6CaQpm/WcN0rPkrMXZcPnbTXVPbmekNhYdmKGOX/HkSATTT/rJ02TD1JHrZcDvvKSZakxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ugBAGAhD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ugBAGAhD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-486e70f2457so2791148f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791537952; x=1792142752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgzMN7GSKW7bwxrlr1yTEXEUokyD0aM/o483mXV6npk=;
        b=ugBAGAhDkwUDNRWXTqCR9hlFdBb6S4w/BffoywkkgsDPKAIT2JmGqu/4olI4juJMZp
         g8ZFm5Ekfo2i7sTMScylHScoDFB2zTag2n5ZAMq+c5NMgmz9QmcfV5PgRFWLgFvDO93W
         dPZA0K6dKisa5+fFw319aAGmM5EOlFd5BbEERcBysSTH0pVvFVNBD2/pbinG5Q6SIPf+
         Y8qHcxQzXXNG+Wn5VG4YnWNxLC6LWqOoUttgsWL3lEawWe0g5sJ4WZ01rPtFiN24tcf0
         HVgZeEIG/BYfUt8wfwkfT3/iXRQReYGbbWYMCqOBt2J7s+6ULdOy5nSV7C+WcfMmadyU
         LTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791537952; x=1792142752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgzMN7GSKW7bwxrlr1yTEXEUokyD0aM/o483mXV6npk=;
        b=S6cnBBfJRuojqVIYrB1hPVck1R0BVTjLJklK34VJIHwYU2DTTDzdyzwVi0C56W/Whg
         7xFavGZ6tiZrwUmB5zL1RtEVvDIC/T82p1t6FodGtVxSSVZZOHGjqlOROJnftyNkJSUR
         XfzTAyedlNG48DpsScoz3N1A3BwBrS3jmA5oaZtB2DVVfaon95O9qoKvNs9g85yYpT8X
         c6fIQqpPj1JtotPKmRwcSj6pyI23y2RrxPwQ1QVWbq82Qlm7/yIq7EfAEsx/BGTxzaTV
         pJ6jN+5lEhufIzL/3PRMM2ilRw6FildNyr9m/nT29UMYfNcqOOdMf7PVtdBRMcJppRRw
         SNAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRvbORw5ZI/NPE7XwR8XPBRtLAjv7TiErA+iprH5L7/sQhH5VWN1JQbBdI7qZsMyJBOTLywFJS2UwR/+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVuAcztcPasF9EgHFpltfZ/7aQHka/JAXeZVpm8mhFIIwnU/aK
	YIAMc7AwCDxrFL7KQxXaVUUzH9YNnJ/YjDU1sns9LKuzFCy4EECTDZywVs4rVQJCD2s=
X-Gm-Gg: AYBFou0nzddZF8r+AddmErAWTmoywRKfuM/G7B+a0SUppSlGNjOoXxk9PvmfqaRWe53
	11Gi+CB2OHzS6tviyxGFv5yA45EqB1FP+Ab6cXE9t5Uepsy3Idw8Cc1cbJaEAJ66cEXUVMRkTxe
	eeZFRy6tR33UahTUjPQur5qVt2r6tE+rF/2n/hb5pDT/ueAQy0oDQAlGCeRxH2F95eVwnk2S+q3
	TQ1QfTuKPTBHsBvwXH8b/kJ68KfbrT0GF8RqczTpbv6RO4+KoTNR1kxorb7emD3JhJf+AtZ4Z0z
	kfjJzm3fpIALC2Uh78dltKQtdZfocFygfJv8dVnNBhCie0upMhWTiuzZp44js/3ezzucw03H4Cr
	IkesisVlkXD6asfR1QWlt3rk7YcvqlRpZQITSyqmLsj9MFFUVB/WoI2mkV6JcC+QfzSM7W/tjcw
	/yqG4KvWqwhlOUgOP1+tdbv/y2LrBjjU/jngW3Bt3GRh9KbTmu85PyhY4Y6Xzh9AkgwWmWH7LqN
	FNc+9zxP9+IZA==
X-Received: by 2002:a05:6000:2301:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-48dba77cd61mr2451398f8f.3.1791537952139;
        Fri, 09 Oct 2026 02:25:52 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9462ebcsm3297499f8f.8.2026.10.09.02.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:25:51 -0700 (PDT)
Message-ID: <f66a803f-6355-45df-83d0-bb6d29afb4c5@linaro.org>
Date: Fri, 9 Oct 2026 10:25:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] perf cs-etm: Queue partial AUX records
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
 <20260821-james-cs-unformatted-per-thread-fix-v2-9-00c4fd0701b4@linaro.org>
 <20260827170936.GO8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260827170936.GO8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/08/2026 18:09, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:49:07AM +0100, James Clark wrote:
>> In snapshot mode AUX records may straddle the boundary of multiple trace
>> buffers. Currently we only queue AUX records whose range is contained
>> wholly within a single buffer.
>>
>> Fix it by queuing any partial AUX range that overlaps any buffer.
> 
> This issue has already existed before this series, so need a fix tag?
> 

I saw it as more of an improvement than a fix. I was hesitant to put fix 
tags on everything because there can be so many different interactions 
between the changes.

Maybe we can leave the fix tags for the actual blockers and asserts etc?

>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> Otherwise:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

