Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608725;
	b=WZIzaa94pVtP1oVWsQv3npLf7WmFlnOwkkfVlSMx8YxJG3a4kfeTqf/MD/xqonb99wFE
	 MKg0aKr6Q+5zKClgnw3CP64PnER9GiRT1P5l/j/lNI/RVjjeqSJbbPZVyalM9FfpRG9l9
	 sdxFkbHQU1PNiiZ9Ehkal1OxbyTwo1h6QLsrZtRdc1fa/hpfeq/TCFcO1cY8QbXW0/nX0
	 W7wbNbqpOSeUqo4C9kk9T7RCXccUdXQiQFABGRw28poha/EWT4ScodXFOZGNwCpDK6dpq
	 d57GTgRaHmEkURN3c2WxfD3/6oAKCUBRzYpe6Nayt17jWk4W5Z27WU79Ky/fempgr+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ALAVVcLX8MYIjdcNV1urspiVK2AVDCX+KdL/tArgC58=;
	b=JhlBa0lFX9VvHjl+/srVVuf2TIowhuBTDE1srQrghfzYnXvzY1qKE3txreOSxR5bl+ZN
	 GPByclt9yxAeBaq7PLLq5Om1RgUmPaHp7t32edj5pu4jmyfjtqe62qerSnqd42mBKYytQ
	 2yb+CZFgLtsJ3CdmgFhoymZq03J25p0sTL1MdUnkk03+EOjCJknqQemOIQg/dayDy+fHe
	 mS4uziw7sI9/O4ucA7YGabO7lto5DoVIMhBf/VLfeFVOE435xMGgdBVlF6K5GJzlhg+t5
	 E5ZI8jwjyYNYYu6SsL1a1OBy4msf8YTpTupcobtbzWIHXIDKXq2INk1wMu+DtrcfiEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SHebu6ho;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB9C606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB9C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SHebu6ho
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3550c917fd3so3776766eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793608723; x=1794213523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ALAVVcLX8MYIjdcNV1urspiVK2AVDCX+KdL/tArgC58=;
        b=SHebu6hoU+l6S24ourZc1qdv7upLIrnVe/F/sF7kE+UblHKNd8Dm/yvtFnW1hxuHTi
         gkw12/YBHBBewxvMXAWAh5T57tcX2TfCCYzWue2IQlOPBJe0Aj7QuQHN2XE3ee6zQRN3
         nyoh52cV9jS7cPnJ/v1lhuG9mUEzcFDkAnXcvylHwFk6RdHaQZsISxX1WL3BznoFlSKg
         7uCk+RyfT7QJPp4Obj4rRpgXZBnT1AuPHcSzJQ54vhYuMbyX839IxZ3FIeHhUDzgaAgh
         aAiHgxRZNonuaeqyPKPsG+MH8rmjWm8UepvCNfch2WZMzK4OofLaDFis8D4k4cwJWvoo
         7DFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608723; x=1794213523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALAVVcLX8MYIjdcNV1urspiVK2AVDCX+KdL/tArgC58=;
        b=f/xQJlSIYLzJwmlV0Tipl2tb0p05KjiPfkOzUHPwmpbphpMT6zStfqZ0OqOwfquHcb
         Mh5HeGSIJWVlRemjBDB/Ra98TK65OMAQdau0ixwjI9P8BubQLaZ2y6hYdMIJzi+kLPTg
         8Rf0RoyxWEz82OqR8OhLqb/WHnMHbElE1Q80fvF87XLXR4HlQ3t6P19/qvOTcQIAJ9aV
         qmBFOp8P7NSv5AWpDzD0QL5hapjlVIxDtvBVwRTG6hv917x7q+sK56/Ab54aPAqvf5yp
         17d4luar5F3t38/okiupYaM6Yx7cbv50gfp4t3nWtGuKbqdEQaNJzcB6w12GAwmtFg1t
         32Fw==
