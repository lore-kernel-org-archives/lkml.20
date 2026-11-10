Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315347;
	b=VfM8s85AdQk4vsiy/dpKaRo1SD9FXQvGXavrleVaP/jTRzEAaTL4e0sXYMP/WYPAXf1O
	 UIymEbEOGGwj9u7nwwZ7k2/1nLjOdBO/Si1rFNJk5i/RmJW1kAC/iX5bqv1jZ/lSt9vOm
	 mQ3BhbJtE+o8FIIGgq5Dhn2DrSiNlHHFCoRzHYhJR88aNH1mXZWC0HLIXx7L5X5oHezJZ
	 PUDSWPQz9PqIcM+Tx1aOST29Dqca4czBtEz/sLb1Mx318FvpXv+tCXlMEVk6hBM1bCzX/
	 EBXQBXf1qEU5jlttvMKcr1YURWsL0le8a+MCMBS1mtifQR4Qg0EEb/RooRG4w1BjiTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315347;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:
	 X-Spam-Level:X-Spam-Flag;
	bh=G2tDSge8kYrin1SA/inaPmpvgHGz/bSIb4IKARoBuOE=;
	b=qDh6KJ5Xn9RriftIG5fYEPjca/w9CQg+2YRxyAb5beIRU6PiX4qZ8jOteQSGbWp+Gt8w
	 DXxOxwCfuo5CqGoQbYKdfT8Sjcr+gY+OlNkRwzmSKjFw7ML9yjKaOffy/6cXs1nKZpjc/
	 HjasxHmvON306hnmUYX3Nt0Y0HxMDQlGc+6F++VaHkAXxq8GX27JWr9CzCmQXOwcTsC4i
	 AgguYEC5Ga6EzS0irRf+ASwuHvuZwXLyRdNuwTFeL0CMhddrxnvnPAWj1JkuaeZiQChvj
	 lZ0yv1OsBgsCwgc3T//ol0E1BF7fuA1OYvS5Y7lmluzXXdEayQ2emM3qcZOw+2COefw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OY3wGhqG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QcnOGgcp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OY3wGhqG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QcnOGgcp;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D96260A5BE2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D96260A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OY3wGhqG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QcnOGgcp;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OY3wGhqG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QcnOGgcp
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C357E21EFD;
	Tue, 10 Nov 2026 12:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794315344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G2tDSge8kYrin1SA/inaPmpvgHGz/bSIb4IKARoBuOE=;
	b=OY3wGhqGrse184pX0UQm8P9Ms8iy/lBZy8po6SkbH6GR4VV17znkmv3yGahOOApwGDMjrz
	3VC4XdUmZNcTMLlW8/h/KIYRUDUGIBpjxy3pvYKtiYHXmVPEKmLSy518yNpZmcw/Jt39kW
	qmuqAYVErNVei+gsUlC6ExhX4J2qyr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794315344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G2tDSge8kYrin1SA/inaPmpvgHGz/bSIb4IKARoBuOE=;
	b=QcnOGgcpdzBHWTeU4669kegBu8MRVFJX1eUxh4iVvOGbfNjszoU1xZzhdn37tg4VbTHvDi
	tm0taBttNrmHcCAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794315344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G2tDSge8kYrin1SA/inaPmpvgHGz/bSIb4IKARoBuOE=;
	b=OY3wGhqGrse184pX0UQm8P9Ms8iy/lBZy8po6SkbH6GR4VV17znkmv3yGahOOApwGDMjrz
	3VC4XdUmZNcTMLlW8/h/KIYRUDUGIBpjxy3pvYKtiYHXmVPEKmLSy518yNpZmcw/Jt39kW
	qmuqAYVErNVei+gsUlC6ExhX4J2qyr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794315344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G2tDSge8kYrin1SA/inaPmpvgHGz/bSIb4IKARoBuOE=;
	b=QcnOGgcpdzBHWTeU4669kegBu8MRVFJX1eUxh4iVvOGbfNjszoU1xZzhdn37tg4VbTHvDi
	tm0taBttNrmHcCAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89C5F1339F;
	Tue, 10 Nov 2026 12:55:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RG1yFVAU82puQwAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 10 Nov 2026 12:55:44 +0000
