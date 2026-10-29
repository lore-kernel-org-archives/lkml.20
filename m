Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305922;
	b=N/r69SB5i14I6x3ZGER3wuObNXak1E5UGuteOOtjmIPzHg9rJHdZ/RhhbO0RubUejA3j
	 4f626UOYi44Rjv6wmvOxKEF7nakAI/3Rgf/fOrAOGD2ONynx6KizVrScoz7Tvpo56dHAD
	 BewsCOyK9WSnDJprD+TzRX7xP6y9Sxv0ST+AdoOW15rsd/5Ijrlx9KJn5JFd7mRreh/rv
	 Q8hkPVWk9qapVE1yLJy1mErpLsP93O1p1o7xKoSee5/R5Yed/A7OVbEtlYXPYAFisyBby
	 88ujGix21ofUnJL0wjV02dbyqGmJEtWaUA7WL1GHNG8Aobg9ix6Gbaeqs6GwViaJfoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305922;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6pxQXpYemRN4XfUbn7yrkBqwsiJyMHBQYqkM4m18C74=;
	b=bANVR3LxVwkqk6EsoJQfJjFTRWEOmudfZfpVHM3e0PV+Cyais/MHH+0cT9yRldYRf82w
	 eFr8yf6HiSM3wYeA2XUPFOHfAi/edUH5PEJx3NG9alY23GqJUdgxyqqH4segEs+43Nrya
	 0VvBGp1PvON+WRzOGROOdtHchu7+GWm5DZDuilM3KaPjGUsoJ57a6VpHFKfFAxe0zM+8d
	 KlBF0dMiy1WCOoaBJiNZ9L9qgT9Ob7AHlwnhwwvu1029Dut1fgh5wbzSsTLEKP/d69GC5
	 S0Uq78XSY/AaHiclo9W1MM+/0zGpAOMHzWYMKxXz1vNaBxAee2zz8nmwz3Q4nJjQpTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OeOAv10Z;
	arc=none smtp.remote-ip=91.218.175.216
Received: from mta0.migadu.com (out-216.mta0.migadu.com [91.218.175.216])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF00606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF00606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OeOAv10Z
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9A5v4McM9EgODDHbbpqQnxabhAuw+cMXqsVGQj5+Xt8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793305918; v=1; x=1793910718;
 b=OeOAv10Z+GO835QuNAumb3dmvGt0laxpAkCMD1WMKBeQJeH6y7Ri5IOyWhgORIMvxXUMjHjQ
 yEohGOULgLrP/NCmWFpSBXBR4GMGBAPRRihwkcdXtSRqRYNYz9pbeThjukvDlETwCuLb5zhS4Uc
 V39thRLbhPr8vPJlitG6t8mU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 53ff5c625a1fc412;
	Thu, 29 Oct 2026 20:31:58 +0000
X-Mizu-Trace-ID: 53ff5c625a1fc412
X-Migadu-Flow: FLOW_OUT
From: clement.leger@linux.dev
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: kgdb: Fix potential missing local_irq_restore() call
Date: Thu, 29 Oct 2026 21:31:42 +0100
Message-ID: <20261029203144.190422-1-clement.leger@linux.dev>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Clément Léger <clement.leger@linux.dev>

If kgdb_handle_exception() returns an error, local irqs are not
reenabled. Fix this by factoring out the kgdb exception handling to a
function and call it between local_irq_save()/local_irq_restore() so
that the error handling flow is simple.

Signed-off-by: Clément Léger <clement.leger@linux.dev>

---
 arch/riscv/kernel/kgdb.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 0bf629204c76..b833408494f9 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -319,13 +319,28 @@ static int kgdb_riscv_kgdbbreak(unsigned long addr)
 	return kgdb_has_hit_break(addr);
 }
 
+static int kgdb_riscv_handle(struct die_args *args, unsigned long cmd,
+			     int type)
+{
+	struct pt_regs *regs = args->regs;
+
+	if (kgdb_handle_exception(type == KGDB_SW_SINGLE_STEP ? 0 : 1,
+				  args->signr, cmd, regs))
+		return NOTIFY_DONE;
+
+	if (type == KGDB_COMPILED_BREAK)
+		regs->epc += 4;
+
+	return NOTIFY_STOP;
+}
+
 static int kgdb_riscv_notify(struct notifier_block *self, unsigned long cmd,
 			     void *ptr)
 {
 	struct die_args *args = (struct die_args *)ptr;
 	struct pt_regs *regs = args->regs;
 	unsigned long flags;
-	int type;
+	int type, ret;
 
 	if (user_mode(regs))
 		return NOTIFY_DONE;
@@ -335,17 +350,10 @@ static int kgdb_riscv_notify(struct notifier_block *self, unsigned long cmd,
 		return NOTIFY_DONE;
 
 	local_irq_save(flags);
-
-	if (kgdb_handle_exception(type == KGDB_SW_SINGLE_STEP ? 0 : 1,
-				  args->signr, cmd, regs))
-		return NOTIFY_DONE;
-
-	if (type == KGDB_COMPILED_BREAK)
-		regs->epc += 4;
-
+	ret = kgdb_riscv_handle(args, cmd, type);
 	local_irq_restore(flags);
 
-	return NOTIFY_STOP;
+	return ret;
 }
 
 static struct notifier_block kgdb_notifier = {
-- 
2.55.0

