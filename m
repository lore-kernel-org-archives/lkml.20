Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9849539789;
	Tue, 22 Sep 2026 11:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075500; cv=none; b=es8pLRvFHTIwl0ma21diP40VaCYly4DuxtDHkdeByLzLuCQgeGwaC4Po/+MScyicF7gk3gxxGUxKMK7+ZpdeF0q8DRQ4YQPKzNxwE6RLPWB8V0WUIN6ewH/uBgdD5NTvkHKC0rHOAIziFSpmNpcmhbQFiIMJ83e5nUHaocNTXNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075500; c=relaxed/simple;
	bh=PuFn5EVoIugP5oqCsgBSKrLOapMi+vi77A5ZCQf1e1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RS3HgVeS9eAONmyjcY5yNmd6pItyuXgThSH33N9DDibbWt6my0g17Gt2X/TAYJqLap3gtAHxWhHclXp+8qSLgXzPqjdtdF0zYk4nXIW74m9+o7kUa+B7GMfuGyZ8SZmodCBIVs4JodnXROxTNlVG/H5iBuHw1PTFxKZ0kFQItfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=tj9bklGg; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="tj9bklGg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=jstZxs+CbxYZLumdK9kxauT5ptHPDAOWGF+VgHM45Zw=; b=tj9bklGguyyMhHCx7rwdaqNqXX
	pcO1bUqTmK7KXhBk3AEH5EwburR2rV314t7Isa3nmlqIzWvq05wRGpsO9i6YLWWlr9fmkonYTtIbk
	xtb5/rD0oH/GORggksNFu44s02bZp/qKSnrl7ivpzQRRwLV7cfCfx/CK0Zn0zJQSoB3nNaWYE8elT
	hykSxMuGFf9vY8xRUjl5WcXG0CxUUMPFMaUpTZtFDBiPimi29STVvvFcIghIP311rUxH1+zoGH4Z9
	s+Gqz6bPoigCUW7cFp3VtFExTv6S59VSTo7cJ9Pf0ZKCCisAh36HtFoV9FB2Ki+BAZKSZbRact0CQ
	eLZo+mHQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x8yPP-002wIv-1P;
	Tue, 22 Sep 2026 11:11:35 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 22 Sep 2026 04:11:09 -0700
Subject: [PATCH 2/2] x86/mce: Print each MCE record line in a single
 printk()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-mce-print-v1-2-500205689e54@debian.org>
References: <20260922-b4-mce-print-v1-0-500205689e54@debian.org>
In-Reply-To: <20260922-b4-mce-print-v1-0-500205689e54@debian.org>
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=4533; i=leitao@debian.org;
 h=from:subject:message-id; bh=PuFn5EVoIugP5oqCsgBSKrLOapMi+vi77A5ZCQf1e1g=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqsmJbqjf5yadaICTd/DNlNDdvXoxybqFC6X64p
 wWjfI0uh7mJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCarJiWwAKCRA1o5Of/Hh3
 bV9FEACxL27dKhmjmwJs9C/1VFMKTrulpIMHN+/M5mTcswK6MuRr7x75fH1r7K3e5r2s/hN1ddk
 1q6qJJenru9HqrcB3B6V7qUCfj7JuQtaZR5vxPp3INU2tycwo3yGykgCaIsyReORKhz6VblnPCb
 TDBMy4kZHpsxBPHMOEwL1Co9pZ7IxH1PtC832nRC7hsc/isKX0BihzucRHABNpjDyt/LEz5QWo6
 RGn4BG7HZmZhYFyWZHzGbHgyk0/RAIHvXGBBlub4LgnBKNMTXPTtMUpJ3Ui7YfRABmf1R4iYcNS
 spqDwXKQ6ULN0sN+Vwz8Nb+IB5C88b9AcB/Jc7i1FfAV9H5OWjD/0Ye8qFJyko0yZ1PVJY+kr86
 9kAH2tPg/M0uJtR3CQQFAHq1GbfLJb6XgPQc2tO9VMh3HHgZnZMbuQAs8xvQ6zMa5F6/8sDPfjR
 CciUajfF7pOgWaNx9Ubpe9A3mA+tNSxYB2yEYjnv7o4OQIpE3Srd+aQz1pSlN4cyeloURR1YOwf
 uGpFzUT2J4yxV+qaEDtK2jCoQ0AjMu3cIMekiO6dQ8eq/T/RBzB4WpKUgsHxlShUmR25y9rzChS
 fm3qV9EFIcy7TrCpSFMRqN0NNU+YjFyVGku4gp9qO3H5/Phe8EyimK8SyeY1s0aRRycBgDYfe4E
 0jLG8N5h2an9w5Q==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

I am looking at a bunch of MCE recently, and I found __print_mce()
assembles two of its four output lines from pr_cont() pieces.

A continuation only appends to the previous record when the newest entry
in the printk ring buffer has the same caller_id, so a printk from
another CPU in between breaks the line in two.

