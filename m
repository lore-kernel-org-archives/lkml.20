Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609598;
	b=aCVgB70TUcOEU4CNYbg11gByO6sQI/5YL7ocY8agWvGU56Wc0Cjxor9Fj0b6PdzF+n4l
	 zKrwWWMZH7KlHqS06b8oHlyxWUIOmjC6eVLWOniLzd3HFthizYSokEPDAmtcfs8tQ3g45
	 PVUFEZOKyou+1DGlYSgKYqPEaQTcxTzDePwFHt4IlGGVd3wiMEMBzSI4JxJRV66OZlHjv
	 CHhasiwPS0yw344QQRF9KnIYqVD1IIGAODCT2ko/lDKCSZWXKlzg+iSaclRCh7ITT06MP
	 LPzMLdN5H0y9Fvgc8wOdMPHtmGp8SLMuJDPILkcJoh1vr+8pNkv7kiYFL67xi/MvVmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609598;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=GvZTS5lPnaMJgtMGoMxF33+TRZeyDWKHKqBpvw0r9Ic=;
	b=lUCAkv6xV3mJD49tmnxJVNeUXPFkBmbwzvwjRw+NcX8mBvpUwx1x59cWbDbQgilmdhz2
	 MQ2ScWpMBSh60+/OyYHOL5zePXe/VQgjgYwG1ZPyBmKKKSJtpwl4KEOJlsLVVIyEk9QPs
	 CIBLTV0mIj0vHlpNAEf7ReNLN5MAp8k+VBrchRTRiXjhNDim+ecFzp/qafHiv5xAMn4Ww
	 BhSVpGWqlCcUdR5psvWB8j4meNTvnpJfIEyroVgR8JofoaD6oZMMEteBb/9YO/S1dXWxJ
	 IzYTDrWthi+2hQv6qSo5yewOkEmmw0bvDCIK3ewzvX7xFG2AE0qyfaCCfNz8p6xTlcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oZDNhgBH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=buK8cbVl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TVJyWYW1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RftoE40g;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5ED606A324;
	Mon,  2 Nov 2026 08:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F5ED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oZDNhgBH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=buK8cbVl;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TVJyWYW1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RftoE40g
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 515CB1FB2C;
	Mon,  2 Nov 2026 08:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793609596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvZTS5lPnaMJgtMGoMxF33+TRZeyDWKHKqBpvw0r9Ic=;
	b=oZDNhgBHiWSgsl9HPAW2sJ+4sHVd3iDfwT96T9Zm8CMuPX+m44LAdtYIwwCMaTm9M13oDd
	0V4ib7hfYqjZHGL8DCeLKW2veRnyYLPXGGG2BvSrmp7tOIZ12BLrYI4MWGl0orXmfl7byO
	nD475H77cCLiO5GRUQ8RxV8UAzkPAIg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793609596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvZTS5lPnaMJgtMGoMxF33+TRZeyDWKHKqBpvw0r9Ic=;
	b=buK8cbVlUR2yhDENDGcAOPgCpzwr0yjNUG0e7dvU2k4wq0EM3d75BWltu8bry12lZjvM+w
	TldWC8gP4V62f+Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793609595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvZTS5lPnaMJgtMGoMxF33+TRZeyDWKHKqBpvw0r9Ic=;
	b=TVJyWYW16zohV9KRwfF4ho0qjOJ2pK1vN/Skud9K9GFlW4ThiF0zWx35HMrF4HL92/GohJ
	3JJce4uDiWbF/jcoPiFMT64iA2dGBbNkwXHV4vc/QM+MfuAed827v8Aae8SGH/BD2x4k4d
	kyruy3284QQr04ekHVAUdMLEt8DUlKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793609595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvZTS5lPnaMJgtMGoMxF33+TRZeyDWKHKqBpvw0r9Ic=;
	b=RftoE40gjpEPC2fINJjpHUJKD1r/3zmMDR0ZX1SGBz8Ea9CETR5QhluuICJi1tBfhJtlLk
	FUmsd3STfiu5pTAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 042FE134B8;
	Mon,  2 Nov 2026 08:53:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wx4HMnpP6Gp4SwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Nov 2026 08:53:14 +0000
Date: Mon, 02 Nov 2026 09:53:14 +0100
Message-ID: <87jymv4nt1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/4] ALSA: usb-audio: Add dB scale quirks for AB13X and Xiaomi Speaker Mini
In-Reply-To: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
References: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,rong.moe:email]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 19 Oct 2026 22:18:21 +0200,
Rong Zhang wrote:
> 
> I recently got two devices with insane volume control, so I tried to
> measure their volume mapping and add dB scale quirks for them.
> 
> PATCH 1 collects the code snippets for dB scale override into a helper
> function, with unified info and warning messages, and also deconflicts
> playback dB scale quirks of DragonFly.
> 
> PATCH 2 applies the MV-SILICON linear volume quirk only to the affected
> mixers, instead of the whole device.
> 
> PATCH 3 adds dB scale quirk for an AB13X variant.
> 
> PATCH 4 adds dB scale quirk for the Xiaomi Speaker Mini.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Rong Zhang (4):
>       ALSA: usb-audio: Unify dB scale override
>       ALSA: usb-audio: Apply MV-SILICON linear volume quirk per mixer
>       ALSA: usb-audio: Add dB scale quirk for an AB13X variant
>       ALSA: usb-audio: Add dB scale quirk for Xiaomi Speaker Mini

Applied to for-next branch now.


thanks,

Takashi
