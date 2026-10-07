Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D33376BF2;
	Wed,  7 Oct 2026 21:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410220; cv=none; b=GSNJncIUCEFt5vCxaRFV0fOVWX9Neldt9xwrOSuCAcH6CCUi1RZHZljVY44inONlR12O2HY21Z1qo5SL57EtbdwzrPfV3bUamgLXCY2TDpym1b7Jh6CqEXr6Iyiec2cnvshF2zQ8+T2zoWky+eiXPJnMnzIn74UNlj8cI604LMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410220; c=relaxed/simple;
	bh=Nn+5FLqME79Jk4Bl8cncNd26Nq7tphSeuY8lm5I5bJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJpaf4zLvycC7Vr89/sB/6Gd0qPFE/VRQJvITizCjG2KyZWolacpuyk/oZRkv4AimaHomCT9bnBoMPNkW/lHXsStDMQkVn6UpJwzi8pcuOMgyCD7Dhtnfa4CuMu9Fwg15o80oofBuAwlbPH9siJJfTx0MqHXzs7YvaL2FFmTfz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mXNB9RFh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mu1TTlXe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mXNB9RFh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mu1TTlXe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mXNB9RFh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mu1TTlXe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mXNB9RFh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mu1TTlXe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 279EC1F786;
	Wed,  7 Oct 2026 21:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791410217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AbRwjRtcDGDBnECgZc7/QnRNZiB012Td4diKR7STqds=;
	b=mXNB9RFh3waYMHETe49q2SXQ9EVYVJ6HMBuOZ5pMfWiq5ms2vxFqtnezM5KqovmNveJTHy
	/7m/fh/b7eY/QcP/3741qRK4W8/cI5XQCRW+41rQBPzpCeAvhjPaIzkqavNpnMlD7xD+0r
	vQVSljwV00kOpALDPAyAaHIrXTdTNI0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791410217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AbRwjRtcDGDBnECgZc7/QnRNZiB012Td4diKR7STqds=;
	b=Mu1TTlXeCOj9Xa5fz2gY2sr9aDX+86JO4yTKyN2yOYZSzsd3lX/T+n7sLBXXGRgs1APe+P
	iSRIZ457Vm0IsgAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mXNB9RFh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Mu1TTlXe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791410217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AbRwjRtcDGDBnECgZc7/QnRNZiB012Td4diKR7STqds=;
	b=mXNB9RFh3waYMHETe49q2SXQ9EVYVJ6HMBuOZ5pMfWiq5ms2vxFqtnezM5KqovmNveJTHy
	/7m/fh/b7eY/QcP/3741qRK4W8/cI5XQCRW+41rQBPzpCeAvhjPaIzkqavNpnMlD7xD+0r
	vQVSljwV00kOpALDPAyAaHIrXTdTNI0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791410217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AbRwjRtcDGDBnECgZc7/QnRNZiB012Td4diKR7STqds=;
	b=Mu1TTlXeCOj9Xa5fz2gY2sr9aDX+86JO4yTKyN2yOYZSzsd3lX/T+n7sLBXXGRgs1APe+P
	iSRIZ457Vm0IsgAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DABAF139AF;
	Wed,  7 Oct 2026 21:56:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DGVtGSjAxmr0JwAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 21:56:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: codecs: hda: Stop unsol events and jack polling before codec removal
Date: Wed,  7 Oct 2026 23:56:47 +0200
Message-ID: <20261007215650.159871-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007215650.159871-1-tiwai@suse.de>
References: <20261007215650.159871-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 279EC1F786

The ASoC HD-audio codec driver has the same race as the legacy HDA
codec driver unbind: hda_codec_remove() calls the codec's remove
callback that releases the driver resources, followed by
snd_hda_codec_cleanup_for_unbind(), while the unsolicited event work
and the jack polling work may still run concurrently and access the
released resources, leading to a UAF.

Apply the same fix as done for the legacy driver: call
snd_hdac_device_disable_unsol() and cancel jackpoll_work at the
beginning of hda_codec_remove(), and clear the unsol_disabled flag
again at hda_codec_probe() so that the events get delivered after the
codec is re-registered.

Assisted-by: LLM
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/hda.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index 237b0b060457..5188c9d74c8b 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -218,6 +218,9 @@ static int hda_codec_probe(struct snd_soc_component *component)
 		goto err;
 	}
 
+	/* unsol events are still blocked until registered */
+	codec->core.unsol_disabled = false;
+
 	ret = driver->ops->probe(codec, codec->preset);
 	if (ret < 0) {
 		dev_err(&hdev->dev, "codec init failed: %d\n", ret);
@@ -276,6 +279,10 @@ static void hda_codec_remove(struct snd_soc_component *component)
 	/* Don't allow any more runtime suspends */
 	pm_runtime_forbid(&hdev->dev);
 
+	/* stop asynchronous jack handling before freeing driver resources */
+	snd_hdac_device_disable_unsol(hdev);
+	cancel_delayed_work_sync(&codec->jackpoll_work);
+
 	hda_codec_unregister_dais(codec, component);
 
 	if (driver->ops->remove)
-- 
2.55.0

