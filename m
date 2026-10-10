Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1705F446BF8;
	Sat, 10 Oct 2026 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791626189; cv=none; b=iD1zGfvxuFl9C6FpmSWMg/P0cgcK+PRym/3bpj+6pR1WT0njR8d0pIv7ooPkqyVIAB43ix50ksC1hvfRL9XKXOEsIpI5TmA+brvXpdDPU10tf7bMQ2croPcHprmq+7ssIw6gmN6cLjKWjDOoidP70zash8ilVA0mDWXwMtF0OGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791626189; c=relaxed/simple;
	bh=CvujF6Rhbny92yo0tD4Tz0HZfJwHu+cFhQ3cxEOt8U8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CAbrNC6S6/KravVFEEeMZCzKMExVgpk1zyyCeAqL9RAkRT9t5ff3zWLr8vasVu/sW1zyZ5afcA5vM2tS5s7B3XDv2S3lm83eQgTZxZDVkMw3t4FitStYHgy5MK7e71iza8IWZ3cZve5avDYaB2vR4YWrVLnSngPMZgLFrprt86o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gvUJufHp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c67FgjOh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YMgHQFB2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s1nlBLht; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gvUJufHp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c67FgjOh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YMgHQFB2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s1nlBLht"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E65EA1F388;
	Sat, 10 Oct 2026 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791626184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g94z204rIZJmTZLw27FHJRpoDmbidWy3zAcSVs5TUDA=;
	b=gvUJufHpTvqM6AHxG3jSCe8u9AdQO3LgReQxkITtE0EyqcJW5cbm0OVDvnTSovAw2cn4Xj
	fSWgoZorP5IsT4dboAvDZtiw+txL++3sYgLxzwqCj0edQfr6fYd2VbW05jtNqwfSbp+CFt
	9UOx273/v1fiYgc1WazrClHV1ftp9e4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791626184;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g94z204rIZJmTZLw27FHJRpoDmbidWy3zAcSVs5TUDA=;
	b=c67FgjOh4wQzRv3X9fwC5DaZFHXY5sD+qtFuEBlm8+JfGd6K8IxgMqFQoV/MqIFyq75SDS
	Reg/FbVuchOzCoBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YMgHQFB2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=s1nlBLht
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791626183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g94z204rIZJmTZLw27FHJRpoDmbidWy3zAcSVs5TUDA=;
	b=YMgHQFB2OalGuSzCvqSKW0GvmC/jEleNiAAtyilgB29kOTb8aI+80BG4+jjtMhXJr/ij/1
	R5CLO3Oqturn/fieBmfUvxhSBfKCgdV45ZBRl9rDlDQ3B8qyVM8IG7NK5hbp6Iy9cLTVq4
	ZP02SP4RfpB0F7NyT1ePfgyRpJFahh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791626183;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g94z204rIZJmTZLw27FHJRpoDmbidWy3zAcSVs5TUDA=;
	b=s1nlBLhtG6voNqwQnN5tbhkH4hP+K/mwv2UOEE0aHMoEqpffn/6vjwV1ED9Dg2OcY4A7BV
	r5olQW9xiRvKMEBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D5E5133F6;
	Sat, 10 Oct 2026 09:56:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WQc0HccLymr4PwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 10 Oct 2026 09:56:23 +0000
Date: Sat, 10 Oct 2026 11:56:23 +0200
Message-ID: <877bjpkhfc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yi Tao <taoyi.sh.cn@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: Enable native DSD for MOONDROP DAWN PRO2
In-Reply-To: <20261010094055.49308-1-taoyi.sh.cn@gmail.com>
References: <20261009215322.8223-1-taoyi.sh.cn@gmail.com>
	<20261010094055.49308-1-taoyi.sh.cn@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E65EA1F388
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Sat, 10 Oct 2026 11:40:55 +0200,
Yi Tao wrote:
> 
> The MOONDROP DAWN PRO2 (USB ID 35d8:011d) exposes a UAC2 RAW_DATA
> playback altsetting, but ALSA reports it as SPECIAL without the
> DSD_RAW quirk, preventing native DSD playback.
> 
> Add the device to the raw DSD quirk table. With the quirk enabled,
> ALSA exposes DSD_U32_BE and MPD 0.24.4 outputs stereo DSD256 through
> USB altsetting 4 at 352800 frames/s, instead of converting to PCM.
> 
> Tested using snd-usb-audio quirk_flags=35d8:011d:DSD_RAW on
> Linux 7.2.6+deb13-amd64 (Debian 13).
> 
> Assisted-by: LLM
> Signed-off-by: Yi Tao <taoyi.sh.cn@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
