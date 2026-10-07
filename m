Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C63D669C;
	Wed,  7 Oct 2026 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393658; cv=none; b=nPICQ6Cu5K8UHXgEtdI1QqW4bMsZ4QMfS38NrWXJbX4si3ZS3D8WuAxZ/VTq0VbTNeF10ylVkpjtj9lPnCBUhRjgfrkr0wwEnm1P/XvDNKC6q9wnXkW8M95Kr+B2q4ml5IWb5vKNPMPf58qaOhV89eymWjue7/HHzSeNBV+1uSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393658; c=relaxed/simple;
	bh=jPv63eF6snabXno7qEfL2NmSKhlkcHUqtbMade2iPpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwmJPTslaGCiR0hkMFPaqeuHwIQmsIVEKKx/KY0XNouvblzCGCOo0dnhHpqrmAi8CrJErQJ9z1ihhkeCF5RCkBOXuIog5Aw4gmdYFwZJDs2ShvJA3GHcYLcPsEzKve3tkhAKcYhBx93NGjzXMSoBqhro4AEDN4EHF5Ds+nJbX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vGkHuUDR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ElzHGwvM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vGkHuUDR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ElzHGwvM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vGkHuUDR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ElzHGwvM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vGkHuUDR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ElzHGwvM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A563B21BB6;
	Wed,  7 Oct 2026 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgECiuSHOc97TgFEPAMUyz18J8VIRBtN9EGbyBJZgIs=;
	b=vGkHuUDRAxmMcwdMcrESxDYCBtKSJ0ybZGJ+rlYCT6F1Z3o8UxEt8mdTf0zq5eghZW/xPz
	ilTsXSbQUzMqAdFuD4tRqpXfSabMkQ9quZUrSPDXHuGZtXPsw719apr9Azzd8xycIE8Fnn
	ay+T1IwwgCfiCJ/3mvwGI9vtXakZ+DQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgECiuSHOc97TgFEPAMUyz18J8VIRBtN9EGbyBJZgIs=;
	b=ElzHGwvMIpokgdGLzIogsbfQLfFx8O2HMbqN7wZy+1h0kLw2Wq86BqesXK0fRDZJq6XoBX
	TjQTiuac4XZT2lCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgECiuSHOc97TgFEPAMUyz18J8VIRBtN9EGbyBJZgIs=;
	b=vGkHuUDRAxmMcwdMcrESxDYCBtKSJ0ybZGJ+rlYCT6F1Z3o8UxEt8mdTf0zq5eghZW/xPz
	ilTsXSbQUzMqAdFuD4tRqpXfSabMkQ9quZUrSPDXHuGZtXPsw719apr9Azzd8xycIE8Fnn
	ay+T1IwwgCfiCJ/3mvwGI9vtXakZ+DQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgECiuSHOc97TgFEPAMUyz18J8VIRBtN9EGbyBJZgIs=;
	b=ElzHGwvMIpokgdGLzIogsbfQLfFx8O2HMbqN7wZy+1h0kLw2Wq86BqesXK0fRDZJq6XoBX
	TjQTiuac4XZT2lCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18BCD139B1;
	Wed,  7 Oct 2026 17:20:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8rcALXZ/xmp1CgAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:20:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] ALSA: hda: Fix potential UAF for gating jack
Date: Wed,  7 Oct 2026 19:20:39 +0200
Message-ID: <20261007172051.13240-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007172051.13240-1-tiwai@suse.de>
References: <20261007172051.13240-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
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

