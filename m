Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740004F3EDA;
	Tue, 29 Sep 2026 09:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674067; cv=none; b=QxEwtdnJ/SDMGlhC/q3QR5jHeQddFM7y14bEeJlCwh2PWMZOqLolGh9nVqxRmpMBHDPHkNiOJvFNjNw4wsRrABxIGa4oWcSRKfYXUXD8HQE9UloT4Y5UaCrqVATTztWS2pkvAo3GwpR7fex/1bf+7oFXbVQd6yTq5Gx0Nbmou5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674067; c=relaxed/simple;
	bh=uog8vJYYL5IhAKN6S+Qy1BzGIfoavnO99rAuCWu3kYk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G2uTAt/4pfUzwtRyFLsYKaQJtw8OMTXF2cbtTSgsXuyUj4B9sp9MNscJ1d0vLxh5c4zwgDVEaOFpgqN3m1JEjfcKAQVds2A3hEaqxsoCspDreP5ogumk2gxWYqSXb0Cbx5U3lT+QY+tvAYoc5AyY/k74PodIYkYwDqX/cSpowYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J6Hz7YsY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7u4yOqJd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sMNZTxxT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HBtbcg8M; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J6Hz7YsY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7u4yOqJd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sMNZTxxT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HBtbcg8M"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3FD7721BC4;
	Tue, 29 Sep 2026 09:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790674056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xS6XOymtSgVb3OBZr0OuBppDquAOavTfRG3W0KiULNE=;
	b=J6Hz7YsY7713bAWMHxL4KexZBO+EBxYFjCBVA2oKyOVF1EanV9Lke8mFrVTXYenLkPoAOR
	wR2d7cTf+n+njRYWnFAWG0PcBpO89A/49frCbIkEnlypLK3wykrf9if4T083psf5A3z+sa
	m5qkfQsbvxHpbtGExjL9V1ORp2jylvs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790674056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xS6XOymtSgVb3OBZr0OuBppDquAOavTfRG3W0KiULNE=;
	b=7u4yOqJdaTTp6TTrzcir4EZmAOeTY/abFhJL534cXzQvP/uA5GigAb+2CB6bVuBH9/XeaT
	QD7wZee039l859Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790674052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xS6XOymtSgVb3OBZr0OuBppDquAOavTfRG3W0KiULNE=;
	b=sMNZTxxTOzO/wgI1FEHoGfUuNYqPlwbwyLkmFITac1393vCv9TyVQAlwE5UntxWtp+8gsc
	bjDMoyM432YX+1l3Rf9sNzf0Q8fjiwueqMHpXUEp4wggUs3Ll7wpw4F+OFHJhe5H0D4KFT
	VKeikKT0TvJuUgmGO8JRR4m2B011zKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790674052;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xS6XOymtSgVb3OBZr0OuBppDquAOavTfRG3W0KiULNE=;
	b=HBtbcg8MiABpSAmj0gd1RC6MkAx+Vd3Qr9JpacyWqdTCBBCFnhLxqF8sB2ssHDztiW7nrx
	xQeNzYAHP+lxMNCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8A7B136D1;
	Tue, 29 Sep 2026 09:27:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LlDlIYOEu2owEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 09:27:31 +0000
Date: Tue, 29 Sep 2026 11:27:27 +0200
Message-ID: <87fqys2yrk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Muhtasham Nawr al-Mahmud <muhtaseem2005@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kailang Yang <kailang@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ALSA: hda/realtek: Fix speakers on ASUS PM3406CHA
In-Reply-To: <20260924144512.3989-1-muhtaseem2005@gmail.com>
References: <20260924144512.3989-1-muhtaseem2005@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -2.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 24 Sep 2026 16:45:12 +0200,
Muhtasham Nawr al-Mahmud wrote:
> 
> The ASUS ExpertBook PM3406CHA uses an ALC256 codec with subsystem
> ID 1043:1664. On Linux boot, the internal speakers are silent even
> though playback is routed to the codec and the speaker pin is
> configured for output.
> 
> The codec starts with coefficient 0x10 set to 0x1d20. Writing 0x7f20
> to coefficient 0x10 immediately restores internal speaker output.
> 
> This was reproduced on the affected hardware from a fresh boot using
> hda-verb. Reducing a larger initialization sequence showed that this
> coefficient write alone is sufficient; no GPIO, EAPD, pin-control, or
> other coefficient changes are required. After applying the coefficient
> in userspace, speaker output also remains functional across suspend
> and resume.
> 
> Add a machine-specific HDA fixup that writes the required coefficient.
> 
> The fixup has been compile-tested, but could not be boot-tested because
> the affected hardware is no longer available.
> 
> Closes: https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/2162718
> Signed-off-by: Muhtasham Nawr al-Mahmud <muhtaseem2005@gmail.com>

The code change looks OK, so I applied this now.  Thanks.


Takashi
