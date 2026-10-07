Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB843B2D38;
	Wed,  7 Oct 2026 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366181; cv=none; b=A5S45mRQp3tvOkLe0IP7t0UPNC5ijfZNXC5qpvh6EGdfAV1mG4dULPOf644NFJCJCE7IF/kDYYMD5iJvOymdRJepYcO9mstbMTCb4G8NRRo6KpbDhdJouJZiPYBriQcM/o3bpcRkloj4wbGiewOQEJku5TaYx/DFk1mMKbWXC78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366181; c=relaxed/simple;
	bh=Gz5PPqQBudFWq0u0E5KfTIUgAinz3Ty52/aAiDDLJlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAP12zzak+iCvwVOH+GqAlvylEwckLY/6mRCJ1HZpLJrfHYZsx7RKX+xQ44XUnCoTJkOWKzrpVvnravYDl3urx6Qep/PkD2kKQWVgngXV6RQyjw5ULpFXxVscoqVne5Kq/sUww3WkDYcf8mh575Wwba0Ryd8zYnI4WCaDx1iImA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=guTZFEzu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WxFDAYrB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=guTZFEzu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WxFDAYrB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="guTZFEzu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WxFDAYrB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="guTZFEzu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WxFDAYrB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AFD5721FD7;
	Wed,  7 Oct 2026 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791366165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FjPZKlsxpxWAgykDjcvIgwNxE7HqkqZh6uEhpWDE++U=;
	b=guTZFEzuBXe5yBdXw2wh9Xs7i2F1sbu9dwdikTIFo1qYsmGkDPqByIexKeVDZB25VL9E36
	Z6X0JJOS4o6kLwUhGVBGITik3nFg+x/SDcjPFA4uIMRR9NRsuLvqAjX2lXT71nSQ7F6vSl
	RYcJhpBlC7RtMjd+RAgiBqH1N9EC59U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791366165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FjPZKlsxpxWAgykDjcvIgwNxE7HqkqZh6uEhpWDE++U=;
	b=WxFDAYrBKIj8tQoCcYk5esQY6t+z2yuR4PI6Yygdzr7dJ/nSaj0jK6KuOh9ls+TAuZO0Rn
	0fGxghkZpVsjZRDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791366165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FjPZKlsxpxWAgykDjcvIgwNxE7HqkqZh6uEhpWDE++U=;
	b=guTZFEzuBXe5yBdXw2wh9Xs7i2F1sbu9dwdikTIFo1qYsmGkDPqByIexKeVDZB25VL9E36
	Z6X0JJOS4o6kLwUhGVBGITik3nFg+x/SDcjPFA4uIMRR9NRsuLvqAjX2lXT71nSQ7F6vSl
	RYcJhpBlC7RtMjd+RAgiBqH1N9EC59U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791366165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FjPZKlsxpxWAgykDjcvIgwNxE7HqkqZh6uEhpWDE++U=;
	b=WxFDAYrBKIj8tQoCcYk5esQY6t+z2yuR4PI6Yygdzr7dJ/nSaj0jK6KuOh9ls+TAuZO0Rn
	0fGxghkZpVsjZRDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A45013B97;
	Wed,  7 Oct 2026 09:42:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AS17ChUUxmp0FQAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 09:42:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] ALSA: pcmtest: Use platform_device_register_simple()
Date: Wed,  7 Oct 2026 11:42:27 +0200
Message-ID: <20261007094234.1051316-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007094234.1051316-1-tiwai@suse.de>
References: <20261007094234.1051316-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
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
X-Spam-Score: -2.80
X-Spam-Level: 

It's more standard for this kind of device that doesn't need any
special handling.  This allows us to delete the stub release callback.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/pcmtest.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index b4e333b4c438..393f132a438b 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -446,10 +446,6 @@ static snd_pcm_uframes_t snd_pcmtst_pcm_pointer(struct snd_pcm_substream *substr
 	return bytes_to_frames(substream->runtime, v_iter->buf_pos);
 }
 
-static void pcmtst_pdev_release(struct device *dev)
-{
-}
-
 static int snd_pcmtst_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -586,15 +582,14 @@ static int pcmtst_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_device pcmtst_pdev = {
-	.name =		"pcmtest",
-	.dev.release =	pcmtst_pdev_release,
-};
+#define SND_PCMTEST_DRIVER	"pcmtest"
+
+static struct platform_device *pcmtst_pdev;
 
 static struct platform_driver pcmtst_pdrv = {
 	.probe =	pcmtst_probe,
 	.driver =	{
-		.name = "pcmtest",
+		.name = SND_PCMTEST_DRIVER,
 	},
 };
 
@@ -706,12 +701,14 @@ static int __init mod_init(void)
 	err = init_debug_files(buf_allocated);
 	if (err)
 		goto err_free_patterns;
-	err = platform_device_register(&pcmtst_pdev);
-	if (err)
+	pcmtst_pdev = platform_device_register_simple(SND_PCMTEST_DRIVER, -1, NULL, 0);
+	if (IS_ERR(pcmtst_pdev)) {
+		err = PTR_ERR(pcmtst_pdev);
 		goto err_clear_debug;
+	}
 	err = platform_driver_register(&pcmtst_pdrv);
 	if (err) {
-		platform_device_unregister(&pcmtst_pdev);
+		platform_device_unregister(pcmtst_pdev);
 		goto err_clear_debug;
 	}
 
@@ -730,7 +727,7 @@ static void __exit mod_exit(void)
 	free_pattern_buffers();
 
 	platform_driver_unregister(&pcmtst_pdrv);
-	platform_device_unregister(&pcmtst_pdev);
+	platform_device_unregister(pcmtst_pdev);
 }
 
 MODULE_DESCRIPTION("Virtual ALSA driver for PCM testing/fuzzing");
-- 
2.55.0

