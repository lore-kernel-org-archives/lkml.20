Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319973;
	b=uJ4mkMWzbUNOXQ2Sc38eoCdjY63hqu7++h+OW4MTzcCS3zZSjZsgu18GyCmMY9CwaU5V
	 jOdnluDxP66B9dFDnzcL/f18200EOEqhkWnNEcotXrQ2HQfvcFkrIx7/oJDxGOAk/vYcS
	 WdrRC8i3WHeqbaIYoM42Gqr6yLrdUGaWNT9XmmCbmFCDMcILlbq5itvn5f39Lj0biUam7
	 CGb61fqnOcu+5bQcJuNtZxaZoFXI5NA/Y0AHVXYdp9LkA/kxwPb21cobzRq4tMb6/Th3/
	 DpjuXz7lZGzZZsMdCOWfiBVSlM4IZNSBkaf8WlOhi8uleRp5DEq1sslHrsbBDIrzIeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319973;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=uw/Rrf3/wz+RCpLlW24p4O0URuFHU1qLZV+48XecfA4=;
	b=FjbsErYj8bmTUWVHO2c9q9QOb2z/gPcUcRqZg7eZ0J3HCbguOBNvdSXM8sS32fvV6JTm
	 YZ4lXOMdzNdZJ1ke8cPj7umEp5KyLrVSVhYdx9Ze7Du8Adss4kh5L4bERpHu73tFc625X
	 Na7JXmuds9g8qpUEvHz7MvcBfClSdPYaLUBniUtyN1nmsMD8UlVqGigYrOspI3GykznB6
	 PJFMW7m5eSqepbWqfgXvi5gvQIRM+U6SPjW2akYpLIIstaqjw/+PlBdGCJJVUX8Ao+vu3
	 Rf40w057N2AaVSbPQSKoZeDWL6zabtB/9zU0Jsxw0EC0hirPIPbat1DnUsm3pPUrvZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vm+XxtY8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OulWI8Xv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vm+XxtY8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OulWI8Xv;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24597606A332;
	Tue, 10 Nov 2026 14:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24597606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vm+XxtY8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OulWI8Xv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vm+XxtY8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OulWI8Xv
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 154131F7EE;
	Tue, 10 Nov 2026 14:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794319971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uw/Rrf3/wz+RCpLlW24p4O0URuFHU1qLZV+48XecfA4=;
	b=vm+XxtY8SuT6qTbwQRZ8QmfOpBbcQ8a3V8WbTXEiENHqAxF9+fyDH0kt6na4trKDImu2NQ
	WtIQFILxS2Y5MlyiHUTaCQsU9asoPZJM4lV8z+H9RSFuFifv1clCOE5ozs2VyoEhnC/flG
	w6gTwLSLrApnfk1mh7KgjEyG7MtI8Ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794319971;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uw/Rrf3/wz+RCpLlW24p4O0URuFHU1qLZV+48XecfA4=;
	b=OulWI8XvE5VuCI8Ra2NlER4XnAdyCNBJfr6yQIL7Yh9y+CgoL5d39RzYj8tXUaRe+Bwqbb
	j0CWeLg2lH9toYCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vm+XxtY8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OulWI8Xv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794319971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uw/Rrf3/wz+RCpLlW24p4O0URuFHU1qLZV+48XecfA4=;
	b=vm+XxtY8SuT6qTbwQRZ8QmfOpBbcQ8a3V8WbTXEiENHqAxF9+fyDH0kt6na4trKDImu2NQ
	WtIQFILxS2Y5MlyiHUTaCQsU9asoPZJM4lV8z+H9RSFuFifv1clCOE5ozs2VyoEhnC/flG
	w6gTwLSLrApnfk1mh7KgjEyG7MtI8Ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794319971;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uw/Rrf3/wz+RCpLlW24p4O0URuFHU1qLZV+48XecfA4=;
	b=OulWI8XvE5VuCI8Ra2NlER4XnAdyCNBJfr6yQIL7Yh9y+CgoL5d39RzYj8tXUaRe+Bwqbb
	j0CWeLg2lH9toYCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9DD313479;
	Tue, 10 Nov 2026 14:12:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WeLYJ2Im82oiFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Nov 2026 14:12:50 +0000
Date: Tue, 10 Nov 2026 15:12:42 +0100
Message-ID: <87bj7wvkpx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Angel J <iamanaws@httpd.dev>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix the Dell XPS 8940 headset microphone
In-Reply-To: <57Kgu-Pdq28OE2JHZjO7YEuS6RCOZLFiDoZO8uqMUieYwA58mHOkRbbZADWKNQsocsNCzH1GkU4pSEhpi-l3mZenIkWdjdNsOHVlbAxGsXQ=@httpd.dev>
References: <20261103150336.507675-1-iamanaws@httpd.dev>
	<87wlqtukxh.wl-tiwai@suse.de>
	<5ncUNWXphcObbYD04quaQMbD0tGoekaHB-QQrX5tgC7sSbzoT9jRVrbY9PyT6mRbww0G9-voA6Y98HjvPg7U25kmeybfQALp5NsNKym-3pc=@httpd.dev>
	<877bilusui.wl-tiwai@suse.de>
	<57Kgu-Pdq28OE2JHZjO7YEuS6RCOZLFiDoZO8uqMUieYwA58mHOkRbbZADWKNQsocsNCzH1GkU4pSEhpi-l3mZenIkWdjdNsOHVlbAxGsXQ=@httpd.dev>
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
Content-Type: text/plain; charset=ISO-2022-JP
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 154131F7EE

On Tue, 10 Nov 2026 14:36:18 +0100,
Angel J wrote:
> 
> On Monday, November 9th, 2026 at 22:02, Takashi Iwai <tiwai@suse.de> wrote:
> > On Mon, 09 Nov 2026 18:58:47 +0100,
> > Angel J wrote:
> > > Thanks for reviewing. My understanding is that the guidelines require
> > > a known identity, without necessarily requiring disclosure of a full
> > > name. I consistently use “Angel J” and this email address for kernel
> > > contributions. My PCI fix, commit 8805840aad73, was merged with the same
> > > author identity and Signed-off-by.
> >
> > Is your identity really already widely known in the kernel community?
> > I see only one recent commit in the past, and I can't see it's really
> > "known".
> 
> Hi Takashi,
> 
> No, I'm a new contributor and not widely known, and a full name would
> not change that.

As Signed-off-by tag is a legal requirement, giving a full name makes
the identity obviously clearer.

> I don't read "known identity" as requiring it, though.
> Documentation/process/submitting-patches.rst asks for "a known identity
> (sorry, no anonymous contributions.)", which I understand as excluding
> anonymous contributions rather than requiring a full name.
> 
> "Angel J" is the name I use consistently for my public work, and I can
> be reached at this address.
> 
> Let me know if you read the guideline differently.
> 
> Thanks,
> Angel J

Honestly speaking, the problem is that I don't know you, so I can't
trust.  If you have been involved with the kernel development long
enough, e.g. already appearing with "Angel J" in many threads or
commits, then it could be a good sign that it's a trustable known
identity.  But it doesn't look like that for now...


thanks,

Takashi
