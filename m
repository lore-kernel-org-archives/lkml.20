Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982756;
	b=KiU3/7guki2pd6Gqi71WC6uTmVoGJqm7onb3SkepwuVpMKsl56MQUhxBmQ1lOxqKQgp9
	 hStMHxWWfhcOBrKCBYGrIPfB1JaQCHJc1fbwIAQz6MVCFxTEjO7oiw5ksgbbnUXIzCpnf
	 gdkNI5hKNqG/QKieWaXiaiLK0wQotHrqq9g5CX4qeSUhsIcb9LRiKBHL3soGvefkiKQ9+
	 s76TdfuTMsVOL8A/auqXF1U8mvWG+QsNPchfV0/3Bq7WeYip9rEdVHOvJHLIu6k7YcTEL
	 2hxDAR/ct7SPQVVWf4s/1xUzTSs3w4Mb1jbv6oX637Q/Vq5xpZeqpMkNDOT5p/rru2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iVze4EoEznv1pSQRdfnYpgAcgtm3yIuH2j+tghUB2a8=;
	b=paIY+rbunCg5IfxnDrQV+5I29Ujb4B8njMb17ghpeNBn16Jn1QCoJJyMZRNALp6qiuZc
	 vYqBLFexuA/vVuUo0C1/B3FWhqUNF+tv+H3Ee290rBfWo6V8UiztfAaa42/ti10ZXSERZ
	 txrhC6qIcubhRePB5Ey2YzCWGL94sG4J2xQXlr6uuzSh15rTuAgxdpzij5hCE737VTuuH
	 bkUrioiLjHPtKulvNF1yeuBfknBIBXt+bt/o20FkEElPxIHef4msjmonx9rdeApOmjMcr
	 cJ3qGGIok4BO7gbs74h4K3hRaW2GjFqEgT/73yTx1AzQCT3Tl8z3D3uuP1S5LRNbzsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMSJOiRW;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338F0606D801
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 338F0606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMSJOiRW
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8479f46ecd8so393701a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982755; x=1794587555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVze4EoEznv1pSQRdfnYpgAcgtm3yIuH2j+tghUB2a8=;
        b=eMSJOiRW9TJ6ZNWttv7cuO89KizEVaQb3Lrp6t3QvqYGXZUzMUqU8yRUGjZbdTUA/a
         XlKyAKZLiFNVewmpqG0NTQELlotIuyjupMT0QLLMhoDTLJ3B4qSPpTI3orQhQiTkeLaO
         ssBOGDRhAb308hEo1gkdT0+GF8WqwAdW974YkcVUjsC2wR0eYYWICAGRedSjPHAo76gS
         5Ahx4c44V0vJRAkRLsoBbK1oPQ7J0L+Zc3vzZ1hUQtJRLMm/l2JMDFZtiUfQL0UUxe2x
         RL7S8TB/HyyrCFpyPlCm9Jhoow1XQQ+hLUiFFjV/3c1ZVsuBafY+I8HvzIgXpSSSu34O
         6gXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982755; x=1794587555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iVze4EoEznv1pSQRdfnYpgAcgtm3yIuH2j+tghUB2a8=;
        b=XzcmkC7xXGFVQdEi5MH1qARlCJCsjKyIzTRhGl0j8ZqN8NAe5TJr2I8aDKWc4eQX+n
         XU/tiFD3fUrOoBLHWf77Y/TARg2XkN2WMPHpkrD9R/t8IwRfebYbBe8PRxTxsETLkkPC
         txf0OhP90rjRBETUfkXaT8NwxkBuxpYRR1qIxjVMDqtyHiodSaWuFOWEPhFk3VVaMl7T
         gR9UnGW6g2jDiltnXN9hIiQLNbmw/x+TlpBpSz04zX4KKvisuyoedbX/EVM4GhHDpl/d
         wyagoCihInQNSp7vItstJEpgMqrbCTOCcV/EVzsC0BVlLOwmJNPbkbxo28f+9g/BJUPl
         uF9w==
X-Forwarded-Encrypted: i=1; AKwUvByWkbZPFpAIR37QbATCpd9HucJRJWf6KMd2E3GGPUM0MDHtYNBBMd2/5BkoZO+lI9YlERFk2/98ADLofO4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+DdbPx+rw+V0FgHvYxNr8iDrZ/wFMYt3Z5k97UJDEk7p++VUO
	2iGkcXXqOQUzqgrBGgq+tnYS/CRo4RNGamHSGKxQSfAyEXCUezgXVFl9
X-Gm-Gg: AYBFou2aZLVY5Ebta4utGcaJng4+BDmWVXSRQlkC9pNuHOoU9N+05EJMSndyXPf9H/v
	rnDnZBrmPlO12F3m8kRh3XBGbGNSPO30795J7l/wffXN+V6gGhyA3Ra11kAVzNpzRo/tVeMEsvK
	kWXXg/lGE6aCtawPKxoPExOvan3hkhKejJ0VL8qvwQLlY1LZbwC+KhTjHgugot+MgYU1aZN3yIz
	uTvK9MPZQnCv3QeOhp9gGZ2Cp+2AH5MmWNbFEqtkudxyKHPu2Vg9KZxen4gHAiZW0rAjRxOcQ7w
	PMF6ZIdSTrwPXmZhyod8YIZSFST7XJSxzsAV0m9BbhpRM2ngBeiu6Z3oGYqETDgWXJ8HHckYQ6j
	v/Uj1zmyzjXcFJUlgrdYidL55Zy3omug9YOmGtPhsf+9zVy7jfiBUPdVEFV4awGvf2LXaZQYUHq
	0BFgoWDkZPAEMWy5oRApzTLNvd+SkhDKjCO3g774oV1NS38lDxPCswo+HRrxpZCHDWyElIoqAsC
	PqTc+Ki40t/gBjz1aDjjGME6mIK/aAat2OwcctFxE5gEsCKSEFV0zvVnKp8373y1lI9RKRefwWN
	S70zgEjyVofIZfsElBDtT0bgZPwnbBfIYqaBEgn8maY2rA==
