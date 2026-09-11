Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D984456E1A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112798; cv=none; b=PhRjTr2JaIvjUvOQmIzLPxeDglRF3jo+qKyDIHf5vPijOqpkln8v6bVRY3gHEg627TfS4U53d5Y+rICs7HL9She5qadmpvVt7AB6s4fBzfk8wPsToC1G9d9pf07w4MMG5vUT9OUG0t+++yP0Iveunu8ghB2FyJuLqV3oZEcELiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112798; c=relaxed/simple;
	bh=604OtLtGo8WzuttyUq3KfWIsN5zmCdMCXYETZ3KesMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fdi9TnkCgJ+UMUDFQRXmHhshQPMdbbYFVS8rAotpg1hmAzkLaD2bVqjxmzbaio8n8SeCW2JWGmB+YUvFw7eNQg3httJBZ2cow19H2ytxfXqMbsysdLPj7iFGhtzWs4VpPCF1ILwnhgNZphqaEzZGcgIcvoopybJfubjeyDNPyPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=NFrSbSZJ; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ay88uBCL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="NFrSbSZJ";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ay88uBCL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 11A1B1FD9B;
	Fri, 11 Sep 2026 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789112791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G7mZMTjGnPHtcBZi7OBSQGA9D//3qwcln6QeXExW9WU=;
	b=NFrSbSZJmWVNgWLEcRzheoyl4TeMd8uru6LRFFuNt1twMWTD42jtW65uyZHtEx6MnpdTzR
	O+mZcVkol+gSF4oubaKno+AHXSviWIpor5BYIFlZH770WDoacRr41M1gZ4iJcbkK5mrMpq
	MChlq0LP4Ni6D2jP7xLE+9Zq+0QTU7M=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789112787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G7mZMTjGnPHtcBZi7OBSQGA9D//3qwcln6QeXExW9WU=;
	b=ay88uBCLsDcszhe3pjo2/EBLLAer9+ntFSaR4sOtWdcNv8gyLEE/CzW/hrDunbzL9e4k/z
	nxDfg0IK+brMKdSgC9M0jDkY92fvWTAw6Hs9hK4pZNEaHUcVVoendEHongFUSr1y2o5dwX
	r3M1ZiWdIE1NJL3ageC9y4f240JzwC0=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0FE9137CA;
	Fri, 11 Sep 2026 07:46:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FlvGLdKxo2rLWQAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 07:46:26 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 09/13] drivers/misc: Stop using 32-bit MSR interfaces
Date: Fri, 11 Sep 2026 09:45:26 +0200
Message-ID: <20260911074530.3140830-10-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911074530.3140830-1-jgross@suse.com>
References: <20260911074530.3140830-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

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

