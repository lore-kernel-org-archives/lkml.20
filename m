Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6324B26F6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404803; cv=none; b=KJbEvA/iI2fLZKLU/PG9ikV3rh0JT4+tkZ2p10zsYFySUxk93iFq20L51ZSgea7y/kgndsnE6AKLNNW9k87w/CdpYYayIOTn/p08ywOTqEh56WOr3JpN8E/TL4k5TkvED6qzRwfr4zwVy6PUQVGcvOKYC2GfL4Oq+pHlVmmm+1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404803; c=relaxed/simple;
	bh=hMelsRvLjfrvdim4P2XvKNTjKGwBcZMmyVl7OcEV0vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6N1YUUs6g/gRHM0QeWyUxCTP1lM0iPZ89gMHd/ncooruJPSdNYK8GPNh/WtbPPzVPBMn5g/fy7CBGP5/pIZM0v33JVvhGI1lz7v7H5WOhtlFn+7xRjuOtwPSgxVhog0irCLV5Pgs9+Xy9f6NoqcSuBB2a8pGAVifXLI+LxcL7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dk9g/gsX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dk9g/gsX"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b060ec084so1257002f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792404799; x=1793009599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQaS45ib1uYNqWgIS/krAmhGoRTZgg0tky+KTZ6OzjU=;
        b=dk9g/gsXjB9F1y8lV3r1qZxTfkGw4pO+siPh87BtZdV6oRB+VRx0jppKSqJjSu15jJ
         wIDLN7ptrgPgfRttxv4gQTkhtf2J2JQOTNsdwV3D4qpk9PWjsQ/otL7GG3HsDxAbG0A/
         vagHtneWyQ/xIi/xBNSvDam/K4EGJ1XPKqTpTfR+8OcCfCPjOxIgikwnLT8j9TWtAPIS
         iYx2fs2u6e9t2VU5QribruiRrZvuUCknsSz5PltxlDfov0ddHsRpk8UR+/PsDCwjnEt7
         NvnMmM8C1jpZgtL8FQv9dsK5Xh8k7o8Ubu/Rlmk5ok2IQJ+NmQvFjVTYup7Mie9IJYk9
         IsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404799; x=1793009599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQaS45ib1uYNqWgIS/krAmhGoRTZgg0tky+KTZ6OzjU=;
        b=TCEpQJpgoh2ZtU4vWyDs1vRHy1wCI8+aAez0BNRo+Gs839OALOxViDs1SSrPaYtxmJ
         dszO7wRC9T1Hfz5le7sgwD4jhrgbRm/F/EiFtR6/hD4+pcsJla+vHUkMT/+53xQfO7tS
         675gEtjSB9uSpvf+cNqGoGhWt+zuahlJpXNC6Dsr9ULlNCtf44mqfwB8j7sZBQlSkcPY
         WP4npVS+GHBMDJVHpI0frNBtlO5EnZ62OWT3yAb57nAcFr1zP/zIrOgPLtqw/vi9sYub
         v/X8gBmfqe+TlgXYeV9tI/z3PZKoJZx3P6v5O7QFHr6bu4Nw6FsG+oAKb2x2raAy3MFL
         TRuw==
X-Forwarded-Encrypted: i=1; AKwUvBx5MR31NzCIA5JBh+pEOId3u4n9gdD38ZWpOVvDDlE1z9Pgu40HIlHvcSZmbrdXNMFrf6k5CjADV4Xegsk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmNOQwS/L+hQHa1S8qKRnzqNMjDxm75Npp0/ojSGr0RCh6/EMa
	ExG8OpJL4/GGcqaU+K/1S626/2bZWVWaf6gC7jGn75yEtbzExmskA+eGfYwAPN7wUpk=
