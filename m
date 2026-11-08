Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148315;
	b=UrW0k0y0HLdKKyi43oJBLhquEQcXxWP47yJ/+T+31p3BCmsXpnfpwhB4+rul3WkU6IBL
	 y2MPHhtJYK6jDrOrc+2K/ZK19Oadsxc0VT7BHNce8j/v6f0cXYC1JMosuekWdcfCvquW9
	 OoZ+7zT/4LQsd7DUId3DOK9Z+K6EIhUZ/XFerQzvOPd+8vQupNngVsLzdBD9ZpGVBe9WP
	 oxkA/roZGg1aSjtwU+GWKNNgKAmNZbFlWlqrTxqLt2AodfVpGKKnFeCfiuVBog48HO4zB
	 e7CD3Y79lDrBuIEv2IOzhztrFrJSDHAjdzgL7ddUiTpzbQbwu1Y8Dn0ojY+JZh+/Ncg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=liy1VmXlPKvtQbzDRyOlq4Ft68qogIpqnl5phnSa1P8=;
	b=120rtR9GSpT5Mu9uvVJECKVnRpF1mU0EedRrubofx0LAZsnVuVxT5ar+XBCxl7X1NFFi
	 wi0SvJjt/kcShom8o07HG7jt7T+IAXFw2S6fOnYGUTSFbcvg2uqNYOmmBFW7fvgEB/0nb
	 7YiFx6Hr9pP96/2J8cv831qS17HAcfNdQ22AQLxai9zUvs0UwkAwmH/9TCU1MZ2DebWQP
	 cX8AIeMFXsyL1SUPdrftwBB4k7Vnr2CZ4f6YX5FxG1+NkOSLCvah4Vm27wRdNUQPPL6vV
	 0jjZSPCOjbUX+V1ixc5YqwG1A1GeKsTOZ1pDiXDW6+V3Za2y0FVZX/3xEoYsXQe4xiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ct+Jmk/m";
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1185606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1185606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ct+Jmk/m
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4a5f76661b5so420355e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794148313; x=1794753113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=liy1VmXlPKvtQbzDRyOlq4Ft68qogIpqnl5phnSa1P8=;
        b=ct+Jmk/mePCfTNw5JyEoXJ7aIvsqtL4IGtHgKGpa04qLsoMnl4r+Qg+yTKy2GAaw3n
         hSvi/HC60IrGTS+oAUXuvKQOU4uXbos4v5ieY2GRnHOcoTq+GmG7ugaqaN+vNhAd2LhG
         5yXwQFTC5NmMIxEZdXn5If4oAbuwwrnM2CNH6s1Pzxqgw8nvmQQXU6R7VulpOb9jmHI+
         W90Wwm/sRaujuk0oqa7ZPCghzshMJBeu8c1lcjhcPcnfni37053BicRy+vGN8Rviavwi
         fiScHJb4mIIdX2aOrXl0LXO+zq7bXwFB40qm5SI6mzEPPc40k3anAfxuvkUqzCLm6RIj
         0JDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794148313; x=1794753113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=liy1VmXlPKvtQbzDRyOlq4Ft68qogIpqnl5phnSa1P8=;
        b=vf4nj6xh0xhw43yjvEidmdoUJSyhZ/7Ppb8fjS2MM50uABRhOgK+nCVin3DY5iSHAA
         i2yIxWR7jNNzC0zmJJCk/jpXl2yGyDvnfrI9SBSfJiNtIAp2W71CNsE548bpsmx2wdX5
         94jAlEpU3aMiDVh9gRC5BUQVJI0ttaYi+E/yXyYtpGGIa6gr4zAXA6Jl7SOuiJGL3Yk2
         7CdHdcdgOF5EDt6JOdBVby0mCG8hi5cuqo0as/mPJ0nr5Qn3PEhX+dsA5qnlA3XUHUen
         ucK6oAp8acu0N0Zau/6v+/i9wqAXHwsRxlZ11TlC/WoN577qOZZ/IkrYGBrRmZv8OpLy
         y5Sg==
X-Forwarded-Encrypted: i=1; AL+hErFX3u3RyNxzxTI0o4EGXKA8LDHFFXWHUSmDMRI0msANsMQEzoxi+B25KBQETAr6nTl3K+kHq423w6UZSK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qrY6yicBjc7+BRdHzPQCj1jFMJuQjXWyA6YPZ11hiwQTJuptr
	S9RG4FJkk6iBQZl12TxMURVh+0muUVIc7PqCJw5Bo8T9fMxc2Mk9kqIy
X-Gm-Gg: AYBFou1+Mx5HqE+OnRbM4qLaFj10yJ5rHbIy6pW1BjpY1kgkU9zAY6JJ6DvELJwfWWB
	9Y0GEyPY3lzmGZSNP8xgRTBs3OaLQf4JRTok2T1UT6jPZPxz++ktiV9psUz4AI5V7B9UqM6sv/B
	IHvBn9GBZhxzxKqAeZWAgSwlB+z+U9Ch5TwQVGJb3PFQn2Bu/75zKiQHIwGt0vIR76PdSSa2hrR
	KkQH7edTmrO+fWIC+N5Na6qQaXPJDI25yapCkcmVvgfTppJ8LWZwOtzNfeDpTRuOkJCv1FxcvFK
	eAZWRTuyKK65zsGRR1+hhOHKJBJ9wkOqsOkbKXou2nWCRnQXXSD4xe/LpoepUQCRa+ibmpyXQFB
	pv/55E+goqZyIN5YFBxmL1NnKgWE/reIGfP6gtnaRHMSsZcnW0QRDIX7rCYHEO2nzOstHi8kkep
	8YCBmVGSzpbOvsk3OUMGl7kcfTn3P2IKmhSE1KiTcL8vECIL6c+Yht2ycApHWyct6ELBth0LJyu
	Ik8uqwCUsbleKS+xVzEyzt2HP6JH9P6WYYyFAnvfkpfKzbyVtCc2fUj++gmNBFxMSEHzyT+K7lM
	YhSb4k3Tg2hgXdEom9ncnyAqfI3Dp/8=
