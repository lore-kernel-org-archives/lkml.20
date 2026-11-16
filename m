Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831289;
	b=0FSTjyb1nZB5C4R1QZHPKhyqATssCf8kZFL8reBgMyTXQTMFlkv4ezY31St9bWlZ9DXH
	 SrXw+zyuJUtE8LQ/7V4Kqgx/Kwmu1KRn5AAgblCO0CPZLiBtBdHY7OiCito7p+yhh886B
	 SHa/6Kh0tpXlNcvkwhCs5mkLQmfqyr6x5jNWAO2F/p/oI3y+B8InOnRIzPjqXSvPGYBvj
	 T38DfydO7utvgQ51lC91sRy8VOIKKGZATIGGEWjgyutowg7HSaf+Fywrgl9d/kP9QLVMu
	 Am8Qol9jZFPHyTitvlObXYKGhiKnyH36MNcjc0jffbx+xe1p8s4Y/1UD/zoITuX5ewg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831289;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=0T6tBHjU7Q/eSxf6uH/X/Pj9sTjpxjv6jPF/6eIm6Sc=;
	b=XA84wbvTZAyQ9DfgjhHpBSfdQs9kWRGbeQbg51AAmxQ3aN0GqgeGvHQDXYNe69FPKEt5
	 8/FwKiM0Q8o9O63KTmM/Rss+MDIlSRvmi9lVQ+POBRPYW0vP/TmdQdyK5MluVDHYakBdI
	 41cC8a7xpSXQjZqC3TT1nKE2sJe+XGgGstKOqcXbC/6h8JzzmqvqKD+o04q4RNSSjCcyB
	 B0M2qmh5IbnbwhTMQ3kPD0zETwfXUC9pDKA//pAgId5mFzvnVnNYWSgF3crP9iEjspDOc
	 6szbbLoRUt7kJV0fC3QDEsiOZNZsDv2Pejp+oHg9GTUOq6lzliHG6HrLiMOmL9G8OYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="ZBBS/Un0";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=57tqKxEG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="ZBBS/Un0";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=57tqKxEG;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726F2606A31C;
	Mon, 16 Nov 2026 12:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 726F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZBBS/Un0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=57tqKxEG;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZBBS/Un0;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=57tqKxEG
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 90525221BE;
	Mon, 16 Nov 2026 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794831286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0T6tBHjU7Q/eSxf6uH/X/Pj9sTjpxjv6jPF/6eIm6Sc=;
	b=ZBBS/Un02azxDu/46w2iwP66A8cg4v7flQGf1q/qj+4Y79led5v42RI0TROCQls8cxVPJO
	zljWyGt5Ivpi/dyaWpN4J86lnHRC1HnfjOhxTL8njvwx6XQ41sxLoENAN/EcL9bQZR1cWw
	Pfa5WBXUoEZlTEpqvsasSou2KNNw2TI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794831286;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0T6tBHjU7Q/eSxf6uH/X/Pj9sTjpxjv6jPF/6eIm6Sc=;
	b=57tqKxEGP8vLO8d+54oSD0WDabAepOyw7nJKBiYGhnB4bpdiCBuaLoz0Tom3Jpksi5OSDI
	Agqf/rlEMSwNeODQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ZBBS/Un0";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=57tqKxEG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794831286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0T6tBHjU7Q/eSxf6uH/X/Pj9sTjpxjv6jPF/6eIm6Sc=;
	b=ZBBS/Un02azxDu/46w2iwP66A8cg4v7flQGf1q/qj+4Y79led5v42RI0TROCQls8cxVPJO
	zljWyGt5Ivpi/dyaWpN4J86lnHRC1HnfjOhxTL8njvwx6XQ41sxLoENAN/EcL9bQZR1cWw
	Pfa5WBXUoEZlTEpqvsasSou2KNNw2TI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794831286;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0T6tBHjU7Q/eSxf6uH/X/Pj9sTjpxjv6jPF/6eIm6Sc=;
	b=57tqKxEGP8vLO8d+54oSD0WDabAepOyw7nJKBiYGhnB4bpdiCBuaLoz0Tom3Jpksi5OSDI
	Agqf/rlEMSwNeODQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A6911334C;
	Mon, 16 Nov 2026 12:14:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Y5icCrbz+mpCWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 12:14:46 +0000
