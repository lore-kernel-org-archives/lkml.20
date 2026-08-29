Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921B3A6B92
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787965230; cv=none; b=NiqVo0fFJNQikLBCeMEy1v4fk7V0Dc6BYAxkxb0T90crDiwjPKpro4OaAg4ru8eycRm4ApiQ+hFeAbJDKl4Z5oOyxjc3gSBk3UZGK3svhkM1N5YEVIPDPeN9/2AUktMbToeAy6Wm7f7o2vttLgI5x4pQb3feTTDE3sV6W1kb+WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787965230; c=relaxed/simple;
	bh=YCBb6JCBz9uYY2aQS0mNeRjnKbSKsvsyrD2Dfk1TJ64=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mOU4eXP+uh2MNULWQxV1r1T/JCzRTc3OxbnfYsXoAu8b2bFGEtT/DZ2RKmaymA5tuxMqdJeFFsBfEB3xNVxHZFY0yb+3lr3tyJ0YGXemYMX0P6767KnUGJNmGbjDOTZGjKMMR2ClDE1VKE9xkjiWUPkpTPv+FEouIUOCzP8lorc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hRRx87hD; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hRRx87hD"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso1654676a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787965226; x=1788570026; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lOCsF+Q/dEN9C/W+xZWUHpAFMeTYzX55pmMwwrUJKsE=;
        b=hRRx87hDYI0IiaSLgSLJ768W/kTd9QGs68+uhoIX9MwVQZHKR/JfzLUKakIqcCfgxj
         dZ5A2nVj6xdDj8vI8q6Q4ggzYgXG0FW59ggOE/QN2IMssxBT8t6KSPlVHCq8+lOoX0hR
         6G9y44OE8Ae9DdcFOaBU3MbUauvWsCWC+rtrYFAYOFMjPFukJSM2Z+2u3PGmpkdYWgto
         i+Kyy7OjPQGljlq1NVmFmcnuvUM7u73r/ZjnRY2Q3WxrqTnX7Sr46mOxagvX0QXXmZK5
         TaLys9FiOOxXVtQ1WRaSodz+PT+LtAMcdN8JNH0zOC63Fa36RmiJpNBUv8XrGkP/LjSE
         frFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787965226; x=1788570026;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lOCsF+Q/dEN9C/W+xZWUHpAFMeTYzX55pmMwwrUJKsE=;
        b=lhTidxdcLOR4/oX25VYxqwl/9Z6soCa4xsnXwsiCbY0Iqflu58B6YTPVXnbbyYusIP
         D87OHfR0nGhiW7/FD5KAPhPyA5biPdfMkv0YSw7CojTa/EjMA2eeEkTckwGfpo/rN+ti
         SLZgyAolmo4Vq+F9XfJxrRbL+dilcGXg8OEGbMrHYm0tanVnalzgNeW/1Pgos/mBvrwe
         vqaYw4TmIwQqCPqyWVvIGYgyAxe8z85O6RdNyM3+AGJy7lOiNB64QNjIX82PBmyi0Y9Q
         p3wsMRKhcOz92RjnOe1zKFcDnz2rl+BVW6FdQUG1p85EQzVuDKFtFkx5KskFyHBIYqfG
         5Vog==
X-Forwarded-Encrypted: i=1; AKwUvBw/xiGCwh9MIXAHDFypSYoGYmqX7NP9l4bQTortzwn1OfMF261SDhsW9p6MBkrILslSYzy1rbSCpjbiPhI=@vger.kernel.org
X-Gm-Message-State: AFuF++kDXQuOJiPIY1r190BOAf9lwL2EdM/A9nLTUzEVMxX/JN3EsTbh
	eiBqkl6xjdcPl2m7Hml1I8Owls+g/vcQwEoICiY3e5XbCuhBRRwAlu0FBvqha3D72qtQZcbPdrH
	29NrP/pzhfg==
X-Received: from dlah10.prod.google.com ([2002:a05:701b:260a:b0:13b:9fe2:1c73])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f0f:b0:380:540:d499
 with SMTP id 98e67ed59e1d1-396d0ed0023mr21152806a91.6.1787965226318; Fri, 28
 Aug 2026 18:00:26 -0700 (PDT)
Date: Fri, 28 Aug 2026 17:59:57 -0700
In-Reply-To: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com>
X-Developer-Key: i=mrungta@google.com; a=ed25519; pk=2Bjwbv/ibL10QnyvK9G7DoKpffXy7z6+M4NawEYgYDI=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787965218; l=1613;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=YCBb6JCBz9uYY2aQS0mNeRjnKbSKsvsyrD2Dfk1TJ64=; b=r+FkIG3uoRHWf8zvZBgP2LQJplrrII+2fgmGZr8wQQQ2+GsRnMTGG35UZNGl1Z6BWeBhh1pd5
 K/xVzdb6L/HA8PJvG3/1noyvj3CcVRcUDkjd0lgDrkwGqB+4wjn32oy
X-Mailer: b4 0.14.3
Message-ID: <20260828-qcom-wdt-nmi-series-v2-3-363979fe6b6b@google.com>
Subject: [PATCH v2 3/5] genirq: Export NMI APIs
From: Mayank Rungta <mrungta@google.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A. Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="utf-8"

Currently, request_nmi(), free_nmi(), enable_nmi(), disable_nmi_nosync(),
and disable_nmi() are restricted to built-in kernel code because they are
not exported.

Export these symbols with EXPORT_SYMBOL_GPL so loadable kernel modules can
register and manage NMIs.

Assisted-by: Antigravity:gemini
Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 kernel/irq/manage.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 40013aa94481..ded8cc33381c 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -766,6 +766,7 @@ void disable_nmi_nosync(unsigned int irq)
 {
 	disable_irq_nosync(irq);
 }
+EXPORT_SYMBOL_GPL(disable_nmi_nosync);
 
 /**
  * disable_nmi - disable an nmi and wait for any pending handlers
@@ -781,6 +782,7 @@ void disable_nmi(unsigned int irq)
 {
 	disable_irq(irq);
 }
+EXPORT_SYMBOL_GPL(disable_nmi);
 
 void __enable_irq(struct irq_desc *desc)
 {
@@ -848,6 +850,7 @@ void enable_nmi(unsigned int irq)
 {
 	enable_irq(irq);
 }
+EXPORT_SYMBOL_GPL(enable_nmi);
 
 static int set_irq_wake_real(unsigned int irq, unsigned int on)
 {
@@ -2110,6 +2113,7 @@ const void *free_nmi(unsigned int irq, void *dev_id)
 
 	return __cleanup_nmi(irq, desc);
 }
+EXPORT_SYMBOL_GPL(free_nmi);
 
 /**
  * request_threaded_irq - allocate an interrupt line
@@ -2372,6 +2376,7 @@ int request_nmi(unsigned int irq, irq_handler_t handler,
 
 	return retval;
 }
+EXPORT_SYMBOL_GPL(request_nmi);
 
 void enable_percpu_irq(unsigned int irq, unsigned int type)
 {

-- 
2.55.0.897.gb25b4bd76c-goog

