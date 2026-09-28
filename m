Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4BF4BD794;
	Mon, 28 Sep 2026 16:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611949; cv=none; b=oMTGXXEu5MA+3s786IxD0Z4jh2nQLt78AImbY35RneykZU4L0TvcRR711fp3a3tPCmZOTaQhxSCOFouRn9iIe49HZTOgXXzM0EY4vfRjCWgVzOF0cVv5DQ0lviIsnDTiFMi6aNGWXvLa6EdWxrbn/C4/QyV62xjG24qj+AxZwUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611949; c=relaxed/simple;
	bh=OpQypccNTbWHS75Y0yiJP4OoADsMFver3MCE1waxy0c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bllyXjWOAb9ZKiWwYWJ+s/rMXrM+OslJe010NGbtmV4g2n6Elo+hyuokb+3ZOVuo9oc9VXFHtfhKkxwulTd4g7KjKr9mHbDaozoMqG+gnJCbrR0R6IfMZOZ7NkE9rCRNvlNrdAJYdgcrLmRZKOqamFIAI3lMfn5G1L1yRiHfpTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZRUWCv8k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r9486+vh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cAY9q2mj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=llgoOW6Y; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZRUWCv8k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r9486+vh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cAY9q2mj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="llgoOW6Y"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BB4E421E79;
	Mon, 28 Sep 2026 16:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790611941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FrkVonS/GfM0/XrKpHPnKdwPhZiuNXVf8m5tQ0xltcg=;
	b=ZRUWCv8kXR+Xk8rh01UnOX7JEeADrvz+H0nYnOuznmkRpd3aMZCmt7s04ktP2ZHGhG2TYM
	XEBOrI6EauGb33/bRrTzDExmH3d0MKoO55GP269To3xo3VCWGUpR6NecwtMKbciHHTZ+MA
	mr8/toKx1MjWSKjOv0Mb6njRAt1iZLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790611941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FrkVonS/GfM0/XrKpHPnKdwPhZiuNXVf8m5tQ0xltcg=;
	b=r9486+vh79hJgE3sIQiLmfitoIQm0ZMZqIBNBGWPO+txvSan4FH1pS1uwqIYMnqTm6bNv3
	4dfP72F6OFbAUlAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790611937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FrkVonS/GfM0/XrKpHPnKdwPhZiuNXVf8m5tQ0xltcg=;
	b=cAY9q2mjxWtovo4+w7WVuk/qM7mjwSVftRUSYiB4cLBoaRnhu6bsNPEip65AxrsSZ6SvNP
	Rc4rw1BjCKeUyP37i4nLVuNK8uUNBz5No3lnUdhS1lhE71jBfJltMjv1Hz3rWeWWcwhPXp
	/aD9a+mOmhIGyLy6LWm1mjZlZStKIYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790611937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FrkVonS/GfM0/XrKpHPnKdwPhZiuNXVf8m5tQ0xltcg=;
	b=llgoOW6YjCDdAqk0t9Jvb/KVEZVaDO6l/roG2Ag1rjai9zqwjiR0eUs/ol5mnBA1e6uGFy
	q3qL0PPBxkW52+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D0F4133F3;
	Mon, 28 Sep 2026 16:12:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e/4GEeGRumrwaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 16:12:17 +0000
Date: Mon, 28 Sep 2026 18:12:16 +0200
Message-ID: <877bk54aov.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Niko Huuskonen <niko.huuskonen.00@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <zonque@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ALSA: caiaq: Kore controller fixes and LCD support
In-Reply-To: <20260927003532.289468-1-niko.huuskonen.00@gmail.com>
References: <20260927003532.289468-1-niko.huuskonen.00@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -1.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,gmail.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Sun, 27 Sep 2026 02:35:28 +0200,
Niko Huuskonen wrote:
> 
> The Native Instruments Kore controllers (USB 17cc:4711 and 17cc:4712)
> work with snd-usb-caiaq, but a few things are wrong or missing:
> 
> - The EP1 command buffer is shared by all senders without locking.
>   Patch 1 adds a mutex. It is needed by patch 4, which adds a sender.
> 
> - Parts of the Kore key map do not match the hardware: softkeys 5-8
>   come in reverse order, and on the first Kore the knob touch sensors
>   are scrambled. Patch 2 fixes the map.
> 
> - The 128x64 LCD is not supported, and userspace cannot reach it while
>   the driver is bound. Patch 3 adds a hwdep interface ID, and patch 4
>   exposes the LCD as a hwdep device that takes whole frames, plus an
>   "LCD Contrast" control. The display protocol comes from USB captures
>   of the vendor software that the OpenKoreBridge project published.
> 
> Patch 2 changes the key codes userspace sees for softkeys 5-8 on both
> controllers, and for the touch sensors on the first Kore. Userspace
> that compensates for the old map, such as the OpenKoreBridge controller
> script, would have to follow. Userspace can read the map with
> EVIOCGKEYCODE to support kernels with and without the change. If
> changing the codes is a concern, patch 2 can be dropped; the rest of
> the series does not depend on it.
> 
> Testing: the series was tested on a Kore controller (17cc:4711), applied
> to v7.2.6 and built out of tree, with a userspace MIDI bridge that uses
> the LCD, the LEDs and all controls. Every patch builds with W=1, and
> checkpatch.pl --strict only asks whether MAINTAINERS needs updating for
> the new file, which the existing sound/usb/caiaq/ entry already covers.
> The locking problem in patch 1 was found by code review and has not
> been reproduced. A Kore 2 was not available for testing.
> 
> Tool use: the patches were written with an AI coding assistant (Claude,
> an LLM), as the Assisted-by tags say. It worked in an interactive
> session in which I asked it to make the Kore controller usable as a MIDI
> controller on Linux, to find out how its LCD is driven, to fix the
> button mapping I reported from testing the hardware, and to prepare the
> kernel changes for submission. It found the missing locking by code
> review, derived the key map from my tests on the controller, checked the
> LCD protocol on the device over raw USB, and tested each change on my
> controller.
> 
> Niko Huuskonen (4):
>   ALSA: caiaq: Serialize access to the EP1 command buffer
>   ALSA: caiaq: Fix the Kore controller key map
>   ALSA: uapi: Add hwdep interface ID for caiaq devices
>   ALSA: caiaq: Add LCD support for the Kore controllers

Applied all four patches to for-next branch.  Thanks.


Takashi
