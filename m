Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED735208A1;
	Tue, 29 Sep 2026 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684177; cv=none; b=QwPUFWiYHFIs5bZgizH2COwl79luaTJIUHHwjPWnzAySElsrbFgTzmU2gJqi5MQgM9JR0zVRAa32q9KRm7VOcPNoZYZx9m0nPH2PD8RMBOnjHBNloorrQbd+v51fBKkL/fBwxE2ek3ZNWxpKqTzdxxoSoV82cNuOpRUioI798Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684177; c=relaxed/simple;
	bh=tY4J0Ey7+TPXw2cH4YtyXOQXQze1U27viyVBK4P24n0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLLw0q6bcKpvKJ0vNG0r7iKRa53Weo0aleuyUojtLzXVPzZoUZkKjPYn8Cvxcfh9reoSmzZcEKv3bcXEh3lbkTz2WTxOFYl+H57LP8s6bBLp6tMp/OoLB4nP3Zq/4jABQ/tPsqf+zQOUWRPcjv7EXB1dD2zN/JuGu93NZXhE6N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nMImMK7J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KeG4iyjI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XRacwU7z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pS3ot40F; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nMImMK7J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KeG4iyjI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XRacwU7z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pS3ot40F"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DB75A1F395;
	Tue, 29 Sep 2026 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790684169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/scy5WqnCE7daGrwm7C0W1DGudEqLdBkXokgIALEBo=;
	b=nMImMK7JOqOFsRWSot/9CldJnRiHHiTgwY0UOFEXnFa+JXnd+MlDQIf6zCIqyG600Gtd1f
	7gEjy6wLyJOU/oNEV62GSTJbAcG/im7CSmrJSd/4oWtWVe0HavPLdcUrYi33Y5OqKagVAs
	e/IhzmQI4YQjJRFMI8pIMUSxHIk27w4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790684169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/scy5WqnCE7daGrwm7C0W1DGudEqLdBkXokgIALEBo=;
	b=KeG4iyjIO1qO7ZHgV6I7DDd4ihRKbjCiFgBXrcw2sTg/G18NeYX6/mgQu8+MnBiv2oOoYj
	hPQdTbWZcuo6LEDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790684164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/scy5WqnCE7daGrwm7C0W1DGudEqLdBkXokgIALEBo=;
	b=XRacwU7zfk61fWM2zuadLMfwqWp1YokZrVXl7vM7jjWBuN0v3/WriVTLbb77h3x+owi7Fn
	5ai/hXAKeO3P7kuW8RffAszgbx/OHWQFim8zJHvU5lz8K6NzegabbfxIRPp/BLWOYQf3iB
	5kCnElt95bDEW/CPvwtx0XjYALmChEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790684164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/scy5WqnCE7daGrwm7C0W1DGudEqLdBkXokgIALEBo=;
	b=pS3ot40FN5Emg1XWnprbln/To+cO6U7PhpLvJPVae45ArKzr4N9V0W8Q4+Ja2sxzJgF6S1
	xyPF/PeecfIHsXDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7CA62136F7;
	Tue, 29 Sep 2026 12:16:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DPV9DQSsu2r/SgAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 12:16:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Zipdox <zipdox@zipdox.net>
Subject: [PATCH 2/3] ALSA: usb-audio: Fix UAC2 mixer unit request handling
Date: Tue, 29 Sep 2026 14:15:55 +0200
Message-ID: <20260929121558.1464094-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929121558.1464094-1-tiwai@suse.de>
References: <20260929121558.1464094-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.78 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.18)[-0.886];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email,zipdox.net:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.78
X-Spam-Level: 
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

