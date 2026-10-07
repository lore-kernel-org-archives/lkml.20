Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515BB37204C;
	Wed,  7 Oct 2026 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394056; cv=none; b=bW2sdJVaCJvEq3idzujdE/c3e8y/e4fqX32PYteKo97Pr/+qAoewaR9LaIEeaOhvoI01eyQd0DAJKqIAnySA75f11bDul/HJPG1Fe5pYVUX8Gb/+qfY7xmPNVO2CkKMuFeM1IV6647LF2Wlb3mc957Aj0aZ5A6igpHrVkhhqNy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394056; c=relaxed/simple;
	bh=hXqSgFKDPIcS+L/fbJ2NBvaZ9EyEjspTbq6kaJOERGg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JNAubou6hwsgdHUkUaVNsIodqW5pUEqXEak9nu4UDl+iHSE3HBupJyhzGXzcZsZxOUTK+QLhYdVVwX+VndmWCTCHyQok3lMwHPvwNnIL3QLYOlPXnTPK09mAF8UnYdxBBTJJ36uyfAYQZw9k2/K5j/6OslAthkgLkuJXw9Erj+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qTDOgatK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YMxPQhCE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qTDOgatK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YMxPQhCE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qTDOgatK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YMxPQhCE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qTDOgatK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YMxPQhCE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4AB2821BA8;
	Wed,  7 Oct 2026 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791394053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4qvTJqYu40uS+axdODPIBD9MW1AJRPDCwhsFzGRu5Ns=;
	b=qTDOgatKqKAuI8fj3lzNt3y3AwS1WqQaJSTcqSJBVBexC5CpJOHw5Fuo46iJ147hCZfAyR
	tVzhyhCYifgsV2DLoXeqn9x9Ee0KfSWr7AFD01Wytu+qwbGUZMGvidaUOPdK9FRBiUFJ2x
	WJ5Wy1Aw2fWZvXa1pVKCz5hU3/88KtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791394053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4qvTJqYu40uS+axdODPIBD9MW1AJRPDCwhsFzGRu5Ns=;
	b=YMxPQhCELhG1mAiC8+I1FLUmjPOvHOc1kU8QxXougslexlSX64wTQJElieacOXWNPa227Z
	aKv/3Fp4HWeRSaBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791394053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4qvTJqYu40uS+axdODPIBD9MW1AJRPDCwhsFzGRu5Ns=;
	b=qTDOgatKqKAuI8fj3lzNt3y3AwS1WqQaJSTcqSJBVBexC5CpJOHw5Fuo46iJ147hCZfAyR
	tVzhyhCYifgsV2DLoXeqn9x9Ee0KfSWr7AFD01Wytu+qwbGUZMGvidaUOPdK9FRBiUFJ2x
	WJ5Wy1Aw2fWZvXa1pVKCz5hU3/88KtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791394053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4qvTJqYu40uS+axdODPIBD9MW1AJRPDCwhsFzGRu5Ns=;
	b=YMxPQhCELhG1mAiC8+I1FLUmjPOvHOc1kU8QxXougslexlSX64wTQJElieacOXWNPa227Z
	aKv/3Fp4HWeRSaBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C11913354;
	Wed,  7 Oct 2026 17:27:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J5a1OQSBxmrUEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:27:33 +0000
Date: Wed, 07 Oct 2026 19:27:24 +0200
Message-ID: <87ece1775v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Devin Christensen <dchristensen8@proton.me>
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] ALSA: hda/ca0132: Add Sound BlasterX AE-5 external RGB LED strip support
In-Reply-To: <20261007163207.2621040-1-dchristensen8@proton.me>
References: <20261005141244.2130023-1-dchristensen8@proton.me>
	<87mrsrorxc.wl-tiwai@suse.de>
	<20261006152520.1409881-1-dchristensen8@proton.me>
	<20261007163207.2621040-1-dchristensen8@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Wed, 07 Oct 2026 18:32:14 +0200,
Devin Christensen wrote:
> 
> The Sound BlasterX AE-5 and AE-5 Plus expose a 3-pin 5V addressable RGB
> header driven directly by the CA0113 PCIe-to-HD-Audio bridge. Rather
> than using the CA0132 DSP or MMIO GPIO, the CA0113 contains an
> autonomous HDA link sniffer that snoops a designated HDA DMA playback
> stream, extracts the 24-bit GRB color payload, and serializes it as
> 800 kHz single-wire NRZ pulses to the strip (WS2812B protocol).
> 
> Expose the strip through volatile card control elements:
> 
>   "AE-5 LED Strip"        (RW, BYTES): 300-byte RGB payload representing
>                           up to 100 addressable LEDs (3 bytes per LED).
>   "AE-5 LED Strip Count"  (RW, INTEGER): Active LED count (1..100).
> 
> The controls are marked with IFACE_CARD and SNDRV_CTL_ELEM_ACCESS_VOLATILE
> so changes do not trigger unnecessary audio daemon wakeups or state
> restoration by alsactl.
> 
> Writes allocate an idle HDA playback stream, format a 32 KB DMA buffer
> populated with repeating WS2812 frames (preamble, audio words per LED,
> and reset gap), configure the CA0113 BAR2 serializers and stream-tag
> pin mux, and pulse the stream long enough for the reset latch to fire.
> Access is serialized with a per-spec mutex, and the controls are only
> registered on QUIRK_AE5 devices.
> 
> The strip transport uses snd_hdac_dsp_prepare() / snd_hdac_dsp_cleanup(),
> which require CONFIG_SND_HDA_DSP_LOADER. All strip-related code and struct
> fields are conditionally compiled under
> IS_ENABLED(CONFIG_SND_HDA_DSP_LOADER), with a no-op stub for
> ae5_add_strip_controls() when disabled.
> 
> Signed-off-by: Devin Christensen <dchristensen8@proton.me>

Applied now to for-next branch.  Thanks.


Takashi
