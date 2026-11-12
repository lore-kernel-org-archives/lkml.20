Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476467;
	b=S9OSUsKutzBSaDc1BKGwnnqTw9VfT1d+BYNf9o79fvAGPPiTVC0L9GvsqJgYDu55Nq6A
	 EzZNyaYOKwybPSqJ0JeEdILWneH9qNdV6WYbvH73EUvkxliHuJ4Z96yjVek8VTW4PvKG5
	 8wWfPJejFY5yikM5fZOlcd/nHCdUCkMwfxy6ltQdP61BlNeMtdbi3Gtnl4Bwt0Rn7kEe1
	 TLRTzYsAJStrdQ3k6fOeawCsnqpeBN5C/FZQdXF+ejmeA1ip2/5P/BFV5IM63FgKZoGa3
	 HpjGOIqRNBR7CV5dy9zgNFCvfrbrEpF2MNR6p35ptQpaGh107+MTNaWlNOVuDfOp+Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476467;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=c0DtF6b319KPvSfLGEX0iB6g2wpcniCU/mIrlo6hIlM=;
	b=y0L9weofz0R7pTEdrGLLmpgBm2wKDJapv+hZW/SEkVZnH1sPMN1yn8TNniXXxWQ09E1Z
	 J3PuUiSl2bFkmY6U2eahfPFtepCNdgJaf41n0djZbvE+wvtshqvd2NH78EnSoo3rjecRR
	 186Pc1uBnxHXrxgcZtj5x5bywDijcrA9jWRvuh6lgtxRvhpK6vRP063g1RxckFXWAFbBu
	 9Pxe57TmnwFsrjynA+O6pNgIFmEjQ78yTCqupBcZPDAnCfNory5q4ba629F9OOtbqjxyd
	 zQR76x6Dc7+gwaWMrq8BuTQjMQIf12+9fQzRNc6RpFh/tVC48xobTgvy6Bed/FWUpzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ffTxoRwt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF187606A32D;
	Thu, 12 Nov 2026 09:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ffTxoRwt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72351F00A05;
	Thu, 12 Nov 2026 09:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794476466;
	bh=c0DtF6b319KPvSfLGEX0iB6g2wpcniCU/mIrlo6hIlM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=ffTxoRwt2fePk6IBmUa0bCIgE2+hyzsUAOwA8z0obCYUSXGGlYfv6qSN7xWp/w1nb
	 itU/wzjPtTz18FuvP7L9UUo7b6n10CLjpxhDzpiAwWx5qoapZgOP2JLA9ZURmxinjA
	 zZ+nyL99xlherg4G4iK0MdbpRoRyN71A3Up9WU4epwpPgTSBAQZ6IxitG/a6zCAQb+
	 ki4hUDOLguNfGv1eGPFmdiGg5TbAopSnd3Em/L9nohi35GOl9gehZwu5d4wXpJYXVN
	 vCvO+3VfkZa0REDdLamISLtiysY4XNci8XwYk4W0u5fuH5+xTgXIDADHHQflI0hP+5
	 A3DiZf2Mk8ZfA==
Message-ID: <0756184b-50c6-477f-8a50-cd1a495f1d70@kernel.org>
Date: Thu, 12 Nov 2026 10:41:03 +0100
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
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH] media: v4l2-mem2mem: wait for the job-finish scheduling
 tail
To: Yaohan Li <shunsheng1218@gmail.com>, mchehab@kernel.org
Cc: Frank.Li@nxp.com, ming.qian@oss.nxp.com, nicolas.dufresne@collabora.com,
 dmantipov@yandex.ru, 121811682@qq.com, ezequiel@vanguardiasur.com.ar,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <179378462223.70003.3811321311940400468@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <179378462223.70003.3811321311940400468@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2026 10:30, Yaohan Li wrote:
> The job-finish path clears TRANS_RUNNING and TRANS_QUEUED before its
> follow-up scheduling tail has finished using the mem2mem context.
> If release races with that tail, v4l2_m2m_cancel_job() can observe no
> running or queued job and allow the context to be freed while the tail
> still accesses it.
> 
> Track the scheduling tail with a completion and wait for it in the
> cancellation path. Start the completion in the done state so contexts
> that never ran a job do not wait indefinitely, reinitialize it when a
> scheduling tail begins, and complete it after the tail finishes.
> 
> The original race was reproduced as a KASAN use-after-free in the
> common mem2mem code using the in-tree vicodec test driver and targeted
> timing injection.
> 
> Fixes: cbd9463da1b12 ("media: v4l2-mem2mem: Avoid calling .device_run in v4l2_m2m_job_finish")
> Assisted-by: ZCode:GLM-4

