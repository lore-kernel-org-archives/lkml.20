Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143053;
	b=ib7qPH2z0C6hmVjBQCTgIUIjNvBLvy6MsHZ9dMZ8PehhM0wFoK9jiMV2r2F6GOd9TW1w
	 ktpy0SsURZUg+C5wk0ucp4U5ltUi2AZya1V4DmXSAc8LVuGhYU8/5apRw7wwsz3XpYZaD
	 lLGEXHPZNp6ELwz36UEj83lfZckiO7GwCt2AVQW6EaMBTS80Ysgzt18sUbGQpg7aVcOG9
	 gJwOZZV4KFwvOFljEtaWr3fLugwRbX8GVuQunkWMlEDb4XXvW0Ax7JqC+GVXrsH8CuB7J
	 TT7S8mvNz6fdMLR6n0dUaDZLlhLdGV6BfmNtxie/5rAC/YoDNEMJ4H7l3WaXAewnypg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=InYgRJ41cVKCCq2fRJBS+cyeKW5AIrUjS76ncVBusC8=;
	b=WvwUDM4VhPf3IXCsRuUtkvLDZ/1uM1i/nZrNGrARQY5AVt4polSmOLjE4JK2e5A7+iyD
	 eyFGLaWHjgn/5Yms+7DSD/USlDGYM+IKYrV44dqp9DU6mUOlKueHt66sVD0s5O63cd4Pe
	 J2vkKhLCD+WBBjpMrxrfg6/NXlGq3GQOZ9imSW05jdFrtNURIy2d4t8QrhhplpfN5OOX6
	 RuSBsmqKyWuAktM6l0dCamn93f/5KtxNi08aLviCwr0GxTmGB68Hgc9mNZD9EDS/UgCnt
	 uBAYhnTN6OMu3KTcb50aZRQEasR2KP6+PlMhdtX1iHxl3y6xep503BKfFUcN8FrDTJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="O/rbTePz";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390FC606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 390FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O/rbTePz
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14fc585291cso55434c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794143052; x=1794747852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InYgRJ41cVKCCq2fRJBS+cyeKW5AIrUjS76ncVBusC8=;
        b=O/rbTePzGPpPhRz0Gzzhtf3+kbKy5+wDvHn6RLJ6sqVhiDdGg+9cBGPMZ6Y5ggeb1w
         FJF2RMfiSpZ3pijdRJVSOT9LI4tYqUmRpmw+faXSCGwDXdWyq7Rc/NJhSxad6lxc1q54
         EI+g+D/KghZ3hk27QYausNUFibd6KscTyHM8tE8THLkSJLaj0AWWKv+dwq/Qg0rA9KUr
         cqu/QRepnKiEcjy/liru1EWXDZoTaHMMTjoakNTMqJM5FU6PzIXzL1ggfM94x6SDharw
         fjo26jhTYetwTc8e7M47iD79Mv2OLejjOOitpdiiFsquo2eC4TfSIS1hKWVcRBSgpD2t
         LIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143052; x=1794747852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InYgRJ41cVKCCq2fRJBS+cyeKW5AIrUjS76ncVBusC8=;
        b=XcIKePCidz1M2Hg9AOU6XB8yy6rTBiO3q6cr3ZTTYWjQ9nBNjtnaEOTJs1UY+9WpJB
         jVCRZbJore1jqDlq43uLgh0ZxDo4yibTwd/X3d3jzgnuKMi1ZvbAo1pILa9hcRWJuG9K
         RoS77ssljJGti3plOSDo7QKaZPzm8zR1YYd2NNstH/krtekBwVP7LZMyHrRrCJIQpBNK
         reAZOYFvhJ89Km8JCSQRZGMuFvoXfrvckuGD/vri/guAho0A6S1jCSIpFs8R1us93p6f
         GXAKVl42s1VUjzaEJ7SsfyETYNRX7CF+tm8mcZasDZL/MeP9oQ+lwA/4cy7j11DRR8ll
         2JEQ==
X-Forwarded-Encrypted: i=1; AL+hErEcsZ6h9iLBwXYynl7b3LIrxfsWBNVOWG22wjA1lKXXK2QbeSblQfbEu9uYc5ifaMJEgvX76Z1n+nB0HKo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M9S+NO8As6eTc7P7kGSUPXz4Z1JJnkltB+CMHA+W9NbN+Nw4b
	YAo/3vXWl7nOWtqgdHis4G2fwqTUi94CqCyyVvLgi9I8rPx3sz1hXldb
