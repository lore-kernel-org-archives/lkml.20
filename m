Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500009;
	b=wTfmUOlxn+KB/tq9QkOCP3FzJgg9LQn5rNIhxqfOI2MHPEez2YkcxyDD3C0yr8Z94oRe
	 4fbgw+te8kewLszSR2lPRvoXPInu63SZsUy5kcQGYKch0XM9muD5QMXNee2+gDojZ9CPE
	 X49EAveWJ/tJkEHw6HnfVA38cBzPuGNrul3W5lFcw5dtjDKICSx2Nfj0OAYBlGYRaNmFp
	 xOrx3CAp3aHHzExhVPf9KW2EYoNToBr1VOfEtrpqorRJ9Z7zmtFFpyKHdepB2xfYuT51y
	 NRUJMm0d1QXxf7+XkSoBXGZXlyvhgntM4c+74740+0HDpIA4McAQ6cxeXt1jmQVQOkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500009;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Rspamd-Action:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=6nz23bhnmZ2FGodQuKgjBhA+dODjumUXNzt+YH31ZJI=;
	b=KLBmzpWNIUhfnZCtaasUhcibjf9zkHZjCqFOihj/DDiMHf2+9r5Xptq0Fut4GgQjwkZ2
	 lOz8p3G83yFCOHCWoo9ZZ68sfCxNGR5wpOMO7XIZkd1AoxmbgwcfoB579/9Igw4eVsL8o
	 tgbJGCdp/KZcAb9/H8R/901yJaIeSQVZJN3C2B6s6LRz/1ux75A5QvnT8lfEwFlAuUqbK
	 PfgBEFM7RfXEnarDdwryQhZoIiXSa+o7pEVlOJ8ibjGBhHZw+dpPmHSdRT/NReI94SfMA
	 fM8PBY3xacOGAOSR7fd/L+1S7oank1XNCJDUOjuW387y7LQEVKqvPTBMz+gZiJ/T3XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=dWnzgWIF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HqCRmyIY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oKzagtib;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=TD4iHe70;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27800606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27800606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=dWnzgWIF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HqCRmyIY;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oKzagtib;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=TD4iHe70
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1ACC621C42;
	Tue, 20 Oct 2026 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792500007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6nz23bhnmZ2FGodQuKgjBhA+dODjumUXNzt+YH31ZJI=;
	b=dWnzgWIFu73EHS1zjKk4U+pMpA6eoaE+vAkpa8Ap2wdW/Xdp9lz3b3/P14oGlgh+WcIqix
	Y4mZ+auI0LM6Dkxt5By4LCPmoiTPvci3HKPUlKqD1to/08/V+G2rMB5dlUyoQV7180Jn9V
	nO971GgQ/yFSoXmMyRvUJ2Q5oQ+74r0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792500007;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6nz23bhnmZ2FGodQuKgjBhA+dODjumUXNzt+YH31ZJI=;
	b=HqCRmyIYGaviJ0tOu1rovjlBgA0AJBCENWFwfAFN0rt08HKGUn4mRrn+/0+WHuX1iXnVBO
	4nhLMZYyEpDKfxDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oKzagtib;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TD4iHe70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792500006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6nz23bhnmZ2FGodQuKgjBhA+dODjumUXNzt+YH31ZJI=;
	b=oKzagtib0C508ejCOeNuXQcC2ndrs+KBpB6epBHpgvVkGuMGaJYwfeUgciGm9NnQ8xY/Ui
	Xxyv168FM6ViPlaWAVPJnLvG3aFxfgvzBx/2P33q8qjR3seOhewNhZHA6CqRBfSJRqIImD
	AItjReab7k354U7vPUez/M3jOn5A0BY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792500006;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6nz23bhnmZ2FGodQuKgjBhA+dODjumUXNzt+YH31ZJI=;
	b=TD4iHe70ArhtasmwTDzxv8eQxa87yDDfJddvPqSrur1Hgwps7RJZ+K+f8G9i0tj2RjZCT0
	n5xWNEY9UmHBeQBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2FA7136CC;
	Tue, 20 Oct 2026 12:40:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tuwxKSVh12qESwAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 20 Oct 2026 12:40:05 +0000
Date: Tue, 20 Oct 2026 14:40:05 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 16/18] nvmet: Add support for CQT to nvme target
Message-ID: <41aa4e2c-cda2-47ac-baae-21a113500df2@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-17-mkhalfella@purestorage.com>
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
In-Reply-To: <20260920182936.2317916-17-mkhalfella@purestorage.com>
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1ACC621C42
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51

On Sun, Sep 20, 2026 at 11:28:14AM -0700, Mohamed Khalfella wrote:
> TP4129 KATO Corrections and Clarifications defined CQT (Command Quiesce
> Time) which is used along with KATO (Keep Alive Timeout) to set an upper
> time limit for attempting Cross-Controller Recovery. CQT is added as a
> subsystem attribute that defaults to 0 to maintain the current behavior.
> 
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> Reviewed-by: Hannes Reinecke <hare@kernel.org>
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

Reviewed-by: Daniel Wagner <dwagner@suse.de>
