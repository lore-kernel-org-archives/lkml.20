Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE642472A6;
	Mon, 28 Sep 2026 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599674; cv=none; b=WN8DsDjyXidpAfaEKWzAucbu8NCcZPFUYWqklfkoEmR+8wLpnoCeNsb8x7er2FnwGTMJTlt0rRvA9WK2Gzq6JeLZqoqw2m2hOdHJIyquR+BZ+LIV4ukpD7V6Tz8dUnSBSYjO6O8JAR8etqWzHtiynxZJL0N4EQRs7GuUFEf5PMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599674; c=relaxed/simple;
	bh=QQxRVZ+cb2QSvoo6mlEiUXEFQJKc+z7B7RdMIRAUUHI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P5idUF8B5QqtxQHn9T3Lm3BEtHXQ8Zr+N4VE8HzF5+ZBA8QdEfYO3E9sCIELoLcaqb3rKiad7aviPFXsqjJIL/9dw7FssySykjyNoqY0RmY/PMcrgwaNwquClFTHg6Xvnyd0hlpBwMWVnm5v5+ybSM4fEINYksjKPEc+NrE9p84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mDQ20b/E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=orUVqyo/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GuoLrVVZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7Qw5u679; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mDQ20b/E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="orUVqyo/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GuoLrVVZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7Qw5u679"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EE3D51FB13;
	Mon, 28 Sep 2026 12:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790599667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFymNOEv8E41gn9en7Pb9rLDX/3JXvNm98WYpAu2VRE=;
	b=mDQ20b/ExtyJ/N3bo/fnSNgQwxdhDYcslzwZ2akQ94GFgCoVkE3cmLCgTL6N8zyHm/nV48
	HbEP5H8n7fACBkrONQi2jpSg/JZ9QLlWWnT5j8SGAqMIApAn34mLyFpm40b4DYsuh7Do+9
	yLI9E8wqRDWkprKTDFIeRguyOztPs3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790599667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFymNOEv8E41gn9en7Pb9rLDX/3JXvNm98WYpAu2VRE=;
	b=orUVqyo/VmoQfo2Ys2fHOcKHe6rgmbTtFIpT+cJGISbFFuhwIjRCpvG7GvA37zKW4Db1de
	Rf0c5PXpDd3wrXDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790599662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFymNOEv8E41gn9en7Pb9rLDX/3JXvNm98WYpAu2VRE=;
	b=GuoLrVVZ+I0PggfVsIkW2OMdics9g6QdDfx4fhXubrsz5j2Jta+dmrQ5qA8i95nP8Oh2zJ
	6usWOnzR+1uhpzizG19vD8U1fodVHMBWIi4xv92zUPf0nbKN6a484qTetxGhrv9yS8GDQM
	BmqpWaIVaBCscLyL4fbUO1NubpSY+5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790599662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFymNOEv8E41gn9en7Pb9rLDX/3JXvNm98WYpAu2VRE=;
	b=7Qw5u679vSMAcqfAyHcY0PbRlhPsmAmsoLo23iyZc90877ydah4cM9cM866AyeqCk01s33
	tJ63VA3+DOKScmDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A698133F1;
	Mon, 28 Sep 2026 12:47:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LdWLEO5humr4DwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 12:47:42 +0000
Date: Mon, 28 Sep 2026 14:47:41 +0200
Message-ID: <874if95yqa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Krish Gulati <krishgulati7@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org,	Zhang Heng
 <zhangheng@kylinos.cn>,	Eric Naim <dnaim@cachyos.org>,	Damien Dagorn
 <damien.dagorn29@gmail.com>,	Kailang Yang <kailang@realtek.com>,	Habil Eren
 =?ISO-8859-1?Q?T=FCrker?= <habilerenturker@hotmail.com>,	Bob Song
 <songxiebing@kylinos.cn>,	erph.briones27@gmail.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Victus 15-fb2xxx
In-Reply-To: <20260921131728.8999-1-krishgulati7@gmail.com>
References: <20260921131728.8999-1-krishgulati7@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,hotmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,kylinos.cn,cachyos.org,gmail.com,realtek.com,hotmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Mon, 21 Sep 2026 15:17:03 +0200,
Krish Gulati wrote:
> 
> The HP Victus 15-fb2xxx (PCI SSID 103c:8c2f) with the ALC245 codec
> does not turn on the mute LED when audio is muted.
> Add a quirk entry to enable it.
> 
> Reported-by: erph.briones27@gmail.com
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221946
> Signed-off-by: Krish Gulati <krishgulati7@gmail.com>

Applied now.  Thanks.


Takashi
