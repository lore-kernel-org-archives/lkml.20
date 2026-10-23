Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762906;
	b=ArJdLmYNjmpjyHS0RwyNnG09kcDgcr0WsAdxcLFeiS2SVD+edR9f42Rr0fMYBw/MpvaM
	 uaaAgq6bIwSgPfuJ6hyUxTXFmPdzqhpxx/VDssaQrqlP5V0/uJBcWYjjQWiE3BRtEAq9k
	 3+qfN8TAKjb2Nctj251ZQg7UPORbf0n6SwJB4HwJ/pYwhZ7A5EJOKZJe5Sr0zKMnn2Vv6
	 im9wad044SUA1fElo6f/lmjQs4AvTM0GXqV3LTRgoIZpGLGzo82SXPxS2m69EV3cBk3AU
	 adI7TrlIjx9wkDqtj30Ff5wkqm974/9cNbM01RIhNRrlaqxM3P08G8PIiHOw1XKFIqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762906;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=4XUkvFrpXCUHEKR7U+wfj4zSmKI6Sae2m5KDt7hxpdE=;
	b=rX5OGe7r3bduadfFlHo+27q+Q93tjbf6GVYiUXjldc8VJfwt5bVF7nQdq1nEQqQyFDT8
	 jmpvvRza2bbmXF4TE+GGZmpg5mv3teTcGG02e3CYM8rOSYRWD0KX2t6db0/eBrZpGUTLF
	 D8j2k2mDdrY+vqDImAOcTU/x/MVNXzW0qTo7aXrXyRQEJKchgTg2uSZaJotlMqc8Ja6Kp
	 ZSMFKwbuVVmA7/5a80yQ6oCPEEyqpPSqAWWqf0p7uWkGp7qTAMg/SP5AHP0xbdOjKFqJw
	 v7HwHcPZXwMlO5Ab+UJvr98XTfV5l2iORoSR27VF+z4YsgjWhni7/hz5xgFGDWrLqng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1KgGP7ob;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=By2nsJqy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1KgGP7ob;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=By2nsJqy;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AE260A262D;
	Fri, 23 Oct 2026 13:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9AE260A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1KgGP7ob;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=By2nsJqy;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1KgGP7ob;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=By2nsJqy
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 02178220DA;
	Fri, 23 Oct 2026 13:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4XUkvFrpXCUHEKR7U+wfj4zSmKI6Sae2m5KDt7hxpdE=;
	b=1KgGP7obbYNKKmwnALCiBLzEDuw1Z65NTmvnYeJSD1eO9+IbHwuNBTcUry7yhggxoUcaHn
	Q1R9xjT4HQI84qiO/LNYOjzfneeVwDBkVIPy+5WQiToJGd4nmYNhEWlNSXOYmm8Ds2VYq0
	/3lrSFfDEG4ycMCCZbZaax8wtDQfwC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4XUkvFrpXCUHEKR7U+wfj4zSmKI6Sae2m5KDt7hxpdE=;
	b=By2nsJqymvtQe/k1UgCb/q2hDT7bdLQ83neWHbS1Uo0NeJbvZ/BEV4zCNPgkEtSn85k7w6
	YDu9Xy/fAU5lM9AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4XUkvFrpXCUHEKR7U+wfj4zSmKI6Sae2m5KDt7hxpdE=;
	b=1KgGP7obbYNKKmwnALCiBLzEDuw1Z65NTmvnYeJSD1eO9+IbHwuNBTcUry7yhggxoUcaHn
	Q1R9xjT4HQI84qiO/LNYOjzfneeVwDBkVIPy+5WQiToJGd4nmYNhEWlNSXOYmm8Ds2VYq0
	/3lrSFfDEG4ycMCCZbZaax8wtDQfwC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4XUkvFrpXCUHEKR7U+wfj4zSmKI6Sae2m5KDt7hxpdE=;
	b=By2nsJqymvtQe/k1UgCb/q2hDT7bdLQ83neWHbS1Uo0NeJbvZ/BEV4zCNPgkEtSn85k7w6
	YDu9Xy/fAU5lM9AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C5A2133F6;
	Fri, 23 Oct 2026 13:41:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9gJsGxdk22qKVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 13:41:43 +0000
Date: Fri, 23 Oct 2026 15:41:43 +0200
Message-ID: <87a4o4a608.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Markus Elfring <elfring@users.sourceforge.net>,
	Adrian McMenamin <adrianmcmenamin@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: sh: aica: Fix spu_memset() stride
In-Reply-To: <20261022163241.2504922-1-fuchsfl@gmail.com>
References: <20261022163241.2504922-1-fuchsfl@gmail.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,kernel.org,users.sourceforge.net,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Thu, 22 Oct 2026 18:32:41 +0200,
Florian Fuchs wrote:
> 
> spu_memset() writes one 32-bit word per iteration, but advances the
> destination offset by only one byte. spu_reset() calls it with
> 0x200000 / 4 words to clear the 2 MiB of sound RAM, so:
> 
>  - three out of four writel() calls target an unaligned address. The
>    SH4 can't do that. Each one traps and is emulated by the unaligned
>    access fixup. This call to spu_memset() causes 393216 unaligned
>    accesses, visible in /proc/cpu/alignment.
>  - the clear covered only about 512 KiB of sound RAM, not 2 MiB.
> 
> Advance the offset by the size of the written word, to clear the full
> sound RAM using aligned writes.
> 
> Fixes: 198de43d758c ("[ALSA] Add ALSA support for the SEGA Dreamcast PCM device")
> Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>

Applied now.  Thanks.


Takashi
