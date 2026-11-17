Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905845;
	b=2SuVNZ+S04fImcvPJ+EoQnrvz1/4Xir7lhgvtGw01BFif2rSaNpx1HArTwoSWTT6mgg6
	 isvI3kMHNmEPEM1MsvWaFcY/kGWNpzsKMFUzH18hGJIDLCVfyX9vhI0snvry8xxd0VLMk
	 V16OUetRUiR00W3Inw1q7CngJZhBU6dBFqoMADxr6qUlYxegTuPJPLG53v8ikFlR2KBMV
	 PdaXePorukYDkC6Z0AY3ep/uuWTXsKWYdgszK/UvAsf7LTgQfwKp+RJAQlljCkFye5qbF
	 WNXhf7/YlBDTnJDYi4hF0Aa7705ng4vlG71nHsEoXAB4XmGzfchASGGTIWMDAR9mruA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905845;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=5fNjV0YNnSo1/gSs1Wn1OMJd6JWpgDAyQUrVWUni4PI=;
	b=YmlP1jjYQP6YBPKax0SXr/h8aXJOcclUdO+uQsFaYlQbAr+2O7HQ1AyMWHMiQY3HCrto
	 0OgA6cblagCuWDyiuS+x8hufkjTDw1IB5jy9i++WvWXhFUjRIPEAz7AxryEm+bpxjW/Cp
	 MwSwchRDFyAnAjLKd1KHxZ0USgrtQjoB3rcBhH3o7veBKzc9QS70qyHkX40buvbpr3T3o
	 Q7Bl4/5/v7rjNpOkUUUMCEXOcfdiukA6wO8NuOEntdGncnIT9lFRji1SkyqjneyfJXn11
	 hpTD+a4xc6TIskZxpdaSCLisCRI7iD5PvLVbuVV9RzI7dtwBNYvlXU0bKcZvUwy6b6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xql9zqOS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Oo4dN4pv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xql9zqOS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Oo4dN4pv;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15068606A31C;
	Tue, 17 Nov 2026 08:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15068606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xql9zqOS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Oo4dN4pv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xql9zqOS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Oo4dN4pv
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3204422375;
	Tue, 17 Nov 2026 08:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794905843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5fNjV0YNnSo1/gSs1Wn1OMJd6JWpgDAyQUrVWUni4PI=;
	b=xql9zqOStJ2xreeWe4wDZMubkfswFyK3WjMJnhgoevahPJ1rB+JKkt3W/Q/v2WO1iMezIU
	89jHkxPGIuuU/F0tf1GHEC3bDQdYcMDcvrT6gKdbVSFWSEUnuK8dh1oz6Ah1AdHJkjyn5A
	NcvW/eXgJTZ2tHciCsZIQcZOnmKb3bY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794905843;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5fNjV0YNnSo1/gSs1Wn1OMJd6JWpgDAyQUrVWUni4PI=;
	b=Oo4dN4pvn5f49uEF+4K6LqePexBHr2HkvvvzcPw9CzgOvvQgWtuSvWNgJyfuXzhkJNtByR
	ERuMXQ6a7NYi1zBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xql9zqOS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Oo4dN4pv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794905843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5fNjV0YNnSo1/gSs1Wn1OMJd6JWpgDAyQUrVWUni4PI=;
	b=xql9zqOStJ2xreeWe4wDZMubkfswFyK3WjMJnhgoevahPJ1rB+JKkt3W/Q/v2WO1iMezIU
	89jHkxPGIuuU/F0tf1GHEC3bDQdYcMDcvrT6gKdbVSFWSEUnuK8dh1oz6Ah1AdHJkjyn5A
	NcvW/eXgJTZ2tHciCsZIQcZOnmKb3bY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794905843;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5fNjV0YNnSo1/gSs1Wn1OMJd6JWpgDAyQUrVWUni4PI=;
	b=Oo4dN4pvn5f49uEF+4K6LqePexBHr2HkvvvzcPw9CzgOvvQgWtuSvWNgJyfuXzhkJNtByR
	ERuMXQ6a7NYi1zBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D09211334C;
	Tue, 17 Nov 2026 08:57:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +/NfKfIW/GoJXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Nov 2026 08:57:22 +0000
Date: Tue, 17 Nov 2026 09:57:22 +0100
Message-ID: <87y0arzvgt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kailang Yang <kailang@realtek.com>,
	Dorian Cruveiller <doriancruveiller@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Don't apply the Legion Slim 7 quirk to Lenovo V14 G2 ITL
In-Reply-To: <20261116195503.11530-1-kapoorarnav43@gmail.com>
References: <20261116195503.11530-1-kapoorarnav43@gmail.com>
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
X-Rspamd-Queue-Id: 3204422375
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,realtek.com,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

On Mon, 16 Nov 2026 20:55:00 +0100,
Arnav Kapoor wrote:
> 
> The Lenovo V14 G2 ITL (82KA) has PCI SSID 17aa:380e and an ALC257 with
> codec SSID 17aa:38b7. No entry matches the PCI SSID, so the codec SSID
> fallback picks the Legion Slim 7 16APH8 entry for PCI SSID 17aa:38b7:
> 
>   ALC257: picked fixup  for codec SSID 17aa:38b7
> 
> That applies ALC287_FIXUP_CS35L41_I2C_2 and sets up component binding
> for two CS35L41 amplifiers, which this machine doesn't have; its single
> speaker pair is driven by the ALC257 itself (pin 0x14).
> 
> Add a codec SSID entry after the Legion one, so the Legion keeps
> matching on its PCI SSID first and the V14 G2 ITL gets
> ALC269_FIXUP_LENOVO_XPAD_ACPI, the fixup the Lenovo vendor fallback
> gives it when nothing else matches.
> 
> Fixes: 99af5b11c57d ("ALSA: hda/realtek: enable SND_PCI_QUIRK for Lenovo Legion Slim 7 Gen 8 (2023) serie")
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>

Applied now.  Thanks.


Takashi
