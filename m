Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17503859FD;
	Thu, 17 Sep 2026 14:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656603; cv=none; b=hc/f3HgsInY6r28OE4C9m2GtFZhR/X9oRYlAahXe2raVanpBJ/aMsoCvapysLZhkgsyI1EyvRVBRmwmr9ncn6fsgLiykPDKJe/rk+kv07Nu0+kDkVWmoxe5OhpGQYScoXjEVs6Pd3XX0QyOTx1nE5kowYB5rc4XFxV+OdsvwzE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656603; c=relaxed/simple;
	bh=gp0omg+vJh0hcD9rQaRNT2LAMaPYdGlQz0uwul7VZBI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SCEUCb2WSn6Bo9IHsbuK1C9UqNbBTQGYZ7ZMnGk1tFsOqtwPboQASIhvGZ4qGDAwTpcPlBxpB6n5zKPuwr8Vy+O0y2XuRNb6srIU30e7wjsX9uFZfFF2jveFpK9CeC9rQ5ruQ4cNSulP2rN+PTIqZLJgqnuVB5bWW9QEIaXGr30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UMpxUxqs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ScTpOTQV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jkfgq9Lc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YdUtcS/d; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UMpxUxqs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ScTpOTQV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jkfgq9Lc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YdUtcS/d"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4A9E81F820;
	Thu, 17 Sep 2026 14:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789656580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mNCvDycunCg3tBijiCl7UAJ+SQVGZhaWLIuNXpm/6sg=;
	b=UMpxUxqsZqYyvkPqHjdn42b4sbYm8JtuagKhHgsFdtwptQDHuBp/Lm7VHf0sSNpxmjPrAg
	3AzCF7YhYZbYLlaACAKn2VleDnOjCL8vXE73pigrKifKRTL7H4/a7CKLclZ5cegMUKPoc5
	Qfgh+v3DBL7VTpAcELALDus25oiBQYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789656580;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mNCvDycunCg3tBijiCl7UAJ+SQVGZhaWLIuNXpm/6sg=;
	b=ScTpOTQVLS2rqX5q+hAD2m0rXCXAgCdFchzqVLigfXzPly88/Cs3ZckIZtyyQs9aHwQV2O
	EX6cum+NX7rfsvCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jkfgq9Lc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="YdUtcS/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789656576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mNCvDycunCg3tBijiCl7UAJ+SQVGZhaWLIuNXpm/6sg=;
	b=jkfgq9LcSoLul4/Ew52OquP0O8R9/iUzaCeS4N/Zp8siVP2zFdL+XVBBvWz5RG3hwLQsBe
	KLofDBuFsHfeTT+0VLWgOZ1ygblF33x5felH5q4einNz3GkSiJjNQyzLBRRUWqk6lfMopW
	4adBm3DSFN9Unt0nh0a3+mHoeQMYrC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789656576;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mNCvDycunCg3tBijiCl7UAJ+SQVGZhaWLIuNXpm/6sg=;
	b=YdUtcS/dbS6N7w4FLRCKSxMulr499rzEcmUH8LjdYl+aEZm3W8GrsfL1w8BbDC5nRzxocO
	HxRhnx1Ly+DzMUCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E64BE1374A;
	Thu, 17 Sep 2026 14:49:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3Fu9Lv/9q2p9GgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 17 Sep 2026 14:49:35 +0000
Date: Thu, 17 Sep 2026 16:49:35 +0200
Message-ID: <875x04gcg0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zipdox <zipdox@zipdox.net>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and RANGE
In-Reply-To: <895b9e3d-bc81-4688-8513-8aa42d40e4fa@zipdox.net>
References: <d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net>
	<87bj9yn55n.wl-tiwai@suse.de>
	<59b3dc9b-f324-42e7-ab03-a01c04e8b915@zipdox.net>
	<8733vamwaz.wl-tiwai@suse.de>
	<da56664f-901e-497b-a74c-ae41cbc5cac4@zipdox.net>
	<87a4phjjay.wl-tiwai@suse.de>
	<8733v9jfp1.wl-tiwai@suse.de>
	<87y0d1hx9y.wl-tiwai@suse.de>
	<895b9e3d-bc81-4688-8513-8aa42d40e4fa@zipdox.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: multipart/mixed;
 boundary="Multipart_Thu_Sep_17_16:49:35_2026-1"
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 4A9E81F820
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~,3:~,4:~];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO

