Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982759;
	b=0U4wjzoHSAkoiAkKxMwo6e7v2MNIQdZNoOegQskojosgi8GENQpJ2F+DNQXmqB8pe2Lh
	 7IGC+gRibI3/ADbRBB7D2ml0vKLL9kdYvlary1Ov/gnVxTfT9ADL9y6kJdTEOM1qttQJO
	 mshBE7KvH1os4i+tW9moH4gPmJfb256+pZWD3Hh0f6XY/HuHuGM1f30QttQbeWvgPcS8W
	 hFgPw+PqXWL+7PD464qV2upViVs7YYYJEzBLcs4C5y0ZFLr7Kz2Rl8zauEjsDi9wM5fiu
	 ff7QtOvCYJt2X4R2mM7pP5CAH9G1mUiY2r34m1fCAr4ONr4/R+rTkMudnvuj40hc2RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W6wDRrKYlvSdFdo/6Pq43f2CydF0lOpQke8PFneBF7k=;
	b=jDcr0ZuEnWaDalpxoe1kqV3jQHGaIqHCOIM/EmtE5Fz9c/8oRb2qrjupWCiQjDESZlPm
	 XGfsyOHnemux8Vo3kTU67AaNZdwtRvokMrlFE9IyGltfk1ivAMlh2TGriK0HphHFC/5p0
	 VQWE52weCHjjlbBCxzZDzTlKyeCbt6WGnbdNh94/UuO+goVrGS9MZgZCMp088gV8foBrj
	 ZZZ1S47gngolt31oz9Fu4w+tD4IOj1By27t+dX7wANdYuUO8G94gxU0KHz8z8fOP9UxuR
	 Y7jggf+aP/7SvS9jnAgoSRzpRlBHmDusfn8zfWGUBWcrvHutdwKbsonlRU89oF/+GeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zdk7R/cd";
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19CF6082BD1
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B19CF6082BD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zdk7R/cd
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-84a248254f4so512286a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982758; x=1794587558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6wDRrKYlvSdFdo/6Pq43f2CydF0lOpQke8PFneBF7k=;
        b=zdk7R/cdAi3Tcf5TOPoUk1ckl7XL60ET29u7HpBrVCosyQdnjKUFOxrn/k1FAdIuX2
         XPf0KkoZeL4IpSOb7v6d5eiwCDHWuH969J597BoUnIsES5KYQgAds0bvO7wJMgNQi3BS
         QYSypnhldRMTo0fjFwuImFH8XpxWhx3VYxaonUqGzXEKZtpVWwIiScjwmr8bMemOSDXA
         BpM5MZP+EZZWTVQ4WdOpeWNH82Am/9yjubWqluM08hbZfkUMMXK0uF459NV2aYvHdFhv
         mJWySTHFe/gDXSr4pAlti/Dyb3XrugjgUJk5Ru+U5Hxypc/qbicg0kBsoJMrhJaQGDL7
         E4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982758; x=1794587558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W6wDRrKYlvSdFdo/6Pq43f2CydF0lOpQke8PFneBF7k=;
        b=Y5S6oXiCpXgggtdLpF48Of9/i5vBo9IpASraOooWCV14jHI/+QOaUWpY7EyaPQASe/
         gOUSYwfpmN0fJq/DzVuqRhKoI/kyXKqSZm8jrb8BzcS1AK6qD9PqNtOKHTjmT57VhJ7X
         h7/rmOfCl3ILMiyWL8lcIMlyI9t0GeiSeKAlUyVo44AMT9P7Lav7spHlhoZDBotwoQ/h
         /deKFNQWTc7/rtx/8vck6JZN4WE1GZymHAxBtfsu+iRJYE5tgvXtUB3XmhEvC8SJCP0a
         ozGKI0urSbz0VPmtnjlopf2p7f8dfBwY0yqbAso9moot7ICGCgQBmj0c8sQuLxLGkNE/
         ohkg==
X-Forwarded-Encrypted: i=1; AKwUvBzoXc0/2jUdBV8M0Q2TOKAxkVp8gk1+cghp0MwjioQ3Q34GDwxb2s480wUr3DBrjKBD6ji1Q32n7mdtbUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mKm32nBSPSmNIL7G7TglfagfNJXGG9bIrjOI5/xQtG4q9hLHh
	Hgd9vf1UNbgXHh5XsRjpdMdhL6hcHtVcUNlkfZlouP9IXRweOqyPtQxrFnM/wQ==
X-Gm-Gg: AYBFou22b6XNwt7tZHs9Wf9O/+6wI1TsDaEjNFfJrTZ8W+Ykz+7xNv7TTt95jYZtb81
	eG54ijw1kxuno0JswqDRaVP3OUCrgO03NPRNsXISKn7cVxATD0ChcfVvczZhDEvwMZ/PXMd2bx7
	lNWdFZQ+snbxYcJI3g9JKvoYsKI7iL/1+7lzByt05DLW8iCg8aAg2c512LIQZ74S5P2/8ylhNXt
	SLsmspwU0LzFFlW3pM8fWOq8iA239Hso6Qa7ZOt8NR5Bm/kMqUSrxgTFAoEjL1DGz33pwSAgnAc
	gkeBlmSqulCTV4f8w/bzVJBkVS0Nbj1VZZdwBFOlphqgCoXibxErVGC19vTYn2frQDIrKyXw+ML
	FBQHHA7qWuB+AJREYifBf0aA5aB0z3heTQX5VutrtAo7wlKi3hjBR5Pvo+Vyq+UiSpahWfKXGUU
	mZla37K9GwSv4pYdMK057UbmEUqq+qSOmwlNVs7sk9HVVLqnEe0QUlfF0VZcTe/YZwLJhIPP45n
	+O0KB+K3fDjEt9QWguY3PcKtVdOMtJzGyPETllq6CK+Y2F9446gob7mXcgD3Of/PDeShRRMGW8f
	tFuwl5cGmekWxENIZrtcd1WRD2rCyqVgA4CV7OIeFCQVWg==
X-Received: by 2002:a05:6830:2315:b0:843:cc20:9d07 with SMTP id 46e09a7af769-85f1d03b0d5mr3147810a34.16.1793982757769;
        Fri, 06 Nov 2026 08:32:37 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:37 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 14/16] ALSA: usb-audio: Give the Audient iD14 MkI its own mixer map
Date: Fri,  6 Nov 2026 10:31:27 -0600
Message-ID: <20261106163129.1006907-15-mrwillporter@gmail.com>
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

The iD14 MkI (2708:0002) and MkII (2708:0008) share audient_id14_map.
Later commits add MkI vendor controls that replace some of the generic
MkI controls. The MkII keeps the generic controls. Give the MkI its own
copy of the map.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_maps.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 98b4146216ae..7795a5fbe382 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -526,6 +526,12 @@ static const struct usbmix_name_map audient_id14_map[] = {
 	{}
 };
 
+/* Audient iD14 MkI: model-specific control map. */
+static const struct usbmix_name_map audient_id14_mk1_map[] = {
+	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
+	{}
+};
+
 /*
  * Audient iD24: feature unit 12 ("Speaker Playback Volume") sits in the
  * monitor-mixer branch and does not apply volume to all of its channels;
@@ -638,7 +644,7 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 	{
 		/* Audient iD14 MkI */
 		.id = USB_ID(0x2708, 0x0002),
-		.map = audient_id14_map,
+		.map = audient_id14_mk1_map,
 	},
 	{
 		/* Audient EVO4 MkI */
-- 
2.47.3

