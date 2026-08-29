Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74798327BFB
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787965224; cv=none; b=qw5kxI7cAITEIdltSJ7z9HA3BacodXumDxCkYW+TJC0WVTJ2dNa551lz8OhWUromMMIILhbKDAiiQyyO30SqC0i4AM+V2sSuBbbXX0um/3M2pN5ncsEDt+Ip22giyNxZP08w4FDuzrafI+P7TLIjFo1axQEed8Gph/vblY+GQ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787965224; c=relaxed/simple;
	bh=Vk/Mww83tU+iFDhSWljSMuGLoayHgkd/y+pTY0IaHJQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aPRwK3qLscXE3sway3yUqhlVDznCcpUadh+xhYjf4BUPc7FQKlVmq8R80c2YkiLWs4TcSGlc7CijLvjScD8iIPgo1XVLOE5P/QiiJsWo+xYQHS1fmBlf8QjfmXRU3QWFkbDcW3UtEf7g/g21o5+W35N11dQ8QBsS7APKogT+/FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rq43wm58; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rq43wm58"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d733799ebfso23199255ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787965223; x=1788570023; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xL/+Bog/PbUCDB7Xzp1U1OyiVez+C+McjX7yjYAmEss=;
        b=Rq43wm586fqFkuYYVuTeHk+wGxIkE3BTMnFq+J/2O8QH7sr0PRe398zELXs2wey90J
         p5xbZvBPLvypnkbDCTYwctI57vHwhixtHObcvmOLnAJSADFo8Eom+RILtiU79dJOxR3C
         EqY3HpjpUX6aEB34mLS+h4Ax54eP/3TtKgTbZEd5bsc+jUZ+vf9VibiCrEMI6kG859cN
         +7TLTnlI0q4+jHybDSWNNTucKjDCLh5cQ4JskhV095r6p15IviL63n1dkDKq6gqWccXR
         hROmfX7ec5ye7jeRi0E2h/PyHKLu7Qh+3dZ9IJcy5+SR5SmI1sMkRcW8anbeEjEyxDv/
         fukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787965223; x=1788570023;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xL/+Bog/PbUCDB7Xzp1U1OyiVez+C+McjX7yjYAmEss=;
        b=oX1Y/WzJNjdC7/ZjdN8T01dkMQhRexW/0fsKBaUO8+s8XaY3V4vROpRm5RHCxKcz8K
         0EiNB+TD6T54qJ/4ZCdSooea9OHabzk8zbZ14lhnGSZBGPQ6kRIFBQwCtaHI0hoVX5H3
         0XOWOHAw4BUnqFR0xkkHqwg7Q84TfEShw1pcrpsRPM9rwTyKXeqYrRZR6UvSSAhozY4i
         86PF/p1QdEYASJgcSUoBESgVxt6ETebUigV26soKjc/KKHZW+t9uIkS0PN1hsqPHZvHV
         lh5vq2zpm3Uj/Byw0aAaXYGGMZ3StWTwNtQnKLfoZT0WvPTWHW5MQ/gkq7ZjkucURXOZ
         m6yw==
X-Forwarded-Encrypted: i=1; AKwUvBzIkSUw/hGicKNdhmZGR0Pq8lGHNs3yo9P5ULNTZPueFKyRdtkGK+riOLMK/DgdcKtcI74uucNGgbIBdgs=@vger.kernel.org
X-Gm-Message-State: AFuF++m93OLsefBhvpGdx08fV2wrtlNChCHHkuHmi1lM+xygujnCUVO+
	aOjVgILekvt/4qjLwQ8VE6RdamlQAxMJD7dWiCEyH6f6wQYKWV/HMaWbTwpaoRf415Ml7xHXSrX
	1qE68vcXt7Q==
X-Received: from dykg10.prod.google.com ([2002:a05:7300:578a:b0:311:55c2:34f4])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:efd1:b0:2d6:f988:398f
 with SMTP id d9443c01a7336-2d74df00b5amr148874075ad.12.1787965222590; Fri, 28
 Aug 2026 18:00:22 -0700 (PDT)
