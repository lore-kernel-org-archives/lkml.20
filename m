Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D694B8287;
	Wed, 30 Sep 2026 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775974; cv=none; b=bz0QScbwkRK+3CnGNQeX9ssFQjszDJNmCkaUE1h5X1lhCwxmAlT1WIzz3IoW+oTanyKkTrnQF7xwqvkjyqKaUr3acFP2T/3W5Lbt/2dIDROWf1oNiKta1xurOx2j78Gmw5WTpSBQ1Z/DLwZ7lIU3GgvOpoLRX43hzuF68yZbrIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775974; c=relaxed/simple;
	bh=+SA6ddJyH8MJ8wcd+8JjbY0ONor9rBjsMIiYkscBaLQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WS1uRFUkO5PxiD5TrBf47IsXtqJ8TVKtpuDyxWTjq2sUl8BI9l3Lm5HwC7v6KM5XNm8B0Qbml9BQZP9xboF+IcdP5lWZ10H9EtarhJoOErkdMLbWWQ2Q2qziYL+7sj3ttSU8kY8ibjKP8hsRYyhi9E4RXVnFHbmZGiwQdkTkslo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NP1PutO1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xvje+KtG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d/7wqu5A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VHml9fZX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NP1PutO1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xvje+KtG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d/7wqu5A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VHml9fZX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0E1581F816;
	Wed, 30 Sep 2026 13:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790775959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ndgGPmhdy9D5k4C4xPBki2Pt7tdr8qIjehOZfPsDVAg=;
	b=NP1PutO1AlbEDDBzRPrwv5USQmNkeJ03MsYNCLpJJuTw4ZIb3aL0lkDlOtISNxeRa7e9VM
	ZfWrlFvs1SZZmdKlKrXgS+l7tOcvVXG4u4W3DpGEvjrM4QwM3TZLzvXuVTdCX4U+D+p2QP
	DLn6/vT5KIEcFfo+AmU2r66D/4NaEoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790775959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ndgGPmhdy9D5k4C4xPBki2Pt7tdr8qIjehOZfPsDVAg=;
	b=xvje+KtGXq4gPJwyKT7c8Nbr5P5hXlzNxNRETTxmTRCpt4f08Qfbo/9cS1doWwok3oJSsI
	DaqlnMuic+x7SNAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790775955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ndgGPmhdy9D5k4C4xPBki2Pt7tdr8qIjehOZfPsDVAg=;
	b=d/7wqu5AvXtvRSviKdqzDvaWAGv7RHtWNkzEWO4cjndsybGfEeb2bDx6HYo8NxFy28sGuW
	M+dGlu6XHCWdfGkWcpI6APYPDJ3NtB2XdF/OSTGrkqGai4/CJD45lCCWk75LMEpeK30f1i
	/dhegvKvQVRTBJC+zzNpThGnK61cUlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790775955;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ndgGPmhdy9D5k4C4xPBki2Pt7tdr8qIjehOZfPsDVAg=;
	b=VHml9fZXMct3yrZDMEEp68GtTYMgmgENEIFtLdFHIbNGs54ftwSC+OKY59PYJ1VIpzf/g8
	cygcjThi1A4OtTDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B294513722;
	Wed, 30 Sep 2026 13:45:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZwBVIpISvWpiSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Sep 2026 13:45:54 +0000
Date: Wed, 30 Sep 2026 15:45:54 +0200
Message-ID: <87jyo24zu5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: dchristensen8 <dchristensen8@proton.me>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda/ca0132: Add Sound BlasterX AE-5 external RGB LED strip support
In-Reply-To: <0UViNKefxgxrLggTEzDgzIe9-kh2EqU2Pnip6zuyJl1sthZtgJ-OIai3KBgkltft587c-ryvum1IqQZt-awOQTdrohMWKh79F3X8u6JOjuo=@proton.me>
References: <eFYfxKMV2ei__fURd-elssegCIVmOuRDne6lj9PMaM2bEgnYkz7Tzf6JLrgEaPZtvrUC_wHnmnwaUZAOdg0uh24nt73FQqi6T65qvJebHJA=@proton.me>
	<87fqys19vt.wl-tiwai@suse.de>
	<0UViNKefxgxrLggTEzDgzIe9-kh2EqU2Pnip6zuyJl1sthZtgJ-OIai3KBgkltft587c-ryvum1IqQZt-awOQTdrohMWKh79F3X8u6JOjuo=@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.25 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.15)[-0.747];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.25
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 29 Sep 2026 16:22:07 +0200,
dchristensen8 wrote:
> 
> Thanks for the quick review!
>   
>     I went with sysfs mainly because of the streaming nature of WS2812 strips (using an atomic DMA frame):         
>   
>     -The LED subsystem has no strip or pixel-buffer concept, individual led_classdevs would hit sysfs with thousands of writes/sec at 30-60 FPS (and leds-class.rst advises against it for addressable arrays anyway).
>     -An ALSA kcontrol could hold raw bytes, but pushing frames at 60 Hz spams control change events to PipeWire/PulseAudio.
>   
>     I initially went with text attributes  (ae5_strip_leds/ae5_strip_num_leds) so basic shell scripts could just echo colors into it, but I know comma-separated lists bend the "one value per file" rule. Would you prefer a bin_attribute for raw RGB bytes instead? or keeping both?              
>   
>     All your code points make total sense too. I have no objections.
>   
> Let me know your thoughts on the sysfs format.

On the second though, why not simply to use an ALSA control element
with bytes data?  It can hold up to 512 bytes, so 100 of 24bit RGB
strips can fit.
You can declare the element as volatile (and with IFACE_CARD), so that
pipewire or alsactl won't be bothered by the changes.


thanks,

Takashi
