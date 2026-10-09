Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E34C81ACD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556055; cv=none; b=et7UjtTc0ii8luWU3umAHSPTIGBuKx6vV1cwznSVbK24BSdgIRFaeo/gwjpFRec/hx+Q8EmKYiOWnWAAWC3AAizToLgWn2d63sNvn2jvbZgTfen/zNBH1P3saE6tTvSUPYpV9WCLESzKDV5vZQAn5KB9dh9OT1xKYUfcdNTbe70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556055; c=relaxed/simple;
	bh=5LRMhhVS9bFkuBjxhZxKEvU36Gx1/hsOX2rrg97o0s0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7hKH6WAmoFquh6Aq9IrbZnmY/9rGvV+i8V3lzIsq7olTUAdAY9uDgwtihyQOgKu21ZKBgQ9fiIdz3gO0dBPOvbNiTsYLw3yerY6ndSXB9WI16iAzHDxEaKrr/fTlKwRDC3b82F8E6rhdchNxIYrHbBCdDmHskWUvPerYL1z2VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XhKBT/gr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XhKBT/gr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso11272765e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791556052; x=1792160852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J34bsJo8nGDRlMQcuyT+ytZX7Mjn53KWqDlCxkI1Ar0=;
        b=XhKBT/grVf3xLRfbAoxMKLJwyZMRxJOcIMrZ/iAXlyNs+ZZbCGcVqGkTC5VwwIlcOw
         0jcV6NeyCZgBo7h0KTfZn7TykdJbworKvITFO86lVR1zb1hMTOLEbUcP9K/g9bS/gOgk
         lv5NPgJcbNIT1MTeLD3w3kXsPrG3XBW7NXguCZi3q5RBvF0zev1kLXCWWXhgy6n1AB9R
         dzfbG5ytARsOLyWgknjzaK01r4ME2Pj//5h4IvXsfL+L4/9ve/XLukDj77qXY8/myquN
         IppRgCPERH2NQ7xgZUoXvgMX3S7+XYJfH8pcnjlYh7q4bWc5uU2Fex0HCOZ1dQBTVSis
         OdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556052; x=1792160852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J34bsJo8nGDRlMQcuyT+ytZX7Mjn53KWqDlCxkI1Ar0=;
        b=vKXgXMEs4SnXsAZEAMQC7XjEG1b1/Y16Mev+fz3/fb8nVuhnZc39iwPxywGrWd/PtY
         okdl21dZ94pk+14QgZLb0CrpH3ld8PZ/6Xdf1uiNnsA8TzaXnTOGrRF4+sGmccG18Ken
         CdEMXBz28OsaIDrDfr/wyf/IDWDVO94hEeIGfVaDlK+x8su9tHI1d+TRMGQhHS60Jt1z
         fAWtvipsD5SllpHsM5/qBEKwt15XUf3VuYkkciPnuBWI1IgyVCV3cUxwPQFo64CN/mg2
         9njRFp+a7FdIdLb1UCDRvINquk5pNR5pYC18KOd8C3zatOvH8nGWHXpvI94Wlr6b7se3
         HmDw==
X-Forwarded-Encrypted: i=1; AKwUvBxaWmRBqPgZAOe5W83vgsvkTEj581FyK3gmMJ5DWaoL/L/LIkLkRbfgrORvJ65EGMwvvnAeA4VbavDidKQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l2yogd+d5X2jKSi4Iu8cncZbbuNMRN9JKPfClrzL2te1HRfPX5
	oBhxzr2z/bg8OUmaBXdGh8NoZLwhKqlydDQjNfc3nL4O85lk9pnH7B6S1Md3iuy2N5k=
X-Gm-Gg: AYBFou0LMFPcBl8UlYgcnxAoFXQpXGrpUVI6pJOB1+EHj7s61mqF/KxJ7bpULz3/So5
	q8t9a5pZRJeAT4/TfZFY25A+nxCUCQCaemffQxXYUpt1fPeCs530cLmEkxtsv3DtdPqtiKNbUb2
	A0uPiGM9QlQhwcLZ3q6wKcpbeJ7CEGqH/iJvyo8R5xYOLO780rnaCI5/jAdH7OfkxjzkE+B/GHu
	TUIcriSxseHi4eRCix385MKKsDS6aatROaeeqQ5k1Ki+B1mASLVMqFqfAYoPVFSZb08RtIAu1yp
	agSPylcCMuxXkmCAnwD05D2Jjxcpv4zX3au0YhFU/HHNwf0Lzv0jaQIsS9b+dRvEzbuAxH/+bIW
	35QfDbmqj0f3xOTQmsxhCXPKu1iTG+5WYn9/172FPhSmZPuVAigq4VGM48GJmo3iSiDTfwpFRED
	qfXCHqf00URbhg4Mj9q9DFrZ7J+7/RgFeAO9bJkSSc35dlFENMGKdODodw6nzMBjUk/PxZKjqzj
	X/FTp9ZQOd+Pg==
X-Received: by 2002:a05:600c:a011:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a18e447d8bmr38769485e9.2.1791556051602;
        Fri, 09 Oct 2026 07:27:31 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm102532745e9.8.2026.10.09.07.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 07:27:30 -0700 (PDT)
Message-ID: <77e7e412-9ee9-4a6c-9576-db4f8f673bf2@linaro.org>
Date: Fri, 9 Oct 2026 15:27:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] coresight: tmc-etr: Prevent per-thread events from
 sharing a sink
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qi Liu
 <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
 <20260728-james-cs-multiple-per-threads-v3-4-6aee7579f1dc@linaro.org>
 <20260813160504.GC8904@e132581.arm.com>
 <dcea48bc-6a64-413b-acf5-9783f979ab6d@linaro.org>
 <20260819084515.GF8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260819084515.GF8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/08/2026 09:45, Leo Yan wrote:
