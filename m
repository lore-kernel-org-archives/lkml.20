Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531347;
	b=TWzFX2Ggr8LNU7mMqcBBEBjgOZ5+kJKxGeiHQXP6/1985ZX01fSQeibuA/XucBrhgrko
	 C6qqEIYw30M0WsvcCgYvG5BHWYoU/oqpUpEyP4ZDEh/8dLlWkO4K4h1yPwpW81e+AYGY8
	 L94YkK5afzQ95nDrTxFjvVURVuhxqL2IrqACt2y2lcWuQE22iG7mU5MLMsEdabaznXZDI
	 BKEEwKQBXE0LJTQcKlRGiQVxAY5rOlaD3maMuQLk9nZmtJDhTnjJG6CJNO77rW6c1DNxq
	 pTsQq8IZoaTl47fF3sP6hpQqnO6pS7nmVVzX6TY1r2DS0v4DK+Wn8wn3DmNsthILa6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jcVy99/4546IpPlUV+chsxZxg6fKFHtjcBIv8IBgnDA=;
	b=HjpuWhbHAxk0nyjXK3dZckZE8APkGs/2RZ9dVBn5YslCkaBihueg5st/ebEx1J/lP0hy
	 3Xu5mKPlKlkJvPIjjd4+n4UhJUZAyY+ZcveERxiOGhtvvASt/gyCfPL0prKQzSFDdgi4q
	 DwTiWug9qkPPRM5Q73pibZdz7WPLDTkAUfUvuA2ljNw1BkdlldmbOIPtreXC8n+Bk0ijQ
	 EzqhPLgH2YkxwB5hQ7aewrpn6NvNd5FO0GaXLx41Bp6vcKvlDd/WK0BuM5EcfYMncAZPT
	 LL1t9C2Xs1BjdEFGFu5bmAUEClZY4jSO+qUWLlQVUMr2jG2dJJEkwxro9XmcXXOxvwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lbX7Xkre;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BE5606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28BE5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lbX7Xkre
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491846221ffso326580f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794531340; x=1795136140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcVy99/4546IpPlUV+chsxZxg6fKFHtjcBIv8IBgnDA=;
        b=lbX7XkreAKRNKOu5bAAr78H5T54rlJTQ+uR1EUX5bsk5/uqD3MSuwb5tv4C5IgnNeB
         /xFLviFjffv29Y4A6i4p9ESY3p//U32kUVrP6/heuTyMixYJ+MTCgu7Xc+gRySu5Iity
         +vYENv1ugwa8Map53en9lcSuS7np9EDqY4nA3rVGk4qxz5H/P5miXu22NmtXXHrLoqm+
         fWQwyl9ni4L6I8m1pxTTqBFC3p2JqByRwHUEIFNy8KUfRJrD55J/wN7a0ZWJ5SX+HWxA
         AcSij5PmZOQdzDGw/IV4F27lA7imS+nAbkzEIBaCqJRoHgzTGIjPHpUxDWDzNfFNRWxo
         zABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531340; x=1795136140;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcVy99/4546IpPlUV+chsxZxg6fKFHtjcBIv8IBgnDA=;
        b=t6pXZ3x3MkM18HXmKpMbn0da92cUFt/kDTb03P1VeXiRMhCqu6Fr/VbujqUV9uQ6Y0
         3TnDqoUGdpqs5VZDHQkqmG1OYkuTQIWplWmmHl5mR8PUxnW7gd+Tw/l6CYJtYtkmLdGw
         lYS2naJnMF9OGcO626LLaaqPbsTxM1onHIX5W6dy9XU+yQm8EJPG5/pQywgi1M/bIFK0
         cVQ1KoYMg7ecAeC8CCGMIWYQd4W97vKoFOD5A8/FbjqnjG5zzK3whL44PBBLni4kWjcV
         M+3IHAJ6b1IY01APu2jVzMAcbgmdLVkS1rlHdIsi+yf0Pk8UkaMVd81jwOyGpZ2L2VBu
         mD1g==
X-Forwarded-Encrypted: i=1; AL+hErGetcZgem2SmKT7V0jGID9RP59aCy5PxxV7zp9Hcw3zE6w+U+EgkXjY0LZEci9IQWYwXBC6XvcDHuvZRDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gy9NHs80gVsuD360rurvL+9l+SEatYwiZhAHfuMfuTvk8RgZY
	nY6PmnvraDG4qSdKWJLFxdIjqmD6bTNG00zdDWQcVvoIliqtCMLE5a0qa2An/8vxsnM=
