Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793348982;
	b=mXfFCTZ9rV42fKlhedutGhMIQ/W9SPAVt2jb3kfCB0egt/RvNGHUVdDbZ2hIaeJwkn/t
	 rsgyC1oep4vNMqZCXcqfLrGXqrdcGVzrdducY18dYigDWyJRUFtT9g6w8uluy3vQisw0V
	 /BNJqi/P2Aygy9J88r4akeGW8VzMo3c5Z3GCfkC5P0AaCVJ7BYGt928IrQT99T5B/6uy4
	 hiS3iNIXf5XOsxvtviitasv8lciiIU+vSSKAEQDUbx4ta12pFNyS+1R7T3T6c6hk7gcqA
	 7rJCASGV4i3BWO0RlKrveMOpTWIOlOKipTl0R2oaqDaZLls57x5sjZwKTHe0z89pUjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348982;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=+UfxfAj5AhCtq4HcXmGAqALsIonnT5XRHjEbBTgxzUU=;
	b=dxaxe/KykvKv7Twcnfm86MRti6WYG9UWrFc/zCD63hJJsgLQFxwZXNuF/aepCFy4OXb/
	 TzNq7qz7t6fBSZr1mfl4AS1AvUQFXsrH4BI2oaURILaOztgJ9eQPMy/pEM7+qWI2THBPS
	 /hRBo/1mA9H9YWTFhRd8meD4fgrUGMtBAopbwxgFufiws+VYXMgXFutUZOo9//oFvZ+1P
	 2bmGUR47ZO7lufImIM0ufWPWx/RT+QFV+YP/oEjA6xvEn10rOrzVWLMZ01PG0bNaJG6OG
	 OgIQ2GkNaw1XN2PRXKE6sCXA2LPd4PIT0GW5hVqfhLC8gWSYippeW9v+dtU9yG1uRhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outer-limits.org;
	spf=pass smtp.mailfrom=outer-limits.org;
	dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b="snhkS/ic";
	dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=4dIw4kaO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.23
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCED606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CCED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=snhkS/ic;
	dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=4dIw4kaO
ARC-Seal: i=1; a=rsa-sha256; t=1793348978; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rYx4kIkoFq76G5Y7UPv8ncfw0x6N0vseRIn3fDGX3I7hcDbeJbu5mx+jITfEdBJ0BY
    yfgfn6JgqP3UElK2LuBUov8/nX9MhPZ6gmPJP0/u+BCsX9Dcbr3QUxAwuhETua6IEbJW
    WVCWMWXBbf5JPNq2FxEtHHq1NzULfOBJZD4tHYN7bjzx5eAdDHiqwEm1Vckw8CAfTrPi
    rWgxozOgIQCm+xznUf3G8nkdKvI64U9q2oK5rPOUprmp3PdRRIdTzOfLfJ5sWz/r1gjw
    Y4SDD0RrZeYWZe5psETCieWUmoLnJ+HyplDNIsppNXEP/zgD4dUV1MV3UUUr6g8hRuiB
    tmCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793348978;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=+UfxfAj5AhCtq4HcXmGAqALsIonnT5XRHjEbBTgxzUU=;
    b=fwFdBT/49AoSDBIatiyr5WKrbA9VoSbwG/qTcilmbueX/NAXNTMB5gpVo53/FxKXB2
    4Wevw/QzgiMna6dvhnRusJs4wZ31Vjuc+it/C4CYki++57YYfngtyQWUtDokudd8Wv37
    hM0E0B0cbEzHYzIHs2MquQwIfrU/VF1luVicnSrPJTrZfLpUhdIX3FqkuKYOorbFBzN5
    YkitmeJje0wgrsdBhiZfoktZvnCctcW90Sd2bZcQy+243pRTu6Ify1OfrxSSI5kmt5as
    9bQXmVb7Rhs8ZSIwxN+HuQ+3FwZlFovzb+HWWfr2C6KVukgtBkHD2VftSjZvWesiK90B
    khDQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793348978;
    s=strato-dkim-0002; d=outer-limits.org;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=+UfxfAj5AhCtq4HcXmGAqALsIonnT5XRHjEbBTgxzUU=;
    b=snhkS/icHI6iE4y++VpYmUuzfD20bb8PR47FXYzEbE19SU+RQ2h6zpY0DVkpUrvVYP
    cOazogWSGAFqOThiNYlugCjIOuWdfRWlWZNywoJ+13toAwtdVknk7pnHtBUPcQXohZ5V
    eAMWGZ2CcFNVcHcMUpQsWHKNxt2GYXSxzgVAGTKFANngNUnsjJHM2E8ZFNdJH0zcLn44
    pVmWYZY3dLRdScz0CXnaQzT/U6jMuEO5Zdzqjrog5bvpYaW4uT9fqXhabloADEnFQ8cj
    fK43Y89mBqKnVthYhAUop/dXUbX/rpVuVFikGhh8BRtpvGctDchrBIuVAiZ4yf73Tdra
    ogYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793348978;
    s=strato-dkim-0003; d=outer-limits.org;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=+UfxfAj5AhCtq4HcXmGAqALsIonnT5XRHjEbBTgxzUU=;
    b=4dIw4kaOx+qCcDHlUUPhJHLnZ9RmWtMKksk2TnilTUx0KmRBOuu0UdfrosBowZXTtJ
    VIC1xN5V7mx1KRoCHeBw==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBFXdk1Z5IDmIqDY7xpnOs6mGD64frXxHtrE3e66udIGwZnWwLgga9o="