X-Gm-Gg: AYBFou0Jz7iPyNmIJfwo6sGNASgzb7Q4SNC+WSMZ/SMN/GoWIzpFk07ClbbETQZT5e9
	d8UPzXhaLtLsDWhTIZpRJpHNOvFrr1/Mh1dSwvBeqKgOaIzDsmp7R7W/hnFAV7ubmMxoPhRVnls
	FvhTX9IeFdI9H4UAoMwYB4q6HXRucxN6gIf5FOXUl0kdR+TvCJB7iOzIcOgD7WT2mIyU4B9hvFT
	+HXEBzdbUXTVQdNtuo0saEGnvKXcWGLczXaIZ/L2+h8x1V4G9ESx7bAHG3+LZzTge2udBRYk93s
	Rkwj9/DYrjbrJw9rHl6C5xARBTLyHQshR0rRUFHD3/66Ms4fEUL6jAUUMroYSrqNbWPjvRbFX+a
	Xz5SpzNyzX6lAYuYcFYkZHrAm6DrQ59spikbSv68c5SudR1Y22llobltyWo8NXfor3UA7RVRKCt
	FPbNEFmHsgVDDx7615noU5llqydtYkIsKwUzdWhT8luqzWAZE5ZRUZmxaHzsC2VgYV2nIP1c7p2
	GmLOi9wmriMCtul3swmUmoM8fdHYtbI+DN7ckZEQuZOHGJSX5Q8C4BUgNPmFfocXcF4/pIqwirr
	0f8o4YnnxrQoCa4OtpGrYclyB51wrAYlChdNFMlbGQ1Wz9H9QY6odTU=
X-Received: by 2002:a05:701b:4508:10b0:1b3:755a:ec49 with SMTP id a92af1059eb24-1b39fed077amr1921739c88.40.1794143052168;
        Sun, 08 Nov 2026 05:04:12 -0800 (PST)
Received: from prts ([103.156.242.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm6603194c88.6.2026.11.08.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:04:11 -0800 (PST)
From: Xinyu Wei <xinyuwei1024@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Cc: Xinyu Wei <xinyuwei1024@gmail.com>
Subject: [PATCH 1/2] ALSA: usb-audio: name the interfaces of the Steinberg UR22C
Date: Sun,  8 Nov 2026 21:03:02 +0800
Message-ID: <20261108130303.387288-2-xinyuwei1024@gmail.com>
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

Configuration 2 of the Steinberg UR22C (0499:172f) exposes 6 playback
and 8 capture channels over standard UAC2 descriptors with
bInterfaceClass set to 0xFF.

Because the interfaces are vendor-class, they fall into the Yamaha
catch-all entry and QUIRK_AUTODETECT fails to set them up:
create_auto_pcm_quirk() rejects 6-byte UAC2 format descriptors, and
interface 0 (audiocontrol, 1 altsetting, 0 endpoints) is rejected by
both auto-PCM and auto-MIDI paths, leaving interfaces 0-2 unbound with
no PCM registered.

Add a USB_DEVICE_VENDOR_SPEC composite entry before the Yamaha catch-all:
 - interface 0: QUIRK_DATA_STANDARD_MIXER
 - interfaces 1, 2: QUIRK_DATA_STANDARD_AUDIO (6-ch playback, 8-ch capture)
 - interfaces 3, 4: QUIRK_DATA_MIDI_YAMAHA (DIN MIDI and DSP mixer
   control; both carry Yamaha-style CS_INTERFACE jack descriptors with
   no CS_ENDPOINT descriptor)

Configuration 1 uses bInterfaceClass 0x01 and is unaffected.  The
existing IMPLICIT_FB_FIXED_DEV(0x0499, 0x172f, 0x81, 2) entry in
implicit.c applies to both configurations unchanged.

Signed-off-by: Xinyu Wei <xinyuwei1024@gmail.com>
---
 sound/usb/quirks-table.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index e85eeb536..cc2c1317a 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -455,6 +455,20 @@ YAMAHA_DEVICE(0x7000, "DTX"),
 YAMAHA_DEVICE(0x7010, "UB99"),
 #undef YAMAHA_DEVICE
 #undef YAMAHA_INTERFACE
+/* Steinberg UR22C (configuration 2) */
+{
+	USB_DEVICE_VENDOR_SPEC(0x0499, 0x172f),
+	QUIRK_DRIVER_INFO {
+		QUIRK_DATA_COMPOSITE {
+			{ QUIRK_DATA_STANDARD_MIXER(0) },
+			{ QUIRK_DATA_STANDARD_AUDIO(1) },
+			{ QUIRK_DATA_STANDARD_AUDIO(2) },
+			{ QUIRK_DATA_MIDI_YAMAHA(3) },
+			{ QUIRK_DATA_MIDI_YAMAHA(4) },
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
 /* this catches most recent vendor-specific Yamaha devices */
 {
 	.match_flags = USB_DEVICE_ID_MATCH_VENDOR |
-- 
2.56.0

