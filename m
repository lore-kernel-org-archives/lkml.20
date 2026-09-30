Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5793B8958;
	Wed, 30 Sep 2026 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774687; cv=none; b=VXu5Tsxk9mk8uUtzWQA1tUxzlPNYuNsCAfzY+1kv93PSe+D70csGsPyeRNL77FwbVkuRB6jjPfBOJ1FzW1oqQirS1zwjhdHaKGLmUSXUiEneW016dIJVrCFHQwFuXUaK6YUNckc8UkDAgfGnadp71iYRAD9/yOmYg+XWbTy7WA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774687; c=relaxed/simple;
	bh=EHHw3WZYMo437CUV36ha+eA2jPP5CcmhhsmGbIsOMyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSeFBd0e3L9Zcfx8DveBWNzYWd9z5xrblz9GLSaAhXUzQrfNgWNOAIWx6yLHOK4q4fTJ8/UT4qYepuwtZQPN+REbqSSFT62rrLBQ+FcVFLOvYZ3n07HBTER+AHXbkMsFgbQQabWdYGgOEBa28KZAS0LEeIefPxufmoAg7U+xzFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s36BRWSo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eGY0e+Pm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FvENBBIb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZbvVO0Nh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s36BRWSo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eGY0e+Pm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FvENBBIb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZbvVO0Nh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A3D9A21E5C;
	Wed, 30 Sep 2026 13:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790774670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQ7QVqru6oj0/ge5rg31/yW7S/braO0UjY+G2aI4aNA=;
	b=s36BRWSo8QHZR/WFRkrGJXDwsswlYJwZMtIzcC9/m3z1B5G5fMZ5A9vwbZmY9PHy5z9c+e
	C8vJOp2WumDk74D5SXyaFA9jlJBwinCPEZnvsiWrVMkJRBnq5xLOQ/UalFUpPC68PoFATP
	y2M/6pvSlIV7q762nG6Jz1tqVOSigXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790774670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQ7QVqru6oj0/ge5rg31/yW7S/braO0UjY+G2aI4aNA=;
	b=eGY0e+PmeWTdOpV2HGi0SkISFNIO4L3B3fGz6Zh3+Kjm3XU6UZJ/RfX9FEjK3v4b2SnKoB
	SSFwCA9g6Sug4dCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FvENBBIb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZbvVO0Nh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790774666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQ7QVqru6oj0/ge5rg31/yW7S/braO0UjY+G2aI4aNA=;
	b=FvENBBIbmYE22T6sJUbny/ZBQZRPohzpzkpgV8dWtReyPQjAYg2SOyqlEYn4las7ISgchR
	FlZprgPnztZYB9HIaRj1ihKR+TFu0+Di9UWLm5wHo6g9sdd34dC2kOoKIZAdaOH5X2vV6G
	DihXRIlRKSsaKQtOb4D2F2ruHRzmLms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790774666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQ7QVqru6oj0/ge5rg31/yW7S/braO0UjY+G2aI4aNA=;
	b=ZbvVO0NhYhODWdREU7h/5bUtJxx7DHkBHHNvTh9T23YBx0ogQRjuzGCkpqNfshV9erAWpr
	zqM07N5LZ1gljuBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AC6113AB9;
	Wed, 30 Sep 2026 13:24:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IluyAYoNvWr8MQAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Wed, 30 Sep 2026 13:24:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Zipdox <zipdox@zipdox.net>
Subject: [PATCH v2 1/3] ALSA: usb-audio: Check mixer matrix size for UAC2/3 at parsing
Date: Wed, 30 Sep 2026 15:24:04 +0200
Message-ID: <20260930132419.297102-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930132419.297102-1-tiwai@suse.de>
References: <20260930132419.297102-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A3D9A21E5C
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

The matrix of input/output channels specified in a UAC2/3 mixer unit
must fit to the upper limit 256.  Add a sanity check and returns an
error if an invalid size is detected.

Link: https://lore.kernel.org/d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net
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