X-Received: by 2002:a05:6830:270a:b0:846:5d82:8b69 with SMTP id 46e09a7af769-85f1cf96eeemr2950818a34.20.1793982755020;
        Fri, 06 Nov 2026 08:32:35 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:34 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 11/16] ALSA: mixer_audient: Create matrix programmatically
Date: Fri,  6 Nov 2026 10:31:24 -0600
Message-ID: <20261106163129.1006907-12-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christian Ruppert <arc@gmx.li>

Most Audient devices seem to have a similar mixer matrix with many
identical channels. The only difference between devices seems to be
the matrix' dimension. Create it programmatically in a loop rather
than from the controls table.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Co-developed-by: Will Porter <mrwillporter@gmail.com>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 sound/usb/mixer_audient.c | 77 +++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index f7a422392ed1..f15f96a8b7d2 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -105,7 +105,7 @@ static const struct snd_audient_ctrl_type {
 
 
 struct snd_audient_ctrl {
-	char *name;
+	const char *const name;
 	enum snd_audient_type type;
 	unsigned int channels;
 	unsigned int hwchannels;
@@ -134,48 +134,6 @@ static const struct snd_audient_ctrl snd_audient_evo4_controls[] = {
 		.hwchannels = 1,
 		.val_offs = 0,
 	},
-	{
-		.name = "Mic 1 Capture Volume",
-		.type = SND_AUDIENT_TYPE_MIXER,
-		.channels = 2,
-		.hwchannels = 2,
-		.val_offs = 0,
-	},
-	{
-		.name = "Mic 2 Capture Volume",
-		.type = SND_AUDIENT_TYPE_MIXER,
-		.channels = 2,
-		.hwchannels = 2,
-		.val_offs = 2,
-	},
-	{
-		.name = "Master Left Capture Volume",
-		.type = SND_AUDIENT_TYPE_MIXER,
-		.channels = 2,
-		.hwchannels = 2,
-		.val_offs = 4,
-	},
-	{
-		.name = "Master Right Capture Volume",
-		.type = SND_AUDIENT_TYPE_MIXER,
-		.channels = 2,
-		.hwchannels = 2,
-		.val_offs = 6,
-	},
-	{
-		.name = "Loopback Left Capture Volume",
-		.type = SND_AUDIENT_TYPE_MIXER,
-		.channels = 2,
-		.hwchannels = 2,
-		.val_offs = 8,
-	},
-	{
-		.name = "Loopback Right Capture Volume",
-		.type = SND_AUDIENT_TYPE_MIXER,
-		.channels = 2,
-		.hwchannels = 2,
-		.val_offs = 10,
-	},
 	{
 		.name = "Mic 1 Phantom Capture Switch",
 		.type = SND_AUDIENT_TYPE_PHANTOM,
@@ -193,13 +151,27 @@ static const struct snd_audient_ctrl snd_audient_evo4_controls[] = {
 	{ 0 }, /* sentinel */
 };
 
+static const char *const snd_audient_evo4_matrix[] = {
+	"Mic 1 Capture Volume",
+	"Mic 2 Capture Volume",
+	"Master Left Capture Volume",
+	"Master Right Capture Volume",
+	"Loopback Left Capture Volume",
+	"Loopback Right Capture Volume",
+	NULL
+};
+
 static const struct audient_devinfo {
 	u32 usb_id;
 	const struct snd_audient_ctrl *controls;
+	const char *const *const matrix_names;
+	const unsigned int matrix_channels;
 } audient_devinfo[] = {
 	{
 		.usb_id = USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
 		.controls = snd_audient_evo4_controls,
+		.matrix_names = snd_audient_evo4_matrix,
+		.matrix_channels = 2,
 	},
 	{ 0 } /* sentinel */
 };
@@ -692,6 +664,8 @@ int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 	const struct audient_devinfo *info;
 	const struct snd_audient_ctrl *ctrl;
 
+	int i;
+
 	for (info = audient_devinfo; info->controls; info++)
 		if (info->usb_id == mixer->chip->usb_id)
 			break;
@@ -706,5 +680,22 @@ int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 			return ret;
 	}
 
+	if (info->matrix_names) {
+		for (i = 0; info->matrix_names[i]; i++) {
+			const struct snd_audient_ctrl c = {
+				.name = info->matrix_names[i],
+				.type = SND_AUDIENT_TYPE_MIXER,
+				.channels = info->matrix_channels,
+				.hwchannels = info->matrix_channels,
+				.val_offs = i * info->matrix_channels,
+			};
+
+			const int ret = snd_audient_add_ctrl(mixer, &c);
+
+			if (ret < 0)
+				return ret;
+		}
+	}
+
 	return 0;
 }
-- 
2.47.3