Received: from julian.home
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id J82cde29U8Tc7Ek
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 30 Oct 2026 09:29:38 +0100 (CET)
From: Julian Vetter <julian@outer-limits.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Vetter <julian@outer-limits.org>
Subject: [PATCH] ARM: fix big-endian check for IO memcpy and memset
Date: Fri, 30 Oct 2026 09:29:32 +0100
Message-ID: <20261030082932.193164-1-julian@outer-limits.org>
X-Mailer: git-send-email 2.53.0
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
Content-Type: text/plain; charset="us-ascii"

The commit 7ddfe625cbc1 ("ARM: optimize
memset_io()/memcpy_fromio()/memcpy_toio()") switched little-endian
builds to mmioset()/mmiocpy() and intended to keep the byte-wise
_memset_io()/_memcpy_fromio()/_memcpy_toio() for big-endian builds.
However, the check uses __ARMBE__, which is not defined by GCC. The
define used throughout the kernel is __ARMEB__ for big-endian ARM. So,
big-endian builds have been using mmioset() and mmiocpy() ever since.

This is a problem on ARMv5 BE32 platforms like IXP4xx, where word
accesses to IO memory can end up on different byte lanes than byte
accesses. Fix the typo, so big-endian builds use the correct byte-wise
implementations again, as originally intended.

Switching big-endian builds to the generic implementation from
lib/iomem_copy.c instead is not an option either, because it also uses
word accesses for the aligned parts of a buffer and thus has the same
byte lane problem on BE32. ARMv6/v7 BE8 mode would work with both, but
it is marked as broken and is expected to be removed, so it is not worth
treating it differently from BE32.

Signed-off-by: Julian Vetter <julian@outer-limits.org>
---
This replaces my earlier patch that removed the byte-wise helpers:
https://lore.kernel.org/all/20241203083838.3260036-1-jvetter@outer-limits.org/

I have done a compilation test with ixp4xx_defconfig and see that
drivers/pci/pci-sysfs.o and drivers/mtd/maps/map_funcs.o now call
_memcpy_fromio()/_memcpy_toio() instead of mmiocpy(). This is however
untested on hardware. I think the problem didn't show up on Linus' hw
test, because platform doesn't use those drivers.
---
 arch/arm/include/asm/io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
index e6bd9e79737c..50e142f817f5 100644
--- a/arch/arm/include/asm/io.h
+++ b/arch/arm/include/asm/io.h
@@ -308,7 +308,7 @@ extern void _memset_io(volatile void __iomem *, int, size_t);
 #define writesw(p,d,l)		__raw_writesw(p,d,l)
 #define writesl(p,d,l)		__raw_writesl(p,d,l)
 
-#ifndef __ARMBE__
+#ifndef __ARMEB__
 static inline void memset_io(volatile void __iomem *dst, unsigned c,
 	size_t count)
 {
-- 
2.53.0

