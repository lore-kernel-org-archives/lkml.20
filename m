Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0A847F768
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781138; cv=none; b=Yn3kZAm+xhxTqTMvVwhJ6EisqkB6Vwsjqrk24LENwCC2JO7LMaLC5S0FPM8ZN0t5H6xdo1yEYBkZU+G0HpS9Nr7Tb9LYZdmFgCs0Jsp0GGFihyojKhbpELstnQEcAecT9zDdQjC2IPa8N2uZ1IYUUn+1Hl553lWYmhAfegNM/fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781138; c=relaxed/simple;
	bh=7pSMEByB7R4uwEx4lR7TNQm7S98V/dF0hA7MZYBm4H8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gr5vxDw32inRtbQbonlNIztoO5TBHvjSPfOlfQYkoIlfHkCKZ+CNesQvqZha1YNOHgoCswdIwa+aLjdTkaUOfK1oKi9G0LtzZAlWtef1TZvPQ6Te2O/+3LtrGmV5fG+KMnxiZzh7UiuRRSwYcCTpcheBFLOD3XZb3ebAkSro/R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D5apak0v; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D5apak0v"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d0726ccc2so12549575e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788781135; x=1789385935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JTxWf7Z9THbI+LNbFW3uX14W5LzvtbTTU9b0mD+aQ5s=;
        b=D5apak0vWBt2mSW5LrB0IjvQ8rYPxzo2Gd8GBTp7qwtCbCTtDjzWEPAkbqIrhEsGRs
         exfS3GQQK9vrTxWQGPaL44stBDoH16b5GuYR6bThLiVwIK7xUhIx7ufkbZD2uDOen7ak
         1yKeobsRxqP7UpWfLwG7fUknB6Ja4Kc0VWOkQiUH5Q547VUSov7F3B8hyIkx+1zKQrU9
         Vt0SzWfPhWr5y1jwClX2WVeszlH8/IinQvu8/HmHwjwFdhIwyQmRRMsL+wM+nlEFQAHJ
         MwMQXlvhYgNI6Yhn/bbbepFL5bVg8OOwlzZQcxHyzxGwLI1/J5Zryx+Z3/HRehIeEVaX
         EP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781135; x=1789385935;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTxWf7Z9THbI+LNbFW3uX14W5LzvtbTTU9b0mD+aQ5s=;
        b=R99Nxr+eeHv/ygNiqnOy9VPF/xBEBKWWMs3+WcSLagRDlgZc3t9eSIiTZpd1fHrIbT
         sGk/+8x+mGyrZk64fibE1Z6L541yHB2cDKWH78rAl5yfc5F7qqhLFtTInBuw9aHrS/AO
         RsoP/axOoYByAHbRCqgtYf4R8/HJpm7BkmE7NA82azXBJCNoMrfCz3GTRbr94Mef5QgA
         fFizOvwxcVIL6vT85a2bVAQilsBOWO2XDlcPLTNNp3X12Vo+Df+QpoLPayPPJo/qaQye
         nOpHQhZTkmSrnNtRx5jOZYkYgSHFMnqtrHDqSi22z8ttY8P26RVo8/7Fr+v0vFE6xJEB
         +zsw==
X-Forwarded-Encrypted: i=1; AKwUvBxi401b61yVyZ9mZ9ekXNHAzeuZrZJeQiFiHpPnILR5cc8E78MnVdoLwQXfPPKvdxOcdovwuK4ulEyVxq8=@vger.kernel.org
X-Gm-Message-State: AFuF++nyEEXO0SG1DwJVj5ctsWINd0hQEjxbZhDE6C5czSdW18JItLyG
	K9Nr1OmWKgaYjCsPRbF+x6F2ucgl1Q1jgmh72zNf8fO9gFFjfVDne9XtQPOT2Il6TlM=
X-Gm-Gg: AYBFou3KojtTV2DWs38RP5vXLLCtWQzBe75l8odkQEuOBmjxgO75hsAdvI5o6AifqQ1
	faX5IIcX7rLM+Yp+RCTiAvhGoYTFMzDtx6te9JOTy9CSA/AiYZ0aFajRDLsV44ZhGfqJ3Wm18jm
	SuBkSMIoHLlIEImb8CnHu1/r80CB1RyOqX1Hs9GotFoBsvuifq6Wmt3RDUhcq9PF3z09LRLmLja
	8jgA9IYghFBZBcqd59J61fZ/xJRiS6Hef9VE3xubCjEK1OGjeJ3LxbXY9NCzXCf5xa622m9CYcq
	edPpv1/xUwE3JAL/1Q3MdaEhOjNNfkLIZo0/cc7j4VVLQyx58SxfngonxUYqFRKsXC4VEbA/+kN
	+Ayg1nCeeLY0TMmffY2nlpOnglJs/q0Np16naEZJZbKUYoEm6YtAtTGQNABvLlyLObyRaLII2wG
	BWvt9CfF0yAqQIPPfYW4tqgP/dADqiPFnSZUXEUBBcQXrsx1oK9p60Yv+dgVH8yCtUhW4UTsOVy
	oWat2OrW2W7/T34gt2x0ihWI1Q=
X-Received: by 2002:a05:600c:3507:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49cf7fe6900mr417183625e9.3.1788781134823;
        Mon, 07 Sep 2026 04:38:54 -0700 (PDT)
Received: from ?IPV6:2001:a61:1340:dc01:654b:3cf0:59cd:498? ([2001:a61:1340:dc01:654b:3cf0:59cd:498])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm264862305e9.3.2026.09.07.04.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:38:54 -0700 (PDT)
Message-ID: <6e0dbfed-cadd-4274-8165-886725413d0f@suse.com>
Date: Mon, 7 Sep 2026 13:38:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] usbnet: fix smp_processor_id() use in preemptible
 context
To: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>,
 netdev@vger.kernel.org
Cc: oneukum@suse.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
References: <20260903165456.498079-1-omermetekaya0@gmail.com>
 <20260905224553.595766-1-omermetekaya0@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260905224553.595766-1-omermetekaya0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06.09.26 00:45, Ömer Mete Kaya wrote:
> usbnet_skb_return() and tx_complete() call this_cpu_ptr() before
> disabling IRQs, which triggers a BUG when running with PREEMPT_FULL:
> 
>    BUG: using smp_processor_id() in preemptible code in tx_complete
> 
> Fix by saving IRQs first with local_irq_save(), then calling
> this_cpu_ptr() and using the non-irqsave variants of u64_stats
> update helpers, since IRQs are already disabled at that point.

Hi,

thank you for the patch. However, if the problem is preemption,
when not simply preempt_disable()/peempt_enable()?
Why is it necessary to switch off interrupts?

	Regards
		Oliver

