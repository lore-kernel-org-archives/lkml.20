Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9240734CDD
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760236; cv=none; b=VFOSkrdLdG9pPEnpA9rzmHWvhWDlSxFT+C+YNkpvDOhJey1AotRK6T45SFFV661rey1TyVkPiLYf3rOlay6OIFJjmDiknr3a06yzf6x8pxrpt8ZgcPeQtJc2PHSOMHgVaj95HYNTIj9f4iuLaUPNPo6vnBKkaxWrNwBHKYehtys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760236; c=relaxed/simple;
	bh=LJM0Wd7RUEGT+1o4S3J7rTftxoFqM18lTZscyhoCrFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuqv7QB9nGKFcPHwQW8626o+bTjH5AjvIZF1YZfHsqcoPuOQ5w/+SvwFRkeafcfD3Cx8DgVTFWJmfLk86Aj2IALZR5GsbtMBBzPd0leyD+KNDID8lbU1rMFNmKDfZ7K1W3X8Q/APsFYZa/Otr9k31xYrD1iC93L7PsX7fnBETEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGlnDKG/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGlnDKG/"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8486ac3f347so34625b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787760229; x=1788365029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ql47cxhhPz+pBekLN3rh9Yom4KlDNtrvH/6xbr+Yqz0=;
        b=TGlnDKG/aCWqIj8Cw/g5OFShkYAIArci3YAgKrHI0GlYd8D88s0VEwiI8abN8rkulk
         01R2emyIvPnaZgZ6/H9XbzXaYc3L3sULRT5WwKZeY4vgSJrK/RcokkAZ6O+O+VVFT1gt
         3VLr2FqnwAIsVxUQRAYIzKSXl0qkUF8XeKKP1TtFJLi+okZpqqyOfPcvHE+uBjTBYmcU
         YX1ulnKxriMrQnqe4V3W/gw36xCkzSmsLUbfC75aVSmjb1HRMKgDsx8u1QZmqT7jGZIv
         9ZjYxH1hu8q9sLVHm7mvCIUnqDs+DOlHaMAeS6noJQjuIMU7Q25voXVg5xmTEGlkqndb
         qWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760229; x=1788365029;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ql47cxhhPz+pBekLN3rh9Yom4KlDNtrvH/6xbr+Yqz0=;
        b=Vk3nZu1A4F85pfKqimHTHSEfa0/7zHDYJlFbQzwK7ZaNoskyYm3qiMSTV7wGnLZhWK
         rAoD0z6+OaLj89k0Uqmx3WBdKPk8/8sg47rZKNZibKrf5+NWgcBUpBjJaguHPoJ6TETD
         POcJ9YwRvoL4Ip7irMuuyUghXULauS60zCgFbFkDdLwbG2Z81berlew792z2mHxXfgsp
         0XDS72cHANQDXj5jFZEQWL4K9GGIwAzNUB6IcIb3tSAkg0IqF/KMwgblwYIxevRCzNsi
         iZ8HC25WBkV40hOBFLUIjt0x4AfsCHl8EGmsbx5S9XmdncP+6LtIZ5INGUoBWxPEXmIb
         KoWw==
X-Forwarded-Encrypted: i=1; AHgh+RqkveExO8bTDv8Z5spWDyxLsOAXda5njIlEsG1v9PoPDkiUDoqIbf8GLci/Vh7bwgM32s6M/7+0tHtnbKk=@vger.kernel.org
X-Gm-Message-State: AFuF++nCagSYwB9hmnfacO5cD/ZlwH1HJGp6YNmKAih+h3aJOSG71keo
	4NQAFYa4mfMKGVkx4M3zLZAppv1DIg6URkBGXcYaPzux+r5EIRKAVA1v
