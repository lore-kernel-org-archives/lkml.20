Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF08423E99;
	Mon,  7 Sep 2026 07:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767828; cv=none; b=fqL+vmlXIgYn5P/sgT7orEzdOe/WZj+zGpmdGt944X7bIOCA4BGSxcq6OoasL8LlBuDgUQ2E99T2GTLs3B0kbyAI/9tTTMuS16dhLKsMvfaRSFTERR9MV0B3FvTgNzSPSYjukFPXUeA01yt5jAIpWzqmNluLH9wvboeKmyv/nkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767828; c=relaxed/simple;
	bh=HD+kpPJ97k/t8/9ESk/y2ZJPD6KkFYUxCaLhRfiNMOY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtvB/ji0mBJZJxWZga0/YpmlBpVK/eM1nYAOIWAitA6d9NZQvfWtd5ST/xEiRhlsRZWC6AyQlSDw201+zLuIxSbDViRjnugFvv89TiNMPklHF/8uMAOgKszaV+WDU3qp+pe0EY7rfBSDDxi85hveWbpo2AlGNteg55GaY0njiiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q1P60Aas; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9LVxIcff; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E3ry7EF/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2DUewYjq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q1P60Aas";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9LVxIcff";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E3ry7EF/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2DUewYjq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B3791F453;
	Mon,  7 Sep 2026 07:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788767818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L6bKYEjkEqBgbRcu8/bXNS8gLY+J+E7EjmrIAWPeTmk=;
	b=Q1P60AasH5bWg3M74CnqzJlpkLgttrA5UD2svjiJGa560Je0qPog1aHc/02zlwPYdMU6wb
	1EFki2e7Ncdrpx/t4g0elsSBS3EzcFOosfVqDsiqxcIk6fjlNT4gE7ktCRl/mMxYSdERJ6
	WVr66pZgku8fbn5Y9JQlR339YByrAas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788767818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L6bKYEjkEqBgbRcu8/bXNS8gLY+J+E7EjmrIAWPeTmk=;
	b=9LVxIcffiRpHvmp9fnN5I8564Cc+8nIvlxuGQFbeMPexPyIViWt7Ic3RwPdrIVYrrEmTV/
	NpGKet2NU9Y8vpAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788767814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L6bKYEjkEqBgbRcu8/bXNS8gLY+J+E7EjmrIAWPeTmk=;
	b=E3ry7EF/7G70KXhQTqhur7HN45INP8d9TnJTLlaoNg/3/c1RGmw+7uIXl/IuaTPDuxQa/B
	/UqoRMNBCSCzOE+7XFC2C4SETmDS1HrxV551DX/QmLbfkN3VvbCox0En9qpvL9V1Jpz9S/
	viq2yChqkDJSZCPoP5N5tFa+wAmQA4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788767814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L6bKYEjkEqBgbRcu8/bXNS8gLY+J+E7EjmrIAWPeTmk=;
	b=2DUewYjqOP5jeapYRIT4BycWbgQSTTXL/qVBYtxZxlrjfXM6o+CgDi2LkzN38j/cxZnz2N
	9/1HTH6LxxVc06Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35E401339B;
	Mon,  7 Sep 2026 07:56:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dE7oC0ZunmqwIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 07 Sep 2026 07:56:54 +0000
Date: Mon, 07 Sep 2026 09:56:53 +0200
Message-ID: <87pkyp335m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Hanh Kieu <hhkieu@gmail.com>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add Pioneer DJ DDJ-SZ support
In-Reply-To: <CAEsQvcsG_Q2uZQ8Q_MBhUyhY+n4HymMsuowSHfk-CHCBj6mbzQ@mail.gmail.com>
References: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
	<20260904182023.4486-1-hhkieu@gmail.com>
	<CAEsQvcuMFt=m=njsPzRtKarz04Gwbds+f8p2S+SdSQmaiW1fLw@mail.gmail.com>
	<CAEWo5SpV6eyHo-tn+hKX4s98uCjGJg5Dz9fMkoWNDNqgofJ5og@mail.gmail.com>
	<CAEsQvcsG_Q2uZQ8Q_MBhUyhY+n4HymMsuowSHfk-CHCBj6mbzQ@mail.gmail.com>
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
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Sat, 05 Sep 2026 08:19:37 +0200,
Geraldo Nascimento wrote:
> 
> On Sat, Sep 5, 2026 at 2:35 AM Hanh Kieu <hhkieu@gmail.com> wrote:
> >
> > Hi Geraldo,
> >
> > I looked further into the is_pioneer_implicit_fb() check you pointed out.
> >
> > It seems the DATA case is intentional. In the original Pioneer DJM-900NXS2 work, Fabian Lesniak described the observed behavior as:
> >
> > “the playback streams also tries to start the capture endpoint as sync source.”
> >
> > https://gist.github.com/flesniak/074ab23bbc833663b782f44174eae6a4
> >
> > Takashi Iwai later formalized this in the Pioneer implicit-feedback handling, explicitly accepting either USB_ENDPOINT_USAGE_DATA or USB_ENDPOINT_USAGE_IMPLICIT_FB for the secondary IN endpoint before passing it to add_implicit_fb_sync_ep():
> >
> > https://github.com/torvalds/linux/commit/167c9dc84ec384c0940359e067301883ad2b42a8
> >
> 
> Every other Pioneer device has that USB_ENDPOINT_USAGE_IMPLICIT_FB
> on the IN endpoint. Yours would be the first without it in the IN
> endpoint. Unless
> your hardware doesn't rely on implicit feedback for syncing then there's a good
> chance that implicit.c short-circuiting and still picking up implicit
> feedback for you
> isn't correct, but what you need to do is cool down now and wait for proper
> maintainer response which takes time.

Accepting both DATA and IMPLICIT_FB usages is intentional, yes.
But I don't follow what's the problem there -- in this case, the
bmAttributes of the secondary EP shows it's DATA, no?  Then this check
must pass.

The condition is:

	if (!usb_endpoint_is_isoc_in(epd) ||
	    (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) != USB_ENDPOINT_SYNC_ASYNC ||
	    ((epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
	     USB_ENDPOINT_USAGE_DATA &&
	     (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
	     USB_ENDPOINT_USAGE_IMPLICIT_FB))
		return false;

	return false;

... and maybe it's better to be rewritten like:

	sync = (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE);
	usage = (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK);

	if (usb_endpoint_is_isoc_in(epd) &&
	    sync == USB_ENDPOINT_SYNC_ASYNC &&
	    (usage == USB_ENDPOINT_USAGE_DATA ||
	     usage == USB_ENDPOINT_USAGE_IMPLICIT_FB))
		return true;

	return false;

So it should return true.
Please double-check which test actually fails.


thanks,

Takashi
