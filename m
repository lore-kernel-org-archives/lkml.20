Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479881;
	b=hDyPRxzxOneos6ELJVPTu+EzThAOpVoHElD1x+YMN2a+QR+itedFucoWgiaOSGmS5SDF
	 Y4yStX5TvpjEwQY6bR8oj2eFHdbzwWfgwHnuzeo4wlHQ6TDaJccxiUO9Qme5fFLA/aQaI
	 UjaJfnXkOhxXMHo7o/BGUZn/zS7Vnpai5aQbi9fO0Lqo94Ti38xU9+RH7eHhTO9RwJK7N
	 p4NT8WQ3O9GwIREO7P5KsTQnBWgMygkr7E6crmdO+DeDaLq00s3pmkDD+SRyzqrtPwdRC
	 eRbQhzRlKqbSRcaeGsqya75je0ILRECnY4Tb/KlJ8/Ynoa+St6cF6/yQSxOdetSavOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479881;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Action:X-Spam-Score:X-Spam-Flag:X-Spamd-Result:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Server;
	bh=v4GxG7tgyDJ8wdkN7Zveb5mkzHgID5dgdJ6FhbsVXDs=;
	b=GtXCX3ChyYTCTEbga8j7Lz/2cAmJzzrp1xRJwP9VkM9356R/1SRaj7dJ/suad2MTIeWM
	 mFmm5p1i4q9jjmixKmPIlJibwz4+g19tdATxWDpbKxODd5SCr58OeTfAvLsfp+VyAxjQB
	 kYfLBKYXjmjjPA9IKCG0G9DM/3h5g2qZABl5+VpmQMPAa+OxR3my2b930uxGAXmkPOX1Y
	 nS/Na6Gs8CAQAhLo1L5uXo/7VO/Qn2VYt1DWVaV5vnAY4TkDuHp4Z/9yEwl3YS3mXzBuU
	 us6u/1F7Z9gBINU7nLv/1qpl63CFrtO3hw7oGcWXmgltgiFmGjcyq7DdUMCwyxYHjxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Vp+Z6IkJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qOknJhTz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Vp+Z6IkJ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qOknJhTz;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EFD606A31B;
	Tue, 20 Oct 2026 07:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68EFD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Vp+Z6IkJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qOknJhTz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Vp+Z6IkJ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qOknJhTz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 87C911F390;
	Tue, 20 Oct 2026 07:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792479879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v4GxG7tgyDJ8wdkN7Zveb5mkzHgID5dgdJ6FhbsVXDs=;
	b=Vp+Z6IkJYg3IWVsPt0CpV4KBJQWvoevwVodqLP4xsXCKR1QKhtFXBaxOu8MP8D4xsWdbj1
	SQ2LUtClwPnS8YPamWGcgUYA4YEJRyW7I0sS9lb4Z8O+k9XG7l8GyLVZsV+W3tWGUFD74Y
	uUMeBzW78gcVQgVHJPnJhv3fwG6FfxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792479879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v4GxG7tgyDJ8wdkN7Zveb5mkzHgID5dgdJ6FhbsVXDs=;
	b=qOknJhTzU75i8dbkITxRN3rlRikkjWs+iAfKC/ShSWs09H6ohExfnGpWq93EiQMLn9wWQ8
	KGmWJYpeuayua1Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Vp+Z6IkJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qOknJhTz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792479879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v4GxG7tgyDJ8wdkN7Zveb5mkzHgID5dgdJ6FhbsVXDs=;
	b=Vp+Z6IkJYg3IWVsPt0CpV4KBJQWvoevwVodqLP4xsXCKR1QKhtFXBaxOu8MP8D4xsWdbj1
	SQ2LUtClwPnS8YPamWGcgUYA4YEJRyW7I0sS9lb4Z8O+k9XG7l8GyLVZsV+W3tWGUFD74Y
	uUMeBzW78gcVQgVHJPnJhv3fwG6FfxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792479879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v4GxG7tgyDJ8wdkN7Zveb5mkzHgID5dgdJ6FhbsVXDs=;
	b=qOknJhTzU75i8dbkITxRN3rlRikkjWs+iAfKC/ShSWs09H6ohExfnGpWq93EiQMLn9wWQ8
	KGmWJYpeuayua1Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A550136CC;
	Tue, 20 Oct 2026 07:04:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ic41AIcS12pnZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 07:04:39 +0000
Date: Tue, 20 Oct 2026 09:04:38 +0200
Message-ID: <87o6coj1ix.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: syzbot <syzbot+4b408ec271028c02705a@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	perex@perex.cz,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com
Subject: Re: [syzbot] [sound?] [usb?] BUG: scheduling while atomic in wait_clear_urbs
In-Reply-To: <6ad677d0.a20cb897.960b0.0048.GAE@google.com>
References: <6ad677d0.a20cb897.960b0.0048.GAE@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[4b408ec271028c02705a];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Spam-Level: 
X-Rspamd-Queue-Id: 87C911F390
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

#syz fix: ALSA: pcm: Call snd_pcm_sync_stop outside spinlock in snd_pcm_drop()
