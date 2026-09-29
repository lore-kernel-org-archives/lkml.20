Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF8C3E411C;
	Tue, 29 Sep 2026 12:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684869; cv=none; b=ib17hW6+YJWPq1TSvUSgG1cyUxy3ZusR6w6XAjTgPMP9LpQ6PVTOvOR+4NYkVm5iB/dASFcxUKtgBcvUJGH43GmC3FbrMbHnNWb52IaRuPt4UCnbtY4NhiG6Vd/Nt+lgiSeK3H9M0MnkpApXRshmyyHFijZgFrS4vnlIqoKbul0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684869; c=relaxed/simple;
	bh=j2B+3PrZZvPV0gDji0jtQZW+Jv/YG4sLWf8Ud7I/ETY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FGsy2zYM5WN79Ug7/6apzOfJ9xyAujse7E5m7hOGngB/t87dJKJcAsptpp0cztGP5S/XVxaEWogXTVnOA+mK5SRhGCeig4FwWQ9JzG7vfjkkJ5+pScHezs6u6uAK2u/ukN5Y5Iyxk7Y/gsP3YGnMAOShxmLh0p29tS/7pAmle4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rsCI+2xR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qOkfzu1/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CDNfGP2M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k15mHuSV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rsCI+2xR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qOkfzu1/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CDNfGP2M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k15mHuSV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3762B1F38E;
	Tue, 29 Sep 2026 12:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790684866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oo+yX2qEouSa4HHt9zfHx6ZVkG7hFzOAMCkJwxZIfZA=;
	b=rsCI+2xRsNJNQ8W9ytgzlHaY6dFK0O+oaujzZuIlkW/VKP/XgBZO+5TZ2ymTrXr8hzxVKj
	iBulfbZvH3QWnK4hmqsAdu1CTvo81XU8aYcJbg/qrwv/9XsFu1DOJX3Rwktu8bOnQ9U/sq
	MArSBeYolNRYD+ZGUZw578K21kG7zsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790684866;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oo+yX2qEouSa4HHt9zfHx6ZVkG7hFzOAMCkJwxZIfZA=;
	b=qOkfzu1/ForBRB9/3Wq7jY/ROqN4b+HJYHOCdjavMqwVIxgUDxDTIgs11KMdA4YevlmgvJ
	/qOTx96ZDwrzX5Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790684864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oo+yX2qEouSa4HHt9zfHx6ZVkG7hFzOAMCkJwxZIfZA=;
	b=CDNfGP2Md40UDbXy+tWESnWc8L1Nk1o3dpfWVNEe9fVBEeBqnDX6A88A1O/K6y9KW3rLjT
	bH/0EyV0lk46uOro6Jzv4YIttQPsSuQ2U8hgCdPKwAW6PvWsgLkYMDZx6FxV2as8CZEkjo
	CyCjz3d/k9l9tSZGgHGo1gKCfISH7Fg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790684864;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oo+yX2qEouSa4HHt9zfHx6ZVkG7hFzOAMCkJwxZIfZA=;
	b=k15mHuSVkXOk+wEjCC8QE6Cbie+MY7LbCuVAxefbFuShhNSTStwih6N4Kmp4OUfUKVe9PO
	r7ONraziCdbpPjAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 005D7133F1;
	Tue, 29 Sep 2026 12:27:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id M6ecMb+uu2oLWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 12:27:43 +0000
