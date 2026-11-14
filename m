Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675391;
	b=GXzqhiHPlEA0XxSs+cqHMslH1p5Yf+YzdThXzVuj7f+n85kKbmrAo1P2sZZDWjUBqqbK
	 LKTbqL3jgr16yRKLpPXq3K6GsTUcBCdzoJrbu2PXQYztTpEtojb/DIsfxz9Q6MuLVdDif
	 GQ5Fx27CVoXGXvuyQtK0VWer1poPyTBLBundKrj4tQnYBXGj8a9y4W5CtCszeM4IqTSh3
	 iuPVm/tMUvpgDRnxaRS0AQdIp6Tvgf+v+HHM0MZMSdRyzrX1ZPJdCB2ELMKLlpnwPU1dC
	 R+Tt8/CqF+r/j98dZrVoMim70G41cFDvVMofnhtq39tax03Quily2b6zLOsupNdt0iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BoGx1v4Z1NQVeBs7zsbtmYqWYVJeBsFO7IuMFNHDWKQ=;
	b=WXYUczTXc8ArK9U8o8BzlWeC7SXHHWmOZZWEVjPWS2zOL+NzQY+/Awyy3nTB9xAjMZBF
	 anmVsTD3p6t18/mtO4xlIeLCbUbncqCkHu/vcRtFaA5+9jECw/cjhG3Dsku4GRACzxAXk
	 /xrRZzVPNx0oAmz2EW/zvvClI22tnT+sBI3t0TzsyxN1xw4X/ocFYrMTeMzdtVUM5ZIqI
	 7sGlsYqPOTtARYsWfjUx1m2waR5u08ureszVv0sXtbhSd7ZbK9dISJQXd/qvjoBz+SZng
	 d1HXCRroYt/vQV4M7mjsi6YPAQ3JJ8HPv6F6vx4r37P6ETRPLXWtIWNPZ7JRJoposuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6TCHDPF;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23524606A883
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23524606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6TCHDPF
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ae25c9f857so25692381fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675389; x=1795280189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoGx1v4Z1NQVeBs7zsbtmYqWYVJeBsFO7IuMFNHDWKQ=;
        b=r6TCHDPFFRT7ZFt9TlJVcXKr1SGyjbeR8XFjmoMPh5kLwCjAARY2GC9LP/ozhIcsfY
         kSpzFnJGGt4iSggcmbOub5donIRi0LusfwTlhkHdTF64yP8LdEgFleAHTdayV6TuD630
         mMT8wKSqzfKWYvEzbe73HIyqt5KpVYv2LTecKf2YHpk/sPLsZGzDaOvY7eLQ3A9rytc6
         wiWqJ0cZVetSjuLtDZQ5g4qpJlEZ2BWFBvj+aAa1eSR4Ibvjqs05SpDnuTlz5Tq2zdZ3
         l22mlD5BJovrR1gRuuy5xRpG5rMiZ1p3o/VMxrwWqKGqgCP2Cto7zpWt+qliwWq47c07
         q7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675389; x=1795280189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BoGx1v4Z1NQVeBs7zsbtmYqWYVJeBsFO7IuMFNHDWKQ=;
        b=RtjCzQfdU9bxn6jmUu5KhDUVchqwDz8DrZhZydm9uVI9UYVOnafbHx9yGKSbkrzJGX
         OmA/yVMscuqdj9myDZr52x46g42TMx+1IkgudWZkaSPPGxcrO2bGtGCVyeujUvrZGg2q
         iageHssa6F5+4kxjHfow30mrbnODCh3WRnTkMeEis9OLpgPEe0x9I1zJrYpx3CIVBwCd
         It4GOgFtEydtydAc6+LA6joCIxYIUBh19HZmHWkIfqMUGUQuVpJtE/q0xq60k0fo61xa
         Y8qYkjpRVh0BYtxDBDMhLsBpzQc2ug9RFKcVQ26Ca6ASfbNUlhi8KyfYSrhPHB+8iX8c
         R8/g==
