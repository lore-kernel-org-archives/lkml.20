Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EA44D5979;
	Mon, 28 Sep 2026 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603743; cv=none; b=uuQ8XeTFFojNQJGqHG7tr2e6SP6ycF6F7ol3OayZtllgIF4mtW58AQdryQs3o3E6OFSTwQC3aLQGkhvI8PyJ6cXT26rb/eJXUDVNZohgk3bIQd+SNBAckKUBbcjpmnrIMZPJolUVuiT+u05IxS5krTrP5y2d+7m+uttb6Z1XWsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603743; c=relaxed/simple;
	bh=dpjRVqqdpbFBy5bzupRdBusR8ASHtrt5mSY6V3JJi7Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G9AHdB+k5GQ+vChfRQouqyCywkqZxgvBa6Ae4mJjB6lNSpF3EFv5esmptfc+wsL5mW/aLOFB5Su4EbRirM5/1DeDoYQ87Ad++cf3VyVTXRmsWpFiy8l97YArCnKEqrycTKInDmdYI4P9BPvww8wJD8bu21yYZusVgvm+QnJF0ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EMcWdQVX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fbOKYax4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rYY2TWGq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X6Lq3ZYv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EMcWdQVX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fbOKYax4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rYY2TWGq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X6Lq3ZYv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EC9D821BD4;
	Mon, 28 Sep 2026 13:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790603736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6aYByQM/SeGkmsxYiU0kL9QzGHYWJSWl0AcN13rheuE=;
	b=EMcWdQVX7XLem2pX7GB/w0KeYM+t166brqsyt2fvnDOQ2cDnKCUg+QkxOpbyPt451AFxVx
	KY94pSzk1NCsPEvVB6oUJZi2D0U+UOqTYAbblguVmyLu3Lb3J+Hjo5JR4iR0aBkzD1ZKY0
	O0YXsCMrcX002yyI6PM6R4BJFdb6f4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790603736;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6aYByQM/SeGkmsxYiU0kL9QzGHYWJSWl0AcN13rheuE=;
	b=fbOKYax48oZiBV7PwZV84gaFPGNxEoudr8WxHMUz4ccAeKUQBiGwPKEN3BisKI+RdQZAVQ
	0YClzDqqnfnsjPAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790603731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6aYByQM/SeGkmsxYiU0kL9QzGHYWJSWl0AcN13rheuE=;
	b=rYY2TWGqakm/Pq5cjD9WLftHmyENetQz0p1gPErGoA/8sOVg4nqF7KgPhud+3ztTd5SlUK
	nu+faRtLv9qyVl+ImPd+W2X5IRsEBoJRIWYQEPtixFMm7FhDOwYa4q2wZ+qzdXZBTNu3aW
	HGapvPnf0CNEOXZIFsd2t6f0EvNzV3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790603731;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6aYByQM/SeGkmsxYiU0kL9QzGHYWJSWl0AcN13rheuE=;
	b=X6Lq3ZYvYNL79Q/Bt6MRz3hfoidFIuq+K3v04caRM0gAzw4KxOUSyWfFY/NsGbMPlRk/A0
	vpkcNX/0sYmglhDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6121133F3;
	Mon, 28 Sep 2026 13:55:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QSO5HNNxumogWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 13:55:31 +0000
Date: Mon, 28 Sep 2026 15:55:31 +0200
Message-ID: <87o6dh4h0s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bartosz Brom <bartosz.brom06@gmail.com>
Cc: perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirks for HP Pavilion 15-eh3174nw and HP Laptop 15-dw1xxx
In-Reply-To: <20260928134335.1875-1-bartosz.brom06@gmail.com>
References: <20260928134335.1875-1-bartosz.brom06@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -1.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Mon, 28 Sep 2026 15:43:35 +0200,
Bartosz Brom wrote:
> 
> The HP Pavilion 15-eh3174nw with an ALC287 codec requires the
> ALC287_FIXUP_HP_GPIO_LED fixup for its mute LED to work correctly.
> 
> Add subsystem ID 0x103c:0x8bc7 to the quirk table to apply the
> existing fixup.
> 
> Tested on an HP Pavilion 15-eh3174nw; the mute LED now follows the
> speaker mute state.
> 
> The HP Laptop 15-dw1xxx with an ALC236 codec requires the
> ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO fixup for its mute LED to work correctly.
> 
> Add subsystem ID 0x103c:0x85f1 to the quirk table to apply the existing fixup.
> 
> Tested on an HP Laptop 15-dw1xxx; the mute LED now follows the speaker
> mute state.
> 
> Signed-off-by: Bartosz Brom <bartosz.brom06@gmail.com>

Applied now.  Thanks.


Takashi
