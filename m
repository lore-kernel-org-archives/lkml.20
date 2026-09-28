Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F5A34DCD2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588481; cv=none; b=EaikOKLZlTM9kxDCqJydMP4Y/NHsvUVp/F3oSydsb16/WySMzf4U2dxvJO2OXxSt0BQzZski7lw+vGXpmee8vTpl7fymrovGugbQwwbzBWwliiT7LhBBLdGtzu39qCNJmY1yv2tGAlXquZz1RhT1zzbWAVg6MROEZXXy0jCD3p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588481; c=relaxed/simple;
	bh=DD+2DnZkFVPUq7yp49diyNCHzHYKY7VBDFME87IaNDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRoNPg9FCmrWNwUMyETqq6eSLVwvmfOQ5+shWAAOOZjpYhOPUYh4lBw9oQJm7xytiaE1gzcZMCTBPAl/7R56GPlve1syfJSBJIatfKOpj6oJj+G4/mlxyHA/gEbOV6HDLcJ17Gl0803KC7WEu0IYRKtVFPvc0e8KKFA9Rih+iNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DY9Wm9Cv; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DY9Wm9Cv"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2afb4e9977so284756966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790588478; x=1791193278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ge0jtZOtdWzZExU51tpnSwFUmBlplbOktdbQBWDiyyQ=;
        b=DY9Wm9Cvls3y7xidAq37SjJuE5BWNbjslTIqEXZ0Dhs295xu64B5YCV+GU4HgnhEgA
         zM1QA92Gqex5IDHfU9Bjz1yJToI1qaUW3I3EARnO7fCMJG5WDJZmLsw8TBgyfGs8E3ku
         WLHcKFSD1vb8wP+fZVDJ7X3aSLFYVYmziruXcSvlQgP6aDOZTiVLXoiYaJBhmed0Xatj
         j820Nzy6VG7FA9j8CQvABhTQKlGzsN/hqPWFf09FoV8YoR14rtyQVE7D0mhKUWg8ap+b
         RZwKFsOPFjmL4n5CNT78jDjL/BFbdpdzjt9a1RSVolAr2UWp4t5dI8BSD9WJxZrDiwR4
         wuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588478; x=1791193278;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge0jtZOtdWzZExU51tpnSwFUmBlplbOktdbQBWDiyyQ=;
        b=BtDoDEl9jTPauFEkBZSs2RdHufMaMcafbw7069FnZO46enwjV3my47M828RnlUutVl
         8dkdLgaopwzOekBCs+RzoSWnpABtYJKhPVVp8NRWCLV1edr84ZMxpPtGdPKItAS+qWOv
         0g36eqlhx82WtXsWI/DjQQ2rH/ukvMDLYnSFWwnWXp+D8MsfQOAqjQw6LkKsTc/YfbDX
         3M6YDV95IugXLq78wNpUTzSdZDOr/lgv1xiE77O7eWgVCUOYbqzMYt0FvZvmzsiloGOa
         E7I3YVe34DPYa9JAyL+8Y73kbHmfpt9HiWzPi4OUMz/26D5T9Fce0gkkPjBYdyawnMZo
         xy8g==
X-Forwarded-Encrypted: i=1; AKwUvBwfzed/NNZIybEfuOSa3MAoBQ/hyZXbN2U0TkIhRCTLvMd3RLm2nvpSozwaluCd1DArPXzHzSUh0MSP+s8=@vger.kernel.org
X-Gm-Message-State: AFuF++n2nCtdc9Qme36YgnrA5l7mFOZCQTtAfKuoVOrctBExTv7setY2
	9tKEkEZuIWoIGJHDnZ5qKIDxcVLEGF2Q7mW75Fq5BjeLDAr1cocCfOTJ67hmkQIMkNk=
X-Gm-Gg: AYBFou0KmCvkX12HCPibZMJS5QFYsrayvwIurpfzBP3rQEhURKxi/7tP1HAqXQ7nucY
	eXMwdRToUO4ocbV1YRi6rtJ5r5Mo7qStbAmJ7FLngafXmMyKt14lZBvzcph2hGfQodZfL0F2rvW
	ONIm63KOx15zySp8GOCK73jOv+RKl9UX9kti0c5ppeFazM5y4QcShRRTfkWfSqU1/9yp4Phl8nN
	jMwAJoVMYrS1yvzWQRy4ya01f0sIU6SW41lveAMp8mRE8X4L7KhadmIn4HqYdjfwK7frVM/HtGv
	OwHPEplhp72IofWNteySUj1J5iu0rtLuUibq0YjBMPu60BXrhGnjVfVXhdY8BK3CIq7VkBG0Wpu
	wsCSbePCbF7PtdoFEH9843LBvfLkPQosCETb6ags6PXoKDfl+9ejsy/3I1xeji0FRwxvlxZ6wyT
	yP6+ttUUIcVHwJ5k2cs2dN91QHqVMGtM8cfHuzHmSlAGRK2GmiDq85Gjk7xHA4mjkJKaRQFCqq1
	YA=
X-Received: by 2002:a17:906:6a04:b0:c2d:d89d:346a with SMTP id a640c23a62f3a-c2dd89d497amr199434166b.3.1790588478209;
        Mon, 28 Sep 2026 02:41:18 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2af3128c48sm370662566b.3.2026.09.28.02.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:41:17 -0700 (PDT)
Message-ID: <0e6c26a9-854f-42d8-9224-6e23937ad3f1@linaro.org>
Date: Mon, 28 Sep 2026 10:41:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] perf: Suppress redundant ITRACE start records for Arm
 SPE and CoreSight
To: Leo Yan <leo.yan@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Mike Leach <mike.leach@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>
References: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/09/2026 17:36, Leo Yan wrote:
> Thanks to Tamas Petz for noticing that Arm CoreSight perf data can contain
> many PERF_RECORD_ITRACE_START records.
> 
> PERF_RECORD_ITRACE_START provides the decoder with the initial thread
> context when that information is absent from the trace stream. Once
> tracing has started, Arm SPE and CoreSight decoders track subsequent
> context changes using context packets or recorded sched_switch events.
> 
> Have both drivers call perf_event_itrace_started() after successfully
> starting event. This prevents perf core from emitting redundant
> PERF_RECORD_ITRACE_START records when an event is scheduled in again.
> 
> Since the Arm SPE and CoreSight drivers can be built as modules, export
> perf_event_itrace_started() before using it in those drivers.
> 
> This series was verified with Arm CoreSight using the commands below.
> The perf data contains 100 sched_switch events but only one
> PERF_RECORD_ITRACE_START record:
> 
>    taskset -c 2 perf record -e cs_etm//u -e sched:sched_switch -- \
> 	  taskset -c 2 bash -c 'while true; do sleep 0.01; done'
>    ^C
> 
>    perf script -D 2>&1 | grep -c sched_switch
>    100
> 
>    perf script -D 2>&1 | grep -c PERF_RECORD_ITRACE_START
>    1
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> Leo Yan (3):
>        perf/core: Export perf_event_itrace_started()
>        perf: arm_spe: Suppress redundant ITRACE start records
>        coresight: perf: Suppress ITRACE start records
> 
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 2 ++
>   drivers/perf/arm_spe_pmu.c                       | 2 ++
>   kernel/events/core.c                             | 1 +
>   3 files changed, 5 insertions(+)
> ---
> base-commit: 786262be6048deab760f68c8acc2c85607165894
> change-id: 20260901-perf_suppress_itrace_start_records-42faf45e9ce9
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>

