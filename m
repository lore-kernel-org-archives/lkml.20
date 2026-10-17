Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98922391E74
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792204491; cv=none; b=qsfutOXEcnzGYmPK3dqCGXdP/5Gfa4eDgM5sKD8W/NCwtqBMVbpnMh6OLZJ5Pc/RYRbSYFxtUeYh/58hrm3Cp0bBlR9zvsosHRLksazm8PuLKyh5QHkFKb6ZN2Qf4q2/gkWvUH3uuq6Ou1YyLixHLek2cfxFGzr/dvD1dQMmXmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792204491; c=relaxed/simple;
	bh=d9ZRRvSR4mnbRvLXvHuu/oEYPNtyrfml0HfGAQs+uGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kE8bZ8ayCqcQEkgIV6LMac3dUokvx4b6vMOIhl6NWDXzhlLA000Xwi4X8DE1HmF5ly8y42QCGUANC4DX6w10Fo0IlglMu7658XqshF+kTQCxXI+5FB0zhbvGzkKZgpiVovaB51ifumvOjQmV+JP8sEXYgbOADVP5kEmryPhodbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=Fj1K5h1b; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="Fj1K5h1b"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so1294021eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1792204489; x=1792809289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZROtWBtn7Em4KQUcWsy9pq8PmRRT29SnOSczBb7KaLk=;
        b=Fj1K5h1b5915rC1MaqNhUZtKSF7RYfrilGCDNfYhYAD7ZY4N5L4xIo7/b5JyLc2awl
         Az6vvmC5absOlPzVgDvAb/iwY78Ja2phW9f5+gXYYJx2bTshApaf50WEM/HdQfXCB1WH
         /PH4TRyH99m1O3B5WBsO/oW5mtc9XouLIw7xqClx9cFgoIzwBxFFukJkGm6B1d5akHn8
         Mmibzqr5QBLypwywHJ/pBjPguLuL3gboNOcaxL6DUMZSfvUglu8h6rcTfQrHgzaqI6MO
         KzYmw02FDs5LPP2x8QkmKJegW6HrfUaqso8AlZlh4IkU15oV7Oejj1u+PWI6eiZEAufh
         U32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792204489; x=1792809289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZROtWBtn7Em4KQUcWsy9pq8PmRRT29SnOSczBb7KaLk=;
        b=SL6P3I4tIxDPnFdl2tz2fA9YOA8oUp4meuwwbvXJ1A9maM9s8I5p4boObpUsftfhug
         Q0vK+oYOzg5LZSpy9eCS6PPqa2HuZO/dnEFGmgOf+d5MBqJqFfhvnp48PKCkMv3DfoOh
         w8rOj4GVHBVsX86p0SFmMfRVfpNCuUMOpxlnAnq6h1mKxB1WuyVVVNAne1cA1lC5GeCv
         31Tp9akm6+x70jd2Ecuy+yzGh0AdmQ7lXBZThlbVIerRGOG2WZ+kEsKOVTKM0hcEY5Vz
         1krDXRHDNLk/c3M/Uq6dV4ZhW3ftx6tE8kJHwsdU52HZL9E0DAiJ+qQEGRd54Prtq9VX
         R2ew==
X-Forwarded-Encrypted: i=1; AKwUvBwpSlqNg9AxQnDjoadTpygiNVvu53kT0QokEXUqvd1KRTj0odO+P64IpRSdaxGJDSh1DawsZ0svaqNTyho=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJvbrS8UtOe8R6jKfwLnRwqysJlt1GHUivJvhRgggkF750gEgu
	G1lgJgPgKXUaN+QIsrtB1XvmGPawYxHRO8BZcpkkLedjfPM9ghNpyY49zDwc0GSukP4=
X-Gm-Gg: AYBFou3td4cjY+dNhQtZQmvYS/V8/oGHzaGmJr6TBdzsEd1belRhN92TXYVzfSjiCqN
	DucQ/nn1yF3Y3x4K36jUo3QMzigiAKF15z+hb+tbc4o0pYqs5M1RC94/QYw75ZdClvnDV/zfMig
	zEFsXadqPdzs1czZtDCpCuYJOq+/pBptBOILlXuX0KTsBdXGebhM8kVHNHadSWehZU26Q9A+r4H
	m4jEUevul8XDH56g86KL2gXyZDGFHzeJ2BNXAHTgfCZiQCy90QreZK985oZJcJwQVXjL29kINjO
	ZMTP9+4fZfIK0awimmMRzvHTwhhjhrF6mOs0SPzIDcFPOtNY7mlL4RWYxyh+lFyisV2eUjAnTrD
	6yOKx7jdzKv/DxRt3KiiXLG1DPfdYU1Y083FkKp8icYOuMMuYmy/MDe4Qebv1DwVPJn84OeBN9P
	8SdsegWRng/ZmzhNgBGulFXNgI9zyLDdTiDN5Fh+gAzF6dJGA7jq2Sy4OWMLjlUJ1zV9M6QZlmq
	Q3S8PWQV6Dql/x3ExbhQR11i1bUCmAplv+A8uM1tQuU
