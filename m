Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803460;
	b=G0OKaI83scvgN3uXDEiJGXpyvMQgmvdD/FEKvWAwq9QA+EMgFBWs3iGnuoRlW5T63qLg
	 ByqhiJBG/3AAZ1XBdPMSRhT0j/0V9kxl/n3zR7OQe6Rolc2DeYjEir4+l15YPbMvJj1tI
	 +/eClCQ+6lkpMsl083lvrndqwl2n3/NcucxL5Xu7p+F4MkdBBoAr6TZQGnzCd1GXG6H4e
	 3XSd5j5xH23H5gSNIFYYI1AdgGZo33ZoFNgQ4O9TYsLeGTrJvdYYVskojoRB2taeEXytK
	 vqawSGlSkDw05ft0jMSzmzHa7WRWOwCQPsBupvaDTvoO0cjIBBm2JOEbgFDdDohvHtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803460;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=8r4EnvgjObaBTYwOB8OTRpqbIw8jTcrqqWSdJpOWpY8=;
	b=FsaDLDKQfahjW9e94GNtHPCcG+ChZq+4rM0i2e/uCoO6Fl0SL3FfknD/TtmqdNWQmBDw
	 GlLwwUV1NTOvdx/1qqdGuzfOndnOdErhZ7UYcqXZSt46dog9Rs0yDFXvYKdF0BH1yqLVg
	 yGw7VK6JMXW6r89Axk1ARec3M62yIS1eXoRt5dZNdsaPJjyyUTb1UJ4zDwuaGVOahQCJa
	 ZKx0NjgWsjhFMvauOBNeCXmSDSZdjUNIfjCyswdlr2kZy4h/WVX7F23pMTJ+0YfyH+Tsu
	 JR5XDnvXqyjMsLGFoX98/mhPDde0+0oU8u5ckfeUraxIyo9EI4qx0VhBLBRzb6n5Hfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eXCk2Bpz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hnskq3Wd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eXCk2Bpz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hnskq3Wd;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20328606A334;
	Wed,  4 Nov 2026 14:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20328606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eXCk2Bpz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hnskq3Wd;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eXCk2Bpz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hnskq3Wd
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 59BFD21FBA;
	Wed,  4 Nov 2026 14:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8r4EnvgjObaBTYwOB8OTRpqbIw8jTcrqqWSdJpOWpY8=;
	b=eXCk2BpzETrGfiLN86KM1mnbvpPeM2fVKig6Xa+02I+5o96Aef+rfHQVc6vU70rWmEDfhH
	zTmM+7YpDdRIn9xDGbjxbF01thO2pjU0GxwG7XJmFkWSl6NdSBcW3SfVo21rvhcxgvWr43
	1Vq9/jrhHvVOKolJaX43PGCHI/2PY4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8r4EnvgjObaBTYwOB8OTRpqbIw8jTcrqqWSdJpOWpY8=;
	b=Hnskq3WdQOhrLz2tnxXw54ZjyX4wMC4gXi8+ubz/i/2bwPIY3yrVqSTgHQVp2SpysvIYdo
	cN1p3CLZ2dkwWzAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eXCk2Bpz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Hnskq3Wd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8r4EnvgjObaBTYwOB8OTRpqbIw8jTcrqqWSdJpOWpY8=;
	b=eXCk2BpzETrGfiLN86KM1mnbvpPeM2fVKig6Xa+02I+5o96Aef+rfHQVc6vU70rWmEDfhH
	zTmM+7YpDdRIn9xDGbjxbF01thO2pjU0GxwG7XJmFkWSl6NdSBcW3SfVo21rvhcxgvWr43
	1Vq9/jrhHvVOKolJaX43PGCHI/2PY4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8r4EnvgjObaBTYwOB8OTRpqbIw8jTcrqqWSdJpOWpY8=;
	b=Hnskq3WdQOhrLz2tnxXw54ZjyX4wMC4gXi8+ubz/i/2bwPIY3yrVqSTgHQVp2SpysvIYdo
	cN1p3CLZ2dkwWzAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C5E3134F0;
	Wed,  4 Nov 2026 14:44:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Tg4/M8FE62pKfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 14:44:18 +0000
Date: Wed, 04 Nov 2026 15:44:17 +0100
Message-ID: <87v76cu05a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	navonjohnlukose@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: doc: cs35l56: Update calibration write failure message info
In-Reply-To: <20261104113610.1057194-1-rf@opensource.cirrus.com>
References: <20261104113610.1057194-1-rf@opensource.cirrus.com>
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
X-Rspamd-Queue-Id: 59BFD21FBA
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,vger.kernel.org,opensource.cirrus.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Wed, 04 Nov 2026 12:36:10 +0100,
Richard Fitzgerald wrote:
> 
> Update the descriptions of the "Failed to write calibration" and
> "Calibration disabled due to missing firmware controls" error messages.
> 
> Originally "Failed to write calibration" was described as having the same
> cause as "Calibration disabled due to missing firmware controls". This
> was _typically_ true because the most likely cause of the write failure
> was missing controls (because both messages would be logged in that case).
> But it wasn't clear from the description that this was referring to the
> _typical_ root cause being the same.
> 
> Reword the "Failed to write calibration" info to describe the possible
> other reasons for this error.
> 
> Also slightly reword the description of "Calibration disabled due to
> missing firmware controls" to say "firmware wmfw file" instead of only
> "wmfw" and fix a missing "the" in the second bullet point. Also note
> that this is not necessarily an error, only information.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Applied now.  Thanks.


Takashi
