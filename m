Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52A24B0CBB;
	Mon, 28 Sep 2026 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595879; cv=none; b=W4V1CdOEuWTMl9vBo4xPtcgbq52UXrfiHQHGGDq1vQgReLpZcoXRjlCNuOu0sbzm55mdAVQa+EuWJ8y+r1lyqbNCUOin5ads0Z144zsPzYwez4f7oH+oO8W+su4Olq4dX52FGxIX1mztG0yCoBHjVOhIVSnAUf3F9Eez+Ycj5/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595879; c=relaxed/simple;
	bh=BiTmK/xF3Xf6YLJ0qA1o2cFPEoTv1djFzWRZ5SdJNJE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gzPjYg0hAxDwl0rKdjZA7sCwroJmHCIEdfNocFkVezFEh5A5M0E3lG1NS4rHYTdY+7itBpzHa1ZFgTP4cAdaQSN0zqm9OnB3Db9gLRMYk+4v2/E4v4MRAm9XlzLa6bpHfj1urZP9ne+zC1cwP2nDCCGNyryAPg7dJAFGRcjO0qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RKGX7PdZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mU8DbIEZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LiayG2bu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FHFSwfs1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RKGX7PdZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mU8DbIEZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LiayG2bu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FHFSwfs1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 81F351FA8E;
	Mon, 28 Sep 2026 11:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pb490YezcVolJMRhswOP+JoZfyXrapQRUUIjORQYqXc=;
	b=RKGX7PdZLFhxZQ/PKoVDUaYnIy12FISlOqnLU0kp1HKHgv/xDy7MMHVRGQIPVwdaodAAYL
	XfTj+Dn4II6cIIeIvbzqj9AEl2YRSdhjjguXTvVsQzPiRIJcQ4O0TKgbLn22j49b3v3yb0
	4ADpwixVFcJYGiXddwMmRo7Tv4WVuXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595871;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pb490YezcVolJMRhswOP+JoZfyXrapQRUUIjORQYqXc=;
	b=mU8DbIEZ3rKbrlopMq8teRdgQ3tzeNIvWWeoT4CntJfayx36vghX09xlNGL1c47s2rwWtT
	TCgbzm2pv0767SDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pb490YezcVolJMRhswOP+JoZfyXrapQRUUIjORQYqXc=;
	b=LiayG2buoq7lN4BiPMTw72vhqcmOmExZYlHCU6OZqreM9hnnX9v3s4Bz1jjSRg9lHEKWOG
	W+65FXmAE+mQCFPyPiS47GJQKy+hGKCCCvg7Sqn/9vf9cx8PQ0etuAfAVoK0lYxcEeoooq
	+PdflQhSI34I3ohoIXS4Pa/t5m+cJ+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595867;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pb490YezcVolJMRhswOP+JoZfyXrapQRUUIjORQYqXc=;
	b=FHFSwfs1DbxaKhWAYede/pFgcUgkRxwMN/6kT4QAKGIdWiUMqYrLVoG5vcD3kAiyIQYi+a
	8DoAEk09cUI8GHDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 279A8133F3;
	Mon, 28 Sep 2026 11:44:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id R9EYOxpTumobTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:44:27 +0000
Date: Mon, 28 Sep 2026 13:44:26 +0200
Message-ID: <87pkxx61np.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <zonque@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: caiaq: unregister the input device when probe fails
In-Reply-To: <20260925170717.22462-1-ngocthang2710.1999@gmail.com>
References: <20260925170717.22462-1-ngocthang2710.1999@gmail.com>
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
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,gmail.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Fri, 25 Sep 2026 19:07:17 +0200,
Nguyen Ngoc Thang wrote:
> 
> setup_card() registers the input device, whose name and phys point into
> struct snd_usb_caiaqdev, and then goes on to snd_card_register() and
> snd_usb_caiaq_control_init(). If either fails, snd_probe() calls
> snd_card_free(), which frees the device state but leaves the input
> device registered: card_free() only clears the pointer, and the input
> device is unregistered from snd_disconnect() alone. Reading its "uevent"
> attribute afterwards dereferences freed memory:
> 
>   BUG: KASAN: slab-use-after-free in string+0x4a9/0x4f0
>   Read of size 1 at addr ffff8880208f5043 by task caiaq/4967
>    add_uevent_var+0x183/0x3a0
>    input_dev_uevent+0x162/0x900
>    dev_uevent+0x2f1/0x870
>    uevent_show+0x1ca/0x3a0
>    ...
> 
> Unregister the input device on the probe error path, as
> snd_disconnect() does. snd_usb_caiaq_input_disconnect() is a no-op when
> no input device was registered.
> 
> Reproduced with a raw-gadget Audio Kontrol 1 and a temporary hack that
> makes snd_usb_caiaq_control_init() fail.
> 
> Fixes: 28abd224db4a ("ALSA: caiaq: Handle probe errors properly")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+2a123f6269da57ffefaa@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=2a123f6269da57ffefaa
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>

Applied now.  Thanks.


Takashi
