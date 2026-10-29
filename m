Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238102;
	b=XiZVaSDvxbSPy/wuYdNdFyn5lkE5C2df+LIOBextOES9BEpw6baYELG4PTQpNfZ63mlK
	 S5OBOrlzN+RdT8jMYPUWa5fsuqqCtjg5KAnGT5PWpFieJUr6OQRzmiOyrq8z7hAiXiFOK
	 LWn01pMlLVOFtck0IZJxv7cQ+f7TJosKu84fUv4XS2am6sFfgCFnvofiuQVUt5Kt0zW1q
	 mxOzy0K/Op3C+NE37luSAZDSyXrfg49RS4AOTMdY8IMHJ7/QMS0hnP46aAGn3iTEyw7Bf
	 q72LA/fjgfozVLMvTRadfiPaLZ0B9xgwCu05QuXZ/M+r2+SIiSW1YaUpLyfwzFg21/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238102;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=AIk2sBpIae5R/cCZtioGN9RUgpuSqYR7dSVIP8rFOP8=;
	b=EclEz1lyW4I5RmD0irfs2sNlN7mwdwERValI0Wc2oo9G5PMkHfM5n8axrYX/IAZaW2YN
	 S9n2LhKx50gLMKf3rGSNiaNW5ATIaZ2jwU56H8FqpxWLEK/y0Yea9gwqzw/+26DXKreip
	 LN9iaXXSiyNB6/CQF3gOCk6zAwlSzC74GKim9fPbzyLmUuTQMAz1LXUm8L/VHB0CYw5f3
	 tTHxZLNV7oCKL/RgjSPf9I8X0f4hTYko7Iw01ZCH6p1MDlXp52oxjyp5KTKX3K0bXg62P
	 fjNAn+PQCzgS6Sps6nMd2XMahwMS+8X4bGK/s6a9vOHMCX6S/ypxGdIUJXBWVJp+OUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EywH0wQ2;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C6B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C6B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EywH0wQ2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=AI
	k2sBpIae5R/cCZtioGN9RUgpuSqYR7dSVIP8rFOP8=; b=EywH0wQ2whBmwVAuIc
	vM1TX0g1cbxifvtj7njvbavprJnlJamr3ngCvZ/fzPpfI0Y+D9BS692g5iX8ty/o
	wXMc9+l4GOOxyixDu86tDWvUcXJL99c+5WHj2Zq/vWzG77fW50UJvgS22xPVw6hI
	LmkJ3bg4zMzo4Cs1zDd0szcfc=
Received: from pan-u.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDXlI01pOJq0IXSCg--.10140S2;
	Thu, 29 Oct 2026 09:41:10 +0800 (CST)
From: rppxj178543@163.com
To: takashi.iwai@suse.de,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	renpanpan <renpanpan@kylinos.cn>
Subject: [PATCH] ALSA: usb-audio: Fix card name for CVT Touch Device (1ff7:0f33)
Date: Thu, 29 Oct 2026 09:41:08 +0800
Message-ID: <20261029014108.87201-1-rppxj178543@163.com>
X-Mailer: git-send-email 2.43.0
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
X-CM-TRANSID:PygvCgDXlI01pOJq0IXSCg--.10140S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWfCFyDZrWrAFyftFWUurg_yoW8Ar4kpw
	1kJrZ0krZ7Gw42vw13Ar43Cry3Jw4rAw15Cay2g34DuayYqw15tas5KFWqk3WfKF4rC3WI
	q3yUt3yqgr1rA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jI89NUUUUU=
X-CM-SenderInfo: huss5yirxykkqt6rljoofrz/xtbC6RaJiGripDYXyAAA37

From: renpanpan <renpanpan@kylinos.cn>

The CVT Touch Device (1ff7:0f33) is a USB composite device (HID + UAC
audio). Its iProduct string "Touch Device" is generic and does not
identify the audio function. Windows names the audio function
"MAXHUB Speaker" from the UAC OUTPUT_TERMINAL iTerminal descriptor.

Add a quirk entry to override the card shortname to "MAXHUB Speaker"
with QUIRK_NO_INTERFACE to preserve normal stream and mixer creation.

Signed-off-by: renpanpan <renpanpan@kylinos.cn>
---
 sound/usb/quirks-table.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index dd02c6294edf..9a1dbbb1d1f2 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -4133,6 +4133,27 @@ QUIRK_RME_DIGIFACE(0x3fa0),
 	}
 },
 
+/*
+ * CVT Touch Device (1ff7:0f33) is a USB composite device with HID + UAC
+ * audio interfaces. The device iProduct is "Touch Device" but Windows
+ * displays the audio function as "MAXHUB Speaker" (from iTerminal).
+ * Override the card shortname to match the Windows display name, while
+ * keeping normal stream/mixer creation (ifnum = QUIRK_NO_INTERFACE).
+ */
+{
+	.match_flags = USB_DEVICE_ID_MATCH_DEVICE |
+		       USB_DEVICE_ID_MATCH_INT_CLASS |
+		       USB_DEVICE_ID_MATCH_INT_SUBCLASS,
+	.idVendor = 0x1ff7,
+	.idProduct = 0x0f33,
+	.bInterfaceClass = USB_CLASS_AUDIO,
+	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL,
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.product_name = "MAXHUB Speaker",
+		.ifnum = QUIRK_NO_INTERFACE,
+	}
+},
+
 #undef QUIRK_AF16RIG_CLOCK
 #undef QUIRK_AF16RIG
 
-- 
2.43.0

