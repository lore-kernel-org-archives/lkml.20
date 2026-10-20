Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501814;
	b=WDqGn9hwNikRD4YbBb8IWsvPD4Roj3jnVUDuGRx50gDqpcTSNUvGoP+Wk/sjI/EvkIBG
	 bztWTXTE1y/SCEu/EAPlDAh0DmNVpWrGx2yG69JYBX+cCBkmynoo8Q7znM/psxZFzoahi
	 YzfUNkn/npTQrcbXWdN60HgmCJfz0FY7rbV3LV83vG7N8y7tavmw40r580/sTSZ7yGukR
	 7CIceE+4XiCEoxXiqMriktxQTjjCU7T7PGftNwy/Lb2TQgiQ6gB+KCIZ1fpa8+T4+7bKZ
	 hMOTzMolX3vipX/GxIXb0AFy9mKIb/O+emQPQlInlD8wWPuyuu1+QskEdAfTFXHWNnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501814;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Rspamd-Action:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=n3c2w26KsSTcK+AA9X+7eCM/ZIuC+BG4JEbsHnBMOyg=;
	b=lPh5FPA7RU1Yv0e9U2Dx5aVKbRuBDuvP4442cW3ad7VLtca/+cAsNnJ083vhxC0zPwG+
	 nkdc7fzj2Ivtdq3+ssn0HTVTK83nBN6eCHKXgM4ITglsUznwI38dBawWYNG/9rj6ScdA0
	 +jYna80rChUGDjst7WnCaljfCrmMLercjqaPMiZ5hvDoYEgonR7Uucjl4j5rraGHlVvTE
	 ji3kpuDubVTEUuL71IHDOmDalRxTIR4txFKa2tlCZpz32hlKOlEn3z9joR8Wh8ef0F7t9
	 TQGOqVPkkauU2THMYGUHELCUqx/FK4LTnWk3gvabVnETF3OlhLKwrTrtArYHtdwaijg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=atnBbJw1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=84QKghRm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=atnBbJw1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=84QKghRm;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552E1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 552E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=atnBbJw1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=84QKghRm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=atnBbJw1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=84QKghRm
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 54C0E1F7BB;
	Tue, 20 Oct 2026 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792501812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n3c2w26KsSTcK+AA9X+7eCM/ZIuC+BG4JEbsHnBMOyg=;
	b=atnBbJw1BmlzTfriyeneZOWSkzc+BXzaq67dEjv4EPyMIWtBBJZa1wR3yEEvhIvmpOZJch
	fffufcHJPzcKsoGN8gLE8Bc8PSpNWh1p0u8Rwzv4KrZ40wmu2sJq4jRbhQDoYCYf2lPb/t
	IIpUwz/jW18W2Fh8XDkW4kIehkiDM7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792501812;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n3c2w26KsSTcK+AA9X+7eCM/ZIuC+BG4JEbsHnBMOyg=;
	b=84QKghRmfw7LKg4Zune3dioCzBfIMwafChVMyvd9N9pGprIltujQ4vrQTsfO5Bo/+EOdFD
	u14lt3WGwOGgzoDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=atnBbJw1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=84QKghRm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792501812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n3c2w26KsSTcK+AA9X+7eCM/ZIuC+BG4JEbsHnBMOyg=;
	b=atnBbJw1BmlzTfriyeneZOWSkzc+BXzaq67dEjv4EPyMIWtBBJZa1wR3yEEvhIvmpOZJch
	fffufcHJPzcKsoGN8gLE8Bc8PSpNWh1p0u8Rwzv4KrZ40wmu2sJq4jRbhQDoYCYf2lPb/t
	IIpUwz/jW18W2Fh8XDkW4kIehkiDM7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792501812;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n3c2w26KsSTcK+AA9X+7eCM/ZIuC+BG4JEbsHnBMOyg=;
	b=84QKghRmfw7LKg4Zune3dioCzBfIMwafChVMyvd9N9pGprIltujQ4vrQTsfO5Bo/+EOdFD
	u14lt3WGwOGgzoDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E98E136CC;
	Tue, 20 Oct 2026 13:10:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G3/UOjNo12qhagAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 20 Oct 2026 13:10:12 +0000
Date: Tue, 20 Oct 2026 15:10:11 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 07/18] nvme: Introduce FENCING and FENCED controller
 states
Message-ID: <7e73057c-698a-4ce6-b153-3b8b1077f77c@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-8-mkhalfella@purestorage.com>
 <179242929827.3619480.8550407233438315193.b4-review@b4>
 <20261019212630.GN2931-mkhalfella@purestorage.com>
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
In-Reply-To: <20261019212630.GN2931-mkhalfella@purestorage.com>
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 54C0E1F7BB
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	URIBL_BLOCKED(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org,suse.de];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -4.51

On Mon, Oct 19, 2026 at 02:26:30PM -0700, Mohamed Khalfella wrote:
>  Description:
>  		Shows the current state of the controller. Possible values:
> -		"new", "live", "resetting", "connecting", "deleting",
> -		"deleting (no IO)", "dead".
> +		"new", "live", "fencing", "fenced", "resetting", "connecting",
> +		"deleting", "deleting (no IO)", "dead".
> 
>  What:		/sys/class/nvme/nvmeX/numa_node
>  Date:		November 2018
> 
> 
> How about a diff like the one above? Similar to CIRN and CIU, I am not
> sure what to put in "KernelVersion".

I think the KernelVersion is when it first appeared. I would leave it as
it is and instead extend the description

  		Shows the current state of the controller. Possible values:
 		"new", "live", "resetting", "connecting", "deleting",
 		"deleting (no IO)", "dead".
        v7.5 introduced additionally:
        "fencing", "fenced"

Obviously, this is not idea. If someone starts to complain we might have
to filter out these two new states.
