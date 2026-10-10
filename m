Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C8A346ADB;
	Sat, 10 Oct 2026 08:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619478; cv=none; b=jtJoerohMoQDcaPWELXVaVF3ICYkq735pcftj610vrXKC1ZBt82CHf+gj1vGHNyKjWhFIJziRah3jdiis924avnr6SCzI6Ma1w3W1H+nc6W9UZ1fMaPiFFRWGsix2Ep5xdntVXFT1e0dZQuobQlhtcMz5RkeJOFUdnGDZvRXuFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619478; c=relaxed/simple;
	bh=wcuKDl9n3YPbs37qWKjHjBKUuJeC+wKns9oihP1W544=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=orNv7B7eA67BhRRUKNri2icfB1x4Bn8Xdd+41zLH4H48WKZpD9sIXXfd9LIQuPvlCYbUEpAupHO21MWT4ufgYcU9x1Y4JmeKCGOVMRR/HjoPMPR0yG6UahEOLI/XzAsYRiLLm1UlHkVLIXWpp1Bx8OlA7yfBI5p56IMIr9jvgaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g8fGslmL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O9Fri3bz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g8fGslmL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O9Fri3bz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g8fGslmL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O9Fri3bz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g8fGslmL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O9Fri3bz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8071521BC2;
	Sat, 10 Oct 2026 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791619474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9CKdKGoIx7Ap8w/SDss5FvOqIkiWXMx7l0nAxq8yLOc=;
	b=g8fGslmLxnVu4wOYBavFpMNs8kTHS2kygwhlxDaQbLtkrG4WLWeGdZSeCFUQP4LUJjVpQq
	A1SNGfmC6qpehnKUwnWvJN7jLR5lFweNdflqqtN5QhNmT6/i8NHm6APgR4KkbkkDzbEEDB
	zXmLZUZxVJvrHKGFGd/Vwf4BmvOJL7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791619474;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9CKdKGoIx7Ap8w/SDss5FvOqIkiWXMx7l0nAxq8yLOc=;
	b=O9Fri3bzVHEh8ySO2f/MHje1EBrqIz4fjb/pXb8Net8cdA1tgjfrPFuipAqE09g8CcM/Ew
	xx2A29DjyPbcssBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791619474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9CKdKGoIx7Ap8w/SDss5FvOqIkiWXMx7l0nAxq8yLOc=;
	b=g8fGslmLxnVu4wOYBavFpMNs8kTHS2kygwhlxDaQbLtkrG4WLWeGdZSeCFUQP4LUJjVpQq
	A1SNGfmC6qpehnKUwnWvJN7jLR5lFweNdflqqtN5QhNmT6/i8NHm6APgR4KkbkkDzbEEDB
	zXmLZUZxVJvrHKGFGd/Vwf4BmvOJL7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791619474;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9CKdKGoIx7Ap8w/SDss5FvOqIkiWXMx7l0nAxq8yLOc=;
	b=O9Fri3bzVHEh8ySO2f/MHje1EBrqIz4fjb/pXb8Net8cdA1tgjfrPFuipAqE09g8CcM/Ew
	xx2A29DjyPbcssBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49CC7133F6;
	Sat, 10 Oct 2026 08:04:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rATdB5LxyWrhTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 10 Oct 2026 08:04:34 +0000
Date: Sat, 10 Oct 2026 10:04:33 +0200
Message-ID: <87ld86j81a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] ALSA: line6: Fix handling of zero-length capture packets
In-Reply-To: <20261009133341.440917-2-tiwai@suse.de>
References: <20261009133341.440917-1-tiwai@suse.de>
	<20261009133341.440917-2-tiwai@suse.de>
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
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 09 Oct 2026 15:33:35 +0200,
Takashi Iwai wrote:
> 
> The LINE6 playback engine assumes that line6pcm->prev_fsize=0
> indicates that there was no input packet to be processed, and
> synthesizes the frames.  But, when a capture stream receives a
> zero-length (or a very small size) packet, it sets 0 to prev_fsize,
> while playback engine still believes it's for synthesis, hence it
> tries to copy the larger data than the actual input data.
> 
> As prev_fsize=0 can't be a good indication for "no input", change the
> meaning slightly: now prev_fsize=-1 means no input, while prev_fsize=0
> means it's a zero-length packet.
> 
> As a result, the outgoing packet length can be also zero, so the
> corresponding check is dropped, too; otherwise the outgoing URB will
> be lost.
> 
> Fixes: 1027f476f507 ("staging: line6: sync with upstream")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> v1->v2: drop the zero urb length check code, too

Hm, still this one looks tricky and can't cover the full cases, as it
seems.  So I dropped this from the series for reconsideration for now.


Takashi
