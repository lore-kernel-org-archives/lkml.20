Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FAE5383FE;
	Wed, 23 Sep 2026 18:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189473; cv=none; b=AlBfx6hmSqFVHvlINp9kH3S94pRjfFULDPsbAaBWEvpLiTrKRkc+Lwfi+V3uONnpN9OV70MgweccWCcm+cDmQTVoW5SEGT8e8elTar7gSlMjKgGXRJdIu0H5aVa7al7nxDKUCWpPouvSYR0c1RxY2/CitOMHYYlDidZ/IGaRyxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189473; c=relaxed/simple;
	bh=+9F3Cv07D2GWl3fSeow2TeQoS2Jiv0RHlnfNyWbwCE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hfPhcCTyuecnj79sKstx8KD2/gHNYH9k5SKv97Sw7LY/5gKuvHP/JwSWpGMiCaRQ9JqU0l/UoNqQcwX+vfzKEqkRM0OVeDHOKFRnB5FQ3fz1n43MJ0Z9d5DYsNc/3nE+fIEeDNirqKdj3fkc/nC7LHzYaD2mqMDqMrvGjbAeRnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me; spf=pass smtp.mailfrom=bojanowski.me; dkim=pass (2048-bit key) header.d=bojanowski.me header.i=@bojanowski.me header.b=Mf5PI7Lf; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bojanowski.me header.i=@bojanowski.me header.b="Mf5PI7Lf"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hqmJ43kskzMlQx;
	Wed, 23 Sep 2026 20:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1790189444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iUxof82ycWPWDfYONY+8WujcRI3XtPMSEU1EaWrHQ90=;
	b=Mf5PI7Lfv6HpMvNr+XL5S9BB+g7CxANUdggP7qATzwLXhrEttRYgwVdLJ1+6wq8nn+hMuu
	5QSZ3JYdBH6OUhtFtITx9EF8OUaOoakc698T0IQ2F6yxbb3UbMlVIPiOERwmHlWY357vGx
	1EAUcu58vVx+R5M1/S9lYzUWATY+VYZrI/m05kJPWnMSxX+fJco8iJWDEypqh+yKrkf0+a
	Rhrzmu0Ix4DzuJKMH6VqStp3FaTTEMkEUyCKDOnTpuLy9N7Zl5Y+83PgCcYFulUU+bqsJW
	dZlARs32bcsnWXS3uPAt3VcjjImXFtWelbzq9LD2YLWhCu1kZ05TM3ByB7owaA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomasz Bojanowski <tomasz@bojanowski.me>
Subject: [PATCH] ALSA: usb-audio: Add mixer mapping for MSI MAG B850M MORTAR WIFI
Date: Wed, 23 Sep 2026 20:49:57 +0200
Message-ID: <20260923184957.6687-1-tomasz@bojanowski.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4hqmJ43kskzMlQx

The USB audio device 0db0:cc78 (Realtek ALC4080) on the MSI MAG B850M
MORTAR WIFI motherboard exposes all playback controls as "PCM", which
makes it hard to tell the outputs apart.

Its mixer layout matches the one of the MSI MPG X570S Carbon Max Wifi
(units 29, 30 and 32), so reuse msi_mpg_x570s_carbon_max_wifi_alc4080_map
for this device too. With the mapping applied, the controls show up as
"Speaker", "Front Headphone" and "IEC958".

Tested with a patched snd-usb-audio module on a 7.2.7 kernel.

Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>
---
 sound/usb/mixer_maps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 41454cb40..f8e1f7803 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -749,6 +749,10 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x0db0, 0xa073),
 		.map = msi_mpg_x570s_carbon_max_wifi_alc4080_map,
 	},
+	{	/* MSI MAG B850M MORTAR WIFI */
+		.id = USB_ID(0x0db0, 0xcc78),
+		.map = msi_mpg_x570s_carbon_max_wifi_alc4080_map,
+	},
 	{	/* MSI TRX40 */
 		.id = USB_ID(0x0db0, 0x543d),
 		.map = trx40_mobo_map,
-- 
2.55.0

