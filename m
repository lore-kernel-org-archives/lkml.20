Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636988;
	b=FoW7lfnytZI94Jgtu8aU/4d+ntg6Gq7u0kbanZT867mY5ycGEuu5XLhE+U9Izf9hLHyv
	 UpGnXyWb9Jq8jPUf/lhD6KAMkLlHRc6fnYwxIwkh/CRjEb9zPaWokJHXQmO1Zww5TKTVK
	 x95EsWjyt0EA62aIAsRaZwDmHuZOqxQ1QnI4BzYw4Ie9TRMJF2jw8FGM5anaTvXK5x2B6
	 wXdHBBR37Bi7iOdToezUULAoTMj5wCDmSD/HBAj6Tl2UDxdmgMgw2CoUzEipx9zKDl8+3
	 k0CmwUY+s98rpttO6WPbLGFsthoYIR91YFJN6URLhb1EFP6Xusj3j6BhuI1SlStAt9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
	b=AEuEAIlR7Om4rI4e7LtD1LXQvv13D+rwJ3/BuqVSlZw/6WYgFo3I/4YOn7EdRuXdxauY
	 NJZv4r4W4PefzZtqF+ngiECrH9/kCD4q3Cp/ssEIPJTER0N9YEEXHXB2ZlWDnLnmEqEn8
	 hnWupkvyrqcZd29s2mFL9OLuWpe3ZSPTkKwyitwn+N3i6ZADeZmpowNUxTlo4MQopE8nH
	 yhR5DrUNmeJoEv/c6gxANGbWN3Y62bzWOuom1WNKAP63TWKTku817Sa4X5ndWq57C7GiI
	 xHWS2blEaXsBSUePqpfeOH8mo/PkKe1yc06OMwZ9w4mc/gQI6n1+V9pP+0GsQUvxnJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8zUtrMl;
	arc=none smtp.remote-ip=209.85.160.68
Received: from mail-oa1-f68.google.com (mail-oa1-f68.google.com [209.85.160.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA169606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA169606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8zUtrMl
Received: by mail-oa1-f68.google.com with SMTP id 586e51a60fabf-4a76f63b243so3731319fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636986; x=1794241786; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
        b=v8zUtrMljNUtLz+CqlbFk+YIIGnWVX5EXDm4JNH+3L+QxCcY81FSHga8Vg1+k2gvVM
         XTnwRYpIV52ruhyIQCtA3oLzXLdGlt9WSDkChr7d15A/upKwvTycraCmbc6fXXR7p37A
         R9pe/oh8vfZzrjrumppNEsFY78SgXu4QK8jGdgvwRiYURyi0TH8MqJQrwBHE8gB/JAyb
         DeXACr7q14BBGSJaSCFSEzEVGiO+X4slfS5DXGkFJYJFAi5uODp0MFwA0WogoLxile8C
         h6JSdPdpBDNfbdGiVYXZWOcmWiGlfv7ZcvFE3+PrvB2BoEO0bbBwgKzsIyDFBbUvclau
         roHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636986; x=1794241786;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
        b=XN6Tg59WkCj6E4duuF/d8Ksxb16Ktnj/bEg6Rwb94fiwmAp/FRPCk4Gc2hdKIxS2Nm
         qDWBTL7DR7QIMLz5kw6C4cFHjv3OkmxTahjsJjsaKTgrxJthcDtjFoQfBW5/TUk8C9Zi
         ZrrIBntxh50h0/e0OASiaGDiTRlPt551dRP2iHG3795ScxdlHGFdwB2IYWwiLjksKNNB
         FurEEcESU5v1WGaYvFEUAikUZS6/mwbOfiiTFdi6Or5Ltfz5F/NehyJrOQEx7caJ8TYw
         q51n82r5IEItT4w+6GA8w/MxipYZ6UMys7KYhEOnvqLS36/8Wnt/3rHWSCiKsCN3tsLl
         hyoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWuZ9QDUg9J+QWRJYBUtnK0dU3nC0ni3LkX/E6vrbYxjEhaMTRC31cf4ohqc4HdIlhoIIn3Q9pIs/hRFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XcfFMijzn8dzPfDYIzqiC40P1Z0TJeac9YxXYU15HHsiu3z8i
	HR28I18u9MVr0JbEd/iMYW/LhqjQWDIgCudE7vBZ0Oh4/d8DNIyS5eQMyx1TPmZwbIc=
X-Gm-Gg: AYBFou1WKtRAcEqj6sT7Hi2TJEg6pe4gwcYxN429B123xkDE3fvZCRHDgRgdAsRAfXg
	XTq70C9w/R3f5afAfJzHxfkF+JdzOjGll3dw7SV60201WoaGEH03YS74VBt9/qakGtBKDyuse1R
	32MoXRha1+MkkxApVR47nUPcYjSsG+qe9wgIsDXPnSb/8gFvr4EB2vu8xpClw5gWv/mWstfOawW
	LZAwm5Py52wNIMDjj0hIIrDZZDQO9WjoZ9TH7jMBXF0S2h31ihcYFHhA/kkgplawXxKSvBCiRHd
	GSvvP/Ef4734OAgyv5qy+7aa1y5m/qfYF2cm/Tork+ffspH5+U4cx95H/icf8ULcxa81Lv30lcP
	JYwCMri/x9VVJ9syIQEScfwZsc/KZeIjXKALp5PwIvwStk5MRFQL494PLNtfqcOlt1RNK4qD6ce
	tcF3UMEZjgSXAsT5y3fpFtYL7GOCxYnu3kzORVXcQVxw6eAs/vSk2Pusb7R+RqBZlBiACWqqQlX
	yZ2jkqIHcjDcpzyVDr3+pYcnr4UbNEVgpucqL3fyMAGBH6cT0y9237BcD+HfOkt1ecu5p6K9+CB
	OGr0r8ZIbyXpWPKmVdTLKsR4Jc+6Ysg8OeSj8U35J6q9pVqifytVarYClj4yGEG1H+8Vtp//jPi
	xEmI9mRPDyQKF6FDjqXAYcgzS8pgKryWXmWNq8vHF
X-Received: by 2002:a05:6870:169a:b0:470:e97e:8f88 with SMTP id 586e51a60fabf-4a8e099f2c1mr6622916fac.24.1793636986507;
        Mon, 02 Nov 2026 08:29:46 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167984dsm7251024fac.1.2026.11.02.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:29:46 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:29:45 -0600
Subject: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-usb-mtu3-gadget-completion-callback-fix-v1-1-93c3a6dda31f@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793636985; l=3859;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ctXSxhL8cB96oM2LlBR4kk7hbE12PJXfiPWlYJLZFo0=;
 b=S9dPlOrGvAhCl5WVQYdsJfPpa5BoiRYpZW64kvQU0m9zClp2Ht7qcVyfHxTiljy/6ZkSqDgd9
 C0E4bVjxXGFAHGsSwhRgWmeoEriZ/yCXt7Q3nhq0zbb8GwVF2AQUwWm
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

