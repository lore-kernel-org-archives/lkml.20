Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48C649BD74;
	Mon, 28 Sep 2026 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593023; cv=none; b=uYWF5P5wRRyMEVnNwHSvtb7TSBU2Ao/48YaGPY++bRio3KU5LWSvkatnPjBdHOCTm00oTIWuGoPVU76dgK7OCxWSEudITtAG+RtjbGMACq7BTSQqQBy4czi69N2OV6O1p2TPqVFY4eJuj+DZygDlsJK4QYX24BiM2RNvd/S2aEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593023; c=relaxed/simple;
	bh=bd8p/491vFmlajvOsk2UJuDML3h7+RO3eM2ulEW6EUo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iNpBIJ3c0SHnlNG2ohD7iz34NvbYXt6/aioWuF8k1PIayueRkY51jnz2SXCeCEe87RPS1fblHYxGh2gBH1hp6tctNorQk/p1hUxsPIqqseUCHjVt7pJPDk1Y2iiMstQ5LV5ZHOdSHoRnEIfIuMjbWDqvBSM3gbYC9/CkmMI+Ycw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bP8qfWpR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CQ98+XkG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uIh+78s+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Opj5TOSy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bP8qfWpR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CQ98+XkG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uIh+78s+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Opj5TOSy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E75121F44F;
	Mon, 28 Sep 2026 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRsrIg2LiUhWUzr9EJ4I5VlfUqhYqi1vLrxe73V2d6g=;
	b=bP8qfWpRYM+Oy9F6sLQpYK602yBqDQkjfqD6YGjgtI/+OE44ulQbJ5GBJvJR8w8gwKmolD
	8hHCaqipPJIWwnw0iOrQidgrgQ5R90pfm6aW4xeS2a/HK0jCmJnMZH2+Xz0R5ZnqCDi18d
	SgUIRfbMgI6CwPGxcSNerRiIy+CWte0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593008;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRsrIg2LiUhWUzr9EJ4I5VlfUqhYqi1vLrxe73V2d6g=;
	b=CQ98+XkGs8k6OA6hKbDoEQn7tTqgtgenwdqAuNuLK92IufcjZhDaBe7y4z/CMLA4YB+YMT
	gHnUi8hfzQn8mUBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uIh+78s+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Opj5TOSy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRsrIg2LiUhWUzr9EJ4I5VlfUqhYqi1vLrxe73V2d6g=;
	b=uIh+78s+6MD4AjCJWSU0HrDcKktClUwDc02aQK1GxIY4UurK+wg7X6VCRsuaLOlF4Yiyw9
	eVcLR/ldoa2vx6RFNSu1Uf0kNGe0/oLwoPcV9yL7BENZHd8uu7DhPWON16AsHO/2i4FTv8
	yrPxXAkmftdzvpe/rYTZw2AlFUR0Lm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRsrIg2LiUhWUzr9EJ4I5VlfUqhYqi1vLrxe73V2d6g=;
	b=Opj5TOSyVeC3E5ZUoU8F94CKwAKmaV69v8yHMNVoYju2W/JKIWbFTpAzm1o1Xd9jJaZIbK
	GokJw02tDIqEX3AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8DB14133F1;
	Mon, 28 Sep 2026 10:56:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5YR6GOtHumpKHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 10:56:43 +0000
Date: Mon, 28 Sep 2026 12:56:43 +0200
Message-ID: <87jyo57ifo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Navon John Lukose <navonjohnlukose@gmail.com>
Cc: rf@opensource.cirrus.com,
	david.rhodes@cirrus.com,
	broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: ALSA: hda/cs35l56: same calibration condition logged at dev_info() and dev_err()
In-Reply-To: <20260914000308.108995-1-navonjohnlukose@gmail.com>
References: <20260914000308.108995-1-navonjohnlukose@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E75121F44F
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 14 Sep 2026 02:03:08 +0200,
Navon John Lukose wrote:
> 
> Documentation/sound/codecs/cs35l56.rst says "Failed to write calibration"
> has the "same meaning and cause as 'Calibration disabled due to missing
> firmware controls'". The latter is a dev_info(). The former is a dev_warn()
> with a dev_err() from cs_amp_write_cal_coeff() ahead of it.
> 
> Rebinding the HDA components without re-probing the i2c driver takes the
> loud path, 4 of 4 attempts here:
> 
>     cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: Failed to write to 'CAL_R': -1
>     cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: Failed to write calibration: -1
> 
> list_empty() is false because the controls cs_dsp_power_down() disabled at
> unbind are still on ctl_list, so the dev_info() branch is skipped.
> 
> The calibration is intact. CAL_CHECKSUM, CAL_STATUS, CAL_R and CAL_AMBIENT
> in DSP YM are unchanged across a failing rebind on both amps. On a speaker
> amplifier "Failed to write calibration" reads as a protection failure.
> 
> I lost around 5 hours chasing this down, believing this to be an actual
> bug.
> 
> Lenovo Yoga Pro 7 14IAH10 (83KF), kernel 7.2.4, two CS35L56 B0 on I2C
> behind CSC3556:00 over the HDA link.
> 
> Assisted-by: LLM

The actual patch is missing?


thanks,

Takashi
