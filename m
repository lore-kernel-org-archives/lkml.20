Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE5A1917CD;
	Tue,  8 Sep 2026 06:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849195; cv=none; b=oF/I4dXJfFzFfnc1TB0otnlJDrbzrtbOl/usEmHxRikAtjM61Q3c5U2ciGHfQy/BSrEQazs0C6P+1f4B24YlFPVEKi4wiC7QELzhzrJkr16S0qzDeawoikUTmqckmz6hsVsmW+DWw6mA1+Tgcw0NjlRlojT9oeoZ3g3X7BkzqcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849195; c=relaxed/simple;
	bh=4dQY6vY2r8MB/Qh0iX8PDyk4MLTMEDg+OKUPh0defH0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uGdgLyGfxw9fK/fCUJVurkOaeV4v+hDFk5w0O5lKFozaHHptQ5whSx8iIRTSZ5F5NsoZAbSjpav2nPwhJMOnRq98h8IoddRXSQsWBe6vNuypAQRglJVJV6byBWMngJrhutSJnftdQfCxSPZBW1iuooMYz26/HC3ocgETaKKbmoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mrg151jh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gDrApUI/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DB1YE7SU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u9+azC6h; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mrg151jh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gDrApUI/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DB1YE7SU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u9+azC6h"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4AB7021A16;
	Tue,  8 Sep 2026 06:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788849182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=diP4LpPCmefoer3V4tFCamAROerdtWsoDgXJZT41QXk=;
	b=mrg151jhzfmYzMIJxEAAJaYOk2AFzBGdfZsQXzrI8fdcvFPbtacwuwBpptZ/Lmmxma5TSo
	RoLtIhkWAKEvFrQ9AMV2/XZDiyya7uv1u7u+7daai8snsf4SP3W7Qaw2BZyDdsYwHd0h4A
	u5u5cnwwx0/uWmckFjDoYAm6V91PeK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788849182;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=diP4LpPCmefoer3V4tFCamAROerdtWsoDgXJZT41QXk=;
	b=gDrApUI/44kubQ431fE7kJ9alyEZCuW9ruEFVBtaS0iU2IDhILBotTV3l4cIcgcsqbSkS2
	rrgwy9t9yEs0KNDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DB1YE7SU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u9+azC6h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788849178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=diP4LpPCmefoer3V4tFCamAROerdtWsoDgXJZT41QXk=;
	b=DB1YE7SUuMlX+z2JTH6aVEY+hGKXXih/Ngq16W/5BfNbfZ23cQ/iAXiMqwSd+Y9AkaTaeJ
	0gu05JlYTwlc/bENhyE6J8TURDtI1e2fVTgQexBZMr5mJOQJRE26+mKSc+sPdtRAedb9qg
	NgtUwlQc97GOEHp4jSaLpeRqQfeXECw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788849178;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=diP4LpPCmefoer3V4tFCamAROerdtWsoDgXJZT41QXk=;
	b=u9+azC6h3txxNIhQ7pVXOTqCYS2BOi8uMjfpEYDSL3+ryzHXx9/aB9x2vfg6iNrQWzJi42
	5OU5eAXiejg9AaDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F2B6A1347F;
	Tue,  8 Sep 2026 06:32:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4uv6ORmsn2riKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Sep 2026 06:32:57 +0000
