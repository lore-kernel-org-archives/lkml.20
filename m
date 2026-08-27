Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2439448F833
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847895; cv=none; b=GIlea0XcGLoP8+vfFnTrWqCNlLdwTkq2xXMagP5b5BARK3BAeerUwBdNZJxc3RlN5Gjl4pYsk2qaqldbb1+pu48at+3gUm7EtjQ66oHe39rMDnWNIo5Ai9IVR9seok5Z+nTnvjcVP96PVJDognbHIykdV54wy+blGlMgm9u1RWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847895; c=relaxed/simple;
	bh=VA2qbvtc9D3WAUublEK754KUy3iM7l5IKInc4JhiwpI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKom9/H2uOxsp5QxBReACk/lbeDIZJUqc4LXgXVfLoMdvcIIIOdqpoxpzKsK6owrRKl46Xyox5d9Ah4ByrJET3xOTEpuJnXVB/SSw6ybd3CZOUGLDIokmKCVZetp0B1qPLgOlte+iWLm/uNb9OSzuC73KLjsgYK0uuLEA4RXGkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=2TvuhQxU; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="2TvuhQxU"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5euHgUF21bp60qTQigBwKjH4x6Qvg0qe8ONZJ9cd938=;
	b=2TvuhQxUFr+fy+TYSZfwfzt2uKWRPMUlYGvkIcqkpSYVM6SYMIi2cNT3oGpFWAEDEkYLVmcp3
	27DLLJT6/TOlAQbpxu6X1KM8Trmh2Y7QCzb+ecElRL9a3atlGgKwmDr08QkmlRpPCcLbQ5ati4P
	s1CxhEaZ6wolohHl03XhMkk=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KG1l3lzHnH3h;
	Fri, 28 Aug 2026 00:24:02 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 4117C40570;
	Fri, 28 Aug 2026 00:24:38 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:37 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 16/18] arm64: add kernel modules text and rodata replication support
Date: Fri, 28 Aug 2026 00:11:56 +0800
Message-ID: <20260827161158.3618409-17-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
Reply-To: <artem.kuzin@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)

Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 arch/arm64/kernel/module.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 24adb581af0e..61f605f74d86 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -18,6 +18,7 @@
 #include <linux/moduleloader.h>
 #include <linux/random.h>
 #include <linux/scs.h>
+#include <linux/vmalloc.h>
 
 #include <asm/alternative.h>
 #include <asm/insn.h>
@@ -25,6 +26,16 @@
 #include <asm/sections.h>
 #include <asm/text-patching.h>
 
+#ifdef CONFIG_KERNEL_REPLICATION
+void module_replicate(void *ptr)
+{
+	gfp_t gfp_mask = GFP_KERNEL;
+
+	__vmalloc_node_replicate_range(ptr, gfp_mask,
+			PAGE_KERNEL, 0);
+}
+#endif /*CONFIG_KERNEL_REPLICATION*/
+
 enum aarch64_reloc_op {
 	RELOC_OP_NONE,
 	RELOC_OP_ABS,
-- 
2.34.1

