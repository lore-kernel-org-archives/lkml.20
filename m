Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4793A310784
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791511319; cv=none; b=aPzWLP85yWWcOfJ/M3PZASwgyD8sZAdWNkKuEzq/0ynrUe+rdk7bP6rIfKHUg88tVWSkmqXv7mETx44LyXsYpX6KbfHLC+LBtD91FOBdvkRxV+6w/B8qX1qI8DWofyDHiTx00pytMDEP36+MW5bKv3DL9MH9yoGMjnmKzeOjy84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791511319; c=relaxed/simple;
	bh=hneMsRg+nwySOFK2xbkIaYui9f6H8KGYNCEeXXDtTnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZ9jHbh85F5XiUWV3iqoLQ2/jq+Wv7xbaoirYIhVVDTMXYNF0XwTuOsjjJPPi0JGVJiygsTpC/Ns2i+0VgRa9SLEhC66ppgz39nNdsYKAylmh1SNM8aTVdBHLY5Z6zi97SP1Ww7flDe6j1nNj+eTWrycaYvyqMdt92vel/3WJsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=BmCdgPdY; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="BmCdgPdY"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-34bb8b31647so9164497eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1791511317; x=1792116117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FK9q3mI/smjlpXK27adCfd32tCuGO0ujIRGbl2MfJLU=;
        b=BmCdgPdYXBimIVtROG6cC+/1z1A2dNp9AX9j0mnKJUN6yRldICkkmrlb1xpp+dYBRm
         CV9B2LVGDIKB55dxi1pPFttKAVOdqxhClHiCv8gaYWUu7Ate8g8RNH3AkNcHK9Kgr4u7
         g8O3IyO7DpGS00b2VTmjEZDtiX7nTNyBIrvrxWeKMLw+yEama/vpUlM3X7jvMDPy/nnW
         mHS9XPGedPBByQV8MjxV4aGf4l2TpfkrJqEMHEEqpNXy51uOlCpm5b/yLwOA5V3VAo3u
         JX9MzbvXleKjVMJEfbKdk+ERfBxuoRdZo9Pfj+L0EiGnOhUPJdf0unfHpHvlCzdTTSKp
         tgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791511317; x=1792116117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FK9q3mI/smjlpXK27adCfd32tCuGO0ujIRGbl2MfJLU=;
        b=R7QXBVLxTEgSUy4u9TxCkDfOOogfyR/nF1g8l9X/R0S9V/Nejt6kgbg4JmUuiCe041
         k+HIpI7upvl84b9pD1RnkmSOJprF6lkCli43f+g9YFvEIUVSkFpK0VQWNZ9VuZrL/czr
         r43dQBn77nQGONILavaNMO56/t9GmSlg28HdQiLLZxiptTSJnkCUZf2f3frw8UaDs231
         uhR3ZnT34RmQZheCFXViQPLvnF776zxs97p1t+mfmkIv89miPmlz3HnmJGbwl9Dn4Dbq
         GxlyMQth/6CjnObFMJ1pM3uD981VBodiogU3LELmx0MLykV/IV1bh2Bzgy+53ScQr0fZ
         rhwA==
X-Forwarded-Encrypted: i=1; AKwUvBwLemr+hfoZ+i+x/3i8auI05F+yHzuOd8ZGfPkfHGShA8XxKwMMyU7claO907iZdypE9sthhw7xF9X59Vg=@vger.kernel.org
X-Gm-Message-State: AFuF++khmRhIuq1jPMR1EvgfSdA/hxbk1WlZCxavY3iwIXw22PDMN8b+
	Bavj28uq6A6zhfLSr8Yu3YnITJmdHNctQ+M4strdACLrjzXpRkR/7MvtOrmn27jadtcXT9D09+s
	QIPp7SSo=
X-Gm-Gg: AYBFou0vbHKOB0yvGRGGHFvnxbbBxOrpPFhqZUcYiqCoK1wyG/mnQFzdGRaVKcQEoA5
	yPBnjIC6jlyfm2WguxG+OsSiO9A1f7wV1xMIdQpzZMqqxlGyNuu+oFUsVItk1ssR2SsVzA5fpL2
	yFqRk8wEeyGIVozpsVEJRspbZRrdyuUP3bMywCCoi/oZWHt/nx7JjNk4fKSaqAN90wZPd8venBo
	rfW0tRdFS49F4L1D+9bHxOrhvfii5+d8h6jN6cSkh0K4+LOYt53gL7R4/Q/+fWwqZY4Jqk+I9/s
	IOwyHqawTQq+0LwLZcoo0SU4NQ/OPbC5qpiFi8STjN7ImrsBRWgzlUqtQSPJhY6rCLt2iecyZ70
	09Qk1ty+6gzC8aTi7s6TCJcbGBDJF2FDTi4mjzXPNBVBVlqyZPeCYhgFOz7yJVP/pCc28J2gUqA
	OSefUDx4NBWejJc9udwIZLQMcvW+L780+pNjN8F126jMCglpKpTCAj2DT4WvenjUOAB9GsiNRcQ
	8kkZIkjCJEQ2mSj0IGnZn4V7Hs/8uzCJ6/z9vpeO5qj
