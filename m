Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059101;
	b=vBKmvevUbp1IBTxWTAsZNn1JPllMaUaV8epiE2G/qHmbaJ3gPisDTp7htcWKaLnqINd+
	 draIHYf0x2ccT/NyhaOiQM6m7lmQ32JqzSTeYJZUHXn0qoAcz9cKhUjWnxtrGFhEaGBsx
	 Y7zBb2wDw2vok2WAbr7VYQTEqCYZ14HH4oBHYt49eel3fxV6Z55dE2YU2rlgSiU/cUGCZ
	 FDKZwGPz30IuLFg/K4ZZDeYuM05yd5ULJtEyZjDTuv7o00BiamMICWq8UzfcwaJPUWyyi
	 aEpg0Er4FVTLV17aFNtYgDFu1JPdkFS3nZgQnimCjF7nNOa1qvAWXl4mmMlSs9DUGYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059101;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=YI+3QYKuySwcsokiC0xd+nm3WzuiFdrD/F94aK+IkoY=;
	b=buZuIKEBpSnEOFuRagmPhknn/z5f3MxrmDsbi+TTv5lh5p4G2WrNcsDowAshoGB/c/rW
	 ZaqRoKpFxyrKVtJ8h7Girb2gFNlA20uLP/sI6fyihL3xcvZehT2kNFZNyJTvL4kLs8wF5
	 6zlCTvhJWZag2SXOM+I/QR4FykdcG0ZJWxUhN7wO/F0NqG/b7OFX1CVrc4JpwONFAQ+io
	 wrldttt9x9LXYcM7/b5Gp1ONXg47W25kxDvVNjoBfswx7QcdTxVtrxSDiWO5YyVd41GL4
	 eGMpeGBfdMG1glPIVUfF1BKn5o8CVbGQQoVEZ0aic06bB94DnbWiJZ1xgXfQr5gzGsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Vuh0IpUp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oSYl3sQe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xtWjTcF5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=uNtlLoun;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED58D606A326;
	Sat,  7 Nov 2026 13:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED58D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Vuh0IpUp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oSYl3sQe;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xtWjTcF5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=uNtlLoun
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B7A3D1F7C1;
	Sat,  7 Nov 2026 13:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794059099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YI+3QYKuySwcsokiC0xd+nm3WzuiFdrD/F94aK+IkoY=;
	b=Vuh0IpUpxrUKoJr/SLu9uXLALfuw9Yp3u9zG/Pnx9LrKkwPgPODN+XA9NC/9aDnxWCmy1S
	ykYkzGs3aEWJCWzX/HhBS2Ofs/VQHBRbfLkBObzYWUsQPQkwHa0ZnrmnHwi6YDSuKygrf8
	U4oj0mMPVVONU+p8+XQgK0NUaibx8hc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794059099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YI+3QYKuySwcsokiC0xd+nm3WzuiFdrD/F94aK+IkoY=;
	b=oSYl3sQeTBSNOqkO2mPeWxRuSPnFsNuySA6Pva+Qlg6G11sS7FaVfQLb8MIvWvYWsLFtT3
	cOMxkh0aqOCO5pBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xtWjTcF5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uNtlLoun
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794059098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YI+3QYKuySwcsokiC0xd+nm3WzuiFdrD/F94aK+IkoY=;
	b=xtWjTcF51+GkZgtUxiSxPMFNKfGHGbkcfr7skQ54z/7h2sEVPuL1oO4oLjxAUVpFBw04fh
	bwKLDd6B9f0pdHig2SMVI/YjFaAotnZZsPlGMK+pxRFE29fSSewYx3tKuFHDILrZDHCjhD
	18j2e/fmUqkq8HePFVZzABe1AcAr3M0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794059098;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YI+3QYKuySwcsokiC0xd+nm3WzuiFdrD/F94aK+IkoY=;
	b=uNtlLounoZOB1vEaaQxrxCwgNr+hA8iZLyFdEV+ietejhRk+nutb6WlCZoF3PETyfJ6Sgd
	2Yoc9c1NraoC/CBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3243B132C9;
	Sat,  7 Nov 2026 13:44:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T8B9AVor72qucgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Nov 2026 13:44:58 +0000
Date: Sat, 07 Nov 2026 14:44:57 +0100
Message-ID: <87tslsycva.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: info: Use snprintf() in snd_info_card_create()
In-Reply-To: <au8h4SDC6fKaY7st@kernel.org>
References: <20261107004338.323417-2-blum@kernel.org>
	<87a4nlypdt.wl-tiwai@suse.de>
	<au8h4SDC6fKaY7st@kernel.org>
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
X-Rspamd-Queue-Id: B7A3D1F7C1
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,gmail.com,intel.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.01

On Sat, 07 Nov 2026 14:04:33 +0100,
Thorsten Blum wrote:
> 
> On Sat, Nov 07, 2026 at 10:14:38AM +0100, Takashi Iwai wrote:
> > On Sat, 07 Nov 2026 01:43:37 +0100,
> > Thorsten Blum wrote:
> > > 
> > > While the current code works correctly, replace the unbounded sprintf()
> > > with snprintf() to bound the formatted string to the str buffer.
> > > 
> > > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > 
> > Shouldn't we use scnprintf() instead?  Otherwise it may lead to a
> > compiler warning.
> 
> The only difference between snprintf() and scnprintf() is the return
> value, which is unused here. Both are correct and shouldn't trigger a
> warning.

Well, not really.  For this particular patch, it doesn't make
difference, but in some cases (like the use with %s), snprintf()
causes a spurious compile warning with W=1.  e.g. try below.


Takashi

--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1369,7 +1369,7 @@ static void update_legacy_substreams(struct snd_ump_endpoint *ump,
 		name = ump->groups[idx].name;
 		if (!*name)
 			name = ump->core.name;
-		scnprintf(s->name, sizeof(s->name), "Group %d (%.16s)%s",
+		snprintf(s->name, sizeof(s->name), "Group %d (%.16s)%s",
 			  idx + 1, name,
 			  ump->groups[idx].active ? "" : " [Inactive]");
 		s->inactive = !ump->groups[idx].active;

