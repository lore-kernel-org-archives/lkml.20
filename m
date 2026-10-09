Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A1C4DEC3D;
	Fri,  9 Oct 2026 13:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552826; cv=none; b=LkefoOQjRcsJUkFAfzLCbolA8mPk4fjLuCReOqtuW13U/d5RhYOLrfk1seaBp/B3jY0kV55ko77MHk5nnqyvBn14NSt9e6pnCiv0G6en1Yj6AkCr/zACxeJJhNTgJ3UCFenZbK8HkuAEwqfhL6j4SKNQEm/Nz11oFfw6P7tHY1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552826; c=relaxed/simple;
	bh=Wih8F3V2xTrfK1VGcTuTeEeLuLjBfFXwKhc3EXmeWN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXR9+h0s1f5jXI/rTB7unsyfsRv1N9x3mIoFg4FG/zlyEK/TosdpCUJc7PmRWT4QVFoAhB7UgXuRUl/542S5GqsAT/PSYRHVDLkdj3AmlNBkp5m2iRafmxJLRBNA3tpyF26Sf2063VKW45kTAZFbqGVjcjdJZbcUfvE6rS3/V+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 489D31F7CE;
	Fri,  9 Oct 2026 13:33:43 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F2BCC136D9;
	Fri,  9 Oct 2026 13:33:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oxVDIjbtyGr4ZgAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Fri, 09 Oct 2026 13:33:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] ALSA: line6: Fix handling of zero-length capture packets
Date: Fri,  9 Oct 2026 15:33:35 +0200
Message-ID: <20261009133341.440917-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009133341.440917-1-tiwai@suse.de>
References: <20261009133341.440917-1-tiwai@suse.de>
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

As a result, the outgoing packet length can be also zero, so the
corresponding check is dropped, too; otherwise the outgoing URB will
be lost.

Fixes: 1027f476f507 ("staging: line6: sync with upstream")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: drop the zero urb length check code, too

 sound/usb/line6/pcm.c      |  4 +++-
 sound/usb/line6/playback.c | 10 ++--------
 2 files changed, 5 insertions(+), 9 deletions(-)

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
index aa6ddf8746a0..8797f8b1577a 100644
--- a/sound/usb/line6/playback.c
+++ b/sound/usb/line6/playback.c
@@ -171,7 +171,7 @@ static int submit_audio_out_urb(struct snd_line6_pcm *line6pcm)
 		    &urb_out->iso_frame_desc[i];
 
 		fsize = line6pcm->prev_fsize;
-		if (fsize == 0) {
+		if (fsize == -1) {
 			int n;
 
 			line6pcm->out.count += frame_increment;
@@ -194,12 +194,6 @@ static int submit_audio_out_urb(struct snd_line6_pcm *line6pcm)
 		urb_size += fsize;
 	}
 
-	if (urb_size == 0) {
-		/* can't determine URB size */
-		dev_err(line6pcm->line6->ifcdev, "driver bug: urb_size = 0\n");
-		return -EINVAL;
-	}
-
 	urb_frames = urb_size / bytes_per_frame;
 	urb_out->transfer_buffer =
 	    line6pcm->out.buffer +
@@ -271,7 +265,7 @@ static int submit_audio_out_urb(struct snd_line6_pcm *line6pcm)
 						   bytes_per_frame);
 		}
 		line6pcm->prev_fbuf = NULL;
-		line6pcm->prev_fsize = 0;
+		line6pcm->prev_fsize = -1;
 	}
 	spin_unlock(&line6pcm->in.lock);
 
-- 
2.55.0

