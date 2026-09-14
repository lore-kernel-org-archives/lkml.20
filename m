Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD190328B71;
	Mon, 14 Sep 2026 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401161; cv=none; b=jw37+a8Std1sk8b7BrWydoZTYb7fp6tLTwiw7hqEULF29L7IIG74HUadfQxL34rihwpDeCIyNhBiz+kpgYsnstOCjgEpEVXEJ29fnOnwbpJgQgsActVfCdP4Bw0brh9x2qLozWfgqhtASUJiMiafw+a0zeQYiHdJbfRJg2rQqpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401161; c=relaxed/simple;
	bh=r+++Vz4L0xGCVKvOYH9Q/FCMPJKulUS5X/5bStgPxzw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u27OfTJ/OsQrMBKldAjmvnmDTSZ9FtVWRoCZaCZ45sRBDbg4nls1QhCWCK3SiPINZ2orw9TjTkpMkNItWpp3GN+5HaWKrhHtEn2DXksjuuO7AzMG/o0Z8psyhg+rhDnOrtU6PjAYsBdqvzzLCPSlZcSl3ZO3GGeltYmv1BxwtO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aEYa6V2B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SfMY/Ul7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DoWmDRp+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XXq7DCWI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aEYa6V2B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SfMY/Ul7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DoWmDRp+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XXq7DCWI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 843B921BD3;
	Mon, 14 Sep 2026 15:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789401153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FkR4ECj2BXbci0T1JDvmyFmzuqe4Mntk4QSRkE7tyv0=;
	b=aEYa6V2BhfeVnY0HvF6OEwYu509t0/AXmJA2hKkar+xXlOoyPnM3ZjQfnFNsxdgNlIm/Hn
	/hc1qAf3gX6tOZeN7E0l2YiFyw1tB/qS+knvxy1r0sflUOnZOS32tznT8waaKNAZpfAK5R
	Vqhasu6FNpr0KwJVJlPbfbTXnPqUJic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789401153;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FkR4ECj2BXbci0T1JDvmyFmzuqe4Mntk4QSRkE7tyv0=;
	b=SfMY/Ul7Salz2itLiuBZ2M2NZYnlSGiQT91mYGxIYxyeynRQ5Fpls7F2lZsqz1pBrYLSVI
	K+i6yiQ0f2N5oGCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DoWmDRp+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XXq7DCWI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789401149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FkR4ECj2BXbci0T1JDvmyFmzuqe4Mntk4QSRkE7tyv0=;
	b=DoWmDRp+S7MVIy/+Its2IfRANnrGzHSBdOE2OzSgmG+i/Al1PA/pNYz8Vmp7/ZzLRtl48+
	o7oyYyoTCkYZY6D/2Ma1sNUXLSO6DwqJL4E/O6X55xKZUqLS+VOgJddnoLzQ3QVhWRmUDO
	IM9sS/lMIyJiU7uGaVLtP2vfpYgxf34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789401149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FkR4ECj2BXbci0T1JDvmyFmzuqe4Mntk4QSRkE7tyv0=;
	b=XXq7DCWIkzv9CFyZCA6UL6ykZBP9hOEIJlQC+BDezjERTX/6d9j0FJ2VkRZXuXApwdFWbR
	Oal/Ypnvo2m4cCBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39AAE13693;
	Mon, 14 Sep 2026 15:52:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SsrWDD0YqGpnBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 15:52:29 +0000
Date: Mon, 14 Sep 2026 17:52:28 +0200
Message-ID: <87fqzbomo3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaeho Cho <jaeho2025@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable mute LEDs on HP OmniBook 7 17-dc0xxx
In-Reply-To: <20260914142445.3476212-1-jaeho2025@gmail.com>
References: <20260914142445.3476212-1-jaeho2025@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 843B921BD3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Mon, 14 Sep 2026 16:24:42 +0200,
Jaeho Cho wrote:
> 
> The HP OmniBook 7 Laptop 17-dc0xxx (SSID 103c:8d9c) has mute and
> mic-mute LEDs on its F6 and F9 keys, but neither lights up. Its quirk
> entry only sets up the two CS35L41 amplifiers, so no LED control is
> registered for either key.
> 
> Writing to the ALC245 by hand with hda-verb, the mute LED responds to
> COEF 0x0b bits 2-3 and the mic-mute LED to GPIO 0x04, lit when the pin
> is low. That appears to match what ALC245_FIXUP_HP_X360_MUTE_LEDS
> already does, so add a fixup that chains the two-amp I2C setup to it
> and use it for this model.
> 
> Tested on 7.2.4 with the patched module: hda::mute and hda::micmute
> are registered, and both LEDs follow the speaker and microphone mute
> state, including from the F6 and F9 keys.
> 
> Signed-off-by: Jaeho Cho <jaeho2025@gmail.com>
> ---
> Hi Takashi,
> 
> I found the LED wiring by trial and error rather than from any HP or Realtek documentation, so there may be details I am missing. A few things I was unsure about:
> 
> - Setting COEF 0x35 bit 6 also lit the mic-mute LED. I went with GPIO 0x04 because it matches the existing HP fixups, but I do not know which one HP's own driver uses, or whether it matters.
> 
> - The sibling models 8d9b ("OmniBook 7 UMA") and 8d9d/8d9e ("OmniBook X") probably share this board, but I only have the 8d9c to test on, so I left them unchanged.
> 
> I am happy to revise anything that should be done differently. Thank you for your time, and for maintaining this driver.

The patch looks simple enough, so I applied now.


thanks,

Takashi
