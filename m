Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAB73B27E2;
	Mon, 14 Sep 2026 06:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366502; cv=none; b=SpGqZPYoNfzkbqnqfmbA2Q/QYnJXKsM8v/oXhLWjrjGVP7479+wd48cNAwR0xT/nH9B67Qa/+pudQhDZhkkvcY5OwK5VxsjM50fP/Hb9OfiyfM/H/NGJ6Itruh66jyA7hDflwKnqeK825Qpvzn+bZQW7FRpOi661bSBv8UEHb1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366502; c=relaxed/simple;
	bh=8SFDSWBs5bcJBoYM71QxmXw5HNnk+Lbu9uskQygxsT8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UVuNlaMvofotAfUKpbQwg3HQ60LkOp/r15dECjr/jd9RSh438vimQjlCmUp7yiBtsXQhOCur/lHg1086mOa87VnuAmvzlJ3Gsvlaf2MHF8+sbmtcEYYLCOdmWPRQdxpv1nQMwgD8b1fONIZyiexRSJ/Cws66E0fZqrpODxk0H0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XlLY0A/Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qPLDE6Lu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L7wYPKtG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TboMdZFn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XlLY0A/Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qPLDE6Lu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L7wYPKtG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TboMdZFn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 51F5121CD8;
	Mon, 14 Sep 2026 06:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789366494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moyDq0XaRJmr9DGyiF2V3RVtl1dii0WUfsiyK76Ypdo=;
	b=XlLY0A/YodZzGNTSNehuny1BbjijWjdX8Ry8OeVRLeDBHPbsiWagUYNfqU26wmsdjKNxKj
	wK6OekqD3W+x7z5edN4oVYg907Xc7R50IOCSmNrBVPTSQuXHbz58XmW/vdjjd8ooANrtIe
	8f8UbtF4qd6+UdIjcfIM9VHheVHi7GQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789366494;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moyDq0XaRJmr9DGyiF2V3RVtl1dii0WUfsiyK76Ypdo=;
	b=qPLDE6LuN2fPOiHi4mDjs7WWqkvQIyl3VrMm+YutGhBl/n/JCp6kWaGrI3BdfBbk5qvRRI
	vdZULb/qOQfZeKBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=L7wYPKtG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TboMdZFn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789366490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moyDq0XaRJmr9DGyiF2V3RVtl1dii0WUfsiyK76Ypdo=;
	b=L7wYPKtGdMCir1STSP/FHALtQavfhs3V9pMfZmLXPn19t07T5UryVjhXiAgWQMMz3ZX58t
	SprR6mXR45DMpPiftkiRNUlUwV0ONxUZAkHFh8GiT8SDF/Tn89iiFIqapPAlRcRlQrSlPy
	Kgb0n6Hnaxw865dLUQfCJw+wKRmeKkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789366490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moyDq0XaRJmr9DGyiF2V3RVtl1dii0WUfsiyK76Ypdo=;
	b=TboMdZFnSNAHKzaHPAkDqk4ZnaT+wk5dM+vfwgwi8P92/EComcVF20mLWDl+qQSr8FL8Z8
	4yzoo6VcZkG9+ZDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEF6913515;
	Mon, 14 Sep 2026 06:14:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ALEOOdmQp2qPfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 06:14:49 +0000
Date: Mon, 14 Sep 2026 08:14:49 +0200
Message-ID: <87v788qrza.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hanh Kieu <hhkieu@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add Pioneer DJ DDJ-SZ support
In-Reply-To: <CAEWo5SqOZmVSc_uogQoG1Xfk26bHpuphaG-6+fpzGoX36TQMaA@mail.gmail.com>
References: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
	<20260904182023.4486-1-hhkieu@gmail.com>
	<CAEsQvcuMFt=m=njsPzRtKarz04Gwbds+f8p2S+SdSQmaiW1fLw@mail.gmail.com>
	<CAEWo5SpV6eyHo-tn+hKX4s98uCjGJg5Dz9fMkoWNDNqgofJ5og@mail.gmail.com>
	<CAEsQvcsG_Q2uZQ8Q_MBhUyhY+n4HymMsuowSHfk-CHCBj6mbzQ@mail.gmail.com>
	<87pkyp335m.wl-tiwai@suse.de>
	<CAEsQvcuZm_1DmR8gFGi3ec6++Eo03ruUJHc-RxuqaWKh8o0aXQ@mail.gmail.com>
	<87mrtsqmli.wl-tiwai@suse.de>
	<CAEWo5SqOZmVSc_uogQoG1Xfk26bHpuphaG-6+fpzGoX36TQMaA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 51F5121CD8
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,perex.cz,suse.com,vger.kernel.org];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Mon, 14 Sep 2026 06:00:04 +0200,
Hanh Kieu wrote:
> 
> 
> Hi,
> Following up, anything needed on my end?

Now I took to for-next branch.  Thanks.


Takashi

