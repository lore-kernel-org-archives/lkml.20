Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008047;
	b=aGJIvgBtl61pIce+qnvbq5FjQK+KE7l8hYoMuvFrYzC11VyEMghK6yNjey+SD/w8Mtsq
	 aOeYA8/i+XbKczLueddDcOnmjAxarfy9xEQBawysEJWeVYtHUo4nmIXrOw15ErTbxd/Xj
	 0M1xLJZGWgt/jnw8ySGVrQc7YtGh5CwlDIx0bGve1Ssyx/DYnIr5UmLcIao35Ty0UeV85
	 f3/DA9jGIrBx+vuAyKxUIoBlYT6cAXEjgBkT74UZuCzgKJ0DjQjlE2tvGWG3KOuD0jYQt
	 fw6wHXYRrV8/yGYCi1x1hVOtlQ+O+iYN5mRtSrrmX5FxFshLfLJaxp8Z9JPnfJGP2vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hzbelKKDEnxgjYmpghnUkffEydiu9Idn1aqDCjEpGss=;
	b=jtjVsp9r1CdFh3cLpQ+LSLf+JIgB2ATo6swhmvshaW141W+p6lf0nThv4UFsWZIMD7tx
	 mZbSAauo5qghmwGHvVPfdn10vqeCg+iPO1KirB8PIV0WqtD5SZiuWIlAnj6XU+VIrivS5
	 LiHxZpo4p8xKmmkE2dHMLJp+yeJg2SjYQXiUd6vpJHuY1EHIiO6/9xsRa/+zWnZ2eFDO5
	 CKZMVBUbqblnvL/WrlaMAlN4ByDGh/lcOzLJOJJFUvmgY7fv6cABikeFCT2vFmAVjIrKp
	 +8sO7iKxe+XdHM42kRK7xmJFqLoDICde669R1rJcWYOnHnxpMBcM0vMN1osJnQ3rVOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M992lOYS;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8B2606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C8B2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M992lOYS
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso28223755e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793008045; x=1793612845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzbelKKDEnxgjYmpghnUkffEydiu9Idn1aqDCjEpGss=;
        b=M992lOYSaABSOVMKdr2ZnYdUWuP6nHzizODH7Ue7QDD1DtjeUwM1r+OfJX8hMDnvPI
         vHAhCvo1kkduLiqPajhyaFKGrQ/6onGWw1ZY7PI8Nn7YWq2lf4qY/QN3ih3l9fS88ANf
         bINCev0L4VqNNRSny/Sw46vO6TXRaXufHzU9iYG5ggC9xmQj56mO8h32pjwqiLtojCDG
         V+MfRt7yI9Dk1RsKdlXf+5toDiuoGmoNrCzffXvCVYqyKZiqDrRbrUQt5wIb715jBR/Z
         6GihGXNfDvxRd0Yf2rTzTJR6LZSrBeiMViiepFVglMEnEyt2fPqwRVwawEgL9sNN9jhf
         m8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008045; x=1793612845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzbelKKDEnxgjYmpghnUkffEydiu9Idn1aqDCjEpGss=;
        b=DeyqwB31gfAEyhiqauSExr7fF6nrlWc6yfD12OHstitlmnsp/tqYUmhP1/U9uLsIRI
         SKgzl8aOrHt+yrikDwiEmSrFrLEg0uoDNJtlCWBSEAfg4M/vnw/5RzQ+RsTRV2Z/ytcu
         f0al5D5ABYNe8HIvk6SyYxvxP6T9d7sHsuH+l+6VRuO5xHd6ZPWySVxDHX5COyhy6z9A
         UxwlWrgR7xxO3XTwQUTZEfp/H68drGGTzJjg6xYeQpOwQTdyH2aFcRiAz3MmKo8pLQ6q
         YQvpKV/ysYMJjy07iKCkHrR/PbWmLfQWAIvI9AKElvpXzuds7Pv8QnYxwdUhLgICd+RC
         C4kA==
X-Forwarded-Encrypted: i=1; AKwUvBwkPJwk6MWc/ryaTT6RrSGxRGKcpH2ugO0MiO6kHJ9zHsCAM3eA4xJLzQJZHAv1/uk2QhNsqGVtyLLXFmU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZxkGOPhFcI42VWg/F4QRfiInDXDhYrvbA3s/JS7oNlJvnDytC
	RTJQ/hVxN1Fp14b7OrbDH1NHtseYSgtiiRnnOQRDXVldgN5/EWBxSmsNLkNDC+3Tqsc=
X-Gm-Gg: AYBFou3KeDgkSmsYCoQJcqpxzFiJRMl9XYvxp47BBr1JJG1oRDFbi2ms+ruvQRUgpqX
	U73efMcoIUkM9hapI0WHzF0FCQaHP/wIdkdrD4R+wC/GkFrHKeFq4UgnSZs7NE+etJPCI2Mdu7P
	Q7U3WW/FAwISKTqxe9coVLls3uN/bDeL6wqhh11zpJY0RHqDFvh9O7CrkRbjjirVoTT1PBXOHcS
	JPKZQeT8jdzlxiwhyrOO6fN9hc97S9wjpsUkMjHztS0zxTcXVv15dYEWgy4f08/oLCDgDqZ/waD
	/h6APTlEI7U1dvADxMXMHQ5D9nvil3qoNSN7jO/dMgq+BF+EF8CxNnuFOdjqybGEfxkwu9HGtqj
	JlYJ54ZhVGKAj2Y+gdKYKl+PWVblihF9I6gnpS1A/AOkQTZg/7n5mOuMM7hOrfVvkjJOBPCgrpP
	liny98DhiWhHOrL2zUTfuo0eiFHyPv3B2hzYNH8TZYNDJk7YoM2RaDMKIF1NG7TikxIzY9ljiW4
	ZhjC/74pbmuUXFCF27p8EeonFIoDV+69YIk1H+kXhIksn1pr0TxiQY3095B
