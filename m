Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143061;
	b=facoc2/AF05BWLYeq0NqSiG81sDbYoflFBxKCkFCxLTIuqjTYxADYb/X7/yHYFygKLSr
	 wq5+icARKL4BKpq/4GSBU18LxDTuh8gACzbfsafCfAGf7I2iHJ+n6NGdm3hDosp2dQfsr
	 D9n2BfsCcOT+vq0NmuobuUhb9KPwmsvNq3/XPVP+Zt6b1v4JCz3+btfXhjMXdGCpaOxQw
	 nywk382Y8rt0wGeBzDiIrQLsvt9eWf8zk8orIkC/oSFN4qX40oiLDrz9yM4a0N839s2zp
	 dlMx7LArL2M2Nwlah6St9H+ZsuQuAY6L4ECIxRFq4Z/LvbebISmBXf8pf7TqHEUJWdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4MBZrSo4M2t6N6LTFd7oh2D/UR4KwQa3fw9of3KWmhQ=;
	b=Bq6oqMnEN31uK+zVlB7HsIbPki5FtsKcN8SoFTGpuOCPaNC/RzRsC5wZ69iwkPKxtAd/
	 AIX/WkU2kZbeD8zAQSRs+46jYy6y8jr+M+h1aPVfyQ7MoxdgJD4l63TYWTJflSg58Grt4
	 Vxfl6ef5gwTJijBlBA5sSHa9vdp29ea8kRctOLrpgB3EbfB1bbIOUQX2amS1SWpxmLeZ4
	 de5fG0mm6G5eg87iHKF/6IhW7XNAVc3La46Rj/s78TLUWkfBB+zeG/7sZSz4/ZOicUM/J
	 VCBHtpVSZy4f6pg4cNbC9OAomX1KY2Sa3PT+KdZp0QjcbLoRl3ILTT9Nv9g6Ke9o6gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JL6yqpci;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0833606A33B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0833606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JL6yqpci
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so78724c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794143060; x=1794747860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MBZrSo4M2t6N6LTFd7oh2D/UR4KwQa3fw9of3KWmhQ=;
        b=JL6yqpci2uGcxbX8kiFZVEMOBrySXPpk0sE1jcRutNKEsoVJ7ipPlis6ei/0rIQMH6
         LffU4p0G7zePNOC4J19apvMk1+onRQQg2kZR0VM6A4PpQzuH4RXZcsq9v8noqewFDmHX
         PIqo0gcLd5ewogEKbjNJo5C6J9PupXIrG3Sqj9dbQeiFBMZQ89l3pKy91tLtIvE2GCOp
         NGPzhQrqaPcZwc3gZ3H3wqRqf/KEQla4/h31bI9jFRLHgSEZe77mtc3puBqoY7BC1GZh
         uBO5Xx2lkq2zXPWbGmWp+JRIX4zCOZWLnFoL/p9JUfJo7rl0ceDmiEm+zqU9rvzfqQoD
         0Z+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143060; x=1794747860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MBZrSo4M2t6N6LTFd7oh2D/UR4KwQa3fw9of3KWmhQ=;
        b=hEQcCjjGdpnkxyBcqLQk136/kX6BjcX6SQXpdWFr7S7CwEsvraldQOOiX0QeJ3Tfd5
         W4S6z2gwI3OE2O6ToYnHCc4sDlwGzBNG93GABtllIf7XMfoUIJJMTb9Z9CKDk4Yi+C0D
         SmClAEmvH08TQHVc5QLdTk6Ksj0cT3vQc25O+0Cj4WxL1IHOl9Os+J2zAEKFtrCDDtvM
         lcESrr8hHDtz7msIArsg4DrwhemmuETBHWDsto1EzBNv/c8Xyh2vNk/6SCcIidCNeMiL
         /m8pD+lsaAHgEiTvUxU1uLdeK+g03Z3imCcEe28YVXXEuXP1j9bFvzObmc12MHw41NQL
         wl8Q==
X-Forwarded-Encrypted: i=1; AL+hErEB6G3CpRlM2RZlHNHD5qTmRwhOqGNKM6EavYNBat/2o+HpJ6idHYdRmVkzPcUsm3SHMx+eSr7MplNqKuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b0bfhhZ2gkrlkfG8qkMtJ+1g0NWGbtk+WmZqsLqW4dWxq4RpW
	Q+DI2J5NkTCOY22WdGK82uWTJBuAuq0sM70K2rEUh3a2LaQsJL6nd3O+
