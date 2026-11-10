Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342296;
	b=DW50AKwoMllWCBpY8KN3g/x9Ebw24VRVsp9t8+GQNmaPsprRaXM7eb/OYJdXYEScVACI
	 8cw1rn0PvcwINu6NqvH4AzqoenQdyejhQua0AYOAuDeMV+zl3MN7XTCRfshDSFQ0CWVE3
	 ajnkhg//rJrJu90GMJfkRpX5iOvLOkkJX68ezx6pRoer2DBepSzggcVM6bOyoVtygnjfh
	 ohsI941JuHTI/AoljtPCfModkPRt4xMTnacd9XdMOuM+CXYXRAdMkn1N6EGeHFsaIMR05
	 yzEI1vJyLpekJwXMdSu8GAnP0OsoxsDP5bXroxAtTkElCBrxDz2vbIxiSt8KPn3uaVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=Iy1Zp/nLmaMj0ashih+Qw4rht5ndU3vvcvD1GV7w140=;
	b=GRHWsmGi0pb09axVMpFrdAKIF88Ej2+pCsnYJFPDoeIQg9yBqfLrk2wPb/kWMZ2yuyer
	 3Yk3w9mDxIpdh+1eYoYI8ffQP60j8iKwVItWg3pYh8LSS0usPHbb2EXI7jL81EimGolNX
	 BU2Hjz5MLR1Qx1YQ+W0x9krv3j07iM0F9zx2FeKuugjjR2idt8k3D232wzuZFoOdrExnb
	 KOLMjSRySjahd5z4a/GQQPH/mIXydLJKnWE1b4RlCw8Qx2n/iblekx2QLh7iKLZ/XMAY5
	 bLuQO12YTvTgQXE6RgJbkSXoEwFkAQHz6Z2Md47SVFqmK+mzZ7eZtlr3EO/Mt7IQ/xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=DdKVWYIl;
	arc=none smtp.remote-ip=83.166.143.175
Received: from smtp-8faf.mail.infomaniak.ch (smtp-8faf.mail.infomaniak.ch [83.166.143.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30260606A887
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30260606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=DdKVWYIl
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jPJ6S46fqzCQG;
	Tue, 10 Nov 2026 21:24:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1794342288;
	bh=Iy1Zp/nLmaMj0ashih+Qw4rht5ndU3vvcvD1GV7w140=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DdKVWYIl/aPd08nYb82NxglMzuQ+0l5GnBH6rCPjL5qzQIXEFFapshHZq3beUlKOp
	 dHNu2RseVCXAWEYW0Sw3Atyj11xZDoewx+tuIwdI/dk6Ayy9VQtUvHVX0MtGYcFv1I
	 YOT/G72mxuVAL+DMwxsZBV5x1berZJBkpjYemJLo=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jPJ6R4gwfzxwM;
	Tue, 10 Nov 2026 21:24:47 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Ada Smith <adasmithgt@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	James Morris <jmorris@namei.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Paul Moore <paul@paul-moore.com>,
	Serge Hallyn <serge@hallyn.com>,
	kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH 2/6] landlock: Mediate CAP_SYS_RAWIO for mappings below mmap_min_addr
Date: Tue, 10 Nov 2026 21:24:30 +0100
Message-ID: <20261110202436.2408244-3-mic@digikod.net>
In-Reply-To: <20261110202436.2408244-1-mic@digikod.net>
References: <20261110202436.2408244-1-mic@digikod.net>
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
X-Infomaniak-Routing: alpha

Until now, a process in a domain that denies CAP_SYS_RAWIO could still
map memory below the vm.mmap_min_addr limit if it held this capability.
cap_mmap_addr() is commoncap's mmap_addr hook, and it checks
CAP_SYS_RAWIO with cap_capable(), not security_capable(), so the check
never reaches hook_capable().  Mapping the lowest pages is what this
limit protects against, because it helps to exploit kernel NULL pointer
dereferences.

Add a Landlock mmap_addr hook that checks CAP_SYS_RAWIO against the
domain under the same condition as cap_mmap_addr().  With the same
vm.mmap_min_addr value, the hook only denies mappings for which
commoncap required the capability.  security_mmap_addr() stops at
commoncap's error, so processes without the capability get the same
result as before.  This also covers the x86 vm86() syscalls, which use
the same check for address 0.

Making cap_mmap_addr() call capable() would also fix this, but it would
send every low mapping through the capable hook of all LSMs (SELinux,
AppArmor, SafeSetID, BPF LSM programs), adding capability checks that
their policies never had to handle.  For instance, SELinux checks
mmap_zero in its own mmap_addr hook and keeps it separate from the
capability on purpose.  LSMs with their own policy for low mappings
implement it in this hook, so Landlock does the same.

Cc: Günther Noack <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <serge@hallyn.com>
Reported-by: Ada Smith <adasmithgt@gmail.com>
Fixes: 97c8386f1d74 ("landlock: Enforce capability restrictions")
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---
 security/landlock/cap.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/security/landlock/cap.c b/security/landlock/cap.c
index fa59118e3486..10e1ca772b9c 100644
--- a/security/landlock/cap.c
+++ b/security/landlock/cap.c
@@ -9,6 +9,7 @@
 #include <linux/cred.h>
 #include <linux/lsm_audit.h>
 #include <linux/lsm_hooks.h>
+#include <linux/security.h>
 #include <uapi/linux/landlock.h>
 
 #include "cap.h"
@@ -90,8 +91,29 @@ static int hook_capable(const struct cred *cred, struct user_namespace *ns,
 	return check_cap(cred, cap, opts);
 }
 
+/**
+ * hook_mmap_addr - Restrict mappings below dac_mmap_min_addr
+ *
+ * @addr: Address of the new mapping.
+ *
+ * cap_mmap_addr() requires CAP_SYS_RAWIO to map below dac_mmap_min_addr, but
+ * calls cap_capable() directly, which skips hook_capable().  Check the same
+ * condition against the domain.  commoncap runs first, so this only sees
+ * mappings that commoncap allowed.
+ *
+ * Return: 0 if allowed, -EPERM if CAP_SYS_RAWIO use is denied.
+ */
+static int hook_mmap_addr(unsigned long addr)
+{
+	if (addr >= dac_mmap_min_addr)
+		return 0;
+
+	return check_cap(current_cred(), CAP_SYS_RAWIO, CAP_OPT_NONE);
+}
+
 static struct security_hook_list landlock_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(capable, hook_capable),
+	LSM_HOOK_INIT(mmap_addr, hook_mmap_addr),
 };
 
 __init void landlock_add_cap_hooks(void)
-- 
2.56.0

