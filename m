Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB71223323
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788127258; cv=none; b=K0rmhnEefW/TSMUMNcGB0LQ82iSYLJMsiP8RqI+TYt/na9g+8emqXdrlYDPppMqUv3nZkY7Tjl1MqzhtGM0nH+3in93A8Z0E2noVvEYg3qZBYalwm1hEoA1QSgJMw1vJELjWjkdnfRT1VIoy1gtHc327nMeEAuweFrbhXRRnmQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788127258; c=relaxed/simple;
	bh=t+uMmx0z3oOWntBShCwvaNXR9Mt4EE/+f6GGNwBm4VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LIIrdJuGMJQApRHDpn+LaKeKVgghBYxCPPSkf7V6isT0ZQB7x1HozGddbfPYINbO3cL34i4j9YfTwsJOlWwNQOr2CGigXAk5obVd1H0BjcHprCTicl7cBt53GMadEEz83wfInaCEKsOT3jFBq9oO8TuQZuXom3FuZ2dyp8pN1Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so3027535e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788127255; x=1788732055;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VP9Zagw5VoD6qq7csm1mPz96FCjjD0yXgAUiYmmOORQ=;
        b=JPAohK8piN+IkMbx5tSp+8hles+NQKlEO7Py6HQbmZkKwvjQ7gXwvWBuRZd+KEX69c
         tWJoV6wPWS6bQCOQ+TvvNDszC+gMEjrfWqE6YMNYKdcds8Ybaye5B5yQmRXQZaKU5dls
         Peu4ha4inWCPujokTynRvLHXSFfzWQBTf9UCq+/Ysz7e65EjLzKGG1KK9+LxNDYkcm3R
         nNSR1uKdkoIfyoyqhcvTHzS3Tw4dSJoq4rwmsgbCW5fH0mJsSlhnx/eYmY2D6AYsNQjv
         erTR/faSdeB9vgI1ZBtOx87r3X2Xd+cgbZpwiE7ogz5hoZzXdYNHLWZLmIHwLaDnLjcZ
         IKdA==
X-Forwarded-Encrypted: i=1; AHgh+RqYUpQKOq7ESuDaNGs+XRNo2FwccM6LWZvrS5jTVBoXATSarLLwdiLS7D5z13V0ExFbbobUsZ8ZXchlc6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lgUYHoNSdNhUpxa8OTLcp8zGEKneN6uEO+Fa2W2aPVcamRkLWl
	0qukRxmjgmkUF+qSGB2JxsCbp1Tn7BRpW2yP/DsYU0BhA5BeAak6A8TG
X-Gm-Gg: AR+sD13V7Y60IE5gMc9leonXm2kO4V1f7Iv5Q9uPErBdMTCdVPj9cHmWqT/3FwRZ2T1
	dWdEjgX2LZ8UZ9ixWFwmQenvef8jUta0f1jwQSzXzm6pHKZGYQpYxvuwtLB+9Me4sx+cuWEP90F
	/h2n0FNPrmvisG90M0PQAM4qHrl9l2QJ3tgnQfIu03WrQVlUzmnrobnfLBrzPz5R8dOHejCMMy6
	40G8gTVbYundfBXvwYWJ8n0Plr4FgNXA+VZmA5xz2Wr0ahqsk8JzhFF4ZtiNmL/VfOT1QEu1CD5
	dqQBwN1V32xiese4NiwJDGhky3uFvfmOz1MRA/cHKA8Z1wqMF4CD/A4cQqY8dGCCbQ4d6RDHQg6
	WTQqH2K40lbpvuwPNHRjrJb1i1gSeM8e09agatZUPZPMtuCp8Jg9uaVwXQpD2vvgm0XEN+3yY8u
	LfchWbpTT/B+GWtmVtzgjDSyWyd/4Kl2HqG8c0cFmsQqlAaDW7mEHoOgxSmi0UTcKqjQDqkFdrH
	X5f+sgnU2v69+ODofTIkbFkU5wo2cM3
X-Received: by 2002:a05:600c:6088:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49b91c433a4mr343856725e9.11.1788127255220;
        Sun, 30 Aug 2026 15:00:55 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2e9d9fcsm136655095e9.1.2026.08.30.15.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 15:00:53 -0700 (PDT)
Message-ID: <c98fe50c-172a-4e53-a30c-5416c40cb23f@grimberg.me>
Date: Mon, 31 Aug 2026 01:00:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] nvme-tcp: parallelize I/O queue allocation and
 startup
To: Surabhi Gogte <sgogte@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 mkhalfella@purestorage.com, randyj@purestorage.com, adailey@purestorage.com
References: <20260824225648.316962-1-sgogte@purestorage.com>
 <20260824225648.316962-3-sgogte@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260824225648.316962-3-sgogte@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/08/2026 1:56, Surabhi Gogte wrote:
