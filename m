Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324506;
	b=hs8DeKVciO92e55jV0dDG2QjDYDgonM5uxzBohpXY2zolEgICvec5hnMnrUdyGUMTiuT
	 +cT3ZmfmuG0GyWp+5/jkrgJVHfy3xm9GT7yLRZNk7lRBUrKZO6q96J8QF5y6ePjHP/VId
	 7MTNpXcHQtErsjJ42Gw2W1w4WsGbDOSfIdbcS+wB16njm+QFDthBM5uixxqZpr04YI6qN
	 M2j8mHWw2ga645QUySirlGC52+mzK4XqptvlYIgO74fhUKgc83F9Am+GErzmHir07Ncj7
	 tRJXEukzFwYaSMzbCA9jfEm4LR+zhdakKKAE7Lerk6u/PeyzbfWlIYO+TYahSbkh2IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sRyt7J57B8/qpsnQyP3hNPb+3Du63I5pPZg0XUFrV5o=;
	b=UuAoT4judty/LTakEZesDMQJGcGVU2KmRTiaqjstcfY1zwi5oJu3fv2Q3picZondT/9v
	 XBWXgtM5vc1/10hVNc6V/9KENKbeE1QXHhwZBfpaBTn25tL5MA8Qbb0GteQHH2CnoGB9q
	 ISO7wPcMH4X/CeYfKskDu9NBFBX8a738QYn9l198+VSIwksrn5K0i5jwhvJ8HMZFz7jL+
	 CCaBEhUubZU0IKH59xdrSsbO9WfgXJRzovkiv65oiAoOWu3DPgjFUsAv1qgJb6FLxc/rf
	 M7vE+5zK+IpEVoekaVyp31rurh2nmXXyi0ObPimM4FUh8WRScNVXh0PNYz0lg7ggWiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HtReASzd;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56FB606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56FB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HtReASzd
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so492745f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324504; x=1794929304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sRyt7J57B8/qpsnQyP3hNPb+3Du63I5pPZg0XUFrV5o=;
        b=HtReASzdYCgpeAnWxqoYdsHPCk/Yrl8OshA4V5JpxnqDkaqbcX6jexCEqEFt7YheK6
         YBGQg96tX1WCen0FtbW5j/nIqqx6jY0SUmw/pGrYvNvsx16T5F71q9LoF+cHy8Lb0pPC
         qEVSCQh4gV3F8VtpRR7YfWzNG+mmZ2KZJjySAchk45rTt6hdqi+50PZj1sd2TYmS2tcc
         GaALURFIY8c/6X2gBtyFpJ1a3hz3Be+mFDhcIj3zo1tA+pEttWU7hBP8DixWhLJVCBdX
         pjUQZOmxLcA2Ggnc1MtsTfTh3dJnPM7WU6ZeB8pqe5uhioDTkEWLsnODYmDSI5RUZhgU
         5LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324504; x=1794929304;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRyt7J57B8/qpsnQyP3hNPb+3Du63I5pPZg0XUFrV5o=;
        b=tE5W4/+rJqJDQjxaoUbbUKTJP3xWUbb8VWB7k2X832QP0EUcOQrKcdcc/jpwMhZwnH
         m9hE506mTBBGZpxscuzTWuCVyl8rCo6oZTFockbzm64PSWkzahR99ztmqSjYQ5eW7F72
         S39s9pRnUTcrjzHZLnewQUZtXA0DCK2yaeTd0erARX/1dlQI2jzx6IR8BIkdq9rQY42z
         wS7j7dIiH3s6aFKEVn80C4JjORRZUKxW4DYCyqZdhFcoyEHp+1a3RhYGRGI0UossOi7I
         Sel6+f8LpxORcg1bj/duD21+IuzwDQ2nxFORjFvlC+WulU5GL1bFKYaKx0qW7dfeUQ9l
         GRRg==
