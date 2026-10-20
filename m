Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500366;
	b=QCkSuhfZcP5kiENZAGVxO0UHBjP9PyAc5IWqiA7GtuU/4AleSwg1GBg1hfdruUR+qIVY
	 EqhBiMqfj8f5sF9HWunaq4/mrO/NohyOV8G2jT75IqHEqQz1DVEMElx14xc9M4l5NwEcB
	 VCZhIIzV2zuF4EcMChiwDR8qHG+QzxWYRFBaLBl58qBZPdqX2NJT8kS8N3OuWLO5EUQ+M
	 jC1iE0hfOOBb5xjcTpxt+/qEevSPvQsIgoljklqrCHadNaEQgeiJKLhhGh2adkQIJsExL
	 G32X4Tzw2tqWTlamZ/kw8ft9gbvoPBZYJWlCvXYeDaraWDBRe9YcNIWHlGh2S5NA41A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500366;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spamd-Result;
	bh=TiiWp0U7IU3ZOr9wtJZIzgg6WfTemiPc3VI8BpBKs9Q=;
	b=F32WxPwCgmm6fPBzov4tsuzxV86m25fgU8jsJbBoELI7SZr0sMRhy10asOldJyq3NMcE
	 is522YJHQykAdnIYA1jAel5AIdq8rhMOuGadPFogAsCUIM1gxdl3fIjhwK54q1ixrYwfb
	 jiDvEV1G+QfB2NqPYEUEyjs9fBC8brWS4cIJB7c7qdqq/NRjZEzAroUlDoRCrpoawxGcx
	 MaiimIhFeF0roMX6YGObAvAM3u/ZwxtORUx24awRbvksxsjscc+Pn5WH134JtHzxwYnsE
	 dFpta0ixap4jrRpeLyVuLrHjaPimtrdJasFLsFoy9//jTXLSKJaeby21Xlfov3SRNzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Uc1tQUzO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Juo5nlyG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Uc1tQUzO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Juo5nlyG;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474D606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1474D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Uc1tQUzO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Juo5nlyG;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Uc1tQUzO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Juo5nlyG
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 544CE21BF1;
	Tue, 20 Oct 2026 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792500364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiiWp0U7IU3ZOr9wtJZIzgg6WfTemiPc3VI8BpBKs9Q=;
	b=Uc1tQUzOGE1fU5Rd/Q40eBKynCWiMKmhIHLBpuPqPQjnuMmOtsjr9NEGxYhQlZJt04cc0V
	pka7QDupMVx3sckmEpWrM2iK/x2HiEszxv1UptqLy3aeLkiDeIgJT8Bc9NqE1dcPIEgiRT
	UoDqArz/RlJlOAqPyTf+pXfOxicflNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792500364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiiWp0U7IU3ZOr9wtJZIzgg6WfTemiPc3VI8BpBKs9Q=;
	b=Juo5nlyGp8ODkkdQEPpiUW+V/VLNBQkn64iZGyUP2ZgBYamI010s6Vf+GBVHc+GIJmVaLW
	j01B6w4E11Q7pVAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792500364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiiWp0U7IU3ZOr9wtJZIzgg6WfTemiPc3VI8BpBKs9Q=;
	b=Uc1tQUzOGE1fU5Rd/Q40eBKynCWiMKmhIHLBpuPqPQjnuMmOtsjr9NEGxYhQlZJt04cc0V
	pka7QDupMVx3sckmEpWrM2iK/x2HiEszxv1UptqLy3aeLkiDeIgJT8Bc9NqE1dcPIEgiRT
	UoDqArz/RlJlOAqPyTf+pXfOxicflNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792500364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiiWp0U7IU3ZOr9wtJZIzgg6WfTemiPc3VI8BpBKs9Q=;
	b=Juo5nlyGp8ODkkdQEPpiUW+V/VLNBQkn64iZGyUP2ZgBYamI010s6Vf+GBVHc+GIJmVaLW
	j01B6w4E11Q7pVAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20528136CC;
	Tue, 20 Oct 2026 12:46:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jMkIO4ti12q5UQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 20 Oct 2026 12:46:04 +0000
Date: Tue, 20 Oct 2026 14:46:03 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 17/18] nvme: Add support for CQT to nvme host
Message-ID: <4459053b-35eb-4359-99a6-05393a9a62d6@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-18-mkhalfella@purestorage.com>
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
In-Reply-To: <20260920182936.2317916-18-mkhalfella@purestorage.com>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,purestorage.com:email,grimberg.me:email]

On Sun, Sep 20, 2026 at 11:28:15AM -0700, Mohamed Khalfella wrote:
> TP4129 KATO Corrections and Clarifications defined CQT (Command Quiesce
> Time) which is used along with KATO (Keep Alive Timeout) to set an upper
> limit for attempting Cross-Controller Recovery. Add ctrl->cqt, read its
> value from controller identify response, expose it via sysfs, and have
> nvme_fence_timeout_ms() account for it.
> 
> Use CQT to drive time-based recovery in fc, rdma, and tcp transports.
> Add a fenced_work delayed work to each transport controller. If CCR
> fails, fencing_work switches to error recovery immediately if CQT is not
> supported. Otherwise it schedules fenced_work after the remaining fence
> timeout, which also switches to error recovery when scheduled.
> 
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> Reviewed-by: Hannes Reinecke <hare@kernel.org>
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

the sysfs entry needs to be documented, with this

Reviewed-by: Daniel Wagner <dwagner@suse.de>
