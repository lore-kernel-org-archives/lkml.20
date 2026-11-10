Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307402;
	b=vPBmem5bpjT+z5VLFfwkXuQkJpaZKVmyT8eHrogescmWaPWD4Y9XVjerERLzoVZF3ax9
	 55EoKF5nGQ0YHvTwCEzckDoxeGHu8S1V7Ndxi4ZdG9WuawK00w1Ml1/CA5/S5Zz5THNym
	 6mBzWnyZKQDjcijrruW2MxuZHuBukAP6b4OQO4KtZ9eYL9jS1N8gbhc2On+J3fqDVco0M
	 9QKymLYkdPD4UhcyBomoNHuVBA63B4Ay78szaDn6xUHvRKPSqaYO3XLXdDh+SBsQAifH0
	 bXkWL/qWS//auTmU1edVyWWdjjIglA/hogUlpJcocjokMiphHeIVx34iSFm5krnc/yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307402;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=jZT15QFSU79UxfWu9z0yMR9lsEE91WwJL2m3Lacw+cc=;
	b=3Lgrn+p/tqSHIUuff56rzD1ktJZpXPBav9qqmhEu/36mALYSd5P5EyTWJl3cFQMuF3Kg
	 opJD9/SBlGWfjd6hm5H1VM1Q3jaDGdzrFwCU+LHNFu2E6aShG/qUGAKoH/+Zp1h0OkFAL
	 HDFsresCsjdmwlVSn4nfHkpELUiWGTJ0+yavQw4XlGQnWTXEKKLK3wqIqA5j88rE33Z4u
	 IbRBhCu1qK1T8PcHic/EOW/iYTiGAcngihf/OLuwlYzkt7MNr8IgSxCkjl1bAFgtEP/CC
	 mAJeJ8/TNQI06VrtpEoNVIWZJNkiSwFo2PB3eJV60ZdFmdoVNysg7Nl6jpt/u6H+bbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CNw2NH2y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WESoGiJE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CNw2NH2y;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WESoGiJE;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C000606A31C;
	Tue, 10 Nov 2026 10:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C000606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CNw2NH2y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WESoGiJE;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CNw2NH2y;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WESoGiJE
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9FDFA21EDF;
	Tue, 10 Nov 2026 10:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794307399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jZT15QFSU79UxfWu9z0yMR9lsEE91WwJL2m3Lacw+cc=;
	b=CNw2NH2y3265uY+UwLgh8agnTnnZRU+Shu6hmZ6VwRYmWFFAqGLpYwkfV6mPwPGiPdcGU3
	nUt61fvLmJl3u7phUIHFluxINhfRqt+D4roYNGsFyc6TzupRUeCLEMArDKRiV+mItBV5ZH
	hcr/PROzA8XurwDX5p+YLZNDgCHOpKY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794307399;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jZT15QFSU79UxfWu9z0yMR9lsEE91WwJL2m3Lacw+cc=;
	b=WESoGiJEg8iJcL0Y9gZiD51gcxEEb6/uyRgenqSIIwCh8Fi/S/1YxdntNRLffCiWZs06Dj
	R4IeiCiyYC6a7HCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794307399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jZT15QFSU79UxfWu9z0yMR9lsEE91WwJL2m3Lacw+cc=;
	b=CNw2NH2y3265uY+UwLgh8agnTnnZRU+Shu6hmZ6VwRYmWFFAqGLpYwkfV6mPwPGiPdcGU3
	nUt61fvLmJl3u7phUIHFluxINhfRqt+D4roYNGsFyc6TzupRUeCLEMArDKRiV+mItBV5ZH
	hcr/PROzA8XurwDX5p+YLZNDgCHOpKY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794307399;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jZT15QFSU79UxfWu9z0yMR9lsEE91WwJL2m3Lacw+cc=;
	b=WESoGiJEg8iJcL0Y9gZiD51gcxEEb6/uyRgenqSIIwCh8Fi/S/1YxdntNRLffCiWZs06Dj
	R4IeiCiyYC6a7HCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6252E1339F;
	Tue, 10 Nov 2026 10:43:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Aj8GD0f18mpcOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Nov 2026 10:43:19 +0000
Date: Tue, 10 Nov 2026 11:43:14 +0100
Message-ID: <87tslpuful.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lianqin Hu <hulianqin@vivo.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for RYDZ Technology Piva AC20
In-Reply-To: <20261110020058.31037-1-hulianqin@vivo.com>
References: <20261110020058.31037-1-hulianqin@vivo.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Tue, 10 Nov 2026 03:00:58 +0100,
Lianqin Hu wrote:
> 
> Setting up the interface when suspended/resuming fails on this card.
> Adding a reset and delay quirk will eliminate this problem.
> 
> usb 1-1.4.1: New USB device found, idVendor=0bda, idProduct=8808
> usb 1-1.4.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1.4.1: Product: Piva AC20.
> usb 1-1.4.1: Manufacturer: RYDZ Technology
> usb 1-1.4.1: SerialNumber: 202511241125
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
