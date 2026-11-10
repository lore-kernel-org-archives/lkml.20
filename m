Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324616;
	b=DxXdSKXPfd1StRHqxN7yLdz0SV5rOCTgErZ3j++Kz2ELCKW2dDWgH5Cu+KTnTElg4Ppq
	 F2Ag+duPh4eDsfSU3LAxapOZa5NsC6w5iHbrTRfJ80D1W56dOXbD41lT6+eSD8GrIfFyJ
	 lKoqlFoYZSMHlQM3XCAzUVZnXoeNvdmOEmmcM0spnk4T2V+U2Cg2171voJz7pIe4J8e/g
	 63kNjnjVRnLE+ntBlTiB33UE9Bo6CaTd3lG5tiMooMD4H5ifk+D9vGXedYQMjbP3vzrzm
	 YwlGq1ZPR5Yr6xWWE3nN57CX9Fc5/rZ9EXqZU+uzHIfD68ptzDZYcCEQOI246aFL3ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wq5O9BiV0n5bNBLkemqzNPDQfweJ57nH87DQfwTWK4Y=;
	b=qVjZmm1utzMg4bKffwts8F9nC1nMgkDQUAqcIkmWge5yIQI2GWZkV/UMLzyIqZ3Lkd4k
	 aB8gWB0B/m/lG5FneZEPkO7v93gsfclBimmwPro6H91ay0oVPtmgdtLnBF05BxsMcr108
	 EVX2KCHflX964lyyNPq7lhQnrCzrddDynzmGCs23Hpir2jPcWJFV4cGyqjvYDJAdMAmJe
	 b7aTOAT8uwo0HjdxgOnMlCROAjgxtl1FCu6H8l1IGX3PLoNhQy51MG8f2pR9ct7Dm6HTu
	 6CCJByx5D7XvdsQ9bw4VF8JJqMt6vi0Yoo39SFzz5qcf7RLqVK4S7jmhU86M05k1D7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aM3JZhAM;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A0A606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16A0A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aM3JZhAM
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so10297475e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324614; x=1794929414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wq5O9BiV0n5bNBLkemqzNPDQfweJ57nH87DQfwTWK4Y=;
        b=aM3JZhAMYIvZ1AdwdHTFAePAe/9KTwEkikYASmuOX7WNaMwNhEWx0JIzUltg6WVAlV
         5KiZzl+buTD4hjDpGgLyX0jx7ImKja6Xvh26khWWRmMnCi7z4Vf7SefogBhTxWnhGeDh
         I/gNSJSz88/yyuh/eYp245zhT7ouV/0JRjYKH3t4RTVMqH0GKFWGZY3HKlVSzRDuPFZV
         O38RYqKJ44LpNG3W3cF2G+/Yt3l3H8VFfoVmnMyUatDPmLIJtIXISYdwQRgyJfa+pjfa
         hWWdQDsTbf6wCILTftthdgKAYj2yWpHwU7fIWe86haqJWd1PFGHPEov3t72DLKW5lD0U
         Qb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324614; x=1794929414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wq5O9BiV0n5bNBLkemqzNPDQfweJ57nH87DQfwTWK4Y=;
        b=zv7MHZoP3SLeyE8/muSI+z9UXqL38FdHCsUw3NtkSKriZrcKPTwEi/sE/ruHewDzgu
         YIp9zyxFCXE/02BtveDh+YFDhtNvTgENI2IqTCcMJh3iK28ORbTF4JHIiKWFAiCTA5Kf
         zNApGxHsBgUXPF9rqGHpPaHEokjKMR6xUP1Y56JFx0EDcgMvCPWtcCSkg3+iS1btQSyx
         7hEii32R7alsgBfkdqdcGOj9xKKFXmhtSs3UzJj5464DDKtckxGCGpcEmVERcYN6q9fW
         lFMkeV8x5Ua/rOv+9z8l1zorY6g754XLAv0gX5P8Vko+qV89CsqtnL3ZSTyXJy4jpyh0
         EJDA==
X-Forwarded-Encrypted: i=1; AL+hErGgCnG3zl+VqaZBfNEKEW+Kef9pjAGpVighH41Br/vzBuiac+VXHf4b8P4Q2z9rqRRvwoPmpv5zdfrmV2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lnGZlLnla45piNgY3NAGpC8KKDEDpbYqQ8ALB2tzlfOHAhgb5
	vPa3G38mJjOV+sffEwBOrPowjsVfLyr3RJVEUn1NuVmwxepsjO4Ihs3UAKPlm/N2jyk=
