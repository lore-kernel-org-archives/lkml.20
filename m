Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFEE4973AD;
	Mon, 19 Oct 2026 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399418; cv=none; b=bUQ05lECqg9KZtBhIv9kcLmxZ0oVd25sVJUab1lOoncmgdlNp6//UhUbjgmvjKpEMUV1wiA2TrzLQPm08bkCoP1V6vTOjurK/1QtruhVc9Cv3GW6XnvuQRwOKqSeegvQ/1SiW4780SMojL+0ZN90R+pxsFj0k3/jmh2BnUPG02I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399418; c=relaxed/simple;
	bh=H5ZWuwayqodw1nPRTY9Po9FThDsWz8kXR5qiLb5ZKtw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rAnf00E9SoxD1ogVxeAmhrt1s56rZ8zLKRjXiBoxVXN9Nh8MggkkHECYZp3njv/fgBTHyCaGGPnoPHk28zQPCIUqiCzCl8Hxt9sOxnRjeXQ3rBozf71kxjhifNDU0XUnLHRQONLmcszY43JpkyozUiXjSRppWU+ujFtbAb64ZEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RXX90TQq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y+udgynp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RXX90TQq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y+udgynp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RXX90TQq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y+udgynp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RXX90TQq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y+udgynp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8011D1F441;
	Mon, 19 Oct 2026 08:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792399412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00Al9gwLs75LPZT6oAqqKPOVoVVeqy2BP4AdpRGvjnA=;
	b=RXX90TQqy4iOgJRpilMgE4rqsFr2H1/xzb2zBaTMPnFlTid+Sl2eoMuBI8pEVtuZzZBtCw
	rGLZ/wY+9chbJG2H+G295MRBWXUdcNYe4873anspJ5aU+O/Vik68k9GijvAVawP4lV2Ep6
	I2duzstTNSSh0+fEjBDC7sZU6SZmjRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792399412;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00Al9gwLs75LPZT6oAqqKPOVoVVeqy2BP4AdpRGvjnA=;
	b=y+udgynpiDomubsesu2abgzo1wFqiHUFZC1cI254GTy57wZN/0bFiDQzG5c7Xy9YkGq4uW
	5o/oEjF8kZ3hV0CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792399412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00Al9gwLs75LPZT6oAqqKPOVoVVeqy2BP4AdpRGvjnA=;
	b=RXX90TQqy4iOgJRpilMgE4rqsFr2H1/xzb2zBaTMPnFlTid+Sl2eoMuBI8pEVtuZzZBtCw
	rGLZ/wY+9chbJG2H+G295MRBWXUdcNYe4873anspJ5aU+O/Vik68k9GijvAVawP4lV2Ep6
	I2duzstTNSSh0+fEjBDC7sZU6SZmjRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792399412;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00Al9gwLs75LPZT6oAqqKPOVoVVeqy2BP4AdpRGvjnA=;
	b=y+udgynpiDomubsesu2abgzo1wFqiHUFZC1cI254GTy57wZN/0bFiDQzG5c7Xy9YkGq4uW
	5o/oEjF8kZ3hV0CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A456136CC;
	Mon, 19 Oct 2026 08:43:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lLDENTPY1WpUcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Oct 2026 08:43:32 +0000
Date: Mon, 19 Oct 2026 10:43:31 +0200
Message-ID: <87fqy2axn0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>,	Cen
 Zhang <zzzccc427@gmail.com>,	Will Porter <mrwillporter@gmail.com>,	Takashi
 Iwai <tiwai@suse.de>,	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: usb-audio: Simplify usb_audio_make_shortname()
In-Reply-To: <20261018124155.2081-3-blum@kernel.org>
References: <20261018124155.2081-3-blum@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,suse.de,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Sun, 18 Oct 2026 14:41:54 +0200,
Thorsten Blum wrote:
> 
> Copy the preset and quirk product names directly and remove the local
> char s pointer. Return after trimming the device product name and use
> the USB device ID as a fallback.
> 
> No functional change.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Applied both patches now.  Thanks.


Takashi
