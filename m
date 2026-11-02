Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631527;
	b=2DFaK+OL/CMt7XE1d8TEFmLgddq080EdS+oa2VW6Nxhe+zaFmuMfJlu3Kmje+BlnhWJz
	 vw9cA6GYY/Mw0ImdmI583gJ6xTmwTz2X1PjcGGGxRSS4z2N02hqh0hkdhXQuM1gI25bjc
	 3pj+Ov37s7NZA7BZwr1Zx0eeeawU64qUN4GCAbT/xmwbfb/a0zn5jQB31vkqbQZnGRqJt
	 +L7pwO5fK0AQz1QBZtAjmIIgvDxUhE12Smc3HMLkIwP93s2TU2UgBo9jXiUNRYwWpLN5T
	 D/NANrelgHtevtx83JRMOMBjhfUZxXY5eozaPmMNSK5QlipCyQtPrVI8X3StZ29xNQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631527;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ipzJWtZr09PM7ZkIhvJieHFp76x/Kz4S2q5kz7eEA5Y=;
	b=ZemBi5WzALGUpXRGsDg2JR0vYGyn6YcE/LB6HIF0u7M/lNHxaouxJpdUpElN/VZGaHP4
	 KGXTGAgQO5Qt+Ew/06Hc0ZmSjCTMA4QE5OTtXlkW9zIKpxQnVHQ5sivT3Wwsfs3kTEFO2
	 Qr3Za6BMk51HqTEhzP/D1TVDYttHkbmptSxfZRlcIwy16rDOfEYGElvMnG/EZ0Xlrbsi3
	 rSPBhMbyzphGWvbLBHuyUocxP+ighZB178YBqki4mGG+z8x2y2/opYVrfxEWgPQASfvo7
	 nUV5IKrdiLW9Mt3Xfkizdff9ueQJVxOcX2KaPyFlupL/loAIvrwpQH3KR3ZjjkSR6gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TsSjnMly;
	arc=none smtp.remote-ip=95.215.58.193
Received: from mta1.migadu.com (out-193.mta1.migadu.com [95.215.58.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60C4606A5BC
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E60C4606A5BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TsSjnMly
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ecSSOXwMPLSgrPwivWZlr5O7kQVEdpqiDzJteOU8z7Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793631523; v=1; x=1794236323;
 b=TsSjnMlyxIgJqGg0OM2ywhSGrEVVTnr3vB4zsrEM3kHnNVX8ZTH9mMISulsN3rcRNybl8cKu
 zAbDByyVZXzO0PN+5hEF7nqXl2K34scaiF1k6aTa/96CKZ1aX0X7qZO3wE4EF4qjYVSWM7/8SMv
 7cHWfLk8fYaO5gqtumrwsE2A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 66ae8b979347ddfb;
	Mon, 02 Nov 2026 14:58:43 +0000
X-Mizu-Trace-ID: 66ae8b979347ddfb
X-Migadu-Flow: FLOW_OUT
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] riscv: kgdb: Fix potential missing local_irq_restore() call
Date: Mon,  2 Nov 2026 15:58:11 +0100
Message-ID: <20261102145812.36939-1-clement.leger@linux.dev>
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

If kgdb_handle_exception() returns an error, local irqs are not
reenabled. Fix this by factoring out the kgdb exception handling to a
function and call it between local_irq_save()/local_irq_restore() so
that the error handling flow is simple.

Signed-off-by: Clément Léger <clement.leger@linux.dev>

---
- Resent because of a bad msmtp configuration.

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

