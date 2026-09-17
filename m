Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B6A4C14FF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647315; cv=none; b=V0AdY8JlW/6NHuJa/VIMQWk63bBBV9/syHrPYbDlldql1jdZUMa13lLDIS/O9ZyRFuUf91X+O3+EwDer6Q9wA2aq+Ki9wuqoEB4CQV1jXhiGCjoCAKz/EQpVOnR3Kt+vI9jqajGH+j7dxngXF+ejp6itoYqcTwYYT42eHGYF7qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647315; c=relaxed/simple;
	bh=NDaMjwBZ/hpdQJDlsB888hvh2gFjpgoxkkHQAIZTepc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cj9yk0HlXRHNyM6No8Aj12Dod9+aWa2XkISXsPpbEHCo9h+XSReiqd98eSPc+Wysy/p7KZM2uhpZbAbYH/T0UvL4FRy2qIVxGY270DQFHnE0Gd0gn6vAAxvlQM00kAVxEJjQa7P8STx+WGekHGsHLXeVSqLOT1VUwc2pur45KzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2R1npyo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2R1npyo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C531F000FF;
	Thu, 17 Sep 2026 12:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789647299;
	bh=ceSsxVrWmBjrYFPJs5Hyek28Ld6sVE/VQa1n6sSw4CA=;
	h=From:To:Cc:Subject:Date;
	b=H2R1npyoyH+8TvD92WpyX3mXSrK5J0VjXGGYHXrxhiD4wPR6YB9BZvcQnWkaOyB+i
	 Ll7tlYbosgXvc+JEfT1y6kbm5NPTflSEelBKF/Nb8u1iRfVGTY0VLPAtLnbcy5Qrt1
	 W9jHqBHzBUUmyQUPUVTcpK4gylnhZS/22kI8Kb0a5RLFg44GedeG/Td4172UOVmpgv
	 vFFzh1vIp+G78i2vcgwaAidlBwjNrUvGoXuifS+2v2zdgVo+xtE9dg+ov2RRh+3cx6
	 0JwV71YN1hK3AHLrJw5eWtkhY8z34qgYSJy9Za9OmidQQaCFosuvcVCSlFRgnJX5L5
	 H92HvbOmRpGhg==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2] x86/fpu: Use vmemdup_user() in xstateregs_set()
Date: Thu, 17 Sep 2026 14:14:41 +0200
Message-ID: <20260917121441.214567-3-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2151; i=blum@kernel.org; h=from:subject; bh=NDaMjwBZ/hpdQJDlsB888hvh2gFjpgoxkkHQAIZTepc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmrb278pimxalrH36b8f4d2ip5S3Fjqt29eXGKvyIPfX eFOzzYHdZSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBE/oszMnxcliAl3z975uFj /v1ZJ9NjVaS7gypiXOQtrApsL2yIuMPwv2j/Y/+Tzx4wn5t4a1nv1etHf5z0FHu/MP3pT3m/1AX XGLgA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace the open-coded vmalloc() and copy_from_user() with
vmemdup_user() to simplify xstateregs_set().

vmemdup_user() returns an ERR_PTR() on failure, preserving the existing
-ENOMEM and -EFAULT error codes. Since vmemdup_user() is backed by
kvmalloc(), use kvfree() to free the buffer instead.

Return early on error and drop the obsolete out label.

Performance should be similar, and xstateregs_set() is not a hot path.
Page alignment should not matter because the buffer is only used as a
memcpy() source in copy_uabi_from_kernel_to_xstate().

The allocation behavior differs because vmemdup_user() uses GFP_USER,
which adds __GFP_HARDWALL and may affect cpuset allocations.

tools/testing/selftests/x86/avx_64 passed on an Alder Lake CPU.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Changes in v2:
- Add performance analysis and selftest result to the changelog (Ingo)
- v1: https://lore.kernel.org/r/20260720195534.70111-3-thorsten.blum@linux.dev/
---
 arch/x86/kernel/fpu/regset.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/fpu/regset.c b/arch/x86/kernel/fpu/regset.c
index 0986c2200adc..8dc9de732c78 100644
--- a/arch/x86/kernel/fpu/regset.c
+++ b/arch/x86/kernel/fpu/regset.c
@@ -3,7 +3,8 @@
  * FPU register's regset abstraction, for ptrace, core dumps, etc.
  */
 #include <linux/sched/task_stack.h>
-#include <linux/vmalloc.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 
 #include <asm/fpu/api.h>
 #include <asm/fpu/signal.h>
@@ -157,21 +158,15 @@ int xstateregs_set(struct task_struct *target, const struct user_regset *regset,
 		return -EFAULT;
 
 	if (!kbuf) {
-		tmpbuf = vmalloc(count);
-		if (!tmpbuf)
-			return -ENOMEM;
-
-		if (copy_from_user(tmpbuf, ubuf, count)) {
-			ret = -EFAULT;
-			goto out;
-		}
+		tmpbuf = vmemdup_user(ubuf, count);
+		if (IS_ERR(tmpbuf))
+			return PTR_ERR(tmpbuf);
 	}
 
 	fpu_force_restore(fpu);
 	ret = copy_uabi_from_kernel_to_xstate(fpu->fpstate, kbuf ?: tmpbuf, &target->thread.pkru);
 
-out:
-	vfree(tmpbuf);
+	kvfree(tmpbuf);
 	return ret;
 }
 
