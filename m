Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A9A31E840
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257767; cv=none; b=MbnvZB5NxzMUVVudM1xGOz4iCMeNGNrlgH2qqkawqEM2Wk4lQSLKWwiAaSArs6eEoB0tT1/qaHkx+zR/5P132d9Gmvzf2NuupIhUHHsOKlTfamY3/6TISmBJrALQGGd7PKT2eiarZZQGcGwusk3WY/Yt/4TWMXWIeoFXLeGJ2N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257767; c=relaxed/simple;
	bh=34EjvYIJDGOTI10zyOt9K55IWn2c9RJmgtJTnRlN7dw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nyw7jCEqrcRpBCglHgP/qC2EhQNpfvGdvNqi0VUq4p1L/kXYP29x3sS+JPd+Fvg5B78hQ7YJ7H7VqrLWlFlQo7I2IRMOPFjDapvhTt0ss0sii7CT6rcIo4gfKXBEfi6JPT534ipzvcyOMj0+d763ETG+uzRl3Vymxqe4yeLYZzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J0ecXqfO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xaGcL5tB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J0ecXqfO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xaGcL5tB"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790257763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rKM+5h79sg/lVhEGYMq1Ngct2uaEI+ESbP+1senBCuI=;
	b=J0ecXqfOj5BtseSujm8rGnoMw2WTb9F4E+VFKmHTg2roorYQsIpnFuY38ShETD0JlSX5zc
	ZUGk6RLoGmMRR0lcdhGyMNjqVv6g/VF1btcSMNnVZK6MYyJHOxDKLcKb2cw4G1xMc4SORX
	SywyAFDc6zZczXyQiWKa+DMjdPOq2zMRmz5k7olARX/PI2+CA26HnR2bbxjuCQwnS1SEZx
	eeenrUUo/nHfzFVAXV1ePhpclrNXCPmF6SLcRs2lqUdtKME8WgHVPujMLVInNstqgriA1a
	AwyMvIrZZ7umxS05OzTDn9OXA3I02KDTxOaZ7Dt84dvaHt02oNVTVFpJZihrGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790257763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rKM+5h79sg/lVhEGYMq1Ngct2uaEI+ESbP+1senBCuI=;
	b=xaGcL5tBOi//++4tE/Opngsz96qy0v8olD36EAA+ep8RTmO0M9szpl8Zs7kwUmClp+Re2K
	hJcsqVRXj3i/l9AA==
To: Wang Wensheng <wsw9603@163.com>, pmladek@suse.com, rostedt@goodmis.org,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org
Cc: wsw9603@163.com
Subject: Re: [PATCH] printk_ringbuffer: Avoid needless read of prb_desc
In-Reply-To: <20260922062520.248439-1-wsw9603@163.com>
References: <20260922062520.248439-1-wsw9603@163.com>
Date: Thu, 24 Sep 2026 15:55:23 +0206
Message-ID: <87mrt6u5cs.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-09-22, Wang Wensheng <wsw9603@163.com> wrote:
> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
> index 85c0c854b3ce..607666d37455 100644
> --- a/kernel/printk/printk_ringbuffer.c
> +++ b/kernel/printk/printk_ringbuffer.c
> @@ -443,8 +443,8 @@ static enum desc_state get_desc_state(unsigned long id,
>   * descriptor is in an inconsistent state (miss or reserved), the caller can
>   * only expect the descriptor's @state_var field to be valid.
>   *
> - * The sequence number and caller_id can be optionally retrieved. Like all
> - * non-state_var data, they are only valid if the descriptor is in a
> + * The sequence number, caller_id, and desc can be optionally retrieved. Like
> + * all non-state_var data, they are only valid if the descriptor is in a
>   * consistent state.
>   */

I realize you are trying to minimally update the documentation. But
really the whole description needs to be appropriately updated. I
suggest:

/*
 * Get the state of a specified descriptor.
 *
 * Optionally, a copy of the descriptor, sequence number and/or caller ID can
 * be retrieved. However, (with the exception of @desc_out->state_var) all
 * retrieved values are invalid if the descriptor is in an inconsistent state
 * (miss or reserved).
 */

>  static enum desc_state desc_read(struct prb_desc_ring *desc_ring,
> @@ -1335,7 +1335,6 @@ static struct prb_desc *desc_reopen_last(struct prb_desc_ring *desc_ring,
>  {
>  	unsigned long prev_state_val;
>  	enum desc_state d_state;
> -	struct prb_desc desc;
>  	struct prb_desc *d;
>  	unsigned long id;
>  	u32 cid;
> @@ -1346,7 +1345,7 @@ static struct prb_desc *desc_reopen_last(struct prb_desc_ring *desc_ring,
>  	 * To reduce unnecessarily reopening, first check if the descriptor
>  	 * state and caller ID are correct.
>  	 */
> -	d_state = desc_read(desc_ring, id, &desc, NULL, &cid);
> +	d_state = desc_read(desc_ring, id, NULL, NULL, &cid);
>  	if (d_state != desc_committed || cid != caller_id)
>  		return NULL;
>  
> @@ -2007,14 +2006,13 @@ u64 prb_first_seq(struct printk_ringbuffer *rb)
>  {
>  	struct prb_desc_ring *desc_ring = &rb->desc_ring;
>  	enum desc_state d_state;
> -	struct prb_desc desc;
>  	unsigned long id;
>  	u64 seq;
>  
>  	for (;;) {
>  		id = atomic_long_read(&rb->desc_ring.tail_id); /* LMM(prb_first_seq:A) */
>  
> -		d_state = desc_read(desc_ring, id, &desc, &seq, NULL); /* LMM(prb_first_seq:B) */
> +		d_state = desc_read(desc_ring, id, NULL, &seq, NULL); /* LMM(prb_first_seq:B) */
>  
>  		/*
>  		 * This loop will not be infinite because the tail is

Using my suggestion for the documentation:

Reviewed-by: John Ogness <john.ogness@linutronix.de>
