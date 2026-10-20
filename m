Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498927;
	b=J+MyS73N29k7OJ5UJ4fF7P+MHBWsbqZOkWNaLSlHeNiamSekKuTewGU4y+6UmIwJB+Zh
	 rIPmV6gJeoqsZk8TYkPd/ug2oyAcMqfiKxsvSwMeG9PzStTMqQdW7PYXYlGUGMjB0Ew2n
	 hsrInH/cLSjFalJFt1jIrhus6mPC5ecMnhfAbFH/7l1f1BPm2yQeIxGSkwjL2qvI76AZH
	 jcxh03xDCsivn8LXUC9ZTHCDFTFCgtmnkkOD+p9tVdUgTa9XEqwiFxmjI3Vp/LWZ/5OF2
	 E0G7TVHLnLhyE6pqsMC+WcXg05PYLUjAQ4jG+EkTm2e7gJ+pwkPdxX4z4+PTzHyvWHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498927;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=KkdOQF0m+VfCrOGlCq2herx/7lAkHYLAIwNn9wrEEEM=;
	b=NB5YybVkCHxio2qs/BoT3Xs7xpOyEkzmQOsuDMzyuBiM28fr+jLYtBjAH8TqBITGAVoD
	 xoWwxuJG4H04uqjdtWGVFbAG18Piyxtp5xYYz8F3tBG5IIdYKoao6Rltbp+z2Ijun7hoM
	 iSqMhx0nj1rVI8g0OhXIdeEyeRcAJWJbp5mbMD5zksUhFYFyPwOVhIC5d14vlv+alN/fD
	 XB5PB+CfAyGUluHF7Q1kZ2EQrneMHNHNkr3eqRpOEWYCiT7XkqjJxDB6M5wAa4INwArZU
	 EfUKOi+uSxHNugOO1JApP6gAqPVYFkun3q0gC/ygxOSGpMf/TiLrFAQmlt2eAu9H/qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AtXUaZHV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jhdASn89;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AtXUaZHV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jhdASn89;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93784606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93784606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AtXUaZHV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jhdASn89;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AtXUaZHV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jhdASn89
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CB6EE21C13;
	Tue, 20 Oct 2026 12:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792498924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KkdOQF0m+VfCrOGlCq2herx/7lAkHYLAIwNn9wrEEEM=;
	b=AtXUaZHVbjvFx/np1/j9/VTGr0IopTQ2XXR3qiwy9WQNdGorBP59AmoTxJJ8LHSsSU16JN
	SdwAcffH/+cK8b62XwG0tcV05DR5xG7AT3+/UioS44pMoyAOJaC7FsIKJvPzGD7v6/0w+d
	JxcUsOP6S3/k/yRdwGgYbL/WLvjCAg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792498924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KkdOQF0m+VfCrOGlCq2herx/7lAkHYLAIwNn9wrEEEM=;
	b=jhdASn89S2lCXY1P00Y6QutuRJylGB7WSBYACwCBk+JPWOr+pk2UmBCko+qgSUmLg85iqH
	P/+dan8VS8LOYcBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792498924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KkdOQF0m+VfCrOGlCq2herx/7lAkHYLAIwNn9wrEEEM=;
	b=AtXUaZHVbjvFx/np1/j9/VTGr0IopTQ2XXR3qiwy9WQNdGorBP59AmoTxJJ8LHSsSU16JN
	SdwAcffH/+cK8b62XwG0tcV05DR5xG7AT3+/UioS44pMoyAOJaC7FsIKJvPzGD7v6/0w+d
	JxcUsOP6S3/k/yRdwGgYbL/WLvjCAg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792498924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KkdOQF0m+VfCrOGlCq2herx/7lAkHYLAIwNn9wrEEEM=;
	b=jhdASn89S2lCXY1P00Y6QutuRJylGB7WSBYACwCBk+JPWOr+pk2UmBCko+qgSUmLg85iqH
	P/+dan8VS8LOYcBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EA9D136CC;
	Tue, 20 Oct 2026 12:22:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RSgUGuxc12oiOQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 20 Oct 2026 12:22:04 +0000
Date: Tue, 20 Oct 2026 14:21:59 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 15/18] nvme-fc: Hold inflight requests while in
 FENCING state
Message-ID: <d9563967-9ddb-4cd7-9149-d1f37522e1fa@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-16-mkhalfella@purestorage.com>
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
In-Reply-To: <20260920182936.2317916-16-mkhalfella@purestorage.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, Sep 20, 2026 at 11:28:13AM -0700, Mohamed Khalfella wrote:
>  static void
> -nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl)
> +__nvme_fc_teardown_association(struct nvme_fc_ctrl *ctrl)
>  {
>  	struct nvmefc_ls_rcv_op *disls = NULL;
>  	unsigned long flags;
>  
> -	if (!test_and_clear_bit(ASSOC_ACTIVE, &ctrl->flags))
> -		return;
> -
>  	spin_lock_irqsave(&ctrl->lock, flags);
>  	set_bit(FCCTRL_TERMIO, &ctrl->flags);
> -	ctrl->iocnt = 0;
> +	atomic_set(&ctrl->iocnt, 0);
>  	spin_unlock_irqrestore(&ctrl->lock, flags);
>  
>  	__nvme_fc_abort_outstanding_ios(ctrl, false);
> @@ -3287,11 +3328,18 @@ nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl)
>  	nvme_fc_abort_aen_ops(ctrl);
>  
>  	/* wait for all io that had to be aborted */
> +	wait_event(ctrl->ioabort_wait, atomic_read(&ctrl->iocnt) == 0);
>  	spin_lock_irq(&ctrl->lock);
> -	wait_event_lock_irq(ctrl->ioabort_wait, ctrl->iocnt == 0, ctrl->lock);
>  	clear_bit(FCCTRL_TERMIO, &ctrl->flags);
>  	spin_unlock_irq(&ctrl->lock);
>  
> +	/*
> +	 * Wait for a started nvme_fc_fcpio_done() to complete before we
> +	 * proceed with cancelling inflight requests. This guarantees a
> +	 * request is completed by one of the two codepaths, not both.
> +	 */
> +	synchronize_rcu();
> +

The synchronize_rcu() protects against nvme_cancel_tagset() racing with
an fcpio_done() for an op that completed normally and therefore wasn't
counted in iocnt. Wouldn't it be clearer to make the hold explicit in
op->state (e.g. FCPOP_STATE_HELD) and only complete held ops in
nvme_fc_flush_held_requests(), instead of using RCU as a barrier for
running callbacks?
