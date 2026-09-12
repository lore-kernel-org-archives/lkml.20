Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6492882AB;
	Sat, 12 Sep 2026 16:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230874; cv=none; b=Ooi8wOCJyIDc3EVJkmJQgzP/YGuw+yb523y4rrKolUh+PBTfcH4cz1kI707p6HCif/zRFfL5W2Aam/aQLncf96RfMnHrFTKrxgXEvypA7Zm7PSUnqwA0+vv7eGqq+iEN10CSmb7vrFqadxylhcvLn4fFk469KmBBE1SWAIffeWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230874; c=relaxed/simple;
	bh=Yie+mJnDEilKyGl5HeUOcuQYPRDUHOU+iRANw1a0OBw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J8oecm47igRmtTeUWvBg6ipsMCZXshqs1jxR5eRR1Yknde7G1/2gE9O7VzFgyT75P0g2lQQTS4Ko5Yw5+n56jBiMI2OIU31x8TjAwQf9IGcHAuPpagAyYAVIIUDNLAlUUsmPuzZ3TCe8QHXd1mmSICrHroRnjzOTRmiECTNbH4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XyVttXRj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6G+FxVlR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AubiiP5H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LPNqlA4p; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XyVttXRj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6G+FxVlR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AubiiP5H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LPNqlA4p"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 81AA421B17;
	Sat, 12 Sep 2026 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789230867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PuQ3AS6XjTcJ0b4vEGWExByymXZuijsT7Gzt/j7Mi3g=;
	b=XyVttXRjU0PkXn67JIXKOjO8AVvzYsArmBKocDe1g7qFJxFBZzj++8VfScbATRbaMAcVT2
	qod3CvUa9GLTbeAVjX/pF/THIZ6WH+aiEP2aBQSCiGJnEMdwqXE3zF37hWJpTqg6z9WaOF
	0ZuBn+sWyl+NVkc7ydwXdKmKJ6DaHAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789230867;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PuQ3AS6XjTcJ0b4vEGWExByymXZuijsT7Gzt/j7Mi3g=;
	b=6G+FxVlRbmX3XeToDWMhBKT6rzoL9D0ayiItmL9wO3Hs8ILNU4ui+QkAEnL+dcyOZEaBzZ
	UN8bsEMhur/lhTAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789230863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PuQ3AS6XjTcJ0b4vEGWExByymXZuijsT7Gzt/j7Mi3g=;
	b=AubiiP5HZkvL7xX7kjwr3L/UTO3fEz8VsQWNIq5n5iANTAszwJ/DN+BFDE7Cb7/yxNWBtA
	VEmjyrWywIpcmm7GzDGtpWS/TNvQvFf89u9zwXXJw/M7cVuctT+F5lsi+lhjlLi+t1aYy3
	GDau6u/Q1r1zYKI5h9gBjyJbxu6IPD0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789230863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PuQ3AS6XjTcJ0b4vEGWExByymXZuijsT7Gzt/j7Mi3g=;
	b=LPNqlA4pansjQpoI8zhOgR1kThuHrlgw5fI6TvCd+F04VpKHera/CYIKgd9XT5SHa7cpUp
	sNxgeMBGZRuEcvCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3895313687;
	Sat, 12 Sep 2026 16:34:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YLl+DA9/pWrGcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 12 Sep 2026 16:34:23 +0000
Date: Sat, 12 Sep 2026 18:34:22 +0200
Message-ID: <87tsnu1l9t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: Fix virtual master creation reference in kernel-doc
In-Reply-To: <20260912100548.86134-1-kmehltretter@gmail.com>
References: <20260912100548.86134-1-kmehltretter@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Sat, 12 Sep 2026 12:05:48 +0200,
Karl Mehltretter wrote:
> 
> The snd_ctl_add_follower() comment refers to
> snd_ctl_create_virtual_master(), but virtual master controls are created
> with snd_ctl_make_virtual_master(). Correct the helper name.
> 
> Fixes: 79c7cdd5441f ("ALSA: Add kernel-doc comments to vmaster stuff")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
