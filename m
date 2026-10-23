Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762231;
	b=vzpg0uUL6Fm0YYxuMo4iLc1BQv2vwOKCl1kbBSWdI0ElnNJ1Oz5muPgcHpG49L6mlM1n
	 bnl19OXvNRG+61OPkW2UhaJUQQKTHW9W9Q8AUXq4OKDjuTxohp7/gM80u5iZxlfxGEESA
	 V5dCUpYBCHBf2uxEG4CqIFUkUzDL6MjrcVxvxAVR/YKq3WhrYhVS/xoUMGBa162b5qLKn
	 99Z1Es9NhRe0vougSP//ACuStaOD/8N1E8faPYnoKhYN/x6akv/p33Yy/pGYTpVJfWKrS
	 Yi6ku72ME3wY+3MHr/thhUgZ5gqJngVBtlPq2gv1JAeoxUL6AdaHGiGrASVVfSUZBcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762231;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=H5C2YgX9zoAUN8RdPNBEehJ+u01y85A4y2Tev8DT1hg=;
	b=xgjgE7N7gx28oIzcqKF/22kpo/lR0ZOo8fUeXi7fVzXTD3k/cOyreBb0p/gtW9FPWQ/J
	 chNRU2WxVgH6hQjgAKA/qXHEjbcBriZwqtedjdAqyLWvnLJ2V5YUi08ht7vPngKiijtYv
	 I2Q6Q5D8Wj03oPkNsHKE3/PWQ9+vJQZmxVE+HwtOeHa5k+IIwNj7lmDZE/5AR98cSMYBU
	 bx5ONlZ9TtP9tHTUFI8kbc8WT2i1dJvkGdoybdlPIjJh2Fd4hZ0vWYlhs/QUrRw+rjBay
	 O9YDAtFgO2DciGfR5s9s4SUw0QP5an48L+mNUAxGh4IuOxjyzzaMyBUQyhRl5IPoHsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DM2fPH07;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C2qqh51M;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DM2fPH07;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C2qqh51M;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F7F606A31F;
	Fri, 23 Oct 2026 13:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F7F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DM2fPH07;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C2qqh51M;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DM2fPH07;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C2qqh51M
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 706C5220D3;
	Fri, 23 Oct 2026 13:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H5C2YgX9zoAUN8RdPNBEehJ+u01y85A4y2Tev8DT1hg=;
	b=DM2fPH07E17ZTllrMqBRrD7OXjttjIWUEXjPuHEzvJUpNbQXN5qmQX5BKeCz7uARth7cFG
	j2H5n9KXSd3FPBvFvWtuOM/bHW/K9BbLIrWGBAEec5ocN9CYFBpX6PD+8s70dyUcWwhRn7
	gjREfMDayFpjOGuAUiu20/NDOkbWSKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H5C2YgX9zoAUN8RdPNBEehJ+u01y85A4y2Tev8DT1hg=;
	b=C2qqh51MJIORQZbHuWwC4QjEFo8QJkfsrAgse2aSBwc/Y3PojDaCf1KInPaBjuBeY9iV3R
	CaW8W3f6HwFeUfBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H5C2YgX9zoAUN8RdPNBEehJ+u01y85A4y2Tev8DT1hg=;
	b=DM2fPH07E17ZTllrMqBRrD7OXjttjIWUEXjPuHEzvJUpNbQXN5qmQX5BKeCz7uARth7cFG
	j2H5n9KXSd3FPBvFvWtuOM/bHW/K9BbLIrWGBAEec5ocN9CYFBpX6PD+8s70dyUcWwhRn7
	gjREfMDayFpjOGuAUiu20/NDOkbWSKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H5C2YgX9zoAUN8RdPNBEehJ+u01y85A4y2Tev8DT1hg=;
	b=C2qqh51MJIORQZbHuWwC4QjEFo8QJkfsrAgse2aSBwc/Y3PojDaCf1KInPaBjuBeY9iV3R
	CaW8W3f6HwFeUfBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12033133F6;
	Fri, 23 Oct 2026 13:30:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 342PNXRh22rrSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 13:30:29 +0000
Date: Fri, 23 Oct 2026 15:30:28 +0200
Message-ID: <87pkx0a6iz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kazuki Hanai <hnkz.64@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	David Carlier <devnexen@gmail.com>
Subject: Re: [PATCH] ALSA: us122l: mark hwdep mappings VM_MIXEDMAP
In-Reply-To: <20261023-fix-us122l-mixedmap-v1-1-e7bdd053850f@kernel.org>
References: <20261023-fix-us122l-mixedmap-v1-1-e7bdd053850f@kernel.org>
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
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,perex.cz,suse.com,gmail.com,suse.de,vger.kernel.org,kvack.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.de:email,perex.cz:email];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -10.80

On Fri, 23 Oct 2026 12:21:31 +0200,
Lorenzo Stoakes (ARM) wrote:
> 
> mm has recently moved to a strict model which requires any driver which
> clears VMA_MAYWRITE_BIT to be mapping non-mm-managed memory
> (VMA_PFNMAP_BIT or VMA_MIXEDMAP_BIT), failing any such mmap() with an
> error and a kernel warning - see "mm/vma: only allow mmap to clear
> VMA_MAYWRITE_BIT if not mm-managed".
> 
> However, simultaneous to this, commit 71c610aeb177 ("ALSA: us122l: Prevent
> write upgrades for read mappings") updated us122l to clear
> VMA_MAYWRITE_BIT without marking the region with either VMA_PFNMAP_BIT or
> VMA_MIXEDMAP_BIT.
> 
> vm_insert_pages() and friends set this automatically, however this driver
> maps its pre-allocated pages from a fault handler, so never calls these.
> 
> Simply set the flag in usb_stream_hwdep_mmap() to resolve the issue. This
> correctly marks the mapping as one whose pages core mm does not manage,
> which has no meaningful impact for this driver beyond preventing the mmap()
> from failing.
> 
> Fixes: 71c610aeb177 ("ALSA: us122l: Prevent write upgrades for read mappings")
> Reported-by: David Carlier <devnexen@gmail.com>
> Closes: https://lore.kernel.org/20261018025905.201296-1-devnexen@gmail.com
> Cc: Kazuki Hanai <hnkz.64@gmail.com>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
> Andrew - I think easiest for you to take this.
> 
> It should go in before my series ideally to avoid bisection hazard, I think
> while it's a fix for the driver, that'll be the safest way.

Yes, feel free to take:

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
