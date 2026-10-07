Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D759C3D669C;
	Wed,  7 Oct 2026 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393960; cv=none; b=JmrNv7Wc4BxHqPAN+w9Fab7aUeTl9YGgZcPEx6pz6xIJAqYlPHJOHyEVC/NcptsKV9lrUk8MH9Bv/gwM04zNzNQyPt4YaAXa519n6NpZpLG5g+kt/LfUNOFK1WB/HyfgPwzwLb0mXzJSY8DneJNt29o47OPCDWS0o3E/YA4D3Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393960; c=relaxed/simple;
	bh=AJpIlvNxhqmn9XGnc9J97bI5+utbIVM4+PfI8+CvlAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EqXbMQNACw/AVwiBzZrRJYtvgjD5TB0sS91SGsd1e4dQeZpIZdHq2/1gAqze0nUE0EF8d4Jkr/hI2vfsoFkA9c2IaoLzoRuVL44OGyBJmiAnZraOjWjeM2Xiw6d2oNoLCN2OWhkPq9In5NJKQbeMfgaxLNNHRWrfySyP/sJNPG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YHmCaEXM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Kzo5aPTo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YHmCaEXM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Kzo5aPTo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YHmCaEXM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kzo5aPTo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YHmCaEXM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kzo5aPTo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1918C21BB6;
	Wed,  7 Oct 2026 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YFS1mV4nOBNSXEoN71tZkGwugBFlvbBhoS5mz/1SLWw=;
	b=YHmCaEXMMd/h3/Bj0DcxwNiT2ZTfOg2ppYomMZHgvRhFzw1vb4tvzSaJzYBxTnDdhYjn9r
	P2cI9ESfVwh9iEdC+TD+lFzE/PQHlcox0oGl/mUCPV0UisxBJsLMGj12yVXCBs5Qdr8SiD
	9qncmCOnsAsogLifOb121UG3YwzNOIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YFS1mV4nOBNSXEoN71tZkGwugBFlvbBhoS5mz/1SLWw=;
	b=Kzo5aPToHI6w3nWHWVWQl9V0C5QK0oO72O/jSEJ5jZPpRdAt7c59ISLdwwsXz577QqUM03
	Fyd5bhBYX5pAQ9Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YFS1mV4nOBNSXEoN71tZkGwugBFlvbBhoS5mz/1SLWw=;
	b=YHmCaEXMMd/h3/Bj0DcxwNiT2ZTfOg2ppYomMZHgvRhFzw1vb4tvzSaJzYBxTnDdhYjn9r
	P2cI9ESfVwh9iEdC+TD+lFzE/PQHlcox0oGl/mUCPV0UisxBJsLMGj12yVXCBs5Qdr8SiD
	9qncmCOnsAsogLifOb121UG3YwzNOIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YFS1mV4nOBNSXEoN71tZkGwugBFlvbBhoS5mz/1SLWw=;
	b=Kzo5aPToHI6w3nWHWVWQl9V0C5QK0oO72O/jSEJ5jZPpRdAt7c59ISLdwwsXz577QqUM03
	Fyd5bhBYX5pAQ9Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9558F139AC;
	Wed,  7 Oct 2026 17:25:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p6IPF6SAxmqXDwAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:25:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] ALSA: seq: Fix missing direction and ump_group handling in 32bit compat ioctl
Date: Wed,  7 Oct 2026 19:25:19 +0200
Message-ID: <20261007172533.14667-2-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

I forgot to cover the two new fields, direction and ump_group, in
struct snd_seq_port_info for the 32bit compat ioctls of
SNDRV_SEQ_IOCTL_GET_PORT_INFO & co, which ended up with the garbage
copies in those fields.  Add the handling of those two fields in the
compat layer.

Also, avoid over-copying the 64bit snd_seq_port_info but only the first
part (before the field kernel); this avoids the copy of kernel-space
garbage value in the reserved field.

Fixes: ff166a9d19fa ("ALSA: seq: Add port direction to snd_seq_port_info")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_compat.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/core/seq/seq_compat.c b/sound/core/seq/seq_compat.c
index 80110501da6f..57aaa39afb9d 100644
--- a/sound/core/seq/seq_compat.c
+++ b/sound/core/seq/seq_compat.c
@@ -25,7 +25,9 @@ struct snd_seq_port_info32 {
 	u32 kernel;			/* reserved for kernel use (must be NULL) */
 	u32 flags;		/* misc. conditioning */
 	unsigned char time_queue;	/* queue # for timestamping */
-	char reserved[59];		/* for future use */
+	unsigned char direction;	/* port usage direction (r/w/bidir) */
+	unsigned char ump_group;	/* 0 = UMP EP (no conversion), 1-16 = UMP group number */
+	char reserved[57];		/* for future use */
 };
 
 static int snd_seq_call_port_info_ioctl(struct snd_seq_client *client, unsigned int cmd,
@@ -40,7 +42,9 @@ static int snd_seq_call_port_info_ioctl(struct snd_seq_client *client, unsigned
 
 	if (copy_from_user(data, data32, sizeof(*data32)) ||
 	    get_user(data->flags, &data32->flags) ||
-	    get_user(data->time_queue, &data32->time_queue))
+	    get_user(data->time_queue, &data32->time_queue) ||
+	    get_user(data->direction, &data32->direction) ||
+	    get_user(data->ump_group, &data32->ump_group))
 		return -EFAULT;
 	data->kernel = NULL;
 
@@ -50,9 +54,12 @@ static int snd_seq_call_port_info_ioctl(struct snd_seq_client *client, unsigned
 	if (err < 0)
 		return err;
 
-	if (copy_to_user(data32, data, sizeof(*data32)) ||
+	if (copy_to_user(data32, data,
+			 offsetof(struct snd_seq_port_info32, kernel)) ||
 	    put_user(data->flags, &data32->flags) ||
-	    put_user(data->time_queue, &data32->time_queue))
+	    put_user(data->time_queue, &data32->time_queue) ||
+	    put_user(data->direction, &data32->direction) ||
+	    put_user(data->ump_group, &data32->ump_group))
 		return -EFAULT;
 
 	return err;
-- 
2.55.0

