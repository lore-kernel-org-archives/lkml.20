Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324844;
	b=I3x4v51eKdtFUFP8v6qeTDRV7VR/4GFZ+Hgl9nxpcvbXZr6JX57VsTQy7JNuVezW3FWZ
	 MznnmAdDk8mW6/Oj+sSiyYVglcU/HOLvIFDeMi7p1yS3S4UZi2/I7JtjyuHqsDbXvq2oT
	 nKGTqj0zwwyQS1WM6B0+LGrvJ51WmoHbgfTZxkrSRsBDqHv9rKRgQ/+gzCtoPZBWni3d2
	 xF1vpm/0o4BxYzBaHMdrCL2GAZ8BRjp9AachjCK97cTZuRl8uauR3p93aYQ3lG2QSDGL/
	 a1rNwDkUArBmsm83aPIc6huZCwfR6JyMFoc+SrsWEINSpO5hFSMXtjSeon8dvtjb7Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yluzRKmVDPu+7EECyA/efKixS7yyj5ZyapVEgCd4Byg=;
	b=4qL/KoMnZp8qPogH7Oly4SRYQV9v8DS8LoNozF4VvbyCkz96r5orFej1Q9/HOCfeRrmt
	 TomLivRhWwGKfdBdu86KsCPYrBppNS8BHy66q5XjIB4Vfv/IjE2EQ1YY4Y2iBJa4y+La0
	 4rud2Tui2gBGyqdkSDEln1LcTJXnt1PVLLGnmPCgDl0fCtCMf181kc/sRet94Go12zbqn
	 PldPVpE0wBEiTQ6Mze3EJd3VOWsE2V7UvuqPXE13nlNjM4uGINFUifR1Nxzs0NvTbVM/Y
	 ydR5GAbbQj0DfVrY9WOoTIKnc4iSyJjaUT8QXLxTBKgd31unaBwRRHj+C5Yau7koUsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AJGtPjpk;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244F6606A339
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 244F6606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AJGtPjpk
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49318428d98so1151584f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324842; x=1794929642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yluzRKmVDPu+7EECyA/efKixS7yyj5ZyapVEgCd4Byg=;
        b=AJGtPjpk4PKprYewYVnrBUwOAmxm+FC6DejzkymBnetvLQdlSs2Ozqz/LL4d+nh+iR
         Cc1/oQaSSZudftwymLggWc7hx/8KJ47EQ/O8KeJvDq8AYM37DgF7VNR1xzR37beWwgns
         urL6MupdY9mPHdc/hRaKOsSnyV1o52gkEnXo1VqwurUzFNwv7uKixoDU3V9eU8EAg0QS
         y1NbtmarHQXUC5KFeOWLAfmTLpLEC1Hb2WfhmZXmMGIgfek0tSWeJtifeEfcvJbid0L5
         csIKMBEpsyITKCNkbQyojd47jBuRebXwyXMvE4U+oG2g9DT3hmwp7oWf1rWRaxPq1vEl
         /qGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324842; x=1794929642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yluzRKmVDPu+7EECyA/efKixS7yyj5ZyapVEgCd4Byg=;
        b=x7vOA3w4j/wTLkt0/r4lXQamIneQMabDYuSnBi0MeWBFMo5DP01GP04lImjW5VRFL9
         tHVzGHGvBPNYH4OlPuCC4n1bMjXMY1v1UczLKUdcWTg2rDUYnBAAFzvv+PmZ4WSI4W+T
         xq2rfmAuPK0MKGrYNACvKW7Tbc2vAETEUGXol9iMrrg6pMXZiBNrlqO7lQPvgNVvTnZI
         iFa0HAW8gUq4qdboh+BLaTnAlNADYjDHrjM2izofThq1F9JKJg6z/zhFBw1XYTevr3hT
         vGK82ivScEzRZMZwNpD+SIte8lLvyHIrJsAHe1V7A5bC7A/5GbPlHFqAyGeMWleYnDtt
         1rHA==
X-Forwarded-Encrypted: i=1; AL+hErH39jZqS9kVRX+fMK4Sf3jrHM+ucpV67zZjvE0Ukr3HgpiX57/UNkUkeJZxJx/LMhJl4ETM93BW6M/sjhc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QE7feMR9dEzJIgKQGZaumQhmLNw2vwVw9F8/MQ5rVdMN839Rn
	p8PZWFJquBX2d7+qu6v0Imo6zdIwMaiG0CR8K468JCY5irYUnJyEpmxtvQAzor4BVTY=
