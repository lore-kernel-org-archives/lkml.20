Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549803D47DA;
	Mon, 31 Aug 2026 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165040; cv=none; b=iRQTe8xQ214rMT4sSFSnGK0Ig74KuNxM/wRV8RjKD5x5J7bp6LLopyqfmb7EwLd7DfPpup8ol+RWbVXeVFg80sIk9Ub3mmxYaHivwb0tENMUR28zhvmhzufUyTNeKRjEFkaKtn1q2GYPGR6cakS6yhBQCB5bX1qA2LJiWjGO6o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165040; c=relaxed/simple;
	bh=ZEohXMso2UnLfOaPwh8fE/Y5u848DkPeMrU9krgJk2g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOiKY30AEqMDBjeeMMthmnaamhux/c5ewlXi2rj4usmiLV6xxb0fyjUm96dBjpDyx+IJQ3ANXGL8HLWMmIBqhW/S7bBUxiel/AxndTs7uw12fne4iAPTFl5IGVffIY8fyrR6jFmOni2JtIkznu1vFgizhfnJbVfi/WWo5pmIhJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GCyrxT4N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eNpniQ51; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TuDv6mXB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YSFmvwaH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GCyrxT4N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eNpniQ51";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TuDv6mXB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YSFmvwaH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D59F822365;
	Mon, 31 Aug 2026 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788165033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5g9HGIsPHpRg7BEmppOVWDI8WBxx2zBXbWq8AiSDDOA=;
	b=GCyrxT4NzEf8rP8qPUAeSNgLXruNmYEdCAjDRBh2aftm7WTfFiHKOBJVgs46Ul/j/AUiGj
	2P3phjd3fhWBuq14fMySuuw/DYTiMlBwzZUJlOV/nAp+U7bjzQrqCqv6Ai9XwSml8F9ZJG
	X50/kLvv5AyybLfDignkdC737ROu0Z0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788165033;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5g9HGIsPHpRg7BEmppOVWDI8WBxx2zBXbWq8AiSDDOA=;
	b=eNpniQ51yUbRWOFLvJHCn1v5dsKqtvP0dJAd0y2xCjretK04iscMe4BEUxuCh0rIxCzuUg
	dhek/qpg82GZZECA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788165028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5g9HGIsPHpRg7BEmppOVWDI8WBxx2zBXbWq8AiSDDOA=;
	b=TuDv6mXBZCSuP8TkuPVOnoSmD+yI+eqP0T2dis/eHGSm5JetW0lqRiYcu+6HVV7bQOQsrf
	o9TRgwlXplyZmGwc/KpGXDb9tmRCevmeQ3nXDpqIqsLb61q2CA6tG4KgweBRNikoqQs4+o
	jAD1NX075mL1CIH+aTZcZ+7uWt5lv44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788165028;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5g9HGIsPHpRg7BEmppOVWDI8WBxx2zBXbWq8AiSDDOA=;
	b=YSFmvwaHDcSh3dQGcturTeemuI26eDgkS5mPSYVX0b6qc00JdW3hwrEYZp+tBp5CB1O/Co
	V17nt+jb8QjvnwBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 597C113515;
	Mon, 31 Aug 2026 08:30:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dDQ/OaM7lWoDFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 31 Aug 2026 08:30:27 +0000
Date: Mon, 31 Aug 2026 10:30:27 +0200
Message-ID: <877bl6sndo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jonathan Seth Mainguy <jon@soh.re>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	niklas@aldervall.se,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ALSA: usb-audio: support Roland Capture sample rates
In-Reply-To: <20260829005001.534571-1-jon@soh.re>
References: <20260829005001.534571-1-jon@soh.re>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Sat, 29 Aug 2026 02:49:57 +0200,
Jonathan Seth Mainguy wrote:
> 
> The fixed quirks for these devices currently describe 44.1 kHz:
> 
>   0582:0120  Roland OCTA-CAPTURE
>   0582:012f  Roland QUAD-CAPTURE
> 
> Add their 48, 96 and 192 kHz alternate settings. The OCTA-CAPTURE's existing
> S32_LE format description causes the white-noise playback reported by Niklas
> Aldervall and other users. Change it to the packed S24_3LE format used by the
> device.
> 
> Expose the OCTA-CAPTURE control MIDI cables and synchronize the hardware clock
> with the selected endpoint rate during stream preparation.
> 
> Tested on physical OCTA-CAPTURE and QUAD-CAPTURE units. Rate changes followed
> by full-duplex streaming succeeded at 44.1, 48, 96 and 192 kHz on both models.
> External digital clocking on the OCTA-CAPTURE was tested at all supported
> rates: 44.1, 48 and 96 kHz. The OCTA-CAPTURE disables its digital input and
> output at 192 kHz, so external clocking is unavailable at that rate.
> 
> Reported-by: Niklas Aldervall <niklas@aldervall.se>
> Closes: https://lore.kernel.org/alsa-devel/6b623cb6-3a9b-4fe4-a57c-9a165d261692@aldervall.se/
> Signed-off-by: Jonathan Seth Mainguy <jon@soh.re>
> 
> Jonathan Seth Mainguy (4):
>   ALSA: usb-audio: add Roland OCTA-CAPTURE multirate support
>   ALSA: usb-audio: expose OCTA-CAPTURE control MIDI cables
>   ALSA: usb-audio: add Roland QUAD-CAPTURE multirate support
>   ALSA: usb-audio: set Roland Capture rate during stream preparation

Applied to for-next branch.  Thanks.


Takashi
