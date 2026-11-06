Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980739;
	b=GFETlV5brx/qpE6ek0ayYnHFzHLOkk+WKKn2pyWdrhn6jR7AeSE9fvWA1dbTAwcS/HQz
	 4e1hLQlL7O+GjTTjax0rLOL4t8G3RXdVg3KRb2iOq7+eIhLF2ORmSqFiBpFWEs0VHU7Ky
	 PepeWkE3WG2pJqg5J2lwEBwkq5qr2KWN5ar8O03KhdrGk23hBqN7rN2uLFvR8eKTeM+Df
	 lhnYA6S3+yYZTopvTSF6GayQRgCY/Wlp1hVi5BWA8z4wS1ZTKgaCSGZuIQpT/n1ixVCVQ
	 YPSwXJctrBXbdaDllRNDFDd3GbxJnZal+qcUZGS/ODm1QDNnMcupxlEoUH9IVFBvf2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=h0FLNe7OgMvWwaVPDLaJN55GeCrtAhkwCaQBCaPz6Vg=;
	b=bgxVc21AqjFMBK1rjPm6dXbdgbe1LupYjkOkvleYxt/65VLhSVa4QvaZP3Bi0MB9tkRr
	 DhH7K1dn+LzwM70eUDeJWCy4u53DhcTLoDauyA3IRo+I0Jb+J7aePpnJ+N9NhP0H1snnZ
	 pY8mXyqN+UJLm00v3QvCxlUiacn0cD/HOvZ5KUo9Ne867gAq9yyMJljDngNQRGnBH7LlZ
	 Kn/70UPnH1ERUXfs+KPRjvOOGWpTvQRBm3TmX7r8yuUKu6+sYfThh1MmQIP1/aTvBNHyn
	 uZajP74QOuqJGd4fQy8SO8THLsX5uYkDEpxH0RW82QTe7/Pujk+sU2+4dse9LTfDnYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SY23Fkeg;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A1E606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A1E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SY23Fkeg
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ec3561b07dso619165e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793980737; x=1794585537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h0FLNe7OgMvWwaVPDLaJN55GeCrtAhkwCaQBCaPz6Vg=;
        b=SY23FkeginpUa1pj1QjrtDQ5LYcZgd7SzbZrJkM+DeVApIkM5UW8gXKdOASjJ/Qfzz
         SUkWTfO7aicweaCxI9b4bEU5t8illAu4sX05P+9MgsqCE3ZVDEvHjT2gdWAhEcj0+s5x
         MWd0aQUHkC00BxSf/Fdwff6utfjsfvLdv908vTQ9QgApaiwaDTHGpkM/FyaDiZTZu2eK
         tzIWFYDKK/3lR/bSb/60oj0oFuzDDHtAmpMzhResVMaVPX+dC/qRlEyhwF8D7jilv5I9
         xQnD2/BAjQc6L+iG+h2SVkfAhe2DOGMdlfSFCLlbZCHhasGZzomBC69JrzZE8jsf+qaP
         XBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980737; x=1794585537;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0FLNe7OgMvWwaVPDLaJN55GeCrtAhkwCaQBCaPz6Vg=;
        b=zRzysZ3kI7IzOeHcLT006MZSlcpbqV9svTq+IaCDcX8IXgOwGK+ZQ08SgOhXXqJBaG
         oBhOyYNBpaOMtE+k2eq08MLGIJZkpVnSBD28Xpk95lhV3yBSReN+LCi4ULExdwBXmdMC
         6ShhoutMJcU65eny9XQjjo/tJn+u0Pkeq0hgbu7uLcmBHsESij4SYQvpodz3IqFt7ByW
         winegtiYgHddvFMgCNppuCPp0JGOovFJhBdndnm9ONuTtCuzmJg8wmPSAkXEbLs7yvFV
         6rSlhPOtM6PU0LVvtrxLFdvKnhoJaMS3EyYp+//5VXAVGecIy0SOjVM3Xwm5h4utoYwY
         F4Xw==
X-Forwarded-Encrypted: i=1; AKwUvBwMfuG6RGb5fCFEqhSQUiC1xwp+K9zf8BH97U7GAPn7pMM0EzAtDmJ5z3oBFxmBTSwBmiq3PunWL2DRKlg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fUGfinjoszGJs+nrMEZQYRgHVerVRzqMrKE5cH2Fvgt0cjMZ0
	cLSqRnB3rOEpN5G5fCMwU3Y7U0RtYBKjQhgmGee2wJThU1AQxsa75tVL
