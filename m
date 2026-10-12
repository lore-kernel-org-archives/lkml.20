Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B207442382;
	Mon, 12 Oct 2026 07:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789870; cv=none; b=id/1ZifybdD47g4FCqrB4g3E2aFoYUQkV5xIxH85dQPW4Xpwni9+Yk8XHk+Co7gKGQEzkCd5qTo4G+2ADzEizR6qCgVeDLCrOzCN+8Iql2IHigLiFYmBmsXoRfZbompI8ooSiHo/mvpRHKPc0bS2xl9BCEDQhEW2znKDbklgJtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789870; c=relaxed/simple;
	bh=oPNPbOX0pEAbSQy5vJDniAmu8BdVDxaQpOJYfhbA+v0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P/nQWE8omcimqupC9/2SK+zQnm8vpAUoHysQorKvxPNQmh6Kt3SjXnCQ62630rc0ytmpFbqbMGRSFpappHkoIXJNTcG75PEPMo+S5hYY3MBGpswl1xRKr3BLuG15jL/iKNYrow6F50SsDQGmCXzTcl4mZCh/E47KMh7mpSPMP9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EH09kilM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I6XnxB1W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EH09kilM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I6XnxB1W; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EH09kilM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I6XnxB1W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EH09kilM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I6XnxB1W"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 02F5721E72;
	Mon, 12 Oct 2026 07:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791789867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=600dDvHLoWiCp3ZZjZvo+l7v70v2p2jTQAOXHsEM4LI=;
	b=EH09kilMF3wdCEK2lK7yNS6AUoXsunN7nnR0wSl9a/UFLwNwXBaru57zWQME9sTarBoGgd
	PFoMS7PnbUb54Hfk//5Vl/BWE4GATqaC3+IL4SCOwEQo+tSssVHJUUivSVSpU49OjJfhQw
	PQklCCxMbIGxtHqUoYQ9uAQimtISseY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791789867;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=600dDvHLoWiCp3ZZjZvo+l7v70v2p2jTQAOXHsEM4LI=;
	b=I6XnxB1Wt4Dlgn9dCNXNXID3vV1uiTCdXKJ4DAiEVmMSufQ3yz1IA0pzpSEo8VL+WI9C2Q
	MTCT0RwOwApsMmBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EH09kilM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=I6XnxB1W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791789867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=600dDvHLoWiCp3ZZjZvo+l7v70v2p2jTQAOXHsEM4LI=;
	b=EH09kilMF3wdCEK2lK7yNS6AUoXsunN7nnR0wSl9a/UFLwNwXBaru57zWQME9sTarBoGgd
	PFoMS7PnbUb54Hfk//5Vl/BWE4GATqaC3+IL4SCOwEQo+tSssVHJUUivSVSpU49OjJfhQw
	PQklCCxMbIGxtHqUoYQ9uAQimtISseY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791789867;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=600dDvHLoWiCp3ZZjZvo+l7v70v2p2jTQAOXHsEM4LI=;
	b=I6XnxB1Wt4Dlgn9dCNXNXID3vV1uiTCdXKJ4DAiEVmMSufQ3yz1IA0pzpSEo8VL+WI9C2Q
	MTCT0RwOwApsMmBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ACD9813314;
	Mon, 12 Oct 2026 07:24:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QDwJISqLzGpZXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Oct 2026 07:24:26 +0000
Date: Mon, 12 Oct 2026 09:24:26 +0200
Message-ID: <874ieridp1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ali Ahmet =?ISO-8859-2?Q?Memi=BA?= <aliamemis@disroot.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: control_led: Fix deadlock between sysfs writes and card disconnect
In-Reply-To: <20261011180627.1594051-1-aliamemis@disroot.org>
References: <20261011180627.1594051-1-aliamemis@disroot.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 02F5721E72
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,disroot.org:email,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sun, 11 Oct 2026 20:06:17 +0200,
Ali Ahmet Memiº wrote:
> 
> snd_ctl_led_disconnect() removes the ctl-led sysfs files while
> holding card->controls_rwsem.

