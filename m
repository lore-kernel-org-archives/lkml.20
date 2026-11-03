Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712671;
	b=46c0R+dvLkyONHK92ZZd4d3dsSJF613X8tW6snAzhnj/oPitJLEsZC4YkRC/rXxwf8yl
	 +wQe3uMN8waCSUCGhCvVNvP9EDsno7QBc8rlLhyjIV2Pa35naCTj/FNFqndHQcKhaQz9T
	 XN0wmXK1l+UaIGe/7t3D65Dlenr96ty2SCBwR62LAh8Ov8XY2CbdNDyIM+L2eUuWRtmzl
	 KFJ+BkUizETTUqAt10Bd1FlSZHHll4pm4uAFJoCYSD8Y6EHDnJ9GINxTZIRwjoOIznM7i
	 LvgekiJAG8bUV727jHbVb+M28aRhQQ2ppfk+gz0ilm5HNq8S95MD6ccHEM1A/JhTqLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712671;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=w8qel/wteSKBA8Y2Csz0JYEKe3WCB939OUqwMmJuaG4=;
	b=IEsCFR2kbKVuFXuOodXgdQoVNO1qcVcoTI8uan5MpKSuM1dnKz1e4qqBoWmm8RDGRknE
	 O1Az2fP+YN5ufwCSslX+Yrx5y/Pg3SYaHhtQ52B/vYmgZk9g/UMw9Y06MY86CuAp43Y0r
	 Duo2PMV4jgG1ZUf9fKpZeL7BehHMyDg8TEAYwAGykYlIqraUA8fpDq+EAXqcVrHJR0YpY
	 7fwbhXLz9hGss13yoiKrE6eCPuRD1pz6W0jD+pWzpslqGfU7CCrnGkTkNuOhb1x38+B9v
	 ypHEDy9jFjsQKrQcffDIp5Q6FltzC2ozlOX6d6u6fTuL+qP4/wudKbKM3sZZ/rtXYAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=uspOWiSV;
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=GOA+GpFi;
	arc=none smtp.remote-ip=185.136.65.143
Received: from mta-65-143.flowmailer.net (mta-65-143.flowmailer.net [185.136.65.143])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C2606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F3C2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=uspOWiSV;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=GOA+GpFi
Received: by mta-65-143.flowmailer.net with ESMTPSA id 202611031331010586b318060019fd37
        for <linux-kernel@vger.kernel.org>;
        Tue, 03 Nov 2026 14:31:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=w8qel/wteSKBA8Y2Csz0JYEKe3WCB939OUqwMmJuaG4=;
 b=uspOWiSV86kPUnbI0IjgW+FOAZmH0zwgoOXZWLe8Kx3JG1aD2hYxsW8B9y3ILIPLxFJevT
 v7Ri85MAqedvr8n5cS5OljJfXmKheCHDx+sUapN9aZiedHLn+pIDWzAuqxh5xCdsBwaxM5Z6
 elNnlKDEMbh2bKaLtITprhsj0XKjk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=w8qel/wteSKBA8Y2Csz0JYEKe3WCB939OUqwMmJuaG4=;
 b=GOA+GpFiZskBk/v+f3pCiOQEfa8NZefh1BmjCeu9mARReDnYKAobrwUSdQgJSYhzVd5Ovg
 xfOOWz/1w1rfsOaKLSUIpjPVWFN+xMy3c1KG4EhPyjmjVn8nV8ukO9rb+6fkHDXdDbOz+dSB
 XP5BRPm5tolkHfBaW6gQ2tmJY+cJO5HtpvBPE3rBSUrNTjTWN2IsWXblSc8Jxj7tUdXpiTAu
 GDrkUcONItdAGtWMkD12u/EG8czVjg3MULY8jzuHIb4Tgela9tSc9wPgeoOVpDwc96ga3vJC
 cNLJZzQdwjAqpyVIoZTLdx6hOoDndfvw9ZceaO/t2eb6eoCv1raRoYwg==;
From: Simon Schuster <schuster.simon@siemens-energy.com>
Date: Tue, 03 Nov 2026 14:30:30 +0100
Subject: [PATCH v2 3/3] nios2: Drop usage of libgcc in favour of
 GENERIC_LIB_*
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-nios2-remove-usage-of-libgcc-v2-3-5fabbedc49ec@siemens-energy.com>
References: <20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com>
In-Reply-To: <20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com>
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 Vineet Gupta <vgupta@kernel.org>, 
 Simon Schuster <schuster.simon@siemens-energy.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793712660; l=2862;
 i=schuster.simon@siemens-energy.com; s=20250818; h=from:subject:message-id;
 bh=pqnQU90Jw18vgjAqiX0T/om0dd6mDCy1Dhi5wCIDqHE=;
 b=eatkO2cSru5s8EHv+4bQ04KislttktGTOdc6ei1mPnWs7TmFLQ36MHNW/oJ9Inf4zax493Qjt
 s65NMKXCENwCxTHCedYwaQYbAl0B+0FDZJZG9U1CtvMTmrVSYmafUTO