--Multipart_Thu_Sep_17_16:49:35_2026-1
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Sep 2026 16:23:41 +0200,
Zipdox wrote:
> 
> 
> 
> On 9/16/26 8:22 PM, Takashi Iwai wrote:
> > 
> > ... or maybe a less cryptic version like below.
> > 
> > 
> > Takashi
> > 
> > -- 8< --
> > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > index 33a6a1281410..c6639a45fb24 100644
> > --- a/sound/usb/mixer.c
> > +++ b/sound/usb/mixer.c
> > @@ -335,6 +335,16 @@ static int get_ctl_value_v1(struct usb_mixer_elem_info *cval, int request,
> >   	return -EINVAL;
> >   }
> >   +/* convert the given UAC1 wValue (ICN+1|OCN+1) to UAC2 MCN */
> > +static unsigned int to_mcn(const struct usb_mixer_elem_info *cval,
> > +			   unsigned int validx)
> > +{
> > +	unsigned char m = (validx >> 8) & 0xff;
> > +	unsigned char v = validx & 0xff;
> > +
> > +	return (m - 1) * cval->num_outputs * (v - 1);
> > +}
> You used multiplication instead of addition for the last part. I
> assume this is a mistake?

Yes, an obvious typo.

> Also you should probably also bitwise and
> that with 0xFF to make sure it's not more than one byte. The product
> of the number of input and output channels must be no greater than 256
> according to the spec. I don't know if this is checked
> elsewhere.

Right, that's already done in another patch, I didn't send the whole
series.  Now attached below.

> Other than that it looks good for a patch to get it
> working. I'll try it out and send a follow-up email shortly.


thanks,

Takashi


--Multipart_Thu_Sep_17_16:49:35_2026-1
Content-Type: application/octet-stream; type=patch; name="0001-ALSA-usb-audio-Check-mixer-matrix-size-for-UAC2-3-at.patch"
Content-Disposition: attachment; filename="0001-ALSA-usb-audio-Check-mixer-matrix-size-for-UAC2-3-at.patch"
Content-Transfer-Encoding: 7bit

From f4276ae989dbfc13209c7630779068dcdec917e8 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 17 Sep 2026 10:02:02 +0200
Subject: [PATCH 1/3] ALSA: usb-audio: Check mixer matrix size for UAC2/3 at
 parsing

