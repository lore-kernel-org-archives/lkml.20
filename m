Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679070;
	b=hqTdb2Xe9eDjGn1VMpYUZ957bd6ExKD+Rt103g9urMyxVamneuUpFyqj0S6+poTln2jS
	 FZ/MtSgHP0Hc9vmmKSQT6VzNW/q51qiNr2+jS0CigG1t9pSgpLw+iiDtWOZ8lV4+a3bsP
	 nY0MC6CQ7MPfjGVllvHfPN6Ry96PY/qG9BoFPv3YFYLSzlxgXtQyxZgpC1TFExlKS9FQx
	 9g33fGEhy1qntW+66y6XIb8tbTM7m+E6Vm+qui2PRcqKnxxyzKKbRcbYlrIHnspthBPhM
	 X+ZWUS/ie+SKByQs0M/d0bh9gX810B7sTv+HSxPlWGyTU/bBqfeLQMWicMtQRGUldig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Oeu8fRL3y/S5bZyksCXvYqJHykgbAKegGBLalUwV/PE=;
	b=5LkNLyL6RlMkmS4EM2ZNXsDlPo94iVUDQjS/XQdbp5xwW026OTBQV7aQ80FF1ZhEjC8o
	 damnzCnCqy9fSQm1+xqLb6zw9IV7nJbGCnPbvWBn/+8H+rxbhMdEOUyVJK/nl2nktGlnX
	 70uWErNCqw7JbZ0sOkeGNL2HWJdex0a5BUBPiO+9u0ZUBXSbVIUAl47EkvBzl7THQtEBJ
	 x/u6QpAtEnzRvjA94h2wE/N78GggvP0XyDgSY/gKyH/PVEBEO0nk8opTN1xN9K/yUBoYE
	 u+2BNfoIL+lzuYlqMGP1Jf1sGmDH0fNGGJeKzKrf2orf9rI1MTd/0t9NqSCUJYbRYTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yiqucYiP;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D93606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D93606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yiqucYiP
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11368515e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679069; x=1795283869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oeu8fRL3y/S5bZyksCXvYqJHykgbAKegGBLalUwV/PE=;
        b=yiqucYiPhicJpvweTW8QlOt990uPnzzoTAoTZKVxBSOsacWKJCWpQ6kmtpxXBSsmfZ
         dA6cccGEX/mnZVBztmMQ7K3lNMCn49Hw3Chc3oNrNoAuEttmV8Hq0pXNoJtUNlICfNd5
         Q4exnWlV6pKgguc+UIVvBeHb6EvYESUBPh7U6i0pUTsPofLsd0tgwU3MGh1vMr6TiDkE
         ydB3hF6LD2moJYc7fZHF6WvOD4j0MoXLCiq2qr53vdZSjyTYyM//XH/qKX7PDQbegzJx
         BZ0S3aMBxZA2FJkDp7s2BtJCAzhBgsnbngpjBomfr3OnGLtpG1bZtDUg541snvCJQgj0
         5PYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679069; x=1795283869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oeu8fRL3y/S5bZyksCXvYqJHykgbAKegGBLalUwV/PE=;
        b=dSuhUEMHxwcAApdTfocKKOJtQs6KXraX84eKASnGuj6/0mKO4nPKRnC2f+szS/Vea4
         EgRPrfJnywj2Kq6AoJcpPK2iZ3hgHu9ky1ojhk8nQ5nJM88/kbCflfn4KRzs/rtCTdsB
         JD6lOwQh+XfuaJI1jkVDrn+YW2jiofoDSq6kd9uFfekjqpx4v8V3Ycdoj6xJoLw2T7GQ
         w4g1rm5B9WDomHsX/e2IgDYuALGX01gf9Cs9FMI3F+TMqTCfU6IFCPYNydWgdUH6aqDB
         3GvOJJpT9H4m7oP3Kv0yIsaBoA/upwS4EAAXqidIE7ibMeDjoPngOUGvDLoksHotcNh+
         8stA==
X-Forwarded-Encrypted: i=1; AL+hErHCObNwiBLtHAkTiNibdv1/Qk88MEUKUdLOnllP3FFQQT3kujRwaex69mr7LnffD+NFhrL3eFU3xmIm3rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sbGQD/nuDNWdYwiAJ67SQW2d3H4QLQlmBAqjiJFLy0c5apRRg
	AcUiLbWLQX5J+mzfQ1Nxtdk1q1UgEUR8p1HaeGjPqcuAx2lZS2YZCqJjj/8adw==
