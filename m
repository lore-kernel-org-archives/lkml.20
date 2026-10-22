Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687517;
	b=4WFbzKgDkaicjgqjcqPwJ5SA2QI0Yl2C99xuWoSXrEZtDeg+1QXg81Nrj7LA2PU07GSl
	 EYuXHm9ebQHkESv0KkpJ88nBvNxbK7QjYmYJfbPr72sTYEMaqe6gihmxr5qeAe02ZCb7e
	 4uwkKTYV2xadwZUobkhqt7xDTfwf3aExEv60M/CH7iRvjfzSjlgWdArkYx5iRyJHpW2P0
	 g8hjuqRPzmzRBFIGh/bfP+tiXY07nh4WNH7hEgPxEMTz94Hln5MT2+5PrMA169GyG2z1s
	 nu8J0gdORQtO5fQh25wCjcwy5S49ts1sohxLLstQCxW+Cw9gRM4DoRbH3wk2lmTuZXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8m7/EiqjbX4B96wM7VN7+raoFsExq+tmX7IrIO9+WDY=;
	b=296Y7e6t7LeXVYfBYh7XGJv0327nX9pGmlF5JsSHOQfUNJgX5zCM4SJrDbiurThjpgpE
	 i4vZp/CKJwd/bvgM4azMmHiy4ZJKv6OoIaWrQxEaXVDEGB/xvbQQ1bE/Wsy/Pyg58oq4t
	 4KnER+HkCxCAx1030GlwLizba4UAeyDNKe6Bv1W1TLmtDMAmbiTJegS7lXHgKBeU+tX5j
	 xPw/P2yokg6041/U0r3by4r01f4A5/XZjlGX26Tf0lTrdwlgek0/9dpjivygCL7ZwBluC
	 gBZ3I1RBYOFYwdTrZ4D5+PWI/6WpPaQYw8DOzmF0tbClbDfysNqtD6bomb+WzDKDROQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DLm+UlQE;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B213B606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B213B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DLm+UlQE
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5366463571cso22193881cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687516; x=1793292316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8m7/EiqjbX4B96wM7VN7+raoFsExq+tmX7IrIO9+WDY=;
        b=DLm+UlQEt1Vi85lbYTRXgNMeVc68/189FbY4F56fg2DGjRaagIOfJcFxYGY4B9XUb1
         XgqP3yQAx1m9EdVh6vcUGhHVzMLWY7ZVNW7b8hfWMu8eBLT7bXaeVizCYLyQdooWz6ta
         H346SrNnvvrMTqA9Oe+Wjz6Kd/B6PWrrgvB4s+mqvqJ/W/gjrNnZZ0SKcvkaCkT63I7A
         0njolmBNTPry+8uPEqljvfUnc0pHclg1WpTnIwDdOalFdXBsfGbHRAnQZFO4/H0+2LX6
         vCOFQNEAU2E6QuVAS8CgsAjXnLuiDOIp+YJ/4YuhIN7USKFGhSxcWd30t9VzzoolZgPJ
         m9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687516; x=1793292316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8m7/EiqjbX4B96wM7VN7+raoFsExq+tmX7IrIO9+WDY=;
        b=YEQ5osiXTcuhz7NOomL8vn52w72bXhsmqYxmd32VwkD+DhjnQf8gKVIF9GG1+Ifa8E
         6CEBh4IFpffUGznaMdJOjQnXgYSqZ0IP9H05HuA0pWhgVB8eT+rJ+cpeFFhkSrCwFFjl
         KP7Zr1m46b7vFouLyUcxxC13aWW7xd2Tep/9636YFHK8CMEFNSK3OyGU3mlTNchlHKZ5
         cdmJ97owzcQ24cGqQaxNhUu+VNlyqSy/HIOuVgrl3L+mSYvQsS0Z0wRXV1wAKT0dM9Z5
         h8EW9aB7V5F/0ghF69Kt5QcqYgka8qgZyFySrjc7lj3IPeIaq5sO8uUySG1eN9X01Dci
         wkOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHX5gyXUJfvPfJJBi72rkdsCcZXRNzZLejocMk1KcIYE3OQk3uWfOPt++/u3KUP5CbUEW5gZsvrnel7yE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAJnlvlqD9Z925BzP39ZMQeq3X5FByvQ5bhJmsKkImdh21DqLW
	WRrRIN43FowwhvBw89nlRWeEQ+o5XbEaKo08SOFrMMyPJ2Fcitqsr0s=
