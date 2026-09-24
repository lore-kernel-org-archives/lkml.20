Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A61B483BC6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286708; cv=pass; b=oTb2fE/VXfZTecRCUZw8Y5ZyeDOCKdsj47vAPqX8kmYt0Yn1+1JqyFmPAnn+9MI+S4b8QdebClSu/FsXyjr4kKWXj9JcwFgUtsBFtLrt8slLrjITK0TonwUz1973NJI6C4rr/c1IILq3TXSgfeeGS4FfcKfHePwYXckcxxXEnww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286708; c=relaxed/simple;
	bh=vwIL4Z9WhDilYVKgXK6Lo2kf/q7i4XxX4sVI/yy9z8o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Zwcb/tJm/jEymCKX36ByCtAPoGbVNCjrj4CUexxxSWi1SG2hEnijKtLNcUcGx33Fs6AXy/oi0vPEAnWTaeUQdqhHHtJaLCvSGWLxX+Q+3uYs6WmLS5AYb9Nvuf8A8ATdHbF8/+XV5C+DB+vZ9FY1LVFfwHyADcI5V85pfSuD9Ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0Ib9wJV; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0Ib9wJV"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso39840466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286705; cv=none;
        d=google.com; s=arc-20260327;
        b=amFmAHUnrGOYHTieuarPKzfoKAMHz11Bbb3bD6w7H0XmOicTnOs5g/mOfRu5yLogD3
         /i5kekqtXn36/Vo971OvBfAWLzYAF9th/UEf9jYZiPKdv3K0nBw23kn1LQdZJN6blAne
         a/j4nsEvYYRMke5piSaMf1mhOeC9Vtlt87UYcLbsIHzvebsQ9Gx/WNPhMD28fuBF0sgf
         DAUBPC1DsIeowPgsxZ05iBBxcocs7Nh7GCMcwFAvcGuh9zsZCxt6iVwA8OdJDexgu2F5
         3z0DFGMN3bRKYGOvdgYRtQQCWTKlly2QGzWNHhW0603sEGfpWWh+fs2WAcWqQgwKFO/v
         8QZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2wsrM4rfWmZ2YkyAaS9ur4eVUQUqD0HI+yn9LbwtrMI=;
        fh=PgLttnoYkLvJ19hxBLLfSG7O16CgRplNUxTn5TRhggM=;
        b=dhguwOS/r+HjFNUMhVvsJF0Xc364KzopoA6D8+fEUI2MbVQTJhF1u4xWw4fg3VhtmX
         NTAhGpyyJohvq995+GnsFsLo6EReeTuefx2O4BNFOoNV8rhGgEeqLW2Mf8EohFn3m3fj
         BgKZJZDWluy7KCf10GWSgS2HUGXIYTiBiIX9DNAcmKtyP0yp5m+CwTsLRQvg64N0L8hJ
         nRhsjrclo9zB+OlNyRTZI/prJAU+/3sE7/MzwOCai5RZY+WiLRcE3JbZ9e7leC5i9m4d
         /hD9RThDRbQPF1gYD5biBZyg2cxx+oF2NgIXdqYUp30h8X+7PUajV2/+/+1TI2HKQnTY
         o9bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286705; x=1790891505; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wsrM4rfWmZ2YkyAaS9ur4eVUQUqD0HI+yn9LbwtrMI=;
        b=m0Ib9wJVOpgOXhNz+/LWE73H9/n9f32eS3bTHMzTlICqb13RX7e3pT9/W8BtTNtrBD
         XysOwGhuQXdUSyHcsO+ZC6Pi9ZFyMgQpY+ZstwoWn9qdo5P8/8JPMM4cZ5RKpI6cR+vc
         gdJjMaEtfXcSTTsxE/eAe9DE/sG7I32kNX5dm/OzaDJwpIFKeTF5wgiLoKzZeH7MqsU+
         8L9r8ckypusVwRgzHtUJV042Cb+ysoFg//jxypA2n845fhOQj+Q7fGjb2c4Sqk+EJRqf
         hPauHJJxSWCQECGCLmGk2nMv7OAX9AFJUIXV5a7m8xJrkWt9cMePzCmRh4Ja5OAXFtbj
         ij9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286705; x=1790891505;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2wsrM4rfWmZ2YkyAaS9ur4eVUQUqD0HI+yn9LbwtrMI=;
        b=t3PnIKqbvaWtL7kZ5VNLHoDlNHW0FciBxnkqoSUhRQagY0SZmlWBOycBLWJ+NasTgn
         0ASTk/GMyDbUbdgx98JxQGLo9J0v4R/9vEPRhCwRusoCnjQKPwblnu2bfl1pRuxDvLh3
         WYa3QdfTuxGJAfPpYxYobQAEx08QKcffJvY0+r4jWsRtlPLL+Yq3jpZOAUA/BrkBnnxz
         X8VWUN7p3JUGayPtNYUj9oTHati4MDJvrFFshyOf92zNKJQBBlk5zxudRy+dBv3TB+Qp
         BQnLTuCiidDPBrDjyrUau3z1B+0RC19Ix+nIiuLWvDVVHiCyia6pu4J9o8rbGyffgC16
         VlUw==
X-Forwarded-Encrypted: i=1; AKwUvBzRY/vCfQADNmHi5jRP8UZdNJpeSBwyiHK9/vv/9qrWfKT2Ni5wTSTxhKNu21iHwlELVe7SJmfdsZVdfrw=@vger.kernel.org
X-Gm-Message-State: AFuF++m6chIYtMLtHlFRHDvx7wdh7K3HiS8mT5J1D5Gx0YiN6ra0FlEF
	451PdyOshkIzKkgpRdbLRPp0jFbmJiIm2lxkHh0bWi5/oeNh3Y3oklcRxfpX88gc6SOzWMzKrjh
	qzrG3rQRLS0T74en84Q9lyNQrYh8okg==