Message-ID: <508595ec-0540-4534-afd4-44ef8ee01da6@suse.de>
Date: Tue, 10 Nov 2026 13:55:43 +0100
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
Subject: Re: [PATCH] nvme: stop asynchronous event work before ANA teardown
To: Yaohan Li <shunsheng1218@gmail.com>, kbusch@kernel.org, axboe@kernel.dk,
 hch@lst.de, sagi@grimberg.me
Cc: jthumshirn@suse.de, mkp@kernel.org, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <179378587000.73780.18152328009023418065@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <179378587000.73780.18152328009023418065@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.29 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,kernel.dk,lst.de,grimberg.me];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -13.29
X-Spam-Level: 
X-Spam-Flag: NO

On 11/4/26 10:51 AM, Yaohan Li wrote:
> nvme_mpath_stop() cancels ana_work, but the asynchronous event worker
> can enqueue ANA processing again while controller teardown is in
> progress. An ANA work item can therefore survive the final
> controller release and access freed memory.
> 
> Cancel async_event_work during controller uninitialization, after the
> controller has stopped accepting new events, and cancel ana_work
> again before releasing its ANA resources. Draining only ana_work is
> not sufficient while the event worker can requeue it.
> 
> The race was reproduced with the in-tree NVMe loop target and
> scheduling injection. Cancelling ANA work alone left reports; draining
> the event source and the ANA work together removed the reported
> use-after-free under the same test conditions.
> 
> Fixes: 0d0b660f214dc ("nvme: add ANA support")
> Assisted-by: ZCode:GLM-4
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
> ---
>   drivers/nvme/host/core.c      | 9 +++++++++
>   drivers/nvme/host/multipath.c | 7 +++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index a7a4d09644c13..017aae1189de1 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -5182,6 +5182,15 @@ EXPORT_SYMBOL_GPL(nvme_start_ctrl);
>   void nvme_uninit_ctrl(struct nvme_ctrl *ctrl)
>   {
>   	nvme_stop_keep_alive(ctrl);
> +
> +	/*
> +	 * Stop the async event worker before the final put: it processes
> +	 * ANA change events by re-queueing ctrl->ana_work, which is
> +	 * embedded in ctrl and cancelled in nvme_free_ctrl(); a worker
> +	 * running past that point would re-queue it onto freed memory.
> +	 */
> +	cancel_work_sync(&ctrl->async_event_work);
> +
>   	nvme_hwmon_exit(ctrl);
>   	nvme_fault_inject_fini(&ctrl->fault_inject);
>   	dev_pm_qos_hide_latency_tolerance(ctrl->device);
> diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
> index 9e0a0fd77c56e..44bd1a1ad5940 100644
> --- a/drivers/nvme/host/multipath.c
> +++ b/drivers/nvme/host/multipath.c
> @@ -1610,6 +1610,13 @@ int nvme_mpath_init_identify(struct nvme_ctrl *ctrl, struct nvme_id_ctrl *id)
>   
>   void nvme_mpath_uninit(struct nvme_ctrl *ctrl)
>   {
> +	/*
> +	 * nvme_mpath_stop() already cancelled ana_work, but an ANA async
> +	 * event completing after nvme_stop_ctrl() can have re-queued it.
> +	 * It is embedded in ctrl, which is freed after uninit.
> +	 */
> +	cancel_work_sync(&ctrl->ana_work);
> +
>   	kvfree(ctrl->ana_log_buf);
>   	ctrl->ana_log_buf = NULL;
>   	ctrl->ana_log_size = 0;

Why can we schedule AENs when a controller teardown is active?
Shouldn't we rather disallow that instead of fixing the fallout?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