X-Gm-Gg: AYBFou2g2cnhBS3vVhP5bYBjaR4E5B+Fd8RrTQRI+5aV6FHPtXclpjytgPStW2AVEpC
	yTuwYKhF0srWSCltnq9vaLgopu6NY6EgiRj5lHcPCzFjRmEtH2nUQHCbS61IyMjg44FTv3SLmPL
	GBPH8ZDCoi709swbobTB1Yjn1Qea+5qNMZa6h0bAzJqgdzuinFpHTZBNzXKyTK0Z+UUfn7Rf2bc
	43ZPY9/9HCAJVd+cDAUSUluLgrejnoZ28FI4dQ5qQbJcKUZPgCRFzO4Ttsg8akjlnBQBPkkkapW
	QUgbpNAzZhP+CBxeC/XE+BcZArHl48UFE0l3p9cnWSFOyCzdlq7jmj4UpGmlUdFO/9CGCxqB+cG
	L/CdhOvBSQu9IdBfASaTaLduGbvmXkltbpn+ihdH52NBlZsMzcK1BChZMuUdqLECd1lvim6gMzc
	SZ5AodPsMJSv3zmd+TNbeEx8HVGNRHmxV9Epfy7M3ALMpLjczDT43DjgcVqatzwjfZT6BSqGOI6
	X8=
X-Received: by 2002:a05:6000:1b8f:b0:487:72f:fb41 with SMTP id ffacd0b85a97d-48e07fa0e82mr10206523f8f.39.1792404799491;
        Mon, 19 Oct 2026 03:13:19 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510201sm23032525f8f.55.2026.10.19.03.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:13:19 -0700 (PDT)
Message-ID: <1a8321c1-f8de-4f6c-bf3c-78ccb23a6402@linaro.org>
Date: Mon, 19 Oct 2026 11:13:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/25] coresight: trbe: Use circular buffer mode for
 snapshots
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
 <20260915-arm_cs_support_aux_sample-v1-11-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-11-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> TRBE uses Fill mode for snapshots, stopping trace collection and raising
