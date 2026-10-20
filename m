Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502123;
	b=vfslEEz9GDQHGcBmz++3kIiT/lHpa2I9hxTIyyk5rid3sn5ecPcUo9doHkteFPp7IafW
	 V7+CfZi9ROrLcdrHEs+iWELYy9NEWghtR64oUsjJ5MBbxoz35fnzUoJclwxulh0OMN+Nr
	 1n7l3H+7FKxFm0Aray9Ezl//hYZtoz1oRtwhx5edtkFNLzLntydO5uKH+YAItulIlIsXX
	 fcMbhxR1pTwq12pwtHa2e3f6yw6urdJG6yjmDG9Lf2nzTrggB2rSSFz7XABcgZ6sys+Zq
	 W6I0Pkr6mYQmZ4lDatxzpbOF6RKZkC8VkMscTOht4AiAiga7qHv/GBwNOnX3yto5AIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502123;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Rspamd-Action:X-Spam-Score:X-Spam-Flag:X-Spamd-Result:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Server;
	bh=op+7UScHhy/sudVGKvdvy2hCd5K4FVTyuc4QAM+VsVs=;
	b=0og6T5kmGDJ3Y8h6r0r1i9/wHJoJ5xqf7lMw6sbwCS3/nrrWXgHOm3eE1hWkkCjtpCub
	 fPBN00UH8dFbyVljxysDKwPnU5nYr990hitQeEffUiaV8/5iPqhEx+Z1g700spDf6o9U8
	 FfGQxkh9iBnpOexfDqP3MNpvIZBueTIX74jICf9qWM6mcY47Z0kcJs1SJDjFHNIZdC5m7
	 xxlpK4QMctG7XRO+uHqxZ/kROk/N0qYH1PMF7cDg57TctZy6M3GdnkxQavkxc6EFKvi39
	 SpQHc3M66Goqah4j1pSjv9bN3LOlLbNAnOdkuskPxlcXJrr4ie02MpELae57CCUo0Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ijM6r56d;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="q/cc1x9s";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ijM6r56d;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="q/cc1x9s";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4EF606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4EF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ijM6r56d;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=q/cc1x9s;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ijM6r56d;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=q/cc1x9s
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4442D21DCC;
	Tue, 20 Oct 2026 13:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792502121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=op+7UScHhy/sudVGKvdvy2hCd5K4FVTyuc4QAM+VsVs=;
	b=ijM6r56dJLG75lEMlKFLLyBGN74ysZ58aqoAN6Sw70pvTmKh8BQqy0VSpBER4yLgtngHa+
	jo5zuM9TMj+LpP99gQFaZp3OEi98J4nJiMf1ECMK2zeMsUVNJLRaDA42uJz2IbAPCr5uS9
	ZM3fERbW+WFbMXo5t9bs0C3A5RifFCA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792502121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=op+7UScHhy/sudVGKvdvy2hCd5K4FVTyuc4QAM+VsVs=;
	b=q/cc1x9sd4F4gjKuQEMH5w4CsytL4KwlVAaFqZl4gIA4uyJwjO5jc0X9WWBA7M4l4lCC3+
	+DoBnPMS05kM2WDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ijM6r56d;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="q/cc1x9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792502121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=op+7UScHhy/sudVGKvdvy2hCd5K4FVTyuc4QAM+VsVs=;
	b=ijM6r56dJLG75lEMlKFLLyBGN74ysZ58aqoAN6Sw70pvTmKh8BQqy0VSpBER4yLgtngHa+
	jo5zuM9TMj+LpP99gQFaZp3OEi98J4nJiMf1ECMK2zeMsUVNJLRaDA42uJz2IbAPCr5uS9
	ZM3fERbW+WFbMXo5t9bs0C3A5RifFCA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792502121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=op+7UScHhy/sudVGKvdvy2hCd5K4FVTyuc4QAM+VsVs=;
	b=q/cc1x9sd4F4gjKuQEMH5w4CsytL4KwlVAaFqZl4gIA4uyJwjO5jc0X9WWBA7M4l4lCC3+
	+DoBnPMS05kM2WDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00118136CC;
	Tue, 20 Oct 2026 13:15:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r7FSNWhp12oncAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 20 Oct 2026 13:15:20 +0000
Date: Tue, 20 Oct 2026 15:15:16 +0200
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
Message-ID: <9fefc6f1-9407-47eb-873a-0606fe173d8b@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-8-mkhalfella@purestorage.com>
 <179242929827.3619480.8550407233438315193.b4-review@b4>
 <ebc2064d-70d8-44c9-8230-5ba4b24cf5d9@flourine.local>
 <20261019214007.GO2931-mkhalfella@purestorage.com>
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
In-Reply-To: <20261019214007.GO2931-mkhalfella@purestorage.com>
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
	RCPT_COUNT_TWELVE(0.00)[15];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org,suse.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 4442D21DCC
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Mon, Oct 19, 2026 at 02:40:07PM -0700, Mohamed Khalfella wrote:
> I documented part of the testing I did in lab in my ALPSS slides [3].
> 
> I addition to [1] and [2], what kind of blktest you would like to see?
> If you describe the blktest in detail I will implement it and put it for
> review.

Sorry for being a bit confusing. I was trying to figure out if there are
dedicated state machine tests, e.g trying to force the state machine
into impossible states etc, but I suppose a simple state machine transition
test is not really meaningful.
