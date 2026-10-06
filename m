Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C2538B12A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266036; cv=none; b=Z43h+drVSTTR0Qsd0kuf64wPzW/nqtzprvJT3PTy1hpH7q3brZ3OXgJ12R22AtHqX1oWWFEbwNZsNb9P8osFaOryDJhvh70LBGoNbqhkAOxS4VLLttlmN3RZLuuYSRgHW91j0Wp9H9EiAfaHpaeqLRwOsYhL2C03Hb1bbDnIgHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266036; c=relaxed/simple;
	bh=4wpQ35WgKarYRqkVm3OJkBN2mAmBQsGCcCUrLEH1WR4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U3wsrFKNGZSf0M7r4/pR6znL8Q57rlRlCSFktfLh5+4FdtbaeuFaD/iPmyvqfEIjxv/kADPpdRp4WLldTjG8jOAhli8T/9IhfWTXlhpg1ZNAksrcW4Lz068/rpOhKynlXUWmeuRekU+AAeT0H2hLylGs14eUR55EQGAbq+r4uEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8mu67+2; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8mu67+2"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b02a2359aso299069f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266033; x=1791870833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZGLmDWL+stpVuTZqTeYWI/wCR8kqrLnXlNhpnZwRvo=;
        b=O8mu67+2sHCyLPYaanyZVkMPE4UE5Z0gEn+KvhIzBrG8PhFw+cNfCCdKYx859Ai9CM
         tOqigIi7lpVxhS/+YONEatRPgonaZfcAK+c965TwwN0rZ+gWRl7dMVSICpaPuWJ6Ypsl
         yGAfekocGehAPed5WRYArnp/Ye5UWOov48n1OubCuEYZveYM45KIXi9T92iySV5uysR6
         mlvdbRV8qqQdjb2Lwwsynv4Ar7sS/QsWAJC+D01e5KBwKJKs+E6A06cMHT4GgLuYDlWI
         7lrJvD0JHz4zllHgvu1Dc29zRNyg48DHZkHVw2AJT/puU7V/pdPEKy3lqkhg40sIi1j3
         fzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266033; x=1791870833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZGLmDWL+stpVuTZqTeYWI/wCR8kqrLnXlNhpnZwRvo=;
        b=eQUZb89bG3A0R51LumZ9RdBW+hkm3hYEvK1RZpf1HupjsvhBH8DF1rZIGedjVwYtDK
         cy3CAmHIbT7jh4jXQu9o/uxSwGuos7RmHs9YPbokbvn8azTXOZuxOnZuEhtLCzXdwnz2
         Yca4ZS5o+urfDJrnK71NCagu2E95VYnLk/ogqPZpjtzMMuJl0yffFdwM5WgzPyWC3HgF
         UsP03pQqkUvb1VN8VQbon34iMHHoITebbk8C8X+1tAmtAK1wJV9zuGd6ewDi7WOIcN3b
         inT5t0PM//wEeBH57y/l6/kAKuOsYPjS5o2OuFkcgLq6MYNwTJcFf3ofAvjHhSMqwwJB
         0PrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPC3P9PwDMnwapzmiR2xup1FxiLPTRugQczD8lbP2TB4QJJ52tTK1jwQ6biLyrvoFKL6r4+9CH16uwqUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVabYT/CZaXq4nxHhFnKa280MOU7/JVXE0E4UYDfZ2HpVwzxQM
	Cqz0vQQ/frJtMWj48/DcAQsll+ct3SZGXFvIADmGSW6ZXCgm2OE+ns8D
