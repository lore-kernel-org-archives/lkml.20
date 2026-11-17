Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905106;
	b=vZsMbG6awp7xBlcrz2ftqfTdcj26X83ayknauX3nn3XgLijE3yvUqQRrp6WgmsQGWMrM
	 JEu82QGQe9J+wHTXVvxWqlz5rVj3jAUnwPu5MidYBanCvkm1/l8BEwfETZvleiw4h2Epn
	 oNBgN/MYmsC5s8/9jMmV+NztxJ7PdDNyzKEFTrJPJJy/oM5mJINqzoYscEsVfB23z43TB
	 BowranDTalVPLSz52I+hHc3/+0LLIESBCbXel4kk9008qKdWNQfA/IAttkfWMR+m4o18Z
	 B9HXoTkSLqz/+tTlytkeRGYMNGeISBJoJi9L41nSygDU9WTHB8OQsywPYcaJO6VpzKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905106;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=yDzaN8zNsYziiwwWnbzFQP17MdrMEIb33bW6UntLbrs=;
	b=GiPycSvCBYkhG6LPzCVIG0nKwccNmJj175d8SNvNdid+hp7ii+Yrqf8WlUpVfKV9s8EH
	 R6aaBMUBXbPcLYeB6IScHVXbOUq2H1zkwH/3TSH2uXh4q6GDfDplQgSc8Uh2Be/WA0Aia
	 P7J4lEleRpsvTqrTzcgC2vzoj10Ke2mSy716jnhvnUaGemOVdHhQozQYZqwAM9vohhfh5
	 AMtIWSKiRXKK62CoweUu0qaa9Rao4TrUxM+3HMMMhG9nx2WcEBahpwAzhz6H5fE0fa22l
	 YTDebn9+PEj+hK0kqvpucm+6gEi3uAZQ+fVTd8sH39Bj3AFBevg+IM0OdcRkyaBrDuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Jp5Z5iRz;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE3F606A8AA
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE3F606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Jp5Z5iRz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yD
	zaN8zNsYziiwwWnbzFQP17MdrMEIb33bW6UntLbrs=; b=Jp5Z5iRzxtZlMcS2ld
	xFWPzopOzl3JXot4N0gjTFrK67x/ou5zovgVSab0aEAweoZKIznyuHGrBvvesnm1
	9BzkX86Q0teBISC4r1wHXQpM53oj3+rco7NJon5zVIEBpwtw+egI/P7askQHnzke
	Gb0ZXnH/UhDLvsAITjDpxMPRY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgD3X6evE_xq9TawGQ--.54072S2;
	Tue, 17 Nov 2026 16:43:29 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: sstabellini@kernel.org,
	linux@armlinux.org.uk,
	jgross@suse.com,
	boris.ostrovsky@oracle.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	oleksandr_tyshchenko@epam.com,
	david.vrabel@citrix.com,
	konrad.wilk@oracle.com
Cc: xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] xen/grant-table: fix resource leak in gnttab_init()
Date: Tue, 17 Nov 2026 16:43:25 +0800
Message-Id: <20261117084325.1241735-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:QCgvCgD3X6evE_xq9TawGQ--.54072S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFy3ZF45uF4kJr1fAry3CFg_yoW5WrWrpa
	9xAryktrWrW347tFWaga4v9FWrCa97G3yIkrWUZwn8Zan7GF93Jr4IqFyjvr4kCrWkAF4S
	y3srKr15Jr48ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziO6pDUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hHKOWr8E7GLtAAA3H

For x86 PV guests, arch_gnttab_init() allocates virtual address areas
and PTE pointer arrays for the shared and status frames. These
resources are not released if the subsequent gnttab_setup() call fails.

Add arch_gnttab_free() and call it on this failure path before the
existing cleanup. Provide an empty implementation for ARM, which
is also used by ARM64.

Fixes: 162e37171276 ("x86/xen: safely map and unmap grant frames when in atomic context")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 arch/arm/xen/grant-table.c | 4 ++++
 arch/x86/xen/grant-table.c | 9 +++++++++
 drivers/xen/grant-table.c  | 5 ++++-
 include/xen/grant_table.h  | 1 +
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/xen/grant-table.c b/arch/arm/xen/grant-table.c
index 91cf08ba1e95..69db80877bb5 100644
--- a/arch/arm/xen/grant-table.c
+++ b/arch/arm/xen/grant-table.c
@@ -56,3 +56,7 @@ int arch_gnttab_init(unsigned long nr_shared, unsigned long nr_status)
 {
 	return 0;
 }
+
+void arch_gnttab_free(void)
+{
+}
diff --git a/arch/x86/xen/grant-table.c b/arch/x86/xen/grant-table.c
index 5f4060b5a40d..0a89e43d804d 100644
--- a/arch/x86/xen/grant-table.c
+++ b/arch/x86/xen/grant-table.c
@@ -149,6 +149,15 @@ int arch_gnttab_init(unsigned long nr_shared, unsigned long nr_status)
 	return -ENOMEM;
 }
 
+void arch_gnttab_free(void)
+{
+	if (!xen_pv_domain())
+		return;
+
+	arch_gnttab_vfree(&gnttab_shared_vm_area);
+	arch_gnttab_vfree(&gnttab_status_vm_area);
+}
+
 #ifdef CONFIG_XEN_PVH
 #include <xen/events.h>
 #include <xen/xen-ops.h>
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 957500dd309a..fc18fe4cf7a3 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1696,7 +1696,7 @@ int gnttab_init(void)
 
 	if (gnttab_setup() < 0) {
 		ret = -ENODEV;
-		goto ini_nomem;
+		goto free_gnttab;
 	}
 
 	gnttab_size = nr_grant_frames * gnttab_interface->grefs_per_grant_frame;
@@ -1707,6 +1707,9 @@ int gnttab_init(void)
 	printk("Grant table initialized\n");
 	return 0;
 
+ free_gnttab:
+	arch_gnttab_free();
+
  ini_nomem:
 	for (i--; i >= 0; i--)
 		free_page((unsigned long)gnttab_list[i]);
diff --git a/include/xen/grant_table.h b/include/xen/grant_table.h
index a33a60a2ea72..a635cadb61f1 100644
--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -203,6 +203,7 @@ gnttab_set_unmap_op(struct gnttab_unmap_grant_ref *unmap, phys_addr_t addr,
 }
 
 int arch_gnttab_init(unsigned long nr_shared, unsigned long nr_status);
+void arch_gnttab_free(void);
 int arch_gnttab_map_shared(xen_pfn_t *frames, unsigned long nr_gframes,
 			   unsigned long max_nr_gframes,
 			   void **__shared);
-- 
2.25.1

