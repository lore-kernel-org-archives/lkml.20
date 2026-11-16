Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843586;
	b=vxFQYhEeVLRSuG3lh9TgzrRO1Nau9D79yZdUY8xJ2bWSXnWS8HpdG26AGrU5gmOUrJnz
	 SfN6B+jbZJ/fTuukdvgIMcfrmXxtp9UJUzk/0A34fchzHm9Jkt+CDp3mvg60SPRaqcMR7
	 AmJORaUnDNXqVXe8JuuV6XFsBxAmYxjKmkqFuSLUuIMBjn+Bx86WjZZvqt6IvitDwdQma
	 x23OxeiYmOiPkFIDqguw/yATjq1D/fvAgSvsKHSzRDaaIvhguxDgzBij4b4YflyHiUrgH
	 X9kaCrtdgsaR9meM9Xsl2TFY6mocc2pQ8/w+aI6H0zuxQUL80/BumlLY2VIKnFE7CfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843586;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=8bP3CwWdvQfuuLB4xuu9xstp3vo9vHYp4JZvZMDV4+w=;
	b=4RAhojui8a4CtAQL9IVn9T/s3Yi7pe3v0RsLfu/7P+3UZjGHCwYJf+RgrsY+7Vwoo9eF
	 LP1qe3EdSRvFp9xa/ftR/6NevYTBw7cj0Es71zxRK3xYWmpiCOfGIn656LLZDtju+dSlL
	 ZJAoA9aw7uZFE32U5Nm8MbTehp7ViDaab3icmk9xpfU4xoW0GF13hl9SxB5Gefr4Fzi2h
	 sqAeO6Bo5Y9iXrXX0t4zA1+Jx3jHVLdmT4MA11jModS7YnRymz4/iPqu7wapvj7cKGMEH
	 udwwRlF+g7nWMFkAoT4VQ7Y5uwcUatI8hRVaVsO5vpgFhrlUmM+CaijxczESafu3Zjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zgQQAq+u;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mGbtOXhQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zgQQAq+u;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mGbtOXhQ;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A96B606A33D;
	Mon, 16 Nov 2026 15:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A96B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zgQQAq+u;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mGbtOXhQ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zgQQAq+u;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mGbtOXhQ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8AD901FB1D;
	Mon, 16 Nov 2026 15:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794843583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8bP3CwWdvQfuuLB4xuu9xstp3vo9vHYp4JZvZMDV4+w=;
	b=zgQQAq+uAsnMhcJUCxGDtvYvEDFz1dVPm9QI9r85TRh6WEKKn9mWWc/ccOI3g1zHoBNWry
	GzUhxMKOw1jpyKyuojSauaSqZ157o4irbIKQ1HfS1bO9pxCQ3ik/2omBlHZGRrwo06NonA
	cDPabvXc4cWMfzMPJtPxvmk2B0ew0S8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794843583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8bP3CwWdvQfuuLB4xuu9xstp3vo9vHYp4JZvZMDV4+w=;
	b=mGbtOXhQLs+0bA0FSz2dII9XX3XCOZfut5n9c4pCK3FYblRPXvh+EUrm6/dSYGX5Yi35DX
	2lVGh2wxdNG9+tBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zgQQAq+u;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mGbtOXhQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794843583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8bP3CwWdvQfuuLB4xuu9xstp3vo9vHYp4JZvZMDV4+w=;
	b=zgQQAq+uAsnMhcJUCxGDtvYvEDFz1dVPm9QI9r85TRh6WEKKn9mWWc/ccOI3g1zHoBNWry
	GzUhxMKOw1jpyKyuojSauaSqZ157o4irbIKQ1HfS1bO9pxCQ3ik/2omBlHZGRrwo06NonA
	cDPabvXc4cWMfzMPJtPxvmk2B0ew0S8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794843583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8bP3CwWdvQfuuLB4xuu9xstp3vo9vHYp4JZvZMDV4+w=;
	b=mGbtOXhQLs+0bA0FSz2dII9XX3XCOZfut5n9c4pCK3FYblRPXvh+EUrm6/dSYGX5Yi35DX
	2lVGh2wxdNG9+tBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4075013408;
	Mon, 16 Nov 2026 15:39:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id smpABb8j+2ofOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 15:39:43 +0000
Date: Mon, 16 Nov 2026 16:39:42 +0100
Message-ID: <877bicyedd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: nordschamane1@proton.me
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC v4] ALSA: pci: add analog support for ESI MAYA44e
In-Reply-To: <20261116-codex-alsa-maya44e-v4-1-381358afc43a@proton.me>
References: <20261116-codex-alsa-maya44e-v4-1-381358afc43a@proton.me>
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
	ARC_NA(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,proton.me:email,suse.de:dkim];
	URIBL_BLOCKED(0.00)[suse.de:dkim,proton.me:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 8AD901FB1D

On Mon, 16 Nov 2026 05:11:02 +0100,
Nordschamane via B4 Relay wrote:
> 
> From: Nordschamane <nordschamane1@proton.me>
> 
> Add four-channel analog playback and capture for the ESI MAYA44e PCIe
> card (19fe:7000, subsystem 0e51:0001). Playback and capture share the
> sample clock and can use independent period sizes. Expose analog source,
> gain, direct monitoring, DAC and crossmix controls.
> 
> The playback DMA rings and ALSA staging buffer are cleared during the
> reset that completes prepare. This keeps clearing and pointer rebasing
> under the same PCM stream lock, including for linked streams.
> Both streams use the locked reset path. A linked PREPARE holds the
> peer's buffer mutex but does not block its ALSA read or write copies.
> Take a driver buffer-access gate before touching either stream's
> buffers, and keep it until the reset callback. The stream lock then
> covers the remaining pointer rebase. Return -EBUSY if a copy is active.
> Explicit RESET takes its own gate when no prepare is in progress.
> 
> Treat unavailable MMIO as an error during DMA setup, start and
> position tracking. A failed read must not be interpreted as a running
> engine or a completed capture period. After confirmed loss of access,
> skip BAR operations and use PCI configuration space for best-effort
> shutdown.
> 
> Publish capture samples and the copied position under the same lock.
> Use the DMA position and elapsed time to detect missed capture periods.
> Skip early or repeated interrupts and report a capture XRUN when the
> ring may have wrapped without the driver copying the preceding half.
> 
> The ES7010L register sequence comes from observed PCI transactions and
> analysis of the ESI Windows driver. The existing ALSA PCI MAYA44 driver
> was a reference for the WM8776 command format.
> 
> OpenAI Codex assisted with PCI trace analysis, driver implementation,
> test tooling and the changelog. The requests covered analog playback,
> capture, mixer controls and suspend/resume.
> 
> Signed-off-by: Nordschamane <nordschamane1@proton.me>

Thanks for the patch.

First, off, as Signed-off-by is a legal requirement, could you try to
fill a real name here?  At best align the From address together, too.

About the code changes: it looks well readable in general, and the
code is rather straightforward.  Yet a few things:

- Try to use guard() & co instead of the open mutex or spin lock
  calls.  This will avoid the lock unbalance drastically.

- The handling of the work, at least, for finishing the work doesn't
  look good.  In general, at PCM close callback, all streams have been
  already stopped and finished, hence there shouldn't be much work
  there at all.  If something race is still found there, it's already
  wrong.  Most of such stop synchronization should have been done in
  sync_stop callback, instead.

- The sample packing in the loop in ack doesn't look good, either.
  Do we really need a manual expansion and the format conversion in a
  loop there at all?  The driver should avoid such a loop but just
  copy the data as-is, as much as possible.


thanks,

Takashi
