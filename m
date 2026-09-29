Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F5F397929
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666278; cv=none; b=fn98sFrVxkzMb4JFTrWn6NWsVcx82eEPOraGhfAxtQ2KpjmNDUNSJ4w1sbqxWRfHIep6zER37izAexgBgzPq+BsbDhzEX6p4aHoWqe+Ow+2iX6NTbjoDB3h+U4Qu/TRMKwgD6QXJrpe8rSLGvxujUiqZukQXzmyMWQGJfjMa/9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666278; c=relaxed/simple;
	bh=kLyXDGa8KZwfeEvwaqkbG7jW2lIJjCNaVmzFDVdm13M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Gx7wyYwuyCaaIWu843226k0avuqhRSl+xDVhHvwH1c5sRbQpZbGj038CkN4WM34StetAcnZAp9IdYxE9dMAmaoUlOI6bzUJl4gAQIzjDHRCc0xoNaWFfaf9QhsB65uAa8hjrzGteZnTNjQPsJ6ElAqntfz38aJe6OMshImmpuRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZfEea+5; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZfEea+5"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1450541ab50so1719984c88.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666276; x=1791271076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8+4ed2pEOUpvT4RZtU8pogb0RWHCYruOyJOR4nVdY0=;
        b=gZfEea+5qs9bifv7Qpe2qYl3yNRlNMVf3/kMFBC0RHx/d+2uH+n4OEffjDMd5PlDMy
         lCXoK7skn2ZTf4DVkSiCX0smg7T7ZIULq0zIQKKbW+QpWneUPA5fQN2c9Tlh2fzl/ayh
         LOcLwlhzWfCBQTMTGFeL7pIx9qqPu06/CYKBQONAmrpLK656fnqdb4jtlxViYNQ1Nvpa
         e0bpmjupzF+YPUkZ3/JxB4jSrW3sq1p7gt+wd5+rhZMvGO2G8IlOET3VtT/s3RIABypr
         EXdE1zAlnPGjH8NnQ75yptCef0YgUlaFD8dKrn2jFACsWrSz1SOCgkX14qcP8s/eZJq+
         cOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666276; x=1791271076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m8+4ed2pEOUpvT4RZtU8pogb0RWHCYruOyJOR4nVdY0=;
        b=MfOtno5j/NU0WSjqt+qux+58LaiVTl3uRhm8UpN2VBsK/el9H4SQt9EQLKSGrz+0id
         7H4Wfx+4iMNq1CdndYI0xHm72jMSv74ueU1s6dkOalQb06JZ7DeXqOzo6Q/FeiGr0xNo
         XheXniOfWWaLqXkKUv4ycEZ7F8oDDDhQwTeQ1U/dGcJvnfEaPqPTq9I4Q2WBCmXy0cFH
         zL+JOIvsV9dBTNc2xmbBqdJE7eyiBvGkcpwRXbQSq4g0W2rag5zb70ozh5ACcPThmNMK
         kPd+TxMveEOoccUV3EoweObneWTnFUsDctBuXNL9QknEsu3ydlFT7O+A1xanXOVU5Qac
         x68g==
X-Forwarded-Encrypted: i=1; AKwUvBzpPQT2lEvCA6pY46PARGuBreUCvpBfIURgI87uQ42gtUT6f71rUhYPZmgzfGYOkMXyDhivwG8He0/J3N0=@vger.kernel.org
X-Gm-Message-State: AFuF++mx0qDxdg9UWkmd3GgNPxK/K4n6gtocRcchoeuvmajzTlfVOq9+
	SV4akM0pMnyRZpgp4MeapYKX00+fFa4x/hWRWTBebCYlm+z05HVOmR0s
X-Gm-Gg: AYBFou2jEvfT4YBCrdOND8FWpigcNTTqvgYbPTbR/6ky+K98NyqlOBb0Feu3CFWKoqI
	UVeApnEbkLxrhZ1eu4pieZgMIQLV8uBKLKFTf8VVx62dliq0wsKACfgHnEunNqj5nmwTjFIYzha
	EA0PdsR16Ad4KlZL1Wq5kWxerN2CdsH2VoKD31I9s0wl3ixs9iYHSTUI0wP2n79AONORByFJPrb
	mb6FY6e5wPBrzTQ42FJvcEovqU4xXgBRlX4aBkb50YxqRyi+tQX5vPfx2Q6PDBoZRD7JbxtyZyl
	1Keaewa4giIcm2RHol9FnQJYdUUbzky1v1EOzYXO8rnjXvv6IgZTXiDPrHOMa3koQVrFzJilXoC
	iBIJOD5Cyuh4yMEvL5y0mEG+61p3VhgkwjL0gQ6rCKNZFfEXBqEqTbpk3yDErs2bW8AhqJMH/ZT
	aTfOZxGDJscZDFZ0QqSaQM3yEL/IVxO7/KBKHSHWcXuR05C+OMf54KDE16vMVa3Ts1b+XOVxZ4z
	3pQYG5Hxaphyh5f3OcfHuHgx1yaqt2bsSALhQ4BqcwGsN9FWSY=
X-Received: by 2002:a05:701b:4314:b0:143:50a0:56d6 with SMTP id a92af1059eb24-146cdfbe26dmr11752569c88.7.1790666275660;
        Tue, 29 Sep 2026 00:17:55 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm29980096c88.4.2026.09.29.00.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:17:55 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	mkchauras@gmail.com,
	ruanjinjie@huawei.com,
	tglx@kernel.org,
	mkchauras@linux.ibm.com,
	ryan.roberts@arm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/syscall: Avoid atomic test_and_clear_thread_flag on fast path
Date: Tue, 29 Sep 2026 12:47:44 +0530
Message-ID: <20260929071744.2965058-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In system_call_exception(), test_and_clear_thread_flag(TIF_SYSCALL_RET)
performs an atomic bit test-and-clear operation on every system call entry.
This introduces an unnecessary performance regression on the syscall fast
path.

Combine the TIF_SYSCALL_RET check with the unlikely error condition from
syscall_enter_from_user_mode_randomize_stack() using non-atomic
test_thread_flag(). If the flag is set or entry failed, only then clear the
flag via clear_thread_flag() and return the error value.

Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/kernel/syscall.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index fbefe1927b10..8529827d697f 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -18,14 +18,12 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 	long ret;
 	syscall_fn f;
 
-	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))) {
+	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0) ||
+			test_thread_flag(TIF_SYSCALL_RET))) {
 		clear_thread_flag(TIF_SYSCALL_RET);
 		return syscall_get_error(current, regs);
 	}
 
-	if (unlikely(test_and_clear_thread_flag(TIF_SYSCALL_RET)))
-		return syscall_get_error(current, regs);
-
 	if (unlikely(r0 >= NR_syscalls)) {
 		if (unlikely(trap_is_unsupported_scv(regs))) {
 			/* Unsupported scv vector */
-- 
2.55.0

