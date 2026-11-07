Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060182;
	b=IB/vIEKui+3ZA9H16U8oRbvi3i4Mb11KPh5rMX6W4CuJFL+eRKKKum81LRzF+YkQ1ywI
	 lHhirVp8CMJ1lmque0ClFAa59ldhIq6khT+bkWa9a0hQkm2hT6roU14x6+6Fuufbc7Iuu
	 6hviWCWDibumaPByNQIbGV9XOeG7E+LSFCJI6i6KAyHaSiAF0YrdBJtUiZhsbAmWx/fHX
	 H55NO1C2rr/l/XH9d2riRYb6T+AK7CtcnNsjSYb9qUi0Tgd+zd7D3jMtUiiLD5U+5mi+P
	 B9cGvRTHtkL7FxovHSwy0s/uNHNRJjuOsRMAIi2tBQoyD/u2nYDLE2CZ0WlTiIwX5VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060182;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=Xjx8SZeCsR5cLGb00YV9+Ib8vvpSls3PGDohbPHisnA=;
	b=WiTveqfApLOxhSmvQAIhv4Eyo04rlB42u6M4czgzs0qW9hR4rZrcRy5C/0i/5VWw4ZvW
	 zfWz+pJ56FDEurJfcLI+z0P7hwSG4OsajTiUmJJGpkR7lHRoQRfpVaxO8ug77zAVVu7AS
	 AV+XOo16WYOLGglt7raX4pNocr7PiGvqLblbOyh91PEUG0iYxaS8MrsYbXjxcNPSiUhJp
	 ZVXZonjy/1/ZMFjwOxFoKgZxWNwUEjC2eB0XvKrUawyk/qx+hlxwdZR17ktsmDBI16Xej
	 Sp73T4PDEaFPnaydOlaTfmFOR3bE+IsHF1UsTZXeJNN7VBOxr1TncpESfgxdNpE2lhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DdKzrU6H;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R5ZEM5hu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DdKzrU6H;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R5ZEM5hu;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AA1606A32C;
	Sat,  7 Nov 2026 14:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4AA1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DdKzrU6H;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R5ZEM5hu;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DdKzrU6H;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R5ZEM5hu
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BA14621FF8;
	Sat,  7 Nov 2026 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794060179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xjx8SZeCsR5cLGb00YV9+Ib8vvpSls3PGDohbPHisnA=;
	b=DdKzrU6HetWnvUkw5lEEtORYb/U/sx+iHvnr9Nt9T8ZjPywfkbZz+AA/kTuN20bCn5BtN3
	KcdlBZpj6X9cbLVVFhaW+65lpkYsreaG/B6nygOy/FrWIHStoR/gttWuRsMTU1TAg3DY+0
	Ph9BaemD3Py4Gpk7Jy00mqdB18y5Q84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794060179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xjx8SZeCsR5cLGb00YV9+Ib8vvpSls3PGDohbPHisnA=;
	b=R5ZEM5hu9kGzFFZpSNtZhj2wCLg0GjY/bud73lWOT+G4uD9PWamw9lrodmn3Za/qDC5E9Z
	rN1uoYt3PyAHHDBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DdKzrU6H;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R5ZEM5hu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794060179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xjx8SZeCsR5cLGb00YV9+Ib8vvpSls3PGDohbPHisnA=;
	b=DdKzrU6HetWnvUkw5lEEtORYb/U/sx+iHvnr9Nt9T8ZjPywfkbZz+AA/kTuN20bCn5BtN3
	KcdlBZpj6X9cbLVVFhaW+65lpkYsreaG/B6nygOy/FrWIHStoR/gttWuRsMTU1TAg3DY+0
	Ph9BaemD3Py4Gpk7Jy00mqdB18y5Q84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794060179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xjx8SZeCsR5cLGb00YV9+Ib8vvpSls3PGDohbPHisnA=;
	b=R5ZEM5hu9kGzFFZpSNtZhj2wCLg0GjY/bud73lWOT+G4uD9PWamw9lrodmn3Za/qDC5E9Z
	rN1uoYt3PyAHHDBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56499133F1;
	Sat,  7 Nov 2026 14:02:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jwywC5Mv72o0BgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Nov 2026 14:02:59 +0000
Date: Sat, 07 Nov 2026 15:02:58 +0100
Message-ID: <87ld74yc19.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: info: Use snprintf() in snd_info_card_create()
In-Reply-To: <au8uNTlz49yooqNf@kernel.org>
References: <20261107004338.323417-2-blum@kernel.org>
	<87a4nlypdt.wl-tiwai@suse.de>
	<au8h4SDC6fKaY7st@kernel.org>
	<87tslsycva.wl-tiwai@suse.de>
	<au8uNTlz49yooqNf@kernel.org>
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
X-Rspamd-Queue-Id: BA14621FF8
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,gmail.com,intel.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.01

On Sat, 07 Nov 2026 14:57:09 +0100,
Thorsten Blum wrote:
> 
> On Sat, Nov 07, 2026 at 02:44:57PM +0100, Takashi Iwai wrote:
> > On Sat, 07 Nov 2026 14:04:33 +0100,
> > Thorsten Blum wrote:
> > > 
> > > On Sat, Nov 07, 2026 at 10:14:38AM +0100, Takashi Iwai wrote:
> > > > On Sat, 07 Nov 2026 01:43:37 +0100,
> > > > Thorsten Blum wrote:
> > > > > 
> > > > > While the current code works correctly, replace the unbounded sprintf()
> > > > > with snprintf() to bound the formatted string to the str buffer.
> > > > > 
> > > > > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > > > 
> > > > Shouldn't we use scnprintf() instead?  Otherwise it may lead to a
> > > > compiler warning.
> > > 
> > > The only difference between snprintf() and scnprintf() is the return
> > > value, which is unused here. Both are correct and shouldn't trigger a
> > > warning.
> > 
> > Well, not really.  For this particular patch, it doesn't make
> > difference, but in some cases (like the use with %s), snprintf()
> > causes a spurious compile warning with W=1.  e.g. try below.
> 
> Agreed, although that's a different use case from my patch.
 
Yep.  I guess a warning is triggered only when filling a substring
that can be large into the fixed size buffer for now, but it's a
compiler's thing, that can change at any time in future...

> I don't see a warning when compiling my patch with W=1, but I'm happy to
> switch to scnprintf() if you prefer.

I'd like to bet for a safer way, so let's go with scnprintf().


thanks,

Takashi
