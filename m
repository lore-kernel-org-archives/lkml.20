Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13224FDA69;
	Tue, 13 Oct 2026 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893140; cv=none; b=FJCUXQEVUcN5QPpCarYWDCsw/Q/6A/d88K4YhjiH4FofwVRt9oOW55y6tmgp4mQRmG2DRUoU3+ZyzhoFeeRfUEV2g3uCS8Ngji46SKb3ljMY3HNyppefDlh2IJHcckx+wDz5kJ7IDAULBqy6teTu3QZy56l2BV6cNHaXRfIZFew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893140; c=relaxed/simple;
	bh=DdRxdr0HTC0HVefSLzsLb/t/15YFm3uNtCDw72bzBLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YYKcXc7DsctlqX0KcMJV2tF2be9Bgf9hsdDPkgBhCpWNSzwO8nFiuicFWJh9ihvjAITQAYRqeFPl0quuP+owCCCQIw6nHAjicKHh8kAvIu2CQodyYuM8siAjh9GHN8bxDfFa2PzWX8m9RIVfM/46BiW0vlFokERwCLHDUezgfL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pIM+eY30; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6QsaapUr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pIM+eY30; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6QsaapUr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pIM+eY30";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6QsaapUr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pIM+eY30";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6QsaapUr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 11B201F456;
	Tue, 13 Oct 2026 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791893137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZahB8nmqLhDqfocApO4YiysFFjn/5hT3VlAq8+Hd5o=;
	b=pIM+eY30n8V1C61vr3HlggZhKxptBX9ZvRI2qdsfvnt+k6g1e1/XOgACiCfrbMd1Xb17ly
	pGQkN+/UzCCjtfIaz5+Za16q6w9afcoU6pXqtv5TX6TzaeITpQV5Cs41IdiSVG5dplOUvn
	7TiyfehkjaOAPUQ4o5HZcKku5lh/LN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791893137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZahB8nmqLhDqfocApO4YiysFFjn/5hT3VlAq8+Hd5o=;
	b=6QsaapUrsuaCQdTjfmGBiyzSkYWasOuQtVK0daVYphyn5Sal7CnzBgPONaiy+/x5ebBrZ4
	wfOJ7f16EIpPsxCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791893137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZahB8nmqLhDqfocApO4YiysFFjn/5hT3VlAq8+Hd5o=;
	b=pIM+eY30n8V1C61vr3HlggZhKxptBX9ZvRI2qdsfvnt+k6g1e1/XOgACiCfrbMd1Xb17ly
	pGQkN+/UzCCjtfIaz5+Za16q6w9afcoU6pXqtv5TX6TzaeITpQV5Cs41IdiSVG5dplOUvn
	7TiyfehkjaOAPUQ4o5HZcKku5lh/LN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791893137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZahB8nmqLhDqfocApO4YiysFFjn/5hT3VlAq8+Hd5o=;
	b=6QsaapUrsuaCQdTjfmGBiyzSkYWasOuQtVK0daVYphyn5Sal7CnzBgPONaiy+/x5ebBrZ4
	wfOJ7f16EIpPsxCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A63E813432;
	Tue, 13 Oct 2026 12:05:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6Ox+GJAezmrxFQAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 12:05:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ALSA: jack: Fix kctl free at error in snd_jack_kctl_new()
Date: Tue, 13 Oct 2026 14:05:22 +0200
Message-ID: <20261013120528.52586-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013120528.52586-1-tiwai@suse.de>
References: <20261013120528.52586-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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

When an error happens in snd_jack_kctl_new(), it tries to free the new
kcontrol element via snd_ctl_free_one().  But snd_ctl_free_one()
releases only the memories, and the internal linked list and hash
entries still remain, which may lead to bogus accesses to user.

Replace with the correct destructor, snd_ctl_remove(), for clearing
the whole resources of the given kcontrol, instead.

Fixes: 9058cbe1eed2 ("ALSA: jack: implement kctl creating for jack devices")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/jack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/jack.c b/sound/core/jack.c
index 5cc9c42de981..d9132b885ea3 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -453,7 +453,7 @@ static struct snd_jack_kctl * snd_jack_kctl_new(struct snd_card *card, const cha
 
 	return jack_kctl;
 error:
-	snd_ctl_free_one(kctl);
+	snd_ctl_remove(card, kctl);
 	return NULL;
 }
 
-- 
2.55.0

