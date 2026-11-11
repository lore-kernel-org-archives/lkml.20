Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387579;
	b=IrRMQWoSh9o8ZpShz2Mc5NlvO9onT9UtiUXqx2JCh7boJYIgE4J6ssMUDxb74Q/AK7dn
	 aZC7WGgUhNPcUTu6JWfVEHB7kTUqdzYv1TBqGi9sPSY7IFsibJW5J4sN6IRHORmJ8Zre2
	 dUpdkkDv+Ii3YPqSSybHGbEaL8YdAcvnoaVCrTevclQKYCTwBpMDIBy3+KC3UqfpsTMf4
	 zu22YsV3ZS7EaOHEkYyrahV1hgwCvMpFZCWrFe7naDxeFK+kd5RG1xS+XnVTLXvEiKI0D
	 CaWiHEhpMyan1qznxTfVrcvy2a97Su0pRYGj1oV+uPGoovygr9oN9QHug2oYhGsTEIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387579;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=LDQuyOiuHxekSjqWrNCpSKW40pMKnmZ88mrAqiygNuc=;
	b=dafYr/9sz5jRB9x18qxxEqYBiL34bXzOf5Wy6eNrJU18m/ZdxfZ4ADDpkCb3a+bMPfXW
	 UE3aeI7CIjaVMEUqE137xD4n0HaaKNnKlKWYDjVyBnfHcOwHqKj6uWITp96UqvB2B+Dk7
	 Pee3UUOBMfmVodKEO5nkQwRpBzn/AaM8NQv6ljEC1w8k5CCsweJOxe0hrcmS8EWMzkeLo
	 Er7M21AK04GGMoPEGzzPAGubJxKUa27Z/xwfmW3cxA5UIuWMjoh5N7rli4Ph0nbONP8+M
	 vMd/Bl0Rz8BcOfii5s7QVtu0B3LwcU6dDrNcd1HiwEaBFr8SVAGWi+AqH4UjQdVGl/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C3jsijRf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZGDlRBPI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C3jsijRf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZGDlRBPI;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22320606A324;
	Wed, 11 Nov 2026 08:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22320606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C3jsijRf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZGDlRBPI;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C3jsijRf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZGDlRBPI
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5FA721F793;
	Wed, 11 Nov 2026 08:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794387577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LDQuyOiuHxekSjqWrNCpSKW40pMKnmZ88mrAqiygNuc=;
	b=C3jsijRfFCXU5Ujn7wqdPF+tvtV3pSI92aVsvmoOaDEy66GtWxjqMZ+lDqatQDx4eltEA9
	1jcSj1PEo9BGyWStodVYcpXGTQzQWCO6Rp6wuYConTbohuIStsZ1MzwoVIC58NSK6PMBHa
	2hpC9csdH5AiyL2tpCVjSdDX9Auv55I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794387577;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LDQuyOiuHxekSjqWrNCpSKW40pMKnmZ88mrAqiygNuc=;
	b=ZGDlRBPIVzH8nXaWT0seKB5vlZX06gpbwYzr7MH1MCq5fYd4XAj+bjhYz8+CO4ezxAqOYD
	CzO2pa21lmAZ8FCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794387577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LDQuyOiuHxekSjqWrNCpSKW40pMKnmZ88mrAqiygNuc=;
	b=C3jsijRfFCXU5Ujn7wqdPF+tvtV3pSI92aVsvmoOaDEy66GtWxjqMZ+lDqatQDx4eltEA9
	1jcSj1PEo9BGyWStodVYcpXGTQzQWCO6Rp6wuYConTbohuIStsZ1MzwoVIC58NSK6PMBHa
	2hpC9csdH5AiyL2tpCVjSdDX9Auv55I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794387577;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LDQuyOiuHxekSjqWrNCpSKW40pMKnmZ88mrAqiygNuc=;
	b=ZGDlRBPIVzH8nXaWT0seKB5vlZX06gpbwYzr7MH1MCq5fYd4XAj+bjhYz8+CO4ezxAqOYD
	CzO2pa21lmAZ8FCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D9741339F;
	Wed, 11 Nov 2026 08:59:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pWYDOXgu9GrANQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 11 Nov 2026 08:59:37 +0000
Date: Wed, 11 Nov 2026 09:59:36 +0100
Message-ID: <87jymju4jr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add micmute LED quirk for Acer Predator PHN16-72
In-Reply-To: <20261111021328.16153-1-faiz.faadhillah@gmail.com>
References: <20261111021328.16153-1-faiz.faadhillah@gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 11 Nov 2026 03:13:28 +0100,
Fa-Iz Faadhillah Ibrahim wrote:
> 
> fix micmute LED for Acer Predator PHN16-72.
> 
> Signed-off-by: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index a756e0076021..fa78a36bba5f 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7553,6 +7553,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC2XX_FIXUP_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
>  	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEADSET_MIC),
> +	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_ACER_MICMUTE_LED),
>  	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC2XX_FIXUP_HEADSET_MIC),

You see that there is already an entry for 1025:1731.
You should replace it with the new quirk instead of appending yet
another.

And, please elaborate a bit more.  You're changing the existing quirk,
so you'd need to show that there is no regression by your change.


thanks,

Takashi
