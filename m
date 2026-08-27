Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424C23D9DB4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872927; cv=none; b=ZZT+Irwkd36XzymUjvhmerA0LD3iSJnp2aFMBIpIrGEhqjvwlcFDVmW3XMbYNlZERLZ6pUtZlnEwgRWrDGhNlVRJ/mL+R8LqLg39e9vQGR6jF9YDcVjZt10jpE0O50RIZTQG4/HafbzboYPLMSCn2IvmMMseQsNustzPFLv+E4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872927; c=relaxed/simple;
	bh=pZwz+f8Jrl4t8j4pbfuvXzvgW56/tDJ2sxBemNi0t/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Msh7BEC+nfaM157Mt7z848yQbp2yMJOmaRzTWrr/mzSKo6Nt23eREwBsYTQqL3U/oZbFwEhCgJqx3bQDGR14Zgt6RwxGAsayDy3vCGP3dWtsAckAg3+0QAe8/rwV7mOotlInl222hsVkiHlvT8auGs7QU8hvOuxu6DaKpFsRqxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emGwcFid; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emGwcFid"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4a45b3f0becso491374b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872925; x=1788477725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+4qeVVVSQESc4ddkEUc5FBIdc2XaWCbbfUsn4FAT3M=;
        b=emGwcFidEtBEBAjw0JVY3UiNYTxO5dwXsVgh+9y0WnAb0ABV/dmsyTRgtODDwGCqMy
         xBqoL5KrXoUuT7aV0tQooAqfoPHDbn30dnlDcF9ngxDsOWsG4IhKrvsdjtVDygG9k3Ee
         2GkbMb37+WJNGhIDbpmmuE1uTacARbVbvbBu9WVFFKzTF3PV3NT7AHxHcXxGRfe9m0nF
         1wrYZhbJKWatKXaFy0It52Et82JncI/wdi7MbcweXRbZIFvsTp2/engRvDHGMfW4NQTw
         2o7Fu0aVEUH6h3V3ajpdDzg3yndRCaUGzK1n2vPVHQNlWXg85Zbngr/Zz6shvHq0E9t0
         8pOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872925; x=1788477725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+4qeVVVSQESc4ddkEUc5FBIdc2XaWCbbfUsn4FAT3M=;
        b=d1+CdT+gU6KoxHoPGnbk0+HAGtCyjoLa3zDKAlJ+R6zCBAu033jlD8bZ/YmCS1wr1B
         OpgkQMM4vpyF8rC8UyiDcRN7XM56QsRKX6lONSWoo5q8S9wl/xaT/uWuq/ESqx0R/i16
         6iZu/MjeGYY0RB0kZ5mYcq9KAv2YmIZQKZh90cbZDJwNNoGgknLrvdrYiSBcDFgPd3FN
         E/9wIbZPw71ZnRgHFJJAmuLxf7bEXv6aSG/OEYeq9mUrwHlkoZjZvVy5D9OILJiP3gy0
         13FBNYNObj/mbLICOVU0y7GU/QyKzwTLUlwcbSEcRcE1HeDSVCAbtJ1x5sqBDPdWKvoo
         4DeQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0HdIySB2m/imLUg1+eDj4Km7Ssq1YLyw4TZyMgYm9tl+WC9ImKpjkQm094s1QlX5hyBbTRmO1g6+ICQg=@vger.kernel.org
X-Gm-Message-State: AFuF++nNWm2gu/5wLsIsfT/l+K3Bz92YlDwGL2QIkkcmV+WASNaBV7UT
	3x0vI83OHjVcJgaBqGVHhdm0+16QBXKtNY9mPQEaBFX0Ardi1CH3GdRh
X-Gm-Gg: AR+sD10yXACT1uvMG147shVvwIs844r/8h7OU84Cnwb4wLo0XPcr+VziHjokA67q+FH
	QggIaLMRCZIcc33LknPn3ntNTcBeJcgXSDTYOohPB9JIVmbmOIzHxCsAwBaAf8CnUruT/sUt8vQ
	xuP2YQyiV2NA1BEk3UrqdxYjY60WC6lVZsppfpMsg4XcwIVufy7GV6XBwh7GOEGahCoz/y+D5EO
	99NH/DDcRLejdcIs0XpejCd9Dm+cCV2Yl7cKVUofJbFPHH13IUH5Ojiyd8LQQ/rFPZEZAjCMca2
	tQHt+szWafvnGL7Jbm3QNiYHVJGtvkE3E8s/N7V6NiEctSVoGfC+q/6RM/CHe8nleXYQBdyMFVe
	g++SX1BZMGVA78L2cyTpHi5m9nmUzjPaWj2hGeSO2zM4hFfgNMaBzLSr0m97IgibIWQrX2PSWpx
	3Lq3sGBeMG+TVbvaGFw+Vb9zfBkx1lph4Dt3XQfnxUx1wZCVtlx52f+9VMcK7JuvRz6nSaaLAb5
	E9kpw==
X-Received: by 2002:a05:6808:538e:b0:497:8f1:df07 with SMTP id 5614622812f47-4b398038bdamr3195085b6e.7.1787872925030;
        Thu, 27 Aug 2026 16:22:05 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38fbfe089sm1589553b6e.14.2026.08.27.16.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:22:03 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Asahi Lina <lina@asahilina.net>,
	Chris J Arges <chris.j.arges@canonical.com>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Detlef Urban <onkel@paraair.de>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>,
	fenugrec <fenugrec@mail.com>,
	Frederic Popp <frederic.l.popp@t-online.de>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Shipei Qu <qu@darknavy.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 6/6] ALSA: usb-audio: Guard FCP protocol transfers
Date: Thu, 27 Aug 2026 18:21:43 -0500
Message-ID: <20260827232143.149197-7-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827232143.149197-1-mrwillporter@gmail.com>
References: <20260824230302.27965-1-mrwillporter@gmail.com>
 <20260827232143.149197-1-mrwillporter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FCP meter and hwdep operations issue control transfers without
preventing runtime suspend or disconnect. Protect the central
request-and-response transport. One reference then covers the command,
acknowledgment wait, and response.

The initial step-zero request bypasses that transport. Hold an outer
reference across the complete initialization sequence so the device stays
active through step zero, notification-URB setup, and both initialization
commands. The central transport keeps its guard for calls outside
initialization; the existing active counter balances the nested calls.

FCP has no private resume callback. Its suspend callback only removes the
notification URB. Taking the initialization and transport guards under the
existing protocol mutex causes no resume-side lock inversion.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/fcp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index 5fc2131b4561..68bb7eabf107 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -191,6 +191,10 @@ static int fcp_usb(struct usb_mixer_interface *mixer, u32 opcode,
 	const int max_retries = 5;
 	int err;
 
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	if (!private->urb)
 		return -ENODEV;
 
@@ -1026,6 +1030,10 @@ static int fcp_init(struct usb_mixer_interface *mixer,
 	struct usb_device *dev = mixer->chip->dev;
 	int err;
 
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
 		FCP_USB_REQ_STEP0,
 		USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
-- 
2.47.3

