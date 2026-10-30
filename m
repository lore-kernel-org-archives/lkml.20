Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356379;
	b=ElY/wkrx7ux9o8cgJLDuy+72uw+yGwyjSuwfZlX0X111F3XrgDyZKkAUSL/oGb9NhOAw
	 E4XtGv4YeplE0TMOmQ0kn8BVmSPL4RKQXpB4r5KvXampeX/fX4GdKY6xlAbwiaQ0KQRSO
	 FnNIKYfOW1cEgRSUngY0GMipmI8dFcrrR2+HbKLIeqwYnBZJ0eTNwWD/iB4n1DiUbkoeT
	 U5izrMXEeKYfPVP4Pzpy/nq747NWMlHg3ShvILFki/EKsPBre9/qZxnClx3s2afLryUNp
	 hKaNn3N2mmG5Vo1sBmE7ECr172gGc2SADmdzH8dRbwybqWw2kUcjf2j68t0Jj8pc55w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356379;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=Q4jrBtDa9XdgPx65X4O9wIPTGTES0E0M7mDS6n2yd28=;
	b=AgQLM4yFlbUggupPGMj/g9+ky9CQJMlsXmJeW72CMFGYYqJR2OqpGr3t5WvYm3osie5B
	 PaoKdqHieNCVFDnhh3YUTkC+zkwllrPZruDGlbcz6ot6UEIIFsEb1kGquZc+/F6mZTJQ+
	 2jDWf8j2ceuhYHdZUVBabjKKiVP+AgDQ0dZbgUij6iVpomhFuRx3m8/9/ObuIJWrv1Gpd
	 3eMGnrr8PbCZ4LPJTJNTKabS3fVlZ79nBsyIEdlUYta0rnrSFfHNxy641hVor194JCjHA
	 y3yRkfFQmZemdcHr51pL9Nm7roogpY50EKhpeumCNEX52/avmXDoXWq/KiJv8667sPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DpC4Fhvy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vXEZe1pJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DpC4Fhvy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vXEZe1pJ;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DF7606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47DF7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DpC4Fhvy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vXEZe1pJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DpC4Fhvy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vXEZe1pJ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9C88821EB0;
	Fri, 30 Oct 2026 10:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793356377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4jrBtDa9XdgPx65X4O9wIPTGTES0E0M7mDS6n2yd28=;
	b=DpC4FhvycI7jwNItULPTfitzNbDGIKcx1UT4Xr9bU22B3MUMo2OqDylLIfSeKaj+Ph0OxZ
	Mq4M4P0tdIrBhQYvS0lE78SIQ11LQ9oL5eT6GVdtg1vEXlttJ+nfyAS8siOdc9+w3a2TPD
	X2hHbFdRKnrMSz7cn5xKqvUHccUADxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793356377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4jrBtDa9XdgPx65X4O9wIPTGTES0E0M7mDS6n2yd28=;
	b=vXEZe1pJz/CvXHkQLyskU5i1XIX/K6kfLkF0W+dVogxYpwSayYUrI53tfYlTZPflR8N27b
	6CHVqZ5u+uPej1Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793356377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4jrBtDa9XdgPx65X4O9wIPTGTES0E0M7mDS6n2yd28=;
	b=DpC4FhvycI7jwNItULPTfitzNbDGIKcx1UT4Xr9bU22B3MUMo2OqDylLIfSeKaj+Ph0OxZ
	Mq4M4P0tdIrBhQYvS0lE78SIQ11LQ9oL5eT6GVdtg1vEXlttJ+nfyAS8siOdc9+w3a2TPD
	X2hHbFdRKnrMSz7cn5xKqvUHccUADxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793356377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4jrBtDa9XdgPx65X4O9wIPTGTES0E0M7mDS6n2yd28=;
	b=vXEZe1pJz/CvXHkQLyskU5i1XIX/K6kfLkF0W+dVogxYpwSayYUrI53tfYlTZPflR8N27b
	6CHVqZ5u+uPej1Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 656AD13419;
	Fri, 30 Oct 2026 10:32:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lMp1EFly5GonIQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Fri, 30 Oct 2026 10:32:57 +0000
Date: Fri, 30 Oct 2026 11:32:52 +0100
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
Message-ID: <fe4f3c98-492c-418a-9ff2-b3c6cf5446cf@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-8-mkhalfella@purestorage.com>
 <179242929827.3619480.8550407233438315193.b4-review@b4>
 <20261019212630.GN2931-mkhalfella@purestorage.com>
 <7e73057c-698a-4ce6-b153-3b8b1077f77c@flourine.local>
 <20261021183357.GX2931-mkhalfella@purestorage.com>
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
In-Reply-To: <20261021183357.GX2931-mkhalfella@purestorage.com>
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
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org,suse.de];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.30

On Wed, Oct 21, 2026 at 11:33:57AM -0700, Mohamed Khalfella wrote:
> Is Documentation/ABI/stable/sysfs-nvme a living history of sysfs-nvme
> documentation or a documentation for the specific kernel release?

I understand it documents the sysfs API. sysfs is supposed to be stable,
so adding a new state is factually a breaking change. The document
should document the current API the kernel provides.
