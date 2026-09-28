Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B559A489FB9;
	Mon, 28 Sep 2026 11:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593208; cv=none; b=p6dt3VDq68mIYswpVdD7yNcGghm5WUd/tATyecdB4oVZVn+r02O4NMNnO+UzwqtJw2DwdzGbAGQS5W8yDvbCrYYHmZPCkPz/nAjYIo0dBon7/VfZ2oGhNCOVZznnoZDSgH2orgxa2LIKc1GtFF2lkj3+vUJ4W07QUhL6/DCAv6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593208; c=relaxed/simple;
	bh=DW8VcIC6EW5rBOFoQ48WitaIsgcKPFyA1fBuQ63tdM0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GtfB6LaCd5Jy53XVty4kxXVw2a4oVS6LKif47DU+bbPjEc0VF4iKSJgDSay7fJ9hlLVg85NIhxgn3sdnGfQqhOTy1pRi1dgWaCuQiC46Ld0tT35073fAl0NQGSU2B7qgApFkSkpwMWZiT9NPaCcC8n8uSoVCSGy1rDKfGomYoD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eOZ2mPKL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a7wOxn5f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oxtH5kPE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hdmroyep; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eOZ2mPKL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a7wOxn5f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oxtH5kPE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hdmroyep"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 44FEB1F812;
	Mon, 28 Sep 2026 10:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XRVPn+1fIxrMuKG+Cf3Oi2dQxHy+dyJl4Bu9fRfACbk=;
	b=eOZ2mPKLP5ub7rbXDJdhbihKMlvIv1o9+lBAJMv0jShfCQP5lSipGHKAHCEcAzT/K74ezm
	UeiHoj2nRpwOo0oyOsd2QwGcnKZ66vi1XwnGWVdkfUMdHuLMIoSOH57pk4INFsmaUHCnhh
	nHCLDKGtN4otmNjvkk3ySjQl6eKBCVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593200;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XRVPn+1fIxrMuKG+Cf3Oi2dQxHy+dyJl4Bu9fRfACbk=;
	b=a7wOxn5fwg0BfE+bYXLpx6IILLwX2pPB/OPPlTK8gI4aXZa3FUBs7kw5CRnRPljnCUX6RH
	YcizgKwak4nwYHAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oxtH5kPE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hdmroyep
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XRVPn+1fIxrMuKG+Cf3Oi2dQxHy+dyJl4Bu9fRfACbk=;
	b=oxtH5kPEdEnfLPsPxDbVCW3+xLsepILmuKzIW6iNAJSAIZYckf6pLYwBI0oNMmHcEDdlqL
	o0G1fYBk+JXiySjxGlX6YtRugmkADowzZJr4P4q+a0xAvrHr5e1tfEQ5dXzTf6iBaW7dNM
	+V5864pQH8lof1IEQD6cz11mgsEEsew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XRVPn+1fIxrMuKG+Cf3Oi2dQxHy+dyJl4Bu9fRfACbk=;
	b=hdmroyep39yDWpW9de9RfgsYIIhErIEnKs5ay4OIXXY/QDsAHk22efQrfSg0sddh+GudxT
	9uIaxJ2RzSfmgvAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BCCD91340F;
	Mon, 28 Sep 2026 10:59:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wD2kJatIumosIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 10:59:55 +0000
Date: Mon, 28 Sep 2026 12:59:55 +0200
Message-ID: <87ik3p7iac.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zipdox <zipdox@zipdox.net>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and RANGE
In-Reply-To: <b3af9756-d008-46e6-9465-13a059584ead@zipdox.net>
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
	<87o6dvg7ai.wl-tiwai@suse.de>
	<b3af9756-d008-46e6-9465-13a059584ead@zipdox.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 44FEB1F812
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Fri, 18 Sep 2026 10:35:28 +0200,
Zipdox wrote:
> 
> 
> On 9/17/26 6:40 PM, Takashi Iwai wrote:
> >> Another thing on my mind is the following section from section
> >> 5.2.5.5.1 from the spec:
> >>> A Mixer Unit consists of a number of Mixer Controls, either programmable or fixed. A Mixer Control must
> >>> support the CUR and RANGE(MIN, MAX, RES) attributes. The settings for the CUR, MIN, and MAX
> >>> attributes can range from +127.9961 dB (0x7FFF) down to -127.9961 dB (0x8001) in steps of 1/256 dB or
> >>> 0.00390625 dB (0x0001). The settings for the RES attribute can only have positive values and range from
> >>> 1/256 dB (0x0001) to +127.9961 dB (0x7FFF).
> >>> In addition, code 0x8000, representing silence (i.e., -∞ dB), must always be implemented. However, it must
> >>> never be reported as the MIN attribute value.
> >> 
> >> Is this presently handled? For reference, 0x8000 is -32768. When I use
> >> qasmixer or alsamixer, for example, it only goes down to -32767. This
> >> is the same in UAC1 by the way. Should we add a mute control to mixer
> >> nodes? Or perhaps extend the reported range downward by one, and
> >> overwrite the lowest value to -32768 when writing to a mixer unit. The
> >> latter is my preferred solution.
> > 
> > I guess it's not; there is cval->min_mute flag, but it's for another
> > case (the minimal volume = mute) for the statically mapped mixer
> > elements, and not for this mixer unit case.
> > 
> > Maybe they should be implemented by additional mute switches.
> > 
> > Overall, the mixer unit controls have been rarely used by the devices,
> > so far, and that's the reason we didn't hit this over years :)
> > 
> > 
> > Takashi
> > 
> 
> From a UX perspective, I would prefer if the lowest setting on the
> control equals mute. This makes the most sense for a "mixer". Like I
> mentioned before, extending the range down by 1 and making that
> translate to -32768 seems like a convenient solution. When setting,
> simply check if it's a mixer unit (UAC1 or UAC2, both do this) and if
> the set value is equal to the minimum, and set the value to
> -32768. For getting, check if it's a mixer unit and check if the
> retrieved value is -32768, and then set the value to the minimum. The
> only caveat is that the resolution might not align anymore with the
> range. What do you think of this idea?

I thought of it, too.  OTOH, it'll be a bit tricky, because the range
isn't usually covering -32767 but only a part.  So -32768 won't be
reached continuously.

I'm inclined to have a simple mute switch in addition.


thanks,

Takashi