X-Gm-Gg: AYBFou3aWXuP6/WaYZPG4wdufBYYH/xNe2mrIYyHlc/5XKfO7+K4PwkLgOE3rOj4nF+
	oZ2eQN7Jl614ORI/wTyMJ3C6UuZZP+EGM+CVtwMZInp01so/8WDoK/ZU3ntkJmRLolAAo8Yfdzm
	y72AArRXBoJZkb4He1bd5Ov+6VV0IU/ZDbduLwTQwknWsUvmngvfgEJ6DmVA+9L4IOozVGCMu5B
	FG+BVAtO8OMOkJ1b6SwRU8oRjSQNe+uUcsLJ+pIMPl1Nv9F/YYKGKzljmoV4fqEH5hoJPvPKU+i
	OABp+OJQhx2eMWOMxEZ2e1ZJ+nb+YnZs3bosQxCHr+lyHIpntflW2Ii2kZNJfio00qkHZV6JkcA
	K+wNI3A8oMLXgnWTcjB7RGFCrhk5Od6Zaj5MkADDEfecqh3yn2p/9cR4Z1Bw1q0gB
X-Received: by 2002:a17:907:868c:b0:c29:4490:50c8 with SMTP id
 a640c23a62f3a-c2ac20ab6f6mr335227266b.8.1790286705286; Thu, 24 Sep 2026
 14:51:45 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 21:51:44 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 21:51:44 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Thu, 24 Sep 2026 21:51:44 +0000
X-Gm-Features: AclHuK9j7u3HNrpkxbPfkJEXXgXPzlWkFF26AnQbZD5u6GM81J290RQpiIihOgA
Message-ID: <CAGEsz8Gwh=Y31EuTJLUp_jq3HhiizHxt7_ivOuytyZZH06mycA@mail.gmail.com>
Subject: [PATCH v3] usbip: vudc: Prevent transfer timer rearm during teardown
To: valentina.manea.m@gmail.com, shuah@kernel.org, skhan@linuxfoundation.org, 
	i@zenithal.me, gregkh@linuxfoundation.org
Cc: ae878000@gmail.com, michael.bommarito@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit d96209626a29 ("usbip: vudc: Fix use after free bug in
vudc_remove due to race condition") deletes the timer before
usb_del_gadget_udc() stops the receive thread.  v_kick_timer() can rearm
it even in VUDC_TR_STOPPED, leaving v_timer() to use freed vudc.

Use timer_shutdown_sync() to reject later rearms.  Replace the
inaccurate blanket lock comment with __must_hold(&udc->lock) on
v_start_timer() and v_kick_timer(); v_init_timer() and v_stop_timer() run
unlocked.

A KASAN/DEBUG_OBJECTS_TIMERS x86_64 QEMU harness binds g_zero to
usbip-vudc.0, sends CMD_SUBMIT to usbip_sockfd via a socketpair, and
repeatedly unbinds/rebinds vudc.  The unpatched kernel reported a
free-active timer and a use-after-free in v_timer(); the patched kernel
ran 4000 iterations without either report.  No physical device or
remote client was tested.

Fixes: d96209626a29 ("usbip: vudc: Fix use after free bug in
vudc_remove due to race condition")
Link: https://lore.kernel.org/all/20230316180940.1601515-1-zyytlz.wz@163.com/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Describe the harness, test scope and lock annotations (Shuah Khan).

Changes in v2:
- Drop the lock-held comment and mark v_start_timer() and
  v_kick_timer() with __must_hold(&udc->lock), on the prototypes and
  the definitions (Greg Kroah-Hartman).

 drivers/usb/usbip/vudc.h          | 6 ++++--
 drivers/usb/usbip/vudc_transfer.c | 8 +++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
index 5ef0e7d9b23a..c129f4c56e8a 100644
--- a/drivers/usb/usbip/vudc.h
+++ b/drivers/usb/usbip/vudc.h
@@ -157,8 +157,10 @@ int v_rx_loop(void *data);
 /* vudc_transfer.c */

 void v_init_timer(struct vudc *udc);
-void v_start_timer(struct vudc *udc);
-void v_kick_timer(struct vudc *udc, unsigned long time);
+void v_start_timer(struct vudc *udc)
+	__must_hold(&udc->lock);
+void v_kick_timer(struct vudc *udc, unsigned long time)
+	__must_hold(&udc->lock);
 void v_stop_timer(struct vudc *udc);

 /* vudc_dev.c */
diff --git a/drivers/usb/usbip/vudc_transfer.c
b/drivers/usb/usbip/vudc_transfer.c
index d4ce85c4c6a2..ba625622975e 100644
--- a/drivers/usb/usbip/vudc_transfer.c
+++ b/drivers/usb/usbip/vudc_transfer.c
@@ -441,8 +441,6 @@ static void v_timer(struct timer_list *t)
 	spin_unlock_irqrestore(&udc->lock, flags);
 }

-/* All timer functions are run with udc->lock held */
-
 void v_init_timer(struct vudc *udc)
 {
 	struct transfer_timer *t = &udc->tr_timer;
@@ -452,6 +450,7 @@ void v_init_timer(struct vudc *udc)
 }

 void v_start_timer(struct vudc *udc)
+	__must_hold(&udc->lock)
 {
 	struct transfer_timer *t = &udc->tr_timer;

@@ -470,6 +469,7 @@ void v_start_timer(struct vudc *udc)
 }

 void v_kick_timer(struct vudc *udc, unsigned long time)
+	__must_hold(&udc->lock)
 {
 	struct transfer_timer *t = &udc->tr_timer;

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
