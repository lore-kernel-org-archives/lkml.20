Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF5858B6C8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171941; cv=none; b=fQCM0a6d3vtTwjfkgEannWi3kQhGWoBxSkTFY3z1wG7/hG60xF3ajh4XzRfhRyWSATw03THYSMadiTc0ldkJRXvOJEN8LjNusBNJPiqa65TdY3bkGVdX4v24TZvOsDDxejdEUxle8Lr7NC7qxBzyQUuy4NBI4yiSZTNmBjd86lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171941; c=relaxed/simple;
	bh=Xb9/uHbaP6ZztLgA2mKpC9Kw4vGIiSU4nzGKuaJgjA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XGptjBHLS/w4fJiync2Jq/6MapWSsLBW0nuA1hxXZf0YJo0S6JVyonBgTzL+1NwUbXGtY+15TDGwBUlU3xuh0i9jJUV5xz+LTyIKjgUGWfuiGXKI4h1cb+KUAi1cff37svzuSwocFsrnt72SQgQ4F5B6wd9piq3DqYskX6aSrCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnRj2R4P; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnRj2R4P"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so312971eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171939; x=1792776739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDk7pcn/pZwo4E/CsDXVdDsNLgR0YfetqbEY1bK/nD8=;
        b=LnRj2R4P44HUechbLgk675VE1KAPpF9sQF5gIs+kox6rwveYqq2OchKktjavr/C74C
         0sI0rWRD36P4HqGBdr7SzFUMyFGzCdrIOjncDdRSEF1F33L2gb3v1D8nexf4eWgi+POU
         YGtm482BdioeMh1LJzHQD1c598PYNxStPT7zKb34zYwuWkeIY9BM8g2DClUzAK2TVWPh
         4MyAHohApBIadKPmvW03YDvJ+LE8KrynBOOkkrjAzsfA/C0bqlGlmzj6KcWZVkjSYHJ4
         tkTb651ICK4PKSUY2aFflE2EsL6+VGjyY9N3SNntzuIiizPI740wjUUzZPzTXcpjE7b2
         R6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171939; x=1792776739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDk7pcn/pZwo4E/CsDXVdDsNLgR0YfetqbEY1bK/nD8=;
        b=DqPHNUlhPllOV2wJAc7AARd42wAiVkRSATsYRyL9OoeV4oPHVxa2dKD+Xj2jOU6GBr
         BLo7YbHGYxT++ZDUEV6yTkNn2JnidlVK8cioYp1/NTUsLHehEVbj8It+wMFE/3AfSfWq
         /AS4vfLgikTv8mIUiNdiJcviRrzjzHA0BIdH9Rew7S+xlfbsmjA8q7rF5T/S4H7nmtce
         sK61vxAJPFBdsFvHfW8TNQ5q4+qQMP4YH3ff+ovfaKoM1HAKzsANBdckMMY6/xdoqRrf
         JyTelQI3Jl60Vk4lLGRztU1p6sH+T+PylL2Le2bsgU/bR80V4ffUKVM7Fm2pOtxRo4nJ
         dEvA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ5eLC3fgtujXlC84mDM8hvsT8LFy4ptZpNFhKHO+m7u84R0bNpcMAwc+jqEMFgEdmQGK/fmFjFKYVho8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxk8X+Stqp02aYgiW82fXWhEB+42hN4UNDgBc6I7i4K8Pc293q
	EpLqymiSVhZbQS0xkBc5RGgyRDAftkk+ZCwDkOK4RDCtcxQQEGcraeE6
X-Gm-Gg: AYBFou0ClldXMR6fXQ/B3CNtRf3x+YPch+X8IOFlB70aicHs7PuKMtFW5VvMjgmG90b
	glvqBQptZYZ8P4kvR4mgWiF9NcEtOaWw7FvDpuGt4kvMaP0HsFy0whg64+RyHYaR+div9YjL+dZ
	7KPtHmWv1rTrn0lqQNnRmfTQiFwevLqk7G0vFoq7B+e+SKrMPHp+adHnbPzwg86Fkt7j1ZHJQcO
	gR4jD5S8AqgRpdYciFeUdxgU+D7HncR8VsREHKwFkCiSHMGpGzD0G23+8HvNTnBGapF4+19bFif
	lvGXwg97XCEpMIP7Koh4J8JQAJuWeMVGVx/bfXJ39y2Z2J6BOEmZbC9feJaT07FOGGRVrBIDwwi
	Fh/fwoYkDYm2uLtf+3zUk5D5QIuoDstP8pN519CaTxrm6jFKZ+emGFE/XfrxShjhqd+JLvse7pR
	msBhvXN/+yauAoBE39QBMD3f7O/WErt8EoicLXf9NuTDAhJrUhT7N6XHvEHbLg1WcbZj0DSSIU6
	tEo7vXBDqx8nJo9EJIqcctr
X-Received: by 2002:a05:7301:3a8f:b0:360:8a6e:640f with SMTP id 5a478bee46e88-361a3719b9emr513983eec.39.1792171938929;
        Fri, 16 Oct 2026 10:32:18 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm7980034eec.5.2026.10.16.10.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:32:17 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: manuel.lauss@gmail.com,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: Alchemy: Save the Ethernet address before reusing PROM memory
Date: Fri, 16 Oct 2026 10:31:55 -0700
Message-ID: <20261016173157.2083454-1-f.fainelli@gmail.com>
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

Fixes: 9ddb3c14afba ("mm: fix struct page layout on 32-bit systems")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
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