X-Gm-Gg: AYBFou3xLJ6QI3SpskNEFtwwR2hcBozwEsdqUQEqZgTF1/9+dR7a6U1ksNZaVjSAmd7
	ZGO+L3ese/0oe7spehONz+rpJRjkVR84WexcCbKSX8oUD8zlGFINFvTco5OpMP5Zn0F9foZpUZt
	QrY8AR5ZkZ16wKQSlKb2cIDyoFK5V9f4HN2/W1pREckh6SlWfOcKN3SSwdosjUnen2d2ZdX94zB
	BfzWeHa0DKpu3RaWsm1FfO4BROmJR1GynIqU5+tIaczvdTL4h/eWlwV4vdMsU6G3XXxG7MZetbG
	swO7VWSwyZ0BPiJHtwkC53XjK4XtqyKOLnKU630tquEUyJiLZOWQw4GHShFPxCgVz476uYQYfRn
	noySutAx6+Wk8czY7XGeMFcmE25Ne0g4yKje6zUPmZZAwua7zYSeIXKGr2y2jIKtHJ5gEB8wnbD
	12+3T8IIVv8xScB5SUhgtErSG8RoPu2dkOEMUAq0sStdv0yBaqyU4o+esWXd3JH2ALJdSubOdKJ
	i8BEljCTWuPZ5douGHiwSubIYIX16a7IIY0jivAiXZQvujaJCZb6lVQcqoRsylr/OWcRBhPb5h/
	E8rhQ7fqW2K3gY/K/3I5IgkzA17Xu1yzmyIzm74aZ7eJVe0sCdQB8Cg=
X-Received: by 2002:a05:7022:3b84:b0:164:4e36:f956 with SMTP id a92af1059eb24-1b39fe876bemr2336578c88.16.1794143057605;
        Sun, 08 Nov 2026 05:04:17 -0800 (PST)
Received: from prts ([103.156.242.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm6603194c88.6.2026.11.08.05.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:04:17 -0800 (PST)
From: Xinyu Wei <xinyuwei1024@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Cc: Xinyu Wei <xinyuwei1024@gmail.com>
Subject: [PATCH 2/2] ALSA: usb-audio: fix the format bits of the Steinberg UR22C
Date: Sun,  8 Nov 2026 21:03:03 +0800
Message-ID: <20261108130303.387288-3-xinyuwei1024@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108130303.387288-1-xinyuwei1024@gmail.com>
References: <20261108130303.387288-1-xinyuwei1024@gmail.com>
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

In configuration 2 of the Steinberg UR22C (0499:172f), the capture
AS_GENERAL descriptor reports bmFormats = 0xffffffff, causing the driver
to advertise U8, S32_LE, FLOAT_LE, MU_LAW, A_LAW and SPECIAL even though
the hardware only supports 32-bit PCM (S32_LE).

Because playback is implicit-feedback synced to the capture endpoint
(0x81 on interface 2), hw_rule_format() restricts playback to the active
capture stream's format.  If capture is opened first with a non-S32_LE
format such as FLOAT_LE, the intersection with playback's S32_LE-only
format mask is empty and playback fails to open with -EINVAL.

Clamp bmFormats to UAC2 PCM (1) in parse_audio_format_i_type() when
chip->usb_id is 0499:172f and format == 0xffffffff, matching the
existing DS4201 workaround below it.

Signed-off-by: Xinyu Wei <xinyuwei1024@gmail.com>
---
 sound/usb/format.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 4830f9f93..7ca2b5d5c 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -57,6 +57,11 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
 		sample_width = fmt->bBitResolution;
 		sample_bytes = fmt->bSubslotSize;
 
+		/* Steinberg UR22C workaround: config 2 capture sets 0xffffffff */
+		if (chip->usb_id == USB_ID(0x0499, 0x172f) &&
+		    format == 0xffffffff)
+			format = 1;
+
 		if (format & UAC2_FORMAT_TYPE_I_RAW_DATA) {
 			pcm_formats |= SNDRV_PCM_FMTBIT_SPECIAL;
 			/* flag potentially raw DSD capable altsettings */
-- 
2.56.0

