Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6F53ACA5D;
	Sun, 13 Sep 2026 07:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789283209; cv=none; b=dgsYPHB+UEkpNQAJlS9aJIjW4XM6/MM1eSV8+moCIskQqAMxwgJ6ApuVAsiy2qcQbeIQoVpvxCyxEywCeKqqnooEQlUUiRuI88iw49CUPlRfmtlz8F6nH8myuO2Ei2iLTrs9bPdCXEFktidHeV92pt//fO8eJxx+YZi6iCGcWKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789283209; c=relaxed/simple;
	bh=zsoySF8eQeIsImIBkm9W8mp/L2SblDlpXfTvQVD8llQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V4BCHzZy4NZdqcjYTaJYtH0OIZgxnCz3x/e5HYXabdWcZ94gFlsyOr66801hEkyFZUvdu3KqOWCe5yvGZRTsP8End75423/sbdKs9YtD4m78mXIFp51vspEP+Ivi4WhJ0y67yUgLiOzqraJVAwKfcYcXzY6fs92BeGpjOLuvdoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tCgcBlEK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7QfFRojc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xwiu0Zud; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lErst9eH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tCgcBlEK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7QfFRojc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xwiu0Zud";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lErst9eH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AEEFD1F7A1;
	Sun, 13 Sep 2026 07:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789283201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sH/t/e5mfhjlMId7knf//Fvl2hRVOACnAuvcEsCFEPU=;
	b=tCgcBlEKHkCb8sCeVXqz15BTJbRjX4B9gYTEtQyT3Po2CQX/V/4Zmq2lKlKga3Nck/zpKV
	nQAqCNlCLG5fXpNM2fbB4EGplsi9IVDN+4foBfcGzMDlXM0WjXmu2OsduVuuO3OrNg9cpa
	ailOGfbvVvM/T072/pOP7Vj6Pn3nAUo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789283201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sH/t/e5mfhjlMId7knf//Fvl2hRVOACnAuvcEsCFEPU=;
	b=7QfFRojc/Xfupzk4WEhdzxXzQ7+Rqtn03ZV+35D1YdOaHe8DtsmplPuCARV5I6vwqdi4NX
	Dq6zvNH1GpXZtnBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789283197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sH/t/e5mfhjlMId7knf//Fvl2hRVOACnAuvcEsCFEPU=;
	b=Xwiu0Zudij4toQZ3nR1JARtPMgCx8PS5Z/sGba8UpNFMGV3F5OLPB9hFZP9CbUfdAxj7RR
	7FsWY2rU4eOai+nkS1htFZSTmgdIFYonM2Gv6XkAVR2J+cYp1Ju8g+spiS4irubjgx5BhY
	P2yhjKwuA3qtmWRmC4P68O8bknlHEMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789283197;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sH/t/e5mfhjlMId7knf//Fvl2hRVOACnAuvcEsCFEPU=;
	b=lErst9eHnTyG3EvCWnGenKQu1CslozUbtYjprLNcqXZm33nidlqIFHlBy4fPrttEpb+eZt
	9QQ7j/y5K53Uc3AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2EA7C1368C;
	Sun, 13 Sep 2026 07:06:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 33VyCX1LpmpfOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 13 Sep 2026 07:06:37 +0000
Date: Sun, 13 Sep 2026 09:06:36 +0200
Message-ID: <87ld95wryb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Xiang Mei <xmei5@asu.edu>
Cc: perex@perex.cz,
	tiwai@suse.com,
	torsten.schenk@zoho.com,
	co+855929c2df672879@bugs.sh,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: 6fire: fix OOB write from device-reported iso length
In-Reply-To: <20260913000515.2344562-1-xmei5@asu.edu>
References: <20260913000515.2344562-1-xmei5@asu.edu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[855929c2df672879];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[zoho.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,zoho.com,bugs.sh,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,asu.edu:email,bugs.sh:email]
X-Spam-Flag: NO

On Sun, 13 Sep 2026 02:05:15 +0200,
Xiang Mei wrote:
> 
> usb6fire_pcm_in_urb_handler() sizes each outgoing isochronous packet as
> (actual_length - 4) / (in_n_analog << 2) * (out_n_analog << 2) + 4, where
> actual_length is the unsigned length the device reported for the matching
> IN packet.  A packet completed with status 0 and actual_length < 4 wraps
> the subtraction to 0x7fffffec; a zero-length isochronous packet is legal
> on the bus, and the preceding loop rejects only non-zero status.  The sum
> reaches memset() on out_urb->buffer, a 4832-byte object from
> kcalloc(PCM_MAX_PACKET_SIZE, PCM_N_PACKETS_PER_URB).
> 
> Even without the wrap the result is out of bounds: at 88.2/96 kHz the
> 4-in/6-out scaling turns a full 420-byte IN packet into 628, so eight
> packets span 5024 bytes of that buffer.  usb_submit_urb() rejects an
> over-long descriptor only after the memset() and the
> usb6fire_pcm_playback() copy of user PCM data have run.
> 
> Guard the subtraction as the sibling usb6fire_pcm_capture() already does,
> and clamp to rt->out_packet_size, the OUT endpoint's wMaxPacketSize,
> which bounds total_length by the buffer size.
> 
>   BUG: KASAN: out-of-bounds in usb6fire_pcm_in_urb_handler (sound/usb/6fire/pcm.c:338)
>   Write of size 18446744073709551456 at addr ffff88802a3d0000 by task vhci_rx/5018
>   Call Trace:
>    dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
>    print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
>    kasan_report (mm/kasan/report.c:595)
>    kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
>    __asan_memset (mm/kasan/shadow.c:84)
>    usb6fire_pcm_in_urb_handler (sound/usb/6fire/pcm.c:338)
>    __usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1657)
>    usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1741)
>    vhci_rx_loop (drivers/usb/usbip/vhci_rx.c:107 drivers/usb/usbip/vhci_rx.c:242)
>    kthread (kernel/kthread.c:436)
>    ret_from_fork (arch/x86/kernel/process.c:158)
>    ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
> 
>   Allocated by task 10:
>    __kmalloc_cache_noprof (mm/slub.c:5563)
>    usb6fire_pcm_init (sound/usb/6fire/pcm.c:560 sound/usb/6fire/pcm.c:595)
>    usb6fire_chip_probe (sound/usb/6fire/chip.c:133)
>    usb_probe_interface (drivers/usb/core/driver.c:399)
> 
>   The buggy address belongs to the object at ffff88802a3d0000
>    which belongs to the cache kmalloc-8k of size 8192
>   The buggy address is located 0 bytes inside of
>    4832-byte region [ffff88802a3d0000, ffff88802a3d12e0)
>   Kernel panic - not syncing: Fatal exception in interrupt
> 
> Fixes: c6d43ba816d1 ("ALSA: usb/6fire - Driver for TerraTec DMX 6Fire USB")
> Reported-by: co+855929c2df672879@bugs.sh
> Closes: https://lore.kernel.org/all/gisnub8aWGLbyZLcDCSc7zWsHonMWGcyRgt5%40bugs.sh/
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Xiang Mei <xmei5@asu.edu>

There has been already another fix for the packet size calculation
there in the upstream (already in Linus tree, too).
Could you check with it and rebase/resubmit if the fix is still
needed?


thanks,

Takashi
