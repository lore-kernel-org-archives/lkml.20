Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141D034FF74
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694263; cv=none; b=jP0L6cTshy304hcbYavoYeCyqNBM7kF9oX3NTCiZ04bKTCnTKDy9HF+Y4kalvFGYvwyYU0jQqa6h658wfEnQZmxWy21eMnQONxKJVdIrNDT3fdPLjQN4BMUbb4CXnrzil0CLN2m5/rA463bWh26jM0BQjnMDjyyaIoKIfUAEQWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694263; c=relaxed/simple;
	bh=ctXSxhL8cB96oM2LlBR4kk7hbE12PJXfiPWlYJLZFo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m6xjWl99dxS9um1pDfHQ8ip2Gq8Ci9MjbbP2uCI5l70nb7+9VeaJo6bCjC/g6Ywka0GLWMtmHze3QLZ1WrifedFc3JV1Dz8zL5GFHdvoJL9VgzBQq9ukAZpzkmUE+l96RIOi7hZkRc9TGDqVVLvl2AeDCD81SG19KdOJtgzSr00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRzkyfQL; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRzkyfQL"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85e68bdbcc1so34359127b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790694251; x=1791299051; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
        b=dRzkyfQLetYpbbmiXtBUtOfaMMMw5wu8Yhdh21W4oOXf7aCPZPlGxbV76gD30R7HI3
         8I7X+cyR/zVXQuI18na54naOwGZDYwfKC2JZMPTH2TZ1+k/k4l8EleNhEfs0kd03+V2W
         6XFt2Bky0lGQz1WqD+C8yywbwIJESihqI3U2WbRhuqjwVdXuUzyNaB/zLkuOsyuIci3O
         m7yBd4m1EY1u+03+GsffFmqopAnuIvfvglIkFMhz0wDLKmmX3IwvBnnd/TJhmOV8UBAL
         ZnZjDE7yhRxYsg1eSZBy22avhMer3J36whLN7q83vp6tTbAvyFijiiwtv93hKFy2qj4S
         8tKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694251; x=1791299051;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
        b=1PdP6rXMaXfLRyzW7DyH7mgk1LC7DTrb+Ynp4bged9PL65BNyIGXEY+ATfMMsGGCSe
         LgoRfxv0dXWuGO0iNn9WyUWiNSWavP8xUQGhecLWVgMpCggu24SaxCaQoz5p98j7jTEj
         WTS0dc4SxLKKww4BqVDkCyrqT8sk+YiUzNQxZaVipc7RyzZcnR0MagEyjmIkN4/tvjXt
         Z+vCu3khxoHuHfCJCvcn5r1L6s3v2oUDKNnXZT/JSCK0LVDZLUX+DDPYUhZp+ci4LgJH
         OeAfT3W57e8kTBAdQgDBaCG4RpCgg9xbTO7qmPrrSEn+/RJfMrF79Ce5P7dlGGd6xoCW
         PmNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyKhDiHPUkXCdWzT9myAdOST2sMcJ4UUulRfG+tKQn6GXTZ//hFMfGVmoRJVwU0KNqeoNIA49SHp55E6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJztO0gkm0EgMOeoRIZTYg6GIDMLY7rhBhgwKCV5eyyCx5NQvhT
	+KtYUmQf2LmBtrbIf/Gd7SfBXhvecsLE9cfPNBw0YasyFW1eDFcG75SZz1yk2mmV
X-Gm-Gg: AYBFou3j7RzQzRTRD/6CZMerWVlTXs2/TWtbdm5+u63hKag+5GYTyd9JrInppvPNSO8
	NU+Unok3A2OkBncI1A9k7olLkK8+1XWFlF8wKqrfvIxHQCpqigKJGvELfskl33QdufZqSHz3av6
	M7VcQ2UtGoHtJhl8FsbQFWVUf0umwQ16M45Q6B+oHn+rhWlM/0W/8kZFJ9/UPnJi7PJ7gaB88fN
	yA7d1pILzO6ao46vdPlOrFwlkXrKEHho9Glw7zSI0ThgoLAgyjIj9ygeTIx2y79j7rfa4ybVHKa
	CKnmFhITI4Y6lt/PMaF2bVnmkAHWVc0H+1r6L7ju1x34AR0m6dH5C3RvUkut8rSjezwyomi/i3+
	eBbSalsxQsgaMb/kL3O4I1e24d72JqsgySBJgw5fJzK9glQxn/matIQkGYs8l242Iyr+C7q326u
	EAk4zeb6UopEG9aq9ARiFuNpJu5tJg9GV6kgcgsdDryVYhkSc0lAAndg6wlafcSivMjA==