X-Gm-Message-State: APuU4Z8fbUw9x0SZhBBx72cGllBktKP9kAkUkW3H/n/gIwCZdt9VGrza
	G6xERFU9k/YKr8oYMLYTuK7kf16D4Q5gCQAH2LhEVCrj2+ZAHblnNVIS
X-Gm-Gg: AYBFou2Bw6ug35K5eSY0/m97+b504QFLe+twc0hie3fpQnbHIu5UBbi5+l8hhiTGl+l
	Ep5TEzChlUtwERCv7VEVFvtfMJEYLZ62gH4Qk5yVcTwMqjcQv6FgbX19+EJSWQyEhKPQxk/XTGP
	501dHtwks28KitNpriU007tH6ko5349S4NgbC2tN7BW17i/D6E0BxTYcUCwvaTcq8FPxySi9ZZ3
	m0r0ZTUunz2PFmV1mpQsCNjYrcIy8dRd/IS3zY8Hxcl9cBHdVeUfr8H6DfcqOLJKZHfHZEyadFT
	GUSEB+oVIuEcE2yrIpFU9PFaBt/bbq4udc7UTvqadz0WXLL1OVllJluccQdDSwbKhAnevVYbV6B
	DczTxrNBEYiHLYefCy64hXObcINI4GS9e2y3J/Aa/rhpS4reumFzCM/rOe21k6KI8CLYiVml5ca
	sDn8B/tCXGGTO2WpOObDRUsgVg+dE4oiMmKpXewI456sCijfmw5LyXb72W9UlVgqcaqlmvTYiAv
	iVyDtGkd1xptEFhpxpj3bNNHluZtcuU8yb9qvsb1j3MQ+ufLcGhQLoCoflKc+Pcn4Qr5wX6U8eY
	c3tISD8YoE9kRk7vFbkyrmK0rhqNY2tyDHzGOPyTfqc57k1ASpuFM3N0q14cHk40EBSEhHB1AfK
	pyqiVkNZGbOsIoKSbmxQT6IR19HYncKY=
X-Received: by 2002:a05:6512:3da9:b0:5c1:5b79:de99 with SMTP id 2adb3069b0e04-5c1707469b2mr2133629e87.9.1794675388881;
        Sat, 14 Nov 2026 08:56:28 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:56:28 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 01/14] ARM: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:41 +0400
Message-ID: <20261114165612.368785-2-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/arm/include/asm/bug.h     | 2 +-
 arch/arm/include/asm/opcodes.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/bug.h b/arch/arm/include/asm/bug.h
index ba8d9d7d2..985857d65 100644
--- a/arch/arm/include/asm/bug.h
+++ b/arch/arm/include/asm/bug.h
@@ -82,7 +82,7 @@ void hook_ifault_code(int nr, int (*fn)(unsigned long, unsigned int,
 				       struct pt_regs *),
 		     int sig, int code, const char *name);
 
-extern asmlinkage void c_backtrace(unsigned long fp, int pmode,
+asmlinkage void c_backtrace(unsigned long fp, int pmode,
 				   const char *loglvl);
 
 struct mm_struct;
diff --git a/arch/arm/include/asm/opcodes.h b/arch/arm/include/asm/opcodes.h
index 38e3eabff..afa29833f 100644
--- a/arch/arm/include/asm/opcodes.h
+++ b/arch/arm/include/asm/opcodes.h
@@ -8,7 +8,7 @@
 
 #ifndef __ASSEMBLY__
 #include <linux/linkage.h>
-extern asmlinkage unsigned int arm_check_condition(u32 opcode, u32 psr);
+asmlinkage unsigned int arm_check_condition(u32 opcode, u32 psr);
 #endif
 
 #define ARM_OPCODE_CONDTEST_FAIL   0
-- 
2.56.1

