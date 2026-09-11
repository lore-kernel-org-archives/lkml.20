Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695B5457E56
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112767; cv=none; b=LJThkgkF0Y6SfzGWL6bJ6wNeggMF5GfG3BH2ktI6EHoxLu2C/iTDM8s8UDxnc5u7mdviwnDa+hstjTEenZVSOCM6OKaGsaOWll6o4LAOVRDyBm95T3TyuhSolHwbsY2m/EaMaQsfjxhOjzB32i7hPxY2y3hQgbqGZ03YBY1IjvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112767; c=relaxed/simple;
	bh=gwHt7MotFvQBQuKYACyYC4fo8s+0BbXyOtR3Y2XMe3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2g7+6eGefJJJDl5xNgqd0iKBs+Fp8Dhim8IuPc15iaLXT9Hpt2F89ySUIt5y6xXFx0IAEaeHUMXAu8mnNHizQlnCkc1S8J+e0uwR/G52uIDI5RkdhJd9uWKfaZ+NGoWNfNfyj7jRbkqFmHMTQrjZ76KO61GLYnrKkEE9KXXnIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C21021D1F;
	Fri, 11 Sep 2026 07:46:04 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46FFE13770;
	Fri, 11 Sep 2026 07:46:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Kzv+D7yxo2qmWQAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 07:46:04 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Juergen Gross <jgross@suse.com>,
	David Airlie <airlied@redhat.com>
Subject: [PATCH v3 05/13] agp/nvidia: Stop using 32-bit MSR interfaces
Date: Fri, 11 Sep 2026 09:45:22 +0200
Message-ID: <20260911074530.3140830-6-jgross@suse.com>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8C21021D1F
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00

The 32-bit MSR interfaces rdmsr() and wrmsr() are planned to be
removed. Use the related 64-bit variants instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/char/agp/nvidia-agp.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/char/agp/nvidia-agp.c b/drivers/char/agp/nvidia-agp.c
index 4787391bb6b4..3e760bc00afa 100644
--- a/drivers/char/agp/nvidia-agp.c
+++ b/drivers/char/agp/nvidia-agp.c
@@ -65,22 +65,20 @@ static int nvidia_fetch_size(void)
 
 static int nvidia_init_iorr(u32 base, u32 size)
 {
-	u32 base_hi, base_lo;
-	u32 mask_hi, mask_lo;
-	u32 sys_hi, sys_lo;
+	struct msr base_msr, mask_msr, sys_msr;
 	u32 iorr_addr, free_iorr_addr;
 
 	/* Find the iorr that is already used for the base */
 	/* If not found, determine the uppermost available iorr */
 	free_iorr_addr = AMD_K7_NUM_IORR;
 	for (iorr_addr = 0; iorr_addr < AMD_K7_NUM_IORR; iorr_addr++) {
-		rdmsr(IORR_BASE0 + 2 * iorr_addr, base_lo, base_hi);
-		rdmsr(IORR_MASK0 + 2 * iorr_addr, mask_lo, mask_hi);
+		rdmsrq(IORR_BASE0 + 2 * iorr_addr, base_msr.q);
+		rdmsrq(IORR_MASK0 + 2 * iorr_addr, mask_msr.q);
 
-		if ((base_lo & 0xfffff000) == (base & 0xfffff000))
+		if ((base_msr.l & 0xfffff000) == (base & 0xfffff000))
 			break;
 
-		if ((mask_lo & 0x00000800) == 0)
+		if ((mask_msr.l & 0x00000800) == 0)
 			free_iorr_addr = iorr_addr;
 	}
 
@@ -89,16 +87,16 @@ static int nvidia_init_iorr(u32 base, u32 size)
 		if (iorr_addr >= AMD_K7_NUM_IORR)
 			return -EINVAL;
 	}
-    base_hi = 0x0;
-    base_lo = (base & ~0xfff) | 0x18;
-    mask_hi = 0xf;
-    mask_lo = ((~(size - 1)) & 0xfffff000) | 0x800;
-    wrmsr(IORR_BASE0 + 2 * iorr_addr, base_lo, base_hi);
-    wrmsr(IORR_MASK0 + 2 * iorr_addr, mask_lo, mask_hi);
-
-    rdmsr(SYSCFG, sys_lo, sys_hi);
-    sys_lo |= 0x00100000;
-    wrmsr(SYSCFG, sys_lo, sys_hi);
+    base_msr.h = 0x0;
+    base_msr.l = (base & ~0xfff) | 0x18;
+    mask_msr.h = 0xf;
+    mask_msr.l = ((~(size - 1)) & 0xfffff000) | 0x800;
+    wrmsrq(IORR_BASE0 + 2 * iorr_addr, base_msr.q);
+    wrmsrq(IORR_MASK0 + 2 * iorr_addr, mask_msr.q);
+
+    rdmsrq(SYSCFG, sys_msr.q);
+    sys_msr.l |= 0x00100000;
+    wrmsrq(SYSCFG, sys_msr.q);
 
 	return 0;
 }
-- 
2.55.0

