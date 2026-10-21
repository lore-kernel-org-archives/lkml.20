Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575142;
	b=1U2dmIGDEF3FId/6MUTVhE6X9WtVN3I+5KH5XsFrJQcaJTuelvdDC68d7XszK/39oeI7
	 AhwotPkE8ISxA8e6LvrdMV8Lt2koMfqxPJ+NyOrJmpawe/ELAcJVtW7/Zf6jSXVp4QlRB
	 KMM1lvWDPsmlcp1xXlzMtTgGufQShDeOM1RIW2WFpbFy9ui542ohTdgdEbW1s6NZSIiMW
	 /NFl36o8Jjjgh3vEk8SKTWgNNDjyp6dmCiUmr1OtDLUalhHfiHIGwfFUfVPHM5gSPJB18
	 7fvvavxfXbj5r0g4fkmcNGOf+dSUx/Bh45PLgNwTbHVaCx9wWUHrTYuSJnXPYcMt45A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575142;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Rspamd-Action:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=m+U9ItORhA8otwRgwDSYfGifxUuTRVP0RI6/I1FbgDI=;
	b=Ffv/1n+2cJxXMXcN7WGjHe7RoTMywAeCwZI31/G/SQaAySYFvusKXhtPL0btUCIbVPte
	 lcA992HedJseOj+2pUPNGpFGBUnExx5MLy+45+1c4UJiZRn91PlBNX2b2WOwJ3NnfWJrp
	 KTIpuAGHTnH2CdcYVYdnsdz10mx8nn/p8OTsuOBKu3GGdpqUm5GldR11YRHKCc1PUDMA1
	 pNtgDNKmb5xzH5KpVHaERWL70nUO1aAxBOcmAmexJTHSl2LqaioD4JeESGbXxTHFXLHCr
	 +IaTA3TQ1/jXmC1GfFb+l5K29bpkEi7eeDzPQaFd1bXPILn54VNM/zQXj4ATMxAwDqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t1Dd4Z5p;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RZyPz8Ue;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l6yrjOje;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=74noW8d9;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE48860A2600;
	Wed, 21 Oct 2026 09:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE48860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t1Dd4Z5p;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RZyPz8Ue;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l6yrjOje;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=74noW8d9
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E0B7F21DCD;
	Wed, 21 Oct 2026 09:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792575140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m+U9ItORhA8otwRgwDSYfGifxUuTRVP0RI6/I1FbgDI=;
	b=t1Dd4Z5pU/yWERfMQYryEc/6jttOD8kwE3UXL55t0Mg3/MRKA6sFEB/WA8Qz7PCGsO5oiU
	Bp2tmJac3kvV7anSh4HX9qdGffSVuRLKzv12u9/ef7m/jV5zoXRpF3MTiuIDZx50HdGBiK
	Ho8K9De3DJfUzUv9Rik7TNodrawut7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792575140;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m+U9ItORhA8otwRgwDSYfGifxUuTRVP0RI6/I1FbgDI=;
	b=RZyPz8Uer4cGcCok+jww6jHSG5OAU3uOQHzYKvsvshttKTHuLbvY5h8J5ZCIDKeH1kcJcG
	DentM/p6xE07RyBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=l6yrjOje;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=74noW8d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792575139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m+U9ItORhA8otwRgwDSYfGifxUuTRVP0RI6/I1FbgDI=;
	b=l6yrjOjebpKPmP/kbdynI3qPMi5jAqnxgaLVzmtnSeOeL+ByOaHU0mKgqEY+zLOTXcnvek
	6BpAXIaAiiU6JQP+Qsm9L2UPs5ty+nx1QUWqKejFpZzmrM0xny5wy/lqHuVodSZ7EclJ9A
	H4edLURgt54Qw8PLrsRFdIWyYUO4lNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792575139;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m+U9ItORhA8otwRgwDSYfGifxUuTRVP0RI6/I1FbgDI=;
	b=74noW8d9oEnq1xP96Wnhy6BQPggzliBBNNN7B8ixW0VwZb5U9mJN5M0E95A93WSdppNhd6
	k64FCEKQQ2S0RPDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AACF2134A5;
	Wed, 21 Oct 2026 09:32:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id haoOIaOG2Gr6FwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Oct 2026 09:32:19 +0000
Date: Wed, 21 Oct 2026 11:32:04 +0200
Message-ID: <87bj8nflgr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: DragonicRage13 <ajaneshlal3@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add mute and mic-mute LEDs for HP ENVY 16 (103c:8be5)
In-Reply-To: <20261021012205.9431-1-ajaneshlal3@gmail.com>
References: <20261021012205.9431-1-ajaneshlal3@gmail.com>
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
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E0B7F21DCD
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 21 Oct 2026 03:22:05 +0200,
DragonicRage13 wrote:
> 
> The HP ENVY Laptop 16-h1xxx (PCI SSID 103c:8be5) uses an ALC245 codec
> with CS35L41 I2C speaker amplifiers. No LED fixup is applied for this
> subsystem ID, so the speaker mute LED and the microphone mute LED are
> never driven and do not follow their keys.
> 
> Add a fixup that calls the existing ALC245 mute LED COEF helper and the
> GPIO mic-mute LED helper directly, then chains to the CS35L41 I2C
> amplifier setup so the speakers keep working. Use it for 103c:8be5.
> 
> Tested on an HP ENVY Laptop 16-h1xxx running kernel 7.2.11: the
> hda::mute and hda::micmute LEDs appear and follow their keys, and the
> speaker amplifiers still bind (CS35L41 Bound in dmesg). The mic LED
> GPIO pin and polarity are not verified on other hardware.
> 
> Assisted-by: Claude:claude-haiku-5-5
> Signed-off-by: DragonicRage13 <ajaneshlal3@gmail.com>

Please use a real name (or a known identity) for Signed-off-by tag
(and the corresponding From tag), as Signed-off-by is a legal
requirement.

Also, since you're replacing the existing quirk, it's better to point
to the commit that introduced the quirk via Fixes tag.

Last but not least, the patch doesn't seem applied cleanly to the
latest sound.git tree.  Please rebase.

Could you resubmit with those corrections?


thanks,

Takashi
