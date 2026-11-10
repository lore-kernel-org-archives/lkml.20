Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326364;
	b=HUjeN7xTpepbwArMsTXMQSyN1ssECd0RAhmy0XglDFruFIos/MkGXgj9II0EF49T83VI
	 G7CBBGyW7GiPdWS4VvSBASeGAX+TN9OnTLOAxnGGijM9NM74K7+kR1shDS18Nm3xlXhh8
	 UG5lrGk00h0WJd7oT+GtUuoHil0z2L6e9NtvCVH2J3mZmb6jEm8ZVXnCqq9R23g4+VHMn
	 +0NGqozteYC/y3XtzhSWMJSouZvC+UG01SJBYIFCwfrjGsbZsK/jo++jPGWOmqdYDklUh
	 KabQUhcXH+nySf7dS1tuWWp5eBlxMFfY50o/sNdhtjARL1W6fmuO+cFaUgJEpVRjqrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326364;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=w8qel/wteSKBA8Y2Csz0JYEKe3WCB939OUqwMmJuaG4=;
	b=ZJ1fOUzQ01RGJYNV6WROAnpdJSerBRN/6iri+fV6/IBaLNOD62aaZ154frtX6De0InJn
	 N45G0qjfaxupc1PlLhVpMNwwYEXtk8K+71WeV2q0xwVoVIGt3UhO67kDvRmvltVuMNeTf
	 0THFyc4oVwMEMZEhAA+EKTlfuzRbgzODi+Dsk+BAt+CTIEJdYK+oQ4Wscc9/ywxTq3tir
	 bMOATwGNdb/uYiAKwbjs0iJ0Q7hpBZ5uCNdxL9/RlEzyGkWCE6a1AuOUmswiAohkMhSDa
	 TL/8+Dsv3n9B+nX4aYi6YNrTsHMDu96mZ758vw1YXaRYImG8MyLlED4U0NoFfXD/cNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=J1keNzCS;
	dkim=temperror header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=O0NfFPnD;
	arc=none smtp.remote-ip=185.136.64.144
Received: from mta-64-144.flowmailer.net (mta-64-144.flowmailer.net [185.136.64.144])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0224606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0224606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=J1keNzCS;
	dkim=temperror header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=O0NfFPnD
Received: by mta-64-144.flowmailer.net with ESMTPSA id 2026111015590853100309e90019fdec
        for <linux-kernel@vger.kernel.org>;
        Tue, 10 Nov 2026 16:59:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=w8qel/wteSKBA8Y2Csz0JYEKe3WCB939OUqwMmJuaG4=;
 b=J1keNzCSYoEzxMGSgVZqs7oKyEWFVkbucRU1eD8N7ZcZ72aUuoFppfCtzJB77iH+3RWmc+
 2z/hu/9RO3PlXtnVjrSZp+KuMhjg0gT0alIEePAINYYW0MOI3xnMBTN8LAzKRVMbNwzX9i2z
 MyRB0YZqOBmrxbAVquEDpr/cR4v1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=w8qel/wteSKBA8Y2Csz0JYEKe3WCB939OUqwMmJuaG4=;
 b=O0NfFPnDZuPhfXUADeQMajDXVPp1O/jXkpM9EHA+fuELXi+LZvpH5RFhqljtP1/KIduE6l
 uhtMTe11qrJiETBj5bJ85Brey47yaBiRQf22cA4t1ZE6TWvTWz8uISC4HGwjIF3WpPcgAsg2
 0S1EaFzNyVwHzIcBcLazX+WNCrO9uLiHZzbg4j8xILNFGog7khRVjoG2gOdJcVnMGPWro19s
 bOEA8xkWdmteR7Z1r9krRxQ8BrqyrjUJOVwihRh9VHRBMmigrap7pTBeNerKjUVrSyrUoqMI
 qB1Xj7oVZAQghK2annOfCnOV8WEgAurzOtMgskRdxf8dno8HE/luGyfg==;
From: Simon Schuster <schuster.simon@siemens-energy.com>
Date: Tue, 10 Nov 2026 16:58:52 +0100
Subject: [PATCH v3 3/3] nios2: Drop usage of libgcc in favour of
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
Message-Id: <20261110-nios2-remove-usage-of-libgcc-v3-3-1449ce37948e@siemens-energy.com>
References: <20261110-nios2-remove-usage-of-libgcc-v3-0-1449ce37948e@siemens-energy.com>
In-Reply-To: <20261110-nios2-remove-usage-of-libgcc-v3-0-1449ce37948e@siemens-energy.com>
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 Vineet Gupta <vgupta@kernel.org>, 
 Simon Schuster <schuster.simon@siemens-energy.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794326347; l=2862;
 i=schuster.simon@siemens-energy.com; s=20250818; h=from:subject:message-id;
 bh=pqnQU90Jw18vgjAqiX0T/om0dd6mDCy1Dhi5wCIDqHE=;
 b=RDrG85RCt+kvt3EWZqpDfaJPMXk0q5l3IqZL0YPDzRC2YCcZWAwHQhOHJM0A9aBodjrgHro+4
 gdSb3o80Oj+DTrxtaPnI7F1VofH3e9XaCe1EYcXJ9dx+jTqXO2Xk1dd
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

