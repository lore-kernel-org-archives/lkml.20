Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802861;
	b=1lMqHzOiwvU/8BX21xCmctAUNkM/repRHQeCVmTH1eOJVfxa4L9HKE+mfLSUGsbtydSz
	 In+DLFyvA49gYlCsiI7sRV2DXxCfzY64tCbIkSqlQH0ZBH0wzLHJtigawq15cl3Aqgllg
	 qlh3hoSmK1wI+Ty2m9YOusjPnWOGdcShENc6BqPuI2jaGKARcPduRomr0C44cyNe+vKpL
	 engtpMGH/yCQgRsf2xHfZgOIWO/x/OtvQueryzC4kir4le0mI+bDzutPw+CIbZrwjY0AP
	 OVqT5ocBCF4IjBiKfyJmvZinLvea5PY7mS8+P6LNlCY6Tl/6mlBBbUk91srn8WDYgHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802861;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=/mAJgnoT3FJd0HHsIGGz7fx8i9cIF4iDh8jpAcj72so=;
	b=d4IcpSe0YWeF+32UImOoNgqaI3ocvsmsNvHTis8aK2vQUzpwhC+tqUy29/CnyKBesK72
	 LWW0qlBLE4d0Z3KFdP8fCmRa3wUDZ23QvHItlkRVR2lIF9AVu1kt35Vv+bmNDw5KhuOYL
	 9BgFF9Dldxh6W03snJZI+92bdZiETt6pDa2G0zOjkrVhePxSQdTWF2QWfwFrzpjV2NXQv
	 Dq3KQnCUcubJjpxEQ+zx1NqbIOPQKYsXdjYryGvyTwmrZHoDzlABwFPm61P/byqaKZjIz
	 IBTZGw12l4LkRVgVKX6uSSfF3Qv6E/c8DdlMMD7iTPUnfQIJyszZ6i1CoqDYFaDsxTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vUDbEE8D;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AO9NVNWt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Jaj+Akk9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jn2wQIf1;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7348A606A31B;
	Wed,  4 Nov 2026 14:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7348A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vUDbEE8D;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AO9NVNWt;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Jaj+Akk9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jn2wQIf1
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 755C11F7DF;
	Wed,  4 Nov 2026 14:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793802858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/mAJgnoT3FJd0HHsIGGz7fx8i9cIF4iDh8jpAcj72so=;
	b=vUDbEE8DSRrChBseVk2ztWuTt98j6JK6fjSsjZM5aOZgffUPZ29oVQU0+ebo18U2S0IKjm
	40E+d7KOTRkTDEgwbDAI8QK9Jupvm6Ojz6L7MG3XT9d0Y9ab+fZV4eyS4RTmWJKtMG130D
	olLb/J597WqHml0dN0u6ByzBDdt4vy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793802858;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/mAJgnoT3FJd0HHsIGGz7fx8i9cIF4iDh8jpAcj72so=;
	b=AO9NVNWt1bPi/yDBoRZL9wfBmd++djGaeFInq3/IxQQKtksBtgLUsUHCO1RRTSKF1huHKj
	QcNlugjb4+Qx1dAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Jaj+Akk9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jn2wQIf1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793802857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/mAJgnoT3FJd0HHsIGGz7fx8i9cIF4iDh8jpAcj72so=;
	b=Jaj+Akk9ReCj8qzOnPrkHgwVDyIzzeSENMVcHtWhbPqYY4tW42CJ/FrF+ioHI3ftlHsdv4
	5Go8EcFvd9f9jWzxwvssu7uW3ZWiHG9kg8p2jAq61UXfwIfkgF/nKSChujbVE8ypQYXe50
	NAJJqY9Ezjt0PiX1WZJfaMF6pC9krN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793802857;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/mAJgnoT3FJd0HHsIGGz7fx8i9cIF4iDh8jpAcj72so=;
	b=jn2wQIf1C0cCvGpoRmKKpLh/m1g+t8Jc8VIxoXelz+JiyNhQMTwnd9nYDsduvy+LhOR4NZ
	BEvERpJlb8bjJXBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28422134F0;
	Wed,  4 Nov 2026 14:34:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KMpjOGhC62rmcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 14:34:17 +0000
Date: Wed, 04 Nov 2026 15:34:16 +0100
Message-ID: <874idwvf6f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: mixer: oss: Fix uninitialized index in recsrc ioctls
In-Reply-To: <20261104075642.1790966-1-songxiebing@kylinos.cn>
References: <20261104075642.1790966-1-songxiebing@kylinos.cn>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 755C11F7DF

On Wed, 04 Nov 2026 08:56:42 +0100,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> snd_mixer_oss_get_recsrc2() returns success without setting active_index
> when the current Capture Source does not match any OSS mixer slot.
> snd_mixer_oss_get_recsrc() then uses that uninitialized index for
> "1 << index", and snd_mixer_oss_set_recsrc() does the same while ignoring
> the callback's return value.
> 
> Make get_recsrc2() return -ENOENT if no slot matches, only use the
> returned index in set_recsrc() when the lookup succeeds, and initialize
> the index variables as a defensive measure.
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>

I guess that the error is rather hypothetical and not triggered by the
current use case?

As it doesn't look like an urgent fix, I applied to for-next branch
now.  Thanks.


Takashi
