Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A413FFD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791852653; cv=none; b=GhiN8lAuHZ7P0BhfxeRJSwIQ5TCVLKaIq7nuFC3plKT8swyTnmPbexQty9AfYHpXNr7Oft2uaGH05jLC5HqwA2DjAAI6bt4IEwx4WAqCpp+w1HNZ0l2bJhm6BLEEWdT7RITn1ccXjYopmgBbvs8e4kJ80v82AmkNehoyf4o7R1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791852653; c=relaxed/simple;
	bh=7W28zXbAc258OscpulaQd9eVgbJEA5Vs10RJkU26jko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ieQNgP126tpFp8zZlxVt8DI9maSAtyep9vbXxlS/Ts2oSRzMRTDplkqevtXgjQTJ877tkmHwk1eOGw3PTG+RIbsXm+kduzx63IdZuze1Ckv26q1OpNkejQewNjuUGnRKM5YcHh1pL0CAlreHwghSzS7pbdtxJ7tY3RgtMYmnB9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=je0XxEVu; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="je0XxEVu"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91968804af0so28130516d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791852651; x=1792457451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=06iyY89s7tmiZ8wG9TyA9bzi9/KFey6XFgp9yIv8oXE=;
        b=je0XxEVutnRNhcTTovnB5BYs3hwL8hTDTBpamYvYm74eACOKI5GikQnMrrotvda4Mh
         gNVONC5PVIn2QLjgPeF810EEVG/boJqclX+aiR1zOsVQgQ61KNJZhn6sl5BD664ZB1Bn
         DkVOQBp8UdyDk/bujkJiJBB90o0i5MQhvB2NJbR4h5QEIK9LcGxWc411UHSmMP/GChIc
         LGLqVFpMTME4Mgh4+uZCWrpO8JMG17VIBQ9aYgN+7unFO+mRfUc6bS/rLQFJWvEP1WjI
         p18D+AETMd4+MsoSvBE850qSTP/xy3iMIfc7Y2Qco2eHxNQX07Q2ZjTvvPZIgzv/P5aU
         nu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791852651; x=1792457451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06iyY89s7tmiZ8wG9TyA9bzi9/KFey6XFgp9yIv8oXE=;
        b=rea5VicP9pqQeHx/A+hw4noB8yMxUiH6SFH266wY/b2a/B9N5ewY+HAQwf1qWT47xk
         if549x1uxyHAqFWp8kfLMmnr+mLpU5nN6wyGedBgZH3kgNDH78WjyKmL8eL+Bahr7JmN
         mxlgnj2oNKavlWv7EMeGP9PT2IpKNujFFpEBzeqkQEPIczUz1Ht5DMJnZ+rAufLHsTRT
         TJ9jiZWcEo81AsBf9/wRGrZ70bJuUeEF+FcjRIj9zKPsGNX5Ef7JTLpG2/PfJzhXblu1
         0j2G/LRueqWrn2Z/ZE+2jVyXRlaOs4+WThToM18N50c2TaYKVvl7XFRwYBpuB/VkwpKa
         WIfw==
X-Forwarded-Encrypted: i=1; AKwUvBzpVq2L4fQ+SZW4/59PapTvNXPb5+vVUzwAjfrFqlnYQtO0QE3/CjPsK7zx0h6X8sZdx1bIyOrHHhTP56A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIinEYjp/aYI/AHuj88j7TAEyNjbBwvW6/c17+gkJGbIXIhsvN6
	YzbGHumtczAmZw5XUo+WLxN5q+PHsserfrMUPy0ITVBqEZweZO8Sn3s1UCd/vPnMybY=