X-Developer-Key: i=schuster.simon@siemens-energy.com; a=ed25519;
 pk=PUhOMiSp43aSeRE1H41KApxYOluamBFFiMfKlBjocvo=

From: Dinh Nguyen <dinguyen@kernel.org>

Use the kernel's runtime support for lshrdi3, ashldi3, ashrdi3, muldi3,
and ucmpdi2, mulsi3, divsi3, udivsi3, modsi3, and umodsi3.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
Co-developed-by: Simon Schuster <schuster.simon@siemens-energy.com>
Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
---
 arch/nios2/Kconfig              | 10 ++++++++++
 arch/nios2/Makefile             |  4 +---
 arch/nios2/kernel/nios2_ksyms.c | 22 ----------------------
 3 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index 9c0e6eaeb005c..3082444b2b487 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -14,6 +14,16 @@ config NIOS2
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IRQ_PROBE
 	select GENERIC_IRQ_SHOW
+	select GENERIC_LIB_LSHRDI3
+	select GENERIC_LIB_ASHLDI3
+	select GENERIC_LIB_ASHRDI3
+	select GENERIC_LIB_MULDI3
+	select GENERIC_LIB_UCMPDI2
+	select GENERIC_LIB_DIVSI3
+	select GENERIC_LIB_MODSI3
+	select GENERIC_LIB_UDIVSI3
+	select GENERIC_LIB_UMODSI3
+	select GENERIC_LIB_MULSI3
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_KGDB
 	select HAVE_PAGE_SIZE_4KB
diff --git a/arch/nios2/Makefile b/arch/nios2/Makefile
index f1ff4ce0f1a2c..173588c31abf9 100644
--- a/arch/nios2/Makefile
+++ b/arch/nios2/Makefile
@@ -19,8 +19,6 @@ UTS_SYSNAME = Linux
 
 export MMU
 
-LIBGCC         := $(shell $(CC) $(KBUILD_CFLAGS) $(KCFLAGS) -print-libgcc-file-name)
-
 KBUILD_AFLAGS += -march=r$(CONFIG_NIOS2_ARCH_REVISION)
 
 KBUILD_CFLAGS += -pipe -D__linux__ -D__ELF__
@@ -37,7 +35,7 @@ KBUILD_CFLAGS += -DUTS_SYSNAME=\"$(UTS_SYSNAME)\"
 KBUILD_CFLAGS += -fno-builtin
 KBUILD_CFLAGS += -G 0
 
-libs-y		+= arch/nios2/lib/ $(LIBGCC)
+libs-y		+= arch/nios2/lib/
 
 INSTALL_PATH ?= /tftpboot
 nios2-boot := arch/$(ARCH)/boot
diff --git a/arch/nios2/kernel/nios2_ksyms.c b/arch/nios2/kernel/nios2_ksyms.c
index e8710a269b398..351664e236fac 100644
--- a/arch/nios2/kernel/nios2_ksyms.c
+++ b/arch/nios2/kernel/nios2_ksyms.c
@@ -21,25 +21,3 @@ EXPORT_SYMBOL(memmove);
 /* memory management */
 
 EXPORT_SYMBOL(flush_icache_range);
-
-/*
- * libgcc functions - functions that are used internally by the
- * compiler...  (prototypes are not correct though, but that
- * doesn't really matter since they're not versioned).
- */
-#define DECLARE_EXPORT(name)	extern void name(void); EXPORT_SYMBOL(name)
-
-DECLARE_EXPORT(__gcc_bcmp);
-DECLARE_EXPORT(__divsi3);
-DECLARE_EXPORT(__moddi3);
-DECLARE_EXPORT(__modsi3);
-DECLARE_EXPORT(__udivmoddi4);
-DECLARE_EXPORT(__udivsi3);
-DECLARE_EXPORT(__umoddi3);
-DECLARE_EXPORT(__umodsi3);
-DECLARE_EXPORT(__muldi3);
-DECLARE_EXPORT(__mulsi3);
-DECLARE_EXPORT(__ucmpdi2);
-DECLARE_EXPORT(__lshrdi3);
-DECLARE_EXPORT(__ashldi3);
-DECLARE_EXPORT(__ashrdi3);

-- 
2.39.5

