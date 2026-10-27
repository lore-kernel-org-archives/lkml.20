Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086246;
	b=JL0eG7LV2pZVtcErXbjr5OJlslN6sGIDvBsxOii/KiygjD3YK+0kOxTovPnUnydBQs9I
	 /SLxCq1FhL4QdTd+mWvCSh64zb2b6xlQGrXDR6oq+UfenF0dff+YCvbcUGrQe8wktJGvP
	 T1QnFiWZoYPSU93N1inlimnLMxLR8YD5eN84FmcJ01oem/5FK/lStAh4aQYbRDwpHnGIT
	 Xt28P31tCeDiNetxvSWc8nCWS9LA/53KLtGCIQXkLBXFzCDPfTHHH2FRk1/9WsiqyJuJo
	 I/IFf2I0DjnZFh5l5Buu4VgXCn2D8OENjFGzvmM1oLJIUKBqANmANG++YWxl5ZKiL+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086246;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=gI7E+robBP6vgz9AL/HxFuX0LqTlbehBrFtgVWJIAYw=;
	b=I2IvhBDVkeBJGtpSCGu5XYeL/rG1U8BoHKhduHMNavsJASd1ChzNYpUpnn5VnVSqDXGJ
	 99KVSjUWnZtiUaj3mikdbkuqOwOqCRDMAgMwg9K7/Un6HcP4W6Z2J3rtiU+XaRBK5lIun
	 BQpeNBZQr3jSOS44n/fy9Zq7LIUMa2FgMGMMGKbvaCZR0YdZAYJ5oFaEAXkeM5FK7DdvH
	 Fnc+AQ5uiEgsV1MO3xibFRu+jehyZWElUylXWjkS7lRCPS0Am2pqFJ60tN/yVGf20Vf+6
	 WMZc9KA/nLbioQeD48hpeowGQccBw8dC/eoV4mumQCK6qLM9UamWXhfjI+KoQAOdQ8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qi2N0Y9q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ojZIl4B6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jOeS8eCt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d60X7RGx;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1625C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1625C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qi2N0Y9q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ojZIl4B6;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jOeS8eCt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d60X7RGx
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DF8C51F791;
	Tue, 27 Oct 2026 07:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793086244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gI7E+robBP6vgz9AL/HxFuX0LqTlbehBrFtgVWJIAYw=;
	b=qi2N0Y9qCDuQb8ebeIIjVbVCIG2MJId/A6sTYauxyk5lkMSgBdiYSrrxHlf/inlq6rEULp
	Nuj4w4BlGQ+LGK8xCION3ccvQ5YaOOetRJM/6Jd1f2XxbtSYKvH5H+WlW6aSgH15HIy4TY
	jeuRxp7P54b8b4m8XI4PNYkGlKwoNs8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793086244;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gI7E+robBP6vgz9AL/HxFuX0LqTlbehBrFtgVWJIAYw=;
	b=ojZIl4B6Y1U2DT3tvez4Hpu6htpCXsyM1cm7HyciNBauv+EGgjJQfSoDPtMedA7lRuQsCy
	klNMcSrxrEG4umCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jOeS8eCt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=d60X7RGx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793086243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gI7E+robBP6vgz9AL/HxFuX0LqTlbehBrFtgVWJIAYw=;
	b=jOeS8eCtNCe5WQOCzWHEwVcZUcoPgzmIOF0+PPzxGICFYaGDmUN16NtdNxT1V6MFdFrbis
	dJpgedRnAVBVJJRzD00M4PQvHDN9j4GVbX8wq2dpynobUbUyN6TaNpW3ju4rrgYndiTcHA
	fxFPVgmgTWmBoM6TA24lbfvFsu8OF/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793086243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gI7E+robBP6vgz9AL/HxFuX0LqTlbehBrFtgVWJIAYw=;
	b=d60X7RGxoTIUrEWST7bIq7YuoPiAsrhrAGO8SgvV1u+UbytXDA1upOejxYLHbXotDIKPDT
	9UIyOLAdFCWrrVCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89CAA13319;
	Tue, 27 Oct 2026 07:30:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fv0TEiNT4Gq1VQAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 27 Oct 2026 07:30:43 +0000
Message-ID: <75b7772e-75bb-4976-aec6-d94c37e651ab@suse.de>
Date: Tue, 27 Oct 2026 08:30:42 +0100
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
Subject: Re: [PATCH 1/2] nvme-tcp: start error recovery when read_sock fails
To: martin.nvme.dev@gmail.com, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Belanger <martin.belanger@dell.com>
References: <20261026-nvme-tcp-ctrlrec-fixes-v1-0-ebf6ff7eff34@gmail.com>
 <20261026-nvme-tcp-ctrlrec-fixes-v1-1-ebf6ff7eff34@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261026-nvme-tcp-ctrlrec-fixes-v1-1-ebf6ff7eff34@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DF8C51F791
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.00 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,kernel.dk,lst.de,grimberg.me];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email]
X-Spam-Score: -12.00

On 10/26/26 7:09 PM, Martin Belanger via B4 Relay wrote:
> From: Martin Belanger <martin.belanger@dell.com>
> 
> nvme_tcp_recv_skb() disables the queue and starts error recovery for
> errors it detects itself. An error returned by the transport reaches
> nvme_tcp_try_recv() without either action.
> 
> nvme_tcp_io_work() returns on a negative result and does not requeue
> itself, so the queue stops receiving and remains stalled until a command
> times out.
> 
> Report the error and start error recovery when the queue is still
> enabled, which indicates that the error was not handled by the actor.
> 
> Assisted-by: LLM
> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
> ---
>   drivers/nvme/host/tcp.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 7190eb10c248..a03476f0f69d 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -1431,7 +1431,21 @@ static int nvme_tcp_try_recv(struct nvme_tcp_queue *queue)
>   	queue->nr_cqe = 0;
>   	consumed = sock->ops->read_sock(sk, &rd_desc, nvme_tcp_recv_skb);
>   	release_sock(sk);
> -	return consumed == -EAGAIN ? 0 : consumed;
> +	if (consumed == -EAGAIN)
> +		return 0;
> +
> +	/* nvme_tcp_recv_skb() does both of these itself, so a queue that is
> +	 * still enabled failed inside read_sock() instead
> +	 */
> +	if (unlikely(consumed < 0 && queue->rd_enabled)) {
> +		dev_err(queue->ctrl->ctrl.device,
> +			"queue %d: receive failed: %d\n",
> +			nvme_tcp_queue_id(queue), consumed);
> +		queue->rd_enabled = false;
> +		nvme_tcp_error_recovery(&queue->ctrl->ctrl);
> +	}
> +
> +	return consumed;
>   }
>   
>   static void nvme_tcp_io_work(struct work_struct *w)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
