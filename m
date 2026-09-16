Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0EA3DAAAF;
	Wed, 16 Sep 2026 18:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582962; cv=none; b=KIaKCv1kWiw2stp7xs6CB37sq4wbxML98SAxbddegPTOAxxo/CtX70+3EiJOTTSNogYKHAaYDSIWkSv4ngTUJHPh7GA2b/t5FPfVqrDbJ40GFFQhLhVoD7Do2CbOdL12gqX3nXNMBx0pLr15UGUAmINYrOWjsLJqx/v1LOVxWlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582962; c=relaxed/simple;
	bh=q3VjURZMXKqB9yCrcdYrJ/21QhX7uAiJcHACrOdAWus=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SLaM9hnpgFDegebTCmAI/GR5q2YTO55moe+XjmjtXc81i7QisxLt9GK+7waZp0zyTHG4mDFkVv26lI9sfI3of5dgs1lMWF26ga1iFOHBetL/34PVqVww+79iu3Xju8yEYXY3mX7cdblZIppkMea0HXIZACC/1/fngyDi8bKfHx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S430EUt8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BvGPNJO7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WJ1RcS+W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aJPz99R1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S430EUt8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BvGPNJO7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WJ1RcS+W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aJPz99R1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5955221B8C;
	Wed, 16 Sep 2026 18:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789582926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cmYOlhDdBjhgEJ5L37mtGA4KGFql+y4GwOR6i1ZYA5s=;
	b=S430EUt80w9DbvVXIHPNsXLOU6ToqU2nKI/vNWCY6vQV+N9T+YHtAbdxkHhrUhBS2CcIG3
	z64Lf1pCw7zg76l5wNiXVVG0f27h25vI5ZIU3ba8z1SiijsZxYK1Ic74T6khURBOHo477n
	piyBVkw6lMKgafKgaN3sNIIZT6R+NW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789582926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cmYOlhDdBjhgEJ5L37mtGA4KGFql+y4GwOR6i1ZYA5s=;
	b=BvGPNJO7fOYnZC6Tx3AJJ+Il+IycQrPvnJpx1RTdCcd5Hxbx1lYHaRqO+aaWz2xURJm40w
	b6xevhg5Yg09UgAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789582922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cmYOlhDdBjhgEJ5L37mtGA4KGFql+y4GwOR6i1ZYA5s=;
	b=WJ1RcS+WbtRS69LSxaIaWz6VHeBbBi9PiC8W4PlWHuqE5i6h7UgivAC5NquJeeouFquexN
	RibfpNZgWZDiMypUFhY9QtGeYV8EsXFt2lISQBGsnrtDIh2ku7MP3HR2e4Co1Sunqb0TFH
	Y17w0g8K/B76iEvmbg8V+zzaDUWJ94Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789582922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cmYOlhDdBjhgEJ5L37mtGA4KGFql+y4GwOR6i1ZYA5s=;
	b=aJPz99R14fVk0O4xzP61NtYEQrs4X/Esa8/JnpEaMZPZk/Qt8ljwdvC8mq/mjlsnyYJS6x
	06w4dwTDNatSUNAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 134A1136A5;
	Wed, 16 Sep 2026 18:22:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id z0vrNkneqmrGWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Sep 2026 18:22:02 +0000
Date: Wed, 16 Sep 2026 20:22:01 +0200
Message-ID: <87y0d1hx9y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zipdox <zipdox@zipdox.net>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and RANGE
In-Reply-To: <8733v9jfp1.wl-tiwai@suse.de>
References: <d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net>
	<87bj9yn55n.wl-tiwai@suse.de>
	<59b3dc9b-f324-42e7-ab03-a01c04e8b915@zipdox.net>
	<8733vamwaz.wl-tiwai@suse.de>
	<da56664f-901e-497b-a74c-ae41cbc5cac4@zipdox.net>
	<87a4phjjay.wl-tiwai@suse.de>
	<8733v9jfp1.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Wed, 16 Sep 2026 18:58:50 +0200,