The matrix of input/output channels specified in a UAC2/3 mixer unit
must fit to the upper limit 256.  Add a sanity check and returns an
error if an invalid size is detected.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 33a6a1281410..ddfd7e01a3ef 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2436,6 +2436,16 @@ static int parse_audio_mixer_unit(struct mixer_build *state, int unitid,
 	num_outs = err;
 	input_pins = desc->bNrInPins;
 
+	if (state->mixer->protocol == UAC_VERSION_2 ||
+	    state->mixer->protocol == UAC_VERSION_3) {
+		if (input_pins * num_outs > 256) {
+			usb_audio_err(state->chip,
+				      "invalid channels for MIXER UNIT %d: input=%d, output=%d\n",
+				      unitid, input_pins, num_outs);
+			return -EINVAL;
+		}
+	}
+
 	num_ins = 0;
 	ich = 0;
 	for (pin = 0; pin < input_pins; pin++) {
-- 
2.55.0


--Multipart_Thu_Sep_17_16:49:35_2026-1
Content-Type: application/octet-stream; type=patch; name="0002-ALSA-usb-audio-Fix-UAC2-mixer-unit-request-handling.patch"
Content-Disposition: attachment; filename="0002-ALSA-usb-audio-Fix-UAC2-mixer-unit-request-handling.patch"
Content-Transfer-Encoding: 7bit

From be27b714aaa57aa5f07a0c5ebcfc63743231b984 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 17 Sep 2026 09:49:19 +0200
Subject: [PATCH 2/3] ALSA: usb-audio: Fix UAC2 mixer unit request handling

For a request for a Mixer Unit on UAC2 (also UAC3), the wValue is
different from UAC1 and an incompatible value must be passed.
Namely, UAC1 takes a word consisting of 1-based input channel in the
high byte and 1-based output channel in the low byte.
Meanwhile, UAC2/3 takes UAC2_MU_MIXER in the high byte and a MCN
(0-based bit position of input/output channels) in the low byte.
The current driver implementation blindly assumes the UAC1 way, hence
it would cause a firmware error.

This patch attempts to implement the conversion to UAC2 MCN at
get_ctl_value_v2() and snd_usb_mixer_set_ctl_value() for mixer units.
At the points above, the old wValue containing ICN and OCN is
converted to the corresponding MCN, and it's used as the proper
wValue.

Reported-by: Zipdox <zipdox@zipdox.net>
Closes: https://lore.kernel.org/d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net
Fixes: 23caaf19b11e ("ALSA: usb-mixer: Add support for Audio Class v2.0")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 22 ++++++++++++++++++++++
 sound/usb/mixer.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index ddfd7e01a3ef..54a512fb5fa8 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -335,6 +335,16 @@ static int get_ctl_value_v1(struct usb_mixer_elem_info *cval, int request,
 	return -EINVAL;
 }
 
+/* convert the given UAC1 wValue (ICN|OCN) to UAC2 MCN */
+static unsigned int to_mcn(const struct usb_mixer_elem_info *cval,
+			   unsigned int validx)
+{
+	unsigned char m = (validx >> 8) & 0xff; /* 1-based input channel */
+	unsigned char v = validx & 0xff; /* 1-based output channel */
+
+	return (m - 1) * cval->num_outputs + (v - 1);
+}
+
 static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 			    int validx, int *value_ret)
 {
@@ -347,6 +357,10 @@ static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 
 	val_size = uac2_ctl_value_size(cval->val_type);
 
+	/* correct wValue for UAC2 mixer control with MCN */
+	if (cval->v2_mixer)
+		validx = (UAC2_MU_MIXER << 8) | to_mcn(cval, validx);
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
+			validx = (UAC2_MU_MIXER << 8) | to_mcn(cval, validx);
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
 
-- 
2.55.0


--Multipart_Thu_Sep_17_16:49:35_2026-1
Content-Type: application/octet-stream; type=patch; name="0003-ALSA-usb-audio-Optimize-min-max-res-parse-for-UAC2.patch"
Content-Disposition: attachment; filename="0003-ALSA-usb-audio-Optimize-min-max-res-parse-for-UAC2.patch"
Content-Transfer-Encoding: 7bit

From 0f8d881464f94d46687854251056156e492fe35e Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 17 Sep 2026 11:20:30 +0200
Subject: [PATCH 3/3] ALSA: usb-audio: Optimize min/max/res parse for UAC2

UAC2 feature and mixer units provide the mixer information about
minimum and max channels as well as the resolution in a single
UAC2_CS_RANGE request, but the current code tries to extract each of
them in an old way of UAC1.

This patch refactors the code to optimize the range info extraction
for UAC2.  Now the code for obtaining min/max/res info is done in
get_ctl_range() function.  For UAC1, this will call UAC_GET_MIN,
UAC_GET_MAX and UAC_GET_RES requests, while it calls a single
UAC2_CS_RANGE for UAC2/3.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 209 ++++++++++++++++++++++++++--------------------
 1 file changed, 117 insertions(+), 92 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 54a512fb5fa8..6af51c50a542 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -304,8 +304,9 @@ static inline int mixer_ctrl_intf(struct usb_mixer_interface *mixer)
 	return get_iface_desc(mixer->hostif)->bInterfaceNumber;
 }
 
-static int get_ctl_value_v1(struct usb_mixer_elem_info *cval, int request,
-			    int validx, int *value_ret)
+/* send a request for UAC1 feature & mixer unit */
+static int request_ctl_v1(struct usb_mixer_elem_info *cval, u8 request,
+			  int validx, int *value_ret)
 {
 	struct snd_usb_audio *chip = cval->head.mixer->chip;
 	unsigned char buf[2];
@@ -345,98 +346,72 @@ static unsigned int to_mcn(const struct usb_mixer_elem_info *cval,
 	return (m - 1) * cval->num_outputs + (v - 1);
 }
 
-static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
-			    int validx, int *value_ret)
+/* send a request for UAC2 feature & mixer unit */
+static int request_ctl_v2(struct usb_mixer_elem_info *cval, u8 request,
+			  int validx, unsigned char *buf, int size)
 {
 	struct snd_usb_audio *chip = cval->head.mixer->chip;
-	/* enough space for one range */
-	unsigned char buf[sizeof(__u16) + 3 * sizeof(__u32)];
-	unsigned char *val;
-	int idx = 0, ret, val_size, size;
-	__u8 bRequest;
+	int idx, ret;
 
-	val_size = uac2_ctl_value_size(cval->val_type);
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err)
+		return -EIO;
 
 	/* correct wValue for UAC2 mixer control with MCN */
 	if (cval->v2_mixer)
 		validx = (UAC2_MU_MIXER << 8) | to_mcn(cval, validx);
 
-	if (request == UAC_GET_CUR) {
-		bRequest = UAC2_CS_CUR;
-		size = val_size;
-	} else {
-		bRequest = UAC2_CS_RANGE;
-		size = sizeof(__u16) + 3 * val_size;
-	}
-
-	memset(buf, 0, sizeof(buf));
-
-	{
-		CLASS(snd_usb_lock, pm)(chip);
-		if (pm.err)
-			return -EIO;
-
-		idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
-		ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), bRequest,
-				      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
-				      validx, idx, buf, size);
-	}
-
-	if (ret < 0) {
+	memset(buf, 0, size);
+	idx = mixer_ctrl_intf(cval->head.mixer) | (cval->head.id << 8);
+	ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0),
+			      request,
+			      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
+			      validx, idx, buf, size);
+	if (ret < 0)
 		usb_audio_dbg(chip,
 			"cannot get ctl value: req = %#x, wValue = %#x, wIndex = %#x, type = %d\n",
 			request, validx, idx, cval->val_type);