> - Hanh Kieu 
> 
> On Mon, Sep 7, 2026 at 11:33 PM Takashi Iwai <tiwai@suse.de> wrote:
> 
>     On Tue, 08 Sep 2026 01:47:15 +0200,
>     Geraldo Nascimento wrote:
>     >
>     > Hi Takashi,
>     >
>     > On Mon, Sep 7, 2026 at 4:57 AM Takashi Iwai <tiwai@suse.de> wrote:
>     > >
>     > > On Sat, 05 Sep 2026 08:19:37 +0200,
>     > > Geraldo Nascimento wrote:
>     > > >
>     > > > On Sat, Sep 5, 2026 at 2:35 AM Hanh Kieu <hhkieu@gmail.com> wrote:
>     > > > >
>     > > > > Hi Geraldo,
>     > > > >
>     > > > > I looked further into the is_pioneer_implicit_fb() check you
>     pointed out.
>     > > > >
>     > > > > It seems the DATA case is intentional. In the original Pioneer
>     DJM-900NXS2 work, Fabian Lesniak described the observed behavior as:
>     > > > >
>     > > > > “the playback streams also tries to start the capture endpoint as
>     sync source.”
>     > > > >
>     > > > > https://gist.github.com/flesniak/074ab23bbc833663b782f44174eae6a4
>     > > > >
>     > > > > Takashi Iwai later formalized this in the Pioneer
>     implicit-feedback handling, explicitly accepting either
>     USB_ENDPOINT_USAGE_DATA or USB_ENDPOINT_USAGE_IMPLICIT_FB for the
>     secondary IN endpoint before passing it to add_implicit_fb_sync_ep():
>     > > > >
>     > > > > 
>     https://github.com/torvalds/linux/commit/167c9dc84ec384c0940359e067301883ad2b42a8
>     > > > >
>     > > >
>     > > > Every other Pioneer device has that USB_ENDPOINT_USAGE_IMPLICIT_FB
>     > > > on the IN endpoint. Yours would be the first without it in the IN
>     > > > endpoint. Unless
>     > > > your hardware doesn't rely on implicit feedback for syncing then
>     there's a good
>     > > > chance that implicit.c short-circuiting and still picking up
>     implicit
>     > > > feedback for you
>     > > > isn't correct, but what you need to do is cool down now and wait for
>     proper
>     > > > maintainer response which takes time.
>     > >
>     > > Accepting both DATA and IMPLICIT_FB usages is intentional, yes.
>     > > But I don't follow what's the problem there -- in this case, the
>     > > bmAttributes of the secondary EP shows it's DATA, no?  Then this check
>     > > must pass.
>     >
>     > If you check the original patch submission by Hanh, you'll see he did
>     not
>     > bother to include USB_ENDPOINT_USAGE_IMPLICIT_FB as a flag for
>     > EP attributes, claiming it was unnecessary and the implicit feedback was
>     > picked-up regardless.
>     >
>     > Hahn already traced the functions return values, he is getting a true
>     value
>     > out of that function (and thus picking up implicit feedback for his
>     device)
>     > even though he does not add USB_ENDPOINT_USAGE_IMPLICIT_FB
>     > to the IN EP Attributes on his original submission.
>    
>     Ah, OK.
>    
>     > >
>     > > The condition is:
>     > >
>     > >         if (!usb_endpoint_is_isoc_in(epd) ||
>     > >             (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) !=
>     USB_ENDPOINT_SYNC_ASYNC ||
>     > >             ((epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
>     > >              USB_ENDPOINT_USAGE_DATA &&
>     > >              (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
>     > >              USB_ENDPOINT_USAGE_IMPLICIT_FB))
>     > >                 return false;
>     > >
>     > >         return false;
>     >
>     > Yes, and that means when that first inequality is false, C
>     short-circuits the
>     > logical AND and never checks USB_ENDPOINT_USAGE_IMPLICIT_FB
>     > like it should.
>     >
>     > >
>     > > ... and maybe it's better to be rewritten like:
>     > >
>     > >         sync = (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE);
>     > >         usage = (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK);
>     > >
>     > >         if (usb_endpoint_is_isoc_in(epd) &&
>     > >             sync == USB_ENDPOINT_SYNC_ASYNC &&
>     > >             (usage == USB_ENDPOINT_USAGE_DATA ||
>     > >              usage == USB_ENDPOINT_USAGE_IMPLICIT_FB))
>     > >                 return true;
>     > >
>     > >         return false;
>     >
>     > But then, again, you would be disregarding the meaning of the flag
>     > USB_ENDPOINT_USAGE_IMPLICIT_FB and in practice just making
>     > the first check.
>    
>     The Pioneer device quirk accepts USAGE_DATA also as an implicit fb
>     source if it's the secondary EP and ASYNC input, too -- that's the
>     very intention here because some Pioneer devices use USAGE_DATA
>     instead of USAGE_IMPLICIT_FB.
> 
>     Takashi
> 