X-Received: by 2002:a05:600c:3114:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4a35acc772dmr113068865e9.19.1793008045005;
        Mon, 26 Oct 2026 02:47:25 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb40733sm12061897f8f.0.2026.10.26.02.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:47:24 -0700 (PDT)
Message-ID: <f5060f7e-71cb-4e9b-a757-51943070b083@linaro.org>
Date: Mon, 26 Oct 2026 09:47:23 +0000
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
Subject: Re: [PATCH v4 5/7] perf: arm_pmuv3: Add pmuv3_event_implemented()
To: Amir Ayupov <aaupov@fb.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <23ffe461b8d7b04f78118154dfc9ea1d2a14978a.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <23ffe461b8d7b04f78118154dfc9ea1d2a14978a.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/10/2026 05:48, Amir Ayupov wrote:
> Drivers outside the PMU driver may need to know whether the local CPU's
> PMU implements a common event before relying on it, for example a trace
> unit driver checking that the PMU counts its external outputs as
> TRCEXTOUTn.
> 
> Add pmuv3_event_implemented() to the arm64 asm/arm_pmuv3.h, next to
> read_pmceid0() and read_pmceid1(). It reads PMCEID0/1 on the calling CPU:
> events 0x0000-0x003f are reported in bits [31:0], and the common events
> from ARMV8_PMUV3_EXT_COMMON_EVENT_BASE in bits [63:32] from PMUv3p1. Move
> ARMV8_PMUV3_EXT_COMMON_EVENT_BASE next to the event numbers in
> linux/perf/arm_pmuv3.h so it is available without CONFIG_ARM_PMU.
> 
> Suggested-by: James Clark <james.clark@linaro.org>
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   arch/arm64/include/asm/arm_pmuv3.h | 19 +++++++++++++++++++
>   include/linux/perf/arm_pmu.h       |  1 -
>   include/linux/perf/arm_pmuv3.h     |  3 +++
>   3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
> index 8a777dec8d88a..acd62c4f16743 100644
> --- a/arch/arm64/include/asm/arm_pmuv3.h
> +++ b/arch/arm64/include/asm/arm_pmuv3.h
> @@ -173,6 +173,25 @@ static inline bool pmuv3_implemented(int pmuver)
>   		 pmuver == ID_AA64DFR0_EL1_PMUVer_NI);
>   }
>   
> +/*
> + * Whether this CPU's PMU implements a common event, as reported by
> + * PMCEID{0,1}: events 0x0000-0x003f in bits [31:0], and from PMUv3p1 events
> + * 0x4000-0x403f in bits [63:32], which read as zero before PMUv3p1.
> + * Must run on the CPU whose PMU is queried.
> + */
> +static inline bool pmuv3_event_implemented(u16 event)
> +{
> +	bool ext = event >= ARMV8_PMUV3_EXT_COMMON_EVENT_BASE;
> +	u16 id = ext ? event - ARMV8_PMUV3_EXT_COMMON_EVENT_BASE : event;
> +	u64 pmceid;
> +
> +	if (id >= 64 || !pmuv3_implemented(read_pmuver()))
> +		return false;
> +
> +	pmceid = id < 32 ? read_pmceid0() : read_pmceid1();
> +	return pmceid & BIT_ULL(id % 32 + (ext ? 32 : 0));
> +}
> +
>   static inline bool is_pmuv3p4(int pmuver)
>   {
>   	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P4;
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index 02d2c7f45b527..792283d29d7b5 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -124,7 +124,6 @@ struct arm_pmu {
>   	u64		reg_brbidr;
>   #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
>   	DECLARE_BITMAP(pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
> -#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE	0x4000
>   	DECLARE_BITMAP(pmceid_ext_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
>   
>   	/* Only to be used by ACPI probing code */
> diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
> index d698efba28a27..c21f185a283d6 100644
> --- a/include/linux/perf/arm_pmuv3.h
> +++ b/include/linux/perf/arm_pmuv3.h
> @@ -78,6 +78,9 @@
>   #define ARMV8_PMUV3_PERFCTR_STALL_SLOT_FRONTEND			0x003E
>   #define ARMV8_PMUV3_PERFCTR_STALL_SLOT				0x003F
>   
> +/* Base of the common events reported in PMCEID{0,1}[63:32] from PMUv3p1 */
> +#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE			0x4000
> +
>   /* Statistical profiling extension microarchitectural events */
>   #define ARMV8_SPE_PERFCTR_SAMPLE_POP				0x4000
>   #define ARMV8_SPE_PERFCTR_SAMPLE_FEED				0x4001

Reviewed-by: James Clark <james.clark@linaro.org>

