Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAE14F4CED;
	Thu, 17 Sep 2026 16:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663266; cv=none; b=CA0Y4vaVl22U3cbLJ0PAgaxKu9KmcngWmOeQz2BqJFsDFyztq7zWHxxY6NtpsSXNS5pEUEXyNb0D4UjXTKK9rImTfI/+d1e2+Qbidbscbp3YiTfUfrheO7c1Y2I+IAs8tIpKjps3xXItCxqi14qMKsJjb+bwhBehwEQiqDydVGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663266; c=relaxed/simple;
	bh=5FAbYOI3d6kLn4/03hVYDZrZobbTRvc1SkdQqGzL7jM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a3BjIteGf+IPburVE31vDc3wZb4Uq2eWW2jCw585aL4OVpfk3wy6AVOhWstKUnm+cJ0m7t2faB02UeZBThORQRyLC5BGiospZUleJ/l0ZISswCdp0FzwygpOE6b/RDStr+vMEB9DjtWGEGOrwdu4VdEVFwhSJq/wXx+0ekFzPPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PTYSEn+H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5zhg47LL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hmX1Ew1o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Kcntsagq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PTYSEn+H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5zhg47LL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hmX1Ew1o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kcntsagq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4A9571FFA0;
	Thu, 17 Sep 2026 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789663258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7mH0FIVer3GoGr7wIgb7gp2ZvqBkBDTqED8d7FnkK8w=;
	b=PTYSEn+HBneKRSdJlIbbRc1ju/nHxtebdDms9iAg56cbdSZU2F860ezQGy05pUI4egECu0
	374w9gv6ZaBOUY+4nhGq7zwcheHFkH5bO75snrZTvBExNlaGhspYOfmKMeiKoQTdWQGW1Z
	LQDym4p7mez3DWycj4/h27XAIXR/BZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789663258;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7mH0FIVer3GoGr7wIgb7gp2ZvqBkBDTqED8d7FnkK8w=;
	b=5zhg47LL8ivlSi5IavIEDZcqGRb6QW2iPXndVrNtCKorbPnXlhQPtH2XsFUB6aOm+/IX1f
	hoZkPtnGKmWskfDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hmX1Ew1o;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Kcntsagq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789663254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7mH0FIVer3GoGr7wIgb7gp2ZvqBkBDTqED8d7FnkK8w=;
	b=hmX1Ew1o1A2bFnfIxIw7FGkc4FzN8sgZ7vzbQseXTGW+chFSbT7bCwXiL2ZRr3+As89bEr
	eFUjU/nKnJYPUtH5VxfuhoCQ7vQvXBoH5g3UYIu/+M/RFGqTEnW6AUX77EQAb/1Ox/eZ3h
	h3cz9Ze7fGGb3HJRg8Vc4RRLomwUTg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789663254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7mH0FIVer3GoGr7wIgb7gp2ZvqBkBDTqED8d7FnkK8w=;
	b=Kcntsagq3McmKLGntue1Uc5++fi0scWHG1G2txL2VzzsqBOYuIDc6TSTDYrXLx+5Ma86SD
	HGk9S8+9NZ/NWOAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEFC9134B3;
	Thu, 17 Sep 2026 16:40:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wk7cMBUYrGojFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 17 Sep 2026 16:40:53 +0000
Date: Thu, 17 Sep 2026 18:40:53 +0200
Message-ID: <87o6dvg7ai.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zipdox <zipdox@zipdox.net>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and RANGE
In-Reply-To: <13f9ee6e-acf2-4166-93cc-33cbc2d4bd89@zipdox.net>
References: <d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net>
	<87bj9yn55n.wl-tiwai@suse.de>
	<59b3dc9b-f324-42e7-ab03-a01c04e8b915@zipdox.net>
	<8733vamwaz.wl-tiwai@suse.de>
	<da56664f-901e-497b-a74c-ae41cbc5cac4@zipdox.net>
	<87a4phjjay.wl-tiwai@suse.de>
	<8733v9jfp1.wl-tiwai@suse.de>
	<87y0d1hx9y.wl-tiwai@suse.de>
	<895b9e3d-bc81-4688-8513-8aa42d40e4fa@zipdox.net>
	<05a53b37-8de3-4075-93c0-21129a839356@zipdox.net>
	<87se37g8gu.wl-tiwai@suse.de>
	<13f9ee6e-acf2-4166-93cc-33cbc2d4bd89@zipdox.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 4A9571FFA0
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Thu, 17 Sep 2026 18:33:50 +0200,
Zipdox wrote:
> 
> On 9/17/26 6:15 PM, Takashi Iwai wrote:
> > Good to hear.  If you have a chance to test my last series of patches,
> > it'd be appreciated.
> > 
> > BTW, I'll be off from tomorrow, and the issue is no new bug to be
> > urgently fixed, so I'll handle after back to work again :)
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
> I have compiled your patches and the mixer unit control seems to work
> correctly.
> 
> Another thing on my mind is the following section from section
> 5.2.5.5.1 from the spec:
> > A Mixer Unit consists of a number of Mixer Controls, either programmable or fixed. A Mixer Control must
> > support the CUR and RANGE(MIN, MAX, RES) attributes. The settings for the CUR, MIN, and MAX
> > attributes can range from +127.9961 dB (0x7FFF) down to -127.9961 dB (0x8001) in steps of 1/256 dB or
> > 0.00390625 dB (0x0001). The settings for the RES attribute can only have positive values and range from
> > 1/256 dB (0x0001) to +127.9961 dB (0x7FFF).
> > In addition, code 0x8000, representing silence (i.e., -∞ dB), must always be implemented. However, it must
> > never be reported as the MIN attribute value.
> 
> Is this presently handled? For reference, 0x8000 is -32768. When I use
> qasmixer or alsamixer, for example, it only goes down to -32767. This
> is the same in UAC1 by the way. Should we add a mute control to mixer
> nodes? Or perhaps extend the reported range downward by one, and
> overwrite the lowest value to -32768 when writing to a mixer unit. The
> latter is my preferred solution.

I guess it's not; there is cval->min_mute flag, but it's for another
case (the minimal volume = mute) for the statically mapped mixer
elements, and not for this mixer unit case.

Maybe they should be implemented by additional mute switches.

Overall, the mixer unit controls have been rarely used by the devices,
so far, and that's the reason we didn't hit this over years :)


Takashi
