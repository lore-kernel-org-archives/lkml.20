Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493896;
	b=M00ZLQPYtiKG9PmkPywwAaB/jQIZPWtG0yMl38PUuNtD9DrfOlsF5lMBPWIpXgbwseoH
	 TOtcMFyWwHRJYPVyVBOQsTKinhdIZeQxtKQes8yHVI70dgjpwfOLEdASeOkUQKSn8jcxY
	 Nm1RyQatmd6r+30BaaT74QTnagLyh8ZdeSb5DGAfsM07qMkNX6ZWxgT/at+iZmzaCStal
	 QywHQTTV+IRUDPd+WJkfxc2l0gIfNnCEol/zihs37O/DePlcoyYCPdbvtNE39xIgmhkjE
	 NAed4pm13M3YYurTHEGqIypUNvgMLgaHBxXXAszGBV383Yj+FQqgyGVgWXBiSBkx9aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493896;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Action:X-Spam-Score:X-Spam-Flag:X-Spamd-Result:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Server;
	bh=OKXUBaXYic17nh/PWooz1q/CXfH7wZ5k14U7GJU175c=;
	b=pqNlqrBygWQYghYNNcXrlfiXApLx4wcS2dlF59KrIAWiHT8rTnVdq4897Z0Dwu5eJ2z6
	 ejsMvXKhVBx7iYOZLgC7gxe1dUBCgstRCCWRONjeDtb3Kj0ydq7M9N9YTgnHlrh+Il0Dk
	 pnYlabO8Kqn7dMsg8vOnxHE00Lg38geK23Z/NAOGitPQOPW2cAclXNgfg3XdVXqrdhVh6
	 CjYrPiF156efwL6fjLN+mCko/by/vHfyQ0ie2f5o2gNKiiN1nAiuk47UdUQZQfqxgUty+
	 0djRKoHCpyFDw4hoCx8b3Nrb9eVQ7rB+Q/VRY36Y4drwQCbIOG1q6xENnVVgM0TAirg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Yyi69PUq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rZR+AT4u;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Yyi69PUq;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rZR+AT4u;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28012606A319;
	Tue, 20 Oct 2026 10:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28012606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Yyi69PUq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rZR+AT4u;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Yyi69PUq;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rZR+AT4u
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 34FA31F7B6;
	Tue, 20 Oct 2026 10:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792493894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OKXUBaXYic17nh/PWooz1q/CXfH7wZ5k14U7GJU175c=;
	b=Yyi69PUqMonnZVKoEICO1syMYJ06SriNhcXYmPSorBNc3lcDBrx4OfNQsFKsFUgUPT4/Q3
	aXLZKdosS9BYMfoa5ST4Uxq3qJKYS6k5J1gqjdEz0EWokm+mYCaw/omAxZIvu23hlsUr+S
	PF4njdLU1qYFxr0JXzcYMYz8NiAglWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792493894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OKXUBaXYic17nh/PWooz1q/CXfH7wZ5k14U7GJU175c=;
	b=rZR+AT4uib3WLaR1CQ/8diTQo1HT0YwkrmuXhGyyhFCjeSmDEe5U5AuzHsoKh13bxTUsYf
	XAVI9swZnnxXxxCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Yyi69PUq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rZR+AT4u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792493894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OKXUBaXYic17nh/PWooz1q/CXfH7wZ5k14U7GJU175c=;
	b=Yyi69PUqMonnZVKoEICO1syMYJ06SriNhcXYmPSorBNc3lcDBrx4OfNQsFKsFUgUPT4/Q3
	aXLZKdosS9BYMfoa5ST4Uxq3qJKYS6k5J1gqjdEz0EWokm+mYCaw/omAxZIvu23hlsUr+S
	PF4njdLU1qYFxr0JXzcYMYz8NiAglWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792493894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OKXUBaXYic17nh/PWooz1q/CXfH7wZ5k14U7GJU175c=;
	b=rZR+AT4uib3WLaR1CQ/8diTQo1HT0YwkrmuXhGyyhFCjeSmDEe5U5AuzHsoKh13bxTUsYf
	XAVI9swZnnxXxxCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB01E136CC;
	Tue, 20 Oct 2026 10:58:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LtHvK0VJ12pZXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 10:58:13 +0000
Date: Tue, 20 Oct 2026 12:58:13 +0200
Message-ID: <87tsmghc56.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wang Yan <wangyan01@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	runyu.xiao@seu.edu.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: mtpav: restore negation dropped in guard() conversion
In-Reply-To: <20261020090959.570101-1-wangyan01@kylinos.cn>
References: <20261020090959.570101-1-wangyan01@kylinos.cn>
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
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 34FA31F7B6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Tue, 20 Oct 2026 11:09:59 +0200,
Wang Yan wrote:
> 
> commit 316e0074ecdc ("ALSA: mtpav: Use guard() for spin locks")
> claims to be "Merely code refactoring, and no behavior change", but
> it accidentally dropped the "!" from
> 
>         if (! (portp->mode & MTPAV_MODE_OUTPUT_TRIGGERED))
> 
> in snd_mtpav_output_trigger().
> 
> Restore the negation.
> 
> Signed-off-by: Wang Yan <wangyan01@kylinos.cn>

Applied now.  Thanks.


Takashi
