Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9513BAD9B;
	Sun, 18 Oct 2026 08:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792312547; cv=none; b=gsatbJygXLjO4FjGkYyzOptR6YxsUAP7SNaduK2OhahHrATuuWYuS7IDRjadTSRsDM2/RcpvVCG7Atf9NRiaKlkahcgE8CDDEcsc/Swj5JeDKYAp8Jk3bjVmrWXNDXlfGl74w/u0pCukudnkM2kxWktR6yYXWGOE/1/QmnHgi+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792312547; c=relaxed/simple;
	bh=LxxtwL5RmO4DNPbNrOtmfw8zCH5ZhW6ulbaalqq0uSQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nag0lanYO1ptuhSjCRmNPCF3CZ8iKEPZEzB7D79nvkWyMaMiIXEpd2x2U0WVpvhUrqvFavLJKEl4k8GT1EUcR3cV3rLb1vz7fyw086IRr60I9PLM/s86oO9FK9tmA7ePjm60WzYE1X+TvlWtdqLXUMnDVh+CWSnDkbtwQCa3qM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u0TL46fl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mq1Gs8G3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pxGsvJSj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=le3r3XY1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u0TL46fl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mq1Gs8G3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pxGsvJSj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="le3r3XY1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 26E8A1F45A;
	Sun, 18 Oct 2026 08:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792312537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s8vwiEkQQ0CoMnHEqsw/2AAHssUP6Sv5JLrMW3OmHEQ=;
	b=u0TL46flQkiJsdpYIceh6GhHFEoIpTZ4H+jJHD5U5zZ42+FJmFl1kcya1FUgQQhReAja8V
	ga275EgysTNZ//RmppXgYrJVF2OxPlSfNWn8mUDM5B8LQ3rHDvZY4ziBfgl4G0QdWyCw5q
	3NRLgvMWKh1zGaEiEsWFnx9TiJO66NY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792312537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s8vwiEkQQ0CoMnHEqsw/2AAHssUP6Sv5JLrMW3OmHEQ=;
	b=Mq1Gs8G3KC9IsZbQXJ8R2EiBXpta0VLEq5YyYBQqBMBTyQ3TVhulzmIIHETS+B7QhZ/UPy
	BzM5BAk5yhYpZ9Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pxGsvJSj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=le3r3XY1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792312536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s8vwiEkQQ0CoMnHEqsw/2AAHssUP6Sv5JLrMW3OmHEQ=;
	b=pxGsvJSj76znX1MUB5VmIWPflnEQaIbTuji5SaDVYAowGmXc6BpSzKeb6NrtqOqiZvm08u
	phdFcCxZRYusPLub+cGEMiQZT43QlMca56b+bPt74LiXiSt8RQMKq91DHdbWRlYPf5WyRu
	IrFTY2+lOcHQ6D4GfBPoU3BrmfKrU6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792312536;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s8vwiEkQQ0CoMnHEqsw/2AAHssUP6Sv5JLrMW3OmHEQ=;
	b=le3r3XY11xvOxxggzzvKp/UB85wWSVuEoqV97G8iC44yxOsxj7Ao9EJwDzDn6jDCro2yle
	D2Z4/L2hWaKArICA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96C1A132D3;
	Sun, 18 Oct 2026 08:35:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OUb3GdeE1GpASAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 18 Oct 2026 08:35:35 +0000
Date: Sun, 18 Oct 2026 10:35:35 +0200
Message-ID: <8733u31k4o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Keane Mbae <keanembae@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kailang Yang <kailang@realtek.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Eric Naim <dnaim@cachyos.org>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mic-mute LED quirk for the HP 245 14 inch G10
In-Reply-To: <20261017095132.20279-1-keanembae@gmail.com>
References: <20261017095132.20279-1-keanembae@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,realtek.com,kylinos.cn,cachyos.org,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Level: 
X-Rspamd-Queue-Id: 26E8A1F45A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Sat, 17 Oct 2026 11:51:32 +0200,
Keane Mbae wrote:
> 
> The HP 245 14 inch G10 Notebook PC (codec SSID 103c:8ba4, ALC236) is not
> listed in alc269_fixup_tbl[], so the codec falls back to the vendor-wide
> HP entry (ALC269_FIXUP_HP_MUTE_LED).  That entry only registers a speaker
> mute LED (hda::mute); no microphone mute LED class device (hda::micmute)
> is created, so muting the microphone never lights the LED on the F8 key.
> 
> On this model the microphone mute LED is wired to COEF 0x35 bits 2-3 (the
> same register as ALC236_FIXUP_HP_MUTE_LED), but with the opposite sense:
> 1 << 2 lights the LED and 2 << 2 turns it off.  Setting
> micmute_led_polarity = 1 makes alc_update_coef_led() write the level that
> matches the hardware.
> 
> The speaker mute LED (F5) keeps being driven through the HP_Mute_LED DMI
> string, exactly as the current fallback does.
> 
> Add ALC236_FIXUP_HP_MUTE_LED_MICMUTE_COEF_INV for 103c:8ba4.
> 
> Signed-off-by: Keane Mbae <keanembae@gmail.com>
> Tested-by: Keane Mbae <keanembae@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
