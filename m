Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684092;
	b=cL0POjdgLV5S3mhYutFbjFKSHjit4sAAVIK05ssZIFRAVeh3Efc7h3BlFlOghSR4gI3m
	 oOwbbfZ2HcI4cry2ZrvBc3TxizchpkOXUnWp/g8FbL8eYYFmIMQpv7UrbTxjVe3JFG7fD
	 vU6DFcNLoKWELsk7cbir+zMXvhATi4MGjxTxtmANG2pdezKAJm7DVhb6WGbg8RIMNFAsP
	 UiLnHB6SOe+5uCOaXr4Cu7QjEcQuUNDXFsCCg0y3giIeJUOuFPbmwzBjJ9U2GkBNRmtQ5
	 J5AcixUeTZLb7LcIDl5iGQdLUOK7ImSPWgmpuSM35hINDW+peCP67vHN3fkKv92MyQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684092;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=+gv65TDuZb0udmDXHCqAUeTW9G0DtOsFffC0G6gnss4=;
	b=ns6knzcWAIt2q0Y3qX96pt0xMBXZUNjQjeY3Z2huQj5Gt3QLMbgoGZGiDetBzFG6SqH8
	 H+JzIeL3pcE5Q+PBr7ewM1EcrhHayW0r87DzQ4F5wY2Qt1NmA2sP/m6q68mz82E0bS5b2
	 MoK2fq4RCR2MHReSc4AUU9ofNHGzUW44lxR/t+hIgrqamXSBO2q7rW7egYbhEEWNcU5JB
	 GEmVi/7pbr3pLU7N94rcGxpvy5x8MmlQ1dJTABYhKZldxstF726bjRujSzJlPOC/EDl8y
	 /28CMODZTkILM/hY+DRe08MvaKmV5X3jmnAsZLUCEM0s6f0Vp+8wKFjvaLgoDMwEyWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="J/g/jmIP";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LCY+U2R+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="J/g/jmIP";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LCY+U2R+;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8713C606A31B;
	Thu, 22 Oct 2026 15:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8713C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=J/g/jmIP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LCY+U2R+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=J/g/jmIP;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LCY+U2R+
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2D6421F78C;
	Thu, 22 Oct 2026 15:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792684084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+gv65TDuZb0udmDXHCqAUeTW9G0DtOsFffC0G6gnss4=;
	b=J/g/jmIP8Ha4w3JDl6OU7U7CybVmmtEgh/NxXGUvSzTTla6oTynKpGIhAUsJzZkxhAyARA
	ctXJPGI1zwRTzU+tm/wCEaupwrFxyIIS/XGSNgzg6nr32619A3CRc3SZREk3pA+Cumf9wT
	tW03ST0tcqpvMvJPFz0i29xLK5OM4Q8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792684084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+gv65TDuZb0udmDXHCqAUeTW9G0DtOsFffC0G6gnss4=;
	b=LCY+U2R+7Z9N6/B7tr+0Sp3C38QRy3sZMI29T9kq4wWzq73faLkY6W3ocbTHQCGedgte9M
	iVQG0qUEkuj8zXAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792684084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+gv65TDuZb0udmDXHCqAUeTW9G0DtOsFffC0G6gnss4=;
	b=J/g/jmIP8Ha4w3JDl6OU7U7CybVmmtEgh/NxXGUvSzTTla6oTynKpGIhAUsJzZkxhAyARA
	ctXJPGI1zwRTzU+tm/wCEaupwrFxyIIS/XGSNgzg6nr32619A3CRc3SZREk3pA+Cumf9wT
	tW03ST0tcqpvMvJPFz0i29xLK5OM4Q8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792684084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+gv65TDuZb0udmDXHCqAUeTW9G0DtOsFffC0G6gnss4=;
	b=LCY+U2R+7Z9N6/B7tr+0Sp3C38QRy3sZMI29T9kq4wWzq73faLkY6W3ocbTHQCGedgte9M
	iVQG0qUEkuj8zXAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D77C2133F3;
	Thu, 22 Oct 2026 15:48:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0b+MKzMw2mr2fAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Oct 2026 15:48:03 +0000
Date: Thu, 22 Oct 2026 17:48:03 +0200
Message-ID: <87o6clbuto.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: jasmeet.bhatia.us@gmail.com
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D . Bennett" <g@b4.vu>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Reset Blue Yeti firmware 0.20 after resume
In-Reply-To: <20261021231754.16928-1-jasmeet.bhatia.us@gmail.com>
References: <20261021231754.16928-1-jasmeet.bhatia.us@gmail.com>
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
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80

On Thu, 22 Oct 2026 01:17:54 +0200,
jasmeet.bhatia.us@gmail.com wrote:
> 
> From: "Jasmeet (Jazz) Bhatia" <jasmeet.bhatia.us@gmail.com>
> 
> Blue Yeti Classic microphones with firmware 0.20 remain enumerated
> after a system suspend/resume cycle but stop delivering capture
> samples. This results in an attempt to capture audio failing with
> -EIO.
> 
> Instead, the device should be recovered by sending its volatile ROM
> reset command after a system resume. The command restarts the device's
> MCU and USB logic, causing it to disconnect and re-enumerate with
> working capture.
> 
> Defering the reset to system_freezable_wq provided best results when
> testing, ensuring device resumes only after callbacks have completed.
> 
> Limits the quirk to USB ID 046d:0ab7 with bcdDevice 0x0020.
> 
> Signed-off-by: Jasmeet (Jazz) Bhatia <jasmeet.bhatia.us@gmail.com>

