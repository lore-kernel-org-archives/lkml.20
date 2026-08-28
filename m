Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1EC449ED6;
	Fri, 28 Aug 2026 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918179; cv=none; b=V8oq6nQsmYGGwmmVjsy3Wor06j1/243AY/sSIwcdnnnuFfVLIg32lxEyvBXz7JdfBwcMBZ0+TT8GBBQ4MoAgq+plGkOgX6lIlgNF9IAU7HeXe7p7WDKRVkRaYex2LQ5dx380sIilvMZPMqvd1aGy0GueoyERY5PnrYu1CUMAZLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918179; c=relaxed/simple;
	bh=Fqvx6yZ7d3AO1AuNBTIYtJTRvPSlJoonCN0/SaX9yq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hjzNAP82ss+JPfbdUNsvwRLT8MyclR8/1S4m6vylBOVGJTZ39yxh5JH+eYV0AETeGL98ktqt0EL1EqfSc0Ys8BduSLcZBg476LRt29Dk3l8YDZUDbZFKPfetac40FAamomeOI0SQmFbc+I3k35Nnb8F0EdOAH9dUB5iPoTFJWHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NMUDCS3W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mjk8+Irb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Dkq9js3K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GkFaHPG4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NMUDCS3W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mjk8+Irb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dkq9js3K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GkFaHPG4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A9D2221CD4;
	Fri, 28 Aug 2026 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787918155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AWu3EE/D7d16eyHtTU/QING0cNGIWXkKi3yhQPYQBpI=;
	b=NMUDCS3W10X7XUWL21V6C++6/YzC1UFxw5sX+6r6ByaBRWzON7QaSUWmFjEkMSyABJF4lE
	6EcsrWtrZZCsG06KfhkluLq6ULuCCV3vb8iVwUFb/nNGmpq1SpDFo+kX/nNJXI3isKuRwd
	HRgqOdkM4Z9dlc1eKpvGM7nw52OHhOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787918155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AWu3EE/D7d16eyHtTU/QING0cNGIWXkKi3yhQPYQBpI=;
	b=Mjk8+IrbYbxGSEZKvShkK4wzbiMQIkK5QOTdDdAn5Ypzi6khplz2qnPWO2xziQWH+6p4dl
	yQMYITFy5jfS7JCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787918151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AWu3EE/D7d16eyHtTU/QING0cNGIWXkKi3yhQPYQBpI=;
	b=Dkq9js3Kz2S06FTLWlJnjPtgyCyLBWhV7KaIXaMPmgvixQrsb9C1sjtF5+N6OPJicBmEsy
	FF0M1tOsuA0wpfe3pqW9EUmZazcEZpxeATiIx4D+Nh82mlByCoik6KKTiE45/mpYGTG5ww
	YKsZyl8GDNu+RV7Gyy7Y4FDeAjLWopU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787918151;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AWu3EE/D7d16eyHtTU/QING0cNGIWXkKi3yhQPYQBpI=;
	b=GkFaHPG4haoX1y8gRCAyd0xgS9TIzRbeOz8QzQf0S9D9mKPMZBhTthEwQ2uhBq/nM3LyS+
	J5n7rmu7lf09TPDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 66D2C13515;
	Fri, 28 Aug 2026 11:55:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ccdkF0d3kWomEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 28 Aug 2026 11:55:51 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Fix race between non-atomic ops and trigger-start
Date: Fri, 28 Aug 2026 13:55:39 +0200
Message-ID: <20260828115542.3999-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,appspotmail.com:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

We protect the races of the concurrent state transitions between
atomic PCM ops, but the checks between the non-atomic ops (hw_params,
hw_free and prepare) and the atomic ops aren't perfect; there is a
check of the conflicting PCM state at the beginning of hw_params & co,
but the atomic PCM ops can be still issued during the non-atomic PCM
operations.  An example such scenario is that a thread A re-issues the
PREPARE or HW_PARAMS for the already prepared stream, while another
thread B triggers the PCM start in the middle of the prepare
operation.  Although this usually doesn't lead to much serious issues,
it can give some inconsistency as reported by syzkaller (such as
ODEBUG warning).

There are various atomic PCM ops, and basically the only problem is
the PCM start as it operates from the PREPARED state.  Other trigger
commands (stop, etc) are for the running or the other special state,
hence they are filtered as pre-condition.

This patch is for preventing the PCM trigger-start during the non-
atomic operations in order to address the problems above.
Fortunately, the hw_params, hw_free and prepare operations call
snd_pcm_buffer_access_lock(), and this can be used for checking the
concurrent operations at the PCM trigger -- which sets the
runtime->buffer_accessing to a negative (if possible), so the PCM
trigger just needs to check the runtime->buffer_accessing value; if
it's negative, it means the concurrent non-atomic PCM ops is running.

Reported-by: syzbot+225231fce6755d40d078@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/6a8f0de8.1d9ded08.62e62.00b5.GAE@google.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 4a5057e7629d..20ae67949e05 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1468,6 +1468,8 @@ static int snd_pcm_pre_start(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	if (runtime->state != SNDRV_PCM_STATE_PREPARED)
 		return -EBADFD;
+	if (atomic_read(&runtime->buffer_accessing) < 0)
+		return -EBADFD; /* during hw_params, hw_free or prepare */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
 	    !snd_pcm_playback_data(substream))
 		return -EPIPE;
-- 
2.55.0

