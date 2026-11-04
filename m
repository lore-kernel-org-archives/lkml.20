Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777295;
	b=fnJVIHZSTLHy+UIp1SAr1tKMkHgmhb3pCtY61U1Ew0nBW1UC1G4LHDkHNQ7RHsuuGwSh
	 oRKojgSiV0FnVBbyoXhLgiJ4VrstCY0dAx42WtUZvACIRAFlCXjgt29BrwHtA9Kra2YIs
	 7Ozj3VxWJRx9vOX/vNVJnGlkrLxsE1b2Y8eep5rOF0IGJQanMZjvZ7tf72lmdrbIT8kf4
	 rTxeQ+4MffAc2RrkeiHNW4mCcvo8ASNbzhqkbWz3igW6Xe1H8pvi0yuArsYLbrVhyI6m3
	 pnVlFhsIPvHpRiT71fTf6T8evFiVwcb3DnC4IaOSCTbXoUY43nWXUHyw0qckdDTl2vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777295;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=Cs+H3h98GfSASeJhgoOBtq8wjY9dLbCYg+HjD0WUZmw=;
	b=5Y88iR7/ADqTpgPGfBNs5lt/MOUODD9umAWGBFC4Lu47UtueRRATTqGtYHWp4SiBWox3
	 9idR0wnN+rMIHvR9D14aEvE4zCgrBoABxfq88itf4+lX81dQzHdmB0fZnbVvdx5OrdAvG
	 Z2u7lza5FSEhiR8I1FHXRuXMyUoEM3LyU7pa1Itxt78r5M2fUEaE2ZOVkZaTaoqX2ZwJN
	 doA014pzFh/X13LsX4KLmdD5WbqImPQGz7RKAVRYyAbTUBbXaAcgJuxYpJ79Moiix+sJ/
	 LlLoSn10MZ2cRMw3IkwCVfuTwSqsNdmz3HrEsBT70wkn54HXLbcSMsEka8NL3v3IBPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gajlb9r1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="Rr9ht7/O";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tbzDb26b;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+wlGik5j;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD56606A31B;
	Wed,  4 Nov 2026 07:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD56606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gajlb9r1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Rr9ht7/O;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tbzDb26b;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+wlGik5j
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D62421F832;
	Wed,  4 Nov 2026 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793777293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cs+H3h98GfSASeJhgoOBtq8wjY9dLbCYg+HjD0WUZmw=;
	b=gajlb9r13J45QLnHL786DIxXHFcWigcOgmjT5emPz69FH4kZyFBjtDyqY/5SzpX1D8fxhZ
	D0aIW7b65kcswDGEM2bgN5qaU7uTsqud7Y9spyHbx8xHZpFWlN8mZoyLdn7fL6Ygb7/3i8
	5DHZWKExvzRtVJ8c3AIA4PeZ1/PAj7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793777293;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cs+H3h98GfSASeJhgoOBtq8wjY9dLbCYg+HjD0WUZmw=;
	b=Rr9ht7/ONBeCUZ74H5MzEvHOWpuR66Cdaso9DUp0oX7/H/PeriErn6JcxUEFl1IZ+i0UDm
	5TOzBdzF9K83csBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tbzDb26b;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+wlGik5j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793777291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cs+H3h98GfSASeJhgoOBtq8wjY9dLbCYg+HjD0WUZmw=;
	b=tbzDb26bOcoaEDhGhjAqajJj0TP7ed+GxNSxHQzbCulVXIeQc60DPmyMdQjDDKciRNbV0i
	AWD1xcYIVcSeq979KB5ZGf6OvvwVY0+ZT09/VndYXIPiUrJrx75dXl8SZm/oetqLR7E8Vk
	3JwUo3aJkfRIC5sM7JSian/Wl1YYeig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793777291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cs+H3h98GfSASeJhgoOBtq8wjY9dLbCYg+HjD0WUZmw=;
	b=+wlGik5jwdGVzrew4O963nDmcfLpqtM9ypzmuzGFCIhV4tGx4BTSs6eJoexkG17lLLKotA
	kOctVV9gft4LZJBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87A78134A5;
	Wed,  4 Nov 2026 07:28:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KwGrF4ve6mqXOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 07:28:11 +0000
Date: Wed, 04 Nov 2026 08:28:11 +0100
Message-ID: <87mrrpukc4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rafael Medina <rafael@gexdigital.net>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Devin Christensen <dchristensen8@proton.me>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/ca0132: Restore AE-5 audio registers after LED strip send
In-Reply-To: <20261102225723.123266-1-rafael@gexdigital.net>
References: <20261102225723.123266-1-rafael@gexdigital.net>
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,proton.me:email,gexdigital.net:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: D62421F832

On Mon, 02 Nov 2026 23:57:23 +0100,
Rafael Medina wrote:
> 
> 
> The AE-5 LED strip transport added by commit c3e35f355fad ("ALSA:
> hda/ca0132: Add Sound BlasterX AE-5 external RGB LED strip support")
> reprograms the CA0113 audio serializer block in BAR2 to clock out the
> WS2812 data, and at the end clears only the stream routing register.
> The format and channel enable register at 0x100 is left at 0x3000ff8f
> instead of the 0x00000700 it reads after a normal codec init, and the
> analog outputs stay silent until the codec is initialised again.
> 
> The strip control is marked volatile, but alsactl still stores it, and
> the udev rule runs "alsactl restore" for every card probe. The saved
> state of a card that never had a strip attached contains "AE-5 LED
> Strip" and "AE-5 LED Strip Count" with access "read write volatile".
> ae5_strip_ctl_put() sent a frame even when the colors were unchanged,
> so every boot of an AE-5 or AE-5 Plus ended with a silent card.
> 
> Save the registers that the transmit touches before programming them
> and write them back at the end of ae5_strip_send_frame(), and do not
> transmit from ae5_strip_ctl_put() when the colors did not change.
> 
> Fixes: c3e35f355fad ("ALSA: hda/ca0132: Add Sound BlasterX AE-5 external RGB LED strip support")
> Cc: Devin Christensen <dchristensen8@proton.me>
> Signed-off-by: Rafael Medina <rafael@gexdigital.net>

Applied now.  Thanks.


Takashi
