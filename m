Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB1746D544
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158367; cv=none; b=qwtFeKYAnVyL+rBc7vL0MDXXBc/H+xHdD5E1w1H0FaU1Cuz0TUnpjynZPswT0/U+aUJz9M2mdKOWyUsbtZJU+gQY9WF3LFngS8xVQxxICxnem2ALw92BPtuSDhPqibG4yMOauX2QVhy4SVbKDHKG2U2+NmhNxeB6Pbw8+82KR/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158367; c=relaxed/simple;
	bh=GqoyPzCw3FD2mwFuPLSh66nmW0x7vmAOEeQWUGZxYEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B50inYzgNbwciMSebatU33UKZ2mTtNkVaB6Em8CEhqLAtyIo7vOPfO5hlZjTAtx+yDjfqFdYd81NivRg21mHHR7p7o4G3pOjMz+TQKcVKx0iPY4LXP/lzmVPfEWzzmLB9NO/dgczojE4pXPtVnDPitGunpAnT2MQwsLJvrL2rjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g5G5AIXS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g5G5AIXS"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1465837f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792158363; x=1792763163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEv96mAiPQXcl62IaJ8y1AeLrRIcw4KQYmrAeodFZwk=;
        b=g5G5AIXSz2p0WFNhb1t1rjLPZ3zLydwET6dKEmri6jZAR+txbQVeqNSYS5kzyAn4ip
         XMNuWVzEisve94pFucxav0k2jynnwAM2+aGqk4361TxoXMwT1Ok4aP3ABHDxtzgBg3JF
         x4BgIpSvhdHrqI91LX9wMVJPtsAfggAD9TyYA75tmedm/KTYj7VVkMit+NaCN4rLr2HW
         7OnZLGhwy1Ei7G8SBNCF4DBxok2xMcRJmoFJmU5wqUinqz2RBdyaDfzQMtYJId0kB6Z/
         Dw6llHpu7wI9uhzxOhm3Ly2rBUsG6VoFTUoqu8Y6UWcv7k9t5RDBUX0+A3Y0lJL5Esy9
         tbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158363; x=1792763163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fEv96mAiPQXcl62IaJ8y1AeLrRIcw4KQYmrAeodFZwk=;
        b=OwBQtfmUYtTz2WmzcMzq6dQkLDvVxkebwD5i5olUcLX/eQzQQE+2ZMqNQ4Bil1aavq
         LSNlwv/lxdLMK3nSs7UDxx18vjjuJlDT7y+uox88jigRe5lgoCeZBuWmvlYq8oyuGeub
         yTWL1hgQ+cqeSnvAHYMVNhzTIGZDVpqkai3TbrOQ4mwBHk0rOGNPQhcMdzcLGmdKtQF1
         SdEHfHuNXKdCv2IUJfTANj1w2M1Uy/HZnhwrIQCNuPxuJ988PNKPJxbaCd0FR/kzQeYa
         7I/QYoMdxCoqrVDmYK09EtJ+k8LnoGBBP3ji4QCL7EYCrEfwlaBk+MzVcz/LaRKRsOpc
         NwnQ==
X-Forwarded-Encrypted: i=1; AKwUvByuUP9RVi96j2f5JYztnF151Q8DYj3jUD0seV+GkECVEJuB8cF+oME+tf/hdeJSNjgchi+7GJ2IVc+xe5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3Fr3IryanCpIRvD7sPc4nbtFBjXetGPO7EJekXsVNHTWYxxVi
	I4sNYT0Cm1gkKSxWir909OnZMOWDuYrhoTTtyP+AdeQYNCAicXrwTzleZQheRBls4sw=
X-Gm-Gg: AYBFou0VfzNY1e+q8Og/5SSyvdiIt65vc5pTpm8D3oLU/LwjvFwe7yQ47hBxBao5oJV
	+5wvRUlYYfzixFwB5hLOszzy6XZnQyqBTcECfD4nC+AZjlQNQNrIPFv6wlCmZ5KdaG6uBRWxW4+
	Ll66bOSol/34cvivpkwr+J1hDAGe5vwULJUVhNyMmIzTzGf9flCapE7EI4bj/Dr0EeB2C5js+gZ
	JbQmSQcNY1JG6nMSzjXPURRF0U0gQDbFJg2pJ3TPU3mqTLksr+Yap4JwVs6P6vcUCqoujju5n2H
	JcHLzS7ppoOVpR2qjSJPyIQERYReHKvkD3jlUJdIQCtPK1Opqpq36rZ/28z4rKS+3qVVNQ8CGjc
	2A6l8F5ci1objkLakHf/fRHFtfjgaorx16HT+KEL1xBH4/hVYJ6NToZ1fPxH20FrUB741XrW6gt
	xcAZw68c624R1PJYRXi6KB5HpTTxSdz3Y3pnWQ/FeY38ap4zM82+uEAf995WHwtR4Ow2ZnpULCJ
	CHWMX5NmkSE8g==
X-Received: by 2002:a05:6000:4b14:b0:48d:eb6b:9d0f with SMTP id ffacd0b85a97d-48deb6b9db7mr17860299f8f.11.1792158362872;
        Fri, 16 Oct 2026 06:46:02 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm5885319f8f.8.2026.10.16.06.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:46:02 -0700 (PDT)
