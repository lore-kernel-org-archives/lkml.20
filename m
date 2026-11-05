Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890874;
	b=de9LslozC95H38RFwkcTmvXVIkaxj9YNAJuAU2ydOvp1kEzEJ9AJUjGOzjdgb5L7E/LW
	 c17AUxejxqYbXXdwu8jdAriJzdO89T1rWviUsUQmFNSLCH68P/wqnj1RsJ96M3B0l9Znq
	 kl8xu3F7X1MFMgDvCkNoQVBJtrLFJ59cFKo7PzPQOjw75GGnq7XrKrxPEc7h2K5viYAxW
	 gsT7A9ZP+CXoO8S7oWlU/zsOloqrCRIfpz8thxK5VnBHcFyXMwEMqdH8fd/9jQCjRaaKt
	 4tU7gebRM4dSytH1PY+kcfd9hvt2ji5AHWEz2xCH3bXiy+0cIvLvvuY/M889MU6RWyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890874;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=wXaV0u9U+tyhWgUT/VUuCMFkmWt5iSfbGT8PiyOgGi0=;
	b=FNbT05urtTdY2FdQiw0sz+F5xAS1iTN4d/72rFRxPZBIj31QACNwdL0xN5Sw4i7zsT08
	 hpXT/H7KeMC5RmOCI1lIKtVJtLninZPVHXjPJ/vrlnjJvtUSU9593EbgltRFYPEOM6D8p
	 lUkzSHinfBhvMOYlwmPZ1nBENUVfT5rt66o7hzeCcHKX+LLOuVZD9L53T9savKtV4JY3u
	 hdpanO5xG0lIKbWxyGd5QV2cr/m0b9qjWJwk3GI3qm3CRmVPsgDmEtyDA8++GxGZDB4mr
	 PcWpmNpQszHxQQm76q+vW0+ksfu2/KadAMn0aSqcA3R8Ng+zywscEmO/ZgS25ErcaCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SBkBRxdv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Vy9Hrgov;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SBkBRxdv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Vy9Hrgov;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDFA606A31B;
	Thu,  5 Nov 2026 15:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEDFA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SBkBRxdv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Vy9Hrgov;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SBkBRxdv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Vy9Hrgov
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F14A221FB8;
	Thu,  5 Nov 2026 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793890872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXaV0u9U+tyhWgUT/VUuCMFkmWt5iSfbGT8PiyOgGi0=;
	b=SBkBRxdvHkO7jFMEtYXV9ih4xecWL6zfmjBY6GA8IfNu9/BCbjy9ARszAQx5H139VB7Ftj
	oRCYqiTLcRBoRmjNPDq3M6rNjME7Gkry5u5xsyEybXestAzGM3fXCN30qCJs0VBKQj2cme
	2TY4IgTtua6nS5TJtKIKazSiYxcoRMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793890872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXaV0u9U+tyhWgUT/VUuCMFkmWt5iSfbGT8PiyOgGi0=;
	b=Vy9HrgovwinEo8f8KP4WGkRMgT8JKt7/+kfzE4Kc6ofERwc6B078V0E9to6MftB9xwyNMr
	EzBCsS8f+ldaoODw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SBkBRxdv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Vy9Hrgov
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793890872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXaV0u9U+tyhWgUT/VUuCMFkmWt5iSfbGT8PiyOgGi0=;
	b=SBkBRxdvHkO7jFMEtYXV9ih4xecWL6zfmjBY6GA8IfNu9/BCbjy9ARszAQx5H139VB7Ftj
	oRCYqiTLcRBoRmjNPDq3M6rNjME7Gkry5u5xsyEybXestAzGM3fXCN30qCJs0VBKQj2cme
	2TY4IgTtua6nS5TJtKIKazSiYxcoRMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793890872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXaV0u9U+tyhWgUT/VUuCMFkmWt5iSfbGT8PiyOgGi0=;
	b=Vy9HrgovwinEo8f8KP4WGkRMgT8JKt7/+kfzE4Kc6ofERwc6B078V0E9to6MftB9xwyNMr
	EzBCsS8f+ldaoODw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 979C7133F6;
	Thu,  5 Nov 2026 15:01:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Flh+Gjea7GqBSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Nov 2026 15:01:11 +0000
Date: Thu, 05 Nov 2026 16:01:11 +0100
Message-ID: <877birs4p4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nguyen Thanh Nhat <nguyenthanhnhat397@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kailang Yang <kailang@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Acer Predator PHN16-71
In-Reply-To: <20261105130330.6797-1-nguyenthanhnhat397@gmail.com>
References: <20261105130330.6797-1-nguyenthanhnhat397@gmail.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: F14A221FB8

On Thu, 05 Nov 2026 14:03:30 +0100,
Nguyen Thanh Nhat wrote:
> 
> The Acer Predator PHN16-71 (subsystem ID 1025:170f) with a Realtek
> ALC245 codec does not detect external headset microphone on the 3.5mm
> combo jack because 0x19 pin is marked as unconnected (0x411111f0). Add a
> quirk using ALC2XX_FIXUP_HEADSET_MIC.
> 
> Signed-off-by: Nguyen Thanh Nhat <nguyenthanhnhat397@gmail.com>

Applied now.  Thanks.


Takashi
