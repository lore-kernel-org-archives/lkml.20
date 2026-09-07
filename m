Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4C7417BC3;
	Mon,  7 Sep 2026 07:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766696; cv=none; b=hE5kyQLIptjbPELK9K507wJTdZRZiORN8NJ0rbO+M2C0g3+LoR7Y/5mAdwUEknWsBuJfjdbVeIUVjHFrtzeUCCS7lFiWN+XCTc3CDtFXCDaJMnVmKD5oPJxf80b8AvTx6nBZU7uE9XgSor5YVrhNkBRcGbeVYDXUOGMzwD4ScCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766696; c=relaxed/simple;
	bh=HbggCpTLeICW/rfXI9uNb8ylg5Kxh8ntvDRsI46BbhQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OHBb3meSaG9fpJkH0Bw+HP7sGXDHAe8uUkFNR5ewakzh3H0hXiroCr1VCvIl4stA23zvI4D6WaG07gRSAaf7AEI/681tOEaFbINw+K7ykSX8+14LPX7NxGA02BAO7dAVB2fmshPkDehucHraYqoBHuevGITXB1hEWMMi7YzhqqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hfbQqvfm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d50/kq2B; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V1bFFDv1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ww1J41dF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hfbQqvfm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d50/kq2B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V1bFFDv1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ww1J41dF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D26B71F38E;
	Mon,  7 Sep 2026 07:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788766688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eo/XSVrwD12YlVYQe44ll1W/mOE8cLT71YjDzghyFyE=;
	b=hfbQqvfmtljWMfsB8zoFqSTZViKyV2EesbnP9cTRUlc1hg2JxifO65oad2SCh9AiBAsERR
	89HGxLvGRTYkKwOUnacVhJ/3cujDw2d++mIDVb9yJqCnp99PuFb5neqYX4JZ/GebMpxdlO
	IB7ZKFOAK/D+dZdID+vSVP4reg5d4fg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788766688;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eo/XSVrwD12YlVYQe44ll1W/mOE8cLT71YjDzghyFyE=;
	b=d50/kq2BoCkbihqD4y+p1YMaex2v5maX5H9d04XzaSZSW7I5J3um6OMbz6W3NemUF99Srh
	tE5xozozQoyG1NBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788766684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eo/XSVrwD12YlVYQe44ll1W/mOE8cLT71YjDzghyFyE=;
	b=V1bFFDv1YarAi1+MvhnqVMs2w9n/WuPllTeSEG56oKht0KMtkzhQqXsXbgwXkTdf5SoDjK
	kP/lWZijLsH+cXiNM3UiGBaceCif+FZ95Ax6+OZ9J0+D0iCRmRXhjiDJVM6w8mpRnDhyAX
	D2CY0U0VWtsCW1yPXwzE81UJaDuhQz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788766684;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eo/XSVrwD12YlVYQe44ll1W/mOE8cLT71YjDzghyFyE=;
	b=ww1J41dFxKpy1qWrLx/Whpjh0kEL2//oqgG6sz/v4lM9ED2qmszXIM8ARV+rx8g61mbBYQ
	EcEvmKYuuOQOqABw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67B001368D;
	Mon,  7 Sep 2026 07:38:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kaefF9xpnmqGDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 07 Sep 2026 07:38:04 +0000
Date: Mon, 07 Sep 2026 09:38:03 +0200
Message-ID: <87qzj53410.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nick Pegg <nick@nickpegg.com>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH v2] ALSA: usb-audio: Add quirk flags for Behringer UV1
In-Reply-To: <20260906155616.1625465-1-nick@nickpegg.com>
References: <87jyoy4xdf.wl-tiwai@suse.de>
	<20260906155616.1625465-1-nick@nickpegg.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,nickpegg.com:email]
X-Spam-Flag: NO

On Sun, 06 Sep 2026 17:55:37 +0200,
Nick Pegg wrote:
> 
> The Behringer UV1 is a microphone audio processor with a USB audio
> interface, which experiences periodic stutters unless implicit_fb is used.
> 
> This seems to be a similar device to the Behringer UMC series, so I
> copied the quirks from those. I've confirmed that my own UV1 works great
> with these flags set.
> 
> Signed-off-by: Nick Pegg <nick@nickpegg.com>

Applied now.  Thanks.


Takashi
