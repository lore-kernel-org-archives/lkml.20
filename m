Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A4037881D;
	Wed,  2 Sep 2026 06:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330573; cv=none; b=pzbYDwg8nDv9qJ6HxLOZhCXco/EYMHmiuanmp/dZfzLsLqH6S9zGtJpytFG1HkExFUWqfmMtwrQUy9c64Fx7ie/+H8D6SuabK3idv8c8zz2n60yF5jD7U+b3Bth+W65BYXOejjywwepfllHiW2rIzl+AV7+h5oicLIfoqF/ZHRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330573; c=relaxed/simple;
	bh=VwWzqhiRmZrXyuHn6PhlO+iIUE0taB3t8r+c9VsS4hE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LnMzZydmzaWVr9vZm9he2xwg1pZALe7SNjfl85nfmf8ccLlIXwvzvy1IHVgFFM2Gs/7K0Ix3py8l2d3qQc3z6Vp2lfRaMjqVvVLEvJIJkTFjABysPFooe9FhUnta4WQhzKSfIyfzGoWXSq6BVf9NnXEXZiSBKxCfULXrbhBOYNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XW4zSpDT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ij94hq4X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RS3PBK1m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h6xh7sXS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XW4zSpDT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ij94hq4X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RS3PBK1m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h6xh7sXS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 50B3D1FABE;
	Wed,  2 Sep 2026 06:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788330565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wtferj54A7M2Y4ZmBsSrcUZQ7O1zbnbWbMWYUG3YTlA=;
	b=XW4zSpDTHLqiLhydVoAPcoQG2G9YVkvqpXhtGBEG3KXWMy2tZaFpLMdteWykg76WLGJ6rC
	KN/brg7mJ31Ho9YM0ydl4wKji1E5wlE1SJqDCT1MQY2qbpuMTmy0Sh9EuxLomQlpKHRiFS
	VLVOD3NKcL8qlsIVZBO2WozKt/dm/So=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788330565;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wtferj54A7M2Y4ZmBsSrcUZQ7O1zbnbWbMWYUG3YTlA=;
	b=ij94hq4XJkdiY0Z62bJd9pJulBrNYXgvUfIps0fljyzSlo9Od9n9RUGZ9gSTkSLAnRnOpa
	BsLhI93YY9lH2mBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RS3PBK1m;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=h6xh7sXS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788330561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wtferj54A7M2Y4ZmBsSrcUZQ7O1zbnbWbMWYUG3YTlA=;
	b=RS3PBK1mXL2AhalIMzSIXBZKavNOBoV8KLJpASW8bIESz/tVN/YIqKOSGitHiQfIgHmpbg
	X1M5dTDHhMlCaG4Xf4DGbWriydK2yZ2WJfnDKvabu5hSAdBcBs8s/p1imNaQqu+XiRULhV
	ocmNLRUIO97gMwgzQCluHZ33j2jSShk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788330561;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wtferj54A7M2Y4ZmBsSrcUZQ7O1zbnbWbMWYUG3YTlA=;
	b=h6xh7sXSIyK1fj9Sx3Kx9hk2pUewDQW4EpfwrN7elamDVtuw90xQ0TJjIhflYBpgqO1lzy
	O/ys6x+bkQu3WwCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 071B6136E6;
	Wed,  2 Sep 2026 06:29:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WwUBAEHCl2rFHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Sep 2026 06:29:20 +0000
Date: Wed, 02 Sep 2026 08:29:20 +0200
Message-ID: <87mru0b1z3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Qingyu Zhang <usupergate@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] ALSA: ump: NULL deref of legacy_rmidi after parse sets parsed
In-Reply-To: <CAPBHdanmknKKhhc+5r8jPsnyZW8LYVq0qpzfEVrvjL3i5sNuJQ@mail.gmail.com>
References: <CAPBHdanmknKKhhc+5r8jPsnyZW8LYVq0qpzfEVrvjL3i5sNuJQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 50B3D1FABE
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 02 Sep 2026 04:07:30 +0200,
Qingyu Zhang wrote:
> 
> Hello,
> 
> ump_legacy_set_rawmidi_name() snprintf()s into ump->legacy_rmidi->name
> when ump->parsed is true, but parsed is set at the end of
> snd_ump_parse_endpoint() *before* snd_ump_attach_legacy_rawmidi().
> A UMP packet in that window NULL-derefs.
> 
> Type: null-pointer dereference
> 
> * Summary
> 
> snd_ump_parse_endpoint() always does:
> 
>        error:
>                ump->parsed = true;
>                ...
> 
> ump_handle_ep_name_msg():
> 
>        if (ret && ump->parsed) {
>                ump_set_rawmidi_name(ump);
>                ump_legacy_set_rawmidi_name(ump);  /* rmidi may be NULL */
>        }
> 
> ump_legacy_set_rawmidi_name():
> 
>        rmidi = ump->legacy_rmidi;
>        snprintf(rmidi->name, ...);   /* no NULL check */
> 
> This runs from snd_ump_receive() on the USB input URB complete path
> (in interrupt).
> 
> * Affected
> 
> 37e0e14128e0. Needs CONFIG_SND_UMP, CONFIG_SND_UMP_LEGACY_RAWMIDI,
> CONFIG_SND_USB_AUDIO, a MIDI 2.0 gadget or device. KASAN.
> 
> The natural window is parse-done vs attach. The QEMU PoC widens it
> with a kprobe on snd_ump_receive (poc/widen_ump.c) plus dummy_hcd
> configfs midi2, because the un-widened window is short.
> 
> * Reproduction
> 
>        # dummy_hcd + configfs usb_gadget midi2.usb0 (see poc/run.sh)
>        # with widen_ump.ko: force parsed=1, legacy_rmidi=NULL on receive
> 
> KASAN: null-ptr-deref in snprintf from ump_legacy_set_rawmidi_name
> <- ump_handle_ep_name_msg <- snd_ump_receive <- input_urb_complete.
> Then "Fatal exception in interrupt".
> 
> * Expected
> 
> legacy_rmidi helpers no-op until attach has stored the pointer.
> 
> * Actual
> 
> IRQ-context NULL deref.
> 
> Please consider the suggested patch
> 
> Thanks.
> 
> Suggested patch:
> ```
> diff --git a/sound/core/ump.c b/sound/core/ump.c
> index d183c8a000bd..3d1a2ed3b476 100644
> --- a/sound/core/ump.c
> +++ b/sound/core/ump.c
> @@ -1335,6 +1335,8 @@ static void update_legacy_names(struct
> snd_ump_endpoint *ump)
> {
>     struct snd_rawmidi *rmidi = ump->legacy_rmidi;
> 
> +    if (!rmidi)
> +        return;
>     update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
>     update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
> }
> @@ -1343,6 +1345,8 @@ static void ump_legacy_set_rawmidi_name(struct
> snd_ump_endpoint *ump)
> {
>     struct snd_rawmidi *rmidi = ump->legacy_rmidi;
> 
> +    if (!rmidi)
> +        return;
>     snprintf(rmidi->name, sizeof(rmidi->name), "%.68s (MIDI 1.0)",
>          ump->core.name);
> }
> ```

Thanks for the report.  The suggested code change looks good.
Could you submit a patch in the proper format for upstreaming
(especially with your Signed-off-by tag)?


thanks,

Takashi
