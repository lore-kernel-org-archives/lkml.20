Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862414D9F6F;
	Wed, 14 Oct 2026 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987923; cv=none; b=WoSrwOg/MGTRCRKuNM0P8PSzKh6HVzQ/6KnWX7YonRYrvGUKAixkWw9udEHBATutQuAd1cGTVg9CwPLBMNFyDF5Xgyw9/8eoSWdiv4rV0E/9qmhoBfl8AuBBLZwY8yaF/QJeE7bkiBP6TnzsOb13PK5QEWD3Ysp0Qs7SAl0I5Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987923; c=relaxed/simple;
	bh=qHCBKJ3jo+4lzkQJ9pTARxCCZVLjr1FooGzhD15myrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jhvUIn1coFEzENefefje1eIZh+IlyZrLkMW+Rp63KhDDyu8cMuNwhWyN8QrtEqYsxa1eq/d9o9GPFUbK92vwM/bljBvEIW6zm0KUoNQ9bhTabjWIjBypfnBwEcceo6nRqrQjzp8SdRkQ/VfH6aOR8ettrmt/phcMb6X3cD06btY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YQBRy6GD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zqKq2jAg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YQBRy6GD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zqKq2jAg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YQBRy6GD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zqKq2jAg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YQBRy6GD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zqKq2jAg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 73E1022047;
	Wed, 14 Oct 2026 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791987920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zRYFMQ+Fp1MksD/NvfSk3lfs/dVEV4G5R4KVYXNA35g=;
	b=YQBRy6GDgxRlg1t1sHQeO2Fif63hw8Ynr1/9pU50cGh6OagKpDjXF1XzpIhlHKy0UlB0a1
	GiQV2XDtTQXU1N1i+L3poiWUvOD9ASfEg9X91F4iaQQ5hvgDxvylZBvYzSUxRKW1fMQpEn
	x6kzvzFTkSBeig4UVD8YTO6LoMJ8ESk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791987920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zRYFMQ+Fp1MksD/NvfSk3lfs/dVEV4G5R4KVYXNA35g=;
	b=zqKq2jAg04TCf7nqYZwGR1Z5OIzPxJztHOCIci2t8h8j4G7UjjV6z/S8QUfOCuAgRelaoW
	tWmR+ZBCGdJzk1Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791987920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zRYFMQ+Fp1MksD/NvfSk3lfs/dVEV4G5R4KVYXNA35g=;
	b=YQBRy6GDgxRlg1t1sHQeO2Fif63hw8Ynr1/9pU50cGh6OagKpDjXF1XzpIhlHKy0UlB0a1
	GiQV2XDtTQXU1N1i+L3poiWUvOD9ASfEg9X91F4iaQQ5hvgDxvylZBvYzSUxRKW1fMQpEn
	x6kzvzFTkSBeig4UVD8YTO6LoMJ8ESk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791987920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zRYFMQ+Fp1MksD/NvfSk3lfs/dVEV4G5R4KVYXNA35g=;
	b=zqKq2jAg04TCf7nqYZwGR1Z5OIzPxJztHOCIci2t8h8j4G7UjjV6z/S8QUfOCuAgRelaoW
	tWmR+ZBCGdJzk1Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C539E1368E;
	Wed, 14 Oct 2026 14:25:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xkaAEM+Qz2ryewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 14:25:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Apply sync-stop at SNDRV_PCM_IOCTL_DROP ioctl
Date: Wed, 14 Oct 2026 16:24:52 +0200
Message-ID: <20261014142454.320703-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

When a PCM stream is stopped via SNDRV_PCM_IOCTL_DROP ioctl, it calls
snd_pcm_stop() but sync-stop operation is missing.  Although this is
usually no big issue, let's add snd_pcm_sync_stop() call, just to be
sure.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6c379068b54c..7ffbf2c0ea92 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2332,6 +2332,8 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
 	result = snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
 	/* runtime->control->appl_ptr = runtime->status->hw_ptr; */
 
+	snd_pcm_sync_stop(substream, true);
+
 	return result;
 }
 
-- 
2.55.0