+
+	return ret;
+}
+
+/* read the current value for UAC2 */
+static int get_ctl_value_v2(struct usb_mixer_elem_info *cval,
+			    int validx, int *value_ret)
+{
+	/* enough space for one value */
+	unsigned char buf[sizeof(__u32)];
+	int ret, val_size;
+
+	val_size = uac2_ctl_value_size(cval->val_type);
+
+	ret = request_ctl_v2(cval, UAC2_CS_CUR, validx, buf, val_size);
+	if (ret < 0)
 		return ret;
-	}
-
-	/* FIXME: how should we handle multiple triplets here? */
-
-	switch (request) {
-	case UAC_GET_CUR:
-		val = buf;
-		break;
-	case UAC_GET_MIN:
-		val = buf + sizeof(__u16);
-		break;
-	case UAC_GET_MAX:
-		val = buf + sizeof(__u16) + val_size;
-		break;
-	case UAC_GET_RES:
-		val = buf + sizeof(__u16) + val_size * 2;
-		break;
-	default:
-		return -EINVAL;
-	}
 
 	*value_ret = convert_signed_value(cval,
-					  snd_usb_combine_bytes(val, val_size));
-
+					  snd_usb_combine_bytes(buf, val_size));
 	return 0;
 }
 
-static int get_ctl_value(struct usb_mixer_elem_info *cval, int request,
-			 int validx, int *value_ret)
+/* read the current value */
+static int get_cur_ctl_value(struct usb_mixer_elem_info *cval,
+			     int validx, int *value_ret)
 {
 	validx += cval->idx_off;
 
 	return (cval->head.mixer->protocol == UAC_VERSION_1) ?
-		get_ctl_value_v1(cval, request, validx, value_ret) :
-		get_ctl_value_v2(cval, request, validx, value_ret);
-}
-
-static int get_cur_ctl_value(struct usb_mixer_elem_info *cval,
-			     int validx, int *value)
-{
-	return get_ctl_value(cval, UAC_GET_CUR, validx, value);
+		request_ctl_v1(cval, UAC_GET_CUR, validx, value_ret) :
+		get_ctl_value_v2(cval, validx, value_ret);
 }
 
 /* channel = 0: master, 1 = first channel */
 static inline int get_cur_mix_raw(struct usb_mixer_elem_info *cval,
 				  int channel, int *value)
 {
-	return get_ctl_value(cval, UAC_GET_CUR,
-			     (cval->control << 8) | channel,
-			     value);
+	return get_cur_ctl_value(cval,
+				 (cval->control << 8) | channel,
+				 value);
 }
 
 int snd_usb_get_cur_mix_value(struct usb_mixer_elem_info *cval,
@@ -466,6 +441,77 @@ int snd_usb_get_cur_mix_value(struct usb_mixer_elem_info *cval,
 	return 0;
 }
 
+/* extract the mixer min/max/res info from UAC1 feature / mixer unit */
+static int get_ctl_range_v1(struct usb_mixer_elem_info *cval, int validx)
+{
+	int last_valid_res = cval->res;
+
+	if (request_ctl_v1(cval, UAC_GET_MAX, validx, &cval->max) < 0 ||
+	    request_ctl_v1(cval, UAC_GET_MIN, validx, &cval->min) < 0) {
+		usb_audio_err(cval->head.mixer->chip,
+			      "%d:%d: cannot get min/max values for control %d (id %d)\n",
+			      cval->head.id, mixer_ctrl_intf(cval->head.mixer),
+			      cval->control, cval->head.id);
+		return -EAGAIN;
+	}
+
+	if (request_ctl_v1(cval, UAC_GET_RES, validx, &cval->res) < 0) {
+		cval->res = 1;
+		return 0;
+	}
+
+	last_valid_res = cval->res;
+	while (cval->res > 1) {
+		if (snd_usb_mixer_set_ctl_value(cval, UAC_SET_RES,
+						validx, cval->res / 2) < 0)
+			break;
+		cval->res /= 2;
+	}
+	if (request_ctl_v1(cval, UAC_GET_RES, validx, &cval->res) < 0)
+		cval->res = last_valid_res;
+
+	return 0;
+}
+
+/* extract the mixer min/max/res info from UAC2 feature / mixer unit */
+static int get_ctl_range_v2(struct usb_mixer_elem_info *cval, int validx)
+{
+	/* enough space for one range */
+	unsigned char buf[sizeof(__u16) + 3 * sizeof(__u32)];
+	unsigned char *val;
+	int ret, val_size, size;
+
+	val_size = uac2_ctl_value_size(cval->val_type);
+	size = sizeof(__u16) + 3 * val_size;
+
+	ret = request_ctl_v2(cval, UAC2_CS_RANGE, validx, buf, size);
+	if (ret < 0)
+		return ret;
+
+	/* FIXME: how should we handle multiple triplets here? */
+	val = buf + 2;
+	cval->min = convert_signed_value(cval, snd_usb_combine_bytes(val, val_size));
+	val += val_size;
+	cval->max = convert_signed_value(cval, snd_usb_combine_bytes(val, val_size));
+	val += val_size;
+	cval->res = convert_signed_value(cval, snd_usb_combine_bytes(val, val_size));
+	return 0;
+}
+
+/* extract the mixer min/max/res info */
+static int get_ctl_range(struct usb_mixer_elem_info *cval, int validx)
+{
+	switch (cval->head.mixer->protocol) {
+	case UAC_VERSION_1:
+		return get_ctl_range_v1(cval, validx);
+	case UAC_VERSION_2:
+	case UAC_VERSION_3:
+		return get_ctl_range_v2(cval, validx);
+	default:
+		return -EINVAL;
+	}
+}
+
 /*
  * set a mixer value
  */
@@ -1362,32 +1408,11 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 					break;
 				}
 		}