> Similar to commit 2a8513091d2f ("nvme-rdma: parallelize I/O queue
> allocation and startup"), refactor nvme tcp I/O queue setup to use async
> API, combining allocation and startup into a single parallel operation
> per queue. This reduces connection and reconnection setup time when
> there are delays in establishing connections, which is especially
> important for high-core-count hosts.
>
> Key changes:
> - Use async API to facilitate parallel calls for io queue setup.
> - Add nvme_tcp_setup_ctx for propagating errors from async workers.
> - Remove nvme_tcp_start_io_queues() and __nvme_tcp_alloc_io_queues();
>    their logic is folded into nvme_tcp_setup_io_queues() and
>    nvme_tcp_configure_io_queues().
> - Allocate the io tag set before the queues so that the queue range is
>    known, and only set up the reconnect grow case if the queue count
>    actually increased.
> - Serialize the cpu scan and claim in nvme_tcp_set_queue_io_cpu() with a
>    spinlock, as concurrent callers would otherwise select the same cpu.
>    The per-cpu counters no longer need to be atomics.
> - Use init_net in nvme_tcp_alloc_queue() instead of the namespace of
>    current, which is no longer the connecting task once the allocation
>    runs from a worker. A controller is not guaranteed to be tied to a
>    namespace, as the reconnect and error recovery paths already run from
>    a workqueue in init_net.

Well, I think this is breaking 1be52169c3488ef98582ed553ab35cefa3978817

>
> Testing on a 64-core host with 64 IO-queues shows nvme-tcp connection
> time reduced from 61ms to 11ms.
>
> Signed-off-by: Surabhi Gogte <sgogte@purestorage.com>
> ---
>   drivers/nvme/host/tcp.c | 126 +++++++++++++++++++++++++---------------
>   1 file changed, 80 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 354668ad29ac..30fe4c5abe0b 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -7,6 +7,7 @@
>   #include <linux/module.h>
>   #include <linux/init.h>
>   #include <linux/slab.h>
> +#include <linux/async.h>
>   #include <linux/err.h>
>   #include <linux/crc32.h>
>   #include <linux/nvme-tcp.h>
> @@ -54,7 +55,8 @@ MODULE_PARM_DESC(tls_handshake_timeout,
>   		 "nvme TLS handshake timeout in seconds (default 10)");
>   #endif
>   
> -static atomic_t nvme_tcp_cpu_queues[NR_CPUS];
> +static int nvme_tcp_cpu_queues[NR_CPUS];
> +static DEFINE_SPINLOCK(nvme_tcp_cpu_queues_lock);
>   
>   enum nvme_tcp_send_state {
>   	NVME_TCP_SEND_CMD_PDU = 0,
> @@ -154,6 +156,12 @@ struct nvme_tcp_queue {
>   static DEFINE_MUTEX(nvme_tcp_ctrl_mutex);
>   static LIST_HEAD_GUARDED(nvme_tcp_ctrl_list, nvme_tcp_ctrl_mutex);
>   
> +struct nvme_tcp_setup_ctx {

nvme_tcp_queue_setup_ctx?

> +	struct nvme_ctrl	*ctrl;
> +	int			qid;
> +	int			*err;
> +};
> +
>   struct nvme_tcp_ctrl {
>   	/* read only in the hot path */
>   	struct nvme_tcp_queue	*queues;
> @@ -1718,9 +1726,10 @@ static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
>   		goto out;
>   
>   	/* Search for the least used cpu from the mq_map */
> +	spin_lock(&nvme_tcp_cpu_queues_lock);
>   	io_cpu = WORK_CPU_UNBOUND;
>   	for_each_online_cpu(cpu) {
> -		int num_queues = atomic_read(&nvme_tcp_cpu_queues[cpu]);
> +		int num_queues = nvme_tcp_cpu_queues[cpu];
>   
>   		if (mq_map[cpu] != qid)
>   			continue;
> @@ -1731,9 +1740,10 @@ static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
>   	}
>   	if (io_cpu != WORK_CPU_UNBOUND) {
>   		queue->io_cpu = io_cpu;
> -		atomic_inc(&nvme_tcp_cpu_queues[io_cpu]);
> +		nvme_tcp_cpu_queues[io_cpu]++;
>   		set_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags);
>   	}
> +	spin_unlock(&nvme_tcp_cpu_queues_lock);
>   out:
>   	dev_dbg(ctrl->ctrl.device, "queue %d: using cpu %d\n",
>   		qid, queue->io_cpu);
> @@ -1846,7 +1856,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
>   		queue->cmnd_capsule_len = sizeof(struct nvme_command) +
>   						NVME_TCP_ADMIN_CCSZ;
>   
> -	ret = sock_create_kern(current->nsproxy->net_ns,
> +	ret = sock_create_kern(&init_net,

I don't think we can just change this...
