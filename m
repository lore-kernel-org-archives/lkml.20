Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794089958;
	b=vzXejZ0+5MiJIwUfpiKecr7/SsiZ16j8/B96L3acEc/K4Q4c4EegLXKRJ240oLwp/lhs
	 0UzevG2XmGxMimtpGcbefXS77cVFBysEQR8ZOa5Yu8jhX56JDKL0wP6660smc4PBjVapU
	 ubX2Gba+weMcEfme3sfiWVztTrbyD4FFETpegON0CvC8zEJOj8D+FY/VGnxMntcgIbf1J
	 QdAizDU6l2buEJolMV6Pk+3JPd7uVXswWLIZr6B4Y8gL++Dea+097fqvkQHKNtcqeSUvC
	 isjhhMyQW2jjmCUJCuyMAx9+G3U33lAcmgrjKWcz0W2ZtjiwQRPQZaRcHUgV2PaszDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T5ifILwxqBW41ZTJj3g7LF1tT8j/uMMKaI1dqm1hN9I=;
	b=Qwbs23xy3mbmfNvvTsG1PAP5yOHDTFIIVgID5lJWbjlhrQI83LEn0RPSKUD7YIbyzGZM
	 rgSx4DwXMGaZcNUfz0DvqgvX4uE8x3lml1K6O5xss610uRxSP67eHky2xE2SMCRfwOzt2
	 qqLFq3f+IRUO1/AQP2acnZ3M9jjLGp8rpP0WzLR8znFZ0bCaTFJD8/9T0yrj+3GnWE3WL
	 dNbKmfdqYHrsFYP8DhAye/lkL3Q57TSEG4tFXf0KwWYLOFFLWWKTiZCkAEAF6Z5FYBG8A
	 Dg/AdUztJHfrjqyw9aP2Zxu1TY98ck2SdhIr4CDHGEBbzuS5/gr7jLYMWcQn4URgLkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bgrEUxjH;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C48606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 22:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C48606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bgrEUxjH
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c411e139259so2315666b.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 14:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794089956; x=1794694756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5ifILwxqBW41ZTJj3g7LF1tT8j/uMMKaI1dqm1hN9I=;
        b=bgrEUxjHPyo76/jXJ7FJmIMSUT+CYLz0nYMJi3pmYqKIJtn2t+flz0qvDvjcCSKZxV
         /Jv45O3jNVCUeW1CtRPN9hLlyCLPsq7Qc9p74dSoCbpnAc06VokqOu4vOcvRL+XjhUWe
         R01ay9RTEe0A02oghkRUBSD4gR1BX+uV24Eq+WKN5D2viJRsrBvT0akh1KhRvTksGAnM
         JsjKfGCqD9sqfbFQvLH2tCV9JvLtwKF+G//tdl0UwN+zXWswGKpiOW4pRS4he60nfbNv
         5VqfThWHeOv5ywbK78kvpoOnL4RcJOiQ6vd1SFjYclYTgyOILOEhtXGcOMTo2KyA1G4I
         GEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794089956; x=1794694756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5ifILwxqBW41ZTJj3g7LF1tT8j/uMMKaI1dqm1hN9I=;
        b=1FYtJLO913uVIIMc+NCKW4MS5xSdG4C3t/Fq4QH+EjZ0WVpxSbqhagRx9U44cRI2Qu
         33fjK9xzoqEP0N+vtyMDg9hD9Hg5n4FhR+IgrbPIm58QIYpXHQWVSc+Dj0bTSG7+4x01
         N8f2BcSd1yuq2Yj2tacYTCtSMGT1TNCbtTeqg+3TusxDNwGV5OnTCBulKrQQene4R/yh
         EViA0PhSjfnqB+wsjCyN4XbIQcxCHZsNvBCWxnqL3VkSr5wpg2vRxQIM9Lkus6gTV/qr
         E6T4EgAESNOqebUi3MBXLtr8yodkSXVv/OEAQ+qetZWDHltUBijdYY6NrPo7oCvy/vCC
         XzCQ==
X-Forwarded-Encrypted: i=1; AL+hErGlLMfNMdMctbH1ZMNeTFpusMraBq1ZEruCpqY50QtaFwnkB/SI4SBCfyDAnHI9s076djeHyDKz2sm6Pwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eJtsFCZOITBwNUpQdRNWA8ooO959B0BpdFKl9oD62W+sd2qRH
	sZMT6HcmOX0YCvl7sjINVSSLfd73oac6wa19DcJHIzvu3yMrRPLMB1k3