Date: Tue, 29 Sep 2026 14:27:43 +0200
Message-ID: <87pkxw1buo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jan Lentfer <jan.lentfer@web.de>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Apply boot quirk for some Behringer models
In-Reply-To: <9e2b7315-6216-46cf-804d-f5a6cde5edb4@web.de>
References: <20260929120309.1460348-1-tiwai@suse.de>
	<9e2b7315-6216-46cf-804d-f5a6cde5edb4@web.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[web.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[web.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 29 Sep 2026 14:19:45 +0200,
Jan Lentfer wrote:
> 
> > Jan reported that a few Behringer devices became broken since the
> > recent optimization to avoid usb_string() call at probe time at the
> > commit b364a0d23cae ("ALSA: usb-audio: Use strings in struct usb_dev
> > for manufacturer & co").  Interestingly, the devices seem requiring
> > the explicit descriptor read at probing time, and the optimization
> > above dropped it.
> > 
> > There is already a boot quirk for another model, Behringer CM1A
> > (1397:1234), that adds a device descriptor read, and this seems
> > working for them, too.  So just apply the same boot quirk to those
> > affected models:
> >   - Behringer K-2 Mk II (1397:1230)
> >   - Behringer Kobol Expander (1397:1249)
> >   - Behringer 2-XM (1397:1256)
> > 
> > Fixes: b364a0d23cae ("ALSA: usb-audio: Use strings in struct usb_dev for manufacturer & co")
> > Reported-and-tested-by: Jan Lentfer<jan.lentfer@web.de>
> > Closes:https://lore.kernel.org/e7087d42-5e74-4d85-b1c5-b11eff235d41@web.de
> > Signed-off-by: Takashi Iwai<tiwai@suse.de>
> > ---
> >   sound/usb/quirks.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> > index 294c7026b93c..de6a82a42eb7 100644
> > --- a/sound/usb/quirks.c
> > +++ b/sound/usb/quirks.c
> > @@ -1702,7 +1702,10 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
> >   	switch (id) {
> >   	case USB_ID(0x07fd, 0x0008): /* MOTU M Series, 1st hardware version */
> >   		return snd_usb_motu_m_series_boot_quirk(dev);
> > +	case USB_ID(0x1397, 0x1230): /* Behringer K-2 Mk II */
> >   	case USB_ID(0x1397, 0x1234): /* Behringer CM1A */
> > +	case USB_ID(0x1397, 0x1249): /* Behringer Kobol Expander */
> > +	case USB_ID(0x1397, 0x1256): /* Behringer 2-XM */
> >   		return snd_usb_cm1a_boot_quirk(dev);
> >   	}
> >   
> > -- 
> 
> 
> Hi Takashi,
> 
> thanks a lot for the quick patch!
> 
> One thought on the scope: Behringer sells a large number of synths and
> drum machines that seem to share the same USB-MIDI firmware platform
> (the ones managed by their "SynthTribe" tool). The three models in the
> patch are simply the ones I tested first. Meanwhile I checked another
> one I own, the CAT (1397:1224): it shows exactly the same stall, and a
> single GET_DESCRIPTOR(DEVICE) from userspace fixes it as well. With the
> CM1A that makes five different 1397 products needing the same wake-up,
> so I'd expect more models to be affected and to show up one by one.
> 
> Since the quirk is just one extra GET_DESCRIPTOR(DEVICE) at probe time,
> which should be harmless for any USB device, would it make sense to
> apply it to the whole vendor ID 0x1397 instead of individual product
> IDs?

Makes sense.

> For reference, what I have seen so far (7.2.7/7.2.8, device hot-plugged,
> no wake-up in place):
> 
>   1397:1224  CAT               stalls, fixed by GET_DESCRIPTOR(DEVICE)
>   1397:1230  K-2 MK II         stalls, fixed by GET_DESCRIPTOR(DEVICE)
>   1397:1249  Kobol Expander    stalls
>   1397:1256  2-XM              stalls
>   1397:125f  PRO 800           fine
>   1397:12a7  Grind             fine
>   26a0:0040  Neutron           fine (different vendor ID)
> 
> So it looks like an older firmware generation is affected and newer
> models are not, but that's only a guess from these few devices.
> 
> Either way, a vendor-wide read would not hurt the ones that don't
> need it.
> 
> Also, to be precise about the Tested-by: I verified the fix by issuing
> the same GET_DESCRIPTOR(DEVICE) request from userspace, not with a
> kernel carrying your patch. I'm happy to test the patch itself if you
> want the tag to reflect that.

Let me respin the fix patch.


thanks,

Takashi
