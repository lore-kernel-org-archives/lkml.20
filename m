Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C997243A7FA;
	Thu,  3 Sep 2026 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431949; cv=none; b=O8+SxptInJk/7FxAMnrz9gqZKSaqlphh4yEuGDXegiDmcSd1jWn6Gf2fFn28vH+83q2idpQ/Lqoij/zMDZp6hL7cKKtRCbHvIVV/AbVuHklYm/LP6fW+o0KOOUoKbX0TnRvi3CbHVS7aWFkwjmugqNXAsWthS1jhYtk04mue01Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431949; c=relaxed/simple;
	bh=L1hTOT6bZigHFVPmU8OWo5WEiB3xw9tCEvcZvsBTd2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uxHhXGM/uu0X6lES1OGcAZLauSIfRxuIMfEHJpTJC3Mk77BsWVc3SLtVSPHvrsGUs13bpTgJYsf9OWCUlBahF+K+QtkDmb5Tl0R7qJTq3wDNO2mw/z3Awnkfg6W6aNmoxDGDugD+qOsPUVdrH32EcmI8pkfvIGlQ1d5KZG7mO28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qWWI9+oU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EIikv+EP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PFeEwn5P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O9aBwfh1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qWWI9+oU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EIikv+EP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PFeEwn5P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O9aBwfh1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ABACA1FE28;
	Thu,  3 Sep 2026 10:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788431941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aDnECGRWP8TxIUKlZKMiIpCjMd7UHWunlMZWeSmZc4g=;
	b=qWWI9+oUUYDjVlN3D0qRV0c0CmFzbM0hq1mpHgX4Xek9xmfm2d0Oq6w+qhprDj0IC8jjBX
	/UBp6c0XOJNNDQDfULGiCWChlESeRBgQABRetIkJSyUo7O7/H1NzoGSq+JXeBNonE0m7ZI
	b5sRV/2UqoGy4BdCuE6KqfmXkqdiNKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788431941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aDnECGRWP8TxIUKlZKMiIpCjMd7UHWunlMZWeSmZc4g=;
	b=EIikv+EP3c+XgOFpkWA3EcLffvJjoiJfpMAuyQ2NMastWNj3jhCBhv7ys3Wpewwj4S3Eyd
	lfuP1GDUIUWH69CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PFeEwn5P;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=O9aBwfh1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788431937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aDnECGRWP8TxIUKlZKMiIpCjMd7UHWunlMZWeSmZc4g=;
	b=PFeEwn5Pyawj5oDvlOFW/Z9NVwfstzVMdAdF5beyi6hfJzQGEIhdv4Up63BWRL5oJ+wkKZ
	bsPdrDx4R3LDGmNOQWg7nJo+nlk7QXBKg5RKTr0UQrl+GPuUvLYCbdV94lB9eFUHfE0RLs
	I2USA3w1Z1e/LteZZollDC9rfhuj3zE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788431937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aDnECGRWP8TxIUKlZKMiIpCjMd7UHWunlMZWeSmZc4g=;
	b=O9aBwfh1Qhg0RTa85pu/1OoLHA0GArGeD+GRB4Xb725bCvcoZebV9cKGYMSXUVQ7s6zI8Q
	0qXr6AWRKvcGYfAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 752B4136D9;
	Thu,  3 Sep 2026 10:38:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AAZqG0FOmWoNLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 10:38:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: caiaq: Fix potential double-free at error path
Date: Thu,  3 Sep 2026 12:38:51 +0200
Message-ID: <20260903103855.1807838-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: ABACA1FE28
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01

The fix for caiaq driver's resource management to handle the errors
tries to release the resources in a common destructor call, but as a
sashiko review for another patch suggested, some of the audio
resources such as URBs have been already freed, and this may lead to a
double-free.

For addressing the double-free, call the common destructor function
from each place, and assure that the resource pointers get cleared.

Link: https://sashiko.dev/#/patchset/20260903084747.535367-1-eadavis%40sina.com
Fixes: 28abd224db4a ("ALSA: caiaq: Handle probe errors properly")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/caiaq/audio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
index ba3f73455ebe..bb6280aa3533 100644
--- a/sound/usb/caiaq/audio.c
+++ b/sound/usb/caiaq/audio.c
@@ -828,16 +828,13 @@ int snd_usb_caiaq_audio_init(struct snd_usb_caiaqdev *cdev)
 
 	cdev->data_urbs_in = alloc_urbs(cdev, SNDRV_PCM_STREAM_CAPTURE, &ret);
 	if (ret < 0) {
-		kfree(cdev->data_cb_info);
-		free_urbs(cdev->data_urbs_in);
+		snd_usb_caiaq_audio_free(cdev);
 		return ret;
 	}
 
 	cdev->data_urbs_out = alloc_urbs(cdev, SNDRV_PCM_STREAM_PLAYBACK, &ret);
 	if (ret < 0) {
-		kfree(cdev->data_cb_info);
-		free_urbs(cdev->data_urbs_in);
-		free_urbs(cdev->data_urbs_out);
+		snd_usb_caiaq_audio_free(cdev);
 		return ret;
 	}
 
@@ -858,6 +855,9 @@ void snd_usb_caiaq_audio_free(struct snd_usb_caiaqdev *cdev)
 
 	dev_dbg(dev, "%s(%p)\n", __func__, cdev);
 	free_urbs(cdev->data_urbs_in);
+	cdev->data_urbs_in = NULL;
 	free_urbs(cdev->data_urbs_out);
+	cdev->data_urbs_out = NULL;
 	kfree(cdev->data_cb_info);
+	cdev->data_cb_info = NULL;
 }
-- 
2.55.0

