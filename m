Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343104DDB31;
	Thu,  8 Oct 2026 19:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487576; cv=none; b=rOj8VAzwzxRJGq4uLTpM0U6BUvuKOV7C2Lp2bgXd6cHEr/oxUKuKR/KXx7Gh/mc4VDj5qRhiXYswydqNPMcshcf7xpWdfCoePbnh0c3Z0ha0AvUON6Ij5VQU4hneUbs04q3WGVIxkuzxec4ZsUGioOQI5R76s6DTuszixKqUfUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487576; c=relaxed/simple;
	bh=RMWYnDKb/bVrPjER558w+X4Mchwf8mUMjuca5dM5hoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwW5SMZ1tF24OSkWxzybhpGhlWZkFn8W9e4ZD50HIT8KQdA1djxuM2XE/bPKHf/nfzw8rCwJZd80CFfglMvraPAC+sfLpcn6qTtF1GM87Bc337yzZIiq3MwOzXIFUdpT94rLzVIuAFkAyeq41mtOPeckQVwFL+MhFHvFJK1OaM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 136E61F7BC;
	Thu,  8 Oct 2026 19:26:04 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D261B1339F;
	Thu,  8 Oct 2026 19:26:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dQZEOknux2ozCAAAD6G6ig:T12
	(envelope-from <tiwai@suse.de>); Thu, 08 Oct 2026 19:26:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] ALSA: line6: Fix handling of zero-length capture packets
Date: Thu,  8 Oct 2026 21:25:51 +0200
Message-ID: <20261008192553.300025-12-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008192553.300025-1-tiwai@suse.de>
References: <20261008192553.300025-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spam-Flag: NO
X-Spam-Score: 0.00
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Result: default: False [0.00 / 50.00]

The LINE6 playback engine assumes that line6pcm->prev_fsize=0
indicates that there was no input packet to be processed, and
synthesizes the frames.  But, when a capture stream receives a
zero-length (or a very small size) packet, it sets 0 to prev_fsize,
while playback engine still believes it's for synthesis, hence it
tries to copy the larger data than the actual input data.

As prev_fsize=0 can't be a good indication for "no input", change the
meaning slightly: now prev_fsize=-1 means no input, while prev_fsize=0
means it's a zero-length packet.

Fixes: 1027f476f507 ("staging: line6: sync with upstream")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/pcm.c      | 4 +++-
 sound/usb/line6/playback.c | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/usb/line6/pcm.c b/sound/usb/line6/pcm.c
index 998869dc4613..e2b99e7a08e0 100644
--- a/sound/usb/line6/pcm.c
+++ b/sound/usb/line6/pcm.c
@@ -217,7 +217,7 @@ static void line6_stream_stop(struct snd_line6_pcm *line6pcm, int direction,
 	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
 		guard(spinlock_irqsave)(&pstr->lock);
 		line6pcm->prev_fbuf = NULL;
-		line6pcm->prev_fsize = 0;
+		line6pcm->prev_fsize = -1;
 	}
 }
 
@@ -538,6 +538,8 @@ int line6_init_pcm(struct usb_line6 *line6,
 	line6pcm->volume_playback[0] = line6pcm->volume_playback[1] = 255;
 	line6pcm->volume_monitor = 255;
 	line6pcm->line6 = line6;
+	line6pcm->prev_fbuf = NULL;
+	line6pcm->prev_fsize = -1;
 
 	spin_lock_init(&line6pcm->out.lock);
 	spin_lock_init(&line6pcm->in.lock);
diff --git a/sound/usb/line6/playback.c b/sound/usb/line6/playback.c
index aa6ddf8746a0..6682ebaac646 100644
--- a/sound/usb/line6/playback.c
+++ b/sound/usb/line6/playback.c
@@ -171,7 +171,7 @@ static int submit_audio_out_urb(struct snd_line6_pcm *line6pcm)
 		    &urb_out->iso_frame_desc[i];
 
 		fsize = line6pcm->prev_fsize;
-		if (fsize == 0) {
+		if (fsize == -1) {
 			int n;
 
 			line6pcm->out.count += frame_increment;
@@ -271,7 +271,7 @@ static int submit_audio_out_urb(struct snd_line6_pcm *line6pcm)
 						   bytes_per_frame);
 		}
 		line6pcm->prev_fbuf = NULL;
-		line6pcm->prev_fsize = 0;
+		line6pcm->prev_fsize = -1;
 	}
 	spin_unlock(&line6pcm->in.lock);
 
-- 
2.55.0

