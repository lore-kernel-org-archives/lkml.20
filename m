Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F95187F2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790030495; cv=none; b=Tgd7QoGlBTocZeEtcWYkDZBdfDisrutAFtxIQu15CbfR0CZAjn/CBwiI++Gz3XAn46CIIUhloB+I26aprRc9P5Cwq2eB82GA6q4CGlHKQIfUIcOU0ymsACoEnkCwR1hhOvCnaHNfvdKBlZGM5rohNDMbenWTopKam7i08XVGtKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790030495; c=relaxed/simple;
	bh=tTytPSqrvOxLJfdsT1YrS+2UKUddGzFBsIq7N39JHw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MQ1V5R4G44NYqXv5H5yapHsFQVZvFDpSx19suIk1tnIvpxofygYbKkPnJFFnEzDxS0l7ve8d5WH8Lw6CGxNlTtQUNGPwPI0VzkyQpvEhGCV8our50tRD4bNcOZgSoKPH9bQejE+HmSrZrWaQ/l/t6GhpP1872VBoPSnVa7GAxhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBLtS2bP; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBLtS2bP"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5329fc7b325so23373391cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790030493; x=1790635293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2UnjeezhHJ2PWvmnwldEhPxyIxvsTbf/269E/fdalA=;
        b=cBLtS2bPPKVj8lYeipLSkc4ihplO/OEoBRuTH5ACfNStxh9nSuBNL6tvM74yvWsG87
         jyE/kdZUGy02frhLOth2140zCJGYQ55xVBV5CuZvvOlS5U8K5oMbnC9b85Fwb9kjUkNs
         ys3Q6v2K2oFcuJ0caaKyA/3+vrsvFlh7sSftcW7Ni0wtiit/wln/eKSFZHeY3WA7JGMj
         3fXVGjLb4gKlP/sRqFXFwRW0PmvF8PfiGV/dTU0FuC1TgEEfVgTXXnxCwtJJ0GDR4qTU
         iFDDlwVFJSlyjmUIhqiyljIDUpww9i9dmgFuZuKUtC6fk8WXN60V1pLvgzqm7mbHAY0m
         x7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790030493; x=1790635293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2UnjeezhHJ2PWvmnwldEhPxyIxvsTbf/269E/fdalA=;
        b=riqo3kJEjmbp0vPwQ/CwjlsOx0KDYBHfUTV4I0XTvHlxMtWXqbhngDTWJDup8PZ3+8
         dLl4RiyPIN/Mga9FKJsG+laELjXzCIZUYoAsLNiklRKzUC5FRG9I3RkeNsaWa9XhrV4j
         XCh4SGsE1jjMO1CsKd5Qo84gDiIe/yO4Hbda6bVS9g/ArJwPFM6Mb01w8MrgAeh24Prf
         XGk5k/qx5pR6+4E70Gb9MPt0PM6tOnS8CkzmlQtKp8oRFZYFLi4xni1IbB4D7pgmS9q1
         P9m7azXCcL2JTZ+lKbI4IpZQmFaNvJY5IFX/k/Aqf9xgyfxAurHM5Lwd+4MZ9Ol/pzGI
         4y/Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7GkspfznwDYuAnEWms6iALCtGCl6fbUMDgSHRHGoDh7nIh3pgc4Oe0makJNuor/HIXHcukcBmq1kjCdg=@vger.kernel.org
X-Gm-Message-State: AFuF++l74ibzDiJkQQlz/NuHRkSCSBgqEjzaE9MMdsodIZuwwM4WJ65y
	1rYtlaV146oh3QyGTDvV8ZnSNHsHqLbpxguYU+GmJ1ydU1Wkq5W57uE=