Clearly AI prose. I can't make head nor tail (pun intended) of it.

What was the vicodec race? How was it patched?

Please rewrite the commit log and comments in words that a human would use.

Regards,

	Hans

> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 27 ++++++++++++++++++++++++++
>  include/media/v4l2-mem2mem.h           |  3 ++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index a65cbb124cfe0..7637a876bb8c3 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -439,6 +439,13 @@ static void v4l2_m2m_cancel_job(struct v4l2_m2m_ctx *m2m_ctx)
>  		/* Do nothing, was not on queue/running */
>  		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>  	}
> +
> +	/*
> +	 * A job-finish tail may still walk this instance after
> +	 * TRANS_RUNNING was cleared; wait for it to finish so the caller
> +	 * can safely release the instance.
> +	 */
> +	wait_for_completion(&m2m_ctx->scheduling_done);
>  }
>  
>  /*
> @@ -460,6 +467,14 @@ static void v4l2_m2m_schedule_next_job(struct v4l2_m2m_dev *m2m_dev,
>  	 * but the job must be run in non-atomic context.
>  	 */
>  	schedule_work(&m2m_dev->job_work);
> +
> +	/*
> +	 * Signal that the scheduling tail is done. complete_all is
> +	 * atomic: once called, all current and future waiters are
> +	 * released, with no lock-free condition window as with
> +	 * wait_event() + a flag bit.
> +	 */
> +	complete_all(&m2m_ctx->scheduling_done);
>  }
>  
>  /*
> @@ -476,7 +491,14 @@ static bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
>  
>  	list_del(&m2m_dev->curr_ctx->queue);
>  	m2m_dev->curr_ctx->job_flags &= ~(TRANS_QUEUED | TRANS_RUNNING);
> +	/*
> +	 * The follow-up scheduling of the same instance still walks it
> +	 * after the lock is dropped; re-arm the completion so that
> +	 * v4l2_m2m_cancel_job() waits for the tail to finish before
> +	 * releasing the instance.
> +	 */
>  	wake_up(&m2m_dev->curr_ctx->finished);
> +	reinit_completion(&m2m_dev->curr_ctx->scheduling_done);
>  	m2m_dev->curr_ctx = NULL;
>  	return true;
>  }
> @@ -1245,6 +1267,11 @@ struct v4l2_m2m_ctx *v4l2_m2m_ctx_init(struct v4l2_m2m_dev *m2m_dev,
>  	m2m_ctx->priv = drv_priv;
>  	m2m_ctx->m2m_dev = m2m_dev;
>  	init_waitqueue_head(&m2m_ctx->finished);
> +	init_completion(&m2m_ctx->scheduling_done);
> +	/* Start as done: a context that never runs a job must not block
> +	 * in v4l2_m2m_cancel_job(). reinit_completion() below re-arms it
> +	 * each time a scheduling tail actually starts. */
> +	complete_all(&m2m_ctx->scheduling_done);
>  
>  	out_q_ctx = &m2m_ctx->out_q_ctx;
>  	cap_q_ctx = &m2m_ctx->cap_q_ctx;
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index 31de25d792b98..89c8f10de67c7 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -95,7 +95,7 @@ struct v4l2_m2m_queue_ctx {
>   * @out_q_ctx: Output (input from memory) queue context
>   * @queue: List of memory to memory contexts
>   * @job_flags: Job queue flags, used internally by v4l2-mem2mem.c:
> - *		%TRANS_QUEUED, %TRANS_RUNNING and %TRANS_ABORT.
> + *		%TRANS_QUEUED, %TRANS_RUNNING, %TRANS_ABORT and %TRANS_SCHEDULING.
>   * @finished: Wait queue used to signalize when a job queue finished.
>   * @priv: Instance private data
>   *
> @@ -125,6 +125,7 @@ struct v4l2_m2m_ctx {
>  	struct list_head		queue;
>  	unsigned long			job_flags;
>  	wait_queue_head_t		finished;
> +	struct completion		scheduling_done;
>  
>  	void				*priv;
>  };