X-Received: by 2002:a05:7301:2727:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-361a1865981mr2187452eec.9.1792204488444;
        Fri, 16 Oct 2026 19:34:48 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([67.208.231.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm11007439eec.7.2026.10.16.19.34.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 19:34:47 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Saravanan D <saravanand@crusoe.ai>,
	linux-nvme@lists.infradead.org,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	dwagner@suse.de,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai
Subject: Re: [PATCH v4 2/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Fri, 16 Oct 2026 19:34:38 -0700
Message-ID: <20261017023442.63620-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e3bd727d-869b-470d-84dc-fccae61ca499@linux.ibm.com>
References: <20260927070925.47209-1-saravanand@crusoe.ai> <20260927070925.47209-3-saravanand@crusoe.ai> <51a451fe-fdf6-4e8f-afbd-c595f3c6de2c@linux.ibm.com> <20261009020145.64651-1-saravanand@crusoe.ai> <e3bd727d-869b-470d-84dc-fccae61ca499@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/11/26 1:27 PM, Nilay Shroff wrote:
> On 10/9/26 7:31 AM, Saravanan D wrote:
[...]
>> Annotating io_cpu with __guarded_by(&ctrl->io_cpu_lock) would need
>> context_unsafe() around each of those hot path reads, so I'd rather
>> document the lockless readers next to the field. Happy to add the
>> annotation if you prefer it.
>
> Yes, reading io_cpu locklessly in the I/O hot path is intentional. However,
> to avoid KCSAN splat, we should mark read and write access with READ_ONCE()
> and WRITE_ONCE() respectively.
>
> Unfortunately, the Clang context analyzer cannot currently model a lock that
> serializes writers while allowing readers to access the protected variable
> without holding that lock. Annotating io_cpu with __guarded_by() would therefore
> require us to annotate lockless reads with context_unsafe() or data_race(),
> which I think we'd prefer to avoid.
>
> I suggest introducing two helpers: one to read io_cpu and another to update it:
>
> static inline int nvme_tcp_queue_io_cpu(struct nvme_tcp_queue *queue)
> {
> 	return READ_ONCE(queue->io_cpu);
> }
>
> static inline void nvme_tcp_queue_change_io_cpu(struct nvme_tcp_queue *queue,
> 		int cpu)
> 	__must_hold(&queue->ctrl->io_cpu_lock)
> {
> 	WRITE_ONCE(queue->io_cpu, cpu);
> }
>
> All readers could then access queue->io_cpu through nvme_tcp_queue_io_cpu(),
> while all writes would go through nvme_tcp_queue_change_io_cpu(). The __must_hold()
> annotation on the update helper would allow the Clang context analyzer to verify
> that callers hold io_cpu_lock when modifying io_cpu, without requiring annotations
> for the intentional lockless reads.

Agreed. v5 adds both helpers as you wrote them. Every reader goes
through nvme_tcp_queue_io_cpu(), and the two writers, the cpu
selection at connect and the sysfs store, go through
nvme_tcp_queue_change_io_cpu() with io_cpu_lock held.

[...]
>> (3) The user managed side has no unbound state. A -1 written by the
>>      user is the same state as a queue the driver has not bound yet,
>>      so managed reads 1 and the next connect binds it again. Also,
>>      nvme_tcp_wq is a per-cpu workqueue, so an unbound io_work runs
>>      on the cpu that queued it rather than on a cpu chosen by the
>>      workqueue.
>>
> May not be true always when nvme_tcp_wq is inited with wq_unbound. We
> have a module option using which we could toggle this behavior.

You're right, that holds only for the default per-cpu nvme_tcp_wq.
With wq_unbound the workqueue picks the cpu as you describe, and
nvme_tcp_set_queue_io_cpu() leaves every driver managed queue unbound.
A user written io_cpu still selects the worker pool for that cpu, so
how closely io_work follows it depends on the affinity_scope of
nvme_tcp_wq. With affinity_scope=cpu and affinity_strict=1, io_work
runs on that cpu, provided the cpu is in the cpumask of nvme_tcp_wq.
With the default cache_shard scope, io_work starts on a cpu in the
same shard, and the scheduler may move it afterwards.
v5 documents this in the ABI entry.

[...]
>> 	mutex_lock(&ctrl->io_cpu_lock);
>> 	old = xchg(&queue->io_cpu, cpu);
>> 	set_bit(NVME_TCP_Q_IO_CPU_USER, &queue->flags);
>> 	if (test_and_clear_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags))
>> 		atomic_dec(&nvme_tcp_cpu_queues[old]);
>> 	if (cpu != WORK_CPU_UNBOUND &&
>> 	    test_bit(NVME_TCP_Q_ALLOCATED, &queue->flags)) {
>> 		atomic_inc(&nvme_tcp_cpu_queues[cpu]);
>> 		set_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags);
>> 	}
>> 	mutex_unlock(&ctrl->io_cpu_lock);
>>
>> Does that work for you?
>>
> This looks good. However, I wonder why we need to check NVME_TCP_Q_ALLOCATED
> here? If the user can update io_cpu only while the queue's sysfs directory
> exists, and that directory is created and removed along with the queue's
> allocation and teardown, shouldn't we be able to drop this check?

Agreed, v5 drops the check. nvme_tcp_free_queue() removes the
directory before it clears NVME_TCP_Q_ALLOCATED, so no store can run
on a freed queue. The SET backstop stays after the removal, for a
store that lands between the queue stop and the free.

Thanks,
Saravanan D.
