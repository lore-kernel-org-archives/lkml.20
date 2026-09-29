Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEAE51EDF6;
	Tue, 29 Sep 2026 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684176; cv=none; b=DKMlfVbaO0Z7Cbh3W9Rt0vWEp9glEj3ttKZLl+o2m5d8+XWjeeJJOO7hVnm3V+9vp6hxBuyaABGcZzyF6GzZw/EOQ2YJ9BrtDX6O0wbzro8j4zcxt/oAsM17zivMVAO8nstLKjH9SVFcyF6/J3qNPGS69cAfhX4kRKmL/+V0Ihs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684176; c=relaxed/simple;
	bh=EHHw3WZYMo437CUV36ha+eA2jPP5CcmhhsmGbIsOMyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CxQA/eqAwfjYOloH28piQQNcF4A/5xFQEECnFOeyVmyI8Vd4Aag96mj9WF6V+p4sNX2LUWgJdFXED+L2iIwUzo5+Vw2co9VD3giAlcErfAu7qpjAD+gEPmoY/xD5VZYcqojJPmRdX5g0lQe3Q45rlTUCgIc0sEDtRRD45zyCymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IZ6ziF40; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cP0P+aoz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aufpoIR3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+FbubgC7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IZ6ziF40";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cP0P+aoz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aufpoIR3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+FbubgC7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9C68721D8B;
	Tue, 29 Sep 2026 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790684168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQ7QVqru6oj0/ge5rg31/yW7S/braO0UjY+G2aI4aNA=;
	b=IZ6ziF40ysIRDhaf+Q/8yy0jbpqqg84EiVb0BD1k+grivOh/uvEgJe76PjeHTYR35MdTNE
	1sNHhuavrvY74oHArJ8B6hoGeQCTQGofdD/bjH7h0il7p8M81pDjEpXnpOUnojshroNhQX
	foh/6fhh+8ggJRYAEaptIEe6JIUPEaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790684168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQ7QVqru6oj0/ge5rg31/yW7S/braO0UjY+G2aI4aNA=;
	b=cP0P+aozUY/dwmSdLD4I7k/07udeDvi8gzxxOLHWKXi82d0qLMUnQgS9VMTLmM0PKIJdCN
	jO43L6lnsSG/4UBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790684164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQ7QVqru6oj0/ge5rg31/yW7S/braO0UjY+G2aI4aNA=;
	b=aufpoIR3w2hZsut0qBT9oaViJ4cIW0nmE/ujcCJzk20u5xouPzdSP8inOE5sH90+h1lRu8
	KJee7HIkjMysHSKmH6UYq2EgxvIw7nCZhY043D7jRqnvmWmjaMqcB0SE80EHSrqcrh0W+f
	jRyoduwjks0mWKiC6dEHruH/ymtG4/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790684164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQ7QVqru6oj0/ge5rg31/yW7S/braO0UjY+G2aI4aNA=;
	b=+FbubgC7zJiDJII8XOhxmpw/HI5H/KtJjDTG7H0zA9hS/Xh2B7YunWQc6CGK3b7CtO7cmJ
	nbqAmTL6wEKNU2Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6BA49136E4;
	Tue, 29 Sep 2026 12:16:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DPV9DQSsu2r/SgAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 12:16:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Zipdox <zipdox@zipdox.net>
Subject: [PATCH 1/3] ALSA: usb-audio: Check mixer matrix size for UAC2/3 at parsing
Date: Tue, 29 Sep 2026 14:15:54 +0200
Message-ID: <20260929121558.1464094-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929121558.1464094-1-tiwai@suse.de>
References: <20260929121558.1464094-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

The matrix of input/output channels specified in a UAC2/3 mixer unit
must fit to the upper limit 256.  Add a sanity check and returns an
error if an invalid size is detected.

Link: https://lore.kernel.org/d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 33a6a1281410..ddfd7e01a3ef 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2436,6 +2436,16 @@ static int parse_audio_mixer_unit(struct mixer_build *state, int unitid,
 	num_outs = err;
 	input_pins = desc->bNrInPins;
 
+	if (state->mixer->protocol == UAC_VERSION_2 ||
+	    state->mixer->protocol == UAC_VERSION_3) {
+		if (input_pins * num_outs > 256) {
+			usb_audio_err(state->chip,
+				      "invalid channels for MIXER UNIT %d: input=%d, output=%d\n",
+				      unitid, input_pins, num_outs);
+			return -EINVAL;
+		}
+	}
+
 	num_ins = 0;
 	ich = 0;
 	for (pin = 0; pin < input_pins; pin++) {
-- 
2.55.0

