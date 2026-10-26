Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013876;
	b=tkQZVWQKCZPDRVgtvEBt2liqVoJgqOj1BaPTM2CVc+Yx9zquwAMM6+85lUuiV1jgNXHf
	 aT52+4gEJfNTz3eIrxPX+jlUa/yywtxerWFuQRDatpL0XXqKoNru4gWKgrmFiUrSLcyax
	 K9YjepVjItSXvv1CX/gTO4XJopNHpyeiS+LyLteM8mbcnmdnMKSA/jnC2l5Z8vmaQo2U2
	 5O12mE/nWVEH0G9hvy8GWQYzZ4rIwm66xYESc6mkdobHvjPCndL9DUf5mSkqczM6SxfFW
	 XNSppnZ9R0N6J+FgkFvyJNGrWF5sAklVe2fZ4+8Pi5MWcM0wvARgcy6m+vaE/onAUjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5Sn82/JF9qCiuPUhtcCrLoydMjbtRtEn8mNjXD2pY5M=;
	b=ykxPtgyUKp5qXBArP+mdNB0RWTIBLbfM09xPqOlUAvWMxct4gzf8z4nZtdpP8jQf5KVf
	 uL8a+PhdsyhrJdlHQ06IHMLkm8qTe2pyN0z2z7a5mXbTYSS6KTq8q+45wwKc/cdOQsssC
	 EvTbk1LOk+qiQ1jE0DlHWhjVChTGAX9vppkJarGvEf/0lqSjg7/y1NE9C30DxNXcmC3yq
	 U49FMw4xcwtUPqm1MDrtLfif8DZYy7YFqh5vFYNKI86BBBq0pAhoIb/F/wjhjLA2txZQl
	 eYACsk//D5hKRDo/APjzJHvs6YUPVPuy8tLF22w6gATC4W6VhhGpU23308ESpzhJ+2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=AULFsMg1;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD48606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD48606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=AULFsMg1
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so23796455e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20251104.gappssmtp.com; s=20251104; t=1793013874; x=1793618674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Sn82/JF9qCiuPUhtcCrLoydMjbtRtEn8mNjXD2pY5M=;
        b=AULFsMg1kL+KJlyxsYWpnHWN9JW1JY1k1iCFOieUg2ce6BTR9Vt5G7B+yhXfhZ90w9
         2AWvyEykzFXIcJ/l458PpvIOhQeOJ1p4Nc6toKDXYxcpNFcXbWeo21APxrD7FHn1qM55
         RZFzqHzjYaXQkHfac+SBiE64YhjOcWMAs1FPfeKi8IfXHFfESBvYPoRqOJ0QXhP5bHq+
         /jsioM960P3NwKru4ohpZaUZANOAfF9u3i0nuOEKDCS+auYUpHGse57c3GeesCKA8KNR
         U6j9XgRhh/6D85ged75sBfWzEHvkbsu7F67yufH+JmF4SmPClhYemmTb1xSRC/trMYLv
         OdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013874; x=1793618674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Sn82/JF9qCiuPUhtcCrLoydMjbtRtEn8mNjXD2pY5M=;
        b=TBvcsO9tTOpvx5DLqqhmm5wrpgJHAptB7H0+foHde6xgLyKKG9xZDwtfh/Udk0EOCB
         4YFtkGY0eiaVguw7DmvBcR+fooY8sV128kEKBXX8jtGQHuSP3Kk9Mr9/er8+aZezBPd0
         T5T8iIHFoWPieSgUMEp4VhnjvVCWzm6zQ5bzLjQCLlXsSsw3RvjgcfBR3W8sREEY3C3u
         BoQiYQedPUfxmfxd/adGuEs2MxRKAipzi5LWH1t5S+d8GLVTzmB0ELPV0hddXaQZPFeL
         E1x9uDGDDdoWn0AkcFhyFs/pP4+bKJKMqfvbeKXiNkSuHMUrLoEiwXxyg2ko+1HiXf76
         vF3w==
X-Forwarded-Encrypted: i=1; AKwUvBwg1OccqY81LuqnywgMIXAGfMCjlo9s5AsvG3x87MMhH8VV9RLCE76qvdSqSFq7obc1p4Pk4QIWuLeJtuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPtAaIpBRmL7xfWSdDeEI6/qLSuPYsHqeqzBxiPx7chtQUQc5m
	fQW5rCokpxxUePA4lIUHY0fTX0YVkbq/lEandrj8cfgf0Fv5oBe2ihtj/VJ9SxTKt5I=
