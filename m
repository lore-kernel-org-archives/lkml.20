Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6A443F4C2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189117; cv=none; b=nW1aWDfcvNxa3oa9FyKIjjkjvRC2J/mzCt2mQkACJ8gDNPSYd20XAxKdqE8GqahMTo4vPogyNI8M0oeYw+QzIdNCQfCut/MoXwsfrLf1b0yqknxMeqwMC8IBn/xHnu0HZ6BK9RRC4dNOweGdxHb9p6NBDd1vow5MryrdJJo7w/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189117; c=relaxed/simple;
	bh=eAkAvT+yBRUe0s9630zTQSOh0+HXy+SMp+QNlLmXu6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CcfzosiAnEjg3IZuRRvQ40+Yq4TUVCnqFqVToTB5PwgqiLjzQ7NHn3LmLIGxyqlIs5Xf4FOimCHhYTCBrUUwp4rdPnmcJqY6ITXrN98Uy7f7Sq4hjtjMBNS0j+LgwTZnqiyxWWM1MnwmTghG86JHQQXyPB91LzB4eBZWQn952ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrPBOcpt; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrPBOcpt"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535a54bed9so479355eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792189115; x=1792793915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlYhVNhZnOfgJKBXKw6X3C15lzRF5IoCPz9Nzq/4EgQ=;
        b=RrPBOcpt0Bfc++ENSWtLA73WJnYLrknL2kaDHIS/KvZXRbSawZzeedPhO03HY3xENZ
         OxYl+GimkGzJim3DfZMRtfunKqaF53AUVlELkpSzOl/8Lfoi6cZ5PkudY6y/b5LpOwC5
         4ib4JHk/f9E7elkc7y/VZK595Hj8okeRME4skOW1QzhkAqwkxcvKz/11L1EDeB5IDD4i
         Ll39JLFhfInCztjXtqRhamZMOS09bhvUZhCGZHLy+Y8ieqKqI3t/gsC9QdzQXVq5U4r9
         2zfM6l2mx4QczbTrGS1+tatZuG7utVROtIfZHU7rfJLglax/pL3KkPmiwI/yjqg3HyHp
         zWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189115; x=1792793915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlYhVNhZnOfgJKBXKw6X3C15lzRF5IoCPz9Nzq/4EgQ=;
        b=HTwJsgfB57C6WYmZ6fbNv4iBppA8yJ7wO90db29RhctAOO+Vq7TwoKCZXym2RFbsTR
         6btFN9nXUTlTv2YswiN09j6+ib931WfZJvpOtp7kPsMCc+NOI3NI+0T0pFzz9zk+7x/Q
         iDpXE+u5Jtqr3PpVhR1EL7L2RetQLPjv09JgP0Dvfrn20sjmAc2CNMPRf6nfQ+ctB4aj
         X0dZ2oVavAKqdE5sgATpm5+6Ogdk42aN12jifDGfrCXg9mqaPenTm6CS+Jp8BA187d2G
         e5+/ba0gun8QFFwquYyrCSqlCY7iL4F/ZbE4XPEMqwDkmACHfWISwbm2Igf4kYQ5ifL8
         Nwdw==
X-Forwarded-Encrypted: i=1; AKwUvBzO8CYm+MD8xKEj9GYu+KkY2ZFQFQbFYpIuF8zYm95IIjz8W5AfIQpuP83OAUDwKlNvmiQeR4RckJYidwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGJSqzi8NSMC2TrTyhqM+uFDCDvXdV8cos7q7JWv5pgmEcoJwo
	C5QDQBkCU1E9sKv2MZ7R2+WSrZIJMX5IPTWT+dykiOmxyvG/aba15vZg
X-Gm-Gg: AYBFou0N6O2EZLzqBswtfB3DFDzUHxPM7cWFhDfJG5E8+p4bVxm9MKfMm/FGM/FAWZa
	ShKa96CYJKjGdyF+BCxKTugPZbROYMCt2r/dZvuq876fooE8Y3LV4ADHxIdnmIJ6+w29Xh9vd6u
	MRJKmir15KYPwjdozmx55ivF8k6V39QbJOl0GME33d+wMQa9nuIlIkM7Mu4jbs5CT0Yy0Xv9AhV
	bdkLjFYhmdvSyzkveXTeQKwe/BqwDiIqHwOD6l39wQ0eCn4wf5HDMD0G+T4Z0eqgB3N8HCuN+wY
	buCwAdh0xGB///taHYNN7WCi35MioJ1GdB7S1S2MixMpLqhB/9nrlDdMfgXPn1LshinAatal+o4
	c4/EthAn7gVNGI6KsGuGyjZAaCSpgZ0B6b3mQ4QXqO3cajK/c7+9ONktPhXlpfmlQaH0xJCG/S/
	eQO+8gHQcMmfIqw7bIx6CRKrD9EQ2QvACzpoYbVPp7rCR/zjwgb71lnMVk1odjG5TLTd/3yWH6R
	hrtyFsv
