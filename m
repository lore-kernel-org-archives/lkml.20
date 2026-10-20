Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490153;
	b=IoQktbdLjpFJaUqEXc2A9rscmltxtvaqESxjZj7rsrD3+0sIXrl+L7dySheZYrmt2XL0
	 ZmptDTEJdRSNOnXy+dzzUBFp/0djoje3Q3z9EyowLY4hnB3uIX2Xu7korGuKJSGbJqzQk
	 PAURZ0DHkI5cWr0d/tpeQBuzOguVnrlPRpfCxYKlkj5ULw94iJsUSz5VuR2Coos87k+TN
	 mgFH2Q1Zp2WJj6T9vmBp3VrtyYpK+BqAljhNaiSZIXx/iyZkvV4RU5JCJjp3xB3x9WBnA
	 Pgmi2yL+/QMF7EQpkgzFKcd+897bg1iZOpSWHusXY0sJ9Okme/TqTGfDAwECkiUU6CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490153;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Rspamd-Action:X-Spam-Score:X-Spam-Flag:X-Spamd-Result:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Server;
	bh=3KDokqHMJCdFr0yppai0TEUVY2bosNJZ06fgH7tLIdg=;
	b=uVfHwpPXTAlxEQREQaQXUAhyqidR5OOYCKdWnRMBQaCZTJnHQdEF+fj/0SYmoJ9DcKeJ
	 OERYt0qs35d+xLb93YptvrTx60774BsRtqKAtuf3erdz2mWwZsENQLsPR8sS95RM0x1G/
	 QOGSg2I4VAYghmawGZzgwGe0UdU9TkdlAFCJHDrTUW0KSczCEvMQnot9VdyIOkveHyGZF
	 fkacZxJ5I6y4zxFD1BZ9gCiAL9/GzfRfgQYMq1r36DUoq5xgsjNuGBbrjmHvPujwVg7jH
	 5QVvJ0nLqCqeQwf6ODfcLYhMr3PN/pyhgOLbYv5ji5LaLwU6jyUz4EJLlaM7dKCaYJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wR8kiULA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0k0793IT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wR8kiULA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0k0793IT;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8743606A330
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8743606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wR8kiULA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0k0793IT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wR8kiULA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0k0793IT
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 99B5D1F451;
	Tue, 20 Oct 2026 09:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792490150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3KDokqHMJCdFr0yppai0TEUVY2bosNJZ06fgH7tLIdg=;
	b=wR8kiULAt3PhOrTpbYS83ImT8UxWb/RgOyNsz42FZdb4QpFSlPkbutWSzweC0RIZZg8Uxl
	F2EkqarmcY1U8J0U3djHG3EyZeXGREBUwq/Rt09z22BuxwwWOEPXWLjoAiXkAa00mrbwPu
	k7EUhrOKS4zqSQe4Z1K8uCGt36E02Ig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792490150;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3KDokqHMJCdFr0yppai0TEUVY2bosNJZ06fgH7tLIdg=;
	b=0k0793ITz02Xxwuwt3Sqnq/FV1PaTTwEFSuIcjaY8HgPj/0hTObuMXzUYSDgXa4stmyjF1
	bToGnL8F9RjGPmAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wR8kiULA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0k0793IT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792490150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3KDokqHMJCdFr0yppai0TEUVY2bosNJZ06fgH7tLIdg=;
	b=wR8kiULAt3PhOrTpbYS83ImT8UxWb/RgOyNsz42FZdb4QpFSlPkbutWSzweC0RIZZg8Uxl
	F2EkqarmcY1U8J0U3djHG3EyZeXGREBUwq/Rt09z22BuxwwWOEPXWLjoAiXkAa00mrbwPu
	k7EUhrOKS4zqSQe4Z1K8uCGt36E02Ig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792490150;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3KDokqHMJCdFr0yppai0TEUVY2bosNJZ06fgH7tLIdg=;
	b=0k0793ITz02Xxwuwt3Sqnq/FV1PaTTwEFSuIcjaY8HgPj/0hTObuMXzUYSDgXa4stmyjF1
	bToGnL8F9RjGPmAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5FC96136C6;
	Tue, 20 Oct 2026 09:55:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vn04D6Y612qTHQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 20 Oct 2026 09:55:50 +0000
Date: Tue, 20 Oct 2026 11:55:45 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 12/18] nvme-fc: start error recovery instead of
 aborting timed out IOs
Message-ID: <33f6bba9-fb2a-4417-85d7-cb93e32cd6d2@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-13-mkhalfella@purestorage.com>
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
In-Reply-To: <20260920182936.2317916-13-mkhalfella@purestorage.com>
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 99B5D1F451
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Sun, Sep 20, 2026 at 11:28:10AM -0700, Mohamed Khalfella wrote:
> -	/*
> -	 * Attempt to abort the offending command. Command completion
> -	 * will detect the aborted io and will fail the connection.
> -	 */
>  	dev_info(ctrl->ctrl.device,
>  		"NVME-FC{%d.%d}: io timeout: opcode %d fctype %d (%s) w10/11: "
>  		"x%08x/x%08x\n",
>  		ctrl->cnum, qnum, sqe->common.opcode, sqe->fabrics.fctype,
>  		nvme_fabrics_opcode_str(qnum, sqe),
>  		sqe->common.cdw10, sqe->common.cdw11);
> -	if (__nvme_fc_abort_op(ctrl, op))

Yes, this makes sense to remove it from this path and do the abort in
one place only.

Reviewed-by: Daniel Wagner <dwagner@suse.de>