X-Gm-Gg: AYBFou2pY5cV+OYG3BAmVcoH/1374MxD9Z6tnxs1PNai5iaikMKzGOjHYbFzr5BSG84
	H05dfExnag5cg8nhfe0GR78uchXyww8XMqweKymMqFXY6gkOdWMxGrI2fh3HK7j0SK6TrTG5MY2
	mCdf64aG/a8LvX1ynT7iAHP/F81UQJ3zlSJCpSacCPfGTBtigj5Vzk3/2OmXw2n1uVwxPNlR5bT
	RBA0yVx/YVgmaPUp0f7tGYXEesuMWQsdaD2lXPwtq/v2uPrGR7KTHmL6sKXLJz/sSiJGdHvejFv
	YPl72BuLZTk1zVH86L0a3ayYt4io6q2GzYDVctR6LdDnnq1gNy8AYO6KeC9tL4vJ0y7QAYPXVm0
	GfQT1OxJ7Grod+JMw+dJI0HNSJebzFaakf9CkgwtLHAXBFjPo7lAQsepqJuwUKzpSRn+F2lIkJ8
	8RM44IMVMyniRGrMQqjiFgkutvq1qj8t4tbTQX2L9Eu5eUVs9WdtfnStSFp4SAr6Lsfx8xmJI6h
	kFgo0gbvZxV7/6J4rmQbHs+WzSQUW//7ULKoHnSHM/sI+ZRSQJblJN19HramdBQc8t0PDJPAut7
	Ls2URusl8KqVVsQ1TASGGO1683rSoZggaHDLO4ZxD/rsjB7dtEM+fic+sEY22lyQC4xgMXhueXg
	l61s=