X-Gm-Gg: AR+sD11Q7UANwP5xCMFDWS7k4/Fg5ra3/5vh0ZHpmU/VCJXh7nYIMYZQmQBsEwGdbge
	p3zJZtGX3QhbbcZ2EFKJG1Os5Zyb+9o/8SaKDh9G0cM5qcyESCJMWwBJPwnNDCR4z2KE7wiO0Ur
	vSESO7PwZYwlvDBEjMkYUafnZ3smAhyWrsPlmNy4BklYD36rMmsKI9dDIqDejWbM/sq6bj37GV0
	IYTSMPkWAGYAoQuDErQNJ/P4ozC91p0kanT7vhinKUcIKfNYjWB11Vo0xjHM6asD6irmdvKebDP
	1sjqhNkuqEUdvoH4O1mqpULhjyh0hsKF6khvRFoLM2uTSN+dEaC2AbQzse6muMfTcwOOpyY5iHR
	dEcIGQ7HUwpSu3OZZzF+WTIKmUKUgAnTKQ2MwEwk08zK/rdh0woBrNl4KUDM9ChFdMbIcdnEuA1
	jovtoqJHJqGG4LbEnEMTIlqUKh5tHibJ1RnbVLNzjzBQha/ivstG6+rtvoN2S0V9iBLU4=
X-Received: by 2002:a05:6a20:e347:b0:3cd:9c00:33fb with SMTP id adf61e73a8af0-3d0f4bccb5emr293716637.5.1787760228707;
        Wed, 26 Aug 2026 09:03:48 -0700 (PDT)
Received: from [192.168.55.196] ([218.49.81.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1beb2d4c5sm1104043a12.13.2026.08.26.09.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 09:03:47 -0700 (PDT)
Message-ID: <9e216978-d884-4d56-b39f-d134f78a4999@gmail.com>
Date: Thu, 27 Aug 2026 01:03:45 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] srcu: false-positive WARN in cleanup_srcu_struct() after
 78a38cbf6f20
To: Zqiang <qiang.zhang@linux.dev>, rcu@vger.kernel.org
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org,
 syzbot+d4faf7db59e11f6fd1ab@syzkaller.appspotmail.com
References: <20260824105625.3725157-1-shpark061104@gmail.com>
 <494f3e0cdb3692bf13690f4cddd3b40098b51627@linux.dev>
 <24c0edd6-3cdc-4536-ac78-394bf785aad4@gmail.com>
 <0e74e6799bf042293fd1e34e2f242c56786c3de4@linux.dev>
Content-Language: en-US
From: Sunho Park <shpark061104@gmail.com>
In-Reply-To: <0e74e6799bf042293fd1e34e2f242c56786c3de4@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/26 22:13, Zqiang wrote:
> In this SRCU_SIZE_SMALL mode, when queue delayed work timer, the cblist is always no-empty.
> unless invoke start_poll_synchronize_srcu() to begin SRCU garce period,
> otherwise invoke call_srcu() or synchronize_srcu*() will insert callback.
Right, every grace period which armed the delay_work timer is started by 
the real call_srcu(&kvm->srcu, &bus->rcu, __free_bus) in 
kvm_io_bus_register_dev(). I missed one point: the invoke work which 
invoked the barrier callbacks is not queued by the nearest end of grace 
period. It was queued by the timer of a previous end of GP, and it 
started only after the last GP had ended. Meanwhile the srcu_gp_end() 
from the last GP armed another timer even though the work was already 
queued. The timeline is as below:

1. call_srcu(&kvm->srcu, &bus->rcu, __free_bus)
2. One end of GP comes, arms a timer.
3. The timer is fired and an invoke work is queued to rcu_gp_wq. The 
timer is disabled now.
4. Another call_srcu(&kvm->srcu, &bus->rcu, __free_bus)
5. srcu_barrier() is called and queues barrier callbacks, waits for 
srcu_invoke_callbacks() to invoke them.
6. The end of GP from step 4 comes, arms another timer.
7. The invoke work queued in step 3 starts, srcu_invoke_callbacks() is 
called. It starts invoking callbacks without subtracting the cblist len 
field. It will call rcu_segcblist_add_len(&sdp->srcu_cblist, -len) after 
the invoking loop is over.
When I debugged, there were five __free_bus(the real callbacks) and one 
barrier callback, so the cblist len field was 6.
8. Barrier callback is invoked, still the cblist len field is not 
subtracted as srcu_invoke_callbacks()'s invoking loop is not over.
9. srcu_barrier() wakes up by completion and cleanup_srcu_struct() is 
called before the timer armed in step 6 expires.
At this point the cblist is physically empty (head == NULL, all seglen 
are 0) as all six callbacks have already been invoked. Only the cblist 
len field is stale(>0).

Thanks
Sunho Park