X-Gm-Gg: AYBFou1ccrbOTRXZHk19gqCP0lXCm+h7lFSzIXmH+WGD/v4iRpdZ4k+zxBs91L7InB0
	cZyC/EzITsmljaaoHBkNZAZUtJRr2KrLTQx4is41l+I/qyqxJas8eXlQO3dNOtsC5S75SHDp0u/
	7t78LrL2qRFBjm6QCxxaNAVVkF3pI0TYTIISH3Jk01jD5v+A0rtlOoD767wQCkPA/bL1xgBpKQ9
	a1ud4CquxCF9fxpEzRgzoQZF9hRTgGNUXkXooDu/IkUmNb7tIMBYQraecSKea+CytEKP4/m6yqt
	ds2Mq7DZKNmVjmiTCQh/6pp2fbHGrKVtOXikhZgFuDpXwHDgCGwcnG00yg4UaTrbVwmvXl79b3l
	JDjSx9UAR92YSO/tcxZIoxltp2qQozmRyBEQOeO68LU8Ov0BfFNUPd3EJdY5g0h0EY4YaoXgMJD
	cBcxJX4DYIJlWde67LWxG9HRZ+OuZ0UXPOLE/axMg2syCCybeCSSXpucgwcoPjTI5M7UtYhCGdu
	t/4Mr7vyYHfV9JgODfam/gExdaZ+STlAM+O+YxXWjCOF4hnqAXYo4iUhLTjK+G4wT6bQCVNGPOp
	LeDkEP145v7oqeFnF3AylFC2h6qqCLokmR8Sr7PqWW/wnQ==
X-Received: by 2002:a5d:5885:0:b0:488:7892:1932 with SMTP id ffacd0b85a97d-48c6d05e8e5mr554292f8f.0.1791266032361;
        Mon, 05 Oct 2026 22:53:52 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6229e0d6sm7798995f8f.32.2026.10.05.22.53.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 22:53:51 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: mm: compare ARM926 cache range sizes as unsigned
Date: Tue,  6 Oct 2026 07:52:23 +0200
Message-Id: <20261006055223.9299-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arm926_flush_user_cache_range() uses BGT to compare end - start
with CACHE_DLIMIT. Sizes of 2 GiB or more are treated as negative
and take the cache-line loop instead of the whole-cache path.

Use BHI for an unsigned comparison, keeping the line-by-line path
at exactly CACHE_DLIMIT.

With the default 3G/1G split, unmapping an untouched 2 GiB
PROT_NONE mapping flushes the range through tlb_start_vma().
On a SAM9X75 Curiosity board, munmap() took about 1.3 seconds
unpatched and 20 ms patched.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Based on v7.3-rc6. Tested on a Microchip EV31H43A SAM9X75 Curiosity
LAN Kit with two kernels built from Linux4Microchip revision
8f2c610093aa3d5a7bd50a8d0597be4f0b7a3eda. The vendor function matches
mainline.

Both builds used Clang/LLD 22.1.3, the same DTB and an
at91_dt_defconfig-derived config: ARM926T, MMU, CPU_CACHE_VIVT,
VMSPLIT_3G, CPU_DCACHE_WRITETHROUGH=n. proc-arm926.o differs
by one byte, the branch condition.

An unprivileged test timed munmap() of untouched mappings made with
mmap(PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS). Boot order was
original, patched, original. Each cell is one munmap() call:

Range              Original A1     Patched B     Original A2
16 KiB               0.0840 ms      0.0852 ms       0.0844 ms
20 KiB               0.0656 ms      0.0636 ms       0.0632 ms
1 GiB                9.7688 ms      9.7702 ms       9.7716 ms
2 GiB - 4 KiB       19.4054 ms     19.3928 ms      19.4066 ms
2 GiB             1323.2802 ms     19.6478 ms    1331.8680 ms
2 GiB + 4 KiB     1322.2016 ms     19.3972 ms    1322.2146 ms

ARM925, Feroceon and Mohawk have the same BGT but were not tested.
Their fixes are left for a separate patch.

 arch/arm/mm/proc-arm926.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index d94aa8199452..374229919541 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -155,7 +155,7 @@ SYM_TYPED_FUNC_START(arm926_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
-	bgt	__flush_whole_cache
+	bhi	__flush_whole_cache
 1:	tst	r2, #VM_EXEC
 #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
 	mcr	p15, 0, r0, c7, c6, 1		@ invalidate D entry
-- 
2.39.5
