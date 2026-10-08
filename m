Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBB63D8105
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443980; cv=none; b=hzbXemOHrldwe3lRK/W7cTZlFEyOWwlaxoUy+XoFCKbrvOJuqlJgLFr/kLKojtKMvmIOgsEghxNjkdzIe0yrMwjf1v6GrVHMIHHV/V1kRa5DyOxwSUMxJDeepHrtBKC4+eGDZpPv+qSMw0+JXbLfQFgicSOXVNGvyK7sH2kuwyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443980; c=relaxed/simple;
	bh=604OtLtGo8WzuttyUq3KfWIsN5zmCdMCXYETZ3KesMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5ZthhmIOB4hti+TgNEbSFY7Qwgjvhrn8FqVFEANzepuGm4GMfiBqdDt8W/YcFwk27Fe36oQQ5QmfF5TRhEpixx1zoopIMaB5SICrL4FK9KdgdURFjKW4ojsjSoLCpwp71jd9jrDD+uEBkN2053xYxOW0gNj8wVS+I5m8BjUKHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B3441F786;
	Thu,  8 Oct 2026 07:19:36 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 336A813354;
	Thu,  8 Oct 2026 07:19:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c+BJAwhEx2q4cQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 08 Oct 2026 07:19:36 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 09/13] drivers/misc: Stop using 32-bit MSR interfaces
Date: Thu,  8 Oct 2026 09:18:35 +0200
Message-ID: <20261008071839.2247074-10-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008071839.2247074-1-jgross@suse.com>
References: <20261008071839.2247074-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 7B3441F786
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Action: no action

The 32-bit MSR interfaces rdmsr() and wrmsr() are planned to be
removed. Use the related 64-bit variants instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/misc/cs5535-mfgpt.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/misc/cs5535-mfgpt.c b/drivers/misc/cs5535-mfgpt.c
index cdd0e7bda68d..9abfc44f70f4 100644
--- a/drivers/misc/cs5535-mfgpt.c
+++ b/drivers/misc/cs5535-mfgpt.c
@@ -45,7 +45,8 @@ static struct cs5535_mfgpt_chip {
 int cs5535_mfgpt_toggle_event(struct cs5535_mfgpt_timer *timer, int cmp,
 		int event, int enable)
 {
-	uint32_t msr, mask, value, dummy;
+	uint32_t msr, mask;
+	struct msr val;
 	int shift = (cmp == MFGPT_CMP1) ? 0 : 8;
 
 	if (!timer) {
@@ -82,14 +83,14 @@ int cs5535_mfgpt_toggle_event(struct cs5535_mfgpt_timer *timer, int cmp,
 		return -EIO;
 	}
 
-	rdmsr(msr, value, dummy);
+	rdmsrq(msr, val.q);
 
 	if (enable)
-		value |= mask;
+		val.l |= mask;
 	else
-		value &= ~mask;
+		val.l &= ~mask;
 
-	wrmsr(msr, value, dummy);
+	wrmsrq(msr, val.q);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(cs5535_mfgpt_toggle_event);
@@ -97,7 +98,7 @@ EXPORT_SYMBOL_GPL(cs5535_mfgpt_toggle_event);
 int cs5535_mfgpt_set_irq(struct cs5535_mfgpt_timer *timer, int cmp, int *irq,
 		int enable)
 {
-	uint32_t zsel, lpc, dummy;
+	struct msr zsel, lpc;
 	int shift;
 
 	if (!timer) {
@@ -113,30 +114,31 @@ int cs5535_mfgpt_set_irq(struct cs5535_mfgpt_timer *timer, int cmp, int *irq,
 	 * IRQ of the 1st. This can only happen if forcing an IRQ, calling this
 	 * with *irq==0 is safe. Currently there _are_ no 2 drivers.
 	 */
-	rdmsr(MSR_PIC_ZSEL_LOW, zsel, dummy);
+	rdmsrq(MSR_PIC_ZSEL_LOW, zsel.q);
 	shift = ((cmp == MFGPT_CMP1 ? 0 : 4) + timer->nr % 4) * 4;
-	if (((zsel >> shift) & 0xF) == 2)
+	if (((zsel.l >> shift) & 0xF) == 2)
 		return -EIO;
 
 	/* Choose IRQ: if none supplied, keep IRQ already set or use default */
 	if (!*irq)
-		*irq = (zsel >> shift) & 0xF;
+		*irq = (zsel.l >> shift) & 0xF;
 	if (!*irq)
 		*irq = CONFIG_CS5535_MFGPT_DEFAULT_IRQ;
 
 	/* Can't use IRQ if it's 0 (=disabled), 2, or routed to LPC */
 	if (*irq < 1 || *irq == 2 || *irq > 15)
 		return -EIO;
-	rdmsr(MSR_PIC_IRQM_LPC, lpc, dummy);
-	if (lpc & (1 << *irq))
+	rdmsrq(MSR_PIC_IRQM_LPC, lpc.q);
+	if (lpc.l & (1 << *irq))
 		return -EIO;
 
 	/* All chosen and checked - go for it */
 	if (cs5535_mfgpt_toggle_event(timer, cmp, MFGPT_EVENT_IRQ, enable))
 		return -EIO;
 	if (enable) {
-		zsel = (zsel & ~(0xF << shift)) | (*irq << shift);
-		wrmsr(MSR_PIC_ZSEL_LOW, zsel, dummy);
+		zsel.l = (zsel.l & ~(0xF << shift)) | (*irq << shift);
+		zsel.h = lpc.h;
+		wrmsrq(MSR_PIC_ZSEL_LOW, zsel.q);
 	}
 
 	return 0;
@@ -249,11 +251,8 @@ EXPORT_SYMBOL_GPL(cs5535_mfgpt_write);
  */
 static void reset_all_timers(void)
 {
-	uint32_t val, dummy;
-
 	/* The following undocumented bit resets the MFGPT timers */
-	val = 0xFF; dummy = 0;
-	wrmsr(MSR_MFGPT_SETUP, val, dummy);
+	wrmsrq(MSR_MFGPT_SETUP, 0xff);
 }
 
 /*
-- 
2.55.0