X-Gm-Gg: AYBFou1k2Tw0js0tXgKv7Me1rV0GaAyghnlvk6NCOMtckCOtOyXy6Fp209G9OHdSXw+
	fXthTcKD6Nvw5QD3nKp9fw1gHUbQ75ShxxKuLAlunOlmSPF5EqmPTq2tgwwzeYkBl6soENoGll9
	TpHlZvgmD0fZOwPzOsC+H/ma+twiSVa0mzspu7K6zPbcm+1EcnHhYFBdNjiAbRRqc5jWPEZ07GO
	e52QcroT77A5b+sHpwVCAtHxTtYRhJAlBtrjyExXDiBt2t1gZOI1zRA0QnOsoYjSJuF4ucCs6CO
	Wlp4AwMv37ntiliGROJn/150LVTDYskzZMxyVd1LPsYyVc1nU52ZA1oxxPAzNBYFZoVGjPItPlW
	jowpUPGlt4BtndAm1CtayE0zK1TfNla0xuqrDuJHrdJvT61baitMfvL7nFzWZOUtf3vwEpG5+UA
	X2gvl7V9onF9o9DO7jFNfJth2WLBLjDxBv4/h/yLYg6GB74x0iAolaICU9Itiz3rYUNCI1BRzWG
	cnhyEv1ImtMur270QQzDTt9upYTK+JweKJRAS8NAvavKAOLIMc9JOM1a5+g90n+fTutPDFhP0vA
	Zyu5I2kJb2ZUwkgHx1ukvvKwVKCa
X-Received: by 2002:ac8:5a8b:0:b0:532:a5f4:df25 with SMTP id d75a77b69052e-532d8e4f628mr30628351cf.57.1790030492569;
        Mon, 21 Sep 2026 15:41:32 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914024a1b21sm661856d6.15.2026.09.21.15.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:41:31 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ijae Kim <ae878000@gmail.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usbip: vudc: Prevent transfer timer rearm during teardown
Date: Mon, 21 Sep 2026 18:41:30 -0400
Message-ID: <20260921224130.492681-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d96209626a29 ("usbip: vudc: Fix use after free bug in
vudc_remove due to race condition") made v_stop_timer() delete the
transfer timer synchronously before vudc_remove() frees its containing
struct vudc.

That does not close the race with the receive thread, which is stopped
later through usb_del_gadget_udc() and vudc_shutdown().  The thread
calls v_kick_timer() for CMD_SUBMIT and CMD_UNLINK packets, and
v_kick_timer() deliberately calls mod_timer() when the transfer state is
VUDC_TR_STOPPED.  A packet received after v_stop_timer() returns can
therefore enqueue the timer again before the vudc is freed.

timer_delete_sync() only drains the current timer instance and cannot
prevent such a rearm.  Use timer_shutdown_sync(), which makes subsequent
attempts to arm the timer no-ops.  The transfer state no longer needs to
be updated, as it is freed along with the timer.

On a KASAN and DEBUG_OBJECTS enabled x86_64 QEMU guest, repeatedly
binding the device, submitting a request and unbinding it produced a
"free active timer_list" warning followed by a slab-use-after-free in
v_timer().  With this change the same harness completed 4000 iterations
cleanly.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: d96209626a29 ("usbip: vudc: Fix use after free bug in vudc_remove due to race condition")
Link: https://lore.kernel.org/all/20230316180940.1601515-1-zyytlz.wz@163.com/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/usbip/vudc_transfer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc_transfer.c
index d4ce85c4c6a2..4146b746a320 100644
--- a/drivers/usb/usbip/vudc_transfer.c
+++ b/drivers/usb/usbip/vudc_transfer.c
@@ -441,7 +441,7 @@ static void v_timer(struct timer_list *t)
 	spin_unlock_irqrestore(&udc->lock, flags);
 }
 
-/* All timer functions are run with udc->lock held */
+/* v_start_timer() and v_kick_timer() are called with udc->lock held. */
 
 void v_init_timer(struct vudc *udc)
 {
@@ -490,8 +490,6 @@ void v_stop_timer(struct vudc *udc)
 {
 	struct transfer_timer *t = &udc->tr_timer;
 
-	/* Delete the timer synchronously before teardown frees udc. */
 	dev_dbg(&udc->pdev->dev, "timer stop");
-	timer_delete_sync(&t->timer);
-	t->state = VUDC_TR_STOPPED;
+	timer_shutdown_sync(&t->timer);
 }

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0