> a maintenance interrupt at each wrap. Circular buffer mode retains the
> most recent trace without stopping collection or generating wrap
> interrupts.
> 
> Use circular buffer mode for snapshots unless the CPU requires the write
> out-of-range workaround. Keep Fill mode and its guard page on affected
> CPUs. Select the mode on each enable to handle task migration.
> 
> Calculate the minimum known trace advance from the write pointer and the
> WRAP flag, since additional complete laps cannot be counted. Advance the
> AUX head by this amount, then clamp the reported size to one buffer of
> retained trace.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 61 +++++++++++++++++++++-------
>   1 file changed, 47 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index a31f2ebc327cd681344a62de28c0b3840505a9cb..ab3c5c7d27f3d272b07eade1e6452559808b196c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -69,6 +69,7 @@ struct trbe_buf {
>   	int nr_pages;
>   	void **pages;
>   	bool snapshot;
> +	bool circular;
>   	struct trbe_cpudata *cpudata;
>   };
>   
> @@ -324,9 +325,11 @@ static void trbe_stop_and_truncate_event(struct perf_output_handle *handle)
>    * When the write pointer reaches the address just before the limit pointer, it gets
>    * wrapped around again to the base pointer. This is called a TRBE wrap event, which
>    * generates a maintenance interrupt when operated in WRAP or FILL mode. This driver
> - * uses FILL mode, where the TRBE stops the trace collection at wrap event. The IRQ
> - * handler updates the AUX buffer and re-enables the TRBE with updated WRITE and
> - * LIMIT pointers.
> + * uses FILL mode for non-overwrite buffers, where the TRBE stops trace collection
> + * at a wrap event. The IRQ handler updates the AUX buffer and re-enables the TRBE
> + * with updated WRITE and LIMIT pointers. Snapshot buffers use Circular Buffer
> + * mode where possible, overwriting old trace without stopping or interrupting
> + * the CPU when the write pointer wraps.
>    *
>    *	Wrap around with an IRQ
>    *	------ < ------ < ------- < ----- < -----
> @@ -628,6 +631,7 @@ static void set_trbe_limit_pointer_enabled(struct trbe_buf *buf)
>   {
>   	u64 trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
>   	unsigned long addr = buf->trbe_limit;
> +	u64 mode = buf->circular ? TRBLIMITR_EL1_FM_CBUF : TRBLIMITR_EL1_FM_FILL;
>   
>   	WARN_ON(!IS_ALIGNED(addr, (1UL << TRBLIMITR_EL1_LIMIT_SHIFT)));
>   	WARN_ON(!IS_ALIGNED(addr, PAGE_SIZE));
> @@ -638,15 +642,11 @@ static void set_trbe_limit_pointer_enabled(struct trbe_buf *buf)
>   	trblimitr &= ~TRBLIMITR_EL1_LIMIT_MASK;
>   
>   	/*
> -	 * Fill trace buffer mode is used here while configuring the
> -	 * TRBE for trace capture. In this particular mode, the trace
> -	 * collection is stopped and a maintenance interrupt is raised
> -	 * when the current write pointer wraps. This pause in trace
> -	 * collection gives the software an opportunity to capture the
> -	 * trace data in the interrupt handler, before reconfiguring
> -	 * the TRBE.
> +	 * Circular mode keeps the most recent trace in a snapshot buffer
> +	 * without generating wrap interrupts. Use Fill mode otherwise so
> +	 * the IRQ handler can collect the trace before it is overwritten.
>   	 */
> -	trblimitr |= (TRBLIMITR_EL1_FM_FILL << TRBLIMITR_EL1_FM_SHIFT) &
> +	trblimitr |= (mode << TRBLIMITR_EL1_FM_SHIFT) &
>   		     TRBLIMITR_EL1_FM_MASK;
>   
>   	/*
> @@ -757,6 +757,26 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
>   	return size;
>   }
>   
> +static unsigned long trbe_get_circular_size(struct perf_output_handle *handle,
> +					    struct trbe_buf *buf, u64 status)
> +{
> +	u64 start = PERF_IDX2OFF(handle->head, buf);
> +	u64 write = get_trbe_write_pointer() - buf->trbe_base;
> +
> +	/*
> +	 * WRAP indicates at least one crossing of the limit. Any additional
> +	 * full laps cannot be determined, so account only for the trace
> +	 * known to have been collected. This also preserves the write offset
> +	 * when updating the head.
> +	 */
> +	if (is_trbe_wrap(status))
> +		write += (u64)buf->nr_pages << PAGE_SHIFT;

A wrap in snapshot mode only indicates a crossing of LIMIT, not when 
data past the tail pointer has been overwritten (which is what snapshot 
mode should actually consider as a wrap). For example for a buffer of 
100 bytes, if you write 120 bytes from [head - 10  .. 10] it's marked as 
"wrapped", then:

   size = write + buffer_size - start
   size = 10 + 100 - 90
   size = 20

So it only reports a snapshot size of 20 bytes and the rest of the trace 
is dropped.

The way to detect wraps for snapshot mode would be to set the trigger 
counter to buffer_size, and when it reaches zero you know there has been 
a wrap (overwriting data in the buffer) since the last snapshot, then 
you can use size = buffer_size, otherwise with no wrap detected do the 
calculation above.

I think this is technically a regression because the previous fill mode 
handled both 1x and 2x wrap scenarios properly.

> +	else if (WARN_ON_ONCE(write < start))
> +		return 0;
> +
> +	return write - start;
> +}
> +
>   static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
>   				   struct perf_event *event, void **pages,
>   				   int nr_pages, bool snapshot)
> @@ -887,14 +907,19 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		wrap = true;
>   	}
>   
> -	size = trbe_get_trace_size(handle, buf, wrap);
> +	if (buf->circular)
> +		size = trbe_get_circular_size(handle, buf, status);
> +	else
> +		size = trbe_get_trace_size(handle, buf, wrap);
>   
>   done:
>   	local_irq_restore(flags);
>   
>   	if (buf->snapshot)
>   		handle->head += size;
> -	return size;
> +
> +	/* At most one full buffer of trace is available */
> +	return min(size, (unsigned long)buf->nr_pages << PAGE_SHIFT);
>   }
>   
>   
> @@ -973,7 +998,8 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
>   	 *  - At trace collection:
>   	 *     - Pad the 256bytes skipped above again with IGNORE packets.
>   	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE)) {
> +	if (!buf->circular &&
> +	    trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE)) {
>   		if (WARN_ON(!IS_ALIGNED(buf->trbe_write, PAGE_SIZE)))
>   			return -EINVAL;
>   		buf->trbe_hw_base = buf->trbe_write;
> @@ -1056,6 +1082,13 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
>   	cpudata->mode = mode;
>   	buf->cpudata = cpudata;
>   
> +	/*
> +	 * A CPU affected by the write out-of-range erratum cannot use circular
> +	 * mode, as the TRBE continues tracing after wrapping and may write out
> +	 * of range. Fall back to FILL mode so the IRQ handler can fix this up.
> +	 */
> +	buf->circular = buf->snapshot && !trbe_may_write_out_of_range(cpudata);
> +
>   	return __arm_trbe_enable(buf, handle);
>   }
>   
> 