X-Received: by 2002:a05:600c:b86:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb55a67c61mr134469755e9.26.1794679068535;
        Sat, 14 Nov 2026 09:57:48 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl. [109.243.65.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb68c00b10sm14350715e9.0.2026.11.14.09.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 09:57:48 -0800 (PST)
Message-ID: <a5170ee5-ccf6-4f19-8ecf-1bc82e3d54d1@gmail.com>
Date: Sat, 14 Nov 2026 18:57:46 +0100
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
Subject: Re: [PATCH] RISC-V: KVM: Order IMSIC VS-file write before releasing
 vsfile_lock
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>,
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261023142550.148604-1-oleksii.kurochko@gmail.com>
 <CABBgwmuBBbyBytwRBTeAqF=0c1m+TFK8E3yPopGNQAsrMFO2vg@mail.gmail.com>
 <7e634bef-6d23-4a57-b3e6-b5585045ca19@gmail.com>
 <CAAhSdy2cL6u_pAinYFU64nfqespQU+2x3GTeiqvjFUbJyYLLMA@mail.gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <CAAhSdy2cL6u_pAinYFU64nfqespQU+2x3GTeiqvjFUbJyYLLMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/14/26 2:35 PM, Anup Patel wrote:
> On Fri, Nov 13, 2026 at 11:49 PM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
>>
>>
>>
>> On 11/13/26 9:00 AM, Anup Patel wrote:
>>> On Fri, Oct 23, 2026 at 7:56 PM Oleksii Kurochko
>>> <oleksii.kurochko@gmail.com> wrote:
>>>>
>>>> kvm_riscv_vcpu_aia_imsic_inject() writes the interrupt identity to the
>>>> SETIPNUM register of the vCPU's IMSIC VS-file while holding vsfile_lock
>>>> for reading. The lock keeps the VS-file from being switched under the
>>>> injector: kvm_riscv_vcpu_aia_imsic_update() and
>>>> kvm_riscv_vcpu_aia_imsic_release() take it for writing to move the vCPU
>>>> to a new VS-file or to the SW-file, then read and clear the old VS-file
>>>> and free its HGEI line.
>>>>
>>>> On RISC-V, writel() is followed only by mmiowb_set_pending(). The
>>>> trailing "fence o,w" is deferred to spin_unlock() by the mmiowb()
>>>> tracking, and rwlocks don't take part in that tracking:
>>>> queued_read_unlock() issues just "fence rw,w" before the AMO, which
>>>> doesn't order device output. So the SETIPNUM write can still be in
>>>> flight after another hart has observed vsfile_lock being released. If
>>>> the old VS-file is read and cleared before the write lands, the
>>>> interrupt is lost. If the HGEI line has already been handed out
>>>> again, the interrupt ends up in another vCPU's VS-file.
>>>>
>>>> Add an explicit RISCV_FENCE(o, w) after the write to the VS-file, which
>>>> is what spin_unlock() would issue via mmiowb().
>>>>
>>>> Fixes: db8b7e97d613 ("RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC")
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> ---
>>>> Why RISCV_FENCE(o, w) and not mmiowb():
>>>>
>>>> - Since the mmiowb() rework in v5.2 (e.g. commit 60ca1e5a200c
>>>>     ("mmiowb: Hook up mmiowb helpers to spinlocks and generic I/O
>>>>     accessors")), mmiowb() is an implementation detail of the spinlock
>>>>     code. Explicit invocations were removed from drivers by commit
>>>>     fb24ea52f78e ("drivers: Remove explicit invocations of mmiowb()") and
>>>>     from the documentation by commit 915530396c78 ("Documentation: Kill
>>>>     all references to mmiowb()"), so adding a new direct caller would go
>>>>     against that.
>>>>
>>>> - RISCV_FENCE(o, w) states exactly the ordering needed here (device
>>>>     output before the store that releases the lock), which is fine for
>>>>     arch-specific code, and it is the same instruction mmiowb() expands to
>>>>     on RISC-V. wmb() ("fence ow,ow") would also work but is stronger than
>>>>     required.
>>>>
>>>> Scope: this only orders the write before the lock release. Whether a
>>>> write that is already in global memory order is guaranteed to have
>>>> taken effect in the old VS-file before kvm_riscv_vcpu_aia_imsic_update()
>>>> or kvm_riscv_vcpu_aia_imsic_release() reads and clears it is a separate
>>>> question, see https://github.com/riscv/riscv-aia/issues/172. If it
>>>> isn't, these paths will also need to drain the old VS-file, and such a
>>>> drain depends on the ordering added here.
>>>> ---
>>>>    arch/riscv/kvm/aia_imsic.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
>>>> index f17dc559a709..807bb73a129a 100644
>>>> --- a/arch/riscv/kvm/aia_imsic.c
>>>> +++ b/arch/riscv/kvm/aia_imsic.c
>>>> @@ -1056,6 +1056,13 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
>>>>
>>>>           if (imsic->vsfile_cpu >= 0) {
>>>>                   writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
>>>> +               /*
>>>> +                * rwlocks don't participate in mmiowb() tracking, so order
>>>> +                * the write to the VS-file before releasing vsfile_lock,
>>>> +                * i.e. before the vCPU can be moved off this VS-file and
>>>> +                * the VS-file read and cleared.
>>>> +                */
>>>> +               RISCV_FENCE(o, w);
>>>
>>> Another fence after every writel() is a big hammer in the path.
>>>
>>> If the intention is to have correct contents when VS-file is read then
>>> better place to add a fence is at the start of imsic_vsfile_local_read().
>> Thanks for the review.
>>
>> I don't think a fence in imsic_vsfile_local_read() helps here. The
>> problem is on the writer's side, and imsic_vsfile_local_read() runs on
>> a different hart.
>>
>> The SETIPNUM write is done by whichever hart calls
>> kvm_riscv_vcpu_aia_imsic_inject(), which can be any CPU (irqfd,
>> ioctl, ...). imsic_vsfile_local_read() runs on the old vsfile_cpu, via
>> the IPI from imsic_vsfile_read(). A fence only orders the accesses of
>> the hart that executes it, so a fence on the reading hart can't make
>> another hart's MMIO store land.
>>
>> Without the fence, this can happen:
>>
>>     hart A (inject)            hart B (update/release)    hart C (old
>> vsfile_cpu)
>>     read_lock()
>>     writel(SETIPNUM)
>>       (store still in flight)
> 
> Over here the MMIO write targets hart C IMSIC
> 
>>     read_unlock()
>>                                write_lock()
>>                                switch VS-file
>>                                write_unlock()
>>                                IPI ------------------->
>>                                                          fence  <-proposed
>>                                                          read+clear VSfile
>>                                free HGEI
>>     SETIPNUM lands: the interrupt
>>     is lost, or ends up in another
>>     vCPU's VS-file if the HGEI was
>>     already reused
>>
>> Hart A's unlock can become visible before its SETIPNUM write has
>> reached the IMSIC, because read_unlock() doesn't order device output.
>> Nothing that hart B or hart C does afterwards can wait for that write.
>> Only hart A can hold back its unlock until the write is ordered, and
>> that is what the fence o,w after writel() does.
>>
>> With the fence:
>>
>>     hart A (inject)            hart B (update/release)    hart C (old
>> vsfile_cpu)
>>     read_lock()
>>     writel(SETIPNUM)
>>     fence o,w
>>     read_unlock()
>>                                write_lock()
>>                                switch VS-file
>>                                write_unlock()
>>                                IPI ------------------->
>>                                                         read+clear VS-file
>>                                free HGEI
>>
>> The SETIPNUM write is now ordered before the unlock, so it is also
>> ordered before everything hart B does after taking the lock, and,
>> through the IPI, before hart C reads the old VS-file. It can no longer
>> arrive after the read or after the HGEI is freed.
>>
>> About the cost: this is the same fence that every writel() under a
>> spinlock already gets. On RISC-V, writel() only sets mmiowb pending and
>> spin_unlock() then issues "fence o,w". We need it explicitly here only
>> because vsfile_lock is an rwlock. It runs once per injected MSI, and
>> only when the vCPU has a VS-file.
> 
> I am still not on-board adding a barrier in hot-path. Also, any barrier
> we add must be paired with a barrier else where with proper comments
> so this single barrier anyways does not satify this requirement.

Oh, right, I missed that.

> 
> Instead of this, I think a much cleaner approach is to convert vsfile_lock
> to raw_spinlock_t. The current vsfile_lock being a rwlock_t is create other
> issues as well [1]. This will also allow us to use writel_relaxed() in the
> kvm_riscv_vcpu_aia_imsic_inject() since raw_spin_unlock() will take
> care of draining the write buffer.

Totally agree, raw_spinlock_t will work here and will be cleaner.

> 
> I will post something along these lines.

Thanks!

> 
> [1] https://lore.kernel.org/r/20260925155116.465203-1-andrew.jones@oss.qualcomm.com

~ Oleksii
