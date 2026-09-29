Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E451AEC7;
	Tue, 29 Sep 2026 12:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686450; cv=none; b=KHjkYbsHA1eoTEZRgqsQ4J5Qjy9wWdeS8VOS0xdmArh37VP8E7cTRaie+oBTqyjLxG8oJDXxmZtlKY5dlRATaIM25aTpp8g4ZZTwfxq5uADYWztdr79vKMoXEyUnDOOOgovGVLHSCE66RfZnt0gzxGSAqAlIKWD4CKAVMUSZTK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686450; c=relaxed/simple;
	bh=LMfiSE4abXDXCuyLX8s4TJXyyDVy7Y+aUwHDICD0UEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBVe7pjUdWcnAXeoNKR2Opo7ly7V/U/FDMWi2aDrNGniju7Zx44vZebwkOv4UWiSwv4iHsXtOSvpvgMW/fCznjGE5ED6Q8VFZA8+q9VS4NuxqpthHUsKfN9lP8tb6SOGUhdMhObIpNA2hokMzAYIYmK/i8J63SqMY3edmvDCAzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mlrgHeY1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5uteV3Pb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OQUDx5v6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IvbttqMh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mlrgHeY1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5uteV3Pb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OQUDx5v6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IvbttqMh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E186021D17;
	Tue, 29 Sep 2026 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790686442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q+EFz0bdRMWok8xMIyYg+U3dPTZJ3qkJIxJCJvWGyz0=;
	b=mlrgHeY1My/zCebUeB3pRBt8IGm6xmoGUekHUsQLnaA7AkDYZa37afBmQnKdy+4nxkRb8d
	ZsGz85DWPgcDfOAnoHSDR2BubxaABkVsN63XR2vzvtCPjIeL3IjMml+cP2XcRs1gffkOzQ
	G81a+VtUf41Wx4GtlrfeytqSX0013BA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790686442;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q+EFz0bdRMWok8xMIyYg+U3dPTZJ3qkJIxJCJvWGyz0=;
	b=5uteV3Pb7TUERYYvpOlrTx7vP93OZH+0QFfOe7XTG8Hz9C3fgqy1yjQulRsu8BZVc4N8sb
	zlz5RMzA56D5zVBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OQUDx5v6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IvbttqMh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790686437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q+EFz0bdRMWok8xMIyYg+U3dPTZJ3qkJIxJCJvWGyz0=;
	b=OQUDx5v6RgRyjIdit74eUiBU8+jhUZqB3Yy6FyzsmdhV9G02ROzU8MurButImkCakJwSDf
	kKr8hAn7opkVMEnLMRuoUPTlpR/SjIeXEIz6bd50jeCxCQ9b0s/nCuK3TPwCMYeBQLk8T0
	Au143MJFF4uFVR5TajWpFb3A4YeyuV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790686437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q+EFz0bdRMWok8xMIyYg+U3dPTZJ3qkJIxJCJvWGyz0=;
	b=IvbttqMhFMVL7Uj4CwPNXGLSojYG961FVQ3qn/ZPLzZ/u8TkJYVu6IpdCRD9xO3s9rjM8Q
	+CfR7OG5ZsY29FAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA95A136F7;
	Tue, 29 Sep 2026 12:53:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jFGEFOW0u2q3dAAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 12:53:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Farhad Alemi <farhad.alemi@berkeley.edu>
Subject: [PATCH 2/2] ALSA: control: Fix UAF in snd_ctl_elem_add() on card disconnect
Date: Tue, 29 Sep 2026 14:53:42 +0200
Message-ID: <20260929125346.1478631-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929125346.1478631-1-tiwai@suse.de>
References: <20260929125346.1478631-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E186021D17
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

A use-after-free can be triggered via SNDRV_CTL_IOCTL_ELEM_ADD when a
USB audio card is disconnected while an ELEM_ADD ioctl is in flight.

The reproducer parks the ioctl thread inside copy_from_user() using
userfaultfd, then tears down the USB device.  Unlike every other
ALSA control _user handler (ELEM_INFO, ELEM_READ, ELEM_WRITE, TLV_*),
snd_ctl_elem_add_user() never calls snd_power_ref_and_wait(), so the
parked thread holds no power reference.  snd_card_disconnect() therefore
cannot observe it via snd_power_sync_ref() and proceeds unimpeded:

  1. card->shutdown is set to 1
  2. device_del(&card->card_dev) drops the kobject reference on the
     parent USB interface device (card->dev = &intf->dev)
  3. The USB core drops its own reference and calls device_release(),
     freeing the struct usb_interface, including the embedded struct
     device that card->dev points to

When the userfaultfd is resolved and the thread resumes,
snd_ctl_elem_add() acquires controls_rwsem without checking
card->shutdown and calls __snd_ctl_add_replace().  Because the
reproducer pre-registered the same control, the CTL_ADD_EXCLUSIVE
path calls dev_err(card->dev, ...) on the freed USB interface:

  KASAN: slab-use-after-free Read in __dev_printk

Add a card->shutdown guard immediately after acquiring controls_rwsem
in snd_ctl_elem_add().  At that point card->shutdown is guaranteed to
be stable: snd_card_disconnect() sets it before freeing the parent
device, and it never transitions back to 0.  A thread that acquired
the lock before disconnect sees shutdown=0 and holds the write lock
through the rest of the operation, preventing concurrent disconnect
from proceeding past its own controls_rwsem-less shutdown=1 store
(which happened earlier, outside the lock) from racing with dev_err().

Reported-by: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: stable@vger.kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/control.c b/sound/core/control.c
index 4199342d4ffe..535ceba294ac 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1802,6 +1802,8 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 	alloc_size = compute_user_elem_size(private_size, count);
 
 	guard(rwsem_write)(&card->controls_rwsem);
+	if (card->shutdown)
+		return -ENODEV;
 	if (check_user_elem_overflow(card, alloc_size))
 		return -ENOMEM;
 
-- 
2.55.0

