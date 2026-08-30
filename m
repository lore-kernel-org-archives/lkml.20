Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AE532ED58
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788129014; cv=none; b=daZAm3VvUzvKvIDiESBj07w2gJyvvhrscA7ZhDwA4ywzN/17Oyrw9tyiVFStCuSxIAWcVVX3RxrxoiAhUDnNUda6GNzh8/YDHIaFZt7RCLYKxoGnRPhibJZX1rAyPwWErHFcotOPGOEFMsEsP4FXZBdkXQX8c+4SJRxtoeZpFIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788129014; c=relaxed/simple;
	bh=i9beXtDBgHIuY/qahGCuMkyAQtS6KVIx1rZO39AY9PU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=chBJaDasEkusgXFL6863DWl8ACo4URvuLHyV1DfqFT5igFnNE+vlYae1rIb2PtcQBm2BnyayPEpg26q7Jc+TqKeJyCpAkGolCl0gnl+Rn+XCS/9EuUOqsQt+EmVO5xUBjwMXjOQ8loB5gVoN65VBi8J8/B9UgW/gXLd52uLN4lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso30808195e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788129011; x=1788733811;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDJve5c7BbhYquX3/va28qHfs9qVxgaGxAO1E5yp37M=;
        b=qAr0cTm45/7oDXYrEcPWF2UJyRMInoToezLlSiypLYjmsYZdJVdoJ7y3fjjax5o5Jc
         LezMWpR/yA9aJhczgcvvlPdFZaDdXrzFO5aDKQ8U8YxWZ4uii3v4nRW+us0x2iYWUjBN
         n6fSrCQgucBpEH5Ca+Kfje1DybjkBcObU75xTN9BPGVg67o5EjWXBvmGKwLNJ8QJ9jn6
         8f//5aaghSDHQDnu5m6bwaGtWBFR+nEUbgaFi+TbihS0cWoxoW/O+vVjuWg5CdbgCVKU
         Wz2jGdmFlXPhHBjV+/rJDQQBF9AjERldoOUBfFFl89LhK/RvL9nrhtAOn3HOmclm3ihR
         eWFA==
X-Forwarded-Encrypted: i=1; AHgh+RojzVglQ2zI24TW38sbNVOeNCYNbgXhvuUPERjS46CynnDMmQeXg4okNBjk2kJdNZT/hjTV/njN2YG6uhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mdw8uSX4hYcx18mVY0tR/uRkfsXxqj8aR89RrCpKSDRMVoZUdd
	0U2e2vSrrRJHR2CSqE0XI1h8zme8/fEmT1IgnoLHcvvCdWsv7tzvupD2
X-Gm-Gg: AR+sD11s2tJ2MOOqLVT1RyulirxOsT31f779JiMUdWSFBEkEbCGO/NAYK1rSaY7uCBk
	bsXOmnixqGy6G4NNQBDZm1heSzoST/BDeku9U4tBNgyoavwCdxZEKrLHe2KdprEAHfekehPiFmM
	RB9/Xrsvu3eiacKRQK421VsLG5fHBof4Lzau3zWjNoSb32UNqby9XWpriKZpob+Dck4qY+uV9/I
	OPlLR48dLqDi60Tn44D7tP/9cQAZ9hqJ7ff+/OhZrmrVsBVKscWS6tOvMJpAaLzpEqd2XBNVgLO
	Ce+kvhjK8NmiiBfIgMgp3PD2gmBxYeNulce4rlmhANkyb5xvCCEfhWD2PVk9ykU6MktGE6x4d7P
	ghwBeUn2SATUuVpeZH5YX8ZpGHYFB8ysW3swSfdNiFiE/2NLbo3ZsdfwYT8tTLO94+TEPzL9hUe
	olHOQ3vZF7w6hY4zDCgOXTqjKVawvfWvEoawv7r2MLmpTapyb4D6UeGwzSajY2R8m4Pdaf1dwoK
	DNOUUhdbedwRxnNeXCc9Q==
X-Received: by 2002:a05:600c:468e:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cd88f6b91mr769105e9.10.1788129010620;
        Sun, 30 Aug 2026 15:30:10 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd8148fbdsm9351575e9.3.2026.08.30.15.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 15:30:10 -0700 (PDT)
Message-ID: <1d56144d-6987-40c1-ac02-b15333db121e@grimberg.me>
Date: Mon, 31 Aug 2026 01:30:08 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvme-tcp: pin io_cpu to submitter cpu
To: Saravanan D <saravanand@crusoe.ai>
Cc: linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 linux-kernel@vger.kernel.org, Nilay Shroff <nilay@linux.ibm.com>,
 Daniel Wagner <dwagner@suse.de>
References: <20260820083634.71689-1-saravanand@crusoe.ai>
 <56829bb7-2067-4794-88ec-7ddac2d3f250@grimberg.me>
 <20260823174348.40236-1-saravanand@crusoe.ai>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260823174348.40236-1-saravanand@crusoe.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/08/2026 20:43, Saravanan D wrote:
