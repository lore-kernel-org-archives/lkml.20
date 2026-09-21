Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC183AF66E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981250; cv=none; b=SpYG3wcdpIhe/69QzKPJD7HA3OHVkOIJz58YZeog/hCtJYzfpajP4N66M0U5JVlHcKGn0W3Y5XSZCf7bIE4faTmMkBVHjmkchzTk7LMv7wleS5T1+qSokwzurVK31YwAyodqjl1+Lva67VQiG+iPVHRC0vXRTlym0BG12yCyqXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981250; c=relaxed/simple;
	bh=MRMX39NXDxilIrfwoUA/S4FInqd9Uu+Hv6ah/bpTHhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFYxGR6BoXNz9pv+znb+PoaT6JSO0ldyXs2QT/zujlyWNzkbpM+t38ttlQu2Z0BpzKYlNwtBRqXjHKwk96amMkGO/5WiOeMIkgiicw9Zf3bn3d+0EfBGYpaTliz3PMk0lF/zgJ4J8pJi2ogZftN5NL4OuBUKDrNu6gXWCLqiulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vq9jwxVd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tjwD4GPQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RpGGXtJP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2jZkD7Je; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vq9jwxVd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tjwD4GPQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RpGGXtJP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2jZkD7Je"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1FBDF1FDD9;
	Mon, 21 Sep 2026 09:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789981243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wDGbpQhbAoKwstdbxO3RxACQhKS6WnNQ72Q4Vsx1hGw=;
	b=vq9jwxVdh9kk5ZZmt+wiSahm2Q49vq+PISt+bMI2PMlcoCls4ofx7VkN5v9hrFvGhAwy1/
	J0pjfyYMwxqN7fw68ei5Zan5e1dJ2Qq64GT8XAQvoKnDJ/Z9/PEN+/4b3tYm1c0s3xPAZo
	xrvRTkrLuWgzuyjdf0NBi2zhrSg0iNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789981243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wDGbpQhbAoKwstdbxO3RxACQhKS6WnNQ72Q4Vsx1hGw=;
	b=tjwD4GPQb17Btr1PRqdQT006cAUyxUjKW6HfguordmXaIGo827H66F8TFECkl+Z8+1zcTG
	ho8QQuJBQG2VluBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789981239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wDGbpQhbAoKwstdbxO3RxACQhKS6WnNQ72Q4Vsx1hGw=;
	b=RpGGXtJPJk4rwLwWmr6I6oQQVbQ/ed4LxZ9KEmlyFynD2rt0CCY/UgsB7BrGWF2NbqgZjd
	DONqmB0Y4j9kY9b2YcZksDeWLEI7PHiZHhI0XYrKYr3TWTxTxNpYBLzLvgzbqKFD7RqLA1
	GxiQqh29dRx7L2RLox4UZogzR+AiAZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789981239;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wDGbpQhbAoKwstdbxO3RxACQhKS6WnNQ72Q4Vsx1hGw=;
	b=2jZkD7JeljcfGXWg3Ta19v2pWuTptmd8PMev6YC/lT0sw/I8eG9yAOnH117fCmcL17NGJL
	vam4RF7VPjmmN/Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E01E1368D;
	Mon, 21 Sep 2026 09:00:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JExEHDbysGqjWgAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 21 Sep 2026 09:00:38 +0000
Message-ID: <0d816796-3641-4982-9b28-484b226021f5@suse.de>
Date: Mon, 21 Sep 2026 11:00:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet-fcloop: fail LS request synchronously when remote
 port is gone
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
 Justin Tee <justin.tee@broadcom.com>,
 Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
 Paul Ely <paul.ely@broadcom.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Daniel Wagner <wagi@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 syzbot+77955102efac681ec73b@syzkaller.appspotmail.com
References: <20260920163804.67858-1-ngocthang2710.1999@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260920163804.67858-1-ngocthang2710.1999@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_TO(0.00)[gmail.com,broadcom.com,lst.de,grimberg.me,nvidia.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[77955102efac681ec73b];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,appspotmail.com:email]

On 9/20/26 6:38 PM, Nguyen Ngoc Thang wrote:
> fcloop_t2h_ls_req() handles a missing remoteport by queueing the request
> on tport->ls_list and completing it with -ECONNREFUSED from a work item.
> 
> nvmet_fc_delete_assoc_work() sends the Disconnect Association LS this
> way. When it runs during nvmet_fc_unregister_targetport(), the work is
> queued after flush_workqueue() has started, so it is not waited for.
> nvmet_fc_free_pending_reqs() then frees the still-pending lsop and the
> late work item calls lsreq->done() on freed memory:
> 
>    BUG: KASAN: slab-use-after-free in fcloop_rport_lsrqst_work+0x242/0x2e0
>    Workqueue: nvmet-wq fcloop_tport_lsrqst_work
>    Allocated by nvmet_fc_xmt_disconnect_assoc
>    Freed by nvmet_fc_free_pending_reqs
>             nvmet_fc_unregister_targetport
>             fcloop_delete_target_port
> 
> Return -ECONNREFUSED directly instead. __nvmet_fc_send_ls_req() unwinds
> and nvmet_fc_xmt_disconnect_assoc() frees the lsop, so no completion is
> left outstanding.
> 
> Reported-by: syzbot+77955102efac681ec73b@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=77955102efac681ec73b
> Fixes: bbccbf791e6f ("nvmet-fc: free pending reqs on tgtport unregister")
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---
>   drivers/nvme/target/fcloop.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
> index b63af3b643a6..9f9fb40f8a97 100644
> --- a/drivers/nvme/target/fcloop.c
> +++ b/drivers/nvme/target/fcloop.c
> @@ -456,21 +456,18 @@ fcloop_t2h_ls_req(struct nvmet_fc_target_port *targetport, void *hosthandle,
>   	 * 1:1 tgtport vs remoteport
>   	 */
>   
> +	/*
> +	 * Fail synchronously: an async completion can run after
> +	 * nvmet_fc_unregister_targetport() has freed the pending lsreq.
> +	 */
> +	if (!tport->remoteport)
> +		return -ECONNREFUSED;
> +
>   	tls_req = kmem_cache_alloc(lsreq_cache, GFP_KERNEL);
>   	if (!tls_req)
>   		return -ENOMEM;
>   	tls_req->lsreq = lsreq;
>   	INIT_LIST_HEAD(&tls_req->ls_list);
> -
> -	if (!tport->remoteport) {
> -		tls_req->status = -ECONNREFUSED;
> -		spin_lock(&tport->lock);
> -		list_add_tail(&tls_req->ls_list, &tport->ls_list);
> -		spin_unlock(&tport->lock);
> -		queue_work(nvmet_wq, &tport->ls_work);
> -		return ret;
> -	}
> -
>   	tls_req->status = 0;
>   	ret = nvme_fc_rcv_ls_req(tport->remoteport, &tls_req->ls_rsp,
>   				 lsreq->rqstaddr, lsreq->rqstlen);

Can you create a blktest for this?
Otherwise look good.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
