Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3724B0E3B;
	Wed, 16 Sep 2026 16:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577958; cv=none; b=Pha2c42tRGS4cW5C/9N/LvzHCzCeRQoDFqS5zFzRz3rYRHnfBl9Gmm2L3ceuuZftIKK38c2QXVgU8CwChZAfcg8B4CizdA8IQqg3DKi86iRUhMvFLJGoTZaW6xWoD9qDitklCmz9b4ZHVRWphKwifRB2OZpzgS25aOZaTGe0eHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577958; c=relaxed/simple;
	bh=/TwaMiMcer6euS6/8CkD33dYecd9qcz0FuKc8suMy+8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qRzd6aqsQSfF56shL1S9XGJRENFUozHJA9PBK/gORBQAppanap7O2ag/MLMu3TGgjsNYFgydWa/TlfugcO9qZJc/yH9Jv5gyVhPeLR65pZDuCAo1IZMMg9ckL9tIG3h7AiNjwxRNXxJpDShm5XY1AE7AXVYijs0qPi45KrfZBcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BmNM8syD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4qC8r8Kd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZO/f2dzV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u+QoQhOb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BmNM8syD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4qC8r8Kd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZO/f2dzV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u+QoQhOb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0751221B5F;
	Wed, 16 Sep 2026 16:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789577935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PKEK8H3uONRYctwH+0B7I+A1KXHLhudQfu9KX4FXZtU=;
	b=BmNM8syDMJwj/j1d6CiH6idsy1c49h4ezhiGfxFkseFPHLZQBLGVQX5tRTayj9exFeXZcV
	OjGOTsNe2wYRfKZcBvv1awodiiFi4NmQpRy5FNIP3P4GxUt136dGaXxYOGPstEcOl7ZFG/
	iXf8fDNSI1snKmfObWCoTdh1n9SyVg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789577935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PKEK8H3uONRYctwH+0B7I+A1KXHLhudQfu9KX4FXZtU=;
	b=4qC8r8Kd7GR+Cgc5y6Bp0utNZ9lbp+qEmZCUG+Wu3cHUhscrgHvTDc1q7bJ73sn3hxMzyy
	BkTVXqRQvMfcyUCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ZO/f2dzV";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u+QoQhOb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789577931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PKEK8H3uONRYctwH+0B7I+A1KXHLhudQfu9KX4FXZtU=;
	b=ZO/f2dzVaHSuh8l7v+6IzRRQ6HBqjLSmiLPz1n16i1KVxHhnXNHRwRqXHaGTWa3hceMWCr
	1II9I/8ckUKTNk7np7cA6r4S4MTWSSTG/9jFsUrhj8On4zLgQfYjs97v5ZB7U+bpE4Dr/e
	KP6LHzJikbn2Lbv3/knYDtMBMM1feNo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789577931;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PKEK8H3uONRYctwH+0B7I+A1KXHLhudQfu9KX4FXZtU=;
	b=u+QoQhObfxo6NXVuVK31nddt+TBgM/B/9+3vOtT+LXrboas/GY+0Ok+tRxefWS1lH1d2Q7
	+3LhoUhbdXqTKZCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B51F41348F;
	Wed, 16 Sep 2026 16:58:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kxRAIsrKqmrYAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Sep 2026 16:58:50 +0000
Date: Wed, 16 Sep 2026 18:58:50 +0200
Message-ID: <8733v9jfp1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zipdox <zipdox@zipdox.net>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and RANGE
In-Reply-To: <87a4phjjay.wl-tiwai@suse.de>
References: <d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net>
	<87bj9yn55n.wl-tiwai@suse.de>
	<59b3dc9b-f324-42e7-ab03-a01c04e8b915@zipdox.net>
	<8733vamwaz.wl-tiwai@suse.de>
	<da56664f-901e-497b-a74c-ae41cbc5cac4@zipdox.net>
	<87a4phjjay.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 0751221B5F
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Wed, 16 Sep 2026 17:40:53 +0200,
Takashi Iwai wrote:
> 
> On Wed, 16 Sep 2026 09:43:14 +0200,
> Zipdox wrote:
> > 
> > On 9/15/26 4:19 PM, Takashi Iwai wrote:
> > > But your code also blindly assumes the MU_MIXER_CONTROL that doesn't
> > > fit with other units like feature unit?  I guess we have to set the
> > > proper Control Selector value depending on the unit type.
> > > 
> > > After all, this is about the correct setup of wValue.  Let's try to be
> > > minimalistic at first -- just tweak wValue in get_ctl_value_v2() and
> > > snd_usb_mixer_set_ctl_value() at first.  If this becomes too ugly, we
> > > can think of redesigning.
> > I assumed that mixer.c was just for the mixer unit, and I seem to have
> > completely overlooked the fact that that it also controls feature
> > units. I'm not sure how to proceed from here. Do you have any
> > suggestions for how we can store the control selector in the
> > usb_mixer_elem_info struct? The control field is presently used as the
> > input channel number, so maybe we should add a separate field for the
> > input channel? I think maybe it's better that someone else fixes this,
> > I'm kind of out of my element here.
> 
> I took a look back at the current code, and at least, the parse of
> UAC2 mixer unit itself is OK -- it handles the bitmap properly.
> The problem is the exceptional way to set up wValue for the mixer
> unit, and I guess something like below could work.  It just stores the
> part of wValue in an additional field, and use it for calculating the
> correct wValue with MCN + UAC2_MU_MIXER in high byte.
> 
> Just compile tested, so not 100% sure whether it's correct.

... and this version was obviously half-baked, forgotten the
counterpart.  A revised patch is below.


Takashi

-- 8< --
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 33a6a1281410..0977fc58d0b5 100644
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
@@ -478,6 +482,10 @@ int snd_usb_mixer_set_ctl_value(struct usb_mixer_elem_info *cval,
 		}
 
 		request = UAC2_CS_CUR;
+
+		/* correct wValue for UAC2 mixer control with MCN */
+		if (cval->v2_mixer)
+			validx = cval->v2_mixer | ((validx & 0xff) - 1);
 	}
 
 	value_set = convert_bytes_value(cval, value_set);
@@ -2345,6 +2353,10 @@ static void build_mixer_unit_ctl(struct mixer_build *state,
 
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
 