X-Gm-Gg: AYBFou0yIZUcvxdyPGm+wEYu519RXyKr5czjJOUPV6qFCbksJWPLvsgpY2pyDT/PrZ+
	Ngtvr4492I2q75Qis8elOKKqWMRN/dhIDpql/gusdCdU3BBmVkQVEXawjP5SbhKLdwzlUtkUwth
	qYhBVFX9DTFtvkSZj+6hYs7eqM+mR/+CH7qH2SuB/5tNmTVoQ3qHhQ9cvDQB+rDFb3YQCB3bPCQ
	DXo3XsnXoTYkL7fJ3snr7qZdnpOqesSPmBvN6tpaR6/HmOu890CgP7CvqM/wYG3AGsA3IbFIXjn
	fyixxA5x50y9E8G3btMCjsFTAUaikTOBPiZiTI2OePHDM04tpSjakpuaD3khvgQOOhyiHqH9VbU
	FCAf1a6nHkJ8Y6bAUDsVZ9IethDAsWBonbOVcxOaBo/9Jd/jnDVM03nxtBs8XECfGIMtBwL7R/f
	EUVWVps14gEOabdM6pcVyzV0EZhhb2cgygWNfMPJemckLq7144LW8FR/ZSK/9FYk0cXpcjClqXa
	tcLKg3bhHUBmevv5ELNRzABkVV9yvKIrO99rnU3GS/BATtYWKB3xKO9468v7Lhg3YUgL7SZb0cJ
	h9MQQURE0sKFExUlzMhjmv3uumPIigEPHKUkODLa
X-Received: by 2002:a05:600c:8114:b0:4a2:397:73e9 with SMTP id 5b1f17b1804b1-4a35ac9781cmr108733955e9.18.1793013873650;
        Mon, 26 Oct 2026 04:24:33 -0700 (PDT)
Received: from [192.168.0.219] (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm501359545e9.1.2026.10.26.04.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:24:32 -0700 (PDT)
Message-ID: <9054450c-f85f-402a-a2ff-fa5f314f92c5@layalina.io>
Date: Mon, 26 Oct 2026 11:24:31 +0000
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
Subject: Re: [PATCH v2] sched/uclamp: Fix race condition leading to imbalanced
 uclamp_rq
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Wei Wang <wvw@google.com>
References: <20261025162612.360033-1-qyousef@layalina.io>
 <20261026101254.GA2668200@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Qais Yousef <qyousef@layalina.io>
In-Reply-To: <20261026101254.GA2668200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 10:12, Peter Zijlstra wrote:

>> +static inline bool __uclamp_is_imbalanced(struct rq *rq, enum uclamp_id clamp_id)
>> +{
>> +	struct uclamp_bucket *bucket = rq->uclamp[clamp_id].bucket;
>> +	int bucket_id = UCLAMP_BUCKETS - 1;
>> +
>> +	/*
>> +	 * On idle all bucket.tasks must be 0, or we have hit imbalance
>> +	 * problem.
>> +	 */
>> +	for ( ; bucket_id >= 0; bucket_id--)
>> +		if (bucket[bucket_id].tasks)
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>> +static inline bool uclamp_is_imbalanced(struct rq *rq)
>> +{
>> +	enum uclamp_id clamp_id;
>> +
>> +	for_each_clamp_id(clamp_id)
>> +		if(__uclamp_is_imbalanced(rq, clamp_id))
>> +			return true;
>> +
>> +	return false;
>> +}
> 
> Anyway; I was thinking, since we have a hole in struct uclamp_rq; and
> also uclamp_flags. Can we fold uclamp_flags into the hold, and also use
> UCLAMP_FLAG_IDLE to detect if we need this bucket scan at all?

Actually maybe we can just check if the flag is not set then this means 
we have a corruption without scanning the buckets. I didn't like the 
scan, but seemed safer for a backport. Let me try that and update.

I can fold the uclamp_flags into buckets, I don't think this will grow 
and I do have a path to help us get rid off uclamp_rq (hopefully) in the 
future.

Okay to do this as a separate follow up patch? Since this will go to 
LTS, I think safer keep it minimalist and do the folding bit in a 
separate patch.
