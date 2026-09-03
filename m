Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30672E7F20;
	Thu,  3 Sep 2026 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427955; cv=none; b=aJGk1T0hQeKEZts62/IoXcRibY33I0Q3I5K7I++1ePau4ES0BLPHNTI0lQahElNwPwxQp1wASTy0g5e+aDdfgrfMqW97ynoMzSSm9BwWwusgTaS+Up9cSyfG/eE/8CrCjv4Ew+Bo6E5uZ7jbC7C65NW0jSoItCF5z836dJmtfSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427955; c=relaxed/simple;
	bh=s275Klehvr+Ams8sIOHhUaZ8kY504jS7v/Y9YYdluTM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/dk7zz9ygkK5laK1QEOi0lfHl4I8Thi7mcpHpBSpNYdxX6cRFVn3/ZTzP5qzGXk+7tQxvUQz/+8XlifqE4NtPnwqQ82K2TUHiNP9cLPV/OzgYWhWZDGHCyZ8sizZ1lMf22F5ulaoNU6ZokJGRKIgYXzj9lz3t2H5H3Gm6s+Lwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1FiNTkIN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZmeMvqmA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rmCaz1ta; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XFid31X6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1FiNTkIN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZmeMvqmA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rmCaz1ta";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XFid31X6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 795C81FDF7;
	Thu,  3 Sep 2026 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788427947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SG5YdnR+dICuZEoSCnYxKawn0QJ+pBGcdTq0kHqoeyw=;
	b=1FiNTkINsbciVAyy1CgWfyILa5Z8vsRvOt8KYaCEFT6i4U9JfqmeW6QzTQSUrK8X2c2GDy
	Uu85W2QVtcf74bPwBCGPBCh//X64ah+ahzODawGGcbi9FBGSP/vNrvWxu2zLP5/hR4uJvE
	KZ6O3d0ruAdEAJ57iqhBDi1TOmaLUM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788427947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SG5YdnR+dICuZEoSCnYxKawn0QJ+pBGcdTq0kHqoeyw=;
	b=ZmeMvqmA8dxPr5vPt8env816d6say2Tz0zqMaPImU4uYYLKvEq6ZDhhyMgqrNUgROfYlsG
	otAwOGGD3eayAVDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rmCaz1ta;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XFid31X6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788427943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SG5YdnR+dICuZEoSCnYxKawn0QJ+pBGcdTq0kHqoeyw=;
	b=rmCaz1taLbORbJ63ZkdBa6lYxViCprpJRoTs/9y1n15ZwXFKRJt/8wjG00ao5Zy5Ho9RsA
	2LNldE8h5gIUttlEFcwcBoX6O7HJEP9azZPUfS4wSndQ5syMbuq3bAnjzHOnxZjucPEX7p
	cIcXkriQGDYaBoRm79QtyiLummlX1u4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788427943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SG5YdnR+dICuZEoSCnYxKawn0QJ+pBGcdTq0kHqoeyw=;
	b=XFid31X61ClJOd6G4lGVUErJUJTjD4/dUbxJuxAFdyS3oUJMOaYFl281loHoz8f5QhuFPR
	tG11Myt/KuZg9fBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B527136E6;
	Thu,  3 Sep 2026 09:32:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Abl6Bac+mWo6aAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 09:32:23 +0000
Date: Thu, 03 Sep 2026 11:32:22 +0200
Message-ID: <87pkyu8yu1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edward Adam Davis <eadavis@sina.com>
Cc: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com,
	zonque@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	daniel@caiaq.org,
	linux-sound@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] ALSA: caiaq: Decoupling ep1_in_urb in caiaq dev
