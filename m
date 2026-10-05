Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191E8443311
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192715; cv=none; b=JOqEQj85iDwaSZHOHrWkruJ+2WLEek+hEiYxt3WK1dZVDwS73ofpyJMNhKFm6vASdWMbhHtiL32vMvrQCDZ2nDC2M0h3T3Inj0QVQr8DlNOtDFx0vUQJY2na/wSWYM3jr2VQDu6NIMulIHSrCLJUmt4KjkBIypSw0iJlrdAwa/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192715; c=relaxed/simple;
	bh=Ane+bsiS8GQAApnlKO324S8NnqoCU6uZtPzlLeDK6xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=equG2uyjgtn2wVfOP/p6cVGWsNnuTVJrd9BDryNGbwwVoVvsIRzY02sSQ9B6tQrVpDYJuPBI6wDdb2Ohuj4RcCCXLCpXj/Bdu16ce6Kbuz/h0fFvX5jIqZujBg+no1WpBvwMMwSsf/dZxBGThcJ2jlAefge+eg95eCwou5ncepI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ki168ysh; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ki168ysh"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so106310666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791192711; x=1791797511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jj8juTRF8BNg42eLql4dmeLHvm0zqwKNTWAupdQfKl8=;
        b=Ki168yshyKSGzSdfK6DceYLGGMJgjYBk7pO5okfqxEbtHirexNpz8wVhxqIl9bS/Hu
         4lU9+PV2jDaGnu6m2aIVDyvFqIulSU+4FxDBgpsFDOxRT5SK9N8DiK9nISCRl8pTmYzX
         CcdHVz1yuaSegiEyWlII/5HtjB7OvjRA/ZTEWfWECTm/w/jfEANJM/5BsO3Kj1SrnleC
         ja0tQLX1MjKXUbzTpNQr+gX9h2imX7jG3BhDL7/kf9CgC9WL/4xWlFKidjvQIUL7rGtL
         2uKxXClbd1c6T9XuLIBrCpi1Od4qcet/iHaT5aT/zIKRGKmoKB9nHmobOD36x8DrnU/q
         DjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192711; x=1791797511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jj8juTRF8BNg42eLql4dmeLHvm0zqwKNTWAupdQfKl8=;
        b=vot3JdCF21WolRYY8CMOoELfgwu78M3q3zHyr2OzpRsA+mmvB2EjLNrdAVl69cLVYZ
         7J4mBPIwkgI1cLDgjpBt5i1Wzyn68HvVyPnrutx7BPAWVXDsrmObxFqkBa5ghIKVqTJ/
         bN6hKkgZVMpDLEAzBWESV83FvWZqY9MS/w2F6ib5xZDNy+Je6DDZ12Jb4BOzyCWqp9+S
         b8uxhTij4d8RNWGCSBIcmyKPSqm9tec3VwnBF8X0ZGnT3dOaoaNCO/e/4opI01V/20Os
         KhTplqYSdlL1kINoM+lIqXtyt6a+PNbWCyGklz2kvhwK0Osksz0PHPvsg7WiWY1WddTo
         5Ilg==
X-Forwarded-Encrypted: i=1; AKwUvBxbGTlWHKGgXojZ8+vhKWxqT3JA/U4axaLbfOtwcsrB6HiXWxIJebviu+RB/duZ7DLGofEpDigT/xIaNXY=@vger.kernel.org
X-Gm-Message-State: AFuF++l+joOZSlAB/4glAk9BzldqgwAFDcb5z6iCkzsvSIN83o8Vibxv
	CdsS26tEmxxR6rlcKBVLMB3POlhE6XOf6/IBLP49flqVDAWygahWXXGFzMF9LxnEJmU=
