Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F654746D5;
	Wed,  7 Oct 2026 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366177; cv=none; b=WJBycfU38Ziof7ngxErCCulOiYRumP9ROpOen6er6DPyzxO3vGcghs5Psv34b6SB0fgMgMBk11qE7qNYOPrsNfuSKKzU5Rz9TkonlF+EtMno8tIUQHJHFVJb/z741/TxiU+EpWFNWHP1V4lb9qb+wvONH6hvIoeZK3hRIJgaEpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366177; c=relaxed/simple;
	bh=o7J6SnrK01yk0HAGVb9tuBIphY4zxCQH9eEQdxi2dLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzBpaGcpPJFGVEpsN/aMlPANWoU//HIZ08p8BTaM4GgF2A3QX7c3emu48Tp0kAatNIS9KMb93w2Ed+4RILRQM2IB1lsT4sdH20R9pQBIvWiPKC1z1QqIH3OLu0mhWBs8y4hSIIN3+AaXCTtbBBECZ+LGkbHV10mQPPMVl3rnm0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bMbBEtDe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=juPlKeou; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bMbBEtDe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=juPlKeou; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bMbBEtDe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="juPlKeou";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bMbBEtDe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="juPlKeou"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D018D1F848;
	Wed,  7 Oct 2026 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791366165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5D6y8eS3NIKrpHnEUphVei105g40leR6yus68QbR/sU=;
	b=bMbBEtDeRiV3zvTuIoDWOKtk0Ma6rx9o2bLUYdxPzTQVN916PKnMUqjIJzLTyS1gIhvCYJ
	G1TVIHhkCbBiIEkNFp3+hKHRmai7Z5Ock3REp0MB3dewk8KNohnEqurVJiK4zLZpneY+m3
	rgPNcpbo++XDvvv7g6QLSEdOAJAF3Q4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791366165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5D6y8eS3NIKrpHnEUphVei105g40leR6yus68QbR/sU=;
	b=juPlKeouKwJyXgH5nutPG92sNd7CScLLVY7hHEq0Ebcsh1us4rhOke3Zg9eA0tpJRMDpOd
	pu76sxfi7KGC7WBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791366165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5D6y8eS3NIKrpHnEUphVei105g40leR6yus68QbR/sU=;
	b=bMbBEtDeRiV3zvTuIoDWOKtk0Ma6rx9o2bLUYdxPzTQVN916PKnMUqjIJzLTyS1gIhvCYJ
	G1TVIHhkCbBiIEkNFp3+hKHRmai7Z5Ock3REp0MB3dewk8KNohnEqurVJiK4zLZpneY+m3
	rgPNcpbo++XDvvv7g6QLSEdOAJAF3Q4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791366165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5D6y8eS3NIKrpHnEUphVei105g40leR6yus68QbR/sU=;
	b=juPlKeouKwJyXgH5nutPG92sNd7CScLLVY7hHEq0Ebcsh1us4rhOke3Zg9eA0tpJRMDpOd
	pu76sxfi7KGC7WBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A54B13B99;
	Wed,  7 Oct 2026 09:42:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AS17ChUUxmp0FQAAD6G6ig:T6
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 09:42:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] ALSA: aloop: Avoid a bad mixure of guard() and goto
Date: Wed,  7 Oct 2026 11:42:29 +0200
Message-ID: <20261007094234.1051316-6-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

The rewrite of aloop driver code using guard() leaded to a mixture of
guard() and some goto; although it currently works, it isn't really a
good match.

For avoiding the bad match, just move the code using goto into a
function and wrap it with guard().

Fixes: ebd9b6c91d4e ("ALSA: aloop: Use guard() for mutex locks")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 5f0e2dc96769..0aaa64b189da 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1375,7 +1375,7 @@ static const struct loopback_ops loopback_snd_timer_ops = {
 	.dpcm_info = loopback_snd_timer_dpcm_info,
 };
 
-static int loopback_open(struct snd_pcm_substream *substream)
+static int __loopback_open(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct loopback *loopback = substream->private_data;
@@ -1384,7 +1384,6 @@ static int loopback_open(struct snd_pcm_substream *substream)
 	int err = 0;
 	int dev = get_cable_index(substream);
 
-	guard(mutex)(&loopback->cable_lock);
 	dpcm = kzalloc_obj(*dpcm);
 	if (!dpcm)
 		return -ENOMEM;
@@ -1479,6 +1478,14 @@ static int loopback_open(struct snd_pcm_substream *substream)
 	return err;
 }
 
+static int loopback_open(struct snd_pcm_substream *substream)
+{
+	struct loopback *loopback = substream->private_data;
+
+	guard(mutex)(&loopback->cable_lock);
+	return __loopback_open(substream);
+}
+
 static int loopback_close(struct snd_pcm_substream *substream)
 {
 	struct loopback *loopback = substream->private_data;
-- 
2.55.0

