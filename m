Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461203;
	b=GP0rQVr/QqHtXSTKlgxW29vW3ChMWA534WXPrAInLsfpebTbF+f8NSCMi2SsXkVMe3RJ
	 0ljyzvUVVQ98sx1SbJaBijGCZVysOqhXxjxZ5GEO0HLt3NwtnltklOALYNa7BYypThoFV
	 J6P2tkZzTCx7vnOrOcW1FABxQUkgVqAUkYWxYX2tsKL7aaUd7M+OkJvcMBhIKhofyGQD5
	 5MuafAeJ9ofna0sbPNyzpZC5u9ZZio1GJ/vzaobeEwiPOpD8A7fTgP6oF+6dYojdc7fnx
	 lmFi/Mz3DK/W2ukTkPUF7Mlm1DjmSqa3Jm/2SG+qVhgylagTIX3//TyTDQ1Dne4ThfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461203;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=zMB+mWff2A0n0ceUIh0eWG6jkh7oYH1n8cB3sLdOLEo=;
	b=E+aTsPythoxqMsuj3eqtOSOSk8QoZXHBRHLkw1R/impDYpik5rgLMmSn2Ow+IkdUvPrK
	 +g6VZY1yylitH1qycVd/xw5JbOexQY/BZ7smdEeq9J1AluSnB3BEp1lHlqoZJvFQ4jmr3
	 460BKXKjErTnoBwCHO6gnjeyUSyfBa3lApBY7GJcDb45N/c1lmgV3fqx3NctaHJHeWwzr
	 9VTf1X/nW3I9noEj5jqRyl6ktaf/zQPEWOodBnTEcrADbisVZWm41++qvhQCxelIQEWiQ
	 +mmyJGA9oZPYsNNoj2duCqB48u4RgP0wZYPP4UWN98UMn+IVbbGcpEqgCsIyJEn7+Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=awKwKaC4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="9mLEwQ3/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=awKwKaC4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="9mLEwQ3/";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3C1606A323;
	Sat, 31 Oct 2026 15:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F3C1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=awKwKaC4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9mLEwQ3/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=awKwKaC4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9mLEwQ3/
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 30A4C1F749;
	Sat, 31 Oct 2026 15:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793461201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMB+mWff2A0n0ceUIh0eWG6jkh7oYH1n8cB3sLdOLEo=;
	b=awKwKaC48wpCIfhTKxAH8W+XzLYV4MBBroiHlQivB0Dsi27Bo/3ePgfYbWHBoC/3WAAzH8
	2fr0Ql49wV4jBHpKwut1d2e3GZt+8iJH/Q4lmgco0iyWOIq7OP8MKMkuCsB3E0auYM4dxY
	XmisTYcxcPTvISKNdW5rdWYRrCOY/7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793461201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMB+mWff2A0n0ceUIh0eWG6jkh7oYH1n8cB3sLdOLEo=;
	b=9mLEwQ3/5u7dBycrF0S/KPTSlcCU1G0Y9ndwor5gV37Ln4R6jltv4BXqLevOzpic2AzXve
	VG2lMd3JGj+mzaCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793461201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMB+mWff2A0n0ceUIh0eWG6jkh7oYH1n8cB3sLdOLEo=;
	b=awKwKaC48wpCIfhTKxAH8W+XzLYV4MBBroiHlQivB0Dsi27Bo/3ePgfYbWHBoC/3WAAzH8
	2fr0Ql49wV4jBHpKwut1d2e3GZt+8iJH/Q4lmgco0iyWOIq7OP8MKMkuCsB3E0auYM4dxY
	XmisTYcxcPTvISKNdW5rdWYRrCOY/7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793461201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMB+mWff2A0n0ceUIh0eWG6jkh7oYH1n8cB3sLdOLEo=;
	b=9mLEwQ3/5u7dBycrF0S/KPTSlcCU1G0Y9ndwor5gV37Ln4R6jltv4BXqLevOzpic2AzXve
	VG2lMd3JGj+mzaCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DCC7D13432;
	Sat, 31 Oct 2026 15:40:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6KdmLNAL5mpLGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 15:40:00 +0000
Date: Sat, 31 Oct 2026 16:40:00 +0100
Message-ID: <87cxspswtr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cian Ruane <cian.ruane1@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Huawei MateBook X Pro 2020
In-Reply-To: <20261027234732.6893-1-cian.ruane1@gmail.com>
References: <20261027234732.6893-1-cian.ruane1@gmail.com>
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
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 28 Oct 2026 00:47:32 +0100,
Cian Ruane wrote:
> 
> The Huawei MateBook X Pro 2020 (MACHC-WAX9) has a combined headphone and
> microphone jack, but the BIOS marks pin 0x19 as unconnected (0x411111f0).
> As a result the headset microphone is missing and only the internal
> microphone is available.
> 
> The mic mute LED on the F7 key does not follow the capture mute state
> either. The machine uses the PCI subsystem vendor ID 0x1e83 (Huaqin)
> rather than 0x19e5, so the Huawei vendor-wide quirk that sets up the LED
> does not match.
> 
> Add a fixup that configures pin 0x19 as a headset microphone without its
> own jack detection and chains to ALC269_FIXUP_HEADSET_MODE, which enables
> headset mode and the mic mute LED. This is the MACHR-WX9 fixup without
> its other pin overrides. The remaining BIOS pin defaults work, and pin
> 0x14, which the MACHR-WX9 uses for a second speaker pair, produces no
> sound on this machine. Configuring pin 0x19 with presence detection
> (0x04a11040) does not work either: the jack state drops to unplugged
> while the headset is still connected.
> 
> Tested on: HUAWEI MACHC-WAX9 (MateBook X Pro 2020), BIOS 1.26,
> Ubuntu 26.04 (kernel 7.0.0-38-generic, with this patch backported).
> 
> Signed-off-by: Cian Ruane <cian.ruane1@gmail.com>

Applied now.  Thanks.


Takashi
