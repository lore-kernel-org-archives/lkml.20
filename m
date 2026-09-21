Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D4E4963B3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993934; cv=none; b=eU5Tx4337VSg2xzEbQiqcznFWDnk4Slarl5MzPhcMytqSrpDEYpKHHEv6z/HLEYRFD4WzcoDVTdPNQO41ZQPi5Hp65wr+5IRZSGHgtjnyGxide7aOp5J863m3OA1COBI8nO+n+l5lPBZR7//tHoMxh74I5fs1Sx9WD55DJdEKdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993934; c=relaxed/simple;
	bh=26CCH4x7xMkobSUoJjZDp0XrZ7SmOzdV8Bn+V0w7UFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+M21onQ6d7IkM2Npj8eHcm/81AyN3d6K5zCLaghyThTLwBx+dKaKsQBGbUhjjg0UhpyaGHV1uSa/cslQCJRr2oMcJzja+iTWC+CcOK2pHJssAnUvzDRCmXSLf1dy32ZO3zeJITx8n3kW8Yu2c5jw9LGXBpHvUhx0ALcHjZ/4Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jQ5vbXzp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IWjygoxq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=COody+hK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g+PVfw31; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jQ5vbXzp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IWjygoxq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="COody+hK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g+PVfw31"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 60A541F461;
	Mon, 21 Sep 2026 12:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789993926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0Y+8RS1Mt/cACqt4MgQkaT1I2r0pKJbCajMwEK33DQ=;
	b=jQ5vbXzp2ejkwvTT+sYwkgWsj3lOa14gLxZhToMrpWaeAxtGO4JSYbpHYxkdJje7iBny2X
	du6V7YDCSJ4/i9fWikJojhMGCLsATV0i1u2WtdCIwvOhLWbcje/Q3b7hlH5OTvR1r3m8hY
	hA//AHcHFPPmgoI1OP+wY2tFca5VSb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789993926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0Y+8RS1Mt/cACqt4MgQkaT1I2r0pKJbCajMwEK33DQ=;
	b=IWjygoxqmh+m/s1v31YGONtimtZImxX+iTpF6JGYVgD7A49bOyzSJ2mdfqVxm8LhjCmuI6
	2L3Pk/5iN9/pnZCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=COody+hK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=g+PVfw31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789993922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0Y+8RS1Mt/cACqt4MgQkaT1I2r0pKJbCajMwEK33DQ=;
	b=COody+hKxxtyVuW13xiXyoHHtrc0IjCLSLsqdi/F9oZj4BXc61x13+RNXFRdXnCTaVKU6O
	4pelxsN35bYBE90kIuXSdedFscfzBWSoG1+ujaAO/2QVIcy3ufMCWHxSAqNB68/f85VgJv
	lvnIgfRJ+ZYRYpPk6cLBHalsuk5K9I0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789993922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0Y+8RS1Mt/cACqt4MgQkaT1I2r0pKJbCajMwEK33DQ=;
	b=g+PVfw313Gu55NfblWgyKA/iKpaMss171rCHt3B49AFjpJFqfHCihPG9KPlynIQBYBkfWt
	sEsSfxUsETZLFECg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D68CF13793;
	Mon, 21 Sep 2026 12:32:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fx05JsEjsWqxQwAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 21 Sep 2026 12:32:01 +0000
Message-ID: <30f9337b-a4b3-4e5c-a6ff-19977d039447@suse.de>
Date: Mon, 21 Sep 2026 14:32:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] nvme-tcp: store and use the caller's network
 namespace
To: Surabhi Gogte <sgogte@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: Solganik Alexander <sashas@lightbitslabs.com>,
 Roy Shterman <roys@lightbitslabs.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, mkhalfella@purestorage.com,
 randyj@purestorage.com, adailey@purestorage.com
References: <20260910202812.1642832-1-sgogte@purestorage.com>
 <20260910202812.1642832-2-sgogte@purestorage.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260910202812.1642832-2-sgogte@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 60A541F461
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51

On 9/10/26 10:28 PM, Surabhi Gogte wrote:
> nvme_tcp_alloc_queue() creates each socket using
> current->nsproxy->net_ns, which is correct for the initial connect that
> runs in userspace context. However, the reconnect and error recovery
> paths run from a workqueue where current netns is a kernel thread in
> init_net, so sockets created during reconnect end up in a different
> namespace than the one the controller was originally connected from.
> 
> Fix this by capturing the caller's network namespace at controller
> allocation time. Use ctrl->net for all socket creation so that every
> queue, on initial connect, reset, or reconnect, is created in the same
> namespace.
> 
> Fixes: 3f2304f8c6d6 ("nvme-tcp: add NVMe over TCP host driver")
> Signed-off-by: Surabhi Gogte <sgogte@purestorage.com>
> ---
>   drivers/nvme/host/tcp.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 5fda9661bdb7..8e5e22febe2a 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -171,6 +171,7 @@ struct nvme_tcp_ctrl {
>   	struct delayed_work	connect_work;
>   	struct nvme_tcp_request async_req;
>   	u32			io_queues[HCTX_MAX_TYPES];
> +	struct net		*net;
>   };
>   
>   static struct workqueue_struct *nvme_tcp_wq;
> @@ -1846,7 +1847,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
>   		queue->cmnd_capsule_len = sizeof(struct nvme_command) +
>   						NVME_TCP_ADMIN_CCSZ;
>   
> -	ret = sock_create_kern(current->nsproxy->net_ns,
> +	ret = sock_create_kern(ctrl->net,
>   			ctrl->addr.ss_family, SOCK_STREAM,
>   			IPPROTO_TCP, &queue->sock);
>   	if (ret) {
> @@ -2638,6 +2639,7 @@ static void nvme_tcp_free_ctrl(struct nvme_ctrl *nctrl)
>   
>   	nvmf_free_options(nctrl->opts);
>   free_ctrl:
> +	put_net(ctrl->net);
>   	kfree(ctrl->queues);
>   	kfree(ctrl);
>   }
> @@ -3036,12 +3038,15 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
>   		goto out_free_ctrl;
>   	}
>   
> +	ctrl->net = get_net(current->nsproxy->net_ns);
> +
>   	ret = nvme_init_ctrl(&ctrl->ctrl, dev, &nvme_tcp_ctrl_ops, 0);
>   	if (ret)
>   		goto out_kfree_queues;
>   
>   	return ctrl;
>   out_kfree_queues:
> +	put_net(ctrl->net);
>   	kfree(ctrl->queues);
>   out_free_ctrl:
>   	kfree(ctrl);

Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
