Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019778;
	b=fsHJbZpVBntL43tErrUu11dvqvSoxkBkEQWoEedWCcznRhyl6RegO7U7I9dTe7OCR/mm
	 JQYDw1DnpdGme2VLM1tLWgBlUuxgkQz1g749P2QGW18JQRVXJGxsIKZI+3i3gK4GoIxmU
	 MuOXDkKSj3j30DSh7i4c3oocLZuv1WMzDw07F5g7TUVXzs8//lFLRXrX+iVxnfIKDbcro
	 lBtaFo2cx/mZ0/JnrrzwXodMN6bXlHsf8nmqanxr8YC37MPdnTvy2e70AuHipDwcQbQuZ
	 LQRZhfvhNwHvyPvelNxhjoSDiB9fMpp9ra6Gb0LYA8gsJsQYiVGYa1ERcvUgtTGAPrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019778;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Pre-Result:X-Rspamd-Action:X-Rspamd-Server:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=J5VnG0NPXUCKdQJEnrA3iW0cqMEJyeKN/gOcr8jRAcw=;
	b=DxC16vx90VEDV9PBmdwmRcw074yCN0dc5c6ugyWP+WcZlb7Wb6Xdt1RkiqwiukFqXeAq
	 91YGKzomSyJo3N1aVeAbMb7J6pXKEPC7+KpH9d4YZUNmXvGT/7/mbubmz8D5IMqYRio/1
	 5TyW7kLUzsdai0rh4JHHh9vGhbPBew4zGzeLYDxSrE3zEHkNMwLtqp0Orf8VpBU6IVn2b
	 qm6Oqf7hmb7XCsiP/TsuikMEiPkCaC61giQKuKqKYltmcinM3wwDmV4fiYFDqVxrFcPhq
	 jJQv6L8sEgRHEW6Y62qfBdikPfkh/KMrB5S25VW1X4+EgsuGWdsYXqLGMaG0ii8uSJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B848606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B848606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B4769221F3;
	Mon, 26 Oct 2026 13:02:56 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DD9B13408;
	Mon, 26 Oct 2026 13:02:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sTSrEYBP32ouWwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 26 Oct 2026 13:02:56 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Juergen Gross <jgross@suse.com>,
	David Airlie <airlied@redhat.com>
Subject: [PATCH v5 05/12] agp/nvidia: Stop using 32-bit MSR interfaces
Date: Mon, 26 Oct 2026 14:02:16 +0100
Message-ID: <20261026130223.773129-6-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026130223.773129-1-jgross@suse.com>
References: <20261026130223.773129-1-jgross@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: B4769221F3
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
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
2.56.0

