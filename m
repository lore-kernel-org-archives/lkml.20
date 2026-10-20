Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491647;
	b=CH/yjTyHao9c8bd0nntkkgMYJ+6hVYOqYVjmLGCKseHK4gYOfI2NJHdL1IW6XSgq3wL6
	 CpHUPK/oUNV65jGHIA9XPQ7YqFLr94g+Uvs5N1Xkj06XRGJBhENSuwlWEBfgCh3FMKJn7
	 OurmW6lEHVJUCMOvPZV+sD0MkAK1pBwXjQDc8222+fvvNFUEqBqcQihdiaASCOHM41JJx
	 8u86XTzNaIUTL9+NNYjs++M+5x+TiFL6NFfFlXKZzf/OJmUavvIOzCNFitahcg97+HmEb
	 HG4eP/DvSx22A0V8Qe+bLNQyZrrzF01eVj9u4Rk2/TZdgG0rBq54MNjTBJJl37e/6KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491647;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spamd-Result;
	bh=25aVXgi6SWasWSeCW5QMXwqU2gQ9vVm4pvwVKdSYMZc=;
	b=RvsT5xKeRAxrc3HzFbPbDaCLJCv6bF/QqJIhG/EDMmQczGNxfgrewDbZ1vDmAm7ckaY7
	 1IBt8KMCvb8f1klF1o9FZh0N5ZbwminrL0uyZ6VOLi21I52Wkmr1BnlDD2m3P19JFytPT
	 +rii56tWqgE22SOUC0F6DzQcc+Qa/yuPQ4soCUFrlx6Z3np7dWUg/UBZmSdAJGukSKSbx
	 RfaEUFdWXiALz4kyeUFpIFbtU6QeQgz6v85LW4Uc1uFwIjNYPH1mYGVt745IKqaQqYt+R
	 5ubp7PF5Gl/hf0/eTX4dUk3vdVahdlKkfcXXtU5w4c5aNZNqKpbco+FWXPfVhrfM+iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eaiSfxNJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f6NxCOvn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RpHbjaJh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lobOf5t8;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC86E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC86E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eaiSfxNJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f6NxCOvn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RpHbjaJh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lobOf5t8
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C9D3A1F79E;
	Tue, 20 Oct 2026 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792491645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=25aVXgi6SWasWSeCW5QMXwqU2gQ9vVm4pvwVKdSYMZc=;
	b=eaiSfxNJdKSwCN2dyg187X71afGSeRcvfSnkgakhV5O6utFBBI8xssuyQ+fTiztUs47GiG
	bswl6eBViAHI5w+hx4kQ+jenEBv9Al6C6ynT8m3V7ZiBFpp4Cz1+IBPSOrsytpYk13Ghh5
	fhEsxRDZOitNqlJxj5flrQ7K47hCr+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792491645;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=25aVXgi6SWasWSeCW5QMXwqU2gQ9vVm4pvwVKdSYMZc=;
	b=f6NxCOvnNbrxn7AxKMQ1A2ETXERZAWOHohS+P12wOBa/6zkHtq951M20mm0K8s2mnROnZe
	G8NHVbk7wq2GRjAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792491644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=25aVXgi6SWasWSeCW5QMXwqU2gQ9vVm4pvwVKdSYMZc=;
	b=RpHbjaJhmbh7BPvouq05swVBBr0c4MfcTL5QFSPHtmZB44FC7+VBmR7zEggrUj/44LQ7QH
	KBOoUgj9TMxp6J7qYTuj5CN6X6d1228Lo7ZuADyE8e8XG/GbD36+kZLeGfmwlzVnYvCtkm
	vDSvSWCRLF5UkLtNhsNrtfukOcfbTLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792491644;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=25aVXgi6SWasWSeCW5QMXwqU2gQ9vVm4pvwVKdSYMZc=;
	b=lobOf5t88JndC+BT6NzcFtTTSptb/fjVJDTALumAq5NY6e7/li98fewVbRRAmm/6thdwir
	dJ+5HctJQ3ffCcCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 630FB13793;
	Tue, 20 Oct 2026 10:20:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qJcpEnxA12qLNwAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 20 Oct 2026 10:20:44 +0000
Date: Tue, 20 Oct 2026 12:20:39 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 13/18] nvme-fc: perform error recovery directly from
 ioerr_work
Message-ID: <e3b4e1d4-60b2-41f3-afb4-9a914d722c68@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-14-mkhalfella@purestorage.com>
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
In-Reply-To: <20260920182936.2317916-14-mkhalfella@purestorage.com>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]

On Sun, Sep 20, 2026 at 11:28:11AM -0700, Mohamed Khalfella wrote:
> +static void
> +nvme_fc_error_recovery(struct nvme_fc_ctrl *ctrl)
> +{
> +	nvme_stop_keep_alive(&ctrl->ctrl);
> +	flush_work(&ctrl->ctrl.async_event_work);
> +
> +	/* will block while waiting for io to terminate */
> +	nvme_fc_delete_association(ctrl);
> +	nvme_stop_ctrl(&ctrl->ctrl);

Not happy that we have duplicated this part, but after reading on
tcp/rdma it's the 'common' pattern. I think it make sense to move the fc
towards how tcp/rdma is doing it so that we can make common code out of
it eventually.

So from this, looks good.

Reviewed-by: Daniel Wagner <dwagner@suse.de>
