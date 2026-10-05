Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962DC4B2052;
	Mon,  5 Oct 2026 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216397; cv=none; b=t50ikmW98X3n91B7pX5IepNCPc3o1HJQu8eoQ5EPU5jlFrCSElsn6KwWqx/ZJ/FE4b5BsB9awglXKVVwyYLWfC/C90/EmmsgfAwf0wgSRYeMIEEFD0y3LdjHU87fEa7K/QHezB61DWC+1yJ8o4sdfrnqz09mzFg4yPyv2CYZeV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216397; c=relaxed/simple;
	bh=19kZCTEBzPf5UIHcfgZ60pUKKN+nEdJR3xVjyUyBLcc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BfCes62EAWlemzfT3N1vSnKAJ7kz6sPRulx/uNuUOliGz8yGkHQUAI5AIUnBi0JCmraQxtzdMIK1uAVvQVz8w+YRwbzN0aGjD/pUQyzXYVZLNwLm9eSVZ16aEkmwc57ZQ0Qzi+IFjSgGR6mb3Uy4Se6MQ3g8qP4viJeeXwqIrvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k+o8wDPP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z1wK9nq7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uJcxVk+F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OErcpv1Y; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k+o8wDPP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z1wK9nq7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uJcxVk+F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OErcpv1Y"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 545E11F7DD;
	Mon,  5 Oct 2026 16:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791216389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hmOY7tDUSOM6jH5F4aPhs13xU1NYdceP7sQiIsxcaNs=;
	b=k+o8wDPPpKSCFVe7v872E6N2i0JKdEj8azV41HbOweZaB3WpaPwLKJsJdBuEz8PgCLwJj+
	eGEa6I7NxR3k7ddkNnyZYvbMLRKL+Pp486mar/JiwiSMyghzT8JRFl5VE1N/NXaMdowyF7
	rpMti5TxhkQGDJH+TP3CcJDiqt7DwoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791216389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hmOY7tDUSOM6jH5F4aPhs13xU1NYdceP7sQiIsxcaNs=;
	b=z1wK9nq7oURzzhy513Hse6Y75FanhAO3OtHV9af6VDO5zhFCfnUq2cegSGoDW7gvR9RE7A
	Zo9cLylEt4jWglCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791216385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hmOY7tDUSOM6jH5F4aPhs13xU1NYdceP7sQiIsxcaNs=;
	b=uJcxVk+F9pWgtSVAJSbowd+htSHgAr6sgLfm1BGTjEmAXDsyMkAor/+nLJPd3T7UOuMw6x
	97Ndv4ydJ8Ks6k5YPqRJsqO1/KLxE2W47E8k4Hih4IlKPj4fr5Qf20yVKKcw9b52Ch5HIi
	2z4YcP2gwS/TXEL0j3UfD4SHTFiNJLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791216385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hmOY7tDUSOM6jH5F4aPhs13xU1NYdceP7sQiIsxcaNs=;
	b=OErcpv1YxCWeiTipQHuq1Bx1XHOVlWHsGG4gdm89IQWnC13q4Ls5S4FC6aCBkUwOQbj4Ja
	854bfIr2rSB3TKAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2088B132D3;
	Mon,  5 Oct 2026 16:06:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e36lOgDLw2pqHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 05 Oct 2026 16:06:25 +0000
Date: Mon, 05 Oct 2026 18:06:24 +0200
Message-ID: <87y0ccqghr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Scott Gauche <scott-dev@scottgauche.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Fix audio after Windows reboot on ASUS Q423SA
In-Reply-To: <20261005154017.1164657-1-scott-dev@scottgauche.com>
References: <87se2ksaqb.wl-tiwai@suse.de>
	<20261005154017.1164657-1-scott-dev@scottgauche.com>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 05 Oct 2026 17:40:17 +0200,
Scott Gauche wrote:
> 
> The ASUS Vivobook S 14 Q423SA-U5512 (DMI family S5406SA) with the
> ALC294 codec has working analog audio when booted directly after a full
> shutdown. After a warm reboot from Windows 11, audio works briefly during
> Linux startup, then both the internal speakers and headphones become
> silent. PCM playback continues without errors.
> 
> Coefficient 0x1b is 0x4e4b on a direct cold boot, but 0x4a4b after the
> Windows warm reboot. Restoring bit 10 changes it back to 0x4e4b and
> immediately enables both analog outputs. Speaker playback, headphone
> playback, jack switching, cold boot, and suspend/resume were tested
> successfully. The same 0x4a4b state and immediate recovery with 0x4e4b
> were independently confirmed on another S5406SA with subsystem 1043:10c4.
> 
> The same coefficient write is already used by
> ALC294_FIXUP_ASUS_COEF_1B for the ASUS UX431DA. That fixup cannot be
> reused here because it chains to ALC289_FIXUP_ASUS_GA401 and applies
> unrelated DAC routing and microphone pin configuration.
> 
> Add a model-specific fixup for subsystem 1043:10c4 and chain it to the
> existing ALC2XX_FIXUP_HEADSET_MIC fixup instead.
> 
> Link: https://github.com/thesofproject/sof/issues/11051
> Fixes: f2d08f3651fb ("ALSA: hda/realtek: Fix headset mic on ASUS Vivobook S14 S5406SA")
> Signed-off-by: Scott Gauche <scott-dev@scottgauche.com>

Applied to for-next branch.  Thanks.


Takashi
