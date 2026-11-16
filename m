Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831910;
	b=0w9yerHmBDxjvlFSPbuLVZoJZTlD6WsW1/V04uF9AdC0NNUY0O9nJJobKdd7mayE8kJJ
	 aEPSF02WI/eGgJKb19W0zS18laxNqYqXToTjW/9W6p/jYSx0U7vuljqayJxR6w5b067Tv
	 qmiRKuUioJVgIWT1HwrWzTLCpW1UaqgcLNeAAQb5m/Ov0HbcHx5bYoW0qdZ73S7BiHBnM
	 zwAwWAP0pddoS01yqUrkgbULmHRGajzP1P5CZlpYxu1hEP130sKdBzFdTzYsxRlUWIfR9
	 jF+Rydyv3aFDeR1J/gNmsOgUTwTKkhTRr0jXhxuk5E0gre9b3A4vZ4Icu4d/7tpd6Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831910;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=oIsCiYO41Z/uGBZ4XLwF06pD8GYIXinrsDJnv8EiOi0=;
	b=MX7pvai7djSmlJySxQF7rFnxTxtx10gW7qqrNoBmcc5egjTg8HjDsEt5kMo9wxtGkBzX
	 EpQS8GvjOycI9CMD/XMRqjmuHEnpqcaNpUUCAPIzMMXE93jMII+W8b4Fqkmog8DRmRFWV
	 sDwCPl7w+v+mD4ioRwGi37KO++YZSscmJ8kJFYm19YKXMtSrA+ML4ggWl2lL36REN61Sl
	 vxb+ZwKabtVma/08MPpp8Y08CBei0W7rKe//wj28NPWAC+nrHd0P6FprsnJFzFGUcIUYO
	 3zEH1pR7NAO+YpdNQlxk6UPKuF/9FO1rBtnuMcdOVMX1Soy7JBAjTu+Yl+p0avDIHzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="g/c7pRd6";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Plm3FqYL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=dksJdIMx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dQVDTq1T;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860F7606A884;
	Mon, 16 Nov 2026 12:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 860F7606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g/c7pRd6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Plm3FqYL;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=dksJdIMx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dQVDTq1T
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 97F191FBB5;
	Mon, 16 Nov 2026 12:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794831905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oIsCiYO41Z/uGBZ4XLwF06pD8GYIXinrsDJnv8EiOi0=;
	b=g/c7pRd6MkSQoiLKSaxsthQAxK7rBAYQEkxMDRweDBimiYxqEjUvz4GT1ZVNmb4dHHIAgH
	cUBUm9aSwxyT2PKzvs9/yhQO2lfR7SomZpjNxxwVwliCtlDt/SK3fMU9i1IUmAC9brXFCK
	Q4Xx9VjIUoNz+ZzfhTaXOAv4Cjyh6Ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794831905;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oIsCiYO41Z/uGBZ4XLwF06pD8GYIXinrsDJnv8EiOi0=;
	b=Plm3FqYLaRmzL2GsQ9HJou3IclOzyzOpCXQWDNeQKCp65HTt4+BaTmVKulCM3cBPV71uRg
	MSkylbxEgEd4b+Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794831904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oIsCiYO41Z/uGBZ4XLwF06pD8GYIXinrsDJnv8EiOi0=;
	b=dksJdIMxscb7WkjoEYPxBkxTFWzDeWRDl7FIlRXs1tgf3X8FNBIuxZLn970pilg0kpWunP
	aYEgQ2eK+lJSF2ujroKP2my4dbP4afeBG1Dqqj2VYGlU3KTp/4oJmcLHBzq5daP2oJfgrk
	JIXSV9Q5DJVbHiVVk71z4+os5OpyPNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794831904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oIsCiYO41Z/uGBZ4XLwF06pD8GYIXinrsDJnv8EiOi0=;
	b=dQVDTq1TdS4lx+9fQJ721aJ5wX6qrhWCDP2MXe5vFH5izvfSiPbWSI/1BpF65dpz/UWuqd
	jeqOevV5c06x0FBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 236711334C;
	Mon, 16 Nov 2026 12:25:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TmoxOR/2+moaZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 12:25:04 +0000
Date: Mon, 16 Nov 2026 13:25:03 +0100
Message-ID: <8733t1ynds.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sungwoo Kim <iam@sung-woo.kim>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dave Tian <daveti@purdue.edu>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ALSA: hda/realtek: fix missing chained flag in fixup
In-Reply-To: <20261115132215.4084031-2-iam@sung-woo.kim>
References: <20261115132215.4084031-2-iam@sung-woo.kim>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sung-woo.kim:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, 15 Nov 2026 14:22:15 +0100,
Sungwoo Kim wrote:
> 
> The fixup specifies a chain_id but does not set the chained flag,
> which prevents the chained fixup from being executed.
> 
> Should chained be set to true here?
> 
> This was identified through static analysis and has not been tested
> on actual hardware.
> 
> Signed-off-by: Sungwoo Kim <iam@sung-woo.kim>

Interesting, and yes, the flag should have been set to make the
chain_id effective.  OTOH, those entries are all pin-config updates
for Loongson & co, and ALC269_FIXUP_DMIC is also the pin-config
update, so I guess your change is superfluous or breaking.

I'd rather delete or comment out those dead lines unless anyone
actually hitting the problem, instead.


thanks,

Takashi

> ---
>  sound/hda/codecs/realtek/alc269.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 96fa8c2782bb..1be2e609c28d 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6431,6 +6431,7 @@ static const struct hda_fixup alc269_fixups[] = {
>  			{ 0x1e, 0x411111f0 },
>  			{ }
>  		},
> +		.chained = true,
>  		.chain_id = ALC269_FIXUP_DMIC,
>  	},
>  	[ALC269_FIXUP_CZC_TMI] = {
> @@ -6449,6 +6450,7 @@ static const struct hda_fixup alc269_fixups[] = {
>  			{ 0x20, 0x8000ffff },
>  			{ }
>  		},
> +		.chained = true,
>  		.chain_id = ALC269_FIXUP_DMIC,
>  	},
>  	[ALC269_FIXUP_CZC_L101] = {
> @@ -6467,6 +6469,7 @@ static const struct hda_fixup alc269_fixups[] = {
>  			{ 0x1e, 0x411111f0 },
>  			{ }
>  		},
> +		.chained = true,
>  		.chain_id = ALC269_FIXUP_DMIC,
>  	},
>  	[ALC269_FIXUP_LEMOTE_A1802] = {
> @@ -6485,6 +6488,7 @@ static const struct hda_fixup alc269_fixups[] = {
>  			{ 0x21, 0x03214020 },
>  			{ }
>  		},
> +		.chained = true,
>  		.chain_id = ALC269_FIXUP_DMIC,
>  	},
>  	[ALC269_FIXUP_LEMOTE_A190X] = {
> @@ -6497,6 +6501,7 @@ static const struct hda_fixup alc269_fixups[] = {
>  			{ 0x1b, 0x0201401f }, /* front lineout */
>  			{ }
>  		},
> +		.chained = true,
>  		.chain_id = ALC269_FIXUP_DMIC,
>  	},
>  	[ALC256_FIXUP_INTEL_NUC8_RUGGED] = {
> -- 
> 2.47.3
> 