X-Forwarded-Encrypted: i=1; AL+hErHPPORhumq9ZjfUVSYcu7QsImFh19ZX5tROoaY0Ta1IM0UdRm1udL62unVY5JBbQdAl2Xlwv951GBgg80s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tOEDK0cZVG8uO/NnnOx28RVnvK8UbNKNdsUamLrSapIAwM/RS
	h/4TUATn0KpcWdX9dcNLR+cEbzM4gYHNm3n8AlFfAT9waX0yPCc1pbZ0JJ+8o73RfTg=
X-Gm-Gg: AYBFou3oeCHA5FzBOLdi8s8vjtTabcLJKTpHBwWWjuFZm4dZOcSsFlb+bUVEl1yaODu
	Abe+Js/pF1/ytB5PN9HgLrBZvME10zeACsE6UQ8q1iyB0S8Oft2wwFBYz9d6TuuF6pfcKaOuQqk
	3Apkf7VKhsN9BLUYyA6CBFevWop52H0ZMkpR4BhjPsLlSVnkoLPqn4+zgaj+gBoDMKWEcrCwSs/
	Djl70+8q/pDFIxIyHJK73dgb8szciDd7Jj2GtrYyyN9qMXSqlaq6zNnEEfklYVox2ocavE8xzDu
	15VAbPi8ZJo4FP4D9JgL9yvCdzDFgvmIr89oTFkE3J/2S/ng46CZlrM8kNUhpxc1jXahMsIQSzQ
	ZAAMJxAsjL/LxhTLBMzlmOgS7cM3zIGGHJpXRTqN75fvfAEGxF/b/U60bu6fPjT8e35sj51iyge
	E6GY9bdJJDBAhOFWZaG2LmkSvKPahvSRXNoeIjWRJkkN+kInYqDTbu446eqxd8EZrdhEhsFwvVc
	BC+HM11Ax01+xfcWHjg99Nyb2dDGVYCsFLthAEAKmpj/S1dvG76UakLjjskNOarwAtEom4dwi4C
	xR4wGhJw0OafI5ATxoNrow0W7pF1kX/jSQ==
X-Received: by 2002:adf:e001:0:20b0:48b:1296:52ec with SMTP id ffacd0b85a97d-4982ecf642cmr4316594f8f.18.1794324504256;
        Tue, 10 Nov 2026 07:28:24 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm5786450f8f.22.2026.11.10.07.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:28:23 -0800 (PST)
Message-ID: <4371d707-dbe3-4ea4-be1d-c69c38b4012e@linaro.org>
Date: Tue, 10 Nov 2026 15:28:22 +0000
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
Subject: Re: [PATCH v2 01/23] arm64/sysreg: Define TRBSR_EL1.EC event classes
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-1-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:54, Leo Yan wrote:
> TRBSR_EL1.EC identifies the cause of a trace buffer management event,
> but the sysreg description does not name its architected values. Define
> the five encodings as an unsigned enum so TRBE status handling can
> refer to each cause by name.
> 
> The values cover other events, Granule Protection Check faults,
> implementation-defined events, and stage 1 and stage 2 Data Aborts on
> writes to the trace buffer, as specified by Arm ARM (ARM DDI 0487 M.c).
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   arch/arm64/tools/sysreg | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 94bf065c8ac71f20f482c91a5147cb6e001dfba2..f68c23dd4e83ee4d00610e097d9188d3a2c9ed15 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -5834,7 +5834,13 @@ EndSysreg
>   Sysreg	TRBSR_EL1	3	0	9	11	3
>   Res0	63:56
>   Field	55:32	MSS2
> -Field	31:26	EC
> +UnsignedEnum	31:26	EC
> +	0b000000	OTHER
> +	0b011110	FAULT_GPC
> +	0b011111	IMP_DEF
> +	0b100100	FAULT_WRITE_S1
> +	0b100101	FAULT_WRITE_S2
> +EndEnum
>   Res0	25:24
>   Field	23	DAT
>   Field	22	IRQ
> 
Reviewed-by: James Clark <james.clark@linaro.org>