X-Gm-Gg: AYBFou1DEd+hFNyYzlOqW4+XLgyrx3qPukzrPPG2lJvl+IE3mejoeLgOuIy9SoHtad6
	GFH1BRNXde0WKbEahj26+P2rkmCkdVZAnL2D1ms4mv7Oa6caY1Pqaz1UWMJXxx1Rxp+1XWSL3FY
	yLeyPak6f80m7YlT2P1sTiMyJYJKsbD7gNlZYsfZlN9cJF6R4R1+hzikPkoE2OJa9a6x+RHqct/
	Oh9Zctahk0UlLtDEBmyWrI7XTwvyUzUxRcyDBfQqqSyrEiSmVbFKe5d/seyObQduRw5ne3E26Hm
	oeFkWSK2nKL70B/oJjtLACb8TQbT2mHmQv8vSuSmMX3ZjGqRf+G5V+PZv50zxvXuHZHVF2/h5kG
	mSU6MAJcIwo/ubGmwYd28S6oMAFolok9BuHqcFg8O1kRjWlKZEa6cxWzwlQFk1/InwlVeWyCZ3Y
	HpPQBOGERLa9nt83oyX6bpgsGo10KxSMRGTgWF+B0Zjf88e7q6HCM4cdnz5OGG2S5IucXt2dI/4
	pc61GBtNGnDmAmyYF1cmgxne3rXlvk4jbqwTHCa/KimUoIkXCzHU31db5Wz2sE5e5xVKf8PMZv5
	Pxzn8Lh6iTM9jEdaiNogwE83nyoqcUQraWjf3YVBZtZwKMA7vhHLLu2XU24=
X-Received: by 2002:a17:907:97c7:b0:c40:38b5:d784 with SMTP id a640c23a62f3a-c4d6d4ec638mr14873266b.22.1794089955748;
        Sat, 07 Nov 2026 14:19:15 -0800 (PST)
Received: from frame (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474e3dsm14108866b.42.2026.11.07.14.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 14:19:14 -0800 (PST)
From: Elvira Khabirova <lineprinter0@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Hubert=20Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elvira Khabirova <lineprinter0@gmail.com>
Subject: [PATCH v4 0/2] usb: musb: gadget: don't flush a waiting RX packet
Date: Sat,  7 Nov 2026 23:19:02 +0100
Message-ID: <20261107221904.82487-1-lineprinter0@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Since commit 3fc137386c46 ("usb: musb: Fix hardware lockup on first Rx
endpoint request"), musb_ep_restart() flushes the RX FIFO instead of
calling rxstate().

When using some functions with musb, for example, f_mass_storage
or f_acm, this code path will be used mid-communication, and it will
cause data loss.

Patch 2 fixes this in musb_ep_restart() and schedules a bh work item
instead of flushing and losing the data in the RX FIFO.

Patch 1 modifies the semantics of musb_ep.busy from a flag to a counter.
If usb_ep_dequeue() runs at the same time as another musb_g_giveback(),
`busy` could end up with a false 1; this would stall an endpoint.
I added this patch in the series as prep for patch 2, because patch 2
would otherwise add one more case where such a race is possible --
a musb_g_giveback() of a work item with a musb_g_giveback() of nuke().

v3 -> v4:
- Move musb_gadget_enable_rx_kicks() in musb_resume() to be
  after musb_enable_interrupts() and under musb->lock (addresses
  sashiko's "premature and unlocked rx_kick queueing in musb_resume()")

v2 -> v3:
- Added patch 1: `busy` is a counter now (addresses sashiko's
  "overlapping musb_g_giveback() calls wedge ep->busy" and
  the nuke() part of "race and ordering bug in musb_gadget_disable()
  for rx_kick")
- Schedule a kick on every OUT ep when resuming to avoid stalls when
  the USB session is preserved across suspend/resume
  (addresses sashiko's "lost rx_kick across system suspend and resume")

v1 -> v2:
- musb_g_rx_kick() does not re-queue itself when `busy` is set.
  Instead, musb_g_giveback() re-queues it when `rx_kick_deferred`.
  This new flag is set in three cases:
  1) `busy` is set inside musb_g_rx_kick()
  2) musb_gadget_queue() adds an RX request to an empty request queue
     and `busy` is set
  3) `busy` is set in the beginning of musb_g_rx() (addresses sashiko's
     "RX endpoint lockup after giveback in musb_g_rx_kick()",
     "softirq busy-loop and livelock in musb_g_rx_kick()", and
     "race and ordering bug in musb_gadget_disable() for rx_kick")
- musb_g_rx_kick checks musb->is_runtime_suspended now and exits early
  if the controller is suspended, and the work items are disabled
  during system suspend (addresses sashiko's
  "unushed rx_kick work in musb_suspend() accesses disabled MMIO")
- This time tested also on a Pine A64+ (Allwinner A64),
  which has both MUSB and 4 cores.

v3: https://lore.kernel.org/linux-usb/20261107173601.63095-1-lineprinter0@gmail.com/
v2: https://lore.kernel.org/linux-usb/20261107105505.6554-1-lineprinter0@gmail.com/
v1: https://lore.kernel.org/linux-usb/20261027202744.79556-1-lineprinter0@gmail.com/

Elvira Khabirova (2):
  usb: musb: gadget: count givebacks in busy
  usb: musb: gadget: don't flush a waiting RX packet when queueing a
    request

 drivers/usb/musb/musb_core.c   |   3 +
 drivers/usb/musb/musb_gadget.c | 128 ++++++++++++++++++++++++++++++---
 drivers/usb/musb/musb_gadget.h |  11 ++-
 3 files changed, 133 insertions(+), 9 deletions(-)


base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.53.0