Date: Mon, 16 Nov 2026 13:14:45 +0100
Message-ID: <878q2tynuy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexandre Becholey <alex@becholey.ch>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hanxiang Xu <xuhx@hust.edu.cn>
Subject: Re: [PATCH v2 0/5] ALSA: usx2y: us144mkii: fix PCM stream lifetime bugs
In-Reply-To: <20261116071707.217448-1-alex@becholey.ch>
References: <20261116071707.217448-1-alex@becholey.ch>
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
X-Rspamd-Queue-Id: 90525221BE
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Mon, 16 Nov 2026 08:17:25 +0100,
Alexandre Becholey wrote:
> 
> Hi,
> 
> Five bugs in the snd-usb-us144mkii PCM code, all reproduced with an
> emulated US-144MKII under KASAN on torvalds/master and v7.3.1:
> 
>  1/5 stop_pcm_work calls snd_pcm_stop() on a substream that is being
>      closed (use-after-free of the runtime); the device can schedule
>      the work at any time by sending bad feedback.
>  2/5 capture_work keeps using the capture runtime after the capture
>      PCM is closed while playback is running (use-after-free).
>  3/5 the capture work and the playback URB completion use the buffer
>      of a substream that was never started (NULL dma_area), because
>      the URBs of both directions always run together.
>  4/5 the playback and feedback URB completions use the substream
>      runtime and buffer without waiting for close (use-after-free).
>  5/5 a START retried while stop_work runs submits URBs that are still
>      in flight (URB submitted while active, anchor list corruption).
> 
> The patches depend on each other and are meant to be applied in this
> order: 2/5 builds on the close callback of 1/5, the check added in 3/5
> is only safe once 2/5 guarantees that the capture work does not outlive
> the substream, and 4/5 and 5/5 apply on top of the first three. In
> testing, 3/5 without 2/5 crashed in the new check, and 1/5 + 2/5
> without 3/5 still crashed on the NULL dma_area. Each patch has its
> testing notes below its '---' line.
> 
> Hanxiang Xu reported the bugs fixed by 1/5, 2/5 and 4/5 on this list
> on 2026-11-13, from source inspection and without a patch; we found
> them independently with emulated devices. v1 was sent as a reply
> to that report, and 1/5, 2/5 and 4/5 carry Closes: tags for the two
> messages. The reports also mention close racing with disconnect:
> that concerns a fix that kills URBs in .close, which this series does
> not do (the .close callbacks only touch the card private data), so
> nothing is changed for it.
> 
> Changes in v2, both from the Sashiko reviews of v1:
> - 3/5: also count the hardware position and the elapsed periods in
>   feedback_urb_complete() only while the substream is running, so that
>   a substream started after the other one starts at the beginning of
>   its buffer.
>   https://lore.kernel.org/all/sashiko-outbox-214859@kernel.org/
> - 4/5: make playback_substream and capture_substream __rcu pointers,
>   published with rcu_assign_pointer() and read with rcu_dereference();
>   the capture work now also uses the substream inside an RCU read-side
>   section.
>   https://lore.kernel.org/all/sashiko-outbox-214863@kernel.org/
> - 1/5, 2/5: no change; 5/5: rebased, no change.
> 
> v2 was tested on v7.3.1 and on torvalds/master 97d73c825122 with the
> reproducers of all five patches, with KASAN, PROVE_LOCKING and
> PROVE_RCU: no us144mkii report in 84 runs (the same reproducers
> crashed unpatched v7.3.1 in 8 of 8 runs).
> 
> v1: https://lore.kernel.org/all/20261114172806.88710-1-alex@becholey.ch/
> 
> How we found it: the bugs were found, and the reproducers and these
> patches were written, by AI agents (Claude Mythos and Claude Opus
> models), in QEMU with emulated USB devices (raw-gadget/dummy_hcd,
> emulated xHCI, USB/IP).
> A human reviewed the analysis and the patches. The reproducers are
> available on request.
> 
> Thanks,
> Alexandre Becholey
> 
> Alexandre Becholey (5):
>   ALSA: usx2y: us144mkii: fix stop_pcm_work race with PCM close
>   ALSA: usx2y: us144mkii: wait for the capture work on capture close
>   ALSA: usx2y: us144mkii: only touch the buffer of a running PCM stream
>   ALSA: usx2y: us144mkii: wait for the URB completion handlers on stop and close
>   ALSA: usx2y: us144mkii: do not restart the stream while stop_work runs

Thanks for the patch.

But, I believe that we should rather address the whole us144mkii
driver issues differently: this kind of duct-tape fixes won't work
well for this driver simply because the current code isn't designed
well for the concurrent playback / capture changes at all.  That is,
it needs a redesign about how to keeping the streaming for full duplex
and concurrent open/close or parameter changes.

And, those patches generated by AI often make the same mistake.
Basically, at the close callback, we shouldn't deal with the cleanup
for work, etc.  At the time of close callback, all streams must have
been already turned down and cleaned up.  The work stop and sync
should have been done at PCM trigger and sync_stop callbacks, instead.

I guess AI has been trained more with the older code changes that
didn't use the sync_stop, so it tends to produce a quite old-fashioned
code.  You can give hints about the above point, I suppose.


thanks,

Takashi