X-Received: by 2002:a05:690c:e3e8:b0:841:e9e4:8ab9 with SMTP id 00721157ae682-8a64949ac2dmr92204867b3.25.1790694251364;
        Tue, 29 Sep 2026 08:04:11 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ab40a699b9sm9871467b3.43.2026.09.29.08.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:04:09 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 29 Sep 2026 10:04:05 -0500
Subject: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-usb-mtu3-gadget-completion-callback-fix-v1-1-8b75b48fab96@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790694249; l=3859;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ctXSxhL8cB96oM2LlBR4kk7hbE12PJXfiPWlYJLZFo0=;
 b=yw9LSE1i8GiNOL28F+XSvLaDLH7wn1idNjPtWu+r9QdBnFtrnSjo5+Rv8f6OF2gtorNSDOtWI
 rwGwjhX4Z1JB8caumEIvOiFYMI3N524g6ZrHKXJhw00Al65rItA0TYm
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

mtu3_irq() is a threaded handler, so it runs in process context, but it
takes mtu->lock with spin_lock_irqsave(). mtu3_req_complete() then drops
the lock with a plain spin_unlock() around
usb_gadget_giveback_request(), which leaves hardware interrupts disabled
across the gadget function's completion callback.

That breaks any callback that reaches netif_rx(). Since the threaded
handler is in neither hardirq nor softirq context, netif_rx() takes its
local_bh_disable()/local_bh_enable() path, and enabling softirqs with
interrupts disabled is not allowed:

  WARNING: kernel/softirq.c:430 at __local_bh_enable_ip+0x17c/0x188
    __local_bh_enable_ip
    netif_rx
    rx_complete [u_ether]
    usb_gadget_giveback_request
    mtu3_req_complete
    mtu3_qmu_isr
    mtu3_irq
    irq_thread_fn

With CONFIG_TRACE_IRQFLAGS, __local_bh_enable_ip() ends with an
unconditional local_irq_enable(), so the plain spin_lock() re-taking
mtu->lock afterwards runs with interrupts on and is recorded
SOFTIRQ-ON-W, while mtu3_gadget_queue() takes the same lock from a
softirq (ncm's tx hrtimer), and lockdep follows up with an inconsistent
lock state report naming mtu->lock.

The locking was right when mtu3_irq() was a hardirq handler. It stopped
being right when the handler became threaded without a primary handler;
dwc3 hit the same thing the same way and fixed it in the controller
driver, in commit 84918a89d6ef ("usb: dwc3: gadget: Let the interrupt
handler disable bottom halves.").

mtu->lock is never taken in hardirq context: the only handler is
threaded and has no primary handler, so disabling softirqs is enough.
Take it with spin_lock_bh() in mtu3_irq(). The completion callback then
runs with interrupts enabled and softirqs disabled, which is the context
netif_rx() expects. The other sites keep spin_lock_irqsave(), which is
strictly stronger and still correct; several of them really can be
reached from softirq context.

Both reports need lockdep to be seen, but the context violation is real:
netif_rx() wants either hardirq/softirq context or interrupts enabled,
and mtu3 gives it neither. The fallout on a PROVE_LOCKING kernel is not
cosmetic either - copying a 21 MB file over USB ethernet hung and reset
this board repeatedly before this change. Once interrupts have been
left enabled while the thread holds mtu->lock, the tx hrtimer softirq on
the same CPU spins on it forever, which is the "CPU0: lock(&mtu->lock);
<Interrupt> lock(&mtu->lock);" scenario lockdep names. The same copy is
reliable after it.

Fixes: 13118959cb1a ("usb: mtu3: register mtu3_irq by threaded irq")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/usb/mtu3/mtu3_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a40bf5bad2d5..ed0e426645fd 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -790,10 +790,9 @@ static irqreturn_t mtu3_u2_common_isr(struct mtu3 *mtu)
 static irqreturn_t mtu3_irq(int irq, void *data)
 {
 	struct mtu3 *mtu = (struct mtu3 *)data;
-	unsigned long flags;
 	u32 level1;
 
-	spin_lock_irqsave(&mtu->lock, flags);
+	spin_lock_bh(&mtu->lock);
 
 	/* U3D_LV1ISR is RU */
 	level1 = mtu3_readl(mtu->mac_base, U3D_LV1ISR);
@@ -814,7 +813,7 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 	if (level1 & QMU_INTR)
 		mtu3_qmu_isr(mtu);
 
-	spin_unlock_irqrestore(&mtu->lock, flags);
+	spin_unlock_bh(&mtu->lock);
 
 	return IRQ_HANDLED;
 }

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260913-usb-mtu3-gadget-completion-callback-fix-d334f7e99a17

Best regards,
--
Ryan Brue <ryanbrue.dev@gmail.com>
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

