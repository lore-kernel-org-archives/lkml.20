Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6FB30F7FB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790554792; cv=none; b=QgeA4yl8HvHCQU/1R4U4DBos/lnUrOUsqQtWVXntJXtrcZD4v2Q3fnZQtPvKpnfc+Zp5HRUod60Aihpcj53Vnqu5RuklIzqgvz53Vy6W6R6k17v5LeuUJ5dSied5z5k/7PL7Ay/70CdE8FcfnB0ag0yvUpyT6+24G3hhKJLKoN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790554792; c=relaxed/simple;
	bh=NoPlYYdvriRynUszPSql8w3mlOghDAEFvgvI94lPEmM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WVCPHP+Euk2xe7QCwG+jtxs4WZwpdsXPpuu0M162/+aH6GKhcaV99bVgoVrhfo/pjyH5d8DdI2dFJfNd6/Cg2UqcHuAflkg8Xp8rV5oKKDwClat2qdjsaMBXEDMi3AMiGwPKwFGJl5J7dk6j7N3De/tqKcbOwoU6g0KRZF0TkVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQF5K2w2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQF5K2w2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso6698465e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790554789; x=1791159589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tIprfReE5iUA2iuf2MpnGwQ14qWaMzX9pXzLu8I3APE=;
        b=FQF5K2w2Kj3IK4CabPCIvYCA2UPPdAYO5UJVETlBDvWjasv4n7vpk7jgaXCs5XZErc
         kZFkTwW2hk++zpRbomCPNZYM4bubQuG8cGWcJFjbxk0IgPLbWtUvMKAj9yD3zJNrpMBX
         Pw1SIwZysc+fZdUlKksAXo+krz2IrGar09xC3Q6c1bquS0zxcJ9fJPSrN/PbUZzlC2qQ
         waVP3O8opjT8lEozdY0Ch9Z0C6y5A2RyZ6vAJC+xMppVkXqFNgS+K8hTi7YVuWNy0YLg
         0X9/1aIbRoGnxIprCwciSfb7MijFTMK4b64JEp9Bmz/VolZ1KebzldBSrQAH8Zbel5XC
         iJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790554789; x=1791159589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tIprfReE5iUA2iuf2MpnGwQ14qWaMzX9pXzLu8I3APE=;
        b=cJXPISy6KcSThGKvSfkkr2iuJrgM2+WuuuYGCFcMaMC1NGwsYsOlEsq9cujAOfASTt
         xI8O7IgpDEBnzyRlQD6lh378hs9DuwTv/vnJMWQ5KSYSzcNhgz1epa/kdISBv5i/F27R
         VlfkOS1omhI6woIs9jX03RBBq2lQCiF7S91xzahkIYThuHq7NCxYThtIhA8bUXqE+4yI
         RQSnXTvBjaMLy8aYdvZO8Rzqv2j6bHxghTQ7EntXZSyeU64U2ScmTbLWy/9oeztSs4ad
         um/vLNaURg/9xEpl18f0HOuTSQG+RcmVa72rVO21BFNZRcqyKSpZjVJSKv2q/7CmJWq3
         pf4g==
X-Forwarded-Encrypted: i=1; AKwUvBxMQTxo9NbZNpoa0YQejC/aSnY2t+tMlAPfyJTQPbDFLvkzDCTIktFgFKnNQj4lfzmRSpAwHHBT1rPxHio=@vger.kernel.org
X-Gm-Message-State: AFuF++nuuAZq3/to/SFuNH8+Wj1T+zO61tO3Ppp/cUb8pfgkNDdXVqAB
	cT7EtBA4wsn7DYXzrcztbmYLjEhE4p1mwHi1f+9GwPlnT15WwIbdPKJW
X-Gm-Gg: AYBFou2EpvDuRZ8tzZXwW8NMnXPOPlIiT2/SKwu6IK/CIxqI98DLcOlu4GzUkob+RgG
	4XsDAULIwOsxEhGi03IbaDttsz4/1CXuRE8R3vwiHu11tB1RObr0NHQl7J22DCmI8cEGSrc4tYz
	5hCtNpYhotGoY75rbmMQSzFAPTrF4Jy16TdtgDoLQfFCvahi5JXHjM5o0BvO0/1DYJRwk5OGkWj
	Cl7Vy82mai7e2vCR3wX03QgrKSygfLBvC9+Yim02W1OXubJG6vJDNMEDFR4ER6PXDDrzSCV4lvo
	KqDYBN6p0KKGYotcLN0tCSyrnUGfBCTVf7y94mj2srfqNJQx4lP3sxY8WrUiG5ZYre6aPt/jXzA
	C85M3ez+IU7xa9ZTlqFvejVPpokml+RjShetpot9WCzkU35hS2j8PBdQhpzSXjRA6RtkpIcyFRJ
	lrEHoVYsoHsaOQcuvY7R3WBvBhbmE1v5j/53vBBkNvfCfnueR8ehI1CduSrmWXoIq8/AcvCttAZ
	f0F6OH1GrL4UR6mlWupW3/Bz7Ec01p21Ucpy4Tp3fxEAOapid+Cqo7QgStnnYr0tTCPXeRgLGO0
	Ruf3PHeYAn5ttFkgST2ze1clQwnQW/jW9smbmAp3gJHDA50VVwoSiwwdIKTz8BrXTNFlncG3YaQ
	zE+15iA==
