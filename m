Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4863B489FDF;
	Mon, 12 Oct 2026 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808996; cv=none; b=rlp+WwhgTp60M1ha9Y/Rhq5QmuV/tpKHUwQzx6FFvKeDHTZ/hIB6u7STWY1e2OIF6j00QsYajFeZP1v/8tI4Fbb2vAI6n7kAN7ujQ9yuK2/Lm9wNQf0SzZGJtcodKMgXhdaVg34tuxOj2Dz/RbvXyXcJsy3R7q0oZOxO0Wob1Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808996; c=relaxed/simple;
	bh=yd9XCpePUFTbj3ztof/0OIsd9d6ic7REugJJlr1ssUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=umKEJPQ+Ozp4tivHGufGEjJrGGOdn43p8yX+jfUjJJtPeyHtXKEykf76+t/iFye3mGxbDqSDcGKh+2ULUwZrKDuTtvM0uBy8VrR6iTR5GvCi6AAlB1OON4s1go/cx4RVDm6tafFlN9gYDyp3mYWOXgU7sr18X75eQkZR4IIvl+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sandropischinger.de; spf=pass smtp.mailfrom=sandropischinger.de; dkim=pass (2048-bit key) header.d=sandropischinger.de header.i=@sandropischinger.de header.b=pMoqp27Z; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sandropischinger.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandropischinger.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandropischinger.de header.i=@sandropischinger.de header.b="pMoqp27Z"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4j3HF92pqGz8vHt;
	Mon, 12 Oct 2026 14:43:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sandropischinger.de;
	s=MBO0001; t=1791808989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mR+S4UW7kruCIJFGIhX1Kx2YXojD+47ZrZZXwlLJ10U=;
	b=pMoqp27ZvKRBZ9Dy06/COxz2Iw/NXtKvruwzPWYCSP3UVqmDi8HszjxI8BEiW2PEN6qcgG
	XgmklvG58Tjdeote1IZE5EAOyb4IcY+IVZQtvNwTs8XKLHqA10hhNrz2s7bId1KZ6WMHqc
	vw2QkXwyB0uyR6caGQQfNDNmYbpjSPkNnUNm1xVsNZbgZnm7kcmcqOCfP6al1tn9VLNnLF
	KdcbSUnZFz5a5tYMjuX2NXkXFjruzKQNBZgLCWZbEDfOgbuhKQD4IIFrTDqM1twTlTOAZ9
	2sL77uF+7Y8/3TrE6A/k17VLaGDmCLpw5S/Z/RI0B+iGUtccawmEa28bYas7vw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of mail@sandropischinger.de designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=mail@sandropischinger.de
From: Sandro Pischinger <kernel@sandropischinger.de>
To: tiwai@suse.com
Cc: perex@perex.cz,
	john@metanate.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sandro Pischinger <kernel@sandropischinger.de>
Subject: [PATCH] ALSA: usb-audio: Add iface reset quirk for TASCAM US-16x08
Date: Mon, 12 Oct 2026 14:42:55 +0200
Message-ID: <20261012124255.10485-1-kernel@sandropischinger.de>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4j3HF92pqGz8vHt

When suspending and resuming the playback stream, audible
glitching/chirping appears on the audio interface's output for several
seconds.

On playback stream resumption, I observed an increase in feedback rate
up to 48,038Hz. This stabilized back to 48,000Hz after ~20s.

This is mitigated by applying an interface reset on stream resumption,
as introduced by John Keeping on the TASCAM Model 12.

Link: https://lore.kernel.org/20221129130100.1257904-1-john@metanate.com

Signed-off-by: Sandro Pischinger <kernel@sandropischinger.de>
---
 sound/usb/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 7cd806e9611b..8393a0af7b40 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2578,6 +2578,9 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x0644, 0x8044, /* Esoteric D-05X */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
 		   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
+	DEVICE_FLG(0x0644, 0x8047, /* TASCAM US-16x08 */
+		   QUIRK_FLAG_CTL_MSG_DELAY | QUIRK_FLAG_IFACE_DELAY |
+		   QUIRK_FLAG_FORCE_IFACE_RESET),
 	DEVICE_FLG(0x0644, 0x804a, /* TEAC UD-301 */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
 		   QUIRK_FLAG_IFACE_DELAY),

base-commit: b40a5f6d0e2a2b27b29d59d55fc92c5b9443e77c
-- 
2.56.0

