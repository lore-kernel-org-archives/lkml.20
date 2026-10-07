Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E42472F60;
	Wed,  7 Oct 2026 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365824; cv=none; b=OwKyv+lfWkVDsBe/2HW4uvESGIsc23iyxqeF1RMxVNIuYfsHaLAE09HP0eZxk4C6772GM8ZVgNjMMrQxNEqvpL6JVOJh38WTJSmz0mOw/aggcGl/29vHT1S+KDE8+o42ofwTO3YPipj5gBDqhofyJpPe3ztAJStZE35VZmjVmwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365824; c=relaxed/simple;
	bh=jPv63eF6snabXno7qEfL2NmSKhlkcHUqtbMade2iPpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXQZ5msT5jNveQnJtI8LkHUc6ezoDlNoy6jO0PMveZ49Bxzgk73dMNVIy3s0tLbJJPDJNfAvbweV2XrHeN7CPCsrGbdHNL+tRgtbLk7EhSKeRuv7G68ZpOv/zZoqXjDhRd1Ya2/tcAMl3+bZauF78NQJlOXMlYGwVu5jPNfg+Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OY4KlkBq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HEmKziLc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z6fBaONa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EqycrwHh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OY4KlkBq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HEmKziLc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z6fBaONa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EqycrwHh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AA3EB1F85D;
	Wed,  7 Oct 2026 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791365806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgECiuSHOc97TgFEPAMUyz18J8VIRBtN9EGbyBJZgIs=;
	b=OY4KlkBqvUnkVgyJ+QBfI5V0ryEDuIMXdtV48L5+UjJkEJBESOuoVcfe6nCbx3vp/btY3z
	kVHTCTbLfvGBMGzWjry9rJU9GozXb1Z5EOBP3VQSsgPcsZqwNsrJ18lVor+qFqTbjXngGZ
	NbmPuiSXgj8OAhMFCDy4N3+y1F4Q7aM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791365806;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgECiuSHOc97TgFEPAMUyz18J8VIRBtN9EGbyBJZgIs=;
	b=HEmKziLc/TkSkwOi4+6TyMQ+hxZ6qRaEVs2QOpQXpgu3xjSa5tlFFw3EU3Ldjb1+C3/VGA
	oPSC6WU66H816XDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=z6fBaONa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EqycrwHh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791365801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgECiuSHOc97TgFEPAMUyz18J8VIRBtN9EGbyBJZgIs=;
	b=z6fBaONaX0PmRI2fhko6IH6EEZ72TGVSHb/+JXWl9Y06OQvJoO4Dz6kq5MTZTSotRlpRi0
	C7W7EwtV6rtSyXs6/cEATlJnRHEW2/pjFWYH6LDq9l0yilMC3gZCTrkx8tn7ZOB4bRt+dF
	fC06HLZ1VwPXmuoaSWoU6REBGonGs84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791365801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgECiuSHOc97TgFEPAMUyz18J8VIRBtN9EGbyBJZgIs=;
	b=EqycrwHhc7M/RGch8jreYzz5/LwxK6AnfTYLR6+PFwZU/Io76imEQgZpImGAIhZLUm7s4j
	G+JArVJtmbF2UwDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1987E13B98;
	Wed,  7 Oct 2026 09:36:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9oTPLKgSxmpMDgAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 09:36:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] ALSA: hda: Fix potential UAF for gating jack
Date: Wed,  7 Oct 2026 11:36:30 +0200
Message-ID: <20261007093638.1049688-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007093638.1049688-1-tiwai@suse.de>
References: <20261007093638.1049688-1-tiwai@suse.de>
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: AA3EB1F85D

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

