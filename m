Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665724A6880
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403114; cv=none; b=jySz0CRs32996NyHrBC5iLoUdxi/9kJZQOXpPb9XGr2KZh6mESgM4pnXGD2cpAx9o00L4Gr8UsKzK1tkMyO5Lj9NxeolVL44mSIFK42l4lKeY+EfRTkVWqAYBP+J37L4rou0guj93VKD1WElMHKlhS7R1NKBGei2brUzEilHzYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403114; c=relaxed/simple;
	bh=Jaiqy8f/Sl/4tupxPExjmNLGv0E136+VgC8GLOr8zAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U1Obhp9HMBDf9bdPlfFEK/9f1fUQRwy5KmDa0QBmykkBEgzDFPEb5QB6m/Kqec6UnR0uq3RfrSdR11fRL8rgwtHLtBcQHo347KNuBEacvuIMoh3B/2WHEHcxFA8kZmDC3kEe5dyAUbCnHuOHldDRcx3JIncgz2cYXrxSGWrO9MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vvMEf4UB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vvMEf4UB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso7845605e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792403111; x=1793007911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSec+D9Gcxlfy6q4kTQg7A+nAzcOiDEiKgFT1VAeycs=;
        b=vvMEf4UBHEGkieqNf4wbIqn1Nay01W0/fEoY01qNAqZzEj97zxnidwZ8P3kQbrtmZf
         D1oyOIFx28m1ERd98nEk1fxZ+5oyt67rOAPoerKjkJqOxTRJJPYAUrdG7d7k7giyYDxB
         oRIJ6hVMIvyl7UNrLBDpkKmWUwRY87OLTA5uhdn55IRJ835mfrPOt/yTK992jDuJRSnD
         C2RLhmg6pCKZW0CPCG2t2j2TMskMue25HbZalvcQnAjzoYUuignH/KqZCt8WiAcBVoHr
         7arkdC67W1TGtSecbkROuMKHRsJK++EXz9fzZaboUlG5+rGAvPCM95nHygK3GwLRVdfL
         0zgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403111; x=1793007911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSec+D9Gcxlfy6q4kTQg7A+nAzcOiDEiKgFT1VAeycs=;
        b=HYfHZ2kGDNBokU8l6qp5IX+rAdeGB76tOtrTL9tEIoFmq6PZ4qah5RdUyGO3oiowgT
         AIDnaqs+cRjdEQaCuIsariwXN46clWAgWnZd+hYjXUp5LU4lCL3odh2B4zTJPNahNjSZ
         ELhg0ft6Z2RXARFh5FWf5Ps3yTeJKb17VteyLUSWw8YE+p341EEYjtxvMn+7+N3ONjKk
         7LHipwCBSoqorRSAVaIqqlogv6ZXmZnZvamCYzPYt9Tjj4ltoxwSM0bXIGqMMI9SM+bv
         aZxsLQwJR8WcdoBvjJABMOLnezN1TiTbRgqML/5beh5sjrEZz2+x5cA0KGvQSXcvdRni
         Z36Q==
X-Forwarded-Encrypted: i=1; AKwUvByHWHMKUoVQHc9s2kcU1CmdYeThMtjw1GgITpoGDSPbhK8t4F429jp/1/6HPisi4y/x2BmEGo9WKcl5R7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIR8nKEegTQd9ryffbk5FcGWty703yjDBYwl+byGFXM21YQ9qHg
	k2II9bvqhgdf/00tbt4Sfy+Uo5CvAU1qtuU3MMZCA3R5NQWWBcyxZXAQFlgI52FQ9BI=