Message-ID: <b851c070-19d2-42b8-b19d-be4b02ad9715@linaro.org>
Date: Fri, 16 Oct 2026 14:46:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/25] coresight: perf: End AUX output when an event is
 throttled
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-4-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-4-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> Since commit 9734e25fbf5a ("perf: Fix the throttle logic for a
> group"), the perf core stops every event in a throttled group by calling
> the PMU stop callback with flags set to zero:
> 
>    perf_event_throttle()
>      `> event->pmu->stop(event, 0)
> 
> The ETM perf stop callback only ends the AUX output handle when
> PERF_EF_UPDATE was set. For throttling with mode is zero, it skips to
> end the AUX handle. When the event is later unthrottled and ETM tracing
> is started again, perf_aux_output_begin() sees the perf handle is nest
> enabled and triggers a warning:
> 
>    [  181.161897] ------------[ cut here ]------------
>    [  181.161906] WARNING: kernel/events/ring_buffer.c:415 at perf_aux_output_begin+0x1dc/0x1f0, CPU#0:2
>    [  181.234120] arm-scmi arm-scmi.1.auto: timed out in resp(caller: do_xfer+0x1a0/0x558)
>    [  181.234223] cpufreq: __target_index: Failed to change cpu frequency: -110
>    [  181.286675] Modules linked in: panfrost tda9950 hdlcd tda998x drm_shmem_helper drm_client_lib cect
>    [  181.314139] CPU: 0 UID: 0 PID: 352 Comm: perf Not tainted 7.1.0-rc1-00058-gdca922e019dd-dirty #11
>    [  181.323915] Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform, B5
>    [  181.334732] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>    [  181.341721] pc : perf_aux_output_begin+0x1dc/0x1f0
>    [  181.346547] lr : perf_aux_output_begin+0x9c/0x1f0
>    [  181.351280] sp : ffff800080003be0
>    [  181.354606] x29: ffff800080003be0 x28: ffff0008023fc000 x27: ffff4b45d287f000
>    [  181.361789] x26: ffff0009764787a8 x25: 0000000000000000 x24: ffff00080dc99710
>    [  181.368970] x23: ffffb4c334553000 x22: 0000000000000001 x21: ffff00080dc99710
>    [  181.376151] x20: ffff0009764787a8 x19: ffff000801cc6000 x18: 00000000ffffffff
>    [  181.383332] x17: 0000000000000000 x16: ffffb4c3a118c998 x15: 0000000000000000
>    [  181.390512] x14: 00003d0900000000 x13: 00000001ffff006e x12: 696765625f747570
>    [  181.397692] x11: ffffb4c3a52758d8 x10: 0000000000000108 x9 : ffffb4c3a117f620
>    [  181.404873] x8 : ffff800080003a58 x7 : ffff000808de4000 x6 : 00000000000fffff
>    [  181.412053] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
>    [  181.419232] x2 : 0000000000000007 x1 : 0000000000000000 x0 : 0000000000000007
>    [  181.426411] Call trace:
>    [  181.428868]  perf_aux_output_begin+0x1dc/0x1f0 (P)
>    [  181.433692]  etm_event_start+0xdc/0x290 [coresight]
>    [  181.438665]  perf_event_unthrottle+0x70/0xa8
>    [  181.442964]  perf_event_unthrottle_group+0x40/0x170
>    [  181.447871]  perf_adjust_freq_unthr_events+0x178/0x1a8
>    [  181.453038]  perf_adjust_freq_unthr_context+0x74/0xf8
>    [  181.458120]  perf_event_task_tick+0xa8/0x290
>    [  181.462418]  sched_tick+0x144/0x2c8
>    [  181.465937]  update_process_times+0xc0/0x198
> 
> Reproduce this with the command:
> 
>    perf record -a -e cs_etm/aux-action=start-paused/k \
> 	-e cycles/aux-action=pause,period=3000/ \
> 	-e cycles/aux-action=resume,period=1500/ -- sleep 10
> 
> An update of the sink buffer is unnecessary when PERF_EF_UPDATE is not
> set, but the AUX output operation must still be terminated. End it with
> a size of zero so that a later restart can acquire a new handle.
> 
> Fixes: 9734e25fbf5a ("perf: Fix the throttle logic for a group")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 09b21a711a8764ea429d712890265c84648e889e..a45f69f39f175f3044322b25fe5413fb97154496 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -748,13 +748,16 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	 * handle due to lack of buffer space), we don't
>   	 * have to do anything here.
>   	 */
> -	if (handle->event && (mode & PERF_EF_UPDATE)) {
> +	if (!handle->event)
> +		goto out;
> +
> +	if (mode & PERF_EF_UPDATE) {
>   		if (WARN_ON_ONCE(handle->event != event))
> -			return;
> +			goto out;
>   
>   		/* update trace information */
>   		if (!sink_ops(sink)->update_buffer)
> -			return;
> +			goto out;
>   
>   		size = sink_ops(sink)->update_buffer(sink, handle,
>   					      event_data->snk_config);
> @@ -773,8 +776,11 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   			perf_aux_output_end(handle, size);
>   		else
>   			WARN_ON(size);
> +	} else {
> +		perf_aux_output_end(handle, 0);
>   	}
>   
> +out:
>   	/* Disabling the path make its elements available to other sessions */
>   	coresight_disable_path(path);
>   }
> 

Reviewed-by: James Clark <james.clark@linaro.org>