Apart from the issues Sashiko already reported, I find this way a bit
too scary, and I'm not sure whether the usb-audio driver is the right
place to perform such a thing.  Couldn't it be better done in the
lower USB layer somehow?


thanks,

Takashi

> ---
>  sound/usb/card.c   |  3 ++
>  sound/usb/quirks.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++
>  sound/usb/quirks.h |  1 +
>  3 files changed, 81 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 9307da95efbe..ebacb98fc34e 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -1280,6 +1280,9 @@ static int usb_audio_resume(struct usb_interface *intf)
>  	if (chip->num_suspended_intf > 1)
>  		goto out;
>  
> +	if (chip->system_suspend)
> +		snd_usb_apply_resume_quirk(chip);
> +
>  	list_for_each_entry(as, &chip->pcm_list, list) {
>  		err = snd_usb_pcm_resume(as);
>  		if (err < 0) {
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index a54fabce7920..42d955c7b7a4 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -10,6 +10,8 @@
>  #include <linux/usb.h>
>  #include <linux/usb/audio.h>
>  #include <linux/usb/midi.h>
> +#include <linux/module.h>
> +#include <linux/workqueue.h>
>  #include <linux/bits.h>
>  
>  #include <sound/control.h>
> @@ -1626,6 +1628,81 @@ int snd_usb_apply_interface_quirk(struct snd_usb_audio *chip,
>  	return 0;
>  }
>  
> +/*
> + * Blue Yeti Classic firmware 0.20 may stop delivering capture samples
> + * after a system suspend/resume while otherwise remaining enumerated.
> + *
> + * Sending the device's volatile ROM reset command restarts its MCU and
> + * USB logic, causing it to re-enumerate and restoring capture.
> + *
> + * Do not send the command directly from the USB resume callback because
> + * it deliberately disconnects the device.  Queue it on the freezable
> + * workqueue so it runs after device resume callbacks have completed.
> + */
> +struct snd_usb_yeti_reset {
> +	struct work_struct work;
> +	struct usb_device *dev;
> +};
> +
> +static void snd_usb_yeti_reset_work(struct work_struct *work)
> +{
> +	struct snd_usb_yeti_reset *yeti =
> +		container_of(work, struct snd_usb_yeti_reset, work);
> +	struct usb_device *dev = yeti->dev;
> +	static const u8 reset_cmd[8] = {
> +		0x00, 0x09, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00
> +	};
> +	int err;
> +
> +	err = usb_control_msg_send(dev, 0, UAC_SET_CUR,
> +				   USB_DIR_OUT | USB_TYPE_CLASS |
> +				   USB_RECIP_INTERFACE,
> +				   0x0a00, 0x1900,
> +				   reset_cmd, sizeof(reset_cmd),
> +				   USB_CTRL_SET_TIMEOUT, GFP_KERNEL);
> +
> +	if (err && err != -ENODEV)
> +		dev_warn(&dev->dev,
> +			 "Blue Yeti resume reset failed: %d\n", err);
> +
> +	usb_put_dev(dev);
> +	kfree(yeti);
> +	module_put(THIS_MODULE);
> +}
> +
> +static void snd_usb_yeti_resume_quirk(struct snd_usb_audio *chip)
> +{
> +	struct usb_device *dev = chip->dev;
> +	struct snd_usb_yeti_reset *yeti;
> +
> +	if (chip->usb_id != USB_ID(0x046d, 0x0ab7) ||
> +	    le16_to_cpu(dev->descriptor.bcdDevice) != 0x0020)
> +		return;
> +
> +	yeti = kmalloc_obj(*yeti);
> +	if (!yeti) {
> +		dev_warn(&dev->dev,
> +			 "Blue Yeti resume reset allocation failed\n");
> +		return;
> +	}
> +
> +	INIT_WORK(&yeti->work, snd_usb_yeti_reset_work);
> +	yeti->dev = usb_get_dev(dev);
> +	__module_get(THIS_MODULE);
> +
> +	if (!queue_work(system_freezable_wq, &yeti->work)) {
> +		module_put(THIS_MODULE);
> +		usb_put_dev(yeti->dev);
> +		kfree(yeti);
> +	}
> +}
> +
> +void snd_usb_apply_resume_quirk(struct snd_usb_audio *chip)
> +{
> +	snd_usb_yeti_resume_quirk(chip);
> +}
> +
>  int snd_usb_apply_boot_quirk(struct usb_device *dev,
>  			     struct usb_interface *intf,
>  			     const struct snd_usb_audio_quirk *quirk,
> diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
> index 0a723c266bb4..9988e185538f 100644
> --- a/sound/usb/quirks.h
> +++ b/sound/usb/quirks.h
> @@ -15,6 +15,7 @@ int snd_usb_apply_interface_quirk(struct snd_usb_audio *chip,
>  				  int iface,
>  				  int altno);
>  
> +void snd_usb_apply_resume_quirk(struct snd_usb_audio *chip);
>  int snd_usb_apply_boot_quirk(struct usb_device *dev,
>  			     struct usb_interface *intf,
>  			     const struct snd_usb_audio_quirk *quirk,
> 
> base-commit: 4df4d2a577db2d3d57b888bcfb1206fc74661d16
> -- 
> 2.56.0
> 
