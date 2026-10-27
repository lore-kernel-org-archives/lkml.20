Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117091;
	b=AFBmxfpcUyNZCyuZhbctrpr1Qb0zT67BPYnkL5cSiEPGnjYMHwoY28Mx6AwRynZWykTD
	 q/nlhXpazu74F6+lqPhDkBzz41EmnTrOoCwBtzXcfm/YzeBM3NhyNYp6ZjeJ17NqzjIHG
	 el1Y3QaNIuWMDOcF37Dle+jTe93Li/J250ESd/9WKFkeT+oH9FCJHqTYuKzYbVj9LMchQ
	 fjPwb+D7TK3xgrAMcyrVo0AJMcjHSwNDhxvN+Vp8E8hp4WwX+KvHCI3TJD3mE/+sYBa87
	 ayeM6C+u1gVM4f97XkCVdBENQlQ1AshO3GlB/sbkTkq0j/pPGkaJaa7UzwMin3cosMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117091;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=W7jvFEheGOj4Xuu1UcXrw24Qefpih5MBmqYKpSsX/nE=;
	b=hpJMJZZPSL4haZG7+qk2eyfi45tLgqaFXWqlpEAGvcwemJi2VAsSec3l9wo7Nef3N0kR
	 +tA7tCMh3kImiFvUzYEZzaDeRVFZyOqmuLWkcUCzWqIV/cli531B1HgEnSoH+H4TCqLZf
	 YSt+ra2NwcOjaShimB3Gb/kie+gQ9WpTgksFj+ZrbmA4sb9VffrkKNX4JT7zkFs2NX98P
	 MrS8idl6vvTUGyMdAqqEBOgpvfxf7HPfnIQ6Tg79yM6ry+4JrJGXsMIOLmuR1dmCe8u/s
	 wMQsrllbeja1aEfC2HBjy3WvpdBDu53P6ybPNY/xhA7Q+uOWR2/EUu1nrnxhHDyPyWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CLfLLM3v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ABA60A260B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CLfLLM3v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F151F031E1;
	Tue, 27 Oct 2026 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117091;
	bh=W7jvFEheGOj4Xuu1UcXrw24Qefpih5MBmqYKpSsX/nE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CLfLLM3vhKpvaWfy2FTOk/U1y/xOL97lR72BSxQdSH2a2RQj6/13N6iwNRc+5UvrM
	 K06tkuvXv511KSTdNWUngI5DrPbJn0y13jOTgf09BUFlQKwYgitx/5fmfaZyC0yZp3
	 /kd4d5DG8FvmUxrkM8WpAhthzynjQSxqTPWlCKrFnzYcc+5AVjXFrYWSqMVOKckrzf
	 kgRcYBGaZzW4XhmZX65nXHN+ZA8DbU4sRKMIDp1+n42NlV731d1ORjQnWujjLDjPFC
	 oBtCW1rL8nKA5aLJYtxwf7jydVvmToJ3plDikac8qhmBl1xSo355wEjrFb3rClY9zB
	 KGlWAU78BYIcQ==
Date: Tue, 27 Oct 2026 10:04:43 -0600
From: Keith Busch <kbusch@kernel.org>
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Cc: linux-nvme@lists.infradead.org, axboe@kernel.dk, hch@lst.de,
	sagi@grimberg.me, hare@kernel.org, sgogte@purestorage.com,
	wagi@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-tcp: fix request PDU size when header digest is
 enabled
Message-ID: <auDLmzKWOZNBNpOR@kbusch-mbp>
References: <20261026184621.29276-1-christian.aurichzm@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026184621.29276-1-christian.aurichzm@gmail.com>

On Mon, Oct 26, 2026 at 03:46:21PM -0300, Christian Aurich Zanettini Martins wrote:
> @@ -566,7 +566,7 @@ static int nvme_tcp_init_request(struct blk_mq_tag_set *set,
>  	struct nvme_tcp_cmd_pdu *pdu;
>  	int queue_idx = (set == &ctrl->tag_set) ? hctx_idx + 1 : 0;
>  	struct nvme_tcp_queue *queue = &ctrl->queues[queue_idx];
> -	u8 hdgst = nvme_tcp_hdgst_len(queue);
> +	u8 hdgst = ctrl->ctrl.opts->hdr_digest ? NVME_TCP_DIGEST_LENGTH : 0;

I think everything this function needs should be initialized prior to
this function being called.

>  	mutex_lock(&queue->pf_cache_lock);

See where mutex_init is called for this queue's pf_cache_lock. Can you
move the queue's hdr_digest setting to that location instead?
