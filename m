Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5720433F5A9
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789221357; cv=none; b=odHyUDiW20l9pyN4TdM7xPbmaFkEBOnz6BegKVRPdZGxm8jXCU29JdgAaNupQkWf8ZeSnnJvlGdsQozRj8XcFFfxABIhF2CoK9eyRhA964aWw95Bc9Zvu/0okx+rPUbC3LbFCCKjO4oquCeGv3QSu5KO3KaP2QnruNWnswzXNCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789221357; c=relaxed/simple;
	bh=yAoRHkb0cdspNR3dYLHiFXZaKyV0p0iashSaw1tecWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OxphslUGkhKkMhPhyipXugMJzHCRt8cE4E6JrMrxBVAq9nu2GMRa+s9m24RG7C18XK5+oyD0BxXNt8dm5PD9GYwiwM9bpEb750AxRc3a39uv3415MCK5GbGIGo/yYFdgynikovyKD2TUaxpP8dh1EqJ3PYVxKt8FX2YP+neO1xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofl8xhLf; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofl8xhLf"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381b831d535so3441821a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789221353; x=1789826153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUSuAjRqGx/M5QwIVqLGu1DFHbMG8Qa3csVgkMOVrvQ=;
        b=ofl8xhLfT3TgnQ7myQYEkI+xHAFLRtFl6hXoMiReTptvgxRbDK6xSa3H/DfZKXq1KC
         ediH+15qWDsjGd4y3UE0Wpdj31zMaJRCgxBmFrESMEqxxtWe8kMUzxS/vOZ2S4zkOX72
         /9tcxRrBAGWGSzfUo8IwpM67sJrANTzYvEYtf7Yx7G0kwRSO7zUWxTNYTD/qFnjUrkyy
         mXZhWWRnF3rQIRaw5+gF+IXkM0+tOs/PkvGNs52gwpumkMQV3siN/nwqYuuJDISUbvW6
         tAUyB+ATlMCJHEUl0AxgykiHDN2h5KNfIdJ0pwHvhhXqkgWRrM7Tit537/EQSK1TUiOX
         G46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789221353; x=1789826153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUSuAjRqGx/M5QwIVqLGu1DFHbMG8Qa3csVgkMOVrvQ=;
        b=pRgYtzUE7PEtLjxiqjR54FmL/pFE3Fe+MnAL6V4SxpsEXgGzMfC80Q0FJTztnWVBQr
         1EEfdHf14+smOZmDcj4SFY/cxwMtHqUDsWZbbenruxFIim18Yns7Etr0/EUU1rRUNvWQ
         3JMm+P7oyqxXsbhjTcXiQ/ZhI3FMXg2eTd9ugj9/InE+rnz36fXMQdH9UwrDq5MUA57o
         XSsSTK0f4A2Eh+AsVUwbi+UWRgxAjj5cKafHdfOF29kBjyJQKfxH1kuIxmnimBjYrZoA
         JzYnoemlRDwPGGmDmhh9clgykJ+fUEhT7WXKfd9WlluLJ+Oi42Cuxtrt6yHTqzdD8oPN
         m1PQ==
X-Forwarded-Encrypted: i=1; AKwUvBywqBl0OuJTmyQXw8ZG1MCEn8ueCxhm7F9dLKYZRWqPzxt4jCzd5jtsMTClKMKxNSolpaNcW5v2XJsj7g0=@vger.kernel.org
X-Gm-Message-State: AFuF++lKSbFMaJXXg3ed63oL/NQwN2Zeb/0xfNtfFtAfQXki7pT2BuqK
	Yq9uTJ/HgEog77CIUTFTFKKL9KxYTRwx7fiH8NQEz29SZrewY2rtQNoq
X-Gm-Gg: AYBFou2WfTCNuwpRARiBi/U7mDDVc4ZYIqXbsWNNWTFuu98LwdvQxX8Ngh2B7OSBmCW
	WjihhehrPbtAWab9OArt6vvSqmkm+E4fPpCuLhXRw/gOx+g9rdhSTaGdYJ59PXQQ8a96pmvSOmM
	4niKYMK1aUh89zKieIK9mz/zt4N1Z/PCjsjItusXE17RTMVEszcaQenhcBQlqzoxNJUb0JsFkQs
	FoQ0wC/LZIQHvun1RIfTxC3ww+yKhg211C56sy8TVgYjMh9DjmrRpsQW7mnFECeiPS9snKQK2XF
	FkDWERECSab2Yg8uBFmv7YbpWDND0fWlT7HFmGo7mNOn5jggdQjY9FU852Uz7cDwweah4Klk+1a
	23fCy11m6iu7sQyhzKdE+gYAYcfP5emeHd5xmeYFxq+qs2QMXq/htE+BZKjUbqmYnIzqc2QbFq+
	i/ZMlXB41KVArPkdHw1Mng5Cw8XPQGQmLbzrkCx4OP6PjYFyDDgXGhnzOyGl8VCVcJaGt0zNIiM
	MjZDthQxYVh9tlb
X-Received: by 2002:a17:90b:5823:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39d9c0aad8dmr16512252a91.16.1789221352785;
        Sat, 12 Sep 2026 06:55:52 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:dfd9:c41e:7c9b:c69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9afb1900sm3068760a91.0.2026.09.12.06.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:55:52 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+635d160c0d4133481520@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [RFC PATCH] arm64: mm: recover from kernel-mode SEA via exception table
Date: Sat, 12 Sep 2026 20:55:46 +0700
Message-ID: <20260912135546.55977-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_sea() unconditionally calls die() for a synchronous external
abort taken at EL1, without ever consulting the exception table.
This is inconsistent with __do_kernel_fault(), which does check
fixup_exception() before giving up.

A SEA at EL1 is reachable and recoverable: futex's LL/SC atomic ops
(__llsc_futex_cmpxchg/__llsc_futex_atomic_*) carry
_ASM_EXTABLE_UACCESS_ERR entries, but if the user address is mapped
to Device memory (e.g. a PCI BAR obtained via sysfs "resourceN" and
mmap'd MAP_FIXED), the LDXR/STLXR pair faults with a SEA instead of
a translation fault, and the extable fixup is never reached, so the
kernel oopses instead of returning -EFAULT to userspace.

Check fixup_exception() for kernel-mode SEAs before dying, mirroring
__do_kernel_fault(). No taint is added on the recovered path since
this is a userspace-triggerable condition, not a hardware failure;
a ratelimited warning keeps a trace of it.

Reported-by: syzbot+635d160c0d4133481520@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=635d160c0d4133481520
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Sent as RFC: verified by code inspection (ESR/DFSC decode matches
the extable-carrying LL/SC futex path) but not yet reproduced under
QEMU on my end; would appreciate a look before I chase the aarch64
repro further.

 arch/arm64/mm/fault.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b52557652be..fe5a5c5bbc27 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -878,6 +878,18 @@ static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
 		return 0;
 	}
 
+	/*
+	 * A SEA at EL1 can happen from uaccess helpers (e.g. LDXR/STLXR
+	 * on a user page mapped as Device memory, as in the futex ops)
+	 * that carry an extable fixup. Let it return -EFAULT instead of
+	 * oopsing the kernel.
+	 */
+	if (!user_mode(regs) && fixup_exception(regs, esr)) {
+		pr_warn_ratelimited("Recovered SEA at kernel uaccess, addr=%#lx, esr=%#lx\n",
+				    far, esr);
+		return 0;
+	}
+
 	if (esr & ESR_ELx_FnV) {
 		siaddr = 0;
 	} else {
-- 
2.43.0

