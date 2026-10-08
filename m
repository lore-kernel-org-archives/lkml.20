Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220903D5241
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443966; cv=none; b=YQPzQ3aHeWiXVRkG7bEt/THQEf2I9QZyap3WWb81GVP5R5BzQd5AOOdSgBt64myxBpx03jQ88t8mViWly51GHGvy7nc++jYPso5y6ptLCpeWB3guBFENW6PsnhdQiSUvHYRJhgOYlR2InWGMiBC70gEUXiUGm62wV4LvZSqIhko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443966; c=relaxed/simple;
	bh=gwHt7MotFvQBQuKYACyYC4fo8s+0BbXyOtR3Y2XMe3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9CQMcC13mQuPnqFSRo5RUL/hJcwzUyH0wZIHp4hR51SA6IgU3u/6nC71RmyM0/Pn9qcirzpju2tr1JuCea/c9WTSCs7mrvSd+7EiocFgenIiLEg81RwJK2VObvLoPkk1e/SGaTEJ3xpJ9+4iJVcB/fJWo+A9rTApeg8Iv45D/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E78C61F786;
	Thu,  8 Oct 2026 07:19:13 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DA5E13354;
	Thu,  8 Oct 2026 07:19:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Co2dHPFDx2p5cQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 08 Oct 2026 07:19:13 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Juergen Gross <jgross@suse.com>,
	David Airlie <airlied@redhat.com>
Subject: [PATCH v4 05/13] agp/nvidia: Stop using 32-bit MSR interfaces
Date: Thu,  8 Oct 2026 09:18:31 +0200
Message-ID: <20261008071839.2247074-6-jgross@suse.com>
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
X-Rspamd-Queue-Id: E78C61F786
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