X-Gm-Gg: AYBFou0PB/6181H4fTqR/kKO56db4XDulNc7XgvhFmoLezI6rDBwnlHXY3AOY/Um26+
	kEzQOFj9hpx+EMxQxB4iNdJRHylsNKxgO7hEl6pjm+DuByY3Ce3HSGAk5PuU23frVvUBr6cYpOv
	j/bBtE1NvWMXKKaqeUkQ3vfKoGh2W2ojLnwJIMUwBtmMaHtGRbzetTIAXELfTrxhA0m+g4tIaiE
	Mfyvchf67ixsF3aAzREEkMGy2Y+InNfQhNCDmo48ZQQ0vjmJMenJv67C3K/Q652uw8hDfeP/26D
	AXOInXfhO8CCMm7x/HqSnt+3kLEYlvWLPeW1wHdsaFbgVBmUlFx6U8vMH/pBYfCj3vyZPHtx3Ap
	chxuhGTwlaumQe4lfL+PiNRU0vtU+8J6WoMSxOqAo7NzJD6obseQ7jh2X6ls635onWEVJy/h0mG
	RUA3O8x6srmHZ9dVp/W5U3xty/IUEvcmjfqKVD/R1YtapBV3w9KuW+5x2D57pVQVGTQGDhLXHH+
	4bHhSTsYDs2KSBF6Y0SzH7ssgYtTkFtjwYMmhLQ2KqlZo+z1J5qnL7PbkdY2r2OhyVe7Gf4mi3I
	/RBG+xDBdghuSPDAfi3hAljCxDes/z9l9xD/KGfymYNArM4U1qt7
X-Received: by 2002:a05:6214:f09:b0:919:518f:3a92 with SMTP id 6a1803df08f44-91b5549984bmr185414706d6.17.1791852650672;
        Mon, 12 Oct 2026 17:50:50 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b9ee98365sm704226d6.48.2026.10.12.17.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 17:50:50 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ramshouriesh R <rshouriesh@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] media: ipu6: Don't require an ISYS reset after stream stop on IPU7
Date: Mon, 12 Oct 2026 20:50:48 -0400
Message-ID: <20261013005048.8601-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On IPU7 every stream stop finds buffers on the active list in
return_buffers(), so need_reset is set and this is logged each time:

  intel_ipu6_isys.isys intel_ipu6.isys.40: buffer list not empty, needs isys reset

It reproduces on Panther Lake (IPU 7.5) with a plain capture and no PSYS
involved:

  v4l2-ctl -d /dev/video16 --stream-mmap --stream-count=10

The frames themselves are fine. With a single camera the flag is cleared
again right away, because the ISYS runtime suspends after the stream
stops. When something keeps the ISYS powered, such as a second sensor in
use or its PSYS child device, the flag stays set and every later open of
any capture node fails with -EIO:

  intel_ipu6_isys.isys intel_ipu6.isys.40: isys power cycle required

The staging ipu7 driver has the same loop over the active list in
return_buffers() but no need_reset. The IPU7 firmware apparently does
not hand the queued buffers back on stop, so leftover buffers are the
normal case there. Skip need_reset for IPU7.

Tested on a Dell XPS 16 DA16260 with an OV08X40 and an HM1092: repeated
start and stop of both sensors, alternating, with the PSYS in use for
the OV08X40. No reset message and no failed open.

Fixes: 3c2f7033a924 ("media: ipu6: Warn if the active list isn't empty when returning buffers")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---

RFC because I am guessing at the firmware behaviour from what the staging
driver does. If the buffers are supposed to come back on stop on IPU7 as
well, then the bug is elsewhere and this only hides it. Based on
media-committers next d7e7bca71698.

This came out of retesting the HM1092 on the ipu6 driver, as you asked in
the other thread. The sensor itself works properly there: v6 plus my ACPI
patch binds on CSI-2 port 2 and streams Y10 648x368 at link frequency
180480000, and IR face authentication works on the frames. No ipu7 format
patch is needed. One thing for Ramshouriesh: v6 no longer builds on
media/next, set_fmt and get_selection need the new client_info argument.
I will send v2 of the ACPI patch with these results.

 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 23d00e1..4a5f518 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -463,6 +463,13 @@ static void return_buffers(struct ipu6_isys_queue *aq,
 
 	spin_unlock_irqrestore(&aq->lock, flags);
 
+	/*
+	 * On IPU7 the buffers still queued to the firmware are left on the
+	 * active list by every stream stop. That is not an error there.
+	 */
+	if (IS_IPU7(av->isys->adev->isp))
+		need_reset = false;
+
 	if (need_reset) {
 		mutex_lock(&av->isys->mutex);
 		av->isys->need_reset = true;
-- 
2.56.0