X-Gm-Gg: AYBFou1cdxquWcvRY/6R9jEawZTbnY4fXjlrtKVH5lPCqR+ZCucGgNjlSpdx/hIniJH
	yDxCeDrO9ggAMyQ5KQKBsjwIUZ6/nxKqSMhkxcWwMk1xNfCuDOGRHnvuioO7uUre51C7fSNaBJv
	gXsCNwom8AoSM8AKdaLG4vec0PGBMHvvA/06AxpEK31052+8NR+GX62VkuNzIoepl4OS2rtlHWL
	BMa/eKLH1hDYXarT10Gl1lzPhCjo2bzvuJ0juVJiRqQ4mXynfK2B6v3dqV5gCfCWoOxzRnOpEHP
	eXSAKc2tCzGsyJ+5smALPRrnwPIyUbkcWZWx/kalyTtUhz5E619g0s8uHvk7i796kbCXXWuAyBS
	SAPtQli/I2n362U7gIqU84AJxlCj+HoS7pnDNwdMA+ot8IGnZ0YDp3JnMEn13Z+vWnX3BxlH/92
	uPKDt/caEC9uJE0Ej6bD5h8FeDwLmVL3cUmsbVuSRXVv52n0DICJ1FI4q6/v0rq2vY/WAWZs172
	c0+8uDk8w+MlgDcFw7Rg8dA2x18kg8ITC/l7q4f1lGyfSQLiGX9VX5A/lMoTLn2SRCk9hmtL8Hn
	fYv95d69LfC4zTPd/7IrnEWzQac2AA4LxAeZ6Cjb+emophfqPg/3Fj3Qb47K0ybgLmBlnU5y+Ak
	scHS/LP4vvBVRFIXa/aAX8mC7YkvPoKNUjumuugA4onmrrFENnh6JjyJfZJ6ogsuEOSR2sQ4=
X-Received: by 2002:a05:6122:c25c:b0:5ea:be49:f93 with SMTP id 71dfb90a1353d-5ecb428be54mr2464694e0c.11.1793980737461;
        Fri, 06 Nov 2026 07:58:57 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64cb602sm1627480e0c.7.2026.11.06.07.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:58:56 -0800 (PST)
Date: Fri, 06 Nov 2026 10:58:56 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jingxuan Xie <jingxuanxie@deeproute.ai>, 
 netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Message-ID: <willemdebruijn.kernel.112eb85986c12@gmail.com>
In-Reply-To: <20261103092541.273847-2-jingxuanxie@deeproute.ai>
References: <20261103092541.273847-1-jingxuanxie@deeproute.ai>
 <20261103092541.273847-2-jingxuanxie@deeproute.ai>
Subject: Re: [RFC PATCH net v3 1/1] af_packet: avoid waiting for TPACKET_V3
 copies at retirement
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jingxuan Xie wrote:
> From: jingxuanxie <jingxuanxie@deeproute.ai>
> 
> TPACKET_V3 retires a full or expired block while holding
> sk_receive_queue.lock. prb_retire_current_block() takes
> blk_fill_in_prog_lock for write to wait for in-flight copy_bits()
> before publishing the block.
> 
> On PREEMPT_RT a copier can be preempted while holding the read lock.
> The packet path or the retirement timer then blocks on the write lock
> while holding sk_receive_queue.lock, and the receive path resumes only
> after the copier is scheduled again.
> 
> Try to take the write lock without blocking. If a copy is still in
> progress, leave the current block and its metadata untouched:
> 
> - the retirement timer re-arms itself and retries after the configured
>   interval;
> - packet allocation returns NULL, so tpacket_rcv() drops this capture
>   record and accounts it in tp_drops, while the original packet remains
>   in the network stack;
> - a later packet can retire the block once the copier has finished.
> 
> Do not dispatch the next block while the current block is still open.
> The existing lock order and completion ordering are preserved, and no
> new state or worker is introduced. The trade-off is a higher capture
> drop rate while a copier is preempted; original traffic is unaffected.
> 
> Fixes: 632ca50f2cbd ("af_packet: TPACKET_V3: replace busy-wait loop")
> Assisted-by: LLM
> Signed-off-by: Jingxuan Xie <jingxuanxie@deeproute.ai>

