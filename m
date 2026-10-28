Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205976;
	b=ECBjLo7P8y35evoXO9P19pb6kaFS+DBC2Zyzf1bDFzCxNEc0Dl/Wp6Wmh8rM2OPY3aZP
	 eq3swCrxBKlSdzp55cVv3yEmjiixpXakKi7VymG6EUR33LL2WrBOH4qihWN/QbCEbVqbW
	 qNfwNZHjHPIhseivhqb/GEAv/8YQruSt4R40UsObVvS4Rxex8swB7NXV6ByHJja6Rjp2K
	 6mAMkvmTFS9U+PCbwhxFWL9HvRiHrnwn5QnOU2B9KIlRHR7W6Ufs47dPvdiahWV9HsgpO
	 MawX3YYF2fWji1KmGfqybF3zJ5eqJgvnzSqEkfEjemG7jdvVOiCYwjT0cEBAHwzcc/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8CUKVtB3M6BDn+sfH3x5H78DsA3Gm3b6pTU7+cSsPOk=;
	b=FKZ3khislUjmT27lUxKj34d+HlhqAlYHRsnsrUK10AMh3eyCVckFTRRcj20WuKy9OaXq
	 /soMcBWl37UUT4O434OM6TzKg1wank7Fx/FvZdHX/FnSB8jXojsuq4+SUTkeEWNtmEPJ2
	 W530Ogyr+uD6smqS4MDL8PoV4SL6x4Mfsl1bq776E5OrPg6cOmwxFGyJDzhUAkBg/kXkL
	 RGgRoUgGRIeN9jIG6rgGBvx+rluWGaYPgAEHNP1W8Hie2SB8fbfyPhrxuQ/cOgRDPrzdb
	 pqsUBe3rs841IxYVOyeQX2eyJs8kVRnJ2o+9VxCGMNJzNkSPmNDT4MKFXYxeMeFTVNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gw58VUGE;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46019606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46019606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gw58VUGE
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso66638eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793205975; x=1793810775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CUKVtB3M6BDn+sfH3x5H78DsA3Gm3b6pTU7+cSsPOk=;
        b=gw58VUGECC9r/O8aZ25oN5TOTCW/aD6bYqQVnvhNau9TBe9xmqblJOiBD17jZFv/tm
         LkBg4YdrXekpmHTDIvPn9o2PQG4QvrteqFC78WT/9f6EH0ueHsWRMWhYI3EF/b7Frscb
         3vIWbgJAwiH5G9U9Gy0eWNSlXGuTMl/geslZ/8dET/mP2mjzDbLVWBFLMpNlFAjFasbP
         wehUpnR7ysY3ov5OI0Ldcpub+W20tb+xYdRQ0cawQ4q6o/aL/XBoDR3AHbvhSZEJIaTa
         5ExYqTCiyNwFpC0mOpvGeU3gvFIWjdsDPXPzI0aAzBEz3ERomvdFl0N/DA8vFCFwVzKH
         TMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205975; x=1793810775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8CUKVtB3M6BDn+sfH3x5H78DsA3Gm3b6pTU7+cSsPOk=;
        b=dbj+tQlCcJYiuoAtO2eOHvim+Jt/2Rnj/lHEh4ANhygzs7t3UVSo9EabA5AjR28pd9
         ZPE4tvgm+q7PrNnbmUpe4yaCLBJpBJdj/6zYAg80TPYHcUKxhdtov/Q39GNxMCEmlTfV
         XISCeDXK+3pvNrN7t5mSH0ZyONHOpZn0dFIV8EiyjVZu7uRq9Mqc1BNU7LTz2sTWIBOi
         v6KMp4YbzKOuwjO4ji4JrRxVkwzrn8zsQhMICBAaZ6RY202IEIdoEGx3quMauJPRbkZv
         CaSPh4qI8IO3olpH+zebNJrUjySRK3ofw4LTHB0i+LyNc0nsu9YVbg2/w9yth4LcNjjt
         QbiA==
X-Forwarded-Encrypted: i=1; AKwUvByo8mJcLF/q1WeQkRNWloipV8Qr/t5pULingPkJEON5oidT9SbHfKyfvG278AcSxmcL4iPGLP3VA7X9UQs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPaJGoXYq5v+tpTemv5FUVq19cuZyMikE03a5Hj91wfabyW3TI
	lQmjidjX1DZcY+qG72mvRMT7rhKvYpQ1mLwk1OKDgE8bXjc+8plXY8UE
X-Gm-Gg: AYBFou0V4uiCHUb5EECru1tA7A2E/ISAmHT6XPMbeRtjU4aPoBqg81DTNgZMEHN86nk
	Z9GquHMKA8+pTlvB6BtHXqBTMs7YtkkmUdSwFBvx5cm5LsOPcQJlPlokp3dcbJYAtVbNwn37nLN
	fgQXW2jFBwJk73w5KurZIozHFFP8/RS3B72sI5XqY0pswz3QE9g7MfQtBLjnSpGI1FhRIQVrDtk
	jb+6gsAZGio3bHysYtT840zqjLslegE0DO8XB4b8SVRsXHOePpTgn70JszMDVESnEk8ehvycTwo
	jXUDvmhX4hxWwh2NSI+JZeqkWsZSAEdUoQm+miREWiw8iheZ+lAaONt4iuuRHtM26jlVJnE6AOy
	i8g03/amLBycYhAb888kDsTPwqObeVJODcpDpBnhmNvzHOM4o/n2WqpfTn6+taKtyj09asQmMrO
	Ioo5gqFA4i2+wm3Wvs4QLBj2IjscuPUW2V55Km0Rl1i6SwjO7byyRaOp150FffBlQDm+vMChLZI
	lyndSH7cc02GQAofdBG8lGtgRyDyVEhryQybnWV7M7L7B5hNrINlEdEByembB3x5Ee5hC92UsnY
	jN+SNxHZHdfI4Xt2oPhzEJyVaL32zNgOWt/VsgYBpvOMlHEff4ZsqMyanZ2owYzjWvEQgTA=
X-Received: by 2002:a05:693c:88cc:10b0:366:6644:2839 with SMTP id 5a478bee46e88-36a202bdcbemr4374221eec.3.1793205975183;
        Wed, 28 Oct 2026 09:46:15 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm7821964eec.11.2026.10.28.09.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:46:14 -0700 (PDT)
From: Henry Zhang <henryzhang62@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Henry Zhang <henryzhang62@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] drm/vc4: dsi: Set the transfer result before completing the transfer
Date: Wed, 28 Oct 2026 09:45:26 -0700
Message-ID: <20261028164539.3471833-2-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028164539.3471833-1-henryzhang62@gmail.com>
References: <20261028164539.3471833-1-henryzhang62@gmail.com>
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

On an HSTX timeout the interrupt handler completes the transfer and
only then sets xfer_result to -ETIMEDOUT. The waiter, which may run on
another CPU, can wake up and read xfer_result in between, still 0 from
the start of the transfer, and report the timed-out transfer as a
success.

Set xfer_result first. complete() orders the store before the wake-up.

Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 5ed3c35ee..aa2b46fb0 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1526,8 +1526,8 @@ static irqreturn_t vc4_dsi_irq_handler(int irq, void *data)
 		complete(&dsi->xfer_completion);
 		ret = IRQ_HANDLED;
 	} else if (stat & DSI_PORT_BIT(INT_HSTX_TO)) {
-		complete(&dsi->xfer_completion);
 		dsi->xfer_result = -ETIMEDOUT;
+		complete(&dsi->xfer_completion);
 		ret = IRQ_HANDLED;
 	}
 
-- 
2.47.3