X-Gm-Gg: AYBFou3DUG+PfjS360UvNkEo9spXHirug7oDF8jM2uIjwLXVH3SwY+kfHsNmoj+catx
	VvTHI4X8mwfmrz1Tz/58tyDC6+xEmibGKqp5y4OuektL2Be1MT/IAQAWTq8zSxYC+dhmPMQlyWg
	35/LiYb97OUimWe/+s7z7s45QmhqRMaUhWr6e7peUe5WcZJiOUJeHxmjQhI/sLqfObrAxTcWUc7
	+twi1a2oVMsDNCLabyrbETZImsVxX6f3chY78Matuvr5yz9aLyPvsOOJC4tL8tKodrru7jLYCv3
	vtvYuEEjsclq/bmJwyJUPjtnTMUhw9zGiVNC3AWCDN36dnxEhq6YdD/HJmjNm1WTRD/knSGB7f8
	QX40t3QJzsvukoiJK9ov60tfu0p4qaZ9LvF1Spk5UfsEwxyEQJp4I971KzQ+z33kXxE1y3B+jIq
	r+VOTDTCpH1pxfbU0NnCQ2G1LLifMUpach4qjiLBLSRp4xj4mc4l3aGf1we7r1el6JuORKQ8Eg3
	CUND7wZy5p1+7l4pcPEvmvI9tt9VNz0rfwpDxmQ2hAhKGcdT+7GnMMpv3cHc6x9/bxDnzj+rAw4
	ZE8HwnKfpwhcxt04gKYvEDIBB3UilbroECc=
X-Received: by 2002:a05:6000:25e9:b0:493:59c9:ebcf with SMTP id ffacd0b85a97d-49831432d19mr5298578f8f.57.1794324842495;
        Tue, 10 Nov 2026 07:34:02 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-499823761f5sm105321f8f.2.2026.11.10.07.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:34:02 -0800 (PST)
Message-ID: <bc1cd619-1b3a-4d67-98ff-c4351a1c3662@linaro.org>
Date: Tue, 10 Nov 2026 15:34:01 +0000
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
Subject: Re: [PATCH v2 16/23] coresight: trbe: Always classify TRBSR when
 updating buffer
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-16-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-16-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> arm_trbe_update_buffer() must account trace when perf stops a session,
> even if no maintenance interrupt has been handled. Prepare it for
> trigger and wrap modes by making the trace-size decision from the
> drained TRBSR status rather than gating classification on IRQ.
> Acknowledge IRQ only when it is set.
> 
> In FILL mode, reaching LIMIT sets WRAP and IRQ and returns TRBPTR to
> BASE. Interrupt delivery can be delayed, so update_buffer() may run
> before the IRQ handler. The existing IRQ-gated path uses WRAP to size
> through LIMIT in that case; preserve this while also classifying
> updates without a pending IRQ.
> 
> With classification on the no-IRQ path, a normal software stop can
> have TRBSR.S clear and an ignored detected trigger can set TRBSR.TRG.
> Neither should warn or discard valid trace. Mark fatal status as
> truncated and return zero. Use LIMIT for a filled WRAP and TRBPTR
> otherwise.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 24 +++++++++---------------
>   1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index ac49098aa08412a23a20d32f84c2e1977ee4a223..661f4a78e67c30652de8c834e4773819fa67b5ac 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -662,8 +662,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   	int ec = get_trbe_ec(trbsr);
>   	int bsc = get_trbe_bsc(trbsr);
>   
> -	WARN_ON(is_trbe_running(trbsr));
> -
>   	if (is_trbe_abort(trbsr)) {
>   		err_str = "External abort";
>   		goto out_fatal;
> @@ -844,7 +842,6 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   	enum trbe_fault_action act;
>   	unsigned long size, status;
>   	unsigned long flags;
> -	bool wrap = false;
>   
>   	WARN_ON(buf->cpudata != cpudata);
>   	WARN_ON(cpudata->cpu != smp_processor_id());
> @@ -896,23 +893,20 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		 */
>   		clr_trbe_irq();
>   		isb();
> +	}
>   
> -		act = trbe_get_fault_act(handle, status);
> -		/*
> -		 * If this was not due to a WRAP event, we have some
> -		 * errors and as such buffer is empty.
> -		 */
> -		if (act != TRBE_FAULT_ACT_WRAP) {
> -			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> -			size = 0;
> -			goto done;
> -		}
> +	act = trbe_get_fault_act(handle, status);
>   
> +	/* If an error occurred, the buffer may be empty */
> +	if (act == TRBE_FAULT_ACT_FATAL) {
> +		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> +		size = 0;
> +		goto done;
> +	} else if (act == TRBE_FAULT_ACT_WRAP) {
>   		trbe_report_wrap_event(handle);
> -		wrap = true;
>   	}
>   
> -	size = trbe_get_trace_size(handle, buf, wrap);
> +	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
>   
>   done:
>   	local_irq_restore(flags);
> 
Reviewed-by: James Clark <james.clark@linaro.org>
