Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B362A48165D;
	Sun,  4 Oct 2026 18:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139169; cv=none; b=kcsmRVYEN0b6dSLjuRmieh+yrUpqNClBZ7IqvxB3SbFLyoY6UsnHGLCcJEQcQH0t+8bcPKtJw+g/9gMmAMbytQOE6dPoWwpD+1bGzw67yZNq/Hpj868jpKt9XdY1KwivW+tcBHUaAoJF5eoD42XNhUKvNPM3IVlnRL1iBMla/g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139169; c=relaxed/simple;
	bh=twifk62AKiRcIDN5SBBJy9wGLXSvHeM8Zd4qXPEvlmc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eLK6SaUQBedBK5DA7WUOVY88EfdL6E+XGzI+NqQNTi+NfF63oYy245h8a8V8xegMhHQ8YGA/9xTQNKJTC7Tbi0GyuvWqUZnguhn1xV5F2mFJULZsdQ1heNCEKGXn4/KtUXcZReh9Nk2/e4apG1dhETRDOKwIx8ntNorrFzVqRAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=opYHqjey; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XZMoQLQf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yGsb7mCE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I2G/YTgG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="opYHqjey";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XZMoQLQf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yGsb7mCE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I2G/YTgG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9365821D45;
	Sun,  4 Oct 2026 18:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791139161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QpKr0jpUXxdiPwnneTMP6xzMhthlKHBHL8PdoYfvQI=;
	b=opYHqjeyPkSFOoatHx0D42w0aGZBAzj2F8iK1OSDybLDCVp6QdAiWzoU3n/JtMMtc/vXLC
	ZMa/42AwcUcsYpU37mlZSrTaufRBFeAKOshqEBvdRTrQH4s5r4tw+0aUy+25nwDtkPXn8s
	rw8/l2tolsx2VOdyn0UF2zmjLMZW0WI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791139161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QpKr0jpUXxdiPwnneTMP6xzMhthlKHBHL8PdoYfvQI=;
	b=XZMoQLQfPKTqKpQpRayuH1tYaYGktJ0020QjI3j73FVC4ZNtgEOviNzJp/rdMCmTUqwaq3
	DbR1RCyUT9vxIZCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791139157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QpKr0jpUXxdiPwnneTMP6xzMhthlKHBHL8PdoYfvQI=;
	b=yGsb7mCERCM/rX/8u2Uhk4rPl73fBgWAnASAXkADOcFsrW8ii5//4sXG3FH47dQ02vmA6e
	XQ6bJJ6WFeOd7XZt0vyN5AogL3l7yT7mzIPTwqEJFxsl6dA/tIjYtRXtS2cH8PFUBp0ruN
	Q7vnzvVZ5WbuGsnCPOP1Cl5n/YR5Qz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791139157;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QpKr0jpUXxdiPwnneTMP6xzMhthlKHBHL8PdoYfvQI=;
	b=I2G/YTgGcK6awSxNUY9+IgWEgkTWM1g2jyRw8PH3g5FTyA4KcFblnMNywCWWiwCrBJlRZ2
	kw7CJjRSITM3LzAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62BCE133CF;
	Sun,  4 Oct 2026 18:39:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mdqcD1WdwmomXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 04 Oct 2026 18:39:17 +0000
Date: Sun, 04 Oct 2026 20:39:02 +0200
Message-ID: <8733ulia49.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Georg Wenzel <g.wenzel@gmail.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Enable bass speakers support
In-Reply-To: <20261004071202.89116-1-g.wenzel@gmail.com>
References: <87cxtw2y8b.wl-tiwai@suse.de>
	<20261004071202.89116-1-g.wenzel@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, 04 Oct 2026 09:12:00 +0200,
Georg Wenzel wrote:
> 
> Configure the driver to correctly initialize and enable the bass speakers
> on devices utilizing the TAS2781 amplifier. Without this change, only the
> tweeters or main speakers are active, leading to thin audio output.
> 
> Set up the required register sequences and routing to ensure the bass
> channels are properly powered and mixed into the audio stream.
> 
> Signed-off-by: Georg Wenzel <g.wenzel@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