Date: Fri, 28 Aug 2026 17:59:55 -0700
In-Reply-To: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com>
X-Developer-Key: i=mrungta@google.com; a=ed25519; pk=2Bjwbv/ibL10QnyvK9G7DoKpffXy7z6+M4NawEYgYDI=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787965218; l=3260;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=Vk/Mww83tU+iFDhSWljSMuGLoayHgkd/y+pTY0IaHJQ=; b=r+cYTwTBM07TZP2PN6YtYuKf2jtaIvPMv1gCnumMdOaKjOUvDsutUzxk4hyjKzeL41KrK+y+z
 cNnoga5rZe6AJVMbhr3PdVGSMN1HtgsERee3b2G9kcuRoMpA0DQ4MUo
X-Mailer: b4 0.14.3
Message-ID: <20260828-qcom-wdt-nmi-series-v2-1-363979fe6b6b@google.com>
Subject: [PATCH v2 1/5] genirq: Synchronize in-flight handlers during NMI teardown
From: Mayank Rungta <mrungta@google.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A. Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="utf-8"

When freeing an interrupt requested via request_nmi(), __cleanup_nmi()
currently tears down the NMI and frees the irqaction structure without
waiting for in-flight instances of the handler on other CPUs to complete,
which can lead to use-after-free conditions on module unload.

Because NMIs cannot acquire desc->lock or set IRQD_IRQ_INPROGRESS without
risking deadlocks, synchronizing in-flight NMIs on other CPUs during
teardown (__synchronize_hardirq) relies on querying the hardware
controller state via __irq_get_irqchip_state(IRQCHIP_STATE_ACTIVE).

Enforce that any interrupt controller claiming NMI support via
IRQCHIP_SUPPORTS_NMI must implement ->irq_get_irqchip_state(). In
__cleanup_nmi(), shut down the line, call __synchronize_hardirq(desc, true)
to wait for in-flight handlers, and only then tear down the NMI
configuration and deactivate the interrupt domain before freeing the action
structure.

Also add a WARN(in_interrupt()) check in free_nmi() matching __free_irq()
to prevent freeing NMIs from atomic contexts since synchronization and
resource cleanup can sleep and spin.

Assisted-by: Antigravity:gemini
Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 kernel/irq/manage.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 2fbff2618a1e..61384925b921 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1379,6 +1379,14 @@ static bool irq_supports_nmi(struct irq_desc *desc)
 	if (d->chip->irq_bus_lock || d->chip->irq_bus_sync_unlock)
 		return false;
 
+	/*
+	 * NMIs cannot set IRQD_IRQ_INPROGRESS because they cannot acquire
+	 * spinlocks. Synchronous disable and teardown require querying the
+	 * hardware state via ->irq_get_irqchip_state().
+	 */
+	if (!d->chip->irq_get_irqchip_state)
+		return false;
+
 	return d->chip->flags & IRQCHIP_SUPPORTS_NMI;
 }
 
@@ -2035,10 +2043,6 @@ static const void *__cleanup_nmi(unsigned int irq, struct irq_desc *desc)
 	const char *devname = NULL;
 
 	scoped_guard(raw_spinlock_irqsave, &desc->lock) {
-		irq_nmi_teardown(desc);
-
-		desc->istate &= ~IRQS_NMI;
-
 		if (!WARN_ON(desc->action == NULL)) {
 			action = desc->action;
 			irq_pm_remove_action(desc, action);
@@ -2047,11 +2051,20 @@ static const void *__cleanup_nmi(unsigned int irq, struct irq_desc *desc)
 		desc->action = NULL;
 
 		irq_settings_clr_disable_unlazy(desc);
-		irq_shutdown_and_deactivate(desc);
+		irq_shutdown(desc);
 	}
 
 	irq_proc_update_valid(desc);
 
+	/* Ensure all in-flight NMI handlers on other CPUs complete before freeing action */
+	__synchronize_hardirq(desc, true);
+
+	scoped_guard(raw_spinlock_irqsave, &desc->lock) {
+		irq_nmi_teardown(desc);
+		desc->istate &= ~IRQS_NMI;
+		irq_domain_deactivate_irq(&desc->irq_data);
+	}
+
 	if (action)
 		unregister_handler_proc(irq, action);
 	kfree(action);
@@ -2068,6 +2081,8 @@ const void *free_nmi(unsigned int irq, void *dev_id)
 {
 	struct irq_desc *desc = irq_to_desc(irq);
 
+	WARN(in_interrupt(), "Trying to free NMI %d from IRQ context!\n", irq);
+
 	if (!desc || WARN_ON(!irq_is_nmi(desc)))
 		return NULL;
 

-- 
2.55.0.897.gb25b4bd76c-goog