Date: Tue, 08 Sep 2026 08:32:57 +0200
Message-ID: <87mrtsqmli.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Hanh Kieu <hhkieu@gmail.com>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add Pioneer DJ DDJ-SZ support
In-Reply-To: <CAEsQvcuZm_1DmR8gFGi3ec6++Eo03ruUJHc-RxuqaWKh8o0aXQ@mail.gmail.com>
References: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
	<20260904182023.4486-1-hhkieu@gmail.com>
	<CAEsQvcuMFt=m=njsPzRtKarz04Gwbds+f8p2S+SdSQmaiW1fLw@mail.gmail.com>
	<CAEWo5SpV6eyHo-tn+hKX4s98uCjGJg5Dz9fMkoWNDNqgofJ5og@mail.gmail.com>
	<CAEsQvcsG_Q2uZQ8Q_MBhUyhY+n4HymMsuowSHfk-CHCBj6mbzQ@mail.gmail.com>
	<87pkyp335m.wl-tiwai@suse.de>
	<CAEsQvcuZm_1DmR8gFGi3ec6++Eo03ruUJHc-RxuqaWKh8o0aXQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4AB7021A16
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 08 Sep 2026 01:47:15 +0200,
Geraldo Nascimento wrote:
> 
> Hi Takashi,
> 
> On Mon, Sep 7, 2026 at 4:57 AM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Sat, 05 Sep 2026 08:19:37 +0200,
> > Geraldo Nascimento wrote:
> > >
> > > On Sat, Sep 5, 2026 at 2:35 AM Hanh Kieu <hhkieu@gmail.com> wrote:
> > > >
> > > > Hi Geraldo,
> > > >
> > > > I looked further into the is_pioneer_implicit_fb() check you pointed out.
> > > >
> > > > It seems the DATA case is intentional. In the original Pioneer DJM-900NXS2 work, Fabian Lesniak described the observed behavior as:
> > > >
> > > > “the playback streams also tries to start the capture endpoint as sync source.”
> > > >
> > > > https://gist.github.com/flesniak/074ab23bbc833663b782f44174eae6a4
> > > >
> > > > Takashi Iwai later formalized this in the Pioneer implicit-feedback handling, explicitly accepting either USB_ENDPOINT_USAGE_DATA or USB_ENDPOINT_USAGE_IMPLICIT_FB for the secondary IN endpoint before passing it to add_implicit_fb_sync_ep():
> > > >
> > > > https://github.com/torvalds/linux/commit/167c9dc84ec384c0940359e067301883ad2b42a8
> > > >
> > >
> > > Every other Pioneer device has that USB_ENDPOINT_USAGE_IMPLICIT_FB
> > > on the IN endpoint. Yours would be the first without it in the IN
> > > endpoint. Unless
> > > your hardware doesn't rely on implicit feedback for syncing then there's a good
> > > chance that implicit.c short-circuiting and still picking up implicit
> > > feedback for you
> > > isn't correct, but what you need to do is cool down now and wait for proper
> > > maintainer response which takes time.
> >
> > Accepting both DATA and IMPLICIT_FB usages is intentional, yes.
> > But I don't follow what's the problem there -- in this case, the
> > bmAttributes of the secondary EP shows it's DATA, no?  Then this check
> > must pass.
> 
> If you check the original patch submission by Hanh, you'll see he did not
> bother to include USB_ENDPOINT_USAGE_IMPLICIT_FB as a flag for
> EP attributes, claiming it was unnecessary and the implicit feedback was
> picked-up regardless.
> 
> Hahn already traced the functions return values, he is getting a true value
> out of that function (and thus picking up implicit feedback for his device)
> even though he does not add USB_ENDPOINT_USAGE_IMPLICIT_FB
> to the IN EP Attributes on his original submission.

Ah, OK.

> >
> > The condition is:
> >
> >         if (!usb_endpoint_is_isoc_in(epd) ||
> >             (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) != USB_ENDPOINT_SYNC_ASYNC ||
> >             ((epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
> >              USB_ENDPOINT_USAGE_DATA &&
> >              (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
> >              USB_ENDPOINT_USAGE_IMPLICIT_FB))
> >                 return false;
> >
> >         return false;
> 
> Yes, and that means when that first inequality is false, C short-circuits the
> logical AND and never checks USB_ENDPOINT_USAGE_IMPLICIT_FB
> like it should.
> 
> >
> > ... and maybe it's better to be rewritten like:
> >
> >         sync = (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE);
> >         usage = (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK);
> >
> >         if (usb_endpoint_is_isoc_in(epd) &&
> >             sync == USB_ENDPOINT_SYNC_ASYNC &&
> >             (usage == USB_ENDPOINT_USAGE_DATA ||
> >              usage == USB_ENDPOINT_USAGE_IMPLICIT_FB))
> >                 return true;
> >
> >         return false;
> 
> But then, again, you would be disregarding the meaning of the flag
> USB_ENDPOINT_USAGE_IMPLICIT_FB and in practice just making
> the first check.

The Pioneer device quirk accepts USAGE_DATA also as an implicit fb
source if it's the secondary EP and ASYNC input, too -- that's the
very intention here because some Pioneer devices use USAGE_DATA
instead of USAGE_IMPLICIT_FB.


Takashi