No need for a cover letter for a single patch.

And a v4 will be needed, because this is sent as RFC.

> ---
>  net/packet/af_packet.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index cf6429f09477..8fd6372ab59b 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c
> @@ -200,8 +200,8 @@ static void packet_increment_head(struct packet_ring_buffer *buff);
>  static int prb_curr_blk_in_use(struct tpacket_block_desc *);
>  static void *prb_dispatch_next_block(struct tpacket_kbdq_core *,
>  			struct packet_sock *);
> -static void prb_retire_current_block(struct tpacket_kbdq_core *,
> -		struct packet_sock *, unsigned int status);
> +static bool prb_retire_current_block(struct tpacket_kbdq_core *,
> +				     struct packet_sock *, unsigned int status);

no unrelated style changes

>  static int prb_queue_frozen(struct tpacket_kbdq_core *);
>  static void prb_open_block(struct tpacket_kbdq_core *,
>  		struct tpacket_block_desc *);
> @@ -711,8 +711,9 @@ static enum hrtimer_restart prb_retire_rx_blk_timer_expired(struct hrtimer *t)
>  	 *
>  	 */
>  	if (BLOCK_NUM_PKTS(pbd)) {
> -		/* Waiting for skb_copy_bits to finish... */
> -		write_lock(&pkc->blk_fill_in_prog_lock);
> +		/* Retry later if a packet copy is still in progress. */
> +		if (!write_trylock(&pkc->blk_fill_in_prog_lock))
> +			goto refresh_timer;

Since this is only a problem on RT, and it introduces drops,
consider limiting the switch from write_lock to write_trylock to only RT.

>  		write_unlock(&pkc->blk_fill_in_prog_lock);
>  	}
>  
> @@ -738,6 +739,7 @@ static enum hrtimer_restart prb_retire_rx_blk_timer_expired(struct hrtimer *t)
>  		}
>  	}
>  
> +refresh_timer:
>  	hrtimer_forward_now(&pkc->retire_blk_timer, pkc->interval_ktime);
>  	spin_unlock(&po->sk.sk_receive_queue.lock);
>  	return HRTIMER_RESTART;
> @@ -946,8 +948,8 @@ static void *prb_dispatch_next_block(struct tpacket_kbdq_core *pkc,
>  	return (void *)pkc->nxt_offset;
>  }
>  
> -static void prb_retire_current_block(struct tpacket_kbdq_core *pkc,
> -		struct packet_sock *po, unsigned int status)
> +static bool prb_retire_current_block(struct tpacket_kbdq_core *pkc,
> +				     struct packet_sock *po, unsigned int status)

again, unnecessary style changes

>  {
>  	struct tpacket_block_desc *pbd = GET_CURR_PBLOCK_DESC_FROM_CORE(pkc);
>  
> @@ -963,13 +965,14 @@ static void prb_retire_current_block(struct tpacket_kbdq_core *pkc,
>  		 * the timer-handler already handled this case.
>  		 */
>  		if (!(status & TP_STATUS_BLK_TMO)) {
> -			/* Waiting for skb_copy_bits to finish... */
> -			write_lock(&pkc->blk_fill_in_prog_lock);
> +			/* Do not wait for copies while holding the queue lock. */
> +			if (!write_trylock(&pkc->blk_fill_in_prog_lock))
> +				return false;
>  			write_unlock(&pkc->blk_fill_in_prog_lock);
>  		}
>  		prb_close_block(pkc, pbd, po, status);
> -		return;
>  	}
> +	return true;
>  }
>  
>  static int prb_curr_blk_in_use(struct tpacket_block_desc *pbd)
> @@ -1097,7 +1100,8 @@ static void *__packet_lookup_frame_in_block(struct packet_sock *po,
>  	}
>  
>  	/* Ok, close the current block */
> -	prb_retire_current_block(pkc, po, 0);
> +	if (!prb_retire_current_block(pkc, po, 0))
> +		return NULL;
>  
>  	/* Now, try to dispatch the next block */
>  	curr = (char *)prb_dispatch_next_block(pkc, po);


