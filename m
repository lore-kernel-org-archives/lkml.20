Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229244C6502;
	Wed, 16 Sep 2026 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573266; cv=none; b=gnGZE8dgYNBcKMe1NomvI71uu24+Qn8xQdYnmH/y0za8xNlocDXzouZ5T+wJXSaNea6z8G1ucS3Vt3j6oCXeDTeJmUoYyHBiARlUrQff00yFzGOJNRA42eIrclUkXMeqB6cRsdDQecwVB4+pV2qS1zKfgut54pJWwxph8pzGM4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573266; c=relaxed/simple;
	bh=n4xK56+nsponox+4lnaoh5yoTYeub8+g+x6vIWCCbek=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rHqK2CSNBtMLxzUU/bivqSq1wQAEzU4+NB8XBTmnP7ENzbMtvjhEHlxNskc0mPx5vCQkZXXsTtsnS7md0P65+J6auNJSqlse2yNTC2mi37Wr3bk0UffNV1CZV2j5DE2L9+7uedNmQljpfiE+hiNCBvMJ49kJob2FXql7g2Jp7Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nr+rVI/X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BDt0SAgM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C+ddDFO8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2OLFgFxS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nr+rVI/X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BDt0SAgM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C+ddDFO8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2OLFgFxS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A12C41FD9B;
	Wed, 16 Sep 2026 15:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789573258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5XvaS+b0ry40WXZppMjQMHke1Sf0nrmohehXRt2YjEg=;
	b=Nr+rVI/XJRrHUjp3rFbNuTePFu5D62YyjLyn1oLg8wGFi7s+H25fD3Jw7AYy2lfrQ/xAS5
	sdWyOD1PEOXpdlzzY9w26Z6L23rb0TdO3voMn+/tx/nALjaNCZNCV7chseY9/Qpvn0SsLd
	40ub7NTXCE/M6Qh+0W/OZQWjnKDCmMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789573258;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5XvaS+b0ry40WXZppMjQMHke1Sf0nrmohehXRt2YjEg=;
	b=BDt0SAgM4ZY5LhgmfMqNaHAMSzG2vZV7nyyZOzmWpMXJNV0/4syi2xu0qA7/+SwJemqvrU
	7W/MZO44Y6aAJqBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=C+ddDFO8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2OLFgFxS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789573254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5XvaS+b0ry40WXZppMjQMHke1Sf0nrmohehXRt2YjEg=;
	b=C+ddDFO8cnyLUBM1bnbXWpbGOvSahBeAzmol3qTpCj3oBhFSA3zzXELGo3TRuc/4wySGwc
	ZukRFPApUm2WmXNo+2Es7sQQDqvUszGJa/sHxMA5p5CKVj8wpdYN4D0UiQexKKFpC/8UEa
	ngLOpbOHoXj24EbCuobaSzvzK/OqPCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789573254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5XvaS+b0ry40WXZppMjQMHke1Sf0nrmohehXRt2YjEg=;
	b=2OLFgFxSQ16RCPWOWgHg6cTDUazs9Ig6l37HG6u+5rT+hufnFheQ2mqG0qO8GwsC+dYTX1
	TokaAYK7DkL3DRCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50D401348F;
	Wed, 16 Sep 2026 15:40:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LSGoCYa4qmq4LwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Sep 2026 15:40:54 +0000
Date: Wed, 16 Sep 2026 17:40:53 +0200
Message-ID: <87a4phjjay.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zipdox <zipdox@zipdox.net>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and RANGE
In-Reply-To: <da56664f-901e-497b-a74c-ae41cbc5cac4@zipdox.net>
References: <d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net>
	<87bj9yn55n.wl-tiwai@suse.de>
	<59b3dc9b-f324-42e7-ab03-a01c04e8b915@zipdox.net>
	<8733vamwaz.wl-tiwai@suse.de>
	<da56664f-901e-497b-a74c-ae41cbc5cac4@zipdox.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: A12C41FD9B
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Wed, 16 Sep 2026 09:43:14 +0200,
Zipdox wrote:
> 
> On 9/15/26 4:19 PM, Takashi Iwai wrote:
> > But your code also blindly assumes the MU_MIXER_CONTROL that doesn't
> > fit with other units like feature unit?  I guess we have to set the
> > proper Control Selector value depending on the unit type.
> > 
> > After all, this is about the correct setup of wValue.  Let's try to be
> > minimalistic at first -- just tweak wValue in get_ctl_value_v2() and
> > snd_usb_mixer_set_ctl_value() at first.  If this becomes too ugly, we
> > can think of redesigning.
> I assumed that mixer.c was just for the mixer unit, and I seem to have
> completely overlooked the fact that that it also controls feature
> units. I'm not sure how to proceed from here. Do you have any
> suggestions for how we can store the control selector in the
> usb_mixer_elem_info struct? The control field is presently used as the
> input channel number, so maybe we should add a separate field for the
> input channel? I think maybe it's better that someone else fixes this,
> I'm kind of out of my element here.

I took a look back at the current code, and at least, the parse of
UAC2 mixer unit itself is OK -- it handles the bitmap properly.
The problem is the exceptional way to set up wValue for the mixer
unit, and I guess something like below could work.  It just stores the
part of wValue in an additional field, and use it for calculating the
correct wValue with MCN + UAC2_MU_MIXER in high byte.

Just compile tested, so not 100% sure whether it's correct.


thanks,

Takashi

--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -347,6 +347,10 @@ static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 
 	val_size = uac2_ctl_value_size(cval->val_type);
 
+	/* correct wValue for UAC2 mixer control with MCN */
+	if (cval->v2_mixer)
+		validx = cval->v2_mixer | ((validx & 0xff) - 1);
+
 	if (request == UAC_GET_CUR) {
 		bRequest = UAC2_CS_CUR;
 		size = val_size;
@@ -2345,6 +2349,10 @@ static void build_mixer_unit_ctl(struct mixer_build *state,
 
 	snd_usb_mixer_elem_init_std(&cval->head, state->mixer, unitid);
 	cval->control = in_ch + 1; /* based on 1 */
+	/* MCN is calculated later with the input channel based on v2_mixer */
+	if (state->mixer->protocol == UAC_VERSION_2 ||
+	    state->mixer->protocol == UAC_VERSION_3)
+		cval->v2_mixer = (UAC2_MU_MIXER << 8) | (in_ch * num_outs);
 	cval->val_type = USB_MIXER_S16;
 	for (i = 0; i < num_outs; i++) {
 		__u8 *c = uac_mixer_unit_bmControls(desc, state->mixer->protocol);
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index 037b446d8b6f..650f30026177 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -97,6 +97,7 @@ struct usb_mixer_elem_info {
 	u8 initialized;
 	u8 min_mute;
 	u8 get_cur_broken;
+	u16 v2_mixer;
 	void *private_data;
 };
 
