Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DAE4DE720;
	Wed, 30 Sep 2026 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783654; cv=none; b=RZMuOqZgZolbu8qfODxboQN+l4zcKoDOa0vp5sjhSDJ0ff6NtER3a6NfVzW+K3RStS1ksfdgqwn6XFouQDFrq/cscjQgmRJV9RyPjT+/wqdNASl5onBYEfd1PwtEGZOosN7zZ145API5MIZxvHlVHyxchBjGdW+QmQ1sHZSLWoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783654; c=relaxed/simple;
	bh=1/k0x5cpkJMUVybAzZM4lnbAMqrNVA+CNYLY+yfQnIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+Y5dAfUbFx3Qyns2v+G2xAS0CEi9f+JkLaWIImymvlwGad31tAJ1cIRFKWSJOQwERb326VSh8gReOlIdwD+l4UgwJ5XY7ExhCYw0gtJIk2XOQlFVwiaFxmUsIXYr/V/38YoRIykl2LZC3Nosl/68fGBjDqDIElI+Q21Yd957fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N+Fz4NoG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lx/CTRpk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qBahxU7v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IlRTp0ot; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N+Fz4NoG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lx/CTRpk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qBahxU7v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IlRTp0ot"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5A3D421D29;
	Wed, 30 Sep 2026 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790783643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkzZAg5UfSTraz0J+k+JIISwrKK4kPddHTzyjfH1i1s=;
	b=N+Fz4NoGd26o+UoYA9oE5zYTFkZF1E/Mu9cWbrlfMa8vKO/hW2W06/0/nqiBwi99Fe4JoK
	w7wBiwkxyaBHPxIxa51BvY0zQGdBtLfl/1ngj10IiiySs1NTb8RZ6+Fg9OUfsyJI8AzjHP
	ls/1MQFvBK2xA/IqbzD1Ics/WSLFjDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790783643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkzZAg5UfSTraz0J+k+JIISwrKK4kPddHTzyjfH1i1s=;
	b=Lx/CTRpk0D2/42XuhzocvFr2Gs8uf4kJlwqBVyinOUVCgnukYI2yuybjYprNB7CsD79cyC
	kIALJ1zqAbydsADQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qBahxU7v;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IlRTp0ot
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790783639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkzZAg5UfSTraz0J+k+JIISwrKK4kPddHTzyjfH1i1s=;
	b=qBahxU7vR2vg8w2Gk6Eod19u7vHsda7gZrzqjTZm9jgpIPclLDSC9IcPkDB3Og9jfkOGf6
	KP3f4Mq/iCAzchiUpiWC47W/uQMrCsu50pU2ysWFslIp1bNeOeTN32Hpg0emiUIov9DRWa
	K5iU34VzzxQNxU0e6JBcqX/KOHbx5gs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790783639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkzZAg5UfSTraz0J+k+JIISwrKK4kPddHTzyjfH1i1s=;
	b=IlRTp0otiY6Ue/n5caciD6iq2Q5acEqSjcheW3hSm/dqP20JDqleBkdog262lufGcw6TmB
	1awkR0z4bqIynPAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CEB4013ADC;
	Wed, 30 Sep 2026 15:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C85QFZYwvWqkVAAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Wed, 30 Sep 2026 15:53:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] ALSA: usb-audio: Fix UAC2 mixer unit request handling
Date: Wed, 30 Sep 2026 17:53:51 +0200
Message-ID: <20260930155356.348608-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930155356.348608-1-tiwai@suse.de>
References: <20260930155356.348608-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5A3D421D29
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

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
v2->v3: no change

 sound/usb/mixer.c | 23 +++++++++++++++++++++++
 sound/usb/mixer.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index ddfd7e01a3ef..a8bdd1696a20 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -335,6 +335,17 @@ static int get_ctl_value_v1(struct usb_mixer_elem_info *cval, int request,
 	return -EINVAL;
 }
 
+/* convert the given UAC1 wValue (ICN|OCN) to UAC2 MCN */
+static unsigned char to_mcn(const struct usb_mixer_elem_info *cval,
+			    unsigned int validx)
+{
+	unsigned char m = (validx >> 8) & 0xff; /* 1-based input channel */
+	unsigned char v = validx & 0xff; /* 1-based output channel */
+
+	/* num_inputs * num_outputs is guaranteed to be < 256 */
+	return (m - 1) * cval->num_outputs + (v - 1);
+}
+
 static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 			    int validx, int *value_ret)
 {
@@ -347,6 +358,10 @@ static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 
 	val_size = uac2_ctl_value_size(cval->val_type);
 
+	/* correct wValue for UAC2 mixer control with MCN */
+	if (cval->v2_mixer)
+		validx = (UAC2_MU_MIXER << 8) | to_mcn(cval, validx);
+
 	if (request == UAC_GET_CUR) {
 		bRequest = UAC2_CS_CUR;
 		size = val_size;
@@ -478,6 +493,10 @@ int snd_usb_mixer_set_ctl_value(struct usb_mixer_elem_info *cval,
 		}
 
 		request = UAC2_CS_CUR;
+
+		/* correct wValue for UAC2 mixer control with MCN */
+		if (cval->v2_mixer)
+			validx = (UAC2_MU_MIXER << 8) | to_mcn(cval, validx);
 	}
 
 	value_set = convert_bytes_value(cval, value_set);
@@ -2345,6 +2364,10 @@ static void build_mixer_unit_ctl(struct mixer_build *state,
 
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

