Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803147;
	b=Y5oEDeXhLNilhJGrVCn0DievhqjOKkhXuV/CtDHVSv8U6tf72T6QubLUwFSMOx1rhTPq
	 qagTM6CpVUI31piVG/yi8gbV0vkt58+rM7k88e669ZyO8XNMPn14ImYhvVm8Tdy3I15va
	 HxKJ5zTA8zmO2JmnM1xY0CnO/HB/OKXpS7aR3CJep//rzW/ii3sJCFh6LE0RfW0CrfGyS
	 5GV2DCWpd5OwRgK2zXhDV0s7QvSPFENKrWIXVyerV9FpCPVQMHZqE2sNRDsanF/+kgQbM
	 76j1ewZ5VHmXpKD6kzDsVcOtTncfk+xIq/4IsE0rz7rW3rt4Tap4My37D8JM9M114GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803147;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=243108GKh0p7KYSRfkYo8sm/Qy/fjodfsZIUO1/CHF8=;
	b=NTqdAtQH4wJXtb7bO/NOGoODtGtiExLgivm+9seL24u03exBWTfZZxBFGKVUAbtSCOQT
	 E7IAj4quiDaZyhH0P9p8WpWvJU41f3LEs2J2z5JYIFdGhuhq5weNK0CEwusgrfehMq+XI
	 hepCoJGj8ESfeexJWlgYP3kxWlJfPbFlRj+fYmnBkAr7xt/zjrWofnq1lGKQzmvieF/f5
	 HANduQsBZ9F3s6WhA4NTP5t/IuckKhp3vl8CPGGoHa8AavcupElbcgm4rlC3A0+fE9URu
	 mqywfLeYo9xZtn5zKJEpq6sKCAvo9QoczESowUoW2mI5ka4MQ+hrM1Sht99XP9DXA1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="SzGVc/c/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QA3FBVEd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="SzGVc/c/";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QA3FBVEd;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD6606A31B;
	Wed,  4 Nov 2026 14:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7DD6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SzGVc/c/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QA3FBVEd;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SzGVc/c/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QA3FBVEd
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A830821DB3;
	Wed,  4 Nov 2026 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=243108GKh0p7KYSRfkYo8sm/Qy/fjodfsZIUO1/CHF8=;
	b=SzGVc/c//h/A9P9BClwghb/llgBlS2CPCY/ZMGPo7P8jMZr0bMgfviqRY84hw64lzuHZ5y
	weKRRjacfydZ/ubGS7eNar3ZQwwObh1FbxmfLuNJcxRLPqZrZ6/e40jZXwYPvPveJ3YH/q
	cNktyLGXQOSqXM7xffNBLyUcnacfVSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803144;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=243108GKh0p7KYSRfkYo8sm/Qy/fjodfsZIUO1/CHF8=;
	b=QA3FBVEdFmjiFV7z97QWXiydeqm4bepMezeybNYyd2G32VwT0ZG/+ElufEVRXFDKdt8N3S
	Z6Q73b0wRpemt0Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="SzGVc/c/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QA3FBVEd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=243108GKh0p7KYSRfkYo8sm/Qy/fjodfsZIUO1/CHF8=;
	b=SzGVc/c//h/A9P9BClwghb/llgBlS2CPCY/ZMGPo7P8jMZr0bMgfviqRY84hw64lzuHZ5y
	weKRRjacfydZ/ubGS7eNar3ZQwwObh1FbxmfLuNJcxRLPqZrZ6/e40jZXwYPvPveJ3YH/q
	cNktyLGXQOSqXM7xffNBLyUcnacfVSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803144;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=243108GKh0p7KYSRfkYo8sm/Qy/fjodfsZIUO1/CHF8=;
	b=QA3FBVEdFmjiFV7z97QWXiydeqm4bepMezeybNYyd2G32VwT0ZG/+ElufEVRXFDKdt8N3S
	Z6Q73b0wRpemt0Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 303DB134F0;
	Wed,  4 Nov 2026 14:39:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3KxbAohD62rReAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 14:39:04 +0000
Date: Wed, 04 Nov 2026 15:39:03 +0100
Message-ID: <8733tgveyg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: raoxu <raoxu@uniontech.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	luiz.von.dentz@intel.com,
	brgl@kernel.org,
	pengpeng@iscas.ac.cn,
	pmenzel@molgen.mpg.de,
	u.kleine-koenig@baylibre.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: intel8x0: keep AC97 PCM descriptors for ICH4 capture
In-Reply-To: <856CCC6453C59FC5+20261104082242.3987826-1-raoxu@uniontech.com>
References: <856CCC6453C59FC5+20261104082242.3987826-1-raoxu@uniontech.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: A830821DB3

On Wed, 04 Nov 2026 09:22:42 +0100,
raoxu wrote:
> 
> From: Xu Rao <raoxu@uniontech.com>
> 
> When S/PDIF uses the AC-link, spdif_idx is negative and the AC97
> PCM assignment drops its last descriptor.  On ICH4 this leaves five
> entries, but PCM2IN and MIC2 still use entries four and five.
> Opening MIC2 then reads beyond the allocated descriptor array.
> 
> Keep all six descriptors on ICH4 so the capture stream indices stay
> valid.  The S/PDIF descriptor occupies its fixed position but does
> not create a separate hardware PCM when S/PDIF uses the AC-link.
> Other controller types retain their existing descriptor counts.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>  sound/pci/intel8x0.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
> index 339024182a26..75db97501c72 100644
> --- a/sound/pci/intel8x0.c
> +++ b/sound/pci/intel8x0.c
> @@ -2291,7 +2291,8 @@ static int snd_intel8x0_mixer(struct intel8x0 *chip, int ac97_clock,
>  	i = ARRAY_SIZE(ac97_pcm_defs);
>  	if (chip->device_type != DEVICE_INTEL_ICH4)
>  		i -= 2;		/* do not allocate PCM2IN and MIC2 */
> -	if (chip->spdif_idx < 0)
> +	/* ICH4 PCM2IN and MIC2 still need entries 4 and 5. */
> +	if (chip->spdif_idx < 0 && chip->device_type != DEVICE_INTEL_ICH4)
>  		i--;		/* do not allocate S/PDIF */

I'd rather move the spdif_idx check into the if block above, i.e.

  	if (chip->device_type != DEVICE_INTEL_ICH4) {
  		i -= 2;		/* do not allocate PCM2IN and MIC2 */
		if (chip->spdif_idx < 0)
	 		i--;	/* do not allocate S/PDIF */
	}

so that it's clearer.
If it's OK, could you resubmit with it?


thanks,

Takashi
