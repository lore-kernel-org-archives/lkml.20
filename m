Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489023;
	b=gS+W32fNSzgaZtxaoJLtihubV+MkCR5hSzpbjBMfdXuXVbNHovj7cIO8xAux8l5NOzus
	 0jdmEI+x0h77EFnFQE90R/AxlMdsrs5pABnOAfGQQ6QO7YgeH6Ylu19WjBJGIuNXoP04M
	 VuYJhoBhrVW8mrPq27Rbp96rHjVgnktqKfZj7b4hOW24DdbxfKcHt4KqAtfwzQdVzYrub
	 ro6zBcPE66xJQ59I8VFD1zK+Ih+mBiaK+Iy92vRPegYjsO/tb0Elra+DH1m0ela9oL8xs
	 2CnnBgm8936xnt4JYJ/bD/lWGRtTurOLFSgq9Amsx3sbrTL/1Ysy/YiYEez6VqeamjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489023;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Rspamd-Action:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=iNVwXEKTBC/72qphnT2ap3ikWCo3v6If04rWDXywPlM=;
	b=PcTSMf1xDYQzlEjZr3j3c9Eo4o46yzDNer3U8rWgtjLX1mWOhB6HSMSHyXR3ZOMw4emB
	 BphMhpcYRzNNtTMVgDQ7vzkYxxfjnRd2ZmxRTtnyas4vDB5cmgglmSSHdX+g4sCHVZNMa
	 gl79aYxhD3YrQt8ZWG4IDd8MJ6BvLojtXl574Ef3UZJPaERqT6RR4PYZoNHgV5oVL1hm0
	 GMGOdTYhbid7Y9GGIoiL4+lFvsmUGtGCJA4LqVRzHwe6f3OXE6TfrcZnFS7DrHh4xqtkV
	 Qylfnh8Cs5IxI2j/unHedMLJ421/JqzD+gzzTFFJ6yKXH8vN7u2b8PevWR7DjipXsMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JNWQmoxr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zO4Ds2zy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JNWQmoxr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zO4Ds2zy;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DE160A2601
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08DE160A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JNWQmoxr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zO4Ds2zy;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JNWQmoxr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zO4Ds2zy
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B32321C13;
	Tue, 20 Oct 2026 09:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792489021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iNVwXEKTBC/72qphnT2ap3ikWCo3v6If04rWDXywPlM=;
	b=JNWQmoxroueCA0tPjH8HCx93RvPXWROb9vW5w506dgIkyoXP8/wBfHqKRt3ZlsOx84c4zP
	JwWSVOweAQ9H+cqryXbf/tZa9n9Od0Ti95tVu6V4bKvnCg5pcOdtiZG+jvFoKRp8RBTE9/
	+YIBZvWGqpCDnc2TBWumAyIvnu+NwYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792489021;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iNVwXEKTBC/72qphnT2ap3ikWCo3v6If04rWDXywPlM=;
	b=zO4Ds2zyTTbURvetQrlnPSpFHitNwrjBJbXmTNY+XlzAfGz5TTi/gtyGRkIyKz2elzmNbi
	3P2Y8fXgh0m8+eBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JNWQmoxr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zO4Ds2zy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792489021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iNVwXEKTBC/72qphnT2ap3ikWCo3v6If04rWDXywPlM=;
	b=JNWQmoxroueCA0tPjH8HCx93RvPXWROb9vW5w506dgIkyoXP8/wBfHqKRt3ZlsOx84c4zP
	JwWSVOweAQ9H+cqryXbf/tZa9n9Od0Ti95tVu6V4bKvnCg5pcOdtiZG+jvFoKRp8RBTE9/
	+YIBZvWGqpCDnc2TBWumAyIvnu+NwYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792489021;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iNVwXEKTBC/72qphnT2ap3ikWCo3v6If04rWDXywPlM=;
	b=zO4Ds2zyTTbURvetQrlnPSpFHitNwrjBJbXmTNY+XlzAfGz5TTi/gtyGRkIyKz2elzmNbi
	3P2Y8fXgh0m8+eBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECBAF136C6;
	Tue, 20 Oct 2026 09:37:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4lH1MTw212qJBgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 20 Oct 2026 09:37:00 +0000
Date: Tue, 20 Oct 2026 11:36:56 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 11/18] nvme-rdma: Use CCR to recover controller that
 hits an error
Message-ID: <8cfb3b90-7629-4a8c-a393-7f724f01c19c@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-12-mkhalfella@purestorage.com>
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
In-Reply-To: <20260920182936.2317916-12-mkhalfella@purestorage.com>
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2B32321C13
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51

On Sun, Sep 20, 2026 at 11:28:09AM -0700, Mohamed Khalfella wrote:
> @@ -1990,13 +2014,15 @@ static enum blk_eh_timer_return nvme_rdma_timeout(struct request *rq)
>  	struct nvme_rdma_ctrl *ctrl = queue->ctrl;
>  	struct nvme_command *cmd = req->req.cmd;
>  	int qid = nvme_rdma_queue_idx(queue);
> +	enum nvme_ctrl_state state;
>  
>  	dev_warn(ctrl->ctrl.device,
>  		 "I/O tag %d (%04x) opcode %#x (%s) QID %d timeout\n",
>  		 rq->tag, nvme_cid(rq), cmd->common.opcode,
>  		 nvme_fabrics_opcode_str(qid, cmd), qid);
>  
> -	if (nvme_ctrl_state(&ctrl->ctrl) != NVME_CTRL_LIVE) {
> +	state = nvme_ctrl_state(&ctrl->ctrl);
> +	if (state != NVME_CTRL_LIVE && state != NVME_CTRL_FENCING) {

documentation needs to be udpated like in the tcp patch.
