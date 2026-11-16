Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821133;
	b=aW7ZNBwDPsSlYiJU2Uupmwcg21I58+bQhTcUOM8R8Ytz6DMgBfvzKMOdwecjtDRCjFVo
	 HI7JcO0WaBlwCixZNH30XBv2IVGqsBQxRVwaiOsTUPJn8Xk3CiXemH9WyzoB5TPpw+HKg
	 iLP3o7NxH8rJTxwVbzWbMSiT9R2YDN1NY3MU6/Pkw9gdCtkWU6eM7Mkl9XteXo/8LyFcM
	 yzMwdkuXpiKVZjf0bqpCnK9OM3x9p7YvPHy9Vugjnjk92wDbqoM4z737ulO+c4udq/vNP
	 RMWKaLTbBOa9VmoA4KiGjT0P8R/F78+OVoj2TGLj1ivd95NnEX2jD1xhPnnhezg2laQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821133;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=LA42zul5EwTs1SXeZ60rSgHhgfAv+z04zYZexWlCSgI=;
	b=wIrg8t1J3Yy+9ITMlk2oCESI2xcWDSmo7L/dr2cpdVNxQliWX0At6Za4jHY/umTahNUZ
	 BMI4ZBWj3j+vNj1LyRzOqbmGxa6DQzhXv7frj3YPwgIO8/71AF27WlgNGphmpeuvDYvQI
	 TyJcXsdCKmrDKaq+oyIkzshJJpbHf5fUE2o9vv4CdqPHGb4B3zbRv2Z+MFoxOUgyrgb1m
	 WrsFC097CHoZ/IP1h0kxJzs3G1YulJ0W/igahGQ4MZ0qzumtBoTQ3J2KiAsqcv62QoDk9
	 NqJUmpzCOCiR+XDO6bjT0EYxA7aZySI0iNfNlzKqnZETLccrA5UK6R9S2Qa5zsdHePQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d0MM7VSF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HqP2hMsy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d0MM7VSF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HqP2hMsy;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F3B606A329;
	Mon, 16 Nov 2026 09:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F3B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d0MM7VSF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HqP2hMsy;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d0MM7VSF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HqP2hMsy
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0FFA01FB9E;
	Mon, 16 Nov 2026 09:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794821131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LA42zul5EwTs1SXeZ60rSgHhgfAv+z04zYZexWlCSgI=;
	b=d0MM7VSFRU2qTD/vH363rDGHPJRm+2MpsdVaZudnJ6wxQ8CGiGehU8VNigXDyhQ2AeZu8q
	uvJkysfjPDuGOaCyvBh7g2hKb/ixso6Pr2ZtmM7AAGjQtanKQp14HSNXeOxfVNjR6XAyLw
	LEdI8Ld6rmxDdMaUn7sBKD+zMHVM164=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794821131;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LA42zul5EwTs1SXeZ60rSgHhgfAv+z04zYZexWlCSgI=;
	b=HqP2hMsyIDv94rEhzZ3BxnmnWPv/FArsv/wN8Z9nyR+KkmOGFI67AQ0TzBkeZnWEo18qu5
	TN363QeYE0O9QVDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794821131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LA42zul5EwTs1SXeZ60rSgHhgfAv+z04zYZexWlCSgI=;
	b=d0MM7VSFRU2qTD/vH363rDGHPJRm+2MpsdVaZudnJ6wxQ8CGiGehU8VNigXDyhQ2AeZu8q
	uvJkysfjPDuGOaCyvBh7g2hKb/ixso6Pr2ZtmM7AAGjQtanKQp14HSNXeOxfVNjR6XAyLw
	LEdI8Ld6rmxDdMaUn7sBKD+zMHVM164=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794821131;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LA42zul5EwTs1SXeZ60rSgHhgfAv+z04zYZexWlCSgI=;
	b=HqP2hMsyIDv94rEhzZ3BxnmnWPv/FArsv/wN8Z9nyR+KkmOGFI67AQ0TzBkeZnWEo18qu5
	TN363QeYE0O9QVDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC0C113408;
	Mon, 16 Nov 2026 09:25:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oSJwJgrM+mrJIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 09:25:30 +0000
Date: Mon, 16 Nov 2026 10:25:30 +0100
Message-ID: <87jymdyvp1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yingjie Wang <x-professor@outlook.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: midi2: copy configfs strings for live functions
In-Reply-To: <e638dc9ab93c4b90c263d7ec836735eb17335cda.1793980732.git.x-professor@outlook.com>
References: <e638dc9ab93c4b90c263d7ec836735eb17335cda.1793980732.git.x-professor@outlook.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[outlook.com];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -12.30

On Fri, 06 Nov 2026 16:59:06 +0100,
Yingjie Wang wrote:
> 
> f_midi2_alloc() shallow-copies the card, endpoint, and block string
> pointers from configfs.  Dynamic ep.* and block.* groups may be removed
> after the function has been allocated.  Their release callbacks then free
> strings still used by live USB string descriptors and UMP discovery
> replies.
> 
> Copy the optional strings while opts->lock is held, so configfs release
> cannot free the source strings during the copy.  Free the private copies
> with the live function and build the USB string table from those copies.
> 
> Fixes: 29ee7a4dddd5 ("usb: gadget: midi2: Add configfs support")
> 
> Tested:
>   x86_64 KASAN dummy_hcd: the base kernel reports two slab-use-after-free
>   errors after removing a dynamic block and endpoint; the fixed kernel
>   completes the same descriptor requests without a KASAN report.
>   x86_64 and arm64 MIDI2 function object builds with W=1.

Please put this sentence above Fixes tag, instead of putting in the
middle of Signed-off-by block.

> Signed-off-by: Yingjie Wang <x-professor@outlook.com>

The code change itself looks good.
With the patch description correction above, feel free to take my ack:

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