In-Reply-To: <20260903084747.535367-1-eadavis@sina.com>
References: <6a97af8d.27a413cd.1e878c.0004.GAE@google.com>
	<20260903084747.535367-1-eadavis@sina.com>
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
X-Rspamd-Queue-Id: 795C81FDF7
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	FREEMAIL_CC(0.00)[syzkaller.appspotmail.com,gmail.com,perex.cz,suse.com,caiaq.org,vger.kernel.org,linuxfoundation.org,googlegroups.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[832ce9fa3face1b7d44d];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,syzkaller.appspot.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,sina.com:email]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Thu, 03 Sep 2026 10:47:47 +0200,
Edward Adam Davis wrote:
> 
> The epq_in_urb object belonging to the caiaq device is coupled within
> the struct snd_usb_caiaqdev. After usb_submit_urb(epq_in_urb, GFP_KERNEL)
> executes successfully, epq_in_urb is successfully added to the urbp_list
> queue of the dummy HCD driver (userspace specifies dummy_hcd as the HCD
> layer driver for the caiaq USB device).
> 
> When init_card() calls snd_usb_caiaq_send_command() which subsequently
> fails due to a timeout, and proceeds to call snd_card_free() to release
> the card, the embedded ep1_in_urb object is also freed. When the dummy
> HCD driver detects that the URB has been unlinked, it returns the URB
> (by usb_hcd_giveback_urb()), which triggers [1].
> 
> Decouple the ep1_in_urb object from the struct snd_usb_caiaqdev and switch
> to using a pointer instead. Separately allocate and manage the memory for
> ep1_in_urb to prevent the release of the snd_card memory object from
> interfering with it.
> 
> [1]
> BUG: KASAN: slab-use-after-free in usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
> Write of size 4 at addr ffff88803cee1050 by task ktimers/1/29
> Call Trace:
>  usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
>  dummy_timer+0xaac/0x4d50 drivers/usb/gadget/udc/dummy_hcd.c:2019
>  __run_hrtimer kernel/time/hrtimer.c:2067 [inline]
>  __hrtimer_run_queues+0x3eb/0xaf0 kernel/time/hrtimer.c:2124
>  hrtimer_run_softirq+0x1e1/0x2e0 kernel/time/hrtimer.c:2141
> 
> Allocated by task 36:
>  snd_card_new+0x7b/0x110 sound/core/init.c:184
>  create_card sound/usb/caiaq/device.c:429 [inline]
>  snd_probe+0x236/0x1af0 sound/usb/caiaq/device.c:544
> 
> Freed by task 36:
>  snd_card_free_when_closed sound/core/init.c:630 [inline]
>  snd_card_free+0x138/0x1d0 sound/core/init.c:662
>  snd_probe+0x162b/0x1af0 sound/usb/caiaq/device.c:553
>  
> Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
> Fixes: 523f1dce3743 ("[ALSA] Add Native Instrument usb audio device support")
> Closes: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
> Tested-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> ---
>  sound/usb/caiaq/device.c | 19 +++++++++++--------
>  sound/usb/caiaq/device.h |  2 +-
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
> index a16e59248480..138b58914f1c 100644
> --- a/sound/usb/caiaq/device.c
> +++ b/sound/usb/caiaq/device.c
> @@ -192,8 +192,8 @@ static void usb_ep1_command_reply_dispatch (struct urb* urb)
>  		break;
>  	}
>  
> -	cdev->ep1_in_urb.actual_length = 0;
> -	ret = usb_submit_urb(&cdev->ep1_in_urb, GFP_ATOMIC);
> +	cdev->ep1_in_urb->actual_length = 0;
> +	ret = usb_submit_urb(cdev->ep1_in_urb, GFP_ATOMIC);
>  	if (ret < 0)
>  		dev_err(dev, "unable to submit urb. OOM!?\n");
>  }
> @@ -408,6 +408,8 @@ static void card_free(struct snd_card *card)
>  #endif
>  	snd_usb_caiaq_audio_free(cdev);
>  	usb_put_dev(cdev->chip.dev);
> +	usb_free_urb(cdev->ep1_in_urb);
> +	cdev->ep1_in_urb = NULL;
>  }
>  
>  static int create_card(struct usb_device *usb_dev,
> @@ -457,10 +459,11 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
>  		return -EIO;
>  	}
>  
> -	usb_init_urb(&cdev->ep1_in_urb);
> +	cdev->ep1_in_urb = usb_alloc_urb(0, GFP_KERNEL);
> +	usb_init_urb(cdev->ep1_in_urb);

The error check is missing here, as sashiko review pointed out.
Could you fix and resubmit?

(The other issues reported there -- the potential-double-free and the
midi_out_urb handling can be skipped here; I'll fix those
individually.)


thanks,

Takashi