X-Received: by 2002:a05:7300:d58d:b0:35e:d9ac:77f1 with SMTP id 5a478bee46e88-3619ed0f96bmr1421666eec.2.1792189115227;
        Fri, 16 Oct 2026 15:18:35 -0700 (PDT)
Received: from eldorado ([2600:8802:b00:1f84:d294:66ff:fe95:a98e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082b8573dsm9242531eec.25.2026.10.16.15.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:18:32 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] MIPS: Alchemy: Save the Ethernet address before reusing PROM memory
Date: Fri, 16 Oct 2026 15:18:26 -0700
Message-ID: <20261016221828.2223162-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alchemy keeps pointers into the firmware environment and looks up ethaddr
when initializing the Ethernet devices. By that point, memory allocation
can have overwritten the environment, causing prom_getenv() to pass an
invalid pointer to strchr() and panic during boot.

On the MTX-1, the struct page layout change in 9ddb3c14afba reduces struct
page from 40 to 32 bytes and exposes this unreserved firmware memory.
Bisection and boot tests confirmed that the parent boots while the change
reproduces the panic.

Parse the Ethernet address during prom_init(), before registering RAM
with memblock, and keep the six bytes in kernel-owned init data. Return
the saved address during device initialization, preserving the existing
YAMON formats and command-line fallback without reserving a fixed
low-memory region.

Fixes: b93ddc4f9156 ("mips: Reserve memory for the kernel image resources")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:

- corrected Fixes tag to a more appropriate one

 arch/mips/alchemy/common/prom.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/mips/alchemy/common/prom.c b/arch/mips/alchemy/common/prom.c
index 20d30f6265cd..c4aefeb78871 100644
--- a/arch/mips/alchemy/common/prom.c
+++ b/arch/mips/alchemy/common/prom.c
@@ -46,6 +46,11 @@ int prom_argc;
 char **prom_argv;
 char **prom_envp;
 
+static char prom_ethaddr[6] __initdata;
+static bool prom_ethaddr_valid __initdata;
+
+static void __init prom_init_ethernet_addr(void);
+
 void __init prom_init_cmdline(void)
 {
 	int i;
@@ -95,6 +100,9 @@ void __init prom_init(void)
 	if (!memsize_str || kstrtoul(memsize_str, 0, &memsize))
 		memsize = SZ_64M; /* minimum memsize is 64MB RAM */
 
+	/* Save the MAC before the allocator can reuse the PROM environment. */
+	prom_init_ethernet_addr();
+
 	memblock_add(0, memsize);
 }
 
@@ -125,7 +133,7 @@ static inline void str2eaddr(unsigned char *ea, unsigned char *str)
 	}
 }
 
-int __init prom_get_ethernet_addr(char *ethernet_addr)
+static void __init prom_init_ethernet_addr(void)
 {
 	char *ethaddr_str;
 
@@ -135,12 +143,21 @@ int __init prom_get_ethernet_addr(char *ethernet_addr)
 		/* Check command line */
 		ethaddr_str = strstr(arcs_cmdline, "ethaddr=");
 		if (!ethaddr_str)
-			return -1;
+			return;
 
 		ethaddr_str += strlen("ethaddr=");
 	}
 
-	str2eaddr(ethernet_addr, ethaddr_str);
+	str2eaddr(prom_ethaddr, ethaddr_str);
+	prom_ethaddr_valid = true;
+}
+
+int __init prom_get_ethernet_addr(char *ethernet_addr)
+{
+	if (!prom_ethaddr_valid)
+		return -1;
+
+	memcpy(ethernet_addr, prom_ethaddr, sizeof(prom_ethaddr));
 
 	return 0;
 }
-- 
2.53.0

