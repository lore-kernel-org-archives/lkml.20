Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF228405F7
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791731898; cv=none; b=hKtcKS6URL7JSkkqMU/rLKu0mcOK6yL4dfNUm9Tqtun8LoJhDVQOkOewa8PN75uqVvnUTUfNjhKYiWpuCunrqqlE349vv9y/13RQ1NSo5LdDIwfCf1OVYf6Vljp+CuJLiFsQ+fA+M/yzP01s5IhNTRCjJ3DPuinrEgR1gnGSALg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791731898; c=relaxed/simple;
	bh=47Juegb4i4wLYemsS3mlLmvD6SQo9n3f3fDvEuZbmeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVsv5thF1kAUQeILNgNp6CChqyM+1w3IfBaoMKoMUdoIusMDbzdPg8NEGjJcAmZyfkSefgqdPaUfeScqR8FAbs2lpdDqscHcvY96ko6MWvLVmktBWQvRUpL6HupbGXqXIxGxBfLygJ0ehDAuhQyUFwRMWSSNzWdcIiyYLVGI2f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6RfgQzK; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6RfgQzK"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3ab37ea4798so597053a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791731897; x=1792336697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Js12sCnL1SgWIn/v3LbBPMyn53Oc+3JONEbx1Wl0eE=;
        b=C6RfgQzK1dXomQ55pOlodjgqfZzNwgG+B95aEFK38o/GRDZxVqGWaL5XZpQDO0jnUO
         NqOkb52kAh6FkpTkFG7XQjijCp/0mMWecm+DLp2GYl+Y6PGdkXvkX3goXt2cT6KG/CGy
         z35k3Qx2wIAKV5TDpN7MlGtSD8BhJ7ptbzYceavyb/ewQERP+/eJWKz3FZOBVghRY6uN
         peMEdR4CGfKPr/o517puwCViAir4OF+NTok/Z3N9t2+1pJIhq8Q++e/iTMbXBRHAsTYS
         0OqcLj9rRNo+0z5UFKzmQKCux3FZ9f/sz45+YUa96QY0y2W+QoZ87PEQsx/yKGcRXt4O
         psPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791731897; x=1792336697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Js12sCnL1SgWIn/v3LbBPMyn53Oc+3JONEbx1Wl0eE=;
        b=pc/6qPYVraNGS5R8bLV7paoU1iM6pWElVRdrcHij0Yd6iRJ+0WuaMB4ITFlXCJQDZ1
         B4QKa8T1Parq3o0OqrxD3sWreNQZqaAThkOJnCXGrJQimDbLPslBtvRo/Idvb49V/mVs
         0JvJr9i6+H0tcKQ0ne/+fAVArpZXhjOjJw6/r7zWe9Pd3qQ5Spt9qZnZ+fK+5RUkyQeT
         klSGQUKU081RWOOoiNVdnG+4cP2uphWMX7qWH4X4s1waG3UyDA45szEh0FKcF9Q1vdhM
         rxi4CT3ZwqM0a38XVLMu5hY2oZvdg40Xntb+7cKTbds4drfPtwS2gkqBwKUp8RORmne8
         24Yw==
X-Gm-Message-State: AFq9FYK8vw6Biedc12fUeVQIKt1a66hDmq0glYzYlmJKU4NtR8g8x439
	5ly0Aerpxon71cC5C/UKekDbTm/RQHtFyPbXVtYL7/iPR0iGLlr8bF42
X-Gm-Gg: AYBFou0iEnABuni1ECM4oESjdCZF0JuNuJkNXt61YexVZQiFXjgVnnfDfIogv1EG8s1
	mAoKjXz1YOEQ8ZLNL4xnzy3M4IVm/V8+2RID9yKN9u/Fl3j92EjXthL+62+QHO7Ds+uE5Yax8lW
	+64DWGKtoJhb4C4he0TdTmQlvNMRrOAUUX4v7sIwlGw0Ct81LKRF2Gqy0tialkrkcHA62BbOKkL
	6zSvsyaAKT/2wxjR6T4+jFryPHkoCGkewhUgOa/tQWKXD/4s9Zs1tIx/YH5Pv/A8wdNY49oLbVQ
	wVZFN8zgBXa4n6vWCdZIS0Fyz/yuz7hBxudDEWwYY+Q1pCpwAcfnCZvdQSJv8KnaL7azVdk9oWU
	qFQ1wcOknnD2Y2hLChn/mUZd256Nnex5TOjxBkbpnQl5uClxjvuDltSJJWHd43wMEu0F+nLRzeD
	dnUmaH2Yt88X1YC4ks9KnlJ/AA7qg/H7v072iRF48yp9al10X1mN1K2LBvlhontcw5FA==
X-Received: by 2002:a05:6a00:3314:b0:87d:cc3d:fad4 with SMTP id d2e1a72fcca58-897c7fc20e1mr5366635b3a.54.1791731896836;
        Sun, 11 Oct 2026 08:18:16 -0700 (PDT)
Received: from xbp14 ([2409:8a1e:21b1:f670:abd0:4073:b5fa:6275])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3ccf7cdsm3075729b3a.30.2026.10.11.08.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 08:18:16 -0700 (PDT)
From: Jialin Wang <wjl.linux@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org,
	Jialin Wang <wjl.linux@gmail.com>
Subject: [PATCH] x86/reboot: Disable CET in machine_real_restart()
Date: Sun, 11 Oct 2026 23:18:03 +0800
Message-ID: <20261011151807.263575-1-wjl.linux@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a kernel panic occurs in an environment without ACPI reboot or
8042 keyboard reset support (such as QEMU microvm),
native_machine_emergency_restart() falls back through BOOT_ACPI,
BOOT_KBD, BOOT_EFI, and eventually invokes machine_real_restart(MRR_BIOS)
to switch back to real mode for a BIOS reboot.

When kernel IBT is enabled, the indirect far jump (ljmpl) in
machine_real_restart() jumps to the 32-bit compatibility mode entry point
(pa_machine_real_restart_asm). Because machine_real_restart_asm does not
begin with an ENDBR32 instruction, an indirect branch tracking #CP fault
is triggered. Since ibt_fatal is true, do_kernel_cp_fault() triggers:

  Missing ENDBR: 0x9a230
  kernel BUG at arch/x86/kernel/cet.c:133!

This issue can be reproduced with virtme-ng:

  vng -v -r -- 'echo c >/proc/sysrq-trigger'

which launches QEMU with the microvm architecture:

  qemu-system-x86_64 -M microvm,accel=kvm,pcie=on,rtc=on \
    -cpu host,topoext=on -smp 16 -no-reboot \
    -kernel <vmlinuz> -append '... panic=-1 ...'

Invoke cet_disable() in machine_real_restart() before loading the
trampoline page table and executing the far jump, ensuring IBT is disabled
and avoiding the #CP fault.

Assisted-by: LLM
Signed-off-by: Jialin Wang <wjl.linux@gmail.com>
---
 arch/x86/kernel/reboot.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 0fed6d0d7e32..eb23b8977de5 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -114,6 +114,13 @@ void __noreturn machine_real_restart(unsigned int type)
 	CMOS_WRITE(0x00, 0x8f);
 	spin_unlock(&rtc_lock);
 
+	/*
+	 * Disable CET before loading the trampoline page table and jumping
+	 * to the real-mode trampoline. This avoids missing-ENDBR #CP faults
+	 * during the far jump.
+	 */
+	cet_disable();
+
 	/*
 	 * Switch to the trampoline page table.
 	 */
-- 
2.56.0

