Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472242;
	b=C6nV32jyvnz57jA8ZiWpy1UX3RIu1RHD38ah3RF489kyQS+zzb6o9HGCCHdqj1APqp1K
	 G4dd6tQP8djbkBijwk0bjgsFnS3OmHq6BAxOEuK4gwT0oOK5rXufOaVll4xogy7icygds
	 f4RDpsBzom5Z5Q4pa0K4bPSqnat7i0xiqahFIWx0xU/S0w97CxWyAndeFYiRPpSmxAROm
	 KwUU1q48MEwG/n0ujagQIMjmMcEOc4ADGdLLy5HcQB3HNkgZM7Sv1hEJ7aWNTWYvENBE/
	 VQaoyfPatnr2ydKbQFw+n1OnnWh7AyIXX3pq096JhDjbxuBzrVr98Om5bn4OmQApD5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472242;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=J1ZxmriRqQ9+61x/KiVxYgCraVJwWtPh71bpXSpp/vM=;
	b=1opqYPjVMnVmoRU/sD4G6K4bTxbxsJPECSGszvvb0o55qXRZA+u94ny/ULjKKUoMFXHC
	 6iQJnPPBZbxfrmR2TDaN79hVRRhPzvV6yUVUvRAsDxRgX1BH+25PzKdPq+x66i+aFFpkc
	 8eRlEyjckdTbQIpcjoxOVHQIA9cnH2dUukgLymFrpRJAnuadYK7gQctSRw1ds1JCCxTNa
	 KogXBM8t/JH2Np8Z8qBZWX8IuW44i8JjOFEN4svN2sICjNiHcKiUK1cEskPsTuR6FKudb
	 UBdYNx3n9ChMMPgyhAxK8MfzbDYKtED7gBwy2x8gVFBw32gRA4fay9FcEZP3RjoVhwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zgboRtwD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=n4fsSVxH;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D7B606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D7B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zgboRtwD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=n4fsSVxH
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794472239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J1ZxmriRqQ9+61x/KiVxYgCraVJwWtPh71bpXSpp/vM=;
	b=zgboRtwDlXPdubW6FP+TXnwTzg9cuCoi2bNi1WycLLB0WfukOGm+PVjzxmGlr4sT2Swt4r
	lEg10MYTOIBEWIZ6u/xicw4PPf+xuKHQNcSnbn+7bh/2LUplXT4YX0pmtrCDnovCmK+50k
	KWNhj2ZK/6EPX5EekIsMEFPnr7LnHjLxL4mbSx/ntsq+S4oDKUvyfii2ielIU9yXY5FRN7
	F+bp07OfYjoITgduXQK9S6Lr6Z0qwCxzPQRZvoRA1wulBPZMOTs2zf3KcMoKJRtIr1Ofqo
	TEOcMRzUQC0MB3cooRqXoaid4DyHWJpDTVWVJ0+7RgJrs0B0350eCt7sEXnc2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794472239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J1ZxmriRqQ9+61x/KiVxYgCraVJwWtPh71bpXSpp/vM=;
	b=n4fsSVxHQCpoGUrSswAqR01TxjQMU7WRkZTHV4T+HNj6vMAE/KrCFqtWX3p0e4K1b296BY
	6AEEPG806uO4nHDg==
To: Zhu Jun <zhujun2@cmss.chinamobile.com>, pmladek@suse.com
Cc: rostedt@goodmis.org, senozhatsky@chromium.org, paulmck@kernel.org,
 printk@lists.linux.dev, linux-kernel@vger.kernel.org, Zhu Jun
 <zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH v2] printk: ringbuffer: Annotate speculative record reads
In-Reply-To: <20261112031441.120773-1-zhujun2@cmss.chinamobile.com>
References: <20261112031441.120773-1-zhujun2@cmss.chinamobile.com>
Date: Thu, 12 Nov 2026 09:36:39 +0106
Message-ID: <87pkwah2og.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi Zhu,

On 2026-11-12, Zhu Jun <zhujun2@cmss.chinamobile.com> wrote:
> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
> index 46a79ec0940a..8a1075d00d0a 100644
> --- a/kernel/printk/printk_ringbuffer.c
> +++ b/kernel/printk/printk_ringbuffer.c
> @@ -1894,9 +1894,10 @@ static bool copy_data(struct prb_data_ring *data_ring,
>  	if (data_size < (unsigned int)len)
>  		return false;
>  
> -	/* Caller interested in the line count? */

Please do not drop the above comment.

> -	if (line_count)
> -		*line_count = count_lines(data, len);
> +	if (line_count) {
> +		/* Racing text is rejected by the caller's descriptor recheck. */
> +		*line_count = data_race(count_lines(data, len));
> +	}
>  
>  	/* Caller interested in the data content? */
>  	if (!buf || !buf_size)
> @@ -1969,6 +1970,7 @@ static int prb_read(struct printk_ringbuffer *rb, u64 seq,
>  	atomic_long_t *state_var = &rdesc->state_var;
>  	struct prb_desc desc;
>  	unsigned long id;
> +	u16 text_len;
>  	int err;
>  
>  	/* Extract the ID, used to specify the descriptor to read. */
> @@ -1984,12 +1986,16 @@ static int prb_read(struct printk_ringbuffer *rb, u64 seq,
>  	if (err || !r)
>  		return err;
>  
> -	/* If requested, copy meta data. */

Please do not drop the above comment.

> -	if (r->info)
> -		memcpy(r->info, info, sizeof(*(r->info)));
> +	if (r->info) {
> +		/* The record may be recycled; the descriptor is rechecked below. */
> +		data_race(memcpy(r->info, info, sizeof(*r->info)));
> +	}
> +
> +	/* The descriptor recheck below also rejects a raced length. */
> +	text_len = data_race(READ_ONCE(info->text_len));

There is no need to prevent compiler optimization with
READ_ONCE(). Using data_race() is enough.

>  
>  	/* Copy text data. If it fails, this is a data-less record. */
> -	if (!copy_data(&rb->text_data_ring, &desc.text_blk_lpos, info->text_len,
> +	if (!copy_data(&rb->text_data_ring, &desc.text_blk_lpos, text_len,
>  		       r->text_buf, r->text_buf_size, line_count)) {
>  		return -ENOENT;
>  	}

John Ogness
