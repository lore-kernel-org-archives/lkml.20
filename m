Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086867;
	b=M76C/jfpt4bpQlp7tqR6TFQgHX74zq3jnS7lqlKRiQOIxCAQ2AIG61H0S2khr7vxplmR
	 ywkCd3oClwNAAFBfdLjwidB5gEJOqpEDV0qiAzxh0hi/yzxuQ46P5kb99WRQCYlt+38AM
	 lbxVgprRfFVBrTZzGDMnmanHFHvGozKnuC3QUb7HxoBrb5mMQAC+4i31GjKghh3UK0my4
	 flaRphFbTMhFvEfuBGcF6AwVIgRforgcXCZJZ6jwinMaON/k6c/VoHMBnczJm/mlXhCWP
	 XzGruP5i2PArfVA8KaLQtxIuL9jOQ2vxfFGgCR+25gsXbU9eK/JaTQ9n2oyisBo9u4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086867;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=h1Mcwu9X+0wgJ2oZ5KiL3Zl0mgtIz+tRWQ8Zij/aVfY=;
	b=4lwPUSvcKiVtXWC69trSlJXmIHPOqBhgnAE145eUkDJJBdEy3F/XjgkL/KoBIiLbZiVo
	 U9uKX5aq9NjNwpYsS+ZKl4wXpMX90YsDNLxcPSCg5lq5I24oAZj86HUjqRcSuXl1mc4Cm
	 D6JyTKlUfl6IULcY5riOf5KqaS66ZBkRsz2bFUy8ecem7TcnXmMbKEPYurf+NTfPJvL07
	 lPbEATdK6aIu93VVPIBKkkV0T5prQAetSCH3OeR86ghKW3w1KdgMh/vcQuBr4KPf+bijb
	 wigLz1VHczn+xeBX6RlccFOhPercNIX7d/Bs/4o5mhvXCjMMMX3FTSgBX8BrBFMy5bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=c6TdVi8H;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ppszos5y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=c6TdVi8H;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ppszos5y;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD412606A320;
	Tue, 27 Oct 2026 07:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD412606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=c6TdVi8H;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ppszos5y;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=c6TdVi8H;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ppszos5y
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 01FBB1F445;
	Tue, 27 Oct 2026 07:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793086865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h1Mcwu9X+0wgJ2oZ5KiL3Zl0mgtIz+tRWQ8Zij/aVfY=;
	b=c6TdVi8HsR4ym5VTPlubWWTGMU6TLiWmjdXMfGxRlqfCaHzIVhZKm8JK3sch+xz51A7L/Q
	jGmqjxsQdgGKiufnAeN0P0yvCdwJOPr0zufhaR+6RqPBydCCo63RXtGOF0ZXDC2eq/rUKc
	gISCRQ7GX0N9JV23G1B/T26yam0dKOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793086865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h1Mcwu9X+0wgJ2oZ5KiL3Zl0mgtIz+tRWQ8Zij/aVfY=;
	b=Ppszos5yLv+VclA6S1ln4PTHZEyjcGUWRfIjnuHnq4tiqv9fDuJe6kqVzY6+yrXp+NUQB3
	ckgo5++HkWduHVAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793086865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h1Mcwu9X+0wgJ2oZ5KiL3Zl0mgtIz+tRWQ8Zij/aVfY=;
	b=c6TdVi8HsR4ym5VTPlubWWTGMU6TLiWmjdXMfGxRlqfCaHzIVhZKm8JK3sch+xz51A7L/Q
	jGmqjxsQdgGKiufnAeN0P0yvCdwJOPr0zufhaR+6RqPBydCCo63RXtGOF0ZXDC2eq/rUKc
	gISCRQ7GX0N9JV23G1B/T26yam0dKOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793086865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h1Mcwu9X+0wgJ2oZ5KiL3Zl0mgtIz+tRWQ8Zij/aVfY=;
	b=Ppszos5yLv+VclA6S1ln4PTHZEyjcGUWRfIjnuHnq4tiqv9fDuJe6kqVzY6+yrXp+NUQB3
	ckgo5++HkWduHVAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB5F913319;
	Tue, 27 Oct 2026 07:41:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yprZIJBV4GokYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Oct 2026 07:41:04 +0000
Date: Tue, 27 Oct 2026 08:41:04 +0100
Message-ID: <87mrrz381b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: rainey.shawn+kaudio@gmail.com
Cc: Ajanesh Lal <ajaneshlal3@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: add quirk for Novation UltraNova (1235:0011)
In-Reply-To: <20261023122513.1025684-1-rainey.shawn+kaudio@gmail.com>
References: <20261023122513.1025684-1-rainey.shawn+kaudio@gmail.com>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[kaudio];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.de,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 23 Oct 2026 14:25:11 +0200,
rainey.shawn+kaudio@gmail.com wrote:
> 
> From: Shawn Rainey <rainey.shawn+kaudio@gmail.com>
> 
> The device reports vendor-specific class on all interfaces, so the
> standard parser rejects it and no card is created.  Add a composite
> quirk with fixed audio and raw-MIDI layouts.  The id table entry
> matches interface 0 only so that the vendor control interfaces (2/3)
> are left unbound for userspace access.
> 
> The endpoints advertise no synchronization and the device provides no
> feedback; both streams are locked to the USB SOF.  The playback entry
> is marked USB_ENDPOINT_SYNC_SYNC so that generic sync-EP detection
> does not pair the capture data endpoint (0x82) as implicit feedback
> for the output stream; the capture entry needs no override, as its
> .ep_idx = 1 already keeps it out of sync-EP detection.
> 
> Verified on hardware: audio duplex at both supported rates, raw MIDI
> in/out, and complete patch dumps as SysEx on the MIDI endpoints.
> 
> Signed-off-by: Shawn Rainey <rainey.shawn+kaudio@gmail.com>

Applied now.  Thanks.


Takashi
