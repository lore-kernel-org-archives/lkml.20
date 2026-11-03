Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702710;
	b=wM6W7DwXSWVHxTRly95jr6kK2lrJlD01sbI4NogI7Tu/0De7kXynSZWFH0+H1j175t2Q
	 YpJf2UJezfctO1ZtUHxNDHbN/mxKsBpls60tLVNMxscBjIIm/ZGASdUlsiOVIIF34dKYc
	 VBgNnBe62fz28KT8bGiubTvq0Jp7/0F7N3RPdbxdWxar14o04JpmYKuBcLjQ014L6sKLQ
	 nu8AL7bLL6CXui9/pEcPX83gb5Pw4qbHQSYm8X+ktb+VaOnlX1bpL/tyar4uGRzJrWWFR
	 90inb9s8+7GlylD8qSuomb6YCTVHXUqN0s/2UzGT/u/fL3bFk6nJjPkuMoy2d7pRWgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702710;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=OmVqza68r32jWT+7is8UbaUD50yd0FSVAcJ4aEWMju4=;
	b=RpV3X+AEO9JMVAOBc2ma9pKYL8yOCKcV1SE5LwruAGR5+pdGCXJsGIlQ86OhIza52c9q
	 w0vvmGFGH7ElEJ5S4qDfYTjiYVITe43dzs1BZ6u2APL1pxShkx06mpq1yRpAmhXKfQTer
	 urAYDyIWqqjsX7ksdkm7R0hbkjTWqEIGhzBRti0U8/XomO4r9ik/krFDxIGVQ/HZS4tPh
	 +exZ+hwqYEbX1fl/gXD5xLyCd3o4x37jD9+I2nmDgSr9qSOVoikBOxmXZ/ERhjweznbsc
	 H73gooV4Ym8sl3erNDbjMaD3Ua0KPg6r/pdrOnObQjLSp1RJC5CXLQBqc6lvyURHjBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="0Gx/9y7U";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kxGiifaQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="0Gx/9y7U";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kxGiifaQ;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4A4606C596
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4A4606C596
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0Gx/9y7U;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kxGiifaQ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0Gx/9y7U;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kxGiifaQ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C5E7721F15;
	Tue,  3 Nov 2026 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793702708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OmVqza68r32jWT+7is8UbaUD50yd0FSVAcJ4aEWMju4=;
	b=0Gx/9y7UOj02HXjG4ZsdvnvIaajiv9dBUb2r3VdVEq0QfXfWxIuCYk7lmKzbP7Dpt9bHXM
	O09oY0CU5ZAk/CmFUHHdy7ARuiW41YjDPJLoqrA+0e57TqdoTPgxtgd1Vwp5y0RD/m6VjA
	awbOn8Xxw+mQ7nRS3A1rHucNSC74faA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793702708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OmVqza68r32jWT+7is8UbaUD50yd0FSVAcJ4aEWMju4=;
	b=kxGiifaQdf093IUSGJk2pNHGkMa15+9Mjqc/E9+t2Vl5OU5HCx/UBVzLwvfm63nLWik2JX
	I/1W0uM6+7tmkDDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793702708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OmVqza68r32jWT+7is8UbaUD50yd0FSVAcJ4aEWMju4=;
	b=0Gx/9y7UOj02HXjG4ZsdvnvIaajiv9dBUb2r3VdVEq0QfXfWxIuCYk7lmKzbP7Dpt9bHXM
	O09oY0CU5ZAk/CmFUHHdy7ARuiW41YjDPJLoqrA+0e57TqdoTPgxtgd1Vwp5y0RD/m6VjA
	awbOn8Xxw+mQ7nRS3A1rHucNSC74faA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793702708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OmVqza68r32jWT+7is8UbaUD50yd0FSVAcJ4aEWMju4=;
	b=kxGiifaQdf093IUSGJk2pNHGkMa15+9Mjqc/E9+t2Vl5OU5HCx/UBVzLwvfm63nLWik2JX
	I/1W0uM6+7tmkDDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 657F01350A;
	Tue,  3 Nov 2026 10:45:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zUufDzS76WqlFgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 03 Nov 2026 10:45:08 +0000
Date: Tue, 3 Nov 2026 11:45:03 +0100
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 08/18] nvme: Implement cross-controller reset recovery
Message-ID: <dce1f3c8-d988-45a0-b943-6418b4d704ac@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-9-mkhalfella@purestorage.com>
 <6e0b4de0-b030-47cc-84ce-3f021a5c75b0@flourine.local>
 <20261031082155.GC34016-mkhalfella@purestorage.com>
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
In-Reply-To: <20261031082155.GC34016-mkhalfella@purestorage.com>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-13.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
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
X-Spam-Score: -13.30

On Sat, Oct 31, 2026 at 01:21:55AM -0700, Mohamed Khalfella wrote:
>  701
>  702         if (!wait_for_completion_timeout(&ccr.complete, tmo))
>  703                 ret = -ETIMEDOUT;
>  704
>  705 out:
>  706         spin_lock_irqsave(&sctrl->lock, flags);
>  707         list_del(&ccr.list);
>  708         spin_unlock_irqrestore(&sctrl->lock, flags);
>  709
>  710         if (ret || !completion_done(&ccr.complete))
>  711                 return ret;
>  712         if (ccr.ccrs == NVME_CCR_STATUS_SUCCESS)
>  713                 return 0;
>  714         return -EREMOTEIO;
>  715 }
> 
> Actually, this code has a bug. It does not correctly handle the case
> when CCR operation completes with an error. I added line numbers to show
> that.

Fair enough, then let's use the local variable. 

