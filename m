Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735483;
	b=ym7pY1Y7W0uZJjwyONiNpDfu/LaIePnuCensqZEkmaTpjmyVY19l78bYu0N7aGQWpAIV
	 6utkHlbTT4Z3dLB4ekofvc31170vnpAZbJENcMtvE/eLtRpK0SpNBWGCZ5eEA5e2CAIaD
	 kbSp4YDkJ4FJ4yms0x9Na184o/LXkyYYEbXYsvT77+UqKq4leuahInswAPOW2ZJKyH9Mz
	 lcX41PmyNQgDhQSH5TlrbTkenNMIpzHz4yllOhXVQPeTnYEPseT84o2FGascUFklQNEi0
	 4p01BjhW+2mJOyELN3dbRgWEdduCiCMNlPBGU/hE31VgTl4dga11krOM6iu/6/y+9mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L7xE73YnacVCImHadDlbM9nSN9zvnBeeDbefiAX2ogU=;
	b=LHO/mn1anCSeB61aMKkgfnilaDeXr9I2tL0T0yaEzP0kJZzkcGNqOwIbvwb7ZbCYmySd
	 RAyVuMW403EpvJBMZ8s8k14YL+UCh9vwA8EsMOJ94JhJHxI/JFsnCag7xpReQRxVPqQFK
	 G1rUvdns5uqY1yG6sbA/zWkM6f1a4f78fx1t9MS/wu5d+qaNNsyaTAy9em/Ka7X0/3nQs
	 r5cCNIdXZpkRGJVuJ7bi36y7SnykbD2RhB5JdZlPAztkT6tfw4AUseBkBsVXPL7CXTRpR
	 oqUagGi8Qx0fhQw1OSiPWIuL+W3Pg9vKiaOWj7/hrMao+kbb6RTblRjLaA2qyJFy40w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihMTyoyf;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C4E606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C4E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihMTyoyf
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adfc004920so27888481fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735481; x=1795340281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7xE73YnacVCImHadDlbM9nSN9zvnBeeDbefiAX2ogU=;
        b=ihMTyoyfTelnyWJfpjFKLs2RK0I/f5OSe5JMBADPOP6k30mgnOysCtRMeLcAjaD1Ls
         4Y7vuH46kqGe4IqbEw/YybIgQYi1ZWgc+2rIV28P/lB3eEM4dVPLKBHFCRYxznSnTslY
         qvt2t9hrZl9Vzsd9qU5AlsUPzfqqeEwZItiR8D+alWt3rqbT+fhybik4hq5DKKY0NM45
         JRDMRYjPaLVmBTBq6Cma4Cgzo2L16nRxyg8fjEFOIOe3mC+SC2RHkeqkcCpudGwgq0LI
         ajdMX8dm/PvU6eKSboImzVgAMq0BfDML1d86rRUPltoe/9bpU4Ar4Z66bGT7WVS4qlrr
         WAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735481; x=1795340281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7xE73YnacVCImHadDlbM9nSN9zvnBeeDbefiAX2ogU=;
        b=ykSf28Eh1GIWwPJzilkldBwBzOmhudkRLjsgFc9UQb61iyLOlYbD3Z7bkuiH9e+vU1
         911hK/cgHrj9b4YvXfT/VQ3I81PhdtLe3FUN0DCqSDATrzJ/Kp4sR92HfG1EEAj6gR5j
         zsYyWh7tPwys+mtNG1pupwhwCib65TU3Mxntc/VOVz/89MOgOE+FQo23z0fZWCsa6h6a
         PVA5KzNDbdu8z1IRx7uaUitIADr+XTn332LAXAynP7vNAeSmAnjK1WOTwJiS4fev/rTB
         ql3Gx9X5ea1a4UkSPQOrD9yHVg0PM7S3NmKBUiXYeiN58+4sf+rj+KeCg0Y+UMLA/j0R
         G2+Q==
X-Forwarded-Encrypted: i=1; AL+hErEzIhcamogbfzH1EY9aQKZJXA3vHF+jeSJ0BKxYuGtB7HEut+CDtxVapzAq+YBhlSClXPJnrvL+OVElHuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QgVW0daZyVv3lssnYWm2s9Y/AHs1BvdaDBugZbqAYCIVKYhRk
	X169HkXBCSr/o2k69flFFgdArSMYKbjnltUzgv8KVBQWB47N9Rx9bCn8
