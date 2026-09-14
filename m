Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE0F448BAA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394454; cv=none; b=Re1rvJyx7k5mGLdSyOAA+me9BK9l1hz2BNnIV/EYq1D4MbJ9qkYj+KTXRlb4WSwIr/2IPZ3Gn6AJl4qK9jrpigP1njvqRDzFtd8DnNScpVFwyE7qi4tqresOwS7qa7C8c37CIOJCdfHlLmSyCPOnum6JRx2qien7GZuWMrKhlzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394454; c=relaxed/simple;
	bh=oXMGmsS6Ytd5IMMSrbmzSd7C0YlaZQ5+z3HLbVOw2iE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HW16zcge+3xn+fIYGdgFTQYFoLe1cGb8aEl1Ktq6urgD0s0IUOt5La5yoJ3htNtlk6LXH9vQXKRp0x09Z7QUjdUKYXmaGOqr4rQISHh7DNykvuMn55KqgkOhoT7N2VAK0VUhoF0PkczAZNqpZA9EGbLiSLuDBizZt4OeyTS4O2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=E8G9PjKo; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="E8G9PjKo"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4843e397f74so2011299f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789394444; x=1789999244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8rQ4wEtNnWG7AMNoujj40yCkBU87VJHpgDk71+5KS4=;
        b=E8G9PjKoic+aotsi2o7B/Bar+Blp/5zfAEllSF+wYExH9kZ2VB4OmcIewSy+D1j1nq
         AOOAWTmsVpyJP4o76h3mz5dfhTy7ufRFGbv6Jfomh6wyGd7ZRcVQhv/n05mIF7JqSLjv
         ohCTH9Z3yPEYUGP7m68CCqJp8Bhx54XDwvXbZeOqEqWzYbezgjK6VtBU/ECMTqyxF8Wp
         6yHiCYuFXpLFwJ8OT3zORWbw8L6yX9aDyi9fUjhkSzytr9S1Q+4n7z6BFkuqCHPTLR8e
         rLEAVG4IzanHGp88mIdSGNR6jWiV97L1BfRz5t5CAvWF3EE/9OB6Irw1nLscVJ4Ju3IW
         2/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394444; x=1789999244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8rQ4wEtNnWG7AMNoujj40yCkBU87VJHpgDk71+5KS4=;
        b=QZZ22o9pZ97pf+OL+kvSQREu9IMiChL52vGF3NaeqR+ovT1DKS/Z8J15rhSUQQALtP
         RaMC2oScQByCw6oL2chy+OY7ZvTGYAAVYgEnm7n+KfMsH8l5mwcuN83UAStI1RluknlD
         WJPb6XjKbPOzJ/cFORZgmS7PrLFA0seloFw6eamdE7Tn/DnA7PBeIQ6zZdwy+wYy6JN2
         eNuAbslk0gGdGhRAKztlwfk3lnVwrJwjzVCyOqRlnXx7w7NCyEK8wefldHYipoWlfGRu
         ckN4YUTeSqYhRqrL18OG2f7Rvp0q6s+MD8jLLqiH9ok375+BIWcn3ufG4ZUDGmu0atno
         Dn2w==
X-Forwarded-Encrypted: i=1; AKwUvBzUTx9MjJ2Az6Ub/Aq31wlAnm0w9JR6fOGB4UkvnJTSwcOirlhP8J3WqeOi8gSIM/yoUDfuccIOA1S1aDM=@vger.kernel.org
X-Gm-Message-State: AFuF++k8ezSL1vn/s9GSieeAj1S0nJKIMszKIT/K1w8hyNNaNyve95pQ
	RKgy2GL3NSM548HZZ8eovDfBcJD17Tb58VGfoY+bdEDKRP2puWGB6ypfu9qpicJTVho=
X-Gm-Gg: AYBFou2Z+uPkQBmSoXxuqKOcnk8excfOARoUu8Q5L9eJDoBUJ/f4687QzxX8oIub6MV
	VWqgnD/T84VS28gUht+luyb7RnktauL4ctpYStLPl3h38uW7AL8YLh74mxlLNBrqWvlA3vtBVgK
	PW9glL2mqNTkWZ08LvNcIskM740KFcDAFlFgDdgIKgJj/tSyPdpQD/TySC8ykXFdidUkUwdhw+4
	Y0qDedUJCDYQT9vHMcfvD7K1oJwa5LGgCdg+cEIPGh5VArjIh07w9aWJzPMP1Bk01pX+FWmVLbD
	56S+nsMjY2jhfHV0rmNDW6mKoKgOCRNeJMO2UsrNXCikJuYFvIukNO1ysA+a9Nc9FSE7yF7YLzT
	nkG4GHx060OAIV5wrUNYB+sZeyX/rY3ILOooHbquwIrCAzv7AM5KSNhnRuTyFMcSmwIfmMwUZPn
	NC5dOJrqDF1ErRUjSOcs7JymuA/0yCjJkkXWqOLawoS2svPg9HxXyvb5w5LZ+X9Tzl0td4LRL3w
	audmKuoD4C/DKdGckV45wzcZdTuz3OcG8DYxCAttjsmYSTZK0tDIV+Q9Q62iqzjdMQzNdAMIgfv
	hkbJRdMam+AjbvvjCMFB2XdxzQ==
X-Received: by 2002:a05:6000:480d:b0:484:361a:1c7b with SMTP id ffacd0b85a97d-486fc960e59mr8495354f8f.7.1789394443934;
        Mon, 14 Sep 2026 07:00:43 -0700 (PDT)
Received: from [10.160.16.196] (150.red-80-32-100.staticip.rima-tde.net. [80.32.100.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm28641670f8f.7.2026.09.14.07.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:00:42 -0700 (PDT)
Message-ID: <73837a51-e163-4b4e-8be2-4cdc044393b8@kernel.dk>
Date: Mon, 14 Sep 2026 08:00:41 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] x86: implement thread identity handoff
To: Peter Zijlstra <peterz@infradead.org>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com
References: <20260911154148.644489-1-axboe@kernel.dk>
 <20260911154148.644489-5-axboe@kernel.dk>
 <20260914114656.GC3500130@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260914114656.GC3500130@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 5:46 AM, Peter Zijlstra wrote:
> On Fri, Sep 11, 2026 at 09:40:54AM -0600, Jens Axboe wrote:
> 
>> +/* state bound to the task that neither side may have */
>> +static bool thread_handoff_task_ok(struct task_struct *tsk)
>> +{
>> +	/* I/O permissions, the bitmap hangs off the task */
>> +	if (test_tsk_thread_flag(tsk, TIF_IO_BITMAP) || tsk->thread.iopl_emul)
>> +		return false;
>> +#ifdef CONFIG_X86_USER_SHADOW_STACK
>> +	/* the shadow stack is per-thread and would have to move along */
>> +	if (tsk->thread.features & ARCH_SHSTK_SHSTK)
>> +		return false;
>> +#endif
> 
> Distributions are having this enabled, this means nobody will pass this
> check.

Ah good point, should be feasible just by swapping s->shstk,
s->features, and s->features_locked. Traveling right now, but I'll test
that for the next version.

-- 
Jens Axboe
