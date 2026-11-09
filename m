Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264697;
	b=ouJMY4aGIher9aZVZqFp1R3Je1JL8w4xq7A4hi+ZhIEcNQlEW7NnXYpF44gcC361/CJP
	 6NP8vwbEcke3lZU+EQw6xemV+oGBJlFzdmB366PTcbmTBW0wX51wKqWv4PVRNOHHNarqv
	 aKV0MY9D+4mUBjLcd/s8FfxGd67MQwMOCA4winmItiD8ixq2G0U/zNpiJJjz4p7SRuG6d
	 Pb5HU2JkOIXjbl97LkxzSj/1Rby2p9uvvKMRLgwNlGWRKsxVh4mlSlSo4I7scdyUpP2Gj
	 qY6TgHzrUZEn+kI+fKYQMuc/HCc9utxrg9fjI2m6IcZbCH30/RHIFwfzAXdXnZRGxPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264697;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=O8KHCux6DdBKzEkjUoqO1TbETr0T7myPvKNAkvAeZEo=;
	b=Hnil61zqLYeQ3DKXPtdPfJqDzhF5RpNmITYyCu6qUvV/3+r3UF0PxLfLQt/cokeXq8rV
	 X+ppZwynsoko0gHnngKwb1TjRj4dVfllKr+O+dtjxlxwHhvSEOOvKXp93Ra4zjBboNCUA
	 aDeJgcqtmrP2+aSr6ib1wpgjc5zFfrz2CRskKRl9f8MIxeVj/P9B4A+T2r2qsjpH/B65f
	 iZRYN88oLVrJGlJ1cxDeZK8QMfZ6nKpJme+74gqu7AN3Xzg6SxSPfRuLaPXVJVP+Juwfo
	 cOI3q0bYSOkE9XC9h8kLeMGbd+MS7CMWrLFQSvUBeBAh4dttQGuGRvrlYottjd7Ve7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N+1eX0lt;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35481606A336
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35481606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N+1eX0lt
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F186814BF;
	Mon,  9 Nov 2026 14:51:30 -0800 (PST)
Received: from [10.57.66.183] (unknown [10.57.66.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25CC83F85F;
	Mon,  9 Nov 2026 14:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794264694; bh=maXvj0CLcHHwIox8S+lKpiL0hGRDaPZhNzhXsuq3WZk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N+1eX0ltPT9Wy2JU8iL7JDkbbLYXUHCGzVG3CYzFvGsCFD3vH9pMR0OqjOXAt0dro
	 TNY6vd0aSgtPeLSBCBoaU+/pENk4EMCdEGdjoiXRX91195R7V3wFkgXF5h9z/7kc4K
	 xjLPM+sg+KiHX46i7qbWQbnu4xd2fCzQ7ClHvtLk=
Message-ID: <a79a52db-2361-4303-9d43-87837f349f48@arm.com>
Date: Mon, 9 Nov 2026 22:51:30 +0000
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
Subject: Re: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop
 sites
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 17:55, Leo Yan wrote:
> TRBSR_EL1 records the status of the buffer that just stopped. Clearing
> it in trbe_enable_hw() postpones cleanup until another run starts. If
> AUX output cannot restart, for example when AUX space is exhausted,
> that clear never executes. Clear the status in arm_trbe_disable()
> after disabling TRBE instead.
> 
> trbe_handle_overflow() can start the next run without calling
> arm_trbe_disable(). Clear the stopped buffer's syndrome and status bits
> while TRBE is disabled, before attempting the AUX restart. This also
> leaves the status clean when the restart fails.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b..dd9c9330bb0c739795f300dafc6ce34e72fbf280 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -655,7 +655,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>   	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
>   	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
>   	WARN_ON(buf->trbe_write >= buf->trbe_limit);
> -	clr_trbe_status();

TRBSR_ELx is UNKNOWN at reset and if we don't clear it at probe time, we 
endup running the first session with unknown values. It is safer to
clear this at enable_hw.

Suzuki



>   	set_trbe_base_pointer(buf->trbe_hw_base);
>   	set_trbe_write_pointer(buf->trbe_write);
>   
> @@ -1069,6 +1068,8 @@ static int arm_trbe_disable(struct coresight_device *csdev)
>   		return -EINVAL;
>   
>   	trbe_drain_and_disable_local(cpudata);
> +	clr_trbe_status();
> +
>   	buf->cpudata = NULL;
>   	cpudata->buf = NULL;
>   	cpudata->mode = CS_MODE_DISABLED;
> @@ -1095,6 +1096,13 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   	unsigned long size;
>   	struct etm_event_data *event_data;
>   
> +	/*
> +	 * Clear the status. No context synchronization is required here,
> +	 * since context synchronization will be performed before TRBE is
> +	 * re-enabled (see trbe_enable_hw()).
> +	 */
> +	clr_trbe_status();
> +
>   	size = trbe_get_trace_size(handle, buf, true);
>   	if (buf->snapshot)
>   		handle->head += size;
> 

