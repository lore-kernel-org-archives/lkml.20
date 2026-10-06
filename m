Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35C345C715;
	Tue,  6 Oct 2026 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294051; cv=none; b=TjKbZz5Am5maQe2okQjcrXCkzSWht9XIMJ/rkPiKN8fl3eZY/Ki2q+fQyOBENJEtb7NXbXtvJm6hPmDpo8iNedrVZGKHbvztZ0vPD8FtWukwp51d/aCLkath5ldBVmFrRAC0BPI0oa8vurWA6pJbwkojCcZoCZ7y5hz5C1y7elE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294051; c=relaxed/simple;
	bh=jPv63eF6snabXno7qEfL2NmSKhlkcHUqtbMade2iPpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPXiC5fCGoNitHKMTxBzMp856VzIaxnM5Mfq4oGuidQiksncKyjHfC4eF/nrdcJ0cv670JOBUlVjYeJ1BBftLhwFm37Vsxa1VfG303LNvv1/404Wxn0+UwjFXyRbo5S17zWu34MXL8u+LujnfL8Ic0+tuAPTOKxfBo8uhYNyn3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NpkwbMsh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T1nznyZH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jqmq5dBl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=924GYv27; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NpkwbMsh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T1nznyZH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jqmq5dBl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="924GYv27"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BD02F1FB13;
	Tue,  6 Oct 2026 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgECiuSHOc97TgFEPAMUyz18J8VIRBtN9EGbyBJZgIs=;
	b=NpkwbMshH4nLdnXq714eYIVGDiAI/O+zUJX6YK+49LRQogATOxIf1124bN0Z/5bsEHgEDT
	WxQYdeRA+peLtrPOv4NN2BvvuaihIteFtLgehZ/L/qZm9CK65jWrdaMkCpCNl4wzLl1fu+
	eP1x29xnOPuv+dYdQyYFgdDB1s2Gsik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgECiuSHOc97TgFEPAMUyz18J8VIRBtN9EGbyBJZgIs=;
	b=T1nznyZH7dhaT+PJ7EnvSFRlnc8tcJBNyTT0EmNb0eqtoyFFxQZDOOl8YdqCWh0xO5kyLf
	bDTAQBzzszZ3ukBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Jqmq5dBl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=924GYv27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgECiuSHOc97TgFEPAMUyz18J8VIRBtN9EGbyBJZgIs=;
	b=Jqmq5dBlFsSlFfuixOoFwDyye7pFCI3w73r7RtZTRrNl8fFwBb2Qa545JoTyfF5b0Glyxd
	fPV+1UUjTB+e7GyrmmoNZSE8+B3LG6UXy9pullEFJLN8rkVQqpA1bdSDzAM2vrnAJOXzC1
	gvdLikmvmAJm7texZ7+oD6Lcg2hlBGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgECiuSHOc97TgFEPAMUyz18J8VIRBtN9EGbyBJZgIs=;
	b=924GYv277g8ZEGxbfq1DO862pbsMMty8tFIkS1Vri8/tq5B5qJBkTL7zivnHnQ2HcY9rCo
	XlKDNlLAGjYiGrCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DCDC13A5E;
	Tue,  6 Oct 2026 13:40:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1eVrAVf6xGq1cAAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 13:40:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] ALSA: hda: Fix potential UAF for gating jack
Date: Tue,  6 Oct 2026 15:40:27 +0200
Message-ID: <20261006134035.478529-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006134035.478529-1-tiwai@suse.de>
References: <20261006134035.478529-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BD02F1FB13
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

snd_hda_jack_set_gating_jack() assigns gated and gating variables from
the succeeding calls of snd_hda_jack_tbl_get().  This works normally,
but the second call might kick off the reallocation of the jack table,
hence the first pointer might become invalid, which leads to a UAF.

For avoiding that pitfall, this patch changes the code to two phases:
the first to only create two entries, and the second phase to get the
pointers from the table, so that no relocation can happen any longer.

Fixes: 0619ba8c17b1 ("ALSA: hda - Allow jack state to depend on another jack")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/jack.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/hda/common/jack.c b/sound/hda/common/jack.c
index 1d6b0f0e6f27..c3efab3b5bfe 100644
--- a/sound/hda/common/jack.c
+++ b/sound/hda/common/jack.c
@@ -389,12 +389,15 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_detect_enable);
 int snd_hda_jack_set_gating_jack(struct hda_codec *codec, hda_nid_t gated_nid,
 				 hda_nid_t gating_nid)
 {
-	struct hda_jack_tbl *gated = snd_hda_jack_tbl_new(codec, gated_nid, 0);
-	struct hda_jack_tbl *gating =
-		snd_hda_jack_tbl_new(codec, gating_nid, 0);
+	struct hda_jack_tbl *gated, *gating;
 
 	WARN_ON(codec->dp_mst);
+	if (!snd_hda_jack_tbl_new(codec, gated_nid, 0) ||
+	    !snd_hda_jack_tbl_new(codec, gating_nid, 0))
+		return -ENOMEM;
 
+	gated = snd_hda_jack_tbl_get_mst(codec, gated_nid, 0);
+	gating = snd_hda_jack_tbl_get_mst(codec, gating_nid, 0);
 	if (!gated || !gating)
 		return -EINVAL;
 
-- 
2.55.0