X-Forwarded-Encrypted: i=1; AKwUvByj8WrGuQY84nbNtgTkSmfZfMez7D30yIlN3+EtRVwcNzVgZ6XRTdjbZ6mP0v8xuuEABfxr3j0Hw6gE+u4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h9LBWCI/pDPzKcN8x7rjSpcFb8YIgSENe8Y89e6pXGFk7r9z4
	bojL3RaeXLTFxfhH2olCquw4CKV+ZuQMqtfrBXbouKeXTmFNx8owRVjv4OJv8S0CICc=
X-Gm-Gg: AYBFou0qzQHoVbv0d25P1WeHFLnF2GqtzzYiA87X6W78Z3Nrjtp7yHisTCHu1hjwjAr
	wTxHkpNNxEV/Je5QoAcUXbpBnqqbR5+g383moZRn2F5J1Gf9/MVs91hpjb2OayyJ25FaEKYvBA1
	MpkWwpwF3fP0/S4sXo8h3JJwkwXUwfaIsHNiSYNCNmVYjoetyfeUjfCV4Wz9a247kGkpa2b1/0+
	o/do/1wd6ZNopMk8kkrIOFfphGHvJKjZ8HUE8Xxww8IeZzmYtFggGm6ega3DVXXcJiHNs1k1fsl
	rIvjgX92byl5C/QiFo3vRYGDLWDr5XOfM11oK0/7L44Yvg6SBGBlRkGZtrH+EdImH17a7hhISko
	f6KOtb5w/cnhf/XLdAdhhAPPJ+U8ULSwHCqsOi9zkIpimeobjDRfF3xEYv/OPuCCdlO9jXOghR0
	5k+vJNjZGh4X5oKkiyHxwozytgoW3R91T3nC5uTwmV7kTbuMcCoTS2YRFZKRUsGYOmh7ucTe/kg
	73vZ28RzOpfI/mwvzaaXDyKqWLRrZFZMmQ4bF1fExK18JB1znTdQoWxd6c0uADOI14GdU44piCk
	zBCEQ+2mY/TEcNGAY466AS/BEZN3trc=
X-Received: by 2002:a05:7300:e9c5:10b0:367:3d68:8480 with SMTP id 5a478bee46e88-36a4206d82emr15498311eec.0.1793608722988;
        Mon, 02 Nov 2026 00:38:42 -0800 (PST)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm37714488eec.3.2026.11.02.00.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:38:42 -0800 (PST)
Date: Mon, 2 Nov 2026 14:08:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jie Zhan <zhanjie9@hisilicon.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to
 non-boost freq on boost disable
Message-ID: <auhMD2-5FD4BqImG@vireshk-B250M-D3H>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>

Hi,

On 29-09-26, 17:08, Ananthu C V wrote:
> Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if
> max boost is known") introduced a guard for cpuinfo max updates to only
> increase, to preserve driver-set values above the freq table maximum.
> Later commit db80ad776cd2 ("cpufreq: Remove driver default policy->min/max
> init") dropped the 'policy->max = max_freq' assignment from
> cpufreq_frequency_table_cpuinfo, leaving that one-way-guard to be the only
> path for cpuinfo max and consequently policy max to be updated, causing
> both values to be stuck at boost frequency even when boost is disabled.
> 
> Unconditionally track the highest non-boost frequency (max_base_freq)
> in the freq table. If boost frequencies are available, use the highest
> frequency from the table/max_base_freq instead of cpuinfo->max_freq to
> control boost values, so the value can decrease again when boost is
> disabled.

If this is a fix, it should be submitted separately so we can get this merged
independently.

> Fixes: db80ad776cd2 ("cpufreq: Remove driver default policy->min/max init")

I am not able to understand the current problem though. I see from the sequence
of events mentioned in your cover-letter that scaling_max_freq doesn't return
back, but why ?

And does a simple revert of the above commit (just freq_table.c) fixes it ?

> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  drivers/cpufreq/cpufreq.c    | 16 +++++++++++++++-
>  drivers/cpufreq/freq_table.c |  9 ++++++++-
>  include/linux/cpufreq.h      |  3 +++
>  3 files changed, 26 insertions(+), 2 deletions(-)

-- 
viresh
