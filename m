Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843673;
	b=nPKAUKDYUj1TsPwpDCiPkKiKl0QmSxnP4qHH/EqATeYonlnwX+XtCOMV6oLRdOC9hHxP
	 w5w3ib/WSWLLAwQQmhYKRFnIXYL1Qx5qhWkv0bYKUEXqvde3k2m586oG0GO1yqwbKPxvf
	 qc7of1l714+OOU3sFC8nqSmfGCMveINcoOIEOd3ovji2KbJzo8iMi788oGk4gS1wUrDhF
	 J8IWmiMJK1SmTVvjrV7qD0zfFqH/m1X+D167zh3n4A45cIPBFn2T07F1+OiQGV9KDI4S0
	 JW5T71u/wl6Q0X3l7eqcYS069V7iIz12KOqXAbdN+JeE4KkPfPvDDdXSbTsUfNFJS6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843673;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=j2CRjjo95t7QsEgkDvbs1c7ZmLU2CpNQp7Bvr3IuKpo=;
	b=hJP3jrrjwbzyOszYWe+Vrf6kIUg8P31tLHQAGCG8ViupqXIOS/LrabHmHwUz3MriWjX8
	 5yPQE0OguHv+uk6LcfJxIcREYB9kdVXYQWjACxZBK67P92PU6GdfmIAGiANHUtHjrCaue
	 mjtzMMQVWG5GzHnpIWlsB1a64PvhLlsoQ6WzyuxamP0dxhN2ZMpsy678TuOqLuyEznqBD
	 D9I5C7OWswEBWG8GseV/Tqi1HHUFBqg8Z6GJbT+pX+da0CObYcvtBTXDWtZXlWe2BAGz+
	 c7BvthYPwMOLDZah6WzyYmu1i0GOsdLZlcXHc8rQplQ8ch/tes+w4WvzWralW1GMftw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="gH/okeN8";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=b0lGBEg4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="gH/okeN8";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=b0lGBEg4;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A71B606A31C;
	Mon, 16 Nov 2026 15:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A71B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gH/okeN8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=b0lGBEg4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gH/okeN8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=b0lGBEg4
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B4202222EE;
	Mon, 16 Nov 2026 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794843670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j2CRjjo95t7QsEgkDvbs1c7ZmLU2CpNQp7Bvr3IuKpo=;
	b=gH/okeN80mUjCSRXMBKnUXzceSlDY6UHDFuq9OdxTK4whMpDuYFYT1S74FhC8yj2mSe70d
	85366scExHj6ddJ3dqB3fEf8RoBff2jeTip08a66ricljAPjfr/NKwkH0zmJFdKF5nVYID
	uMaGBf2/PjeIxUNbXGrswxs1jZ2alGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794843670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j2CRjjo95t7QsEgkDvbs1c7ZmLU2CpNQp7Bvr3IuKpo=;
	b=b0lGBEg4tiPO2BiZ7SV62lR4ghiaPmSEyQCq4mV6Mqc8W6npfKf+0AVu9TaFj4rSLO3ztJ
	RWEiPMdOa5/LOTBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794843670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j2CRjjo95t7QsEgkDvbs1c7ZmLU2CpNQp7Bvr3IuKpo=;
	b=gH/okeN80mUjCSRXMBKnUXzceSlDY6UHDFuq9OdxTK4whMpDuYFYT1S74FhC8yj2mSe70d
	85366scExHj6ddJ3dqB3fEf8RoBff2jeTip08a66ricljAPjfr/NKwkH0zmJFdKF5nVYID
	uMaGBf2/PjeIxUNbXGrswxs1jZ2alGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794843670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j2CRjjo95t7QsEgkDvbs1c7ZmLU2CpNQp7Bvr3IuKpo=;
	b=b0lGBEg4tiPO2BiZ7SV62lR4ghiaPmSEyQCq4mV6Mqc8W6npfKf+0AVu9TaFj4rSLO3ztJ
	RWEiPMdOa5/LOTBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B59813408;
	Mon, 16 Nov 2026 15:41:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l3xLEBYk+2pFPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 15:41:10 +0000
Date: Mon, 16 Nov 2026 16:41:09 +0100
Message-ID: <874idgyeay.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sinan Turunc <enscrpt@pm.me>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usx2y: Account for every period a URB completes
In-Reply-To: <20261115121638.168-1-enscrpt@pm.me>
References: <20261115121638.168-1-enscrpt@pm.me>
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
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[pm.me:email,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,pm.me:email]
X-Spam-Score: -12.30

On Sun, 15 Nov 2026 13:16:55 +0100,
Sinan Turunc wrote:
> 
> usx2y_urb_capt_retire() and usx2y_urb_play_retire() add the frames of a
> whole URB to transfer_done and subtract one period_size when it is
> reached. With a period of 1 ms, which snd_usx2y_pcm_open() allows, a
> URB of nr_of_packs() packets covers several periods, so transfer_done
> grows by the difference on every URB. snd_pcm_period_elapsed() is
> called once per URB instead of once per period, and transfer_done
> overflows after about 16 hours, after which period wake-ups stop.
> 
> Keep only the remainder modulo period_size. ALSA's position comes from
> the pointer callback, so one call per URB that crosses a period is
> enough.
> 
> Measured on 7.3-rc7 with an emulated US-122 over USB/IP and a debug
> print of transfer_done every 1024 capture URBs, 45-frame periods and
> 48-frame packets: before, transfer_done is 150573 after 1024 URBs and
> 8580141 after 58368; after, it never exceeds a period plus one URB and
> the stream runs for 30 s as before.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Sinan Turunc <enscrpt@pm.me>

Applied now.  Thanks.


Takashi
