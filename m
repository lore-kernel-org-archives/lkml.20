Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DEF34EF0C;
	Thu,  3 Sep 2026 07:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420892; cv=none; b=Uix+uxwBPNIZDrDksnJOcXZejVfyirSXwumV0g9Rjg1gb/zaohH19o6gFF7IF+4cC6iZP2ZKtAIghGgAS/d1YWMsbh3YgCuYfRQXm5MGy1U4lYF/IxpzP2j2PoOTF83fB/Otsyzp63yDa9QU3E4SLm6aMMFyWl0v0mNayIOWOxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420892; c=relaxed/simple;
	bh=z1GL8DyrbzbBeicZKJoLrzpA1N8XFi362aC25jjTLpo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nGKVP9MTRdjBuUnhyHXQFemEkndVaOB/c2mzWkR9W3c0EMQbjUoZelz9gm1nCxleP9bM813BWymGMVI/7cn6e5Vik2P3jexp36JxUKFi4pMqaGa/18qpwyPPh/ZlItCoHPQlJiTbo1PydH3/t/A7JLzuApnWDiv6OAznYMa+ZKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aZHLadL3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ofwWjeS5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lVLRhhZs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eMYRMAjE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aZHLadL3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ofwWjeS5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lVLRhhZs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eMYRMAjE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D9B1321E6F;
	Thu,  3 Sep 2026 07:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788420885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0yG6i1RpkTzU5a/Kz8rnOqMn2C995jWNzse3oI3xMQM=;
	b=aZHLadL3hRdSV+ouQFS8VmXGUpMxwyf8GPGEMdYImE1k05EocFqJsesVLUlmJSK5RD0UIV
	cF4C3ko4YtcK7npfeGlUB8q/eJuQ8HV6QtJhRqBul3n1cHZoKfDLw5epzveHHEzWNET3+A
	ZftrYjhaJa93/gkw75RtRSpu+S2tY+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788420885;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0yG6i1RpkTzU5a/Kz8rnOqMn2C995jWNzse3oI3xMQM=;
	b=ofwWjeS5Eq8826WfhcRQm8e3i02MKdEblYWShZImniiAS3hIcVVBkbfbLFfqI6SZKDhw7g
	8fStegSugVv+Y0AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lVLRhhZs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eMYRMAjE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788420880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0yG6i1RpkTzU5a/Kz8rnOqMn2C995jWNzse3oI3xMQM=;
	b=lVLRhhZspfD4PP6uA2S1N9aXuGmC0YlsII5NTgvNXbbgQ4SnDGdL8kcxiYt88TSJ+l31S8
	z8qdflt3e1tRKpcEAhwfzV+WGblbSeJx57Ehbb6Z36mbCIaZwRNpzDp2ZLhFrhMhF0v7Cr
	VKsQRopfSY/q95+tvbgfYYGcoL/VUug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788420880;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0yG6i1RpkTzU5a/Kz8rnOqMn2C995jWNzse3oI3xMQM=;
	b=eMYRMAjEMTBK32dO7ucL7LfyRwqvhSwqZr5s5hcLz9k+NlPHNj7WRgdr9984IGQYLqFCES
	mTK9E7qFjYzdjxAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9593A136E6;
	Thu,  3 Sep 2026 07:34:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 29NjIxAjmWqccAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 07:34:40 +0000
Date: Thu, 03 Sep 2026 09:34:40 +0200
Message-ID: <87zexy94a7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oleksandr Kovalov <oleksandr.kovalov.work@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Fix cold-boot headset misdetection on Acer Aspire A515-57G
In-Reply-To: <20260902171305.3955-1-oleksandr.kovalov.work@gmail.com>
References: <20260830211038.19528-1-oleksandr.kovalov.work@gmail.com>
	<20260902171305.3955-1-oleksandr.kovalov.work@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: D9B1321E6F
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO

On Wed, 02 Sep 2026 19:13:05 +0200,
Oleksandr Kovalov wrote:
> 
> On the Acer Aspire A515-57G (PCI SSID 1025:1616), if headphones are
> already inserted into the combo jack before the codec powers up (a cold
> boot with the plug already seated), the impedance-based headset-type
> sensing races and misclassifies the jack. This drives the wrong output
> configuration and is audible as missing center-panned content (e.g.
> vocals) while panned content plays normally.
> 
> A genuine physical unplug/replug after boot reliably fixes this by
> forcing a fresh sense transient, which is a strong hint about the
> underlying cause: the sensing hardware appears to need a settled,
> freshly-triggered read rather than the one-shot classification done
> during the normal HDA_FIXUP_ACT_INIT pass.
> 
> Add a machine-specific fixup that, on cold boot only (not S3/S4 resume,
> which already gets its own re-check), waits briefly after the normal
> init-time decision and then forces a fresh headset-mode classification
> by resetting the cached mode and re-invoking the existing
> alc_fixup_headset_mode() path -- mirroring what a manual replug already
> does. The wait+recheck is skipped whenever the first pass already
> determined nothing is plugged in, to avoid adding boot latency on the
> common case.
> 
> Chain into the existing ALC256_FIXUP_ACER_SFG16_MICMUTE_LED fixup so
> this quirk-table entry keeps providing mic-mute LED support alongside
> the cold-boot headset fix.
> 
> Tested on kernel 7.1.9 by building the affected module standalone and
> confirming cold boot with headphones pre-inserted plays correctly from
> the very first sample, across multiple boots (including a full restart,
> and headphones inserted mid-POST rather than before power-on), with no
> crashes or warnings and no behavioral difference from a real
> post-replug recovery.
> 
> Signed-off-by: Oleksandr Kovalov <oleksandr.kovalov.work@gmail.com>

Thanks, applied.


Takashi