X-Gm-Gg: AYBFou2g6GBRH+d9RVY3NOaqmzqYBN59aUrMQMPA9e3CBmNZ2debnr9RhOQgzJlGZT/
	otyaHYCRfgRjW2K6/DdgUNlN8xn/gO/SBjQsLAAtUTjlEXY1kFoCKED1tXxwGOXsWDENLUrrdjP
	MFgvSK5Xwur9xsDQ5P4bGVMbyjwHqOAfWi0p3PBYSi8ObL8HgO7F1Ohlm/JC5l1f7uEqzjKKKIE
	C3dKiKjm7e880UvDUPHbGxAa+xxO9utVLcgxImahH8nXvB0+zftai/bMnJuDVW7tRhAXbQbcF88
	uQ0kXDh3CVLCWrmfCMT69hAx6wPgd9bnNTQZOnf0bFgppenhbDByw2n19lddHXUeKK1fiyHxuOZ
	+xqTjOAwJydmpcZK3phF4SkflNSqECojQezAtqJVpf1qlGlhcxxCXm0qtiMG0jQG2A5tz5u2hvJ
	qX6s3yAUvhZB1dHBlLTkfNvTYNefr9kyvI5tJW1GbzNruF9OuJz2M3HO1Vn7mP1MZTMWtSwuZgR
	PaAfRDxEeeyqZl0Uj8slk8z7AKGvr9SwTzN0xSajuIGPNXhscV4qoOZvpSikS8YmIr9/qVQyob5
	wsSEDRoEOVALzN7gneXI2mDnXt8boVB9SuZAYHSPSw==
X-Received: by 2002:a05:6000:29d3:b0:48e:6a23:4a09 with SMTP id ffacd0b85a97d-49c731641bamr1485962f8f.54.1794531340462;
        Thu, 12 Nov 2026 16:55:40 -0800 (PST)
Received: from [192.168.0.167] ([109.78.26.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm2106178f8f.59.2026.11.12.16.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 16:55:39 -0800 (PST)
Message-ID: <c5444a64-ad14-403e-8453-0bb0a16dcfa8@linaro.org>
Date: Fri, 13 Nov 2026 00:55:37 +0000
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
Subject: Re: [PATCH v2 2/3] media: qcom: iris: Wait for threaded IRQ
 completion during power-off
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hungyu Lin <dennylin0707@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Joonhoe Kim <26rote@gmail.com>, Birk Skyum <birk.skyum@pm.me>
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
 <20261111-fix-disable-irq-safely-v2-2-8e13f68c2ef9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261111-fix-disable-irq-safely-v2-2-8e13f68c2ef9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/11/2026 09:05, Vishnu Reddy wrote:
> +void iris_acquire_core_lock(struct iris_core *core)
> +{
> +	mutex_lock(&core->lock);
> +
> +	while (READ_ONCE(core->irq_disabling)) {
> +		mutex_unlock(&core->lock);
> +		wait_event(core->irq_disable_waitqueue, !READ_ONCE(core->irq_disabling));
> +		mutex_lock(&core->lock);
> +	}
> +}
> +

> +static void iris_vpu_disable_irq(struct iris_core *core)
> +{
> +	WRITE_ONCE(core->irq_disabling, true);
> +	mutex_unlock(&core->lock);
> +	disable_irq(core->irq);
> +	mutex_lock(&core->lock);
> +	WRITE_ONCE(core->irq_disabling, false);
> +	wake_up_all(&core->irq_disable_waitqueue);
> +}
> +

Ouch, this is some mad amount of jumping through hoops.

As General Pierre François Joseph Bosquet said of the Charge of the 
Light Brigade in the Crimean war "C’est magnifique, mais ce n’est pas la 
guerre" - It is magnificent, but it is not war.

Why do we have to hold core->lock over iris_vpu_power_off() at all ?

- What is the data-structure or
- Logical state (the state variable I suspect)
- Or guarantee of atomicity

We are providing holding that lock ?

These are pretty much rhetorical questions - the above locking scheme 
can't be right. It implies we are doing something wrong and not really 
fixing that wrong thing.

Holding the lock across power_off() seems to be that wrong thing.

disable_irq_nosync() seems to be a correct fix - so if our locking is so 
muddled we have to go to the above - there better be a fully reasoned 
and unavoidable reason why.

Perhaps I'm being overly reductive here but - why not "just" refactor 
the code so that the power-off comes after the piece held in the lock ?

i.e. push that into a worker and then do a synchronous wait on the worker ?

The chatbot told me I was wrong about the worker because "it would 
deadlock" and I can't be bothered burning the tokens to tell it "I 
didn't mean hold the lock in the worker"

It did make the point that it thinks the only thing being protected by 
the lock is

intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
...
writel(CLEAR_XTENSA2HOST_INTR, core->reg_base + CPU_CS_A2HSOFTINTCLR);

Which venus does like this:

static irqreturn_t venus_isr(struct venus_core *core)       /* 
hfi_venus.c */
{
	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
	...
	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
	return IRQ_WAKE_THREAD;
}

i.e. power off in the IRQ.

Perhaps even simpler - just do the power-off directly outside of the 
locked section... once the IRQ is quiescent ?

Either way I don't think we have a good reason to hold this lock and can 
certainly find a way not to hold it - assuming the only thing we care 
about is kicking that register - do it in the IRQ why not else do a 
worker with a rendezvous or even more straight forward.

void iris_core_deinit(struct iris_core *core)
{
	bool power_off = false;
	int ret;

	ret = pm_runtime_resume_and_get(core->dev);

	mutex_lock(&core->lock);
	if (core->state != IRIS_CORE_DEINIT) {
		iris_fw_unload(core);
		power_off = !ret;
		iris_hfi_queues_deinit(core);
		core->state = IRIS_CORE_DEINIT;
	}
	mutex_unlock(&core->lock);

	if (power_off)
		iris_vpu_power_off(core); <- this ?

	if (!ret)
		pm_runtime_put_sync(core->dev);
}

---
bod
