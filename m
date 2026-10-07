Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7813E3DDDDD;
	Wed,  7 Oct 2026 17:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393961; cv=none; b=Yf1N1nxVi4yRETsYGwEwBfmGINu/McaW77DW1BS4h6UerMXT8SFcvOe4j7BjBsHbMNUZdgatBlzSPfszRh4NGbMM0Shmd+JDOzJDyhehvOTobN4+wkI5r5lSVCSy26VHH69ugpaU9E7PeNMdswvLfo61FFNosXGi+cPwLMkW8kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393961; c=relaxed/simple;
	bh=hVPUD6aJHHscT4NKl8KK/rHUFgbnzxt4gmsfQTasopk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIqO6YUWHcGysrBGeeXrPHxGm6qH4W1hQTyDsdMg4TVdnThNf/n4648HNarVP3/nM1oWC67e0HWFvoLx7PwzLt7ZzQA4p/rIFqfxKUdMiI9nFH0QZxiN45BpIYSmQxHN6zxZYgvtSq/mNBxai3kPNpQIVsA2QsoeJM7gT7bGuRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xa3/v56b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0VaAUW3P; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xa3/v56b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0VaAUW3P; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xa3/v56b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0VaAUW3P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xa3/v56b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0VaAUW3P"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A17F21F44F;
	Wed,  7 Oct 2026 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aUvmySQag4wouaC0PQI7x0ZCP7VDgh93id5NPqUmJE=;
	b=xa3/v56bEPY1xmDaCfitfTB8ZbMlLZecsXiVlewj2ldCSVdhfx+/U4B9ME4b0uv7CzBNh5
	rSS02WqmTSd34sktpw4EwBKaZi3AqYsYRL0CYc/eElSniGH5wafDmc+xwi+YWkoa5M0x5A
	Z7RyW9C6bdLLyt2Ja7kga7Tu4j6cNek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aUvmySQag4wouaC0PQI7x0ZCP7VDgh93id5NPqUmJE=;
	b=0VaAUW3PeYraIkCa8MMXGl8NrtyHYxsj/kQu0z8ZUIr+OfELz/uTv7WTSNOpHd4vQmjPUo
	SXJ2txdR6IHDrdBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aUvmySQag4wouaC0PQI7x0ZCP7VDgh93id5NPqUmJE=;
	b=xa3/v56bEPY1xmDaCfitfTB8ZbMlLZecsXiVlewj2ldCSVdhfx+/U4B9ME4b0uv7CzBNh5
	rSS02WqmTSd34sktpw4EwBKaZi3AqYsYRL0CYc/eElSniGH5wafDmc+xwi+YWkoa5M0x5A
	Z7RyW9C6bdLLyt2Ja7kga7Tu4j6cNek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aUvmySQag4wouaC0PQI7x0ZCP7VDgh93id5NPqUmJE=;
	b=0VaAUW3PeYraIkCa8MMXGl8NrtyHYxsj/kQu0z8ZUIr+OfELz/uTv7WTSNOpHd4vQmjPUo
	SXJ2txdR6IHDrdBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F244713354;
	Wed,  7 Oct 2026 17:25:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p6IPF6SAxmqXDwAAD6G6ig:T8
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:25:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] ALSA: seq: Don't lose partial read failure
Date: Wed,  7 Oct 2026 19:25:25 +0200
Message-ID: <20261007172533.14667-8-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007172533.14667-1-tiwai@suse.de>
References: <20261007172533.14667-1-tiwai@suse.de>
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

snd_seq_read() returns an error even if one or more events have been
successfully read before the error (except for -EAGAIN case), but this
rather doesn't follow the POSIX standard that wants the processed
bytes.  Change the behavior to return the processed bytes when it's
positive, instead.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index ba5619d0b0b0..0711a9e23b5f 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -480,11 +480,11 @@ static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
 	if (err < 0) {
 		if (cell)
 			snd_seq_fifo_cell_putback(fifo, cell);
-		if (err == -EAGAIN && result > 0)
-			err = 0;
 	}
 
-	return (err < 0) ? err : result;
+	if (result > 0)
+		return result;
+	return err < 0 ? err : 0;
 }
 
 
-- 
2.55.0

