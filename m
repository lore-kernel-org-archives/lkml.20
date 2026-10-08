Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D9D3CB54F;
	Thu,  8 Oct 2026 19:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487573; cv=none; b=gRb7ij4dNwtDgEcfDkuwJBaiGIcoN7Wkr7EPBq0MCGrJEQh44QmpVXAP4+VdDeWbAwssfIY6YQ3CCeofAjTQtlqcbv6rWeYCGnkHrQfLagxBu6YAlOq3WXjwoGonGknWfBcK4w0VF9KV4P+0nUQEYI9XyVU4c45O/ka+9bVgWVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487573; c=relaxed/simple;
	bh=d0NyJXqUgL2D15CEPxdJvSFPK+FO//px4G4sjqWSL58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LO0eyMnjUFWctRhS8SoqJixnjXYjhapTVD7dPjx/PT6F6AbqIQ2ewdWBAk/+p91UQiqyDS4X/wAuy1HETX03Su1E5LkEHfjTM4Gakg6jCPsN4UnbGGKGw/WHiGYyXPov+lfL2iTLSxlFMcVYcm9ZKCZrQAIpHfNetc+B7bxAB7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4F7651F749;
	Thu,  8 Oct 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A3B91395B;
	Thu,  8 Oct 2026 19:26:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dQZEOknux2ozCAAAD6G6ig:T7
	(envelope-from <tiwai@suse.de>); Thu, 08 Oct 2026 19:26:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] ALSA: caiaq: Fix races at MIDI URB and trigger accesses
Date: Thu,  8 Oct 2026 21:25:46 +0200
Message-ID: <20261008192553.300025-7-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008192553.300025-1-tiwai@suse.de>
References: <20261008192553.300025-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spam-Flag: NO
X-Spam-Score: 0.00
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Result: default: False [0.00 / 50.00]

URB completion and rawmidi trigger callbacks can race with each other,
which may put the state inconsistent, causing double submissions, etc.

Guard both with a new spinlock for avoiding the races.

Fixes: f3f80a9205da ("ALSA: caiaq - Fix Oops with MIDI")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/caiaq/device.c | 1 +
 sound/usb/caiaq/device.h | 3 ++-
 sound/usb/caiaq/midi.c   | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index c68ed16d7ac4..634dc36f2ead 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -455,6 +455,7 @@ static int create_card(struct usb_device *usb_dev,
 	cdev->chip.usb_id = USB_ID(le16_to_cpu(usb_dev->descriptor.idVendor),
 				  le16_to_cpu(usb_dev->descriptor.idProduct));
 	spin_lock_init(&cdev->spinlock);
+	spin_lock_init(&cdev->midi_lock);
 	mutex_init(&cdev->ep1_out_mutex);
 
 	*cardp = card;
diff --git a/sound/usb/caiaq/device.h b/sound/usb/caiaq/device.h
index dd726ca68e80..16f65e7867d1 100644
--- a/sound/usb/caiaq/device.h
+++ b/sound/usb/caiaq/device.h
@@ -77,7 +77,8 @@ struct snd_usb_caiaqdev {
 	unsigned char midi_out_buf[EP1_BUFSIZE];
 
 	struct caiaq_device_spec spec;
-	spinlock_t spinlock;
+	spinlock_t spinlock;	/* for PCM audio */
+	spinlock_t midi_lock;	/* midi_x_stream, midi_out_active */
 	wait_queue_head_t ep1_wait_queue;
 	wait_queue_head_t prepare_wait_queue;
 	int spec_received, audio_parm_answer;
diff --git a/sound/usb/caiaq/midi.c b/sound/usb/caiaq/midi.c
index 18529484c8dc..b7d7d24937a7 100644
--- a/sound/usb/caiaq/midi.c
+++ b/sound/usb/caiaq/midi.c
@@ -79,6 +79,7 @@ static void snd_usb_caiaq_midi_output_trigger(struct snd_rawmidi_substream *subs
 {
 	struct snd_usb_caiaqdev *cdev = substream->rmidi->private_data;
 
+	guard(spinlock_irqsave)(&cdev->midi_lock);
 	if (up) {
 		cdev->midi_out_substream = substream;
 		if (!cdev->midi_out_active)
@@ -151,6 +152,7 @@ void snd_usb_caiaq_midi_output_done(struct urb* urb)
 {
 	struct snd_usb_caiaqdev *cdev = urb->context;
 
+	guard(spinlock_irqsave)(&cdev->midi_lock);
 	cdev->midi_out_active = 0;
 	if (urb->status != 0)
 		return;
-- 
2.55.0

