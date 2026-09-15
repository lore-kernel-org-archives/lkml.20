Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D60C356771;
	Tue, 15 Sep 2026 14:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481985; cv=none; b=jhMe1O9SiSS7SCim9RBhmXpQg6t+4rieWk6vQLZ3O90Y8xNdtoA6/nXmrbOVC7Dg6zqi195Ewmc4q0hXojwkz28q6fLWKkDhpOUyCFapPcKQP7vpbtaKUalUltoEqsAOzfRagG3xS/tIN4TO2XGJtbvEpOx/d43byPA1R6BQsmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481985; c=relaxed/simple;
	bh=yiWTc9LuPY4Vs2RQHH7eG4n7l73EBdVHK/sOZd2JowA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J1Hg+QtSHfPAu1motlg1pZe6e+BYOYVUywEFsPUxTTVg7+yLYB1UlsM+k7EpgyvHEgJtN99fShiln/Jk7FBkhK5+Di+pK5I8M05YSi9HyD6sC1JS1Rugkn86TyHYo1mlRvf2b4tvIiEzarf8DgLWOCoKYP0U1ARgncGio45Be50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XbhVIxDl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xuDkaryW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gjq6ND1t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f9UONYJZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XbhVIxDl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xuDkaryW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gjq6ND1t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f9UONYJZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1DEC71FDD2;
	Tue, 15 Sep 2026 14:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789481977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lpTF3HCWm12/Df5Z7XVrVxBzYG39F++JBUDpesAaNp0=;
	b=XbhVIxDlfQkOaUws4wy2XYvCIvwjGToovSMJppSx5L9PoLoAX+U+MqfBsHCVY4xrxqABI3
	EKNmwydAWivX/lyskT2QHRVap1kBl6JWrLuxB2fzAOepVirn+ipUQmyNwL65Bl/8HI6i7/
	7Q7kNabcCLIEhPRnONyx6YbUHJasKNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789481977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lpTF3HCWm12/Df5Z7XVrVxBzYG39F++JBUDpesAaNp0=;
	b=xuDkaryW1uSR0gKx3HbbSgAihFIfmw5ExY2Avd7LTUZ4kUaYUOC2w1qMW3AoLmJRWJfvCO
	9BS5SDmyC3xEv0Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789481973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lpTF3HCWm12/Df5Z7XVrVxBzYG39F++JBUDpesAaNp0=;
	b=Gjq6ND1tJJ04npn4WsEN/n4SjaDmnlZBHDaxyPf0X1UpOxaPVgci8exRLKTjMaAO9cNAId
	zkNzlwne2lOXG0yLsah0tVFlIyMpgfS2GooKhvRcnLR4nNZWuwo6wRFRxlLN4YWsyANtc+
	HFfAkQ/WHn0BjaHww4H9KoeusP0q4BE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789481973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lpTF3HCWm12/Df5Z7XVrVxBzYG39F++JBUDpesAaNp0=;
	b=f9UONYJZZV83vXHAYhXMTOIeYyqH7Z2uweoDxsHOpUzJrBRYVXZgeq5FOcytaNFnNNnpjP
	hyzcetGFQmC6iqBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C19F913432;
	Tue, 15 Sep 2026 14:19:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FAO8JfRTqWpiLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Sep 2026 14:19:32 +0000
Date: Tue, 15 Sep 2026 16:19:32 +0200
Message-ID: <8733vamwaz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zipdox <zipdox@zipdox.net>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and RANGE
In-Reply-To: <59b3dc9b-f324-42e7-ab03-a01c04e8b915@zipdox.net>
References: <d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net>
	<87bj9yn55n.wl-tiwai@suse.de>
	<59b3dc9b-f324-42e7-ab03-a01c04e8b915@zipdox.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Tue, 15 Sep 2026 14:54:38 +0200,
Zipdox wrote:
> 
> On 9/15/26 1:08 PM, Takashi Iwai wrote:
> > Hmm, for UAC2, UAC_GET_CUR & co isn't passed as is at all, but the
> > call is translated to UAC2_CS_CUR and UAC2_CS_RANGE accordingly in
> > get_ctl_value_v2() (that is called from get_ctl_value()
> > conditionally).  So this translation path was skipped somehow with
> > your device...?
> 
> The request is translated yes, but wValue is incorrect. UAC2 uses a
> Mixer Control Number ("mcn") in the low byte to identify the mixer
> control, along with a control selector in the high byte (UAC2_MU_MIXER
> in this case). UAC1 on the other hand uses the low and high byte to
> identify the mixer control. It seems get_ctl_value_v2 doesn't change
> wValue to the appropriate format (mcn and control selector). This code
> was, as far as I understand it, never correct to begin with for UAC2.

OK, point taken.

> To get the MIN, MAX, and RES, get_min_max_with_quirks currently calls
> get_ctl_value three times to get the values separately. It looks like
> get_ctl_value_v2 was written to send RANGE requests and extract the
> appropriate part of the RANGE response, depending on the request. This
> doesn't actually work though, because wValue is incorrect as I stated
> above. It also unnecessarily sends three requests instead of one. That's
> why I bypassed it entirely and wrote the get_ctl_range_16 function. This
> could in theory be consolidated, but there's quite a bit of other code
> so I'm hesitant to touch it. Supplying the correct wValue to
> get_ctl_value in get_cur_mix_raw fixed getting the current value, and
> the same applies to the call to snd_usb_mixer_set_ctl_value in
> snd_usb_set_cur_mix_value.

But your code also blindly assumes the MU_MIXER_CONTROL that doesn't
fit with other units like feature unit?  I guess we have to set the
proper Control Selector value depending on the unit type.

After all, this is about the correct setup of wValue.  Let's try to be
minimalistic at first -- just tweak wValue in get_ctl_value_v2() and
snd_usb_mixer_set_ctl_value() at first.  If this becomes too ugly, we
can think of redesigning.


> > Could you try to reformat in a proper patch format?
> > Also, it looks containing many unnecessary / unrelated changes that
> > make review more difficult.  Please try to concentrate only on the
> > change you really need.
> 
> Perhaps you are referring to the indentation changes resulting from
> wrapping existing code in an if statement? I can't really do anything
> about that. I don't think I changed any unrelated code itself. If there
> are unrelated changes, please point them out to me.

Well, get_ctl_value_v2() changes look all unrelated and just breaking
indentations.

> In any case, I
> changed the patch to the "canonical patch format" as written in the
> kernel docs.
> 
> From: Zipdox <zipdox@zipdox.net>
> 
> The USB Audio Mixer Unit driver (sound/usb/mixer.c) sends audio class
> 1.0 format control messages to devices, regardless of the actual audio
> class version. This means audio class 2.0 devices will receive incorrect
> messages, stall, and cause the driver to error (e.g. alsamixer exits
> with a broken pipe error). This patch implements the GET_CUR, SET_CUR,
> and RANGE control requests for mixer units according to the Audio Class
> 2.0 specification.
> 
> Subject: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and RANGE

The subject line must be at the beginning right after From tag.


> Signed-off-by: Zipdox <zipdox@zipdox.net>

... and both From and Signed-off-by should be with a real name (or a
known identity).  It's a legal requirement.


thanks,

Takashi
