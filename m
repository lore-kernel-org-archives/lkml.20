Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BBE3CC7CE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791520389; cv=none; b=BKti+vDTHd4gqSdlp7IKGsyYOCYzuoK3XZ4NBQe/n4NjUldBJ10MIGF0b9s6XfHisSjeY48B6FyB3ofIC5AE9671X3fhkWeR6LlK+QLxT4nLj3BjYqn9/aDVlwFMrBtqFUdls8M2q3JQYA6G6KrqaPKjvGN29cyIQTqAfEreJPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791520389; c=relaxed/simple;
	bh=BRksUHupWTwAHQEfDLT4q+pk1XcrAhHwf/e+BYIOG/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWa3477ea77QJbIK/WAdAIEyI4dLIIJdl5BcV7ZW1Z9fFQfTVN34ZcMlDZsZlY1OVQW7aHo1fKEZcb0VN8s1TbmRu+K4HOvYLVUKoVfU9IV56YucAe7RQIVtmST+uHHawgFJFlBNeoQKutL5qf4ex1NJbH//QFJDUzFKcPxrZ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uWe0Q2tb; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uWe0Q2tb"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-351775aa1c0so2253587eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791520384; x=1792125184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Er36W4Z+TzVAMFUZ5NmRw1HzZaggY++xCA8t6qC7IVU=;
        b=uWe0Q2tbYCE83zlGEdbLVOlxhp7phrXOMROncsEM1u1yUjEcWHX/48j1Px7vOH+aeE
         FBTumHNikDFm9lJbKZaCzEckLuvwdJJAY+obzNKOrmMZQnKFm+kRoBGE7l9xLjcsXt0v
         SrDCucnZEnNA6elUuSf1IasLvGAhk4rC5yvnwMcQ27zwYCZBCkW/t/VJPlzV5PaSBoiu
         qb2ZkE9HMxJYQ1FjzSllXJZXUKvYKly9BiNcbWDy6A3BaIvbrKlla6pRx8X7uzL4f6Pl
         a4zYPCaHuu9ddVlarqCj0YSk8jFEW4osXQT6d0fImqHQReLWyJCq2Bd+6Icy9k2+g1Wh
         zoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791520384; x=1792125184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Er36W4Z+TzVAMFUZ5NmRw1HzZaggY++xCA8t6qC7IVU=;
        b=NG5ALBuHMDyuanwKbqSZGSIodt2+jNL0+0Frz8X+3pKnFzV3mSGOzQs6KAhqcZZ9P3
         vppwgI673fAm5fkxxw0lvNYsxB827GjL82Ij7qgzUJbUXIMAIvONVMc7w2C75O0+OW0q
         Qqi6egwH7XAsafwdu0oO6dumBxbgRZtEDSg6b7CF7lr9SqmxOGuDiuwvvhckTExuBBOT
         omj3h0DFFBW70LtXeiOeDpKLZTWOaRZRqjNUrGkIgpIq/Ws9UhISCo53aTcLNJcBNbK7
         yGBvowZ/njraIokzVqxPs2BiSN8RSjz2fbFEpm+BNTB8afmfog96246bkBl7LO/kXvXX
         ZfUA==
X-Forwarded-Encrypted: i=1; AKwUvBwrxdiZ6i2yoh6yP35YmdyC4gdukf2m47I015RkRoaEOA5fZStJm8MwWNv6nF7Hp+AIbt2axrdwFQsGOGU=@vger.kernel.org
X-Gm-Message-State: AFuF++kBHVFZrXFtvJKyyhM+8VgH8y9uEcuiHUfYayzmKt9H6fu+UElC
	14FphzFZA0HL0Zpo/INzwCPl1Zh8yHKiW7qOUg1bsK6qhYbtqVFQdh1riQaHUrFg6ro=
X-Gm-Gg: AYBFou3xs0zUFVbTlsaJyQc5eMHmyza8YYBSAYOZ/2wT49xuanhqve8mrx5PRMn87AH
	YGiOoV6bpKCoNQoB8t6iZv66YWmY8bx9JqkFu3HFk4UfTLhGN4Zfia2K9NLfufQa3Obf/IDErTS
	Aj+RnLyCjm1LJC30/6lkZhSSVm+Y7NZBvXcdBUBJF9x42KmyKsJBGZorNKLXjopXp8dnmePgSzk
	ZvsxwEEwyDIuDb64g8fIKLvQXecwNFni+vbqpFVAZ/9vggXsMyGHtD4U677/+gA467VyTzwPCzs
	XzjpfvG5arxAjHq3xTGIuUdqW1uSjSiDex0yjuRAsG7b+0BqsMsbdfDDeIIfo5ONJUOfdZq3Ads
	NWKt9hqr/3ewfJ+yNX/fuV+6GSVy10JlC0UNtbjTlSWcXJnUQ0fDRReLERDNQAp3YL3jGdV37Vd
	xZLntdGJU4ry77U3tENZ36z80yubC4kTQUIWNbKwEcKT1Ezj9F2Lo7DqTBaSoVFggvMSBf9M0Yk
	Q==
X-Received: by 2002:a05:701b:205b:10b0:148:722b:7cbc with SMTP id a92af1059eb24-16a5dbfe430mr919153c88.14.1791520383310;
        Thu, 08 Oct 2026 21:33:03 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm3128557eec.10.2026.10.08.21.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:33:02 -0700 (PDT)
Date: Fri, 9 Oct 2026 10:02:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-cpufreq-hw: fix device node refcount leak
 in phandle parsing
Message-ID: <ashueyfHcwGHziVG@vireshk-B250M-D3H>
References: <20261008172442.2725544-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008172442.2725544-1-vulab@iscas.ac.cn>

On 09-10-26, 01:24, Haotian Zhang wrote:
> of_parse_phandle_with_args() transfers a reference to the provider node
> in out_args->np, which the caller is responsible for releasing with
> of_node_put().  Neither qcom_get_related_cpus() nor
> qcom_cpufreq_hw_cpu_init() ever puts args.np: they only put cpu_np, which
> is a different node obtained from of_cpu_device_node_get().  The
> reference is therefore leaked on every successful call, and
> qcom_get_related_cpus() leaks one per present CPU.
> 
> Release args.np after the parsed index has been read in both call sites.
> 
> Fixes: 2849dd8bc72b ("cpufreq: qcom-hw: Add support for QCOM cpufreq HW driver")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 874ff3fb9d97..060a460716f7 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -322,6 +322,8 @@ static void qcom_get_related_cpus(int index, struct cpumask *m)
>  
>  		if (index == args.args[0])
>  			cpumask_set_cpu(cpu, m);
> +
> +		of_node_put(args.np);
>  	}
>  }
>  
> @@ -554,6 +556,7 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>  		return ret;
>  
>  	index = args.args[0];
> +	of_node_put(args.np);
>  	data = &qcom_cpufreq.data[index];
>  
>  	/* HW should be in enabled state to proceed */

Applied. Thanks.

-- 
viresh