The tail then loses both prefixes, because pr_cont() does not apply
pr_fmt() and HW_ERR is only in the format string of the first piece.
Injecting an error while the other CPUs write to /dev/kmsg:

  [    1.869789] mce: [Hardware Error]: TSC d00792e9
  [    1.869794] ADDR deadb000 MISC 8c00004000010090

Anything collecting on "mce:" drops that second line.

Concurrent printk is the norm for a fatal machine check. Every CPU in
the socket logs the same package-level bank at once, and with
firmware-first the GHES NMI handler prints in parallel, kernel message
becomes hard to read. For instance, on a recent 60-CPU Sapphire Rapids
host a fatal PCU error got as far as

  [57223.636282] [ T635877] mce: [Hardware Error]: RIP !INEXACT! 10:<ffffffff8235b5ff>

before GHES panicked. The "TSC ..." and "PROCESSOR ..." lines never
arrived, taking the timestamp, the socket and APIC ids and the running
microcode revision with them.

Build the variable part into a seq_buf and print it in one go, make the
full message either sent or not. Also, printing all messages with the
same HW_ERR suffix.

Needlessly to say, the output is unchanged, trailing space included, and
mce-inject gives identical records with and without this.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/x86/kernel/cpu/mce/core.c | 44 ++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 4b457c6bed8f5..6e9516731fceb 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -46,6 +46,7 @@
 #include <linux/hardirq.h>
 #include <linux/kexec.h>
 #include <linux/vmcore_info.h>
+#include <linux/seq_buf.h>
 
 #include <asm/fred.h>
 #include <asm/cpu_device_id.h>
@@ -173,9 +174,14 @@ void mce_unregister_decode_chain(struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(mce_unregister_decode_chain);
 
+/* 8 fields, widest is "SYND1 " plus 16 hex digits and a space. */
+#define MCE_AUX_LEN	(8 * (sizeof("SYND1 ") + 16 + 1))
+
 static void __print_mce(struct mce_hw_err *err)
 {
 	struct mce *m = &err->m;
+	char aux[MCE_AUX_LEN];
+	struct seq_buf s;
 
 	pr_emerg(HW_ERR "CPU %d: Machine Check%s: %llx Bank %d: %016llx\n",
 		 m->extcpu,
@@ -183,35 +189,45 @@ static void __print_mce(struct mce_hw_err *err)
 		 m->mcgstatus, m->bank, m->status);
 
 	if (m->ip) {
-		pr_emerg(HW_ERR "RIP%s %02x:<%016llx> ",
-			 !(m->mcgstatus & MCG_STATUS_EIPV) ? " !INEXACT!" : "",
-			 m->cs, m->ip);
+		const char *inexact = "";
+
+		if (!(m->mcgstatus & MCG_STATUS_EIPV))
+			inexact = " !INEXACT!";
 
+		/* The space after '>' is part of the existing output. */
 		if (m->cs == __KERNEL_CS)
-			pr_cont("{%pS}", (void *)(unsigned long)m->ip);
-		pr_cont("\n");
+			pr_emerg(HW_ERR "RIP%s %02x:<%016llx> {%pS}\n",
+				 inexact, m->cs, m->ip,
+				 (void *)(unsigned long)m->ip);
+		else
+			pr_emerg(HW_ERR "RIP%s %02x:<%016llx> \n",
+				 inexact, m->cs, m->ip);
 	}
 
-	pr_emerg(HW_ERR "TSC %llx ", m->tsc);
+	seq_buf_init(&s, aux, sizeof(aux));
+
+	seq_buf_printf(&s, "TSC %llx ", m->tsc);
 	if (m->addr)
-		pr_cont("ADDR %llx ", m->addr);
+		seq_buf_printf(&s, "ADDR %llx ", m->addr);
 	if (m->misc)
-		pr_cont("MISC %llx ", m->misc);
+		seq_buf_printf(&s, "MISC %llx ", m->misc);
 	if (m->ppin)
-		pr_cont("PPIN %llx ", m->ppin);
+		seq_buf_printf(&s, "PPIN %llx ", m->ppin);
 
 	if (mce_flags.smca) {
 		if (m->synd)
-			pr_cont("SYND %llx ", m->synd);
+			seq_buf_printf(&s, "SYND %llx ", m->synd);
 		if (err->vendor.amd.synd1)
-			pr_cont("SYND1 %llx ", err->vendor.amd.synd1);
+			seq_buf_printf(&s, "SYND1 %llx ",
+				       err->vendor.amd.synd1);
 		if (err->vendor.amd.synd2)
-			pr_cont("SYND2 %llx ", err->vendor.amd.synd2);
+			seq_buf_printf(&s, "SYND2 %llx ",
+				       err->vendor.amd.synd2);
 		if (m->ipid)
-			pr_cont("IPID %llx ", m->ipid);
+			seq_buf_printf(&s, "IPID %llx ", m->ipid);
 	}
 
-	pr_cont("\n");
+	pr_emerg(HW_ERR "%s\n", seq_buf_str(&s));
 
 	/*
 	 * Note this output is parsed by external tools and old fields

-- 
2.53.0-Meta

