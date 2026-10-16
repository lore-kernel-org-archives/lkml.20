Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E44F415F1F;
	Fri, 16 Oct 2026 11:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151340; cv=none; b=R4TE2EIeWP4Re6N80+nLA8zg6hPktf6zblvhAg/gd0mg8x283nIwyN9sfpPrjAW78UR0TfvQ6syvvod2YuPtgyUN2Fh3b47JVa2l5hkf+9FWDWkuzqpEoXXNSByu9ZMVVDSC6vzj52fOmk9DMJpGjoDb+rk6+KuY1/BmXmCHSWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151340; c=relaxed/simple;
	bh=1dErfnGk0AlXFnzWnPutAkMayL10aS7cXpIkmvlZrAE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pxprEm/OQyQKUCblebXpFQbDI32gekoQ+GaTn6ixPBo18jdUetXbYh76RTUDrJv1zvr63ROP1EBgW+cWk8DcVHGgndIt+fHNbxb0bebblbkP2cwbqYjhohg1HWdBVivUTzcIRY9lTxmUWnXfxkA19BILYqaPYNuekBow62qI2GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M1K+YkUQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZRp+80+5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Kb+9fk2S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nIchJfnw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M1K+YkUQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZRp+80+5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Kb+9fk2S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nIchJfnw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EB75221C94;
	Fri, 16 Oct 2026 11:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792151337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v/bfWoWUMHkhWwnlc0q37jRAWjpZZtVN17NMMVfkpuk=;
	b=M1K+YkUQfPQy+rtPHFcCMRnkGa+d1ZVnPoQNqYT6nv6a+1/hB2kpCTDq+b36A1Kkn2oZ9Q
	VdM1MFfcL1Y2ep8gySXphy8UapHzkzv+hvFJqxccdxnWKs7RqzGvsZUxp8Uy1FX8Q5DOLH
	OlqVrhNo2nPC+S04cbkGaLNo1PjY+j0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792151337;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v/bfWoWUMHkhWwnlc0q37jRAWjpZZtVN17NMMVfkpuk=;
	b=ZRp+80+52qkWFc7qxKC4e2mqMOmNKu/DvO90SpdoyqCYnNUu0yWRUWBLxldpI2nVvi2Hf9
	iN1NJ7xlA3eEjUDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Kb+9fk2S;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nIchJfnw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792151336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v/bfWoWUMHkhWwnlc0q37jRAWjpZZtVN17NMMVfkpuk=;
	b=Kb+9fk2S8OVy8LOaiKSLh3VAb7vkCFUR2OqdXbQ6vDedDYnAfy9WzBg3OuQUmEaUPses5o
	zYHgUHpwJEe0cyRuXTjyaLNBsUnIt6OT7gEtBKQ8Okbk2P7TV4J0Eqk/zAD/FdZexgKreA
	4IIautBb6hI7tgY0HOP9aef4QAC8OVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792151336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v/bfWoWUMHkhWwnlc0q37jRAWjpZZtVN17NMMVfkpuk=;
	b=nIchJfnwa8VdmITe8LH9DVPKp0RIEm38JtJ80AZbLrnpvHPD+3Z2a/vU7gFhekNDp7h2AF
	5TlxQaAPnvbN1QAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 769C5139B7;
	Fri, 16 Oct 2026 11:48:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MqGEEygP0mptJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 11:48:56 +0000
Date: Fri, 16 Oct 2026 13:48:55 +0200
Message-ID: <87h5iluaqg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	thomas.weissschuh@linutronix.de,
	kees@kernel.org,
	phucduc.bui@gmail.com,
	sammiee5311@gmail.com,
	clemens@ladisch.de,
	tglx@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: dummy: Refresh the CD capture switch before use
In-Reply-To: <pm-pmb-7364ede2179b8830f660-v2-ca37049bc2e3679bb65f@gmail.com>
References: <pm-pmb-7364ede2179b8830f660-v2-ca37049bc2e3679bb65f@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,linutronix.de,kernel.org,gmail.com,ladisch.de,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Rspamd-Queue-Id: EB75221C94
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Fri, 16 Oct 2026 04:01:10 +0200,
Cen Zhang wrote:
> 
> The CD Capture Switch control must remain live while
> snd_dummy_iobox_put() updates its access flags and uses its ID for
> notification. snd_card_dummy_new_mixer() caches the control pointer, but
> snd_ctl_remove_id() can unlink and free it without updating that cache.
> 
> This requires a kernel caller to remove the switch while the dummy card
> stays connected and External I/O Box remains writable. Userspace
> ELEM_REMOVE rejects this driver control because it lacks
> SNDRV_CTL_ELEM_ACCESS_USER.

So, the removal shouldn't happen, but...

> With I/O Box initially 1 and CD Volume still
> present, the following ordered sequence is possible:
> 
>   1. snd_ctl_remove_id() takes controls_rwsem for write, finds and
>      unlinks CD Capture Switch, sends removal notifications and calls
>      snd_ctl_free_one(), then drops the semaphore and returns.

... how this happens at all?  Unless 1 really happens, the rest are
fictional dreams.

The same for another dummy driver patch.  Does it really happen at
all?


thanks,

Takashi
