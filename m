Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718D24679C;
	Fri, 16 Oct 2026 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138777; cv=none; b=aATd/+N137zGrDsZfNh5LA1lW1WUo0pwTcCQSqm+KlUmh326HBAlZ1ltsatCQxQo2KMZou5VicwhBV3bosuKsqNGp5QN8u7GjLhD6JumBDS+zmpLVBdrFEBi8xBtIE1FhDHXbK25qSW6iScTurFKDNLJZ25zWXcmuE0NA8BzTrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138777; c=relaxed/simple;
	bh=0RwjRcT4HUlT4QhPcM8OlG1dkNRUnFFcPb0AroMAfU4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qg/2PRogmM2/aLKTRTgirJN/gnlYo8cG+w+5s17Tn56IA4qd0geRnfinRDYbdF1AGqYO8zfZ3JX3Ta5GlazYdIiAMzQcNoHtV75cimzu+psCEglidSsRuoVl8+7AJtYRRS9iXc6U3blyo5YlqLTF5VlEdeFhFTCKqobM+ssfE8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pVf8JopK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ohd70vue; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pVf8JopK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ohd70vue; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pVf8JopK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ohd70vue";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pVf8JopK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ohd70vue"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DBC1521BD0;
	Fri, 16 Oct 2026 08:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792138773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n5eFwldiSe5zgBeATGXAEa9p3G7itOL9ZX2UnYj1uP8=;
	b=pVf8JopKdBbtS7arN7J1g5tX+OXuGIKofersfket00mx62T8r+L9UiCYtsb4XerNDFiyh0
	rSXz/OuTQHfKoVv1lBynGHYfFQ26Q0iWCq9r0iMp2tShNb40f61Aks+lJMhGCR+8PYn5AW
	Hmz0U5IVaxqtswAH1n3wZ0CvH3l0bHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792138773;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n5eFwldiSe5zgBeATGXAEa9p3G7itOL9ZX2UnYj1uP8=;
	b=ohd70vueCFOi2VGHdWZCGVxbRwFg+6q9wJNE5NAZU4vC0HcRFcjnjd/WaIrOo5bjXkUAPT
	88MnuQH3rqgUOyBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792138773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n5eFwldiSe5zgBeATGXAEa9p3G7itOL9ZX2UnYj1uP8=;
	b=pVf8JopKdBbtS7arN7J1g5tX+OXuGIKofersfket00mx62T8r+L9UiCYtsb4XerNDFiyh0
	rSXz/OuTQHfKoVv1lBynGHYfFQ26Q0iWCq9r0iMp2tShNb40f61Aks+lJMhGCR+8PYn5AW
	Hmz0U5IVaxqtswAH1n3wZ0CvH3l0bHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792138773;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n5eFwldiSe5zgBeATGXAEa9p3G7itOL9ZX2UnYj1uP8=;
	b=ohd70vueCFOi2VGHdWZCGVxbRwFg+6q9wJNE5NAZU4vC0HcRFcjnjd/WaIrOo5bjXkUAPT
	88MnuQH3rqgUOyBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94B9A1339F;
	Fri, 16 Oct 2026 08:19:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vB2TGhXe0WqqUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 08:19:33 +0000
Date: Fri, 16 Oct 2026 10:19:33 +0200
Message-ID: <87pkxa5a7e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Imtiaz Chowdhury <imtiazc56@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add HP ENVY Laptop 13-ba1xxx quirk
In-Reply-To: <20261015232210.35946-1-imtiazc56@gmail.com>
References: <20261015232210.35946-1-imtiazc56@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 16 Oct 2026 01:22:10 +0200,
Imtiaz Chowdhury wrote:
> 
> On the HP ENVY Laptop 13-ba1xxx, the F5 and F8 key's LED were not
> working at all.
> 
> Add a quirk for subsystem ID 0x8820 so it uses the existing
> ALC245_FIXUP_HP_X360_MUTE_LEDS fixup, as done for the 13-ba0xxx.
> 
> Tested on HP ENVY Laptop 13-ba1063cl: F5 and F8 LED lights work as
> intended. Checked the audio systems both with headphones and no
> headphones, and there were no issues.
> 
> Signed-off-by: Imtiaz Chowdhury <imtiazc56@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