> On Fri, Aug 14, 2026 at 10:09:01AM +0100, James Clark wrote:
> 
> [...]
> 
>> There isn't any sharing with "another perf session", unless there is a
>> mistake somewhere? Checking that the owners are equivalent enforces this. Or
>> do you mean another event owned by the same process?
> 
> Now I understand that the problem is constrained to different events
> within the same session.
> 
>> I'm not sure the exact model you had in mind was that still supports this
>> and fixes the bugs?
> 
> Let me try to describe my understanding of the problem.
> 
>    ./perf test -w named_threads 2 1000000 &
>    ./perf record -e cs_etm//u --per-thread --pid $!
> 
> We can simplify the flow as:
> 
>                  | T1 |
>    CPU0        ------------------------------
>                     |   T2      |
>    CPU1        ------------------------------
>                                 `> T2 stops and the driver reports
>                                    the warning when trying to sync
>                                    ETR_BUF(T1), while T2 is associated
>                                    with ETR_BUF(T2).
> 
>    AUX_BUF(T1) |                            |
>    ETR_BUF(T1) | Bounce buf0                |  -> Used by H/W trace
> 
> 
>    AUX_BUF(T2) |                            |
>    ETR_BUF(T2) | Bounce buf1                |  -> Not used by H/W trace
> 
> With `--per-thread --pid $PID`, perf creates separate events for the
> child threads, say T1 and T2. Perf allocates a separate AUX buffer
> for each event, and the ETR driver also allocates a separate bounce
> buffer for each event. However, because there is only one shared ETR
> sink, only one of those bounce buffers can actually be used by the
> hardware at a time.
> 
> If T1 stops while T2 is still running, the ETR remains enabled. Later,
> when T2 stops, the ETR is still using ETR_BUF(T1). This mismatch
> triggers the warning and prevents the data from being copied.
> 
> I am just wandering if we can improve the sink driver to only allocate
> a single bounce buffer that is independent of any threads (and any
> associated events).
> 
>                  | T1 |
>    CPU0        ------------------------------
>                     |   T2      |
>    CPU1        ------------------------------
>                                 `> T2 stops and can sync trace
>                                    from the shared bounce buffer
>                                    to AUX_BUF(T2).
> 
>    AUX_BUF(T1) |                            |
>    AUX_BUF(T2) |                            |
> 
>    ETR_BUF     | Bounce buf                 |  -> Used by H/W trace
> 
> This might also simplify the CPU-wide case. Each CPU would still have
> its own AUX buffer, but the ETR driver would maintain only one bounce
> buffer for the shared sink. A reference count could track how many
> events are using the sink, with the final event responsible for
> stopping the sink and copying the trace data from bounce buffer to aux
> buffer.
> 
>> The one in this change is pretty complete and only does 4 comparisons,
>> which seems quite simple to me.
> 
> Before going further with the heavily sink buffer refactoring, perhaps
> a more pragmatic solution would be to reject the problematic case for
> now. Can we do something like below?
> 
> +void coresight_trace_id_is_perf_started(struct coresight_trace_id_map *id_map)
> +{
> +	PERF_SESSION(atomic_read(&id_map->perf_cs_etm_session_active));
> +}
> 
> @@ -399,6 +399,15 @@ etm_event_build_path(struct perf_event *event, int cpu,
>   			goto out;
>   	}
>   
> +	if (!coresight_trace_id_is_perf_started(&sink->perf_sink_id_map)) {
> +		sink->perf_owner = event->owner;
> +		sink->perf_target = event->hw.target;
> +	} else {
> +		if (sink->perf_owner != event->owner ||
> +		    sink->perf_target != event->hw.target)
> +			goto out;
> +	}
> +
> 
> We use a central place etm_event_build_path() to record and compare
> event's owner and target process, then we don't need to spread the
> check into sink drivers. We only care about if owner and target must
> be consistent.
> 
> Regard of the inherit/inherit_thread, I always see they are consistent
> within the same session. Should we ignore them?
> 
> Thanks,
> Leo

Yeah I think we can do something like this, but we only need to do it if 
the sink has multiple ETMs reachable, otherwise we don't need to do any 
ownership check at all. And we don't need to check the target either.

Something like this:

   if (sink->has_multiple_etms) {
     if (!coresight_trace_id_is_perf_started(&sink->perf_sink_id_map))
       sink->perf_owner = event->owner;
     if (sink->perf_owner != event->owner)
       goto out;
   }

If there is a 1:1 sink/ETM mapping, then the perf core exclusive PMU 
rules already prevent all bad sharing cases. Then multiple concurrent 
ATTACH_TASK sessions/users are supported:

   perf record -e cs_etm// -- sleep 100 &
   perf record -e cs_etm// -- true

This is allowed by the exclusive PMU rules because the two different 
processes can never be running on one ETM at once, and if there are no 
shared sinks we can allow it too.

If one of the sinks on one of those sessions is shared, then the new 
behavior is that the second session fails to open. (If a system had a 
mix of shared and not shared sinks, I think Perf might handle the 
failures gracefully and continue with a partial set of events/CPUs 
opened, but it warns about this)

We don't need to check hw.target because "perf --per-thread" already 
attaches to all existing threads (which are different), and we don't 
want to report busy in that case. We do need to turn context IDs on for 
per-thread mode though, because shared sinks mean that you might get 
trace from multiple different threads even in per-thread mode. But 
that's fine as long as the owner is the same, same as the existing 
per-CPU mode.



