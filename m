Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F504AB3DA;
	Mon, 28 Sep 2026 11:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595519; cv=none; b=t27aPY//r1rQ1yyWxmEz0Mp/fgf2rTC/+QdQbhLrX0tVh5IRe64JmCP+3iCb4yIPq3FkQr0rXUudGAtI+5cwcI+tOB1HHoS4KESZvDDA15UrOz2VQboAb0/1ps3+/YxYkRlQij90S4uL2QTVfieV0LWIEpD/vf4zfmbffeepaPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595519; c=relaxed/simple;
	bh=yf9UIlLYtTceO9Y1otoXjbEU7kQj7ScvGZgQiNr4Kx8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iQeNmY2N0G9xaxUAZd8pJmb88eUQBppQRhuV3tZzroDZpEECqrGOdxSvvLAIr9XPSs1E5QXwW6Os48cjv4gKC6i1uWGB6/Z3QTWWfqbdbqPFfOuAsEfZATima8YuXdn8f1ucwqhPQq2SD9eFI5CypWcYyJ0CxNbA6IdkZnI6XyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U896xCnw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S/9YJrm1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UJ89Kl2K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Et5hjFCD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U896xCnw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S/9YJrm1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UJ89Kl2K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Et5hjFCD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4BB591F8B4;
	Mon, 28 Sep 2026 11:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=44N7pGkVlu4l54RqRvTGiKqco22MHMaRC5jexhMQnJU=;
	b=U896xCnw6CJvYz5OuOShtMYZFdkMoZAIHuDMVCtUflisC5FRKTS4KCJNfyx9m48OaoK/e9
	2w4Y0nYhpXEpuEZQdI8upuIad7aY6PNtnMrapcdVRgIoO3K+Ue6TM8lF1oIjkombgMBaxr
	NYq/Sl9EGaM63/eiZVw2sp2n9I5ILLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=44N7pGkVlu4l54RqRvTGiKqco22MHMaRC5jexhMQnJU=;
	b=S/9YJrm1kIHMsnbbI/B9XYFCjVeBKAttE6ZISE3B0wFYP4DGQW05RM/sJ+jP9A63USMbMX
	6GOcbeNiAQcL+QCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UJ89Kl2K;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Et5hjFCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=44N7pGkVlu4l54RqRvTGiKqco22MHMaRC5jexhMQnJU=;
	b=UJ89Kl2KVXVGPns2OnZUsArerVrLBkb04zXPfhgeJ7paVXfEfvvwI+dRttT5lFbXh82MMF
	tgPMoO+5L0gjiWnzdf1amtYooE33GTijkrcAdDGjfA6vP9Kv78SljLyfQ0RupzGQ+1l46T
	Msr7UpSzWsUNgmg7W3lMKHu6FCB66lU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=44N7pGkVlu4l54RqRvTGiKqco22MHMaRC5jexhMQnJU=;
	b=Et5hjFCDBZPXeZY92w5Nt4s4LcUWQx1tydoZzNRMbn1EI6xQKuerhamAYoVeAvUPRZjCQ3
	IzO27jrl3ItqObBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0289B133F3;
	Mon, 28 Sep 2026 11:38:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V0kDM7JRumoZRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:38:26 +0000
Date: Mon, 28 Sep 2026 13:38:26 +0200
Message-ID: <87qzid61xp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add mixer mapping for MSI MAG B850M MORTAR WIFI
In-Reply-To: <20260923184957.6687-1-tomasz@bojanowski.me>
References: <20260923184957.6687-1-tomasz@bojanowski.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 4BB591F8B4
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Wed, 23 Sep 2026 20:49:57 +0200,
Tomasz Bojanowski wrote:
> 
> The USB audio device 0db0:cc78 (Realtek ALC4080) on the MSI MAG B850M
> MORTAR WIFI motherboard exposes all playback controls as "PCM", which
> makes it hard to tell the outputs apart.
> 
> Its mixer layout matches the one of the MSI MPG X570S Carbon Max Wifi
> (units 29, 30 and 32), so reuse msi_mpg_x570s_carbon_max_wifi_alc4080_map
> for this device too. With the mapping applied, the controls show up as
> "Speaker", "Front Headphone" and "IEC958".
> 
> Tested with a patched snd-usb-audio module on a 7.2.7 kernel.
> 
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Applied now.  Thanks.


Takashi
