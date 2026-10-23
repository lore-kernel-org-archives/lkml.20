Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762413;
	b=o4Jp3k+SejO1s8ge6f+o23P989EZS0+PEBjRjrqAY7sZi3utH2EreuCySp4B3Tt3UqHp
	 lsmdSZh/k35v3rg4RTdajHgbzQ7rl2kAUhwFe8P+r/uGo5mXj3cg9ZZ4ok/gjWQ2USHom
	 E+55miw5S8uiNNAzjxBwWHlIIMa2fIC4wt/0d7811drQ3QlVWlJZM8+6ALENNwBv1PvPx
	 RY3MxISNk6b74cBksXLkxN4ipF0GiaMd+rxfsBtwhJ4K5VD8y3nNWIt7gNhk/1AwqUZBE
	 E5L6iJszr3epgC8W1TH+CaqIXtvJcTE5du0Ascufg4sbLLdia6OEgzpVOcIM0oLrtpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762413;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=E3mIfaST29Q0BSKQHyPA3v3xjFKRCFYzXbyrwkFZ8bQ=;
	b=4m5r9vNb2BcbjBsPooFW2L+0g4cG4wM7yT2hTQ9jAAMA/4MzqKkCiUaGxDCOtKqWt0df
	 /J6RYRluiNISbd0l8vM3DPOxkTwrtPGkvE4hUyibSmahzbsBsL/nJq/HbOihzW6qyato7
	 QoXqZR+6M7VyEsC/D2c7D2qEND7g/yFtE61bYgbJpxwqtgrxVP0RncVbX0eEk4Bkb9Acr
	 FTIh9ihlABgaK0vOLHy8sknKNpdBCnc2Z1mw7QsJ+zA4qwLz8ZXmUxR9ggYsHHXCDA8Ma
	 U0P2U9CD942A+Rn5ZU5w4l7I4wlhjBHAZJezjFhT2x6m/da6+JzqhS8gPN3eEbe7a/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bryxHmyu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AN+XmIJg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bryxHmyu;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AN+XmIJg;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC135606A31A;
	Fri, 23 Oct 2026 13:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC135606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bryxHmyu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AN+XmIJg;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bryxHmyu;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AN+XmIJg
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1ADE0220D3;
	Fri, 23 Oct 2026 13:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3mIfaST29Q0BSKQHyPA3v3xjFKRCFYzXbyrwkFZ8bQ=;
	b=bryxHmyuH82ASDpXmL46tsOtTIG4WHHfszuQseXVKSQhN8sgoRT15QD/MAO0Oxr8kGNWCC
	GfOXwj6JMcZsT4GDuU4yNRV4/uVlw6ZU1n7HbWnDrlddhqm6X/BsmCF5+Esye4xlvTo7Zi
	0H8IQHUmFuaF1q7V3SEuW2gtZiLNISE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762411;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3mIfaST29Q0BSKQHyPA3v3xjFKRCFYzXbyrwkFZ8bQ=;
	b=AN+XmIJgA/q6y/qYPMfYWQQd0CmsFoHBMCDC0iLkpldCx90SIZfqi0N88KHRmZ6wpxXpMX
	rTrrCCPisCUKW3Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bryxHmyu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AN+XmIJg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3mIfaST29Q0BSKQHyPA3v3xjFKRCFYzXbyrwkFZ8bQ=;
	b=bryxHmyuH82ASDpXmL46tsOtTIG4WHHfszuQseXVKSQhN8sgoRT15QD/MAO0Oxr8kGNWCC
	GfOXwj6JMcZsT4GDuU4yNRV4/uVlw6ZU1n7HbWnDrlddhqm6X/BsmCF5+Esye4xlvTo7Zi
	0H8IQHUmFuaF1q7V3SEuW2gtZiLNISE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762411;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3mIfaST29Q0BSKQHyPA3v3xjFKRCFYzXbyrwkFZ8bQ=;
	b=AN+XmIJgA/q6y/qYPMfYWQQd0CmsFoHBMCDC0iLkpldCx90SIZfqi0N88KHRmZ6wpxXpMX
	rTrrCCPisCUKW3Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A695D133F6;
	Fri, 23 Oct 2026 13:33:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Gyj/HSpi22otTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 13:33:30 +0000
Date: Fri, 23 Oct 2026 15:33:30 +0200
Message-ID: <87jyn8a6dx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ac97: Use snprintf() in snd_ac97_get_name()
In-Reply-To: <20261022081437.1029-2-blum@kernel.org>
References: <20261022081437.1029-2-blum@kernel.org>
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
X-Rspamd-Queue-Id: 1ADE0220D3
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
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,suse.de,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -11.01

On Thu, 22 Oct 2026 10:14:36 +0200,
Thorsten Blum wrote:
> 
> To prepare for removing strlcat() from the kernel [1], use snprintf() to
> append the codec name and the optional revision. Also use snprintf() for
> the unknown vendor fallback.
> 
> Fix some formatting while at it.
> 
> No functional change.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Applied now.  Thanks.


Takashi
