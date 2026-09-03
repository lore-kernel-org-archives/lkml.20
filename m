Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D894252B7;
	Thu,  3 Sep 2026 10:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431864; cv=none; b=oqSCxWw5+p/Ic9JmX5gVtNl4HdxWJtdgvn688pXuZW+RC2dg7Ce83N4VBod76TQh9Wc8xPFAhMsLFGZCMnhsoWbmAp68a9MCvPfcZj7kjT+aW2i0i492XC9tmEGYlU82i2jTpjsBaAt75taabqf5XomE1rl+5CaLFFGYzw4liQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431864; c=relaxed/simple;
	bh=d7pVmoh4YAVPlHeGt9lkzdIdTs7rddl+iz7P8UwCtWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lOpI7fEYOVvvkJgGs4rv/jsRRMNMfxYMZ0g71e3HecNF0+d+keYrojHmo5FvQHa/MWa59vD+xdPZYNsTdBDRUpHvLkZ/nxAIgy1+DKH9uEtI6y8g3PZv2Hcno6ZdbM8uMGJocP0HAMkICbehRM8na02N6OEmGqGs2Y0RfPUziYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q0zahILi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6nUSHeYZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FoHQyjQX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PaTd2lfB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q0zahILi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6nUSHeYZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FoHQyjQX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PaTd2lfB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 65F5E1FE06;
	Thu,  3 Sep 2026 10:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788431855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3spEMBBcb7A3nF2O+RZl1CapGCuu2ektNzK7I7TMk6g=;
	b=Q0zahILiMPfty9y1N4P6Z/BYHfewr0W8CccmQYYx1g3drADR7fJ3ryUor6is1u1Gq6eSva
	aJOKbRg+Zr3pKXd/SgThMO7JllNiC4iBbxuQy++/s2vBXkxMZxiTUVsjnDl/MlCCBlhFKz
	vLOFFYWV663PPKWnfAcpVIbQC2Nhl74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788431855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3spEMBBcb7A3nF2O+RZl1CapGCuu2ektNzK7I7TMk6g=;
	b=6nUSHeYZ4ApzKJJq7Yp9zlwE2VB0OF6HQX6NgS6wqoaKkg3MC9KAKrDYV8Sn3FYDFgiQYB
	CqWzSfRraBxZJBDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FoHQyjQX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PaTd2lfB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788431851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3spEMBBcb7A3nF2O+RZl1CapGCuu2ektNzK7I7TMk6g=;
	b=FoHQyjQXb0wZ+OETJrTueh2A+h78RTbB3M38fmJQpvUiamrPPdCwgwhoh/ZUmHDWz+jfX7
	d4WOs5c1MdchBXWXS6U8hD/fp+WWNSUkeYgI0sbpqM72pc3QFwu0yZxqEe6blSK7RNAmbs
	pcSD9w6dLGgxpFPoZuFdGfDjBwm8Dxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788431851;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3spEMBBcb7A3nF2O+RZl1CapGCuu2ektNzK7I7TMk6g=;
	b=PaTd2lfBd5N37Hrhi1nWMB+UCtOBB9ZWTsVU0u+EVX1/l/N4ansjOzuPvWyNO23VMtFfJ9
	2sCOTxd2c8df/sDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30DD4136D9;
	Thu,  3 Sep 2026 10:37:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QtVgCutNmWqiKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 10:37:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: rawmidi: Add a proper disconnect handling
Date: Thu,  3 Sep 2026 12:36:58 +0200
Message-ID: <20260903103728.1807281-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 65F5E1FE06
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

The rawmidi core detaches only exposed devices at disconnection, but
it doesn't deal with the pending bytes or gate the further unexpected
accesses, leaving naively to each driver dealing with such situations.

Let's try to restrict it in the core side for more safety: introduce
the disconnected flag to each substream, set it at disconnection call,
then trigger down &  cancel the pending event work.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/rawmidi.h |  1 +
 sound/core/rawmidi.c    | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 4154035af414..d812f70725bd 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -86,6 +86,7 @@ struct snd_rawmidi_substream {
 	bool opened;			/* open flag */
 	bool append;			/* append flag (merge more streams) */
 	bool active_sensing;		/* send active sensing when close */
+	bool disconnected;		/* already disconnected */
 	unsigned int framing;		/* whether to frame input data */
 	unsigned int clock_type;	/* clock source to use for input framing */
 	int use_count;			/* use counter (for output) */
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 2617bb5b4faf..a9f812bd9b56 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -208,14 +208,14 @@ static int snd_rawmidi_runtime_free(struct snd_rawmidi_substream *substream)
 
 static inline void snd_rawmidi_output_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	if (!substream->opened)
+	if (!substream->opened || substream->disconnected)
 		return;
 	substream->ops->trigger(substream, up);
 }
 
 static void snd_rawmidi_input_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	if (!substream->opened)
+	if (!substream->opened || substream->disconnected)
 		return;
 	substream->ops->trigger(substream, up);
 	if (!up)
@@ -254,7 +254,8 @@ int snd_rawmidi_drain_output(struct snd_rawmidi_substream *substream)
 
 	scoped_guard(spinlock_irq, &substream->lock) {
 		runtime = substream->runtime;
-		if (!substream->opened || !runtime || !runtime->buffer)
+		if (!substream->opened || !runtime || !runtime->buffer ||
+		    substream->disconnected)
 			return -EINVAL;
 		snd_rawmidi_buffer_ref(runtime);
 		runtime->drain = 1;
@@ -537,7 +538,7 @@ static void close_substream(struct snd_rawmidi *rmidi,
 	if (--substream->use_count)
 		return;
 
-	if (cleanup) {
+	if (cleanup && !substream->disconnected) {
 		if (substream->stream == SNDRV_RAWMIDI_STREAM_INPUT)
 			snd_rawmidi_input_trigger(substream, 0);
 		else {
@@ -2063,8 +2064,13 @@ static int snd_rawmidi_dev_disconnect(struct snd_device *device)
 		struct snd_rawmidi_substream *s;
 
 		list_for_each_entry(s, &rmidi->streams[dir].substreams, list) {
-			if (s->runtime)
+			scoped_guard(spinlock_irq, &s->lock)
+				s->disconnected = true;
+			if (s->runtime) {
+				s->ops->trigger(s, false);
+				cancel_work_sync(&s->runtime->event_work);
 				wake_up(&s->runtime->sleep);
+			}
 		}
 	}
 
-- 
2.55.0

