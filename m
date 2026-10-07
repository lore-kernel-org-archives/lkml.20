Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35623395240;
	Wed,  7 Oct 2026 21:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410220; cv=none; b=ssX8Jl7gcmwXQGustoNTJSjez0Wn1Gerb92JWtjIjG+6BFaKyXpefxI3LcdsSuyaD4MalTwsQP7A5VeYCA3f67N7g+4vh9ymicNub01l6EgalWfLH3F657lAPEjdxW8x/BCBxcEy8Hs5jfay9RcxBnYoPqVqc4DwP3TydzrMHR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410220; c=relaxed/simple;
	bh=/gDVWSMZvvn9ZvHlOCRxef0gdw57AyOMeNCztcywuuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gp/1MVjK9xuQQ8Qn07bng0Q20/t3gqawnC4ufFuMKP81ac+LfdnW9lxUepm2qyHsrp3x7w4ULrNye+178qMUnXI/6H20xHkEbw524Dez5NBj1djen+//Gl/HbBLiDpf+2lsqqL14qEjV+6Nf/axeDt+3U4ol5U1hxr9B5K5lkBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZFDTcNSJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2AVF/0GM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZFDTcNSJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2AVF/0GM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZFDTcNSJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2AVF/0GM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZFDTcNSJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2AVF/0GM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 67CD321C05;
	Wed,  7 Oct 2026 21:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791410217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7k3dckbXa8devE1mNxSygfKh6FIlRpk1iCebmHqg9TA=;
	b=ZFDTcNSJyO6R/4pbXz7BH1SR/jiT1eBdgNz4IAFNVvOuxWNEI2/wuUFMzB0CGTRR5gp6VP
	eA7cYUCfHzX0DBvSzEgj7FaSfm+JZIIF/J2BXibzQ2i5mwoA2QOwjswS8hVvJrBIn7PM9Q
	F2mOLEL1dtTTs4ER0ksVnttSNaMFoXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791410217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7k3dckbXa8devE1mNxSygfKh6FIlRpk1iCebmHqg9TA=;
	b=2AVF/0GM+WLhH+J6KI3FipeTT2uNKo7YBkIyGvsald2rWQIk9wpZb3fKjn2ei6xFO4JnbN
	feojSh1kaoplHvBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791410217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7k3dckbXa8devE1mNxSygfKh6FIlRpk1iCebmHqg9TA=;
	b=ZFDTcNSJyO6R/4pbXz7BH1SR/jiT1eBdgNz4IAFNVvOuxWNEI2/wuUFMzB0CGTRR5gp6VP
	eA7cYUCfHzX0DBvSzEgj7FaSfm+JZIIF/J2BXibzQ2i5mwoA2QOwjswS8hVvJrBIn7PM9Q
	F2mOLEL1dtTTs4ER0ksVnttSNaMFoXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791410217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7k3dckbXa8devE1mNxSygfKh6FIlRpk1iCebmHqg9TA=;
	b=2AVF/0GM+WLhH+J6KI3FipeTT2uNKo7YBkIyGvsald2rWQIk9wpZb3fKjn2ei6xFO4JnbN
	feojSh1kaoplHvBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDE2B13312;
	Wed,  7 Oct 2026 21:56:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DGVtGSjAxmr0JwAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 21:56:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ALSA: hda: Make hdac_device.registered a plain bool
Date: Wed,  7 Oct 2026 23:56:48 +0200
Message-ID: <20261007215650.159871-4-tiwai@suse.de>
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

The registered field of hdac_device is a bitfield sharing the same
word with other bitfields like lazy_cache, and those are updated in a
non-atomic read-modify-write manner without any lock.  Meanwhile, the
registered flag is read from the unsolicited event worker
concurrently, so the concurrent updates of the neighboring bitfields
may race with it.

Convert it to a plain bool for avoiding such a subtle race.  Also
replace the assignments of 0/1 with false/true accordingly.

Assisted-by: LLM
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hdaudio.h  | 2 +-
 sound/hda/common/codec.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 285f7c4d262d..04fd4794bcee 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -96,7 +96,7 @@ struct hdac_device {
 	bool lazy_cache:1;	/* don't wake up for writes */
 	bool caps_overwriting:1; /* caps overwrite being in process */
 	bool cache_coef:1;	/* cache COEF read/write too */
-	unsigned int registered:1; /* codec was registered */
+	bool registered;	/* codec was registered */
 	bool unsol_disabled;	/* unsol events blocked; protected by bus->reg_lock */
 };
 
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index b79346d01021..c99fe61c29db 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -761,7 +761,7 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 		/* pm_runtime_put() is called in snd_hdac_device_exit() */
 		pm_runtime_get_noresume(hda_codec_dev(codec));
 		pm_runtime_disable(hda_codec_dev(codec));
-		codec->core.registered = 0;
+		codec->core.registered = false;
 	}
 
 	snd_hda_codec_disconnect_pcms(codec);
@@ -815,7 +815,7 @@ void snd_hda_codec_register(struct hda_codec *codec)
 		pm_runtime_enable(hda_codec_dev(codec));
 		/* it was powered up in snd_hda_codec_new(), now all done */
 		snd_hda_power_down(codec);
-		codec->core.registered = 1;
+		codec->core.registered = true;
 	}
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_register);
-- 
2.55.0

