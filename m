Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91FB33689D;
	Sun,  6 Sep 2026 08:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788682354; cv=none; b=hs0jVH85W9wKbRh6ZKzvkzHgMycncA6IGmyJfvPWPhYtBG0tSc4UPk/TuLlbrSrHcoBEn9sXiJGKLItvlrlX332rm9cwubrKb/5FyByUl1ZygGesX9hVwCh9P7DK4CgBq1oOOMfNhz0Wm2c6zSXTwynhj4LNi8vgUD1nnhExiiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788682354; c=relaxed/simple;
	bh=UXC5ih3CiQJjbrc1tKM2XBw/ZjK07n5Vc3mGewRWGEQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GgOuVkIKRmio1YqfRV4PkOVmnJKmnJsc4ptGap6TK8yAuei/kpHFrWotMrZ7wmkr2ElkzB/xQQnwcjEGU8jlsxaE+bQU5Jkyl+ac97OB9GD60yNgF7iikdYxdmk7DHLHPNOImYSAgQoHDde0m+Tkndy7oPLN+KNAJqmfSWssi9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ftu5uuqf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jAyhhhAq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vz5zzKig; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Upz5goWq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ftu5uuqf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jAyhhhAq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vz5zzKig";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Upz5goWq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CB1B61F895;
	Sun,  6 Sep 2026 08:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788682346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B0G9kI+uDTPRlh4OIf8RspZdyo0EPHA2wEL70tItzAg=;
	b=ftu5uuqfv/5jq08fdPeNtu1JOjpdIRHKmmspZpuvf1/tFfqYJx2Aq6Q0mkz5dO8lygaaYv
	MCR6FDaDeo9pdMminvKf7+hEfNiqq9tB0Dl8QJOWJqz3mfErgVElV46zW3APXLu1pjbvVb
	y6DsJmb9bjncYeALqw0kmCnshRNLWCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788682346;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B0G9kI+uDTPRlh4OIf8RspZdyo0EPHA2wEL70tItzAg=;
	b=jAyhhhAqnHH7YM1kvrARWZBczRmRMnHuM8JMCc5AXxlQVgQE+HUQ6uPibd6EbVlYAbsPZx
	mKnGrMYWec8EbRAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vz5zzKig;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Upz5goWq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788682342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B0G9kI+uDTPRlh4OIf8RspZdyo0EPHA2wEL70tItzAg=;
	b=vz5zzKiglQV+f7xH2nkmKix3rlpQTias6hVv1TQ8i3y0jqDZEVTwnSvlTOaQYb+n5vT3lq
	EuwglM33u6tB29QdJL3p1/KjblKyv7S1rqOB5VwURrz+yk9rzsVmNlbtjXEMEVCBJ8mqHk
	jAiADw43ETwxy/FpvrWtJnC92enxZ+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788682342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B0G9kI+uDTPRlh4OIf8RspZdyo0EPHA2wEL70tItzAg=;
	b=Upz5goWq7UX+0IW3avkkSdUCgdcfIJwOQPD8UkFBhm4am2l63eSUndD+Mhny4Mlf14JW6b
	e54oJqXRN2Z9oZBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88C8313432;
	Sun,  6 Sep 2026 08:12:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iHH8H2YgnWqAcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 06 Sep 2026 08:12:22 +0000
Date: Sun, 06 Sep 2026 10:12:22 +0200
Message-ID: <87h5k24x3t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Krish Gulati <krishgulati7@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for HP Omen 16-wd0xxx mute LED
In-Reply-To: <20260905222659.10247-1-krishgulati7@gmail.com>
References: <20260905084951.9595-1-krishgulati7@gmail.com>
	<20260905222659.10247-1-krishgulati7@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: CB1B61F895
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Sun, 06 Sep 2026 00:26:56 +0200,
Krish Gulati wrote:
> 
> Add SND_PCI_QUIRK entry for HP Omen 16-wd0xxx (PCI SSID 103c:8ba9)
> using ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT, which controls the mute
> LED via a COEF bit write on the ALC245 codec. Without this quirk,
> the mute LED does not reflect mute state on this model.
> 
> Tested on the affected hardware; mute LED now toggles correctly.
> 
> Signed-off-by: Krish Gulati <krishgulati7@gmail.com>
> 
> v2:
>  - Fixed table ordering: entry moved to sort by PCI device ID

Applied now.  Thanks.


Takashi
