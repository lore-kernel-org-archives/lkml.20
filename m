Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803233;
	b=FQP+2iLXU3/Vbrugx34+gpu/ib5HTC2WBm3YJdX1aMivcGnfQK4tCoKhtXkX6TVTc95h
	 ANIPph+PqcWyoMVBrOzkAUePwEAopaIMsqnRxR71gtNTe85B8416/X4u0F93DUXGzSN5b
	 sVZYqke0IPPGMAJBaSGDrpKOoGVyfg434l6yKcjxSyHJv4NFe21oGO0qlZKNJKaJh/wGq
	 CU+paHB5tFEU5QMx7byV1spdx03pLOhyTnEoJcEmx6iIVZTE7bLIsb+Sk1/HJvJFzhEl2
	 B3nHDZtLjUQdYhZgH43lONA43jBEdTEY1XdnLL+wm6Io7doMLRqrgyz1sN5t7Xk93CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803233;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=2DYYf1hsdR3loFoUXN2uFhUsGhSStAvo5fa3iMTawso=;
	b=CBaVLMhb2S8Vb4nkfNdERnO5m0La74uKxtf/dXOj1FSn6aztyKJf+CMl72cNw5gdtlLL
	 kx23jRMZZHRhVMGT0+IUQsLs+a2t7s8UvpQXDV0NXciWc0TTA6zyXopAubI+08cRKQPUW
	 nf7W9OlxhtgsYBTIacJ/Hrc+PwB5+EDlSdw3Cziqg59BvefF6xijNcCCSJ3mnzGz08HMU
	 axIWZk7ikHK0cxHattgDlFBHCrjMFb3CwkFofZr/j1+eoq4u31yMLBhs4+1NtjkOKGNMk
	 YvKnDI8XJ05XfryQcnpwUfZg/AgFUNNTVuW9x3tcyfiNQ892+smJ5eWJheeMcihBHVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="qQ2viH/9";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jwRjBCjX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="FmEGP/JS";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=59UQ5J+7;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE56606A326;
	Wed,  4 Nov 2026 14:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFE56606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qQ2viH/9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jwRjBCjX;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FmEGP/JS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=59UQ5J+7
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DB28021DB3;
	Wed,  4 Nov 2026 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2DYYf1hsdR3loFoUXN2uFhUsGhSStAvo5fa3iMTawso=;
	b=qQ2viH/9ONhQJ/Nn4ibHfOHH1B4SdlF+/AcjOzQeWeRxpWnF7CRTlOY8IdUDm78YqKeNW/
	SLf4prf0dOqtedc85Tp9/IHB9mXpwD7WwVfDe+QIQu5EwTPUO0Gh5NqU/ONebatFlHwvAS
	HGggADprXfe06WNjFVB459CZgfEZ9ew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803231;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2DYYf1hsdR3loFoUXN2uFhUsGhSStAvo5fa3iMTawso=;
	b=jwRjBCjX7pmqdxd2aZjOJY/Naus8uwGhOy9Rg/j36evyzKNVOB4PM7wceKWjzHVBpgWZC3
	FPZpR90IfNPh10CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2DYYf1hsdR3loFoUXN2uFhUsGhSStAvo5fa3iMTawso=;
	b=FmEGP/JSJnSYAKXKlxnkBf580GiG1lfEdspU4e4r5IobWhVuV/RM/6iQLZa8p8cCi9hJBi
	qTQ3y42w/pMTWlybE5tqMjH10dSL1B7AZwxMwD6sdEqZe4AnaUGKzYUNhHbDuaWpcl6mpD
	KIj071Fdr42S/euNo/9sizpJIVG7mY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2DYYf1hsdR3loFoUXN2uFhUsGhSStAvo5fa3iMTawso=;
	b=59UQ5J+7pDbVXoQVMHERlEDP1Jje+ToF/NRvRbqVUXlvEydixI6vbPwDrsWr7n0CsO5I0+
	MwDp7nWe5dPDveBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E0F9134F0;
	Wed,  4 Nov 2026 14:40:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ij6gF95D62pbegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 14:40:30 +0000
Date: Wed, 04 Nov 2026 15:40:30 +0100
Message-ID: <871p90vew1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: raoxu <raoxu@uniontech.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	luiz.von.dentz@intel.com,
	brgl@kernel.org,
	pengpeng@iscas.ac.cn,
	pmenzel@molgen.mpg.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: cs8427: read the PCM stream IEC958 status from its own buffer
In-Reply-To: <7A8A7F3C30522F89+20261104083304.4000520-1-raoxu@uniontech.com>
References: <7A8A7F3C30522F89+20261104083304.4000520-1-raoxu@uniontech.com>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 04 Nov 2026 09:33:04 +0100,
raoxu wrote:
> 
> From: Xu Rao <raoxu@uniontech.com>
> 
> The IEC958 Playback PCM Stream control writes pcm_status, but its
> get callback always returns def_status.  As a result, userspace
> reads back the default status instead of the PCM stream status after
> writing the stream control.  Rate changes also update pcm_status
> without being reflected in the value returned by the control.
> 
> Select the status buffer using the same private_value as the put
> callback.  The default control continues to return def_status,
> while the PCM stream control now returns its own current status.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Applied to for-next branch now, as this is no urgent fix.


thanks,

Takashi