X-Gm-Gg: AYBFou3jjWV1xhYD7elkdaF25w0sUQwt/9GJ2TsOu4neqiXmu94xvgyrsA24KKnp8PP
	2CPvo6AiXPRljozhjiukpElugFBymzHRZvEZtVHL2EK7aEtVTsbmUKTB7zQD/mNJG/DqMH/T3+k
	LqrnQbhKEYdskCIM/ln8hASlQFvg9uD+wyhbya0cgfLogvsImpW6tWBudE8sTgB8YFgWbIKC9gA
	01yGVItJZWXwiSqQl+w+FATDTzsH5UR67TJoKwKNc7AfvagDkmfukRrgjnhLjM2R3N6HkXZGLHY
	4RPEd6y43uMMW0zcP4aUtkpItyqFjcDB2rb7zGFDhYBA5su0pfXpQQYZpJMOgGjSd9TEqCsUx9n
	RzgaueNovJv7kMzKdnRab81+MVrweUXKnn20AoZchO/VhddV30ha0tZsGPJLX+ZBrweXJLyCdIt
	3kPt8rzojCy8IW1IYyoIhpWkFdopliimoeAYRZJDuuV/4jFrewcwyAnbnIp6aLF1jgGBJLJRJnQ
	slh4dlPjyVglz6y0v+oZf4/CSZj0qs3Sfg4KpfUBseGUCODYpT2XBqHvM5kg8P24RTQdSzZXcim
	7qm3Qx5U/oAuHjqnV34tFE4nClN4Z3zyMsgNyhlBAy7QMt7zdKacVckjxM20bW3S0HLsnmk=
X-Received: by 2002:a05:651c:b0e:b0:3ab:4014:884b with SMTP id 38308e7fff4ca-3ae2b40f63bmr24055211fa.1.1794735480777;
        Sun, 15 Nov 2026 01:38:00 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7ae92dsm23598851fa.23.2026.11.15.01.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:38:00 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v4 1/1] alpha: Add support for HAVE_ARCH_JUMP_LABEL
Date: Sun, 15 Nov 2026 10:37:48 +0100
Message-ID: <20261115093752.1287968-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115093752.1287968-1-linmag7@gmail.com>
References: <20261115093752.1287968-1-linmag7@gmail.com>
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

Implement static key (jump label) support for Alpha. Emit jump table
entries and patch instruction sites between NOP and BR, synchronizing
instruction caches after each update.

Warn and leave the instruction unchanged if the target is outside the
signed 21-bit branch displacement range.

This relies on kernel and module text being writable; Alpha does not
implement STRICT_KERNEL_RWX or STRICT_MODULE_RWX.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 .../core/jump-labels/arch-support.txt         |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/include/asm/jump_label.h           | 65 +++++++++++++++
 arch/alpha/kernel/Makefile                    |  1 +
 arch/alpha/kernel/jump_label.c                | 79 +++++++++++++++++++
 5 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 arch/alpha/include/asm/jump_label.h
 create mode 100644 arch/alpha/kernel/jump_label.c

diff --git a/Documentation/features/core/jump-labels/arch-support.txt b/Documentation/features/core/jump-labels/arch-support.txt
index 683de7c15058..119c71b7cec0 100644
--- a/Documentation/features/core/jump-labels/arch-support.txt
+++ b/Documentation/features/core/jump-labels/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: |  ok  |
     |         arm: |  ok  |
     |       arm64: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 6ccb2d230326..e7e7cb37d670 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -28,6 +28,7 @@ config ALPHA
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
 	select HAVE_ARCH_COMPILER_H
