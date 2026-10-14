Received: from mta1.migadu.com (out-70.mta1.migadu.com [95.215.58.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049A428CF5D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967074; cv=none; b=dhg8dijfqp8m3C4clAw3E6tInZ7A1aHWsG6PiZNUFPwaEi7+/ovCQ9aELthnlwP0bpKSbntw8JTUBBrmT/flMLSlx413Urw1yT3ErLUJg0ywCRpYi6mWsojaH9FZ1rni8WEoJqktcxG6OtO2OOmvZtXLmeLFCH1rBvFROHIwvS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967074; c=relaxed/simple;
	bh=ARdqFFr4feuZC36L7tKPeV266TwXot48jPTDPet42oE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d01zxxozpfQNHFiWXItKxxUVifha+3P5DbiAxyIVcsaq7xbEEnK8vy3sr+pLKIs4KcAdWy444H1Z7ULaB5GyxvalLwBflpS80E+Lee+4zIKR7yrLGnB9GY1PKRZ7O4f8T3fzahNxP1iCoTTLRKAER/aea9IPDDWko1LmJHTq2Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p99Yuse4; arc=none smtp.client-ip=95.215.58.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p99Yuse4"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ARdqFFr4feuZC36L7tKPeV266TwXot48jPTDPet42oE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791967069; v=1; x=1792571869;
 b=p99Yuse4wLX1yFti+TWAbIs6ICO0j6t3lfXQynqZ31KDtyJ70q1K8awjlYpPv9P3jJlLbuRS
 DQs2W57DBu9fkB/9m7kMbcQ90jax9OuAQpnPbkMNWaZ1tZZrqDG9FAAUsF8qAU26jBc6+E0PqAz
 8RaqshU58k1Z/vq0PqbtYkl4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 30b45cd5fa8450ca;
	Wed, 14 Oct 2026 08:37:48 +0000
X-Mizu-Trace-ID: 30b45cd5fa8450ca
X-Migadu-Flow: FLOW_OUT
Message-ID: <4c6f8e4a-93c9-4ba7-b66b-b294ffd70bf9@linux.dev>
Date: Wed, 14 Oct 2026 16:37:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT
To: Huacai Chen <chenhuacai@kernel.org>
Cc: maobibo@loongson.cn, gaosong@loongson.cn, zhaotianrui@loongson.cn,
 loongarch@lists.linux.dev, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@xen0n.name,
 nagachaithanya9911@gmail.com, Tao Cui <cuitao@kylinos.cn>
References: <20261014052933.723303-1-cui.tao@linux.dev>
 <20261014052933.723303-4-cui.tao@linux.dev>
 <CAAhV-H5SDKsifd1GwMLU_YMny8PqwHdyuvujrAiuvkALoi3+8A@mail.gmail.com>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <CAAhV-H5SDKsifd1GwMLU_YMny8PqwHdyuvujrAiuvkALoi3+8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Huacai

在 2026/10/14 15:37, Huacai Chen 写道:
> Hi, Tao,
> 
> On Wed, Oct 14, 2026 at 1:30 PM Tao Cui <cui.tao@linux.dev> wrote:
>>
>> From: Tao Cui <cuitao@kylinos.cn>
>>
>> KVM_DEV_LOONGARCH_PCH_PIC_CTRL_INIT has no guard against repeated
>> invocation: every call overwrites pch_pic_base and registers the same
>> kvm_io_device on the MMIO bus at the new address, while
>> kvm_pch_pic_destroy() unregisters only one bus range.  After a repeated
>> init, MMIO to the stale ranges computes its register offset against the
>> new base and silently reads 0 / drops writes, and the leftover bus
>> entries persist until the VM is destroyed.
>>
>> Reject repeated initialization with -EEXIST, using the initialized
>> state of the kvm_io_device as the indicator.  The MMIO base is only
>> committed after a successful bus registration, and the real
>> registration error is propagated instead of being replaced with
>> -EFAULT.
>>
>> Fixes: d206d9514873 ("LoongArch: KVM: Add PCHPIC user mode read and write functions")
>> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
>> ---
>>  arch/loongarch/kvm/intc/pch_pic.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
>> index 51e4a6a39dc0..7979466de729 100644
>> --- a/arch/loongarch/kvm/intc/pch_pic.c
>> +++ b/arch/loongarch/kvm/intc/pch_pic.c
>> @@ -281,16 +281,22 @@ static int kvm_pch_pic_init(struct kvm_device *dev, u64 addr)
>>         struct kvm_io_device *device;
>>         struct loongarch_pch_pic *s = dev->kvm->arch.pch_pic;
>>
>> -       s->pch_pic_base = addr;
>>         device = &s->device;
>> +       mutex_lock(&kvm->slots_lock);
> Why move the mutex_lock()?
> 

Thanks for the question.

The intent is to keep the repeated-init check mutual-excluded with the
bus registration.  The set_attr ioctl path holds no other lock, so with
the check outside slots_lock, two concurrent CTRL_INIT calls could both
see device.ops == NULL and both register the same device on the MMIO
bus.  Holding the lock across the check, the registration and the base
commit makes them exclusive.

That said, if you prefer the check before the lock, I can respin --
please let me know.

Thanks,
Tao

> Huacai
> 
>> +       if (s->device.ops) {
>> +               ret = -EEXIST;
>> +               goto out;
>> +       }
>>         /* init device by pch pic writing and reading ops */
>>         kvm_iodevice_init(device, &kvm_pch_pic_ops);
>> -       mutex_lock(&kvm->slots_lock);
>>         /* register pch pic device */
>>         ret = kvm_io_bus_register_dev(kvm, KVM_MMIO_BUS, addr, PCH_PIC_SIZE, device);
>> +       if (!ret)
>> +               s->pch_pic_base = addr;
>> +out:
>>         mutex_unlock(&kvm->slots_lock);
>>
>> -       return (ret < 0) ? -EFAULT : 0;
>> +       return ret;
>>  }
>>
>>  /* used by user space to get or set pch pic registers */
>> --
>> 2.43.0
>>