X-Received: by 2002:a05:600c:c4a6:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4b963c8eb13mr31501935e9.23.1794148312740;
        Sun, 08 Nov 2026 06:31:52 -0800 (PST)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee2b8c0sm68486485e9.9.2026.11.08.06.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:31:52 -0800 (PST)
From: Timo Joannin <timo.joannin@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Orgad Shaneh <orgads@gmail.com>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH] mips: cavium-octeon: fix missing prototypes
Date: Sun,  8 Nov 2026 15:31:40 +0100
Message-ID: <20261108143140.157628-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The compiler throws -Wmissing-prototypes warnings for
several functions in the cavium octeon architecture code.

It occurs due to a mix of hardcoded prototypes scattered
across C files, a block-scoped extern declaration,
and missing header files.

Fix the warnings by:
- Moving the prototype for octeon_fill_mac_addresses() from
setup.c to <asm/octeon/octeon.h>
- Removing the block-scoped extern declaration for
octeon_send_ipi_single() in mm/c-octeon.c and exposing via
<asm/octeon/octeon.h>
- Moving the prototype __cvmx_interrupt_gmxx_rxx_int_en_enable()
from cvmx-interrupt-rsl.c to the cvmx-gmxx-defs shared header.
- Adding the missing #include <asm/octeon/cvmx-helper-errata.h> to
cvmx-helper-errata.c.

These changes pass the compiler's -Wmissing-prototypes safety
checks without changing any runtime logic.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
 arch/mips/cavium-octeon/executive/cvmx-helper-errata.c | 1 +
 arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c | 2 --
 arch/mips/cavium-octeon/setup.c                        | 2 --
 arch/mips/include/asm/octeon/cvmx-gmxx-defs.h          | 2 ++
 arch/mips/include/asm/octeon/octeon.h                  | 2 ++
 arch/mips/mm/c-octeon.c                                | 1 -
 6 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-errata.c b/arch/mips/cavium-octeon/executive/cvmx-helper-errata.c
index 4b26fedecf46..4ced03c18ad8 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-errata.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-errata.c
@@ -38,6 +38,7 @@
 #include <asm/octeon/octeon.h>
 
 #include <asm/octeon/cvmx-helper-jtag.h>
+#include <asm/octeon/cvmx-helper-errata.h>
 
 /**
  * Due to errata G-720, the 2nd order CDR circuit on CN52XX pass
diff --git a/arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c b/arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c
index d23f46736dd6..314672040f2f 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c
@@ -39,8 +39,6 @@
 #define PRINT_ERROR(format, ...)
 #endif
 
-void __cvmx_interrupt_gmxx_rxx_int_en_enable(int index, int block);
-
 /**
  * Enable ASX error interrupts that exist on CN3XXX, CN50XX, and
  * CN58XX.
diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 7497be7b9431..a1159a3d7f78 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1156,8 +1156,6 @@ void __init prom_free_prom_memory(void)
 	}
 }
 
-void __init octeon_fill_mac_addresses(void);
-
 void __init device_tree_init(void)
 {
 	const void *fdt = NULL;
diff --git a/arch/mips/include/asm/octeon/cvmx-gmxx-defs.h b/arch/mips/include/asm/octeon/cvmx-gmxx-defs.h
index bdba676f1f2c..27b2ae74e948 100644
--- a/arch/mips/include/asm/octeon/cvmx-gmxx-defs.h
+++ b/arch/mips/include/asm/octeon/cvmx-gmxx-defs.h
@@ -2256,4 +2256,6 @@ union cvmx_gmxx_tx_xaui_ctl {
 	} s;
 };
 
+void __cvmx_interrupt_gmxx_rxx_int_en_enable(int index, int block);
+
 #endif
diff --git a/arch/mips/include/asm/octeon/octeon.h b/arch/mips/include/asm/octeon/octeon.h
index 5c1d726c702f..ef1eb000f46d 100644
--- a/arch/mips/include/asm/octeon/octeon.h
+++ b/arch/mips/include/asm/octeon/octeon.h
@@ -31,6 +31,7 @@ extern void *octeon_bootmem_alloc_named_address(uint64_t size, uint64_t address,
 extern int octeon_bootmem_free_named(char *name);
 extern void octeon_bootmem_lock(void);
 extern void octeon_bootmem_unlock(void);
+extern void octeon_send_ipi_single(int cpu, unsigned int action);
 
 extern int octeon_is_simulation(void);
 extern int octeon_is_pci_host(void);
@@ -47,6 +48,7 @@ extern void octeon_user_io_init(void);
 
 extern void octeon_init_cvmcount(void);
 extern void octeon_setup_delays(void);
+extern void octeon_fill_mac_addresses(void);
 extern void octeon_io_clk_delay(unsigned long);
 
 #define OCTEON_ARGV_MAX_ARGS	64
diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
index b7393b61cfa7..f6b890a89ea1 100644
--- a/arch/mips/mm/c-octeon.c
+++ b/arch/mips/mm/c-octeon.c
@@ -62,7 +62,6 @@ static void local_octeon_flush_icache_range(unsigned long start,
  */
 static void octeon_flush_icache_all_cores(struct vm_area_struct *vma)
 {
-	extern void octeon_send_ipi_single(int cpu, unsigned int action);
 #ifdef CONFIG_SMP
 	int cpu;
 	cpumask_t mask;
-- 
2.56.0