X-Received: by 2002:a05:7301:152f:b0:351:7dc1:7aba with SMTP id 5a478bee46e88-3537e12becbmr729997eec.32.1791511316923;
        Thu, 08 Oct 2026 19:01:56 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([67.208.231.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca329d9sm2120931eec.5.2026.10.08.19.01.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 19:01:56 -0700 (PDT)
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
Date: Thu,  8 Oct 2026 19:01:42 -0700
Message-ID: <20261009020145.64651-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <51a451fe-fdf6-4e8f-afbd-c595f3c6de2c@linux.ibm.com>
References: <20260927070925.47209-1-saravanand@crusoe.ai> <20260927070925.47209-3-saravanand@crusoe.ai> <51a451fe-fdf6-4e8f-afbd-c595f3c6de2c@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/8/26 2:45 AM, Nilay Shroff wrote:
[...]
>> The queue directories register on the first connect and persist while
>> the queues cycle across reconnects, so a write can arrive while a
>> queue is torn down. The io_cpu changes and their accounting therefore
>> serialize under a controller level lock rather than the queue lock,
>> which is destroyed with the queue, and the controller teardown waits
>> for the last kobject release before the queue array is freed.
>>
> I understand based on your requirement you may want to persist io_cpu
> changes (when managed by user) during controller reconnect. However
> in case num of queues changes after reconnect (assume it's 32 at first
> connect but after controller reconnects it's reduced to 16) keeping
> those 32 queues entries under queues/<qid>/ looks bit odd and not
> correct. I'd expect queues entries under queue/<qid>/ to be also
> adjusted based on the controller queue count.

Agreed. In v5 the queue directory follows the queue's connected
lifetime. nvme_tcp_alloc_queue() adds it and nvme_tcp_free_queue()
removes it, so queues/<qid>/ matches the queue count after every
reconnect, as blk-mq does for mq/<n> when nr_hw_queues changes. A user
assigned io_cpu is kept in the nvme_tcp_queue, which persists across
reconnects, so it applies again when the queue comes back. A write
while the controller is reconnecting fails with ENOENT.

[...]
>> @@ -171,6 +173,11 @@ struct nvme_tcp_ctrl {
>>   	struct delayed_work	connect_work;
>>   	struct nvme_tcp_request async_req;
>>   	u32			io_queues[HCTX_MAX_TYPES];
>> +	/* serializes io_cpu changes and their nvme_tcp_cpu_queues accounting */
>> +	struct mutex		io_cpu_lock;
>
> The io_cpu_lock protect updates to queue->io_cpu and as we now support clang
> context annotations for NVMe host driver, I'd suggest you annotate the
> queue->io_cpu with __guarded_by(...) so that clang context analyzer can
> validate each access to queue->io_cpu. Furthermore, I see that queue->io_cpu
> could be concurrently accessed from both control path and I/O hotpath. So how
> would we protect it while it's being accessed from I/O path and concurrently
> updated from sysfs path?

The I/O path reads io_cpu without the lock by design, and a stale read
is benign. Each queue_work_on() call reads io_cpu once, so a call that
races with the store queues io_work on the old cpu one last time and
later calls use the new one. io_work is a single work item, so it
never runs on both cpus at once. The inline send in
nvme_tcp_queue_request() only compares io_cpu with the current cpu and
is serialized by send_mutex. v5 marks the lockless reads with
READ_ONCE() and the writes with WRITE_ONCE().

Annotating io_cpu with __guarded_by(&ctrl->io_cpu_lock) would need
context_unsafe() around each of those hot path reads, so I'd rather
document the lockless readers next to the field. Happy to add the
annotation if you prefer it.

>> +	unsigned int		nr_queue_infos;
>> +	atomic_t		qinfo_refs;
>> +	struct completion	qinfo_release;
>>   };
>
> I think the qinfo_refs and qinfo_release are added for tracking the
> lifecycle of nvme_queue_info object. But do we really need to do
> that ?
> When a nvme_queue_info->kobj is initialized/added, its parent kobject
> is referenced by the kobject infrastructure. Therefore, as long as a
> queue-info kobject exists, its parent queues_kobj remains alive, which
> in turn keeps ctrl->device->kobj alive. This should already prevent the
> controller object from being released while a queue-info kobject still
> exists. Could we therefore avoid maintaining a second qinfo_refs
> reference count and completion? It seems that entire kobject parent
> chain already provides the lifetime dependency that qinfo_refs is
> trying to enforce.

Agreed. With the directory removed in nvme_tcp_free_queue(), no queue
directory outlives its queue, and the kobject release only frees its
own allocation, so the parent chain is enough. v5 drops qinfo_refs,
the completion and nr_queue_infos. Each connection allocates its own
kobject, so a reconnect never reuses one.

[...]
> This look overly complicated. In a simple scheme can't we get rid off
> NVME_QUEUE_INFO_IO_CPU_USER and instead use NVME_TCP_Q_IO_CPU_SET as an
> indicator for differentiating between io_cpu is managed by user or driver?
> For instance,
>
> NVME_TCP_Q_IO_CPU_SET = 1
>      - driver has selected a specific io_cpu
>
> NVME_TCP_Q_IO_CPU_SET = 0 && io_cpu != WORK_CPU_UNBOUND
>      - user has selected a specific io_cpu
>
> NVME_TCP_Q_IO_CPU_SET = 0 && io_cpu == WORK_CPU_UNBOUND
>      - unbound; workqueue chooses the execution CPU and so it's driver managed

I drew your scheme as a state diagram to compare it with v4.

              DRIVER MANAGED          |         USER MANAGED
   (SET=1, or SET=0 && UNBOUND)       |     (SET=0 && io_cpu=c)
                                      |
 connect +--------------------+ store(c)  +--------------------+
 ------->| A  driver chosen   |-------+-->| C  user pin        |
         |    io_cpu=c, SET=1 |       |   |    io_cpu=c, SET=0 |
         |    counted         |       |   |    not counted (1) |
         +--------------------+       |   +--------------------+
           | stop, SET=0 and          |     |
           | io_cpu must be reset (2) |     | store(-1)
           v                          |     |
         +--------------------+       |     |
         | B  unbound         |<------+-----+
         |    io_cpu=UNBOUND  |       |
         |    SET=0           |       |   +- - - - - - - - - - +
         |    also where a    |       |   : D  user unbound    :
         |    user -1 lands(3)|       |   :    not reachable,  :
         |                    |       |   :    see (3)         :
         +--------------------+       |   +- - - - - - - - - - +
           | next connect, reselect   |
           +--> A                     |

(1) A user pin has SET=0, so it drops out of nvme_tcp_cpu_queues.
    When the driver selects io_cpu for other queues and other
    controllers in nvme_tcp_set_queue_io_cpu(), it sees that cpu as
    idle and keeps placing queues on it. v4 counts every bound queue
    regardless of who assigned it.

(2) SET clears at stop. Unless the stop path also resets io_cpu to
    WORK_CPU_UNBOUND once io_work is cancelled, a driver chosen io_cpu
    reads as a user pin after the reconnect and the driver never
    selects a cpu for that queue again. In v4 only the sysfs store
    sets the USER bit, so connect and stop never touch ownership.

(3) The user managed side has no unbound state. A -1 written by the
    user is the same state as a queue the driver has not bound yet,
    so managed reads 1 and the next connect binds it again. Also,
    nvme_tcp_wq is a per-cpu workqueue, so an unbound io_work runs
    on the cpu that queued it rather than on a cpu chosen by the
    workqueue.

The USER bit records who owns io_cpu and survives reconnects, while
SET records whether io_cpu is in the ledger and follows connect and
stop. I'd like to keep both, with USER moved into nvme_tcp_queue flags
as you asked on patch 1. The complexity you point at is the extra
branch in the store, which collapses to a single path with the same
behavior in v5.

	mutex_lock(&ctrl->io_cpu_lock);
	old = xchg(&queue->io_cpu, cpu);
	set_bit(NVME_TCP_Q_IO_CPU_USER, &queue->flags);
	if (test_and_clear_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags))
		atomic_dec(&nvme_tcp_cpu_queues[old]);
	if (cpu != WORK_CPU_UNBOUND &&
	    test_bit(NVME_TCP_Q_ALLOCATED, &queue->flags)) {
		atomic_inc(&nvme_tcp_cpu_queues[cpu]);
		set_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags);
	}
	mutex_unlock(&ctrl->io_cpu_lock);

Does that work for you?

> Other that what sashiko provided in the review feedback, above are my
> few additional comments.

Thanks for the review. v5 also fixes the Sashiko findings.

Thanks,
Saravanan D.
