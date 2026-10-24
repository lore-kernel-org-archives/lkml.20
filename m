Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792828788;
	b=zDsPX/l644oPvMcKs4Ioh9WAgdBfLH7ZdkZkGhpfcsl3wq2W2VBHeQpvUpw122g/VF/2
	 eMWVMDE++kl62Vxhniez/PdVB7PU8T9XQxNt4a7tZbCGEQIjpntmcp8OrHbSowUfI+Hkr
	 asAVHKOHzk8gD8ns320gt779XUQNcMu+zNtc9ae1+Te4M4FA+zfXIn5vqclhnQ8Vpv/qn
	 3DL5kww6wC6DSIhtW6Cx68YRffSQhMUO2kZPCdbT46kXwAmgC1mL1xzU9SDTu80mT68Bo
	 B5DU1Ef+jbdumhdyXVLs5H84FU/gM+MPuL64aZ+hhup+o2jxMsG/cxIsylzU1Pv3utw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792828788;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=hz8Ys8AWEAetFk1DxacoAKyJ8vI/KH9iUNxe4Sm8xio=;
	b=pBtov+qsQOHXCR10RdLJllYgmENqgu4OmqmQLyumK4wC7Z3K4m60huo0WGZhd+r3BS/Q
	 a4MnoqCOM9mYBkyiTW31uhX3q68sVGKpP/Eb20v7tZwTiwCZjExFL8rXboLxbb3+d/bwG
	 mTxddtC+ehklxXPFniihITkMivI7Bg8nx4x4ZEiVCT+6q/Max+7ZHAF//G6j8YGNUwo4s
	 c3Aggtzhf3sE8hw7sAND2fUJuoDsACGN0SuSg0O8kisctRvYkswrbY46t7IzxL9BDLTVc
	 WEjOudWNHL/IJFt+yQp9zsqqC1fd2shlTq0zfZp4g1wDIPj1jwBIOsIB6nyeAmSA+dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=v706K8Q+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3p9NEqFq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=v706K8Q+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3p9NEqFq;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A0B606A31A;
	Sat, 24 Oct 2026 07:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=v706K8Q+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3p9NEqFq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=v706K8Q+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3p9NEqFq
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A90621F44E;
	Sat, 24 Oct 2026 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792828785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hz8Ys8AWEAetFk1DxacoAKyJ8vI/KH9iUNxe4Sm8xio=;
	b=v706K8Q+2UZeiXKIgWp8fdAYk25Ybx7Mkm+S6/JuVA3AOcRwEC9TqdvVXUsMR6woZV5jN7
	Gg//HAXKWhfCRSOUZIY9uKyopU9r5W232a+sG44I+n3GfajiqKH/6JBCNUJ6imCG6NQZCw
	0aluVc+kSSOEqRIrAU4DcWCYyQyfesY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792828785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hz8Ys8AWEAetFk1DxacoAKyJ8vI/KH9iUNxe4Sm8xio=;
	b=3p9NEqFqXAe3cagAGXPlB2PiV06MP8a7HjbQHy7jHVe54iDr2cFiAEWGrcxOaCX0OraW/q
	gwdw7c9AlVCIUHBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792828785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hz8Ys8AWEAetFk1DxacoAKyJ8vI/KH9iUNxe4Sm8xio=;
	b=v706K8Q+2UZeiXKIgWp8fdAYk25Ybx7Mkm+S6/JuVA3AOcRwEC9TqdvVXUsMR6woZV5jN7
	Gg//HAXKWhfCRSOUZIY9uKyopU9r5W232a+sG44I+n3GfajiqKH/6JBCNUJ6imCG6NQZCw
	0aluVc+kSSOEqRIrAU4DcWCYyQyfesY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792828785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hz8Ys8AWEAetFk1DxacoAKyJ8vI/KH9iUNxe4Sm8xio=;
	b=3p9NEqFqXAe3cagAGXPlB2PiV06MP8a7HjbQHy7jHVe54iDr2cFiAEWGrcxOaCX0OraW/q
	gwdw7c9AlVCIUHBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A1EF134EA;
	Sat, 24 Oct 2026 07:59:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kwuvA3Fl3GqfQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 24 Oct 2026 07:59:45 +0000
Date: Sat, 24 Oct 2026 09:59:44 +0200
Message-ID: <87ld7n8r67.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Will Bush <will@willbush.dev>
Subject: Re: [PATCH] ALSA: usb-audio: Avoid applying boot quirk for Behringer UMC204HD
In-Reply-To: <8075e4d5ed4b5523a088840c5574d4c0e49307ff.camel@irl.hu>
References: <20261019102347.2425406-1-tiwai@suse.de>
	<8075e4d5ed4b5523a088840c5574d4c0e49307ff.camel@irl.hu>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:email]
X-Spam-Score: -12.30

On Fri, 23 Oct 2026 22:04:02 +0200,
Gergo Koteles wrote:
> 
> Hi Takashi,
> 
> On Mon, 2026-10-19 at 12:23 +0200, Takashi Iwai wrote:
> > There have been reports about a regression with the recent boot quirk
> > for Behringer devices; it broke UMC204HD models(1397:0508 and
> > 1397:0509).  The quirk was to just run usb_get_descriptor(), so I
> > expected it rather harmful, but in this case, it doesn't look so,
> > resulting in an error like 'failed to read device descriptor: -110'
> > that leads to a fatal probe error.
> > 
> > As a quick workaround, skip the quirk for those UMC204HD models.
> > 
> > Fixes: b5c4823cf3e4 ("ALSA: usb-audio: Apply boot quirk for Behringer models generically")
> > Reported-by: Will Bush <will@willbush.dev>
> > Closes: https://lore.kernel.org/45162613-2802-401c-84c9-742f9c8c68e6@app.fastmail.com
> > Closes: https://bugzilla.suse.com/show_bug.cgi?id=1285896
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/usb/quirks.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> > index 4fadb1fdcdea..4ac4aef47dd7 100644
> > --- a/sound/usb/quirks.c
> > +++ b/sound/usb/quirks.c
> > @@ -1790,8 +1790,15 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
> >  	}
> >  
> >  	/* Behringer devices may need explicit device descriptor read at boot */
> > -	if (USB_ID_VENDOR(id) == 0x1397)
> > +	if (USB_ID_VENDOR(id) == 0x1397) {
> > +		/* the quirk seems breaking on some Behringer devices */
> > +		switch (id) {
> > +		case USB_ID(0x1397, 0x0508): /* UMC204HD */
> > +		case USB_ID(0x1397, 0x0509): /* UMC204HD */
> 
> 0x0509 is the UMC404HD
> 
> https://linux-hardware.org/?id=usb:1397-0509

You're right.  I'll correct it.


thanks,

Takashi