> On Sun, 23 Aug 2026 00:20:21 +0300 Sagi Grimberg <sagi@grimberg.me> wrote:
>> Can you share a concrete example?
>> 1. lscpu
>> 2. grep -r ''  /sys/block/nvmeXnY/mq/*/cpu_list
>> Also, what would be the VMs cpusets on such a server?
> Very grateful for your review and suggestions.
>
> Concrete example from one of these hosts, where there are more cpus than
> the io queues NVMe-oF targets offer.
>
> lscpu (trimmed): AMD EPYC 9654, 2 sockets, 2 threads/core, 384 CPUs
>    NUMA node0 CPUs: 0-95,192-287
>    NUMA node1 CPUs: 96-191,288-383
>
> Each nvme-tcp controller exposes 128 io queues (queue_count 129) against
> 384 CPUs, so blk_mq_map_queues() folds three CPUs into every hctx. cpu_list for the namespace's path device, around one tenant's boundary:
>
>    hctx67:  6, 7, 198
>    hctx68:  8, 9, 200
>    hctx69:  10, 11, 202
>    hctx75:  22, 23, 214
>    hctx76:  24, 25, 216
>    hctx113: 199, 201, 203
>    hctx114: 205, 207, 209
>    hctx115: 211, 213, 215
>
> Two VMs are live on this same shared controller:
>    VM A cpuset: 8-23,200-215
>    VM B cpuset: 104-191,296-383
>
> VM A owns 200-215, so hctx113's group {199,201,203} has 201 and 203 inside
> VM A and 199 outside it. The connect time pick can select 199 as that
> queue's io_cpu, so VM A's I/O through hctx113 runs its socket work on 199,
> outside its cpuset for its entire lifetime. Adoption will pull it back
> to 201 or 203 when VM A submits I/O.
>
>> In an ideal setting, the nvme controller would support $NR_CPUS worth of
>> io queues [...] map cpu-queue with perfect alignment.
> Right, and that is the case we cannot reach here. The controller tops out
> at 128 io queues while the host has 384 CPUs, so the three to one folding
> is unavoidable and some groups end up straddling a tenant boundary.

Yes, most if not all nvme-of subsystems won't let the host open so many 
queues.

>
>> I think that for controllers with low queue count this approach would not
>> work very well. Plus the cpu<->queue mapping by the block layer is not
>> guaranteed to align with how workloads/VMs are scheduled on the host...
> Agreed on both. A queue whose cpu group straddles two busy tenants is only
> partially addressed, since adoption then selects which tenant hosts that
> shared queue rather than removing the sharing. It fixes the common case
> where cpu group sits within one VM's cpuset and the case where only one
> tenant on the queue is active, and it is strictly better than the connect
> time pick, which chooses that queue's io_cpu before any I/O and can land on
> any member. Solving the common case also lets the control plane, which owns
> the VM cpusets, affinitize each VM's virtio-blk submitter threads away from
> CPUs whose mapped queue would land socket work on a neighbor.

I just think that the adoption approach has downsides in many other 
workloads.
I wouldn't categorize your use-case as the common use-case. Not to say 
that it
shouldn't be solved.

>
>> To me the problem statement sounds to me like you are looking to get a
>> "private" controller (set of IO queues) for each VM. [...]
>> nvme connect -t tcp -a <traddr> --cpu-groups=0-63,64-127,128-191,192-255
> A private controller or a cpu-groups partition fits workloads where the CPU
> partition is known and stable at connect time. Our production constraint
> does not afford us that luxury. The nvme-tcp controllers are host wide and
> shared, the tenant VMs are namespaces under one multipath subsystem, and the
> control plane creates, destroys and bin packs VMs continuously on these core
> dense compute hosts. A cpu-groups mask fixed at connect would be stale as
> soon as the tenant mix changes, and re-partitioning would mean reconnecting
> a controller that many live tenants depend on. We also cannot give each
> tenant its own controller, because the overhead on the host adds up and we
> run the risk of exceeding the target's connection limits. Adopting the
> submitting CPU needs no per tenant configuration and follows the tenant
> churn on its own, which is why it fits a long lived shared connection whose
> tenant set is not known at connect time.
>
> Next the fleet operators who care about VM steal time already steer NIC IRQs,
> NAPI to a dedicated housekeeping CPU pool outside the tenant cpusets, so the
> common network processing overhead Nilay raised does not run on tenant CPUs.
> With that in place the remaining contributor that still lands on a
> tenant's CPU is nvme_tcp_io_work, which this patch pins to the submitting
> cpu and keeps within the tenant's cpuset.

I agree with you that queue io_cpu selection at connection time is too 
limiting.
Perhaps we can have each nvme-tcp queue expose a sysfs entry to set the 
io_cpu?

This way, its up to a control-plane to mangle with the queue io_cpu 
setting at
any point it would like.

Something like:
echo $CPU > /sys/class/nvme/nvme0/tcp_queues/$QUEUE/io_cpu

I am just trying to think of a way that will allow some control plane to 
set it exactly
as it wants, without the guessing part...
