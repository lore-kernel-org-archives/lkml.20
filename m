Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1A4381B01
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534158; cv=none; b=QbZbZ4r5okPc6gZaRINESXaKKzfW9Wr4mcy7fkwkhIsCTgSTKmgfG+/moVXsWnJa9/l9UbboALfYsDjlH7sBhClnZCD4VQE4U2PCiOstGj9c3+rWxDQvAsvOrKtPswqK1nSoLD0DKoxWl+97GFbUkoBCM6Xoh+OYhtm0helWKoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534158; c=relaxed/simple;
	bh=AmPAlSohTFt+K5YyTCswin1xWvttAea2QIBo3K30gng=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nn/ZMmRG3i36GjdWN4ESwLGsBYm6jNwapPDFyI6pVTO3gCenJxE/Gsw5olgxOhSmM+i5YBlSEKsGtjHpuHKKcwx8maz+C6qqTZoCS9sU5/FEpBDDpN1K0vfJCv9YPwY4gEVB7mTfjXshKbfG7hIbtQ320euAKOrDCFBIT5ehaNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOG/ZhkU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOG/ZhkU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso17125925e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791534155; x=1792138955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iqp5RhRnr40+lLsW/0GeJg1Yf3xCkEgMP6LPH/ArdaU=;
        b=rOG/ZhkU4oOyLTTAtP90Co11VMBO3yb/spQqiuq472jhOjv2p6CghfHOkc9XOQ9Lk8
         67da4ZRIYYeYxPMaq0UMe60TzHhFbN5N5ZKJXkXXmnZZ+bw8DSvB0j2+GaJZcN8sPvPc
         SEM7TlltOwhOOwEoQ/Ktu6LNHLyOUQgZ/cAbyjGT3LXN4/8D7nbL7ur06374fTVVJhyF
         IeH/WF/o7KKpGERPtaKhaSzHzYoWnQsB12xCfE57vg3k07iAWjpe3mAB34GmvWZlJ6zm
         lzIHeazWM5smlM0s1WwusvCOkHvwOMuYzblZanDpwpbv/gHisznfDVAUA9TcNXWzpSrg
         Ny3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534155; x=1792138955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqp5RhRnr40+lLsW/0GeJg1Yf3xCkEgMP6LPH/ArdaU=;
        b=gZXt6+1hRTlcDEhShnO37nI9rgqWbX05OY7XPOhjq6hRLhm05jze8q7KdwZz+JJibW
         fDObF3bSUcSwUS1nJMt6I0WchBlDSzhgn9DDk4UhzzQKDsoM0oXI3cz8iTaon0ysnGeo
         0xABUOLCE7rqJieSRLdEouJZxBRnxdMfCpFJGfm9gjK8fB4spYEuzr1o+ZqtGHbFDXhc
         OP2Bn/qbaHUWxAhg5B0qNgDsTCml0r5dEcvLBDFDBsWo2ikNvnvBEY1pIysrtm7qc2oR
         J9spSvtAqlKH7k+bbdDGaF/zpgnKaLsnlr0OR5W4MoVwo7zZhaeuPlY9Hgw+OZHLBhQq
         ElwA==
X-Forwarded-Encrypted: i=1; AKwUvBwI+UU3ckMT/xNoZlr2XDojTsvF0w/omCzPHeT3+U6eLcrGuAVYWmwP/xn5hqsTFnAtLWkdHz5W7V9Wz/E=@vger.kernel.org
X-Gm-Message-State: AFuF++m28Jlc9dpWPdeyl0Dw9RF30ZWrGnHFmfOEQDCEMx+11sdcu2pu
	MaDjJofetkbnp/p3A6ZXrK5MZ+BgF64hlnrBZ/oXpa37sONpaT9JIcSq
