Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4524A2601;
	Tue,  6 Oct 2026 17:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308424; cv=none; b=pBvwLJpveCHND92YzVARAoaoGcHeNQd2c2ANjgwSsVmb5bUWKPA3Uddg2siutqgqfK00C0X657e3LH5LhT91au3dAkDN6z7cayKbUEMQXIIPAaRRA+fJBA/LqnIGeutNa4C5n+Ow8l/Bf8neLAVMpelWGcf6mBxvDtrTkUWe+ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308424; c=relaxed/simple;
	bh=hVPUD6aJHHscT4NKl8KK/rHUFgbnzxt4gmsfQTasopk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZAoD+J9YAJPGHd9OGjRd0qYGQ7S1tUkcu07qsQL+Hbxf4X5nmammKiRuU3GjnkYgnpGxLfn3aDjgAm5f50SBvybgwbmuer+fY5sRaKzXzXenXs0DgOiW3j8vpK7qM2e96hxEKwX3rkAeqmk9P8npIBddmQiqegBhjkxDeEhVoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XaI+UI7f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xGmsj8i8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V4Uhcwo1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qeGFrjeV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XaI+UI7f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xGmsj8i8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V4Uhcwo1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qeGFrjeV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 76F021F449;
	Tue,  6 Oct 2026 17:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791308416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aUvmySQag4wouaC0PQI7x0ZCP7VDgh93id5NPqUmJE=;
	b=XaI+UI7fVSXOhEcrK2/K1GMAk0ZJuGThhORW4WvJkgzhUOYhJOM+kEYhB1yoHzCAA2FeP+
	bMthJWEeujMyPlcDamwazG0R2AKdnDZ4w+9kQgRKfaCIfpaoM89DKUVSVm+vC7jem1XDa+
	6JDRRAzJSpQxWZc3hgaP/G48CVaxxPY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791308416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aUvmySQag4wouaC0PQI7x0ZCP7VDgh93id5NPqUmJE=;
	b=xGmsj8i8ujvV16xi6mhKjzl+kjZHz9gz3kyDU28Pj7XDlN5Tj0LuIvZmzhE1PwYWs3aTjR
	jgRfW7TEaCxRe3Bw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=V4Uhcwo1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qeGFrjeV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791308412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aUvmySQag4wouaC0PQI7x0ZCP7VDgh93id5NPqUmJE=;
	b=V4Uhcwo1Yi5v2bJzuVn3oWAwAgbiw93QEf0yvizUs1ZW3XNNkv0eWUnTM3H86wa+fdsy9S
	ss9J++taBHZh6n79RGXliZ8av86vzplRgiDnQE3PPQLBshdjGutlsiXGErT6dPaK7t2igW
	BdRxmdh8zMhfAIsIxT7goZ+GePWA/Tg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791308412;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aUvmySQag4wouaC0PQI7x0ZCP7VDgh93id5NPqUmJE=;
	b=qeGFrjeVqvVr+qqNhmgsVhKsta12U4h92vigurCcFDg0PGdJpcRb/MuIlNuFVZ7gNIm+oe
	/ajgdq1wOV70+LCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11CBC13B86;
	Tue,  6 Oct 2026 17:40:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qpimInMyxWr1eAAAD6G6ig:T6
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 17:40:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] ALSA: seq: Don't lose partial read failure
Date: Tue,  6 Oct 2026 19:39:57 +0200
Message-ID: <20261006174002.703431-6-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006174002.703431-1-tiwai@suse.de>
References: <20261006174002.703431-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 76F021F449
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

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

