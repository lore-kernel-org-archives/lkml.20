Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5F14F93B1;
	Thu,  1 Oct 2026 11:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852731; cv=none; b=GQ6RBovd2+IDmRLysgjDz5+VPtiqg0OWpBOO0VWq8LKxot6ibYOeqNPQbZijyb4aClyQpCGwsw2QS7FbxKt8KxDcRGqNmoKWLVWC964yUkcU+FkmPkqoMF+f3oslQIYTFzPbWPJ569pAHZ2B49xLEVVAzcgcN8otSFO9Iyzkp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852731; c=relaxed/simple;
	bh=Q2M/EUxXa8qhF0Z1odbf+9dV97cM6L/6qNRiW3HCupc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAgU0l0S36KvxPeO3fbPTjTK6/xRgKaiD/1E5AgRQNNFNWjFDhT2GN1Nn5dPtxzx3hGzFiT/BWCmHwjXXShHkEq9O5EkitBa2mr95zSG5WH9tuthms8y3KSEH80vx20BZFCcLTD8dTJcDj46RW3gG+La3ghqHAbT9F48+EihiNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UAGZ0+FM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QLsWRxvE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O//aSG8I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9vJHFXGx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UAGZ0+FM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QLsWRxvE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O//aSG8I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9vJHFXGx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 498FB1FD36;
	Thu,  1 Oct 2026 11:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7HOJlnpxPXiwOawdHuPiPGgQLQ8ZHPsZXnP4DQOF7c=;
	b=UAGZ0+FMCy5CdWJTVud1FaFWiWe/5OavSXR4vGYVizxdTXYk3oMu6anLIbYeaFABw9fPuU
	Rb846kVeCk/T8QXAs8rBEo5dWZx+rXg1EslSJjbag/+pOKE/vCBCtgdl1W8T9BvyDA2iAi
	IaVcpXVOvQGwj8ZsU/XAplVAPJisv3o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7HOJlnpxPXiwOawdHuPiPGgQLQ8ZHPsZXnP4DQOF7c=;
	b=QLsWRxvEMPxsXR2Ni+pk5iFxXoUisdJ9NO6RSaB2dHHizvb1+iCEGh4VhWWw81VqamLirH
	0b2C5eM7JmMnXLAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7HOJlnpxPXiwOawdHuPiPGgQLQ8ZHPsZXnP4DQOF7c=;
	b=O//aSG8ItQz/gt6F64HnZekVPcbBtG+STSJ/V8O/sEoyc8q+LMNXcZreNiAXCUWyXfu7RS
	BVHaGQxUCvSdJd9W3z5ZToY04hAkLejXuyxpA7fhcv+lQ7qlbqAJ/i6OKFazRwh8/HdxkR
	Xn/vkuibMFKUDkFwjqn7iISIF6goAm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7HOJlnpxPXiwOawdHuPiPGgQLQ8ZHPsZXnP4DQOF7c=;
	b=9vJHFXGxZ9+jvr9rRw6z1ZtpLZcKgSgzRszOW3Wy9ElPF/jq2/kqSSuZV4v3+uJH8k/Kvx
	dGQ0saAlV6S/cGCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A7AF13B7A;
	Thu,  1 Oct 2026 11:04:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T32
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 31/32] ALSA: intel-hdmi-audio: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:04:11 +0200
Message-ID: <20261001110447.486782-32-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001110447.486782-1-tiwai@suse.de>
References: <20261001110447.486782-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/x86/intel_hdmi_audio.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 91dfcf47e979..0fdd4cdf17fa 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1634,9 +1634,9 @@ static void hdmi_lpe_audio_free(struct snd_card *card)
  * This function is called when the i915 driver creates the
  * hdmi-lpe-audio platform device.
  */
-static int __hdmi_lpe_audio_probe(struct platform_device *pdev)
+static int hdmi_lpe_audio_probe(struct platform_device *pdev)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_intelhad_card *card_ctx;
 	struct snd_intelhad *ctx;
 	struct snd_pcm *pcm;
@@ -1797,14 +1797,10 @@ static int __hdmi_lpe_audio_probe(struct platform_device *pdev)
 		schedule_work(&ctx->hdmi_audio_wq);
 	}
 
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int hdmi_lpe_audio_probe(struct platform_device *pdev)
-{
-	return snd_card_free_on_error(&pdev->dev, __hdmi_lpe_audio_probe(pdev));
-}
-
 static const struct dev_pm_ops hdmi_lpe_audio_pm = {
 	SYSTEM_SLEEP_PM_OPS(hdmi_lpe_audio_suspend, hdmi_lpe_audio_resume)
 };
-- 
2.55.0

