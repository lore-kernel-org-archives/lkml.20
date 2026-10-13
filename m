Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C1A4FDA6A;
	Tue, 13 Oct 2026 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893141; cv=none; b=M/edt3ubApDXIbCVIimGo0dEK+Jv3rOu+iGuo9ijo+w6aTpVJLyWg/eBgSJA3AndWyK2lY1+8iO6/MVAKJataVFRgeWUdGlQz3IM0g9xyK04gUtxBbN1DqM4qGchVhhui+l7JJ2D7NRBmqNmMYdTvG+Vnw863n96lkm7BVsJnDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893141; c=relaxed/simple;
	bh=8Sq27bRgl/Q3cGjRtwKZRwqzCCAuPtYiJZFRP08rQmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTs9ErJd2tOQCsnt6UyzlokkEBng438zBQwOxBDVjno0NMOvYc5N/hm4hLHNvzhS8PrLBKM4afWTL+pOh3+8ycgN5Ucy/BuhbYoX5SMAQPAol4QGYGvEf+NUFXUtHBo3X6lWZL8Wb7nay0sfZP9jfkAMn8O/5qH2IsSH0R9k1dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S1QuCwH0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0ketxo8N; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S1QuCwH0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0ketxo8N; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S1QuCwH0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ketxo8N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S1QuCwH0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ketxo8N"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47C3D21F3C;
	Tue, 13 Oct 2026 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791893137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4gHwM10c6rIn+brCH12rVuLx7SAlE/cm6PF/D9AlqIo=;
	b=S1QuCwH0ISSfJELvpm9yjG/KRsqFBSmYWRb0LxznrtxJbFn21KPngLkZivUwT5gRieihoA
	Tta35azUguapOu4W5fVY+xqtw9iy+3ypGwZ4fvPvxSCf8K3kcqHFg11xisdmum5GZ+T5oK
	cTooRm9N6FuWRnhvpuIEYgQ9noMUjTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791893137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4gHwM10c6rIn+brCH12rVuLx7SAlE/cm6PF/D9AlqIo=;
	b=0ketxo8N/shrn5itnoURsefG4XLifH1gu/J0KiDfzH84qlW/HV1CmrMCBeq3tn0+h2k3T4
	A+UKnrqyUViyOdDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791893137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4gHwM10c6rIn+brCH12rVuLx7SAlE/cm6PF/D9AlqIo=;
	b=S1QuCwH0ISSfJELvpm9yjG/KRsqFBSmYWRb0LxznrtxJbFn21KPngLkZivUwT5gRieihoA
	Tta35azUguapOu4W5fVY+xqtw9iy+3ypGwZ4fvPvxSCf8K3kcqHFg11xisdmum5GZ+T5oK
	cTooRm9N6FuWRnhvpuIEYgQ9noMUjTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791893137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4gHwM10c6rIn+brCH12rVuLx7SAlE/cm6PF/D9AlqIo=;
	b=0ketxo8N/shrn5itnoURsefG4XLifH1gu/J0KiDfzH84qlW/HV1CmrMCBeq3tn0+h2k3T4
	A+UKnrqyUViyOdDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD984134E4;
	Tue, 13 Oct 2026 12:05:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6Ox+GJAezmrxFQAAD6G6ig:T5
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 12:05:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ALSA: line6: Use kzalloc() for PCM buffer allocation
Date: Tue, 13 Oct 2026 14:05:25 +0200
Message-ID: <20261013120528.52586-5-tiwai@suse.de>
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

LINE6 driver allocates the PCM buffer via kmalloc(), and this might
leave some bytes uninitialized that are out of the actual ring buffer
size, while it's still exposed via mmap.

For avoiding the leak of the uninitialized kernel memory, simply
replace it with kzalloc().

Fixes: 705ececd1c60 ("Staging: add line6 usb driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/line6/pcm.c b/sound/usb/line6/pcm.c
index f30d82cc0fc1..d17baf7761c6 100644
--- a/sound/usb/line6/pcm.c
+++ b/sound/usb/line6/pcm.c
@@ -155,7 +155,7 @@ static int line6_buffer_acquire(struct snd_line6_pcm *line6pcm,
 	/* Invoked multiple times in a row so allocate once only */
 	if (!test_and_set_bit(type, &pstr->opened) && !pstr->buffer) {
 		pstr->buffer =
-			kmalloc(array3_size(line6pcm->line6->iso_buffers,
+			kzalloc(array3_size(line6pcm->line6->iso_buffers,
 					    LINE6_ISO_PACKETS, pkt_size),
 				GFP_KERNEL);
 		if (!pstr->buffer)
-- 
2.55.0

