Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B01C355F5C;
	Mon, 14 Sep 2026 16:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401610; cv=none; b=sfVp4gDy6UPT9gMUnt/1jUqUIaYfH8yBe1Wmx5+zkzl7YT6n0F/3IL40glQwCVjp2S5NDOy8FE/R45ffNoSbJWv6kTyL2PSeBhJOhnJOELB6TZkxUy4lp6XCzYuyHYkAWME4jdvh7C62DF+k5VsALpgFpOxJZWNme76cjWcwofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401610; c=relaxed/simple;
	bh=0GnuuD3RN7mxP4ohIigh76mhE5e1ugt5yWwWBcvB9S8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LP00CgR+yqQGCjYoTtmMgJCG+mHVgR0j2IHRWbMhdBDeZPRmz8o245L3AXIQBOn0oLcZCfoJgFFIhnMdlGhW8S2ArT8sqI/IV/bwf5GUSy1NTWsgHqVN4VHBdc0viRkNtdxq/DsaIeAfvupREsZ9qRIsUOShuSRT7ijd/W/VNm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O5UQncFB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kvKecyHe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hBNJNLia; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jBiinCsU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O5UQncFB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kvKecyHe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hBNJNLia";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jBiinCsU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0E2691FAB3;
	Mon, 14 Sep 2026 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789401603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ypmlbFago3ygmwUl6mmYy6JkpzcEACBTSW5/tOwqdrk=;
	b=O5UQncFBZv3LUfKquF9wFTX+dyfZRxRCTtCZ7YBy8z2BzUgeDL1UbeSPshtnqj7fx6w2Zd
	PN7iqgajZ83bhzVTfQMWQ+FFvqDdGXfiX9H4mavZgygUzoM0W3HHTza7Kqu3D8eCGdZpKq
	94g2qfB+PmpyBc96aq9hxCCZlJnkD4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789401603;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ypmlbFago3ygmwUl6mmYy6JkpzcEACBTSW5/tOwqdrk=;
	b=kvKecyHeaV/e8v4E0W2VYM7e2KDDdS0qvIQE6zwOP35dnlKmzNPOukVfXNmcspHwXL6JL6
	+25fXi+44MAJ4CBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hBNJNLia;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jBiinCsU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789401599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ypmlbFago3ygmwUl6mmYy6JkpzcEACBTSW5/tOwqdrk=;
	b=hBNJNLiaGX/NhpufusbJi6XUL9lpKITHP2mf+5ta7baIpSUOw8axS8Yy4XlM1jLqjN11PP
	XcTDerm+iIic293lWPIEtQSYammtFg3gUGZuG0BTAKfInxw3fLGpnQKnbWgJ2yK0LYObWa
	Dng7gjt0dpLEHBX0lVHrqLCD8cVp2Ts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789401599;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ypmlbFago3ygmwUl6mmYy6JkpzcEACBTSW5/tOwqdrk=;
	b=jBiinCsUtTzjVql4TONTFndzWcQ7Aa7Eq922W99xbe0YyMY4phCBCyTk4ZMljIqeFGkreN
	njTp+HYB9yCCR7CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD05313515;
	Mon, 14 Sep 2026 15:59:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DMEBKf4ZqGqgDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 15:59:58 +0000
Date: Mon, 14 Sep 2026 17:59:58 +0200
Message-ID: <87cxufombl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] docs: sound: hdspm: clean up driver doc.
In-Reply-To: <20260914050900.1312415-1-rdunlap@infradead.org>
References: <20260914050900.1312415-1-rdunlap@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0E2691FAB3
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,infradead.org:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 14 Sep 2026 07:09:00 +0200,
Randy Dunlap wrote:
> 
> Do some overall document cleanups:
> 
> - add driver name for clarification
> - fix some punctuation issues
> - correct some capitalization
> - correct some grammar
> - convert a few words from German to English
> - eliminate double use of "note:"
> - unindent Precise Pointer bullets so that they are not part of the Hint
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Question: Is the precise_ptr documentation applicable to this driver?
> 	Is preceise_ptr used in this driver? Not that I can see.

AFAIK, the precise_ptr has been dropped together with the support of
RME RayDAT and AIO models (commit 0dca1793063c).  Essentially
precise_ptr is always on.  Would you work on cleanup, too?


thanks,

Takashi
