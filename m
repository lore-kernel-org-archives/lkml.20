Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497401;
	b=FnfZDKNHV4gEVU4d94bcuOnN0voEFX7CWLl5OxL5UW69jx4BfRLBjypw4zF8YMp7mFA2
	 C/yG8vGn5Kq6xv4bTIgmI55GYiyNVrnln73z/TOm/sWb+TErSY90EvzDI4t3+uXrDDCWz
	 jcScANTbDmvZKVuAnWDttSItiVCSBGtOpamY/PQyl1z4bzmW3eytEaUHU3L1Fw4ImV1nC
	 mG/MK2DNyOG+G/ahAWe/DUnKTClVZoWjI46ppaag5HTJamb0u5R2+ScXODUssYtCZ6cdF
	 gEM34vKTxecvoGlIcYhcYADNk5ARLzw0mfbLnw16Dc1PJTSI6MvrI6o3K+QND4/NorQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497401;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Rspamd-Action:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=EsmFq0e6EdaH64zyTGvQ/vgzgA1uv9tFuipPZbK6C3Q=;
	b=z9Aswr+DM+2L3DngKR/aUhK/rbB93exy9JinJ3S4l90ouKS3j3eB97PsSwSOKXcwkvxe
	 6Si/Ig/Qyrou1AKOxgbg8MXxFHKQfNSzxg1t+MD2s7O8bis9F4CEL1OiKD60LwBtoeBS5
	 R+XWuWOZpuLmpbhvQd/7l/1sJ0JNWfX+jZREEOWfkCema0xupsUqrpmILNa/m3A1wdAAr
	 R/LsY3LOiAOJlD3JNZW9kqUFzAkR1+ZNWfSr1RSRT+ZLacU1DSzZhhJcMN/dQkooThL85
	 mIek1ctv1JeNkRcr27ePNKH9jkXkqztHYrkUeXSXAuPwO4K0Oe1nQHRlx37HCwQGeJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="1ByJ/UlL";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YRpDbDoe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="1ByJ/UlL";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YRpDbDoe;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F290F606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F290F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1ByJ/UlL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YRpDbDoe;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1ByJ/UlL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YRpDbDoe
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0DC4921C9A;
	Tue, 20 Oct 2026 11:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792497399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EsmFq0e6EdaH64zyTGvQ/vgzgA1uv9tFuipPZbK6C3Q=;
	b=1ByJ/UlLOLzrXUHAZx3nw2QiEt2qsg1FzIk+uAyDO+a2VggR2DwXFZnASDIWX+fyBmiCes
	O/m3mhm2Qv5IFAzYHzFbkz8PDx2weceZVlWEIcE+7S/m0yIDOhS5KyItpfoG9AVWg1y+5Y
	X0ZWv9ZLOqkgqIxdBsFzvLoWKmYMmZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792497399;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EsmFq0e6EdaH64zyTGvQ/vgzgA1uv9tFuipPZbK6C3Q=;
	b=YRpDbDoePAVKpEfQxux8U+jalru9NIQcLBLpCvz7tXVRzUNLhNx0HCZr8GtuFEdYoSor64
	SDGLEyYcQOlQMRBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="1ByJ/UlL";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YRpDbDoe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792497399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EsmFq0e6EdaH64zyTGvQ/vgzgA1uv9tFuipPZbK6C3Q=;
	b=1ByJ/UlLOLzrXUHAZx3nw2QiEt2qsg1FzIk+uAyDO+a2VggR2DwXFZnASDIWX+fyBmiCes
	O/m3mhm2Qv5IFAzYHzFbkz8PDx2weceZVlWEIcE+7S/m0yIDOhS5KyItpfoG9AVWg1y+5Y
	X0ZWv9ZLOqkgqIxdBsFzvLoWKmYMmZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792497399;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EsmFq0e6EdaH64zyTGvQ/vgzgA1uv9tFuipPZbK6C3Q=;
	b=YRpDbDoePAVKpEfQxux8U+jalru9NIQcLBLpCvz7tXVRzUNLhNx0HCZr8GtuFEdYoSor64
	SDGLEyYcQOlQMRBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C68D1136C6;
	Tue, 20 Oct 2026 11:56:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jzFfKPZW12pJHQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 20 Oct 2026 11:56:38 +0000
Date: Tue, 20 Oct 2026 13:56:38 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 14/18] nvme-fc: Use CCR to recover controller that
 hits an error
Message-ID: <32d5f56f-285e-43d8-b5a7-490492270e51@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-15-mkhalfella@purestorage.com>
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
In-Reply-To: <20260920182936.2317916-15-mkhalfella@purestorage.com>
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0DC4921C9A
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -4.51

On Sun, Sep 20, 2026 at 11:28:12AM -0700, Mohamed Khalfella wrote:
> +static void nvme_fc_fencing_work(struct work_struct *work)
> +{
> +	struct nvme_fc_ctrl *fc_ctrl =
> +			container_of(work, struct nvme_fc_ctrl, fencing_work);
> +	struct nvme_ctrl *ctrl = &fc_ctrl->ctrl;
> +	unsigned long rem;
> +
> +	/*
> +	 * Tear the association down now so the LLDD can finish unregistering
> +	 * the remoteport/localport while the fencing this controller.
> +	 */


Maybe:

          /*
           * Tear down the association before fencing starts. Fencing can take
           * a long time and the LLDD can't finish unregistering the
           * remoteport/localport until all associations on it are gone.
           * Inflight requests are held and only completed once fencing has
           * finished.
           */
?
