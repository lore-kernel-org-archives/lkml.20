Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83D238DC7F;
	Mon, 14 Sep 2026 09:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379197; cv=none; b=iyQaqjs8tHa0HxKjVPON710NPGCJlBHtPail/3Npz+aWJwOL/XOS7F4Z4Vi7WJOM3/8smeSCxseTOLQbGIxybU0j9qy9Tf9Ylfj/Dj0ylghuIL74J2/j6n6QzSrwWh1ikrXWjn65aiB8oaqqU0F9JYDmv3QJIxoANWaidhmKMXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379197; c=relaxed/simple;
	bh=rrFyLLdZF5xXSzle5JlC0438BTyKva3atZTnq8zVXQw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lX0EKk001DZJRrSlIOCgSC0xyCFmVA1qLykNVrFvVVODSAQGWY49oaLOpS1tpXZ9fLWsKe+0J5QpGguIE+g3IKKibcpoZMu6K4E4i/YiGrKsiTh9EpgSRyoFiAZ0oj/kp81d0IkXNDq2C7ENwUqBHBt91Kc4UXxXUr91XEWCyLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eYfbe0dT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b1JhahW+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PqSJCCD5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I9qv+3FO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eYfbe0dT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b1JhahW+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PqSJCCD5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I9qv+3FO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7926D21A60;
	Mon, 14 Sep 2026 09:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789379189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JoGpoZ91SQfiywItqJCeJB08VIv14uniOSyLXtjKG40=;
	b=eYfbe0dTerlRbcK/7G0YDqJ8beI/Bs87lYLSr2XlU4rVTECVo/Dp7rpRhxaKHsR5X9m4F2
	dxGrIGCJ7XHvt1vb+hLyKrEXbvpdfXBswHQ4yX2Q8NcuNBzbtmwOtmmLnN+zClh8EEgXuG
	zQFUbn/gs0eMgrU3tJ3hZ6++Sgw/xm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789379189;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JoGpoZ91SQfiywItqJCeJB08VIv14uniOSyLXtjKG40=;
	b=b1JhahW+j10EFqGvw/fIV03hLQil9C6NpBMBAsE+u9WR86YlILGBKZ9TJFL/OvM47IYpeZ
	NaJjJ7Sr1K5TkcAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789379185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JoGpoZ91SQfiywItqJCeJB08VIv14uniOSyLXtjKG40=;
	b=PqSJCCD5Z50by1WrIFWkXynV6pI9ucX6uJsKzNHyxiggaX9JjJkv8qbetoX5avOUDX+rbX
	1CZHzmSmCxHGo2xUDICy+zQ89l+LSn9UQaN/3DnXMdrTpWK/kiOCH2L+9nm3PHYs3dbFtA
	dsuWMSXvk+WjkjElUeu54C80Vv2H6NI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789379185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JoGpoZ91SQfiywItqJCeJB08VIv14uniOSyLXtjKG40=;
	b=I9qv+3FOW34hVEo1Zm5sT53yQ8NlnfAHut7quCSjXhNR0zje01ciBT0cbueD372AR0Q9t1
	etH2iN2TLBeGAlDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A93313515;
	Mon, 14 Sep 2026 09:46:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9lg5CXHCp2rEawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 09:46:25 +0000
Date: Mon, 14 Sep 2026 11:46:24 +0200
Message-ID: <8733vcp3m7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Xiang Mei <xmei5@asu.edu>
Cc: perex@perex.cz,
	tiwai@suse.com,
	torsten.schenk@zoho.com,
	co+855929c2df672879@bugs.sh,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: 6fire: fix OOB write from device-reported iso length
In-Reply-To: <20260914074324.3590843-1-xmei5@asu.edu>
References: <20260914074324.3590843-1-xmei5@asu.edu>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bugs.sh:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,asu.edu:email]

On Mon, 14 Sep 2026 09:43:24 +0200,
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
> and limit the frame count to what fits in rt->out_packet_size, the OUT
> endpoint's wMaxPacketSize.  This bounds total_length by the buffer size
> while keeping each packet length aligned to a whole output frame.
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
> Assisted-by: LLM
> Signed-off-by: Xiang Mei <xmei5@asu.edu>

Applied now.  Thanks.


Takashi
