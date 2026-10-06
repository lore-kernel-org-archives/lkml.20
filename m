Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D21049C4CF;
	Tue,  6 Oct 2026 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308416; cv=none; b=nWq5tqATHpoF32BtBwuZCFWJ++mRMIXNv00QUDhKmVYHDs96p5JF6RgWqOrpbe1dYyW1UuSdbfetyHhOa7iQIJyJXZ8yAW5PtSGbLQGeP+ZymFYU+FXwApE1VEerolneAixcr/JM5O0EihLaowHoeM1jXqzAUJujO98sVbV/9Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308416; c=relaxed/simple;
	bh=YR6rT6PtUvC0Y81yV6cbKlhUOmPqXljcJfsEp4ZS6a4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEUJwUZDvksZZoeOsjy8F3lnFUcK8FybUcgX0CxY0VppO9/RWN6r3RIk+JmljzEJpkyjvKtzMzLKc3oXPmw/1X2VDSF/f8TWG3vo3SWb2YMBax0plBNdk9wWdwLECywtqRcgFMJcrPh5tc3gBVXi7tOvaXLXq+4EPfNIdaAXbR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MyJQSn3x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zwjxhLuu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i5e3kDkC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n38eloKE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MyJQSn3x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zwjxhLuu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i5e3kDkC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n38eloKE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 30D9621EFF;
	Tue,  6 Oct 2026 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791308408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJDYTJyyHNrZpO84SAeaoMaZd+zXrXS3Hzd0Hdr/XOA=;
	b=MyJQSn3xtNViq85JvIRMUj2sodf9H8vZwyzSvpxsbcVrMNQgt1A/v5DTZbGGy1o5qOvTAY
	CJ5kKd/nEZP8MbjKfxlPhfSuRErqEVTZH2urwfKj09WILRT8eVT2Ja6GxJyIgWVdE/uZcr
	P97It1IfkKi0C3clfVUEKBA9sxC+w3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791308408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJDYTJyyHNrZpO84SAeaoMaZd+zXrXS3Hzd0Hdr/XOA=;
	b=zwjxhLuuZyDqDG7nJ4+ymAs4CHXXvbm64oghyr8m1rXVBIwQsqZhHAVNmlWaQ3W7/sdyLS
	xVCepB54E81vLmDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791308404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJDYTJyyHNrZpO84SAeaoMaZd+zXrXS3Hzd0Hdr/XOA=;
	b=i5e3kDkCDd+Ecd4183FHI/acOc/1JDrXdeBMhjlwIRJ+VTOpAIpRsBCc5BXWcJSqn20wVQ
	Tyh6+AxSzDM4OgoPasLDXtMtKdMRwP2+z00L9jItpyD1c10gWwmOnHR2pejBGio53Uqj04
	PFI+s/uTkVAJB6sURnOqnj0p9fYyZpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791308404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJDYTJyyHNrZpO84SAeaoMaZd+zXrXS3Hzd0Hdr/XOA=;
	b=n38eloKEL3ienaIrjU52kXl9azQ9Mbp++ONb6e9NmAzgnq/Rz5owjlqlaeMxbTJ10eufYO
	PRhd5++oQgeU//Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C544F13B80;
	Tue,  6 Oct 2026 17:40:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qpimInMyxWr1eAAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 17:40:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] ALSA: seq: Fix missing direction and ump_group handling in 32bit compat ioctl
Date: Tue,  6 Oct 2026 19:39:53 +0200
Message-ID: <20261006174002.703431-2-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.998];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

I forgot to cover the two new fields, direction and ump_group, in
struct snd_seq_port_info for the 32bit compat ioctls of
SNDRV_SEQ_IOCTL_GET_PORT_INFO & co, which ended up with the garbage
copies in those fields.  Add the handling of those two fields in the
compat layer.

Fixes: ff166a9d19fa ("ALSA: seq: Add port direction to snd_seq_port_info")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_compat.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/core/seq/seq_compat.c b/sound/core/seq/seq_compat.c
index 80110501da6f..9ea205e1f2dc 100644
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
 
@@ -52,7 +56,9 @@ static int snd_seq_call_port_info_ioctl(struct snd_seq_client *client, unsigned
 
 	if (copy_to_user(data32, data, sizeof(*data32)) ||
 	    put_user(data->flags, &data32->flags) ||
-	    put_user(data->time_queue, &data32->time_queue))
+	    put_user(data->time_queue, &data32->time_queue) ||
+	    put_user(data->direction, &data32->direction) ||
+	    put_user(data->ump_group, &data32->ump_group))
 		return -EFAULT;
 
 	return err;
-- 
2.55.0