-		if (get_ctl_value(cval, UAC_GET_MAX, (cval->control << 8) | minchn, &cval->max) < 0 ||
-		    get_ctl_value(cval, UAC_GET_MIN, (cval->control << 8) | minchn, &cval->min) < 0) {
-			usb_audio_err(cval->head.mixer->chip,
-				      "%d:%d: cannot get min/max values for control %d (id %d)\n",
-				   cval->head.id, mixer_ctrl_intf(cval->head.mixer),
-							       cval->control, cval->head.id);
-			return -EAGAIN;
-		}
-		if (get_ctl_value(cval, UAC_GET_RES,
-				  (cval->control << 8) | minchn,
-				  &cval->res) < 0) {
-			cval->res = 1;
-		} else if (cval->head.mixer->protocol == UAC_VERSION_1) {
-			int last_valid_res = cval->res;
 
-			while (cval->res > 1) {
-				if (snd_usb_mixer_set_ctl_value(cval, UAC_SET_RES,
-								(cval->control << 8) | minchn,
-								cval->res / 2) < 0)
-					break;
-				cval->res /= 2;
-			}
-			if (get_ctl_value(cval, UAC_GET_RES,
-					  (cval->control << 8) | minchn, &cval->res) < 0)
-				cval->res = last_valid_res;
-		}
+		ret = get_ctl_range(cval, (cval->control << 8) | minchn);
+		if (ret < 0)
+			return ret;
+
 		if (cval->res == 0)
 			cval->res = 1;
 
-- 
2.55.0


--Multipart_Thu_Sep_17_16:49:35_2026-1--