X-Received: by 2002:a05:600c:4685:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-49ffd2d25bcmr81836465e9.27.1790554789143;
        Sun, 27 Sep 2026 17:19:49 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e6-5301-2072-0420-f831-ed4e.310.pool.telefonica.de. [2a02:3100:b2e6:5301:2072:420:f831:ed4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0029203absm79014865e9.6.2026.09.27.17.19.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 17:19:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Yoshinori Sato <yoshinori.sato@nifty.com>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sh: mm: fix double mmap_lock release on SIGBUS and SIGSEGV faults
Date: Mon, 28 Sep 2026 02:19:37 +0200
Message-Id: <20260928001937.12793-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit fb027ada051a ("sh/mm: use helper fault_signal_pending()"),
mm_fault_error() releases mmap_lock itself for every fault result
without VM_FAULT_RETRY. Before that, the VM_FAULT_SIGBUS and
VM_FAULT_SIGSEGV branches relied on do_sigbus() and bad_area() to
release it, and both still do. So a fault that ends in SIGBUS or
SIGSEGV releases mmap_lock twice.

A process that survives the signal keeps an mm with a corrupted
mmap_lock. With CONFIG_DEBUG_RWSEMS and lockdep, stress-ng --msync
(which catches SIGBUS) reports within a minute:

  WARNING: bad unlock balance detected!
  stress-ng-msync/54 is trying to release lock (&mm->mmap_lock) at:
  mm_fault_error+0xd0/0x16c
  ...
  DEBUG_RWSEMS_WARN_ON(tmp < 0): count = 0xffffff00, ...

and without them, find_vma() warns that mmap_lock is not held right
after it was taken. Seen on a custom QEMU model of the SH7785LCR, in
both 29-bit and 32-bit mode.

Drop the release from do_sigbus(), whose only caller is
mm_fault_error(), and use bad_area_nosemaphore() for VM_FAULT_SIGSEGV.
bad_area() has no users left and goes away.

Fixes: fb027ada051a ("sh/mm: use helper fault_signal_pending()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Tested in QEMU on a custom SH7785LCR model, not on hardware.
    Reproducer: Debian sh4 stress-ng 0.22.01 --msync

    Unpatched:
    - debug kernel: lockdep "bad unlock balance", DEBUG_RWSEMS count
      0xffffff00
    - 29-bit and 32-bit non-debug kernels: find_vma() mmap_lock warnings

    Patched (debug kernel):
    - stress-ng --msync passes, no lock reports
    - stress-ng run with 48 stressors: no kernel reports

    Testing on real hardware is welcome.

 arch/sh/mm/fault.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
index 06e6b49529245..138fc577a4c13 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -281,12 +281,6 @@ __bad_area(struct pt_regs *regs, unsigned long error_code,
 	__bad_area_nosemaphore(regs, error_code, address, si_code);
 }
 
-static noinline void
-bad_area(struct pt_regs *regs, unsigned long error_code, unsigned long address)
-{
-	__bad_area(regs, error_code, address, SEGV_MAPERR);
-}
-
 static noinline void
 bad_area_access_error(struct pt_regs *regs, unsigned long error_code,
 		      unsigned long address)
@@ -297,11 +291,6 @@ bad_area_access_error(struct pt_regs *regs, unsigned long error_code,
 static void
 do_sigbus(struct pt_regs *regs, unsigned long error_code, unsigned long address)
 {
-	struct task_struct *tsk = current;
-	struct mm_struct *mm = tsk->mm;
-
-	mmap_read_unlock(mm);
-
 	/* Kernel mode? Handle exceptions or die: */
 	if (!user_mode(regs))
 		no_context(regs, error_code, address);
@@ -347,7 +336,7 @@ mm_fault_error(struct pt_regs *regs, unsigned long error_code,
 		if (fault & VM_FAULT_SIGBUS)
 			do_sigbus(regs, error_code, address);
 		else if (fault & VM_FAULT_SIGSEGV)
-			bad_area(regs, error_code, address);
+			bad_area_nosemaphore(regs, error_code, address);
 		else
 			BUG();
 	}
-- 
2.53.0

