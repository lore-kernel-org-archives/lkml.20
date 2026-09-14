Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF98C46982B;
	Mon, 14 Sep 2026 16:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402395; cv=none; b=Onn3wyfOhsW+CQqfgj+g6QjmfWzVB2p0rPwAJmbB8trFG0KW6dr7F+RzCTKOdGsMXQTRPRBnlzjqXhHcPAzugb6GkEkFMvGjMzaf1N2qCgGWhH7XVdTSsqbjvPDjE0RjsoFySC751Ph6/9N58ly8UAySwnKzHphicB99IJkgW7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402395; c=relaxed/simple;
	bh=Bc9EGrC6/miymagBzCd8S7UG0TVz18bBhpeW5yUKMKk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l6LwJ/cuaFxyU/4Y6MYuLmt4MnvIZ5yM8RaXCeDL9u1UO9KfRAtsIWTHlHHqTJBUu3N8IFikufYZt0S/4QSHuv7TJS3A5Igf12qM7sLBRFwXDFfixwpDd7ysMP6RznxM2m1emw5vT4Ol3mpvkUR08Y0njNJNnkwpZv3YeUQh7xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qo/Ijewg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JmpMUzWL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e7rVSC/N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CysD6g0B; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qo/Ijewg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JmpMUzWL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e7rVSC/N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CysD6g0B"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 84A3621B0C;
	Mon, 14 Sep 2026 16:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789402387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L4MyBNLqBv7cZl/kOiq5LGjATGzyvFr/TcUTnK4rcpk=;
	b=Qo/IjewgZXXIn3k6aGk+ATQYsx9ZANZQq4Y0swzu6dsEbke0oqsus+gec2Ek4OXFtE8kQb
	tRKerDnpG+OOAPi/gz43BxFzYsIuGVxOMHZ9/jEb8T8Jvou1bwFlb/1YDV1vh93zzuUidA
	S8+fqxfMLgFpuifdZjXbTEb/lGJ8p+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789402387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L4MyBNLqBv7cZl/kOiq5LGjATGzyvFr/TcUTnK4rcpk=;
	b=JmpMUzWL/2E4WUUvEkrPW079Pft9ddFPky5KUMm7ymDf+CPcfAvTSnZPaZHR5FTt8y7cCA
	DiCEd49yPUQ/kFAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789402383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L4MyBNLqBv7cZl/kOiq5LGjATGzyvFr/TcUTnK4rcpk=;
	b=e7rVSC/N1BpdD4X+ri88QVSKYXTk75AGzx4ynNmnYV3X9CTH7JMYECZfEtsuj4Zw3IPUQK
	4Ywt1TSRWM1dUPwXU00PNto/Qn15mC8jscaD64XSUwTCiqnr3CRYMd7OEQ2GcAUyoIHz6K
	xBHpCc8g9UfcUsHAi+BtDFmCeu4V8ws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789402383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L4MyBNLqBv7cZl/kOiq5LGjATGzyvFr/TcUTnK4rcpk=;
	b=CysD6g0BLGkqcQcyFT58GfxSoCeDn0Z1w2PaKK3hEtEOEyyzKGZ9lBkQPBn7QFoF0aw4Cm
	YUwiXR1rkJ87vdDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2881613693;
	Mon, 14 Sep 2026 16:13:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uh2jCA8dqGpbGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 16:13:03 +0000
Date: Mon, 14 Sep 2026 18:13:02 +0200
Message-ID: <874ifrolpt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Yilin Zhang <yilinzhang@moonshot.ai>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Simplify success check in snd_pcm_open_file()
In-Reply-To: <20260914095248.33391-1-phucduc.bui@gmail.com>
References: <20260914095248.33391-1-phucduc.bui@gmail.com>
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,intel.com,moonshot.ai,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Mon, 14 Sep 2026 11:52:48 +0200,
phucduc.bui@gmail.com wrote:
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_pcm_open_file() returns zero on success and a negative error code
> on failure. Use !err to check for a successful return instead of
> checking for a non-negative value.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