X-Gm-Gg: AYBFou2oxdIYP5SUmxtCxOH6TyNo7zDdl2j8AosRykrZYAUcGWw5Ij/WqkIwOJq+2ES
	5uslI2roCYU0X9vEqQS7OIYF+nERCBvug/BOS6bVS4VxCaDdLyfWXEP78qa7ogW+p6MotnsMo1c
	S6nTJPH1bLNPY/QC6xMcLlrHDLvtWZmLP3RdqO80IWg1K2h91GcpW4xbLuhpsQEBj9rqq8ifM9r
	gUSqVdhBh14IeVN34g48xRl0I764sEb2pS8ktBu4YgknehK8UUIy6nrYhZ58AsrJIJls6wacZSQ
	nVuwZtATOfvKO927i/hPCinOif18vxKOue9tBCiI5YBrkP3xXspar+150dwr42sE4bc0NT1Hxoj
	Ue7bE/HKfedORmKv8idfPNsCQ7ntN7IBLGkvGf1+o/7aIYThNRwXmj7NYV0IQZdg7dQSSv3P8Hu
	swdYjxF/oLZqocEqmxJCpPWir8sZrHLTcXqenOm98ivsUfRj0D+yGXjugZsRJ5li/PIxnl6m2h5
	6oNqih++Q8LphGHa730NmraEdkf6SSYMT1OGGB3jC285Slb6+sGEnZ3bxSFJdo1w7BqJwsbp4+n
	CFz3MStz2AmpPSS3wmT+3Dwns+ietYArNgRh9TAAN97RmYXWTg==
X-Received: by 2002:a05:622a:8881:b0:532:91f2:dd45 with SMTP id d75a77b69052e-5369b861f84mr90124081cf.44.1792687515699;
        Thu, 22 Oct 2026 09:45:15 -0700 (PDT)
Received: from raincloud ([2600:4040:7e20:9b00:7285:c2ff:fed1:7bde])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c36f0abedsm1768696d6.3.2026.10.22.09.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:45:15 -0700 (PDT)
Sender: Shawn <rainey.shawn@gmail.com>
From: rainey.shawn+kaudio@gmail.com
To: Ajanesh Lal <ajaneshlal3@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	Shawn Rainey <rainey.shawn+kaudio@gmail.com>
Cc: Shawn Rainey <rainey.shawn@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: add quirk for Novation UltraNova (1235:0011)
Date: Thu, 22 Oct 2026 12:43:39 -0400
Message-ID: <20261022164340.78664-1-rainey.shawn+kaudio@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Shawn Rainey <rainey.shawn+kaudio@gmail.com>

The device reports vendor-specific class on all interfaces, so the
standard parser rejects it and no card is created.  Add a composite
quirk with fixed audio and raw-MIDI layouts.  The id table entry
matches interface 0 only so that the vendor control interfaces (2/3)
are left unbound for userspace access, mirroring the RME Digiface
entries.

Both isochronous endpoints are marked USB_ENDPOINT_SYNC_SYNC: the
device implements no explicit or implicit feedback, and without the
flag the generic sync-EP detection pairs the capture data endpoint
(0x82) as a feedback endpoint for both directions, stalling capture.

Verified on hardware: audio duplex at both supported rates, raw MIDI
in/out, and complete patch dumps as SysEx on the MIDI endpoints.

Signed-off-by: Shawn Rainey <rainey.shawn@gmail.com>
---
 sound/usb/quirks-table.h | 63 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 6343a50fb..0b8bea76e 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2359,6 +2359,69 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/*
+	 * Novation UltraNova: vendor-specific class descriptors, fixed
+	 * audio and MIDI layouts.  Only the audio and MIDI interfaces
+	 * (0 and 1) are grabbed; the vendor control interfaces (2/3)
+	 * are left unbound for userspace access.
+	 */
+	USB_DEVICE_INTERFACE_NUMBER(0x1235, 0x0011, 0),
+	QUIRK_DRIVER_INFO {
+		.vendor_name = "Novation",
+		.product_name = "UltraNova",
+		QUIRK_DATA_COMPOSITE {
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					/* playback */
+					.formats = SNDRV_PCM_FMTBIT_S16_LE,
+					.channels = 4,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = UAC_EP_CS_ATTR_SAMPLE_RATE,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						   USB_ENDPOINT_SYNC_SYNC,
+					.maxpacksize = 392,
+					.rates = SNDRV_PCM_RATE_44100 |
+						 SNDRV_PCM_RATE_48000,
+					.rate_min = 44100,
+					.rate_max = 48000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) {
+						44100, 48000
+					}
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					/* capture */
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 2,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = UAC_EP_CS_ATTR_SAMPLE_RATE,
+					.endpoint = 0x82,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						   USB_ENDPOINT_SYNC_SYNC,
+					.maxpacksize = 294,
+					.rates = SNDRV_PCM_RATE_44100 |
+						 SNDRV_PCM_RATE_48000,
+					.rate_min = 44100,
+					.rate_max = 48000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) {
+						44100, 48000
+					}
+				}
+			},
+			{ QUIRK_DATA_RAW_BYTES(1) },
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
 {
 	USB_DEVICE(0x1235, 0x001e),
 	QUIRK_DRIVER_INFO {
-- 
2.56.0

