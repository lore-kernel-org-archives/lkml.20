Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838682;
	b=N6PDcpwn5eTda0GSXS0Uxotg41pRymL2vf4io2OBfrSfjJ+2R98tV+MkH+iJV+meAM/r
	 QVIoZh9XAiCQ0yUeCHqKCrJconQrV58CQZdVr8unUYbBmK1H1gxk60V6hUDI9pFijNNnt
	 pTQs9QmuxYlB809ZN8dNgdfi3YQDEAmKKSwD5koLBW1rwFf39peCtNemGtSZIh+O4tPvs
	 teLYq7EhfXg3mjGvHpeqNjrEN8POaqKeKAME9NN8YFLL932BmQnlvGMZkr8ILBnK/Sf3V
	 6WeTkhtrSI3msa27E7DsBqTpd3b4YcHbY3gm1UeH+ghL3FT48aRI96Ut8I0CnE5yjJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838682;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=hgOsS4NGOZfKv1NCmaP9Av3xRycRTUAi1EpcwJ5YUD8=;
	b=ygGPYacjtPwn30mbsDbSYEmZ/LEobdUwUgjgp8ffKU+aIaV3z3J32KC++svuQZ4914/5
	 E/eiWlUSlsfpmHCM3Du/QI52P9BVbrveJH7E4/a5i559T15JDkmwhiTT2BXrKr5f8InGI
	 bhrPqZSNnve9qk160HfkkD6+tgnUnJh2J3RRCaq6i9Ri6s4dWiA5vB3lG8BPhI7T7i2nF
	 bvd4yOpSCRW9ipZfuMLVHcUSVHk5qB5aRKG5Xie1vH+0eDJPwzHi3BInoF7P+pBtr0A7j
	 pnVpHg2ZauuHnLFSO1WmAt5PLSv+dPLvzOHAMYxUvxLRkFI4SN9+vVGmu/vIPH5u6pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bDzwDuW6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nNl5LEoJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=uKJ7TgCL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/qstMkCQ";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C058B606A334;
	Mon, 16 Nov 2026 14:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C058B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bDzwDuW6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nNl5LEoJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=uKJ7TgCL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/qstMkCQ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C9C801F824;
	Mon, 16 Nov 2026 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794838680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hgOsS4NGOZfKv1NCmaP9Av3xRycRTUAi1EpcwJ5YUD8=;
	b=bDzwDuW6sQa+s+CHn+lncgkmgd3hfJobmN13Q5+EZF0ilt1Q7Xr//jQnEqodu3MDn2ILSM
	xI0rwF/ak19CRoJE0mvrx00pUw8+U40dJPjU8zlVJO487YojnThv54d8bLqpi+4L4kPoFF
	ysLyjfio5RrNzyK0iyzkRaW7rS7+H48=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794838680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hgOsS4NGOZfKv1NCmaP9Av3xRycRTUAi1EpcwJ5YUD8=;
	b=nNl5LEoJEttvsOvC+4XP9KWRau2HJpACcLFCdIk4ZmqyRW3fixQ2paywjAdgTba40OIz+B
	aXaXOWYy9emYUPCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794838678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hgOsS4NGOZfKv1NCmaP9Av3xRycRTUAi1EpcwJ5YUD8=;
	b=uKJ7TgCLGTQl2i+TEUB/5famHfF7oPms9GceVlrmUXY8OrihLSb/sSwwaSYjUqnpDfEEkg
	OWZ+wp4MMQrdTU19yorPi0lVELJ//p03ghf+cWiqVEcgMVseZMy+HRBJMIW5xdoX+IyKyA
	G05tDfS7EbqjV/dHG3gdBdypPx2GmZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794838678;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hgOsS4NGOZfKv1NCmaP9Av3xRycRTUAi1EpcwJ5YUD8=;
	b=/qstMkCQIGf4n7RQ6ME0wqCegvk2En52LlnvkbN9ZZtDgQshKi5Rbzmj2xWTlhn286Qrnd
	kJjGWLzUzGYM+NAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 81C471334C;
	Mon, 16 Nov 2026 14:17:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oe1IFpYQ+2orXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 14:17:58 +0000
Date: Mon, 16 Nov 2026 15:17:58 +0100
Message-ID: <87qzgkyi5l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Devin Christensen <dchristensen8@proton.me>
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rafael@gexdigital.net
Subject: Re: [PATCH] ALSA: hda/ca0132: Fix AE-5 strip color corruption and add on-card LED control
In-Reply-To: <20261116140237.4137662-1-dchristensen8@proton.me>
References: <20261116140237.4137662-1-dchristensen8@proton.me>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,proton.me:email];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,proton.me:email]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 16 Nov 2026 15:02:44 +0100,
Devin Christensen wrote:
> 
> This update resolves the external WS2812 RGB LED strip color scrambling
> glitch during rapid animation updates, and adds ALSA card control
> support for the 5 on-board APA102 RGB LEDs on Sound BlasterX AE-5 cards.
> 
> 1. Fix external strip color corruption:
> In ae5_strip_send_frame(), formatting repeating frame cycles across the
> 32 KB DMA buffer combined with stopping the HDA stream after an arbitrary
> 15-20 ms delay caused transmissions to be cut off mid-frame / mid-byte.
> WS2812 shift registers latch on signal low (>50 us), so terminating
> mid-byte leaves partial bits in the registers, shifting color channel
> alignments (e.g. blue/white shifting to green/purple/red) on subsequent
> frames. Fix this by populating exactly one WS2812 frame followed by the
> reset gap and zero-filling the remainder of the 32 KB buffer. Reduce
> usleep_range to 8-10 ms, which guarantees the frame has completed and
> the stream terminates cleanly during trailing silence without truncating
> active LED data.
> 
> 2. Add on-card APA102 RGB LED control:
> The AE-5 and AE-5 Plus feature 5 on-board APA102 (DotStar) RGB LEDs
> providing logo and shroud illumination. These are driven directly by
> CA0113 bridge GPIO pins 2 (data) and 3 (clock) mapped through PCIe BAR2
> at MMIO offset 0x320.
> Expose the on-board LEDs through a volatile card control element:
>   "AE-5 On-Card LEDs" (RW, BYTES): 15-byte RGB payload representing
>                       the 5 on-board LEDs (3 bytes per LED).
> Writes bit-bang the 32-bit start frame, 5 APA102 LED frames (8-bit
> brightness and 24-bit BGR color), and 32-bit end frame over GPIO pins 2
> and 3, returning the pins to idle low. Mutex serialization and runtime
> PM are shared with the external strip control.
> 
> Fixes: c3e35f355fad ("ALSA: hda/ca0132: Add Sound BlasterX AE-5 external RGB LED strip support")
> Signed-off-by: Devin Christensen <dchristensen8@proton.me>

Could you try to split the changes?  I can take a small "fix" for 7.4,
but an extension would rather go to 7.5.


thanks,

Takashi