X-Gm-Gg: AYBFou0Zv+hXvPP+xXD7tBi4KObeYbFq7Dr6A7/QfwRYwMAHuNlxmVcq/j9gYboRwBV
	Ia5YuuXyenErRXvpAeZNAUVdigxid8JJ1ZsYOpl50FCXqVppDixyLhQ6uHe/MkmSkFr9VSUDP6j
	Kxc7SRxkM/EZkPEpGqBEpidah9dxlCOeVcBiWcsRditnU0dkHbLe7Rzc+OuJoOkpmkvHq2oH6WE
	MrNcOeWeKUOhcXP1Z3YdR5JDDy1m0dN0jh3hZhuMaf5IX3D7gjb54gBQTrPjLEsjYHNcl/Q9bat
	o04nPWtfy0eF85/90ONBZG8QWNITfoasBQDuHqxeuJ634ygvGWBnzCwhWIhJyTuCB9N17Swgs0L
	NxsxwkRoVl6/Rxug8qkk4RrXCXdLA9p0UtMjklQ8YCHvIrpWyC0eOYndTUVrh3SWX4NbYYbeAhx
	uPR/8zILeb9/sIi7MJ8hmzxe7HqqnvsVjDaa0nqtlMqV2Busz8KpTQgONPoPSvrU3jhQd2ej2sf
	Ram5lljT+4Z3qCn9B6jQuVebicrD4pObtagTISHIWRBMGbMbPA5gpCHMRV1zYJM0I3/mZ4LNPXS
	PPKRo9zZy2dqQwrqU4cfEeUQ+TLJVGJRYBb7dCay0H0cSZDP3VRvnYyw72qKphNMx7gWufN9lR6
	HHA==
X-Received: by 2002:a05:600c:4708:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4a18e4a6ea5mr20042355e9.13.1791534154867;
        Fri, 09 Oct 2026 01:22:34 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18ee9bd19sm19659975e9.1.2026.10.09.01.22.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Oct 2026 01:22:34 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] asm-generic: cmpxchg: always inline __generic_cmpxchg_local()
Date: Fri,  9 Oct 2026 10:22:23 +0200
Message-Id: <20261009082223.40760-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With gcc 8.1.0 and CC_OPTIMIZE_FOR_SIZE, an ARMv5 test module with
24 cmpxchg_local() callers for 1-, 2- and 4-byte values fails at
modpost with an undefined wrong_size_cmpxchg.

__generic_cmpxchg_local() uses that undefined symbol to reject
unsupported sizes. ARM used to force inlining of functions marked
inline. With compiler-controlled inlining, gcc can emit an
out-of-line copy that retains the call even for valid callers.

Mark it __always_inline so the compiler can fold each caller's
constant size and remove the unsupported-size path.

Fixes: 9012d011660e ("compiler: allow all arches to enable CONFIG_OPTIMIZE_INLINING")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Sashiko noted that the generic helper still used plain inline while
    reviewing the cmpxchg inlining fix in my Rust ARM support series [1].
    This is a separate fix against v7.3-rc1. No in-tree build failure is
    known.
    
    With gcc 8.1.0, versatile_defconfig and CC_OPTIMIZE_FOR_SIZE,
    zImage and modules build without warnings before and after.
    
    External test modules built through Kbuild:
    
                                before    after
    12 valid callers            builds    builds
    24 or 96 valid callers      fails     builds
    Invalid 8-byte caller        fails     fails
    
    Valid callers use 1-, 2- and 4-byte values. The failures are modpost
    errors for undefined wrong_size_cmpxchg. The modules were built,
    not run.
    
    With clang 22.1.8 and CC_OPTIMIZE_FOR_SIZE, the patched
    versatile_defconfig kernel builds without warnings and boots to the
    initramfs shell in QEMU versatilepb (ARM926EJ-S).
    
    [1] https://lore.kernel.org/rust-for-linux/asg-nSs2cg7O-znd@gmail.com/

 include/asm-generic/cmpxchg-local.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/cmpxchg-local.h b/include/asm-generic/cmpxchg-local.h
index f27d66fdc00a..083f6688f137 100644
--- a/include/asm-generic/cmpxchg-local.h
+++ b/include/asm-generic/cmpxchg-local.h
@@ -12,8 +12,9 @@ extern unsigned long wrong_size_cmpxchg(volatile void *ptr)
  * Generic version of __cmpxchg_local (disables interrupts). Takes an unsigned
  * long parameter, supporting various types of architectures.
  */
-static inline unsigned long __generic_cmpxchg_local(volatile void *ptr,
-		unsigned long old, unsigned long new, int size)
+static __always_inline unsigned long
+__generic_cmpxchg_local(volatile void *ptr, unsigned long old,
+			unsigned long new, int size)
 {
 	unsigned long flags, prev;
 

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.39.5 (Apple Git-154)