X-Gm-Gg: AYBFou1Ev7FjaYEKIHXOvm8Y9Tjb7LRD8qiJx9pxvGfWgMsyTGgrPrQpLl4qOnBrpKn
	yl4h3GMOg9ZvWnTbGMTBFK5v1s7im2yrp/rWR7LrxmX6eFMZkvdf+bgtFBhoLUBsFiDtvqbTR7X
	EmSOTTkC8WQ5ZG9FGvEpmd35ygx4VOGe6yjPG9hy6D77ek4OX+3QcZ+w1ibgwAdruXNDXYNIymf
	efyCCfg4+hoyiytfvCZCwc3GiKaJYfuZP9rFMv24cSryyIIimk2fViPZ1mJTR37uobh5OxTtDLI
	//YbNzIG5u6EmIp40VxJdgIUJcF37D7jFNeYdRXW5OhKwMS6S4sTp6/Smw0yvFlyspXvlSmfM6V
	xuriJL495yLBnwBbWxvqpHO6BH189DIlcabAI+1u8gkDjbMoEljj1GKPoBOPJ53HR/1Gq0pyRC6
	L9mnP2iRylrBdQR1QDx1HRlU4OcoCe5a+P0gnmedPtIBaUYokexSrf+fD4WqvHYb0XcqVRUWZzO
	IUtLNPIPCVKFg==
X-Received: by 2002:a17:907:179a:b0:c2d:c6e7:9e9a with SMTP id a640c23a62f3a-c2e4aabae2emr924547566b.11.1791192711132;
        Mon, 05 Oct 2026 02:31:51 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3155ef11b9sm49533566b.0.2026.10.05.02.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:31:50 -0700 (PDT)
Message-ID: <9c5e1aa7-4e0f-4576-b322-b4594cdea5b0@linaro.org>
Date: Mon, 5 Oct 2026 10:31:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] perf: arm_spe: Factor HW discard mode out of
 arm_spe_perf_aux_output_begin()
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Leo Yan <leo.yan@arm.com>,
 Suzuki Poulose <Suzuki.Poulose@arm.com>, Al Grant <Al.Grant@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260805-james-spe-software-discard-v1-0-0ff0e44c4c92@linaro.org>
 <20260805-james-spe-software-discard-v1-2-0ff0e44c4c92@linaro.org>
 <asNfh-qywjOPxajj@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <asNfh-qywjOPxajj@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/10/2026 09:27, Will Deacon wrote:
> On Wed, Aug 05, 2026 at 04:01:52PM +0100, James Clark wrote:
>> Discard mode doesn't call perf_aux_output_begin() or emit aux records,
>> and enabling it never fails. We'll add a second discard mode in the
>> next commit so it will be cleaner if there is a separate begin function
>> just for discard mode.
>>
>> No functional changes intended.
> 
> [...]
> 
>> +static void arm_spe_pmu_begin_discard(struct perf_output_handle *handle,
>> +				      struct perf_event *event)
>> +{
>> +	u64 limit;
>> +
>> +	limit = FIELD_PREP(PMBLIMITR_EL1_FM, PMBLIMITR_EL1_FM_DISCARD);
>> +	limit |= PMBLIMITR_EL1_E;
>> +
>> +	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
>> +}
>> +
>>   static int arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
>>   					 struct perf_event *event)
>>   {
>>   	u64 base, limit;
>>   	struct arm_spe_pmu_buf *buf;
> 
> Is it worth checking that we have a discard event in begin_discard() and
> similarly that we don't have a discard event in output_begin()? It looks
> like quite an error-prone interface for the caller, otherwise.
> 

Makes sense, I can add that.

>> @@ -775,6 +785,12 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
>>   		arm_spe_pmu_disable_and_drain_local();
>>   		break;
>>   	case SPE_PMU_BUF_FAULT_ACT_OK:
>> +		if (arm_spe_discard_mode(event)) {
>> +			arm_spe_pmu_begin_discard(handle, event);
>> +			isb();
>> +			break;
>> +		}
> 
> This looks like new behaviour?
> 
> Will

I just extracted the discard part of arm_spe_perf_aux_output_begin() 
into here and arm_spe_pmu_begin_discard(). The PMBLIMITR_EL1 write and 
isb() should be the same.

Do you mean that now it does arm_spe_pmu_begin_discard() unconditionally 
before checking PERF_AUX_FLAG_TRUNCATED? Truncated would never be set in 
HW discard mode, so it should be equivalent. And the IRQ would never 
fire anyway so we don't get here until SW discard is added, and even if 
it did, handle->event is NULL so the handler would exit on the first 
line anyway.

I suppose there's another change that it can never call 
arm_spe_pmu_stop()? But that wouldn't have happened in discard mode either.

James

