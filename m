Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324793;
	b=3MgtXobMXBHFrMfsV5JMleM6r449LSK5SXMQjW53ioMqGOnMmzSDEqDMyscPXz9+XxqG
	 ZqCMH+7xVpkhMAJshv1oBv434edOxyeFeTX3C/f0/XGzfrkfzfMGV8HdBkgb59Xk+U6nz
	 /i4QmmuhrGbIEzXV2yDXRh3JtmpCNeMvcObhBuMQDlAanJlIR7GT7Bp6OjYykedUTJ65Y
	 9uTVqB9H461SRjgSbvE9CDxEKu7MIDnLSZilFlmXAbSU9SKbKhEcRDzpjv3KhQfMQKn32
	 ZdZ6ewOiZr4XmxWOwgFM2zhq93sXhxk/hhNE0Jj0yjr33T8DBWengP5KBcVc3xvmMbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JIUh1BH1B51WC0XFy0inaT2JZNS5gWn62vup4CtoZjI=;
	b=MabTxDJO84Zr9sr0Qvix1+c+yMikSMn6Y3PKKqEJrBTZ9PlV21ZZ8I1seqx2Pz5Qp5UF
	 uqeVd8fEjnFA2Ne2WqO0Akd9E+hAbCg+43AddmUex07chk5nbCfnBafLfywy8em9kBVyn
	 5eEPU2K2UvIA4jqJEtuCvO6cpi+hRrgm3UZjkd+twLbsWfhwtXz6oiDlDeDE5DTtgE1wj
	 WoF5/DQ4HTtqrpV9md6MlrPCYDcpm19ToDaAe4RrpFiDt9ScAvFShglgPHEBgJIFIbRs7
	 wDV9ZVAxaAvPGaztEnB4WzEbAjlEKS823JqtV8WEMlGBu0DK/YHR0K99X9rb1pDCnjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z+3dAuu1;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44083606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44083606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z+3dAuu1
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so18604545e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324792; x=1794929592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIUh1BH1B51WC0XFy0inaT2JZNS5gWn62vup4CtoZjI=;
        b=Z+3dAuu1bdgUSLt8clijygrF7g5+jHw2DPO4gJoVp856dpm3K6SXgQBAo6AcaXabwD
         69BB+iidyNZqI88ckOhLWw3l+z3Tb54xhznEb014O0zEWFNW6Stm1ofg6xNb1PtJkETc
         e2P9bEiCilnNiXNXxkz1OMs9rXtE8qSjPTM8pMWlz8u6KrG7ScNRBhz0mB23iuK26e9n
         fi8LFcQBuahrnc1aWkJ18t91nvtvo+PRmrJ+GKbcxMFSvIfPfKDFW/ckYE/UQ32nzAQE
         fCkT8DlNBldfmMnU/E3eKPNW5IdRNYdv9JTMjPRlrIIMzabwlry9pXzpkmIdLLhkFWpA
         WTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324792; x=1794929592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIUh1BH1B51WC0XFy0inaT2JZNS5gWn62vup4CtoZjI=;
        b=VXk+TIwt/YpjssP7y7FWVSKq/JX8nlA8AGPygrgBdtfyWdJxa6LDSgU52MHVN9LhJG
         +2C+qLLiY31lTCPUnkkHfG10bHnkUWT0WH0gt4BFkG0hRB8Tk/3Ys/EvzK4QjK1ws0et
         NdAFh8Nr/eqh25DpZI4TVi9mrQWbQEosf7z4QxFrZxeQkHjPNBRnYbAJYK0rm2qGJpkQ
         i+y/CNSgn8doDGL/3YJu1euiHNAw3kdNIjoeoJc6iPInTMaYKtOaOjEyluGQUmvug8rz
         Pvw7gumfE7OA3SQzsvccveHUv6xKcWykZLozdIOo48qL8vex+Qd+GM4f4/WYQvmmHqbg
         1wFQ==