Takashi Iwai wrote:
> 
> On Wed, 16 Sep 2026 17:40:53 +0200,
> Takashi Iwai wrote:
> > 
> > On Wed, 16 Sep 2026 09:43:14 +0200,
> > Zipdox wrote:
> > > 
> > > On 9/15/26 4:19 PM, Takashi Iwai wrote:
> > > > But your code also blindly assumes the MU_MIXER_CONTROL that doesn't
> > > > fit with other units like feature unit?  I guess we have to set the
> > > > proper Control Selector value depending on the unit type.
> > > > 
> > > > After all, this is about the correct setup of wValue.  Let's try to be
> > > > minimalistic at first -- just tweak wValue in get_ctl_value_v2() and
> > > > snd_usb_mixer_set_ctl_value() at first.  If this becomes too ugly, we
> > > > can think of redesigning.
> > > I assumed that mixer.c was just for the mixer unit, and I seem to have
> > > completely overlooked the fact that that it also controls feature
> > > units. I'm not sure how to proceed from here. Do you have any
> > > suggestions for how we can store the control selector in the
> > > usb_mixer_elem_info struct? The control field is presently used as the
> > > input channel number, so maybe we should add a separate field for the
> > > input channel? I think maybe it's better that someone else fixes this,
> > > I'm kind of out of my element here.
> > 
> > I took a look back at the current code, and at least, the parse of
> > UAC2 mixer unit itself is OK -- it handles the bitmap properly.
> > The problem is the exceptional way to set up wValue for the mixer
> > unit, and I guess something like below could work.  It just stores the
> > part of wValue in an additional field, and use it for calculating the
> > correct wValue with MCN + UAC2_MU_MIXER in high byte.
> > 
> > Just compile tested, so not 100% sure whether it's correct.
> 
> ... and this version was obviously half-baked, forgotten the
> counterpart.  A revised patch is below.

... or maybe a less cryptic version like below.


Takashi

-- 8< --
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 33a6a1281410..c6639a45fb24 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -335,6 +335,16 @@ static int get_ctl_value_v1(struct usb_mixer_elem_info *cval, int request,
 	return -EINVAL;
 }
 
+/* convert the given UAC1 wValue (ICN+1|OCN+1) to UAC2 MCN */
+static unsigned int to_mcn(const struct usb_mixer_elem_info *cval,
+			   unsigned int validx)
+{
+	unsigned char m = (validx >> 8) & 0xff;
+	unsigned char v = validx & 0xff;
+
+	return (m - 1) * cval->num_outputs * (v - 1);
+}
+
 static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 			    int validx, int *value_ret)
 {
@@ -347,6 +357,10 @@ static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 
 	val_size = uac2_ctl_value_size(cval->val_type);
 
+	/* correct wValue for UAC2 mixer control with MCN */
+	if (cval->v2_mixer)
+		validx =(UAC2_MU_MIXER << 8) | to_mcn(cval, validx);
+
 	if (request == UAC_GET_CUR) {
 		bRequest = UAC2_CS_CUR;
 		size = val_size;
@@ -478,6 +492,10 @@ int snd_usb_mixer_set_ctl_value(struct usb_mixer_elem_info *cval,
 		}
 
 		request = UAC2_CS_CUR;
+
+		/* correct wValue for UAC2 mixer control with MCN */
+		if (cval->v2_mixer)
+			validx =(UAC2_MU_MIXER << 8) | to_mcn(cval, validx);
 	}
 
 	value_set = convert_bytes_value(cval, value_set);
@@ -2345,6 +2363,10 @@ static void build_mixer_unit_ctl(struct mixer_build *state,
 
 	snd_usb_mixer_elem_init_std(&cval->head, state->mixer, unitid);
 	cval->control = in_ch + 1; /* based on 1 */
+	if (state->mixer->protocol == UAC_VERSION_2 ||
+	    state->mixer->protocol == UAC_VERSION_3)
+		cval->v2_mixer = true;
+	cval->num_outputs = num_outs;
 	cval->val_type = USB_MIXER_S16;
 	for (i = 0; i < num_outs; i++) {
 		__u8 *c = uac_mixer_unit_bmControls(desc, state->mixer->protocol);
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index 037b446d8b6f..cf45c39cbccc 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -97,6 +97,8 @@ struct usb_mixer_elem_info {
 	u8 initialized;
 	u8 min_mute;
 	u8 get_cur_broken;
+	u8 num_outputs;
+	bool v2_mixer;
 	void *private_data;
 };
 