X-Gm-Gg: AYBFou1nVvyWROWAZdmureQ+yUnbS56NJdHvXIhoeQLpoA+3kjY5kmgcdF3XZb7pPJm
	5z8H/+KdhgG96JrF59tWJF3nL4nBtunEAR3Vfde1L2XgT28Yy9qqD5CcapSLAiscGlpfTRCO2+J
	X5qtZHBKm8pGZlAhfwpwe0ZPd6GJz8QFzbmbowqZHLerAOpINql6vORm4MTtzkVdl0S15rqUwEA
	3Uh3WBVYKbEWkKRXAVSqhR3nuXZlC/iMtvMV4E9Mf2GpMEcVRTgqih4y7kdPSuKSbge9BlBZRLD
	hlOqW1oeEJ7BGTrs3y4Wvqlxr6vXlRAxm8wFBdWqIjPT8FW+hK9JeseJehWDu0q30dQHXyvtJ1E
	jBvkOaP9Af+d9z9O6YZp6WokcT6ebktkxoWcM107skJc/14Xil1KXMAndmchvNGCxx/vna8ybq/
	WLUFSF/Pz/pu56krTvi5oQMABdEUtK1CyMLikYgZ6E0LtvZIpyTFiBP4vZbwPqr/I5SKfq8lM/P
	8/o8XIzB72NHTz7ONj7B8MZwEGzOXZ+24PFDvnjJjOAGlFcMGaWaqOJmNLMmDx+Cjo1MM8EmXAm
	kFFNd1rk1CBhGxHSuZXSU74qAxFUEnBAtA==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4ba02341314mr63376875e9.6.1794324614190;
        Tue, 10 Nov 2026 07:30:14 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983f7801bbsm5510561f8f.5.2026.11.10.07.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:30:13 -0800 (PST)
Message-ID: <6a607357-f613-4a9e-8d38-96ff4f02eec8@linaro.org>
Date: Tue, 10 Nov 2026 15:30:12 +0000
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
Subject: Re: [PATCH v2 07/23] coresight: trbe: Publish the session after
 successful enable
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-7-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-7-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> arm_trbe_enable() records the session buffer and perf mode before
> __arm_trbe_enable() can fail. CoreSight skips the sink disable callback
> when sink enable fails, leaving that session state published even though
> tracing did not start.
> 
> Install buf->cpudata temporarily for the buffer setup helpers, then call
> __arm_trbe_enable() before assigning cpudata->buf and cpudata->mode.
> Clear the temporary buffer association if setup fails; the inner helper
> still truncates and ends the AUX transaction.
> 
> After successful enable, retain the buffer association across AUX
> transactions and clear it in arm_trbe_disable().
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 979d0fa84c1c7b448c1ce5cd7a37dff8845795ef..9dfc6bb7afb4c42dfdec643ee7e4f2f193e2b70c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -69,6 +69,7 @@ struct trbe_buf {
>   	int nr_pages;
>   	void **pages;
>   	bool snapshot;
> +	/* CPU used to configure this buffer. */
>   	struct trbe_cpudata *cpudata;
>   };
>   
> @@ -137,6 +138,7 @@ struct trbe_save_state {
>    * @trbe_align		- Software alignment used for the TRBPTR_EL1.
>    * @cpu			- CPU this TRBE belongs to.
>    * @mode		- Mode of current operation. (perf/disabled)
> + * @buf			- Buffer configuration retained for the enabled session.
>    * @drvdata		- TRBE specific drvdata
>    * @errata		- Bit map for the errata on this TRBE.
>    */
> @@ -1033,17 +1035,24 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
>   	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
>   	struct perf_output_handle *handle = path->handle;
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
> +	int ret;
>   
>   	WARN_ON(cpudata->cpu != smp_processor_id());
>   	WARN_ON(cpudata->drvdata != drvdata);
>   	if (mode != CS_MODE_PERF)
>   		return -EINVAL;
>   
> -	cpudata->buf = buf;
> -	cpudata->mode = mode;
> +	/* Buffer helpers need the CPU association while setting up tracing. */
>   	buf->cpudata = cpudata;
> +	ret = __arm_trbe_enable(buf, handle);
> +	if (ret) {
> +		buf->cpudata = NULL;
> +		return ret;
> +	}
>   
> -	return __arm_trbe_enable(buf, handle);
> +	cpudata->buf = buf;
> +	cpudata->mode = mode;
> +	return 0;
>   }
>   
>   static int arm_trbe_disable(struct coresight_device *csdev)
> 
Reviewed-by: James Clark <james.clark@linaro.org>