X-Forwarded-Encrypted: i=1; AL+hErGZZqPTn6BG43ZG4cniDDeBHyc6zyD38DK65FLTZBUcd2SRfuCWoLnow4Q6z6VYEpFdAZSaDYeZRbtVkUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/Y2RFVKW6DsryoO33b77yBld0HpAnUNjn2/VGCEWI3ywfMmHb
	Bi7zqIc/0xmKegSY8hs+oip1JM7ual9pg/NLhYwt9wnn4kFpn2yCbrKVsj0mNeyT3p4=
X-Gm-Gg: AYBFou109/cJiiJFejXR3u4Ew083cM6/7bYq/bWS7OPmzS64ToB/2ItabNMXuiUUwrb
	dIUz7q1RM+wWEFbP6a2ElyXo98051a1uz66X9NWJjhX0CjEmBI8Ei9fS04EJX70K8dRZ451Hq0X
	WW5MdH+oPlgWaByzhp0YIawNNIQgsVi0cSTlf8/bcMC6bFD1Trcl5pf/RLlxiIx/XevuReogh9A
	m/mb2ud2sZHEOBKaHZ8UTM+QJn9i6VY+mOA/XqzxLlfV8lLPAqBrqDqyUHeN3EDY6/JSR++p8jS
	bN2KApnb/uInBW14C2av1xoSOr7JSPLKLJgFxpVm0oktLro1HSyUwkpY6oT0qgpAhAwp1d+Teje
	J7gmF77pnhLowiWkDJTEBkAVt1oK3lxYF+wz98ewE/WqXR3IFh4edmybL/2Lx0xfmTJoF+Y07jD
	qpxjatWfO7wpBNxvM5q1VATX3DfHjREybcmjknSYoAY5SSeHnAs6YKeiAlrPRFDJ6EGRtDlrG0B
	vUz73FjIyNCjQnmE06RhphHbZDe0AyoTevl1TKcduk/Q83UQz624ubzfaLXsC22LNTXrQ4azKR/
	HkZVp7cMlGL0e0vKBz1l9OxnxJUKB7WnIQ==
X-Received: by 2002:a05:600c:3143:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4ba02355f49mr48187005e9.33.1794324791389;
        Tue, 10 Nov 2026 07:33:11 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02387ed4sm47355825e9.4.2026.11.10.07.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:33:10 -0800 (PST)
Message-ID: <144477e4-e0f9-4c9c-94de-136c459e99a0@linaro.org>
Date: Tue, 10 Nov 2026 15:33:09 +0000
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
Subject: Re: [PATCH v2 14/23] coresight: trbe: Treat access not allowed stops
 as fatal
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-14-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-14-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> Arm ARM (ARM DDI 0487 M.b), the rule R_RRCNN in "D6.11 UNPREDICTABLE
> behavior" permits a buffer management event when the effective SCR_EL3
> security state does not match the owning Security state. This can stop
> collection with IRQ=1, S=1, EC=0 and BSC=0 while leaving the other
> status fields unchanged.
> 
> With EA and WRAP clear, trbe_get_fault_act() currently returns SPURIOUS
> for this status. The spurious handler re-enables TRBE without clearing
> S, so collection can remain stopped. A retained WRAP indication can
> instead cause the status to be treated as a normal buffer wrap.
> 
> Recognize this architecturally permitted stopped status as an access
> not allowed error and return FATAL so the fatal handling reports
> truncated trace. Check the syndrome before WRAP and do not exclude
> TRG, since both fields are left unchanged by this stop. Check the saved
> IRQ bit to preserve updates without a pending interrupt.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 4aeed1a17c4bf1653fb41731ac15f31feec7ed2e..1c585b6123df2f20d08747678d836742ce9564cc 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -708,6 +708,14 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   		goto out_fatal;
>   	}
>   
> +	/* An access not allowed stop can leave WRAP and TRG unchanged. */
> +	if (is_trbe_irq(trbsr) && !is_trbe_running(trbsr) &&
> +	    ec == TRBSR_EL1_EC_OTHER &&
> +	    bsc == TRBSR_EL1_BSC_NOT_STOPPED) {
> +		err_str = "Trace buffer access not allowed";
> +		goto out_fatal;
> +	}
> +
>   	if (is_trbe_wrap(trbsr))
>   		return TRBE_FAULT_ACT_WRAP;
>   
> 
Reviewed-by: James Clark <james.clark@linaro.org>
