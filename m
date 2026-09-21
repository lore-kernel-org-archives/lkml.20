Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DC3405F7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994080; cv=none; b=DeloT5NW6omc0EhxtCSnbDEbI+gT8Y+vT4sVk76UsSYnZSaHGQWswVHk6R5is94rnm72VJQJFkLSjTIVwL/nu5QG5kft6T5YaHvX80jQb9Mqwt67PpdulhGmeDg4VcAvol14Rx97h61OoUZbw67ZfevIeOQ3EJ0hrg0LFZML9zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994080; c=relaxed/simple;
	bh=0YvXIFXiKXoGE4fsdEbUZrH5wK3CbRKzUR6JqQ/z/Gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JfdmWAbU7AkwE5dQ0ysKhHA7cNQBA1ko6ryZknMkbmHbWczCxyJv18tEicVlyhcIyDBS1bNgGlr+CHELmhkqjBuRB1RVKYcPhiDCla+ODyFFMNBgFn8e/FOCBSIb9aESoLgjfW7ShN1rZIeECUfw2fCv4eodqmbPGg4GmFpCbRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SPYcqaTh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=je1B7qUh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qFcA9A2A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RT/JqhDj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SPYcqaTh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="je1B7qUh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qFcA9A2A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RT/JqhDj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7D80F1FA79;
	Mon, 21 Sep 2026 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789994069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIec8Ew0yYm4cW66xxG7DDJvDI4mJ/N1qm7mNg0vcPk=;
	b=SPYcqaThIVoxRz6i8TLq1Mrjjc8Gy/aa6j/GcpEeMm7U+ljbLnFReX2VdlhTIHwXKwZmUq
	dX4zvsiUOFsVUnzh0NfHFH9HzbcgIi23tmfy8i1r5TBmypFSc5H8PRO8jU1P3IaY1XXZDg
	qXb4kOgwwDmOkeFVhL7svRDljqGKd08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789994069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIec8Ew0yYm4cW66xxG7DDJvDI4mJ/N1qm7mNg0vcPk=;
	b=je1B7qUhMSNIkTxlvFqtwhTuR2hCGZ8++J7FC3t7n/wHQvcDOZNMpGvxDR9EjFDNRKEXs9
	ZjXGIg3JV+BgJZCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qFcA9A2A;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="RT/JqhDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789994065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIec8Ew0yYm4cW66xxG7DDJvDI4mJ/N1qm7mNg0vcPk=;
	b=qFcA9A2AjTfyUsTzzH8FrKYw2hpMbwk+8egF2Tdex2tm+MTNzzBdL9qlml1H8OM5DVhe9M
	EgEGlr0SHYWXdD15Q5FeH9Zpi8c7ztmQNlTwyUeIQPzPw8uqamQms0HQYw+KJxokAjZRYl
	sq9NQnyVSRDfzVTAyD3S3wqFkuW7b2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789994065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIec8Ew0yYm4cW66xxG7DDJvDI4mJ/N1qm7mNg0vcPk=;
	b=RT/JqhDjjvbpYr9hJY4FgnARZkNhNWQOvS2b7VJgGO4CMxtI/XANOuePsLbD5pY6ihrNC9
	YU/+H7lh41rwufAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3B2813793;
	Mon, 21 Sep 2026 12:34:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k8CkHFAksWr+RQAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 21 Sep 2026 12:34:24 +0000
Message-ID: <ead0bdd9-8f0f-4deb-ba1b-e078262c5164@suse.de>
Date: Mon, 21 Sep 2026 14:34:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] nvme-tcp: refactor I/O queue setup path
To: Surabhi Gogte <sgogte@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: Solganik Alexander <sashas@lightbitslabs.com>,
 Roy Shterman <roys@lightbitslabs.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, mkhalfella@purestorage.com,
 randyj@purestorage.com, adailey@purestorage.com
References: <20260910202812.1642832-1-sgogte@purestorage.com>
 <20260910202812.1642832-3-sgogte@purestorage.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260910202812.1642832-3-sgogte@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 7D80F1FA79
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,purestorage.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On 9/10/26 10:28 PM, Surabhi Gogte wrote:
> Split the I/O queue setup helpers apart so that the individual steps can
> be called directly from nvme_tcp_configure_io_queues():
> 
> - Queue count negotiation moves out of nvme_tcp_alloc_io_queues() into a
>    new nvme_tcp_set_io_queue_count(), leaving the allocator with just the
>    per-queue allocation loop.
> - TLS PSK validation moves out of __nvme_tcp_alloc_io_queues() into a
>    new nvme_tcp_tls_check_psk().
> - nvme_tcp_configure_io_queues() now calls the three steps directly in
>    the same order as before.
> 
> Signed-off-by: Surabhi Gogte <sgogte@purestorage.com>
> ---
>   drivers/nvme/host/tcp.c | 25 +++++++++++++++++++------
>   1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 8e5e22febe2a..fe0e581608b4 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -2172,10 +2172,8 @@ static int nvme_tcp_alloc_admin_queue(struct nvme_ctrl *ctrl)
>   	return ret;
>   }
>   
> -static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
> +static int nvme_tcp_tls_check_psk(struct nvme_ctrl *ctrl)
>   {
> -	int i, ret;
> -
>   	if (nvme_tcp_tls_configured(ctrl)) {
>   		if (ctrl->opts->concat) {
>   			/*
> @@ -2197,6 +2195,13 @@ static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
>   		}
>   	}
>   
> +	return 0;
> +}
> +
> +static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
> +{
> +	int i, ret;
> +
>   	for (i = 1; i < ctrl->queue_count; i++) {
>   		ret = nvme_tcp_alloc_queue(ctrl, i,
>   				ctrl->tls_pskid);
> @@ -2213,7 +2218,7 @@ static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
>   	return ret;
>   }
>   
> -static int nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
> +static int nvme_tcp_set_io_queue_count(struct nvme_ctrl *ctrl)
>   {
>   	unsigned int nr_io_queues;
>   	int ret;
We are not only set the queue count, but also allocating the queues
themselves. Why not keep the original name?

> @@ -2235,14 +2240,22 @@ static int nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
>   
>   	nvmf_set_io_queues(ctrl->opts, nr_io_queues,
>   			   to_tcp_ctrl(ctrl)->io_queues);
> -	return __nvme_tcp_alloc_io_queues(ctrl);
> +	return 0;
>   }
>   
>   static int nvme_tcp_configure_io_queues(struct nvme_ctrl *ctrl, bool new)
>   {
>   	int ret, nr_queues;
>   
> -	ret = nvme_tcp_alloc_io_queues(ctrl);
> +	ret = nvme_tcp_set_io_queue_count(ctrl);
> +	if (ret)
> +		return ret;
> +
> +	ret = nvme_tcp_tls_check_psk(ctrl);
> +	if (ret)
> +		return ret;
> +
> +	ret = __nvme_tcp_alloc_io_queues(ctrl);
>   	if (ret)
>   		return ret;
>   

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
