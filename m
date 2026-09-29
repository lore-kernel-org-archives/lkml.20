Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EDC4E80CD;
	Tue, 29 Sep 2026 09:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675596; cv=none; b=XzQci4j/cl6HpZXAKrX3gz3tgEv8Ab2GBvY9Pq8ZlZQxGrG7MBVQFqkfL5ODjM9mIbW4l4yVGo5WuIBlwyINbEsZhlrol0OTm8YiK1z9v3P94qFPojx6ffY12L1aCBGYj6eHZB3EZbmvr3LpFyLt7eUaljGSrp6F+d2xgYbw5R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675596; c=relaxed/simple;
	bh=PAjiuSr7PL6hMz7MSL0vi4gKrIrqTOCgAAdXyGLcVOA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ajyc8XYCLqm+bDOt3do4I7QhU8en3+HzxB5Y7a9cpx4vEIqWTexPKb/cUzNtGUDGAtcxcJv/XRWl3SpBaAEnVmUJdcXr6u6olctU9tU3lkUnB+NrFapDNoXjNYEqem1rNAWGftUAgu9h7juhKfB/ifnifxF8LuKtb9uwejWWDes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IR6OyRhy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RI2iC9Uy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ef8ORTcE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jy6iYy8+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IR6OyRhy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RI2iC9Uy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ef8ORTcE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jy6iYy8+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 820551F444;
	Tue, 29 Sep 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790675588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QndERAeyHrOlKw2dyPW8c3xDWXtZf30X6T2Mz/d8oU=;
	b=IR6OyRhy9njtgSWGu5dmBV5fq2a2iSY7zSpuCnAC4r1LDvrMzaF7HrsGWBC9yc7030Cmey
	YXmlWgv3VqyPwuNf6kxvymlGhY+o3GG7NYNBT62HDXFxRifA5OUEMpQOyaq/Fld9DIfyDk
	mCEsKPFAsFoM4TFKDJjgzKC0O/tdx+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790675588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QndERAeyHrOlKw2dyPW8c3xDWXtZf30X6T2Mz/d8oU=;
	b=RI2iC9Uyd+Kid4F1uCZuCevrwCYLsVo5HsM3K2NX+dg/JmeWGYDnMpfctjG7FyGif9graT
	+6ofcNl6xgt105CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ef8ORTcE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Jy6iYy8+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790675584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QndERAeyHrOlKw2dyPW8c3xDWXtZf30X6T2Mz/d8oU=;
	b=ef8ORTcEBdUmzDfukXYj0Ra0pCYyGNwZY3AeOcAIG9jdfWU/pD8IBdQxlADdWGHW2yjS6A
	USif8lF+XS4DV8rGdUqE4YbVrGT9WjOalCZ06HO8AR4WHsw6bsgl4+Gl/jJMvmgwsZ/1Tx
	MYw0bRj5uKlZTEEFtZz8mpZtlsATiUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790675584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QndERAeyHrOlKw2dyPW8c3xDWXtZf30X6T2Mz/d8oU=;
	b=Jy6iYy8+AVNnk0GnA+0G2zcraJ5WdNWWhd1npGOvbUlB+jAegV9NL2JeFC1K2wDFiPXusW
	ht7mubNR55etGoCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03EE2136E4;
	Tue, 29 Sep 2026 09:53:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P+SYMn+Ku2pSLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 09:53:04 +0000
Date: Tue, 29 Sep 2026 11:52:59 +0200
Message-ID: <878q4k2xl0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?ISO-8859-2?Q?Povi=B9er?= <povik+lin@cutebit.org>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Rob Herring
 <robh@kernel.org>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Conor Dooley
 <conor+dt@kernel.org>,	Sven Peter <sven@kernel.org>,	Janne Grunau
 <j@jannau.net>,	Neal Gompa <neal@gompa.dev>,	David Rhodes
 <david.rhodes@cirrus.com>,	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Ulf
 Hansson <ulfh@kernel.org>,	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,	Lars-Peter Clausen
 <lars@metafoo.de>,	Vinod Koul <vkoul@kernel.org>,	Matthias Brugger
 <matthias.bgg@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Kevin Lu <kevin-lu@ti.com>,	Baojun Xu
 <baojun.xu@ti.com>,	Sen Wang <sen@ti.com>,	James Schulman
 <james.schulman@cirrus.com>,	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,	Takashi Iwai <tiwai@suse.de>,
	linux-mediatek@lists.infradead.org,	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for lock/unlock
In-Reply-To: <20260920-macaudio-v1-8-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
	<20260920-macaudio-v1-8-741cc20a74e5@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 820551F444
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,marcan.st:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[cutebit.org,gmail.com,kernel.org,jannau.net,gompa.dev,cirrus.com,opensource.cirrus.com,perex.cz,suse.com,linaro.org,intel.com,metafoo.de,collabora.com,ti.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,suse.de,marcan.st];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[lin,dt];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLs9qncch5cpanyka9neihc978)];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Flag: NO
X-Spam-Score: -1.01
X-Spam-Level: 

On Sun, 20 Sep 2026 06:53:47 +0200,
James Calligeros wrote:
> 
> From: Hector Martin <marcan@marcan.st>
> 
> This allows drivers to implement policy around locking/unlocking
> controls, such as enforcing that a group of controls may only be locked
> by the same process/file, and taking actions when the controls
> lock/unlock (such as granting special access on lock and resetting
> values on unlock).
> 
> This is, in particular, useful to implement volume safety controls, such
> that only a particular process (that locks controls and completes a
> handshake) may increase volumes above a given safe limit. It also allows
> the volume to be automatically lowered if that process dies (which will
> trigger an implicit unlock).
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>

This doesn't sound like a good approach to me, and this looks rather
irrelevant with the purpose of the series.


thanks,

Takashi
