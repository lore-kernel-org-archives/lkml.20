Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9523DB320
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872925; cv=none; b=IyUG+vlf1ZxVH88u6TmFrutXizdY+bdC0XWspdLtXReF0U2C8N6Io0siZMevjKTtw7yTdP1QkC/AzQlC3+Cb/Ly4P77Qd9la52uvX3rbGnwYldpJCpOAX9qn2WPYK35SYVd1sAgUQLVxGX/S/N+Wfai7z7RQwtz73xKabhCTaAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872925; c=relaxed/simple;
	bh=PURQP6ZO5l8U5LecyA8nFec2CWoAEjm0KPyDK/TL9pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+LnqloI8ZL6gRdvqxwBzOVP8wSVtDzAuBkR3u/mlYu1XG2m7ozTv+LFgeMOBES0x8ZWyAg69KKKYXXKR2YrlyDOlPUEyYijrTUMysvoby77nRY3YWd6mZKZiSdcYXHciuBFawfWYpjFnw8q95MDEh3qUR+NzDqHXdwY0qMPS50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWZ9D1BW; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWZ9D1BW"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-448b0ff4a57so842294fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872922; x=1788477722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17uEs7Ned+dWqz4ZIVhnARGDREWSqKdWLg/j4K6DqdM=;
        b=ZWZ9D1BWZxBYe1ODuWt0Mtpqaz1V2Uvwn7F03fLy0019uebUeYmUkBHho0FS9SiP3D
         6XPZdUeJOG3qzk575m+gDnqIcW3V+w+B4HEUgyy1aGPFbE2pt/P2jB/7n8XQ3b8fcdxJ
         W3XXaapg92W258yWzKP07lMJ5D8g6TYAL4T5iZcf4jV2FO1pt7769A3S35v00xrmaUsr
         jC+kZhw+fzrWXDGA78IDlskuaqC67/tSBMQrcj/ApzmUK09mtMBdXs5Ztmb28VmLdn15
         8wS10InS/Ojx9tv+El7dtGyaVSgeO0FZWgK5fKuvz6JsOQe8Uo01gi9T1ckBnjxaDv88
         2Urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872922; x=1788477722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=17uEs7Ned+dWqz4ZIVhnARGDREWSqKdWLg/j4K6DqdM=;
        b=o50TPDzi+Y1H0pYBGTOinS9sUaxy4TYt+aYrrofh6ZlvfOAh7rwDCHhSVnyJsL3dTQ
         eSsuOR8QUwvSQiSoWHkWtl7e+pNYMLqflarc/YSE/LcNP5x+D5brMNorCWqXkS/erX/H
         8RjsS7C/Ye0la/fe7Qz+gyUBkZ0/Z7WwXYg36gjxdwRECD2GOyd916n1rLSk03nDIlF4
         vV+kdzsRMs6LwE1jYoYjxsSvbvfMr9b0kCRlhNXOuZqgtlPHF8Av0jVRU24N1ixV6BXv
         sBEP3Ct+2eMFNjiPhtDNX362Styl+8pU2udfDtCqSg9bw+RVk0KFVjY9jVnRNoP8NLTq
         imAw==
X-Forwarded-Encrypted: i=1; AHgh+RoGpBtNuR+XWtLT7ixz6st+LK6oeEDYfsIq1+QJf/UOAQ46f7uLTbOgGnrtdyBkf7BFgOehRyY4EPUnmL8=@vger.kernel.org
X-Gm-Message-State: AFuF++lFcg32qMah5j2KwDQDsJSz0yCjSzQmwCY9X2zTBNlqMiicBInv
	BULyLRQigpG3OJ9SJ6CilHGXqKI+Ze0H1eJnEdEA97Ym7gDaR8IToUhd
X-Gm-Gg: AR+sD1060/UlNUw6onfkD9OZH3FuMu1/xQJdsyrd4hV32ynfkhM6eCZdxg3ihRlgexp
	k+MUWnebBxflSmaqlkdRsGJMOBPwyT6HrqZ1yaGNOGfrzYvhOn8noXt8Re8ZqtQoyvIu8Jb+Gec
	13H13TLX1txJYI8udcRQ/crQ6f9ZyrgRUdjsF3bHXTH8HZqC0D06zagTmFAn9JItfXaJkvo6zjZ
	A4eQXIMPu2XmjxNN5iK70IW0EtedSsaaOMDMpnS4LivxfOYSA/RZOJxK3kB0S3nPNbmiYsiBUaD
	ZpAsYLXyPAxeAAgx5LSsDEpwG8uqkgMufdb6MiPFbS0okugO1cZdqc6+0Zbe7/nBJak+25jPl1v
	TZJwOqvk8ifcCZSZrv2DlLT1bXpdlYHwnw98Dkg14YJYeh4F0hON191ny5HGHm4kDz0IbYAbLVK
	JhaNPlGM2YWFaEBM6hJZrxBXE/XimPTyoIor0+4VG2ivFYqD6NwM73W0Ol3oJcn3geldlkletke
	HgIi0cCoh54JcbE
X-Received: by 2002:a05:6808:c3ee:b0:4b3:1e40:6451 with SMTP id 5614622812f47-4b397f09e25mr3397971b6e.1.1787872922428;
        Thu, 27 Aug 2026 16:22:02 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38fbfe089sm1589553b6e.14.2026.08.27.16.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:22:00 -0700 (PDT)
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
Subject: [PATCH 5/6] ALSA: usb-audio: Add PM guards to RME Digiface controls
Date: Thu, 27 Aug 2026 18:21:42 -0500
Message-ID: <20260827232143.149197-6-mrwillporter@gmail.com>
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

The RME Digiface status and register helpers issue vendor requests
without preventing runtime suspend or disconnect. The volatile status
controls can repeatedly reach these unguarded paths while userspace
polls them.

Protect both helpers with snd_usb_lock. All Digiface get and put
callbacks then resume the device and hold the disconnect reference
across their transfer.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index a1f5592cc5d5..fc622eb95dc5 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3480,6 +3480,10 @@ static int snd_rme_digiface_write_reg(struct snd_kcontrol *kcontrol, int item, u
 	struct usb_device *dev = chip->dev;
 	int err;
 
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 			      item,
 			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
@@ -3499,6 +3503,10 @@ static int snd_rme_digiface_read_status(struct snd_kcontrol *kcontrol, u32 statu
 	__le32 buf[4] = {};
 	int err;
 
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
 			      RME_DIGIFACE_READ_STATUS,
 			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-- 
2.47.3