X-Gm-Gg: AYBFou1Vkckay3RP9HR/IAhfxxOz0kVPUvIkAGw+O+jJVGr7xLxWXGrRq9J8fnnp0u6
	kh0CJ+ymCVBT96G2t9EBx1QuOgAzmGbMumJIXAgvbM/JklN9RpbE5tkha0tvQtRp3id+tSNIcFA
	l/8ykxjTH+gSpxRAwERmy5IbS/i4jU73Xw430GPUQf/WMnDTVzPDynkcBgVNwmqAOMuKYuvL2P/
	0id+M+hGMR1JWc+zYxfEHeb//k3F1EleUehlwrID++2fuB/gXfc2/A4LWzQnv6Hq7AVLdLv+wiD
	QjB08j4d3SvZwru+14XuCBnf61lX4ciKkN7R/vfL4aJEqxUZ1DMYOp/wAoUP9oIWLF5BbNW0wpt
	e2UkDa5niVWTysp1d+cnOz9ztgLP6T8gyRPVrQCuDyQ5DdP9P+j+JABl+YspRXaF+scfvPnL0kF
	+6b/QPTO/QHxh/idZlzD0nhcatxOXhtDxIsiQ5KH84q91yGTcekpDhTK/p1EwziCcSwl7sg/qYE
	4A=
X-Received: by 2002:a05:600c:1395:b0:4a1:c6fe:5c0e with SMTP id 5b1f17b1804b1-4a1d76148e6mr149657955e9.33.1792403111528;
        Mon, 19 Oct 2026 02:45:11 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd91c55bsm311684915e9.0.2026.10.19.02.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:45:11 -0700 (PDT)
Message-ID: <3d4a1883-3600-4e83-96ca-ccaec398fe91@linaro.org>
Date: Mon, 19 Oct 2026 10:45:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/25] coresight: trbe: Pad snapshot buffers
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
 <20260915-arm_cs_support_aux_sample-v1-10-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-10-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> Snapshot buffers use the head as the write pointer without checking its
> alignment or the space remaining before the limit. After a stop or a
> move to another CPU, the head can be misaligned for the current TRBE.
> It can also leave too little space for the Fill mode out-of-range
> workaround.
> 
> Pad the head to the current CPU's alignment. If the remaining buffer
> cannot hold the minimum trace region, pad to the end of buffer. Update
> the head for setting next write pointer.
> 
> Fixes: 3fbf7f011f24 ("coresight: sink: Add TRBE driver")
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 36 ++++++++++++++++++----------
>   1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index c7cbca45f2debd4047b93283ea9fe5dd9e1f2ebf..a31f2ebc327cd681344a62de28c0b3840505a9cb 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -374,18 +374,6 @@ static void trbe_pad_buf(struct perf_output_handle *handle, int len)
>   		perf_aux_output_skip(handle, len);
>   }
>   
> -static unsigned long trbe_snapshot_offset(struct perf_output_handle *handle)
> -{
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
> -
> -	/*
> -	 * The ETE trace has alignment synchronization packets allowing
> -	 * the decoder to reset in case of an overflow or corruption.
> -	 * So we can use the entire buffer for the snapshot mode.
> -	 */
> -	return buf->nr_pages * PAGE_SIZE;
> -}
> -
>   static u64 trbe_min_trace_buf_size(struct perf_output_handle *handle)
>   {
>   	u64 size = TRBE_TRACE_MIN_BUF_SIZE;
> @@ -405,6 +393,30 @@ static u64 trbe_min_trace_buf_size(struct perf_output_handle *handle)
>   	return size;
>   }
>   
> +static unsigned long trbe_snapshot_offset(struct perf_output_handle *handle)
> +{
> +	struct trbe_buf *buf = etm_perf_sink_config(handle);
> +	struct trbe_cpudata *cpudata = buf->cpudata;
> +	u64 buf_size = (u64)buf->nr_pages << PAGE_SHIFT;
> +	u64 head = PERF_IDX2OFF(handle->head, buf);
> +	u64 next = round_up(head, cpudata->trbe_align);
> +
> +	/*
> +	 * A task event may migrate to a CPU with a different alignment or
> +	 * errata. Make sure it has enough space, pad up to the alignment
> +	 * required by the current TRBE.
> +	 */
> +	if (buf_size - next < trbe_min_trace_buf_size(handle))
> +		next = buf_size;
> +
> +	if (next != head) {
> +		__trbe_pad_buf(buf, head, next - head);
> +		handle->head += next - head;
> +	}
> +
> +	return buf_size;
> +}
> +
>   /*
>    * TRBE Limit Calculation
>    *
> 

Wouldn't it make sense to have compute_trbe_buffer_limit() do the 
padding now that it happens for both normal and snapshot mode?

Either way:

Reviewed-by: James Clark <james.clark@linaro.org>

