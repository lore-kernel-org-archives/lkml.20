Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81B53AB460;
	Sat,  3 Oct 2026 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020996; cv=none; b=hPtLaz2Wk/KMOE88S3bzwwsrPCXcsFUT25otnsNx+mvUTU2oltZ+RShirf0F1PGfjFAWMFc6W5mBpEDzoKkSIvD74EtCwAeAYIrVZnha0mLtmQxsIISNfMcKpSfQZZGch9rNfvbstsvhWga/upraC2Xx1ESXaaPA5HqM0xiGffQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020996; c=relaxed/simple;
	bh=6UsPYqeB3swFKTsWv4NrsiSK/8Qj8MwSecQZWc9reh4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b4A8HSUaMQCMm6MOrhxNVDCgTPRYc9StEur7Zb0r1Tae8S84vaOwYycTgPrlCPiaEr34jUpWgpo9CPd4i61Vy4oa1TDRuA+YfmrtiiQJRJAKRs3Ya4HotJm5AMhULs1whkEHmAvx8gGTAdrZF78L8G0uWLCPEfKZf+EeSYiRD8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cx/9VPcR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YMbvyBtU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bYJi8kE5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+RH0V167; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cx/9VPcR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YMbvyBtU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bYJi8kE5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+RH0V167"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6FB7E21C4C;
	Sat,  3 Oct 2026 09:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791020989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CSbGu70gAOd8zQPuW62q6n01HI5nlvD0gzjOm97qFng=;
	b=Cx/9VPcREoYIeM1Fhf/aNzwnLaXXiJD81ZCLgGZ5tE4lMPm+whpzMmGMJ3Rr/S1+a/cfMP
	Lr43UogV7DISqr3R+1J87fG2x1JG5PvqJ3pwOnCyaXJz2S0kjGXE5v5vt8Y7Bmxy3p3Z5Y
	XlI3YfaMM6SOMQpIh8u21lkaTncK0C8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791020989;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CSbGu70gAOd8zQPuW62q6n01HI5nlvD0gzjOm97qFng=;
	b=YMbvyBtUSz9coM8U49hvdIHFnbAufgkM8+fE2B0Rshq44GQi4W9Gl8cOSu3/J49NhvRECj
	rpKTYmEeqLD+eLBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bYJi8kE5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+RH0V167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791020985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CSbGu70gAOd8zQPuW62q6n01HI5nlvD0gzjOm97qFng=;
	b=bYJi8kE5o/L19enYzR1GhNd0eSG1qKulKIP/ZJ72vyQtbhBSHPdIIVgyeJ3ZyPgVy8InXM
	lnz65cqnVZC8gnYCwBWE1zNTuDgYGJVk2oGAzKIZ8HMFhWxbxugEr3CM/FeTOtqDFAk8Ep
	UDK+vpIDgx8tEx5tvdyLeQmsN8yxZjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791020985;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CSbGu70gAOd8zQPuW62q6n01HI5nlvD0gzjOm97qFng=;
	b=+RH0V167f7L3vB3OUKSMsa42S7ilL1C0BnEl7A4PByaCiDapoUajP0+8M+OIUyIBQMWNxR
	8+VVYLnXX/RPWtBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2259813712;
	Sat,  3 Oct 2026 09:49:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KuVmOrjPwGodRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 09:49:45 +0000
Date: Sat, 03 Oct 2026 11:49:44 +0200
Message-ID: <87a4ovxgef.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaidheer Sirigineedi <jaidheer7@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-eg3xxx (103c:8bfd)
In-Reply-To: <20261002185951.33855-1-jaidheer7@gmail.com>
References: <20261002185951.33855-1-jaidheer7@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6FB7E21C4C
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 02 Oct 2026 20:59:51 +0200,
Jaidheer Sirigineedi wrote:
> 
> The mute LED on the HP Pavilion Laptop 15-eg3xxx (PCI SSID 103c:8bfd,
> Realtek ALC287) does not work because the machine has no entry in the
> quirk table. No fixup is applied, so the mute LED is never driven, even
> though the mute function itself works.
> 
> The LED is controlled via GPIO pin 4 (mask 0x10), which is exactly what
> ALC287_FIXUP_HP_GPIO_LED configures. This was verified on the hardware
> with hda-verb: setting the GPIO data bit lights the mute LED, and
> clearing it turns the LED off.
> 
>   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x10
>   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIRECTION 0x10
>   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x10   # LED on
>   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x00   # LED off
> 
> Add a quirk entry for 103c:8bfd using ALC287_FIXUP_HP_GPIO_LED.
> 
> Signed-off-by: Jaidheer Sirigineedi <jaidheer7@gmail.com>

Applied now.  Thanks.


Takashi
