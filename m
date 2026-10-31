Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463141;
	b=4nTMAjQE56YTj9yNI7Q6EqOhOFnPlKAK18VBXN6wxGZ+iNYOBgyHEQsS7NkSYgmSK8bN
	 Ra+Auff+DeH3kcnsBd5/PRxcWNjlLZl5jCPK+QS15/yjL5kqzfzyjzAKxsvYTJfjCcfP2
	 4JXjo8yxPgThIcS4kfrMr2KUpClwVUNTDivhySMkPlZxMzT9eESROOBQ4chTWKRUf/jX6
	 H4TvTjZ4zLgxsdpHl6X7/i+CLxaQL7OV9lfoH/Q/okzffegTxvcyHxayjj0lALnWUwDtD
	 Zvx2e/11wvj7Tcs2kW943SxbdTTq5FhHcOlxEdV89/pE+Swued2WtvphY7rom66t9HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463141;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=+6QZta/ih5gXxKhwhsn0Cfzo80Ue8+Vh4xF8hoF6EAI=;
	b=bKKOwSUAaMYbfSF4qb97WSkkJW2IR2zKLN+W9xMm2g+X20ih16J2zQqUx9qPFlYezv7L
	 /kISXAhV/IFQxJgl+Z6wHTZo6iVlcUWn2MfRjAFfUBRXiO9aIwhzNqucekSZBf7JTDvuh
	 UzWLHh8RulxQ6dU+V3y3v9sHbjPp1XxowtAMSk85auK5SeV98cny/nmTpjGawchAH/je/
	 szuGjt0V74qQYonQloJMntdd/kh3CbOl5Eh7lVGq4MuFYVSnqF3ujCgoOJ6DngFLrTLwz
	 AotuLLeeKZKcQ/Nsoi/3pvrXmzcsILtbmUs6VY8igJlko0mbaPS4P4Q7Gtob/CsSSdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GQ7NyLrz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Dr7GVRz4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GQ7NyLrz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Dr7GVRz4;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FAD606A32C;
	Sat, 31 Oct 2026 16:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85FAD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GQ7NyLrz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Dr7GVRz4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GQ7NyLrz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Dr7GVRz4
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B3C39222AC;
	Sat, 31 Oct 2026 16:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793463138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6QZta/ih5gXxKhwhsn0Cfzo80Ue8+Vh4xF8hoF6EAI=;
	b=GQ7NyLrz6fKIs6GczJHcLMO+Q634bBlI9buGwGOlcVAd8pFHolwcsyjYU4oq6WpBV1ZHbm
	fDdhS9NG3peO9DMiuHxCIAm2erDXEBj+6oVH/mpDdSiOrBXfEr+SYT0hUNWpv8tG+RSfkI
	MPiUiIqzxQIhJRr9vQL23eEH0IHPj0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793463138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6QZta/ih5gXxKhwhsn0Cfzo80Ue8+Vh4xF8hoF6EAI=;
	b=Dr7GVRz472FzJF4ot/g4AgzliqDa6cAuyzj2gVQzzGE6QQD7XhhliDpgiyzoc5XHcRGjl3
	NypLruT3bLODQmBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793463138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6QZta/ih5gXxKhwhsn0Cfzo80Ue8+Vh4xF8hoF6EAI=;
	b=GQ7NyLrz6fKIs6GczJHcLMO+Q634bBlI9buGwGOlcVAd8pFHolwcsyjYU4oq6WpBV1ZHbm
	fDdhS9NG3peO9DMiuHxCIAm2erDXEBj+6oVH/mpDdSiOrBXfEr+SYT0hUNWpv8tG+RSfkI
	MPiUiIqzxQIhJRr9vQL23eEH0IHPj0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793463138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6QZta/ih5gXxKhwhsn0Cfzo80Ue8+Vh4xF8hoF6EAI=;
	b=Dr7GVRz472FzJF4ot/g4AgzliqDa6cAuyzj2gVQzzGE6QQD7XhhliDpgiyzoc5XHcRGjl3
	NypLruT3bLODQmBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 66B95132D3;
	Sat, 31 Oct 2026 16:12:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jIZXD2IT5mqwOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 16:12:18 +0000
Date: Sat, 31 Oct 2026 17:12:17 +0100
Message-ID: <87ld7drgri.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stjepan Poljak <stjepan.poljak@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Clemens Ladisch <clemens@ladisch.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: don't resubmit MIDI URBs at once on -EPIPE
In-Reply-To: <20261029165701.2004391-1-stjepan.poljak@gmail.com>
References: <20261029165701.2004391-1-stjepan.poljak@gmail.com>
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
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 29 Oct 2026 17:57:01 +0100,
Stjepan Poljak wrote:
> 
> When a USB MIDI device answers with a stall, as a bus-powered keyboard
> does while it is being switched off, snd_usbmidi_urb_error() falls
> through to the default case: it logs "urb status -32" and returns 0, so
> the completion handler resubmits the URB at once. That fails the same
> way, so the URBs loop, logging every failure, until the disconnect is
> processed.
> 
> On a Raspberry Pi 3B+ with a keyboard behind the onboard hub, that
> disconnect is never processed. Printing to the framebuffer and serial
> consoles holds the loop to about 250 messages a second, and all
> interrupts are handled on CPU 0, so the hub's port change isn't handled:
> the keyboard stays silent until it is replugged. With loglevel=3, the
> same kernel processes the disconnect 0.04-0.24 s after the first error
> and the keyboard works again.
> 
> Treat -EPIPE like the other errors seen while a device goes away: retry
> from the error timer after ERROR_DELAY_JIFFIES, without a message. An
> endpoint that is really halted wasn't cleared before either; it is now
> retried every 100 ms instead of continuously.
> 
> Tested on the Raspberry Pi 3B+ (rpi-6.12.y, dwc_otg) with the default
> console settings: after each off/on the disconnect is processed, the
> keyboard re-enumerates and plays, and nothing is logged for the stall.
> 
> Assisted-by: LLM
> Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>

This looks like a better solution, indeed.

Applied now.  Thanks.


Takashi
