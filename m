Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792649593;
	b=sZvPjRHs/qBR5Q5h4fcrNrQx16LntUZ+Vr92hxG+RgYZBmX+AQEjTcnMZlbxVYelJKNz
	 2eSvdWCgNz+hWKLAKW/FDbR/t2iQ/zfXhp04GymM7JJpCumfeU+VHiqZsQSaHbFlI9797
	 xoTUVFqoTRy0WuZSnyB/EfYfactoN7VCwWBcCqQOvXymY6xottodAeDP1DGVELaTfRQDS
	 pDyHSHbncfku/DBZ7K13N6CEQpu6rqQM38JIVTNHAZSgcGVImkpB8sBRdKNtT3ow2Xh7W
	 tEFzkN69KDXX1hVOeZMaSK1N7vcpbYws5yvTcUA8QrMQCakCqmqfgV9QEGMsWn9SoEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649593;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=gzYjuKLtQxOd5KozGsdO5M3bVrLMq2eImqRMA1Csb4E=;
	b=k2RMLpBs7Mh+cqUQP0S94RoosbsVnwn39b1PDI3JJEJcWvI0fllFBe5579E9gO5QYE5i
	 QABEc/rgN9lAKhrEw7ZuXCoGCUO/a8/N/G9au+44emN98sZRs8wnlByZfaANYVljEE8MR
	 dw2pW+NRpYfwxUDXhvpD1rg8jLjzG4EK0SUSMAZdmbJzStVBECwL1O7jb/xplo93V14ld
	 4yDO08sDron7eOuAYUqM/FwxVM484EkDRGecKqS3JSiaa08d2QZLwBKQrlkObk7EoCxNU
	 9Tl8hy9zDYesvfuk/whD4w5DLGxK2zyLXXnpsR3QdxElYdprxOQvhkmq91Sf5k7matA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YTKLR0m+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=F2laU8Ry;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YTKLR0m+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=F2laU8Ry;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BB1606A31A;
	Thu, 22 Oct 2026 06:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38BB1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YTKLR0m+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=F2laU8Ry;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YTKLR0m+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=F2laU8Ry
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 26D2921EA2;
	Thu, 22 Oct 2026 06:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792649591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gzYjuKLtQxOd5KozGsdO5M3bVrLMq2eImqRMA1Csb4E=;
	b=YTKLR0m+Fh8wnVFqXw33bGNiMcWHgU8I+tQGDAUnDBxI6ATpAXx34rQqOFO/tv6NZJezuw
	H2kN/Lhq/UoASD+FyXfZxkvelSzEwi5JEnwtnguMS3hzPZiuFSZyzi1nXjNliS1zxSq9tm
	/5yIEwKDO+I7U0X1WzH38QCGENlrlHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792649591;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gzYjuKLtQxOd5KozGsdO5M3bVrLMq2eImqRMA1Csb4E=;
	b=F2laU8Ry8UxLNin/BraQp26zrKPlWSfY78PgJyCLjTlWbSL5FTH7I8c13aNG9ZWWr6YGLz
	jXI6JMOuUtb7iqCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YTKLR0m+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=F2laU8Ry
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792649591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gzYjuKLtQxOd5KozGsdO5M3bVrLMq2eImqRMA1Csb4E=;
	b=YTKLR0m+Fh8wnVFqXw33bGNiMcWHgU8I+tQGDAUnDBxI6ATpAXx34rQqOFO/tv6NZJezuw
	H2kN/Lhq/UoASD+FyXfZxkvelSzEwi5JEnwtnguMS3hzPZiuFSZyzi1nXjNliS1zxSq9tm
	/5yIEwKDO+I7U0X1WzH38QCGENlrlHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792649591;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gzYjuKLtQxOd5KozGsdO5M3bVrLMq2eImqRMA1Csb4E=;
	b=F2laU8Ry8UxLNin/BraQp26zrKPlWSfY78PgJyCLjTlWbSL5FTH7I8c13aNG9ZWWr6YGLz
	jXI6JMOuUtb7iqCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CEB30134E6;
	Thu, 22 Oct 2026 06:13:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 11hNKXap2WpUHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Oct 2026 06:13:10 +0000
Date: Thu, 22 Oct 2026 08:13:10 +0200
Message-ID: <875wyue009.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/generic: Use "Input Source" for the capture source selector
In-Reply-To: <20261022025743.520258-1-songxiebing@kylinos.cn>
References: <20261022025743.520258-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 26D2921EA2

On Thu, 22 Oct 2026 04:57:43 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> The generic parser names the capture-source selector "Capture Source" when a
> single ADC is used, and "Input Source" when multiple ADCs are handled
> (including the dynamic ADC switching case).  Commit 624d914d091a
> ("ALSA: hda - Use "Capture Source" for single sources") introduced this
> split to keep the nicer name for the common single-ADC case, because
> "Capture Source" doesn't work well with the alsa-lib simple-mixer
> abstraction when multiple instances are present.
> 
> However, alsa-lib expands a control named "Capture Source" into one
> simple-mixer element per enum item (an exclusive capture switch per input),
> so there is no enumerated simple-mixer element named "Capture Source" for
> userspace to look up.  PulseAudio's ALSA backend resolves its input-source
> element by name via snd_mixer_find_selem() and therefore cannot find the
> selector, leaving the capture source uncontrollable on such single-ADC
> systems.
> 
> "Input Source" is mapped by alsa-lib to a single enumerated element and
> works for both the single- and multi-ADC cases.  Use it unconditionally.

It must be rather a problem of PulseAudio, and it should be able to
handle Capture Source, as it's been used for most of old AC97-based
cards.

Reverting this old behavior change (since 14 years ago!) is just
no-go.


thanks,

Takashi