Hm, it's not clear to me how this happens: I see no controls_rwsem
down around snd_ctl_led_disconnect() call.  Could you elaborate about
it a bit more?


thanks,

Takashi

> device_unregister() waits for running
> sysfs callbacks which can deadlock when a concurrent write causes
> the attach or detach callback to wait for controls_rwsem.
> 
> Break kernfs active protection in the attach, detach and list
> callbacks and hold a module reference instead.
> 
> Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
> Signed-off-by: Ali Ahmet Memiº <aliamemis@disroot.org>
> ---
>  sound/core/control_led.c | 62 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 57 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index ec0e6c7ad..501387287 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -563,12 +563,43 @@ static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, si
>  	return count;
>  }
>  
> +/*
> + * snd_ctl_led_disconnect() removes these files with card->controls_rwsem
> + * held. so don't let the removal wait for a callback that takes it.
> + */
> +static struct kernfs_node *snd_ctl_led_sysfs_enter(struct device *dev,
> +						   struct device_attribute *attr)
> +{
> +	struct kernfs_node *kn;
> +
> +	if (!try_module_get(THIS_MODULE))
> +		return NULL;
> +	kn = sysfs_break_active_protection(&dev->kobj, &attr->attr);
> +	if (!kn)
> +		module_put(THIS_MODULE);
> +	return kn;
> +}
> +
> +static void snd_ctl_led_sysfs_exit(struct kernfs_node *kn)
> +{
> +	sysfs_unbreak_active_protection(kn);
> +	module_put(THIS_MODULE);
> +}
> +
>  static ssize_t attach_store(struct device *dev,
>  			    struct device_attribute *attr,
>  			    const char *buf, size_t count)
>  {
>  	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
> -	return set_led_id(led_card, buf, count, true);
> +	struct kernfs_node *kn;
> +	ssize_t ret;
> +
> +	kn = snd_ctl_led_sysfs_enter(dev, attr);
> +	if (!kn)
> +		return -ENODEV;
> +	ret = set_led_id(led_card, buf, count, true);
> +	snd_ctl_led_sysfs_exit(kn);
> +	return ret;
>  }
>  
>  static ssize_t detach_store(struct device *dev,
> @@ -576,7 +607,15 @@ static ssize_t detach_store(struct device *dev,
>  			    const char *buf, size_t count)
>  {
>  	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
> -	return set_led_id(led_card, buf, count, false);
> +	struct kernfs_node *kn;
> +	ssize_t ret;
> +
> +	kn = snd_ctl_led_sysfs_enter(dev, attr);
> +	if (!kn)
> +		return -ENODEV;
> +	ret = set_led_id(led_card, buf, count, false);
> +	snd_ctl_led_sysfs_exit(kn);
> +	return ret;
>  }
>  
>  static ssize_t reset_store(struct device *dev,
> @@ -594,10 +633,8 @@ static ssize_t reset_store(struct device *dev,
>  	return count;
>  }
>  
> -static ssize_t list_show(struct device *dev,
> -			 struct device_attribute *attr, char *buf)
> +static ssize_t snd_ctl_led_list(struct snd_ctl_led_card *led_card, char *buf)
>  {
> -	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
>  	struct snd_ctl_led_ctl *lctl;
>  	size_t l = 0;
>  	struct snd_card *card __free(snd_card_unref) =
> @@ -620,6 +657,21 @@ static ssize_t list_show(struct device *dev,
>  	return l;
>  }
>  
> +static ssize_t list_show(struct device *dev,
> +			 struct device_attribute *attr, char *buf)
> +{
> +	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
> +	struct kernfs_node *kn;
> +	ssize_t ret;
> +
> +	kn = snd_ctl_led_sysfs_enter(dev, attr);
> +	if (!kn)
> +		return -ENODEV;
> +	ret = snd_ctl_led_list(led_card, buf);
> +	snd_ctl_led_sysfs_exit(kn);
> +	return ret;
> +}
> +
>  static DEVICE_ATTR_WO(attach);
>  static DEVICE_ATTR_WO(detach);
>  static DEVICE_ATTR_WO(reset);
> -- 
> 2.55.0
> 