+	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_GUP_FAST
diff --git a/arch/alpha/include/asm/jump_label.h b/arch/alpha/include/asm/jump_label.h
new file mode 100644
index 000000000000..df0b59530c85
--- /dev/null
+++ b/arch/alpha/include/asm/jump_label.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Alpha architecture jump label (static key) definitions
+ *
+ * Defines patch site emission and jump table layout for
+ * Alpha static key support.
+ *
+ * Copyright (C) 2026 Magnus Lindholm <linmag7@gmail.com>
+ */
+
+#ifndef _ASM_ALPHA_JUMP_LABEL_H
+#define _ASM_ALPHA_JUMP_LABEL_H
+
+#ifndef __ASSEMBLER__
+
+#include <linux/types.h>
+
+#define JUMP_LABEL_NOP_SIZE 4
+
+typedef u64 jump_label_t;
+
+struct jump_entry {
+	jump_label_t code;
+	jump_label_t target;
+	jump_label_t key;
+};
+
+static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
+{
+	asm goto("1:\n\t"
+		 "nop\n\t"
+		 ".pushsection __jump_table, \"aw\"\n\t"
+		 ".align 3\n\t"
+		 ".quad 1b, %l[l_yes], %0\n\t"
+		 ".popsection\n\t"
+		 :
+		 : "i"(&((char *)key)[branch])
+		 :
+		 : l_yes);
+
+	return false;
+l_yes:
+	return true;
+}
+
+static __always_inline bool arch_static_branch_jump(struct static_key *key, bool branch)
+{
+	asm goto("1:\n\t"
+		 "br $31, %l[l_yes]\n\t"
+		 ".pushsection __jump_table, \"aw\"\n\t"
+		 ".align 3\n\t"
+		 ".quad 1b, %l[l_yes], %0\n\t"
+		 ".popsection\n\t"
+		 :
+		 : "i"(&((char *)key)[branch])
+		 :
+		 : l_yes);
+
+	return false;
+l_yes:
+	return true;
+}
+
+#endif /* __ASSEMBLER__ */
+#endif /* _ASM_ALPHA_JUMP_LABEL_H */
diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 850f1265cc55..279616993fb9 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_SRM_ENV)	+= srm_env.o
 obj-$(CONFIG_MODULES)	+= module.o
 obj-$(CONFIG_PERF_EVENTS) += perf_event.o
 obj-$(CONFIG_HAVE_PERF_REGS) += perf_regs.o
+obj-$(CONFIG_JUMP_LABEL) += jump_label.o
 obj-$(CONFIG_RTC_DRV_ALPHA) += rtc.o
 
 ifdef CONFIG_ALPHA_GENERIC
diff --git a/arch/alpha/kernel/jump_label.c b/arch/alpha/kernel/jump_label.c
new file mode 100644
index 000000000000..69475e840e46
--- /dev/null
+++ b/arch/alpha/kernel/jump_label.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Alpha architecture jump label (static key) support
+ *
+ * Implements runtime patching of static key sites by replacing
+ * a NOP instruction with an unconditional branch and vice versa.
+ *
+ * Copyright (C) 2026 Magnus Lindholm <linmag7@gmail.com>
+ */
+
+#include <linux/cacheflush.h>
+#include <linux/jump_label.h>
+#include <linux/kernel.h>
+
+/*
+ * Alpha instruction encoding helpers.
+ *
+ * Branch format:
+ *   [31:26] opcode
+ *   [25:21] Ra
+ *   [20:0 ] disp (signed, in instructions; hardware multiplies by 4)
+ *
+ * Unconditional branch:
+ *   BR opcode is 0x30.  We use Ra=r31 so no link register is written.
+ *
+ * Updated PC semantics:
+ *   Target = (pc + 4) + (disp << 2)
+ * so disp = (target - (pc + 4)) >> 2.
+ */
+#define ALPHA_OP_BR	0x30
+#define ALPHA_RA_R31	31
+#define ALPHA_BR_DISP_MASK	((1u << 21) - 1)
+
+#define ALPHA_INSN_NOP	0x47FF041Fu /* BIS r31,r31,r31 */
+
+static inline bool alpha_br_insn(unsigned long pc, unsigned long target,
+				 u32 *insn)
+{
+	long off_bytes = (long)target - (long)(pc + 4);
+	long disp = off_bytes >> 2;
+
+	/*
+	 * 21-bit signed displacement: range is [-2^20, 2^20-1] instructions.
+	 * If this trips, the site/target are too far apart for a BR.
+	 */
+	if (WARN_ON_ONCE(disp < -(1L << 20) || disp > ((1L << 20) - 1)))
+		return false;
+
+	*insn = (ALPHA_OP_BR << 26) |
+		(ALPHA_RA_R31 << 21) |
+		((u32)disp & ALPHA_BR_DISP_MASK);
+	return true;
+}
+
+static inline void alpha_patch_text(u32 *site, u32 insn)
+{
+	WRITE_ONCE(*site, insn);
+	/*
+	 * Alpha needs an I-cache sync after patching executable text.
+	 */
+	flush_icache_range((unsigned long)site, (unsigned long)site + sizeof(*site));
+}
+
+void arch_jump_label_transform(struct jump_entry *entry,
+			       enum jump_label_type type)
+{
+	u32 *site = (u32 *)jump_entry_code(entry);
+	u32 insn;
+
+	if (type == JUMP_LABEL_JMP) {
+		if (!alpha_br_insn((unsigned long)site, jump_entry_target(entry),
+				   &insn))
+			return;
+	} else {
+		insn = ALPHA_INSN_NOP;
+	}
+
+	alpha_patch_text(site, insn);
+}
-- 
2.43.0

