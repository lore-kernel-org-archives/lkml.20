Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A044F4CEA;
	Thu,  8 Oct 2026 19:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487577; cv=none; b=i4AuQ/03mxyymrYTC695d7dcve/fhBAMIXHMfpAGzyv50fd0Y3TKDm/yqs6gwu1nx4aQushRn9FfJ1loRAly6zy4c0UB7Yvar9gwwSTxNshgO7FdcfQCCMS460w+dNszQ8UgHSLEDxAxuPdd0egIUS5Dj2xGYnHlrme4Ln3gx8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487577; c=relaxed/simple;
	bh=fdvzl6J6mo+15vz5FUrvgMbASKUeXHe8JL7KHJ1T6U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUMkPfl3vhgL2OlgiI8NJrrQsqMFL2sRBKYdoSl5Tf59F+mHaPGIZPPX2ELD0cRSVgd9SB4oj8J6m8rO9k53KdV0ISBurHjpBNLJemF7i+Bq1qmw/vKPORmhbCviUlrKvLrhRBXdknRemOOM92eY9rJVJ/pxzBmrSoLJh+TcElA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E3E811F7BB;
	Thu,  8 Oct 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AEB8E1395B;
	Thu,  8 Oct 2026 19:26:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dQZEOknux2ozCAAAD6G6ig:T11
	(envelope-from <tiwai@suse.de>); Thu, 08 Oct 2026 19:26:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] ALSA: line6: Fix potential OOB write in line6_capture_copy()
Date: Thu,  8 Oct 2026 21:25:50 +0200
Message-ID: <20261008192553.300025-11-tiwai@suse.de>
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
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Result: default: False [0.00 / 50.00]
X-Spam-Score: 0.00

line6_capture_copy() copies the data for the original byte size, but
the buffer overwrap is checked against the frame size.  Because of it,
when the data size isn't aligned in frames, the remaining bytes might
be still copied above the buffer size.

For avoiding the potential OOB write, correct the copied data size in
line6_capture_copy() to be aligned with frames.

Fixes: 1027f476f507 ("staging: line6: sync with upstream")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/capture.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/line6/capture.c b/sound/usb/line6/capture.c
index 6dbaf30232f9..3e1f40d6b481 100644
--- a/sound/usb/line6/capture.c
+++ b/sound/usb/line6/capture.c
@@ -117,7 +117,8 @@ void line6_capture_copy(struct snd_line6_pcm *line6pcm, char *fbuf, int fsize)
 	} else {
 		/* copy single chunk */
 		memcpy(runtime->dma_area +
-		       line6pcm->in.pos_done * bytes_per_frame, fbuf, fsize);
+		       line6pcm->in.pos_done * bytes_per_frame, fbuf,
+		       frames * bytes_per_frame);
 	}
 
 	line6pcm->in.pos_done += frames;
-- 
2.55.0

