Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903E54734EC;
	Wed,  7 Oct 2026 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365825; cv=none; b=j33azihq8k0SLM0slDipZsrEEDfFiAndeB2Cj0xNkAvZK7ORxfx5UCYifcLRSG8tzEizfn9VV9FIlBLX+2VnEqtzEVXqF/mpotQGv6SOs92Ao7q9utCJDkcmOobKu2LRmyMCW2bWcGCYdBV7gA5l1y6K9z32u5cImurypE4tL60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365825; c=relaxed/simple;
	bh=Do+emCh9hItpveV8/Pw1RFgPEvpQ4/St7dLe0Ga/UcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YvFx6FW2cWJyYsXAmft52GYrZ5V8Qoh/bVbPHKOVMz4tcIVJBu0Q6zJD74GK5Z7G9+1tDjZ1g8PQg9YNfZKF0eEsTfggPX5oFKSjCX23g+FD3SaFySmjd1CCj8KyNy2WJT56gBMhCCQA7bTMbbcW/U9GE/i/10rbQ7JyTuPX5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S2iK++VE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i7EZ35he; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S2iK++VE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i7EZ35he; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S2iK++VE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i7EZ35he";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S2iK++VE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i7EZ35he"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D1E171F88F;
	Wed,  7 Oct 2026 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791365801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdkgM/x7eZRE40IzVcedyVGO6vtWAaHAu88e1afIeTY=;
	b=S2iK++VEahKf8yjKSuJqBZu7TQ/WAdXOXeeoyOLRYPnUZArJAw+xGjYPjUmhyy9Esd40p2
	jnY3EQ+1ybfr94K1ZwT2mQ7cwfpxkSiErTX15CG3kGffxK1/rwg4z/4C3kgQAkGjoD4RXy
	Q3Bl9zArGN2/JykIm079oiEw0poYacc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791365801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdkgM/x7eZRE40IzVcedyVGO6vtWAaHAu88e1afIeTY=;
	b=i7EZ35heKIwlOjugDsxmx1KEkcSnQdYvnmKrOojg0rW0gmfau8bFkVDl0wHmf9fwArZ2tH
	/RkOPQOSudXJVGAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=S2iK++VE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=i7EZ35he
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791365801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdkgM/x7eZRE40IzVcedyVGO6vtWAaHAu88e1afIeTY=;
	b=S2iK++VEahKf8yjKSuJqBZu7TQ/WAdXOXeeoyOLRYPnUZArJAw+xGjYPjUmhyy9Esd40p2
	jnY3EQ+1ybfr94K1ZwT2mQ7cwfpxkSiErTX15CG3kGffxK1/rwg4z/4C3kgQAkGjoD4RXy
	Q3Bl9zArGN2/JykIm079oiEw0poYacc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791365801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdkgM/x7eZRE40IzVcedyVGO6vtWAaHAu88e1afIeTY=;
	b=i7EZ35heKIwlOjugDsxmx1KEkcSnQdYvnmKrOojg0rW0gmfau8bFkVDl0wHmf9fwArZ2tH
	/RkOPQOSudXJVGAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D49213312;
	Wed,  7 Oct 2026 09:36:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9oTPLKgSxmpMDgAAD6G6ig:T5
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 09:36:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] ALSA: usb-audio: Fix invalid UAC2/3 mixer unit matrix evaluation
Date: Wed,  7 Oct 2026 11:36:31 +0200
Message-ID: <20261007093638.1049688-5-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007093638.1049688-1-tiwai@suse.de>
References: <20261007093638.1049688-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D1E171F88F
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RBL_NIXSPAM_FAIL(0.00)[2a07:de40:b281:104:10:150:64:97:server fail];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 

The bitmap matrix in the mixer unit descriptor for UAC2 and UAC3 has
rather the size of input-pins x output-pins, while the current
USB-audio driver code wrongly assumes the UAC1 bitmap matrix size,
which is input-channels x output-pins.  That is, when input pins have
multiple channels, the column size differs and it leads to the
accesses at a wrong position.

