Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE1F50B8DA;
	Wed, 30 Sep 2026 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783655; cv=none; b=IsnfbqRdB9pQJMg66XZMOnI83SaqadvqTY5Dy2cjnkChkJXQ3SZgczTOdxaGQKAFCPbjdkjjZBciT7UL/rXbE1dJVNy0pu62eMO3H7WzQ5W8m6RQWT+Js7WPEsK/E0Ci38iT0u9tjy/5ZVPKXk9rbyqgF25fgjPUVw4c7AARdWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783655; c=relaxed/simple;
	bh=oJPoCnwvAdms4c4wGjRklcKFM8KnipFZ6y69DWczjjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KN9pBNl0UkNG/hacN2OG4Iwr1B5qkAA7omRsJpQMu1NjJ8GAV1R7Z+WWksJxO8PQUqEHb+AEGu8y3I3ubRUJYNUZll46YQRfZZckDtE2Lf8bTRgYs0BmCnDHbZlxUyPeuIhW1BdJ8vEoaqQuHOo8H5c+wBzjEKX2XCqeoex7VmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gnh66vej; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wT1ns3xU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AOqfkn64; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m7/z54Tt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gnh66vej";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wT1ns3xU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AOqfkn64";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m7/z54Tt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 29B6C1F891;
	Wed, 30 Sep 2026 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790783643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL1pGdir/e2bUyMMWjROopHnm6r+nUGfmfprPds6s70=;
	b=Gnh66vejuTKBsuv9stVSbF/hf+YAoTLMy98W6GcE+g1B1YzP5r1LyS5e3rtdMDC2O/RJZC
	2QlNE6nxHt1a6vD13AgipDBB0zqFWBAp1+8MvwYxSrB+Vf2TNcAngNI0BuqboROba3LAK9
	VF6Dzunp08nK+XZGuzabwBLQI8jC/Xc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790783643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL1pGdir/e2bUyMMWjROopHnm6r+nUGfmfprPds6s70=;
	b=wT1ns3xUtpWp0CcQbu0BwuSeWQFUPaLqUIv60+oYjxXaWL+E2RAdCRGcGmLyvgdzIGM/vA
	QkiBy+ibpF1JWUBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AOqfkn64;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="m7/z54Tt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790783639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL1pGdir/e2bUyMMWjROopHnm6r+nUGfmfprPds6s70=;
	b=AOqfkn64Mzv3DU7OTjRVyXHqt/P0zgOk0UpFXd1tbLN9/ytXwsWOvwt9FlGRFvGZAvbN52
	J99+TSHFGDVcdhYWGR1ZlTbGYRyVv9RMfJ5Lr0ZIA9cUX6Ay9W3/LBzWeJfg1tV+GYMjZ4
	dZxLcXlp0Izr8AL5NQ6MR3ES5TSxBbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790783639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL1pGdir/e2bUyMMWjROopHnm6r+nUGfmfprPds6s70=;
	b=m7/z54TtMpvntL/hArpsX5Bh0mFsaST+F3K2sSKR+fQrl/7ZWdc1x4MoZNdxK+0w5h52ks
	xlcKhjeJGvyyiPDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A967E13ADB;
	Wed, 30 Sep 2026 15:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C85QFZYwvWqkVAAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Wed, 30 Sep 2026 15:53:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] ALSA: usb-audio: Check mixer matrix size for UAC2/3 at parsing
Date: Wed, 30 Sep 2026 17:53:50 +0200
Message-ID: <20260930155356.348608-2-tiwai@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 29B6C1F891
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

The matrix of input/output channels specified in a UAC2/3 mixer unit
must fit to the upper limit 256.  Add a sanity check and returns an
error if an invalid size is detected.

Link: https://lore.kernel.org/d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v2->v3: no change

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

