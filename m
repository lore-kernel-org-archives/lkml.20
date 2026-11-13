Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554205;
	b=Km21IiUpXV1+EqaKplkC2vrAYPzf6sqU6opUw3eaRbU36LUW2UrUOU1Op9251FBqMjVU
	 VlXlX/qqwvYFIKC6+NVWjiAU5947fOrd5SSvkiiTBHVvxPkK+yUUKe8JLef9P6EKzbWZ7
	 SnArCoIrlxIYaZkXpYLeM9vQMfa7lbPFqi6pYBzWt6wiY72DW8Aj+gMUpsf9y7l54MrGZ
	 RZYnTrBeaBX9O5Aa6kX4Ib+hUi68WIymkDJcyTfSCAdEiSRPYuR4BnHMZDkYaqPEztNFw
	 8hYniwnaV7sqM+eo0SIyT2TPXoERidybjt/ZrY5qTpOcnM3WCex4RsJmTvLHoQdmi7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554205;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PY/h1faCj7YLTRJygAQBGN17l9LlZH+uqkX+EFa6XOI=;
	b=fpw5vkX1cwC2QphiucS+h9ocs0IthDzqXVhEatNVSX3GcsQPLbIcYainppPTO/c6qVBD
	 IDC9hnjDwAGoB42nwjW6j9itwp+7VpPGzcpxZqlonmxyz7NBYoGtDfHi4uMkOE5YqiU1v
	 tAJg9Tt0UbnSMi0XK6jQruY+432aFV1tbdzeyHkBgz45o9BtDMmhmD0JMxUmeLqD56Ye/
	 Rhgnxvy3gDTCqjTOLn8pipSUCAWfMXp2liMJPx3tRXXKX7J9sYH9XLEF68eY3IXxXLTVC
	 sikWmuBTWEhWdWhX0/E96/YZCn1YqJ2bCjwQjxOwqmZJVPmik9ZYI3jHnjNsFsb23Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nhEKbwwB;
	arc=none smtp.remote-ip=91.218.175.213
Received: from mta0.migadu.com (out-213.mta0.migadu.com [91.218.175.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B1A606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B1A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nhEKbwwB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8t8H4CQ8gn3R9f8nurhquSa//ipjY+XXPYQiq2AQR7Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794554203; v=1; x=1795159003;
 b=nhEKbwwBNg/lBaKxIE59HIloDCsDEEPFLOKnNEKX3NcXwu1Kbar/SLH8txrDuHPnhcYtvF9p
 TUeWih+JPiPN17y/I/npOThvyRBT86Vg0hBXX4YaHdyaRWLF/hMF8Uf95iaM9BpW5w1xtNf8n1b
 +Ncok1IybhXuwqe9umoT+LIY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 211d82633146b9fb;
	Fri, 13 Nov 2026 07:16:42 +0000
X-Mizu-Trace-ID: 211d82633146b9fb
X-Migadu-Flow: FLOW_OUT
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Alexandre Ghiti <alex@ghiti.fr>,
	WangYuli <wangyuli@uniontech.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] riscv: kgdb: use patch_insn_write() to set breakpoints
Date: Fri, 13 Nov 2026 08:16:12 +0100
Message-ID: <20261113071616.219623-2-clement.leger@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113071616.219623-1-clement.leger@linux.dev>
References: <20261113071616.219623-1-clement.leger@linux.dev>
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

When using CONFIG_STRICT_KERNEL_RWX, the text section is not writable
and copy_to_kernel_nofault() returns -EFAULT. Fix this by using
patch_insn_write() were applicable and implement
kgdb_arch_set_breakpoint()/kgdb_arch_remove_breakpoint().

patch_insn_write() correctly remaps the text as writable using a fixmap
alias.

Signed-off-by: Clément Léger <clement.leger@linux.dev>
---
 arch/riscv/kernel/kgdb.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 0bf629204c76..4ad817698af8 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -12,6 +12,7 @@
 #include <asm/cacheflush.h>
 #include <asm/gdb_xml.h>
 #include <asm/insn.h>
+#include <asm/text-patching.h>
 
 enum {
 	NOT_KGDB_BREAK = 0,
@@ -134,9 +135,9 @@ static int do_single_step(struct pt_regs *regs)
 	stepped_address = addr;
 
 	/* Replace the op code with the break instruction */
-	error = copy_to_kernel_nofault((void *)stepped_address,
-				   arch_kgdb_ops.gdb_bpt_instr,
-				   BREAK_INSTR_SIZE);
+	error = patch_insn_write((void *)stepped_address,
+				 arch_kgdb_ops.gdb_bpt_instr,
+				 BREAK_INSTR_SIZE);
 	/* Flush and return */
 	if (!error) {
 		flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
@@ -154,8 +155,8 @@ static int do_single_step(struct pt_regs *regs)
 static void undo_single_step(struct pt_regs *regs)
 {
 	if (stepped_opcode != 0) {
-		copy_to_kernel_nofault((void *)stepped_address,
-				   (void *)&stepped_opcode, BREAK_INSTR_SIZE);
+		patch_insn_write((void *)stepped_address,
+				 (void *)&stepped_opcode, BREAK_INSTR_SIZE);
 		flush_icache_range(stepped_address,
 				   stepped_address + BREAK_INSTR_SIZE);
 	}
@@ -261,6 +262,29 @@ noinline void arch_kgdb_breakpoint(void)
 	    "kgdb_compiled_break: ebreak\n");
 }
 
+/*
+ * Kernel text may be read-only (CONFIG_STRICT_KERNEL_RWX), so software
+ * breakpoints must be planted through the writable patch alias instead of
+ * writing the text address directly.
+ */
+int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
+{
+	int err;
+
+	err = copy_from_kernel_nofault(bpt->saved_instr, (char *)bpt->bpt_addr,
+				       BREAK_INSTR_SIZE);
+	if (err)
+		return err;
+	return patch_insn_write((void *)bpt->bpt_addr,
+				arch_kgdb_ops.gdb_bpt_instr, BREAK_INSTR_SIZE);
+}
+
+int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
+{
+	return patch_insn_write((void *)bpt->bpt_addr, bpt->saved_instr,
+				BREAK_INSTR_SIZE);
+}
+
 void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
 				char *remcom_out_buffer)
 {
-- 
2.55.0