This patch corrects the access of the bitmap matrix for UAC2/UAC3.
For making the code cleaner, split the parser to UAC1 and UAC2/3, too.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 23caaf19b11e ("ALSA: usb-mixer: Add support for Audio Class v2.0")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 112 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 78 insertions(+), 34 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index b6e22244e03a..9d8007ea95d5 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2377,7 +2377,7 @@ static bool mixer_bitmap_overflow(struct uac_mixer_unit_descriptor *desc,
  */
 static void build_mixer_unit_ctl(struct mixer_build *state,
 				 struct uac_mixer_unit_descriptor *desc,
-				 int in_pin, int in_ch, int num_outs,
+				 int in_ch, int num_outs,
 				 int unitid, struct usb_audio_term *iterm)
 {
 	struct usb_mixer_elem_info *cval;
@@ -2472,34 +2472,13 @@ static int parse_audio_input_terminal(struct mixer_build *state, int unitid,
 /*
  * parse a mixer unit
  */
-static int parse_audio_mixer_unit(struct mixer_build *state, int unitid,
-				  void *raw_desc)
+/* UAC1 mixer unit */
+static int parse_audio_mixer_unit_v1(struct mixer_build *state, int unitid,
+				     int input_pins, int num_outs,
+				     struct uac_mixer_unit_descriptor *desc)
 {
-	struct uac_mixer_unit_descriptor *desc = raw_desc;
 	struct usb_audio_term iterm;
-	int input_pins, num_ins, num_outs;
-	int pin, ich, err;
-
-	err = uac_mixer_unit_get_channels(state, desc);
-	if (err < 0) {
-		usb_audio_err(state->chip,
-			      "invalid MIXER UNIT descriptor %d\n",
-			      unitid);
-		return err;
-	}
-
-	num_outs = err;
-	input_pins = desc->bNrInPins;
-
-	if (state->mixer->protocol == UAC_VERSION_2 ||
-	    state->mixer->protocol == UAC_VERSION_3) {
-		if (input_pins * num_outs > 256) {
-			usb_audio_err(state->chip,
-				      "invalid channels for MIXER UNIT %d: input=%d, output=%d\n",
-				      unitid, input_pins, num_outs);
-			return -EINVAL;
-		}
-	}
+	int num_ins, pin, ich, och, err;
 
 	num_ins = 0;
 	ich = 0;
@@ -2518,25 +2497,90 @@ static int parse_audio_mixer_unit(struct mixer_build *state, int unitid,
 					  num_ins, num_outs))
 			break;
 		for (; ich < num_ins; ich++) {
-			int och, ich_has_controls = 0;
-
 			for (och = 0; och < num_outs; och++) {
 				__u8 *c = uac_mixer_unit_bmControls(desc,
 						state->mixer->protocol);
 
-				if (check_matrix_bitmap(c, ich, och, num_outs)) {
-					ich_has_controls = 1;
+				if (check_matrix_bitmap(c, ich, och, num_outs))
 					break;
-				}
 			}
-			if (ich_has_controls)
-				build_mixer_unit_ctl(state, desc, pin, ich, num_outs,
+			if (och < num_outs)
+				build_mixer_unit_ctl(state, desc, ich, num_outs,
 						     unitid, &iterm);
 		}
 	}
 	return 0;
 }
 
+/* UAC2/UAC3 mixer unit */
+static int parse_audio_mixer_unit_v2(struct mixer_build *state, int unitid,
+				     int input_pins, int num_outs,
+				     struct uac_mixer_unit_descriptor *desc)
+{
+	struct usb_audio_term iterm;
+	int pin, och, err;
+
+	if (input_pins * num_outs > 256 ||
+	    mixer_bitmap_overflow(desc, state->mixer->protocol,
+				  input_pins, num_outs)) {
+		usb_audio_err(state->chip,
+			      "invalid channels for MIXER UNIT %d: input=%d, output=%d\n",
+			      unitid, input_pins, num_outs);
+		return -EINVAL;
+	}
+
+	for (pin = 0; pin < input_pins; pin++) {
+		err = parse_audio_unit(state, desc->baSourceID[pin]);
+		if (err < 0)
+			continue;
+		if (!num_outs)
+			continue;
+		err = check_input_term(state, desc->baSourceID[pin], &iterm);
+		if (err < 0)
+			return err;
+
+		for (och = 0; och < num_outs; och++) {
+			__u8 *c = uac_mixer_unit_bmControls(desc,
+						state->mixer->protocol);
+
+			if (check_matrix_bitmap(c, pin, och, num_outs))
+				break;
+		}
+		if (och < num_outs)
+			build_mixer_unit_ctl(state, desc, pin, num_outs,
+					     unitid, &iterm);
+	}
+	return 0;
+}
+
+static int parse_audio_mixer_unit(struct mixer_build *state, int unitid,
+				  void *raw_desc)
+{
+	struct uac_mixer_unit_descriptor *desc = raw_desc;
+	int num_outs;
+
+	num_outs = uac_mixer_unit_get_channels(state, desc);
+	if (num_outs < 0) {
+		usb_audio_err(state->chip,
+			      "invalid MIXER UNIT descriptor %d\n",
+			      unitid);
+		return num_outs;
+	}
+
+	switch (state->mixer->protocol) {
+	case UAC_VERSION_1:
+	default:
+		return parse_audio_mixer_unit_v1(state, unitid,
+						 desc->bNrInPins, num_outs,
+						 desc);
+	case UAC_VERSION_2:
+	case UAC_VERSION_3:
+		return parse_audio_mixer_unit_v2(state, unitid,
+						 desc->bNrInPins, num_outs,
+						 desc);
+	}
+}
+
 /*
  * Processing Unit / Extension Unit
  */
-- 
2.55.0

