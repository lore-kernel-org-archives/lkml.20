Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356212;
	b=kKcBsyHdXamtFZzdXcq+2MvcC2n+srQmlx2EKUvkqWtiSO67PRkpAOy+rZ08INsUGKQV
	 9ndXr8U0zVRh4VNSxYJ6JqklsCEqF69sPuxZd5nkwOxtUjKvqJuJQ9brMk3JXax61Gkft
	 0fFNmP7ol5xMXfYtT+/ZgV3RjO9vCJTkpnPUEHUzAy++AeHPlQ0PrqDp7QBiMA7NoM6Fg
	 JZovgdfJ1IKUrC/yjliKgh4uUeWKRBX2BWl4pVX6XTKmyYAS4pDrycjsUvt3T0Q5oKJLL
	 ApcQ1IWM3UU3DnzwqdOYjaeiyFShmYhJeozsuKXv8NHouCMHmIkVnbnSBFp7vRUUHrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356212;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=gWX+3wDbQkVauWcmK8OBTIu0g/Gz7UWDoYtFmjHOmGY=;
	b=AiQ5oqu6wPF2XINpokn0xaHCAN4cRVyt7yPcZGFC7DQ7mcSnXtBhOjVWMQEgRy9/slbt
	 N7yizBcGPJit54qTSWnlVL/17kgwfiH/KedwKkjlunG9T3kufr8KwRNHR2ysJ1trE/Olg
	 5hFSpD0LAwuhv4PAI6boS95SCmbAjxby9uO2/ny5cQ8Vqlz8CVA4s+dHfYETvkfQHML4K
	 g4iLTEsQLM2m4808p/8UkIv9dPCoSTsIuKLoARh8aTiq2JcCxANtDRdI6BlT+bSIu4NKQ
	 ynnwVksPUvkhb+Bg00ZASeTdGe4QvvHtQIE2I2riO7OYn0DO9FZ4/Bn10z2bcFZ7L6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U872c2om;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+ubaVylM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U872c2om;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+ubaVylM;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51A5606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51A5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U872c2om;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+ubaVylM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U872c2om;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+ubaVylM
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1F1C51F444;
	Fri, 30 Oct 2026 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793356210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gWX+3wDbQkVauWcmK8OBTIu0g/Gz7UWDoYtFmjHOmGY=;
	b=U872c2om+l5s0slBW2tUfcM6ttsLSA9beDUHvJl24u8mc4xyEHY9/e5bH07fP0ew7bF4nP
	04c8POr4XKkiiZorrtU1MGCapteQpXTZamHis+Y/WTRuuhq+MHzw0/Z10VAGCAmLWaEWRq
	nDhS9tRo3zuZJFeg35Xl5yS3shthsCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793356210;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gWX+3wDbQkVauWcmK8OBTIu0g/Gz7UWDoYtFmjHOmGY=;
	b=+ubaVylMoXWSkziqAJl1B8r6pgKqlkKsFJrhHQr8SqhXdfJQoYZ+iDKNSA/6DZDUFfiCIN
	3jc2p3HU0aJ/1wAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=U872c2om;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+ubaVylM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793356210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gWX+3wDbQkVauWcmK8OBTIu0g/Gz7UWDoYtFmjHOmGY=;
	b=U872c2om+l5s0slBW2tUfcM6ttsLSA9beDUHvJl24u8mc4xyEHY9/e5bH07fP0ew7bF4nP
	04c8POr4XKkiiZorrtU1MGCapteQpXTZamHis+Y/WTRuuhq+MHzw0/Z10VAGCAmLWaEWRq
	nDhS9tRo3zuZJFeg35Xl5yS3shthsCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793356210;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gWX+3wDbQkVauWcmK8OBTIu0g/Gz7UWDoYtFmjHOmGY=;
	b=+ubaVylMoXWSkziqAJl1B8r6pgKqlkKsFJrhHQr8SqhXdfJQoYZ+iDKNSA/6DZDUFfiCIN
	3jc2p3HU0aJ/1wAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E389D13419;
	Fri, 30 Oct 2026 10:30:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NBBiL7Fx5GoJHgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Fri, 30 Oct 2026 10:30:09 +0000
Date: Fri, 30 Oct 2026 11:30:00 +0100
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 02/18] nvmet/debugfs: Export controller CIU and CIRN
 via debugfs
Message-ID: <69bf549b-5b03-45ed-a18f-799c6e0efca4@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-3-mkhalfella@purestorage.com>
 <179241127352.3544975.2554197788837860779.b4-reply@b4>
 <20261019190106.GK2931-mkhalfella@purestorage.com>
 <a3852ed1-4b6d-44e7-b4de-bc1c6a3b635b@flourine.local>
 <20261021183859.GY2931-mkhalfella@purestorage.com>
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
In-Reply-To: <20261021183859.GY2931-mkhalfella@purestorage.com>
X-Spamd-Result: default: False [-14.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org,suse.de];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -14.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 1F1C51F444

On Wed, Oct 21, 2026 at 11:38:59AM -0700, Mohamed Khalfella wrote:
> Good to know that nvme-cli now parses these fields. That is said, the
> sysfs and debugfs attributes are useful to have. Say the controller is
> stuck in a state that it can not process an identify command.

Fair enough. I didn't consider this, in this case having the values can
be helpful. Please add this info to the commit message.
