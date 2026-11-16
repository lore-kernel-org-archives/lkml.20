Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801677;
	b=XO42GyLuYs0lcAsCwNAnZ4zJcv1fRdZ23Djxv/GjAj/smr1/uRnKRtY7HyHHCcHtTObW
	 1OHavjh7z1bdouRRsLDTZrbgBa46ufp4YAo0f4Sep89ZgQbCPLbSdSVEWkJP7bFGHT+bj
	 a/DzLovqmFIwKu/9Pe46qr9i6U5vU4XWDIP0ogtq/VSAUvdk/DmD30GvPLkl7PPwDdKCE
	 XHTmWO7xdLzyD4H6oz/hw7DeED8ngZN55tt+c5KPojkEq//7oDIKRq1nbClf9gOR9HjRe
	 2mXh+zHNWZuhJvks9sIxaOfg+1NLuc7QyoaqPHRyNLxpdnucIJHZGLCy3apbhn3Z8Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801677;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=3zzEIuWH3BTJ3SKcROKTSh8kaI38KiN33JBydWfpqTM=;
	b=0KXPMt1yA5e6aCWJ4at0mOUu4z/dMcI6xz8z53M6RmP3PQyqQ1hYlz7ewWLWhyGdRHk2
	 gUdpLSS9vrabjeV03hTXa0HkHhyjgphMgYrmntGVXPRaOinZXbUrXUR+iAJVoM83U3pN7
	 9QW4e8VKwXvmmulb7pmDWOeN7hIVv8FnNNhCOZ6qbKNglL/yG9UCOE3KTJIS1h+Z5Rt8N
	 2eiQE0YGeJU8y6puX+mmL4YfMRNlSi2scTOZ6lnSz349WsTdm9fsHVqCxo8NQTxI7GAhf
	 dvD064TiSPwqu6dMFPf6uT7WCyngAeT1/hSUG1OagkrkKbzDOWzCYJaYYfPrc1cdaTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=sLEpI9Ox;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10AC606A894;
	Mon, 16 Nov 2026 04:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C10AC606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=sLEpI9Ox
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=3zzEIuWH3BTJ3SKcROKTSh8kaI38KiN33J
	BydWfpqTM=; b=sLEpI9Oxlr5qC7AEnow2+ZAAJgtQ4IZ7F7vFqvEDUDaX23a2Wd
	RLB9X7vEKbSdY3vufjKnR+124SfbzfhFO8zwCtOybaSDTKmuTVRxvO5MLTX2YLg9
	6Z7XCgge/gyQ6Qi+jR1N0PA/09qwIyi2005KUdGrDrAeoDz/2naikNPC8=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.186.145])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBH0UXxf_pq+23FAA--.2556S3;
	Mon, 16 Nov 2026 12:00:50 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] init: initrd: add initrd_phys_range()
Date: Mon, 16 Nov 2026 12:00:48 +0800
Message-ID: <20261116040049.434247-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116040049.434247-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261116040049.434247-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBH0UXxf_pq+23FAA--.2556S3
X-Coremail-Antispam: 1UD129KBjvJXoWxury3tryrWryUZr4DWFyxAFb_yoW5CrykpF
	Z3tF45GF4vvFZ7Jay3J3W8uw13Arn3CrySqFy7Gw1kCw15Kr1Iqw18Jrn0yrWDJrW8WFyY
	qF4Yva98ua47AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Jrv_JF4l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4
	vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bF6pPU
	UUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREKB2r2E9lQAwA7sj

Memory handed to the kernel by the device tree (or by module parameters)
is invisible to the firmware that placed the initrd, so nothing prevents
the two from overlapping.  Add a helper that reports the physical range
the initrd occupies, so that a driver owning such an area can refuse to
use memory that currently holds it.

The range is only reported while the initrd exists; after it is freed the
helper returns false, which matches the fact that the memory is free to
reuse at that point.  It must not be marked __init, since a modular
caller may ask long after initmem has been discarded.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 include/linux/initrd.h |  7 +++++++
 init/initramfs.c       | 28 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 7e5d26c813..4acc886607 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -3,6 +3,8 @@
 #ifndef __LINUX_INITRD_H
 #define __LINUX_INITRD_H
 
+#include <linux/types.h>
+
 /* starting block # of image */
 extern int rd_image_start;
 
@@ -19,9 +21,14 @@ extern void free_initrd_mem(unsigned long, unsigned long);
 #ifdef CONFIG_BLK_DEV_INITRD
 extern void __init reserve_initrd_mem(void);
 extern void wait_for_initramfs(void);
+extern bool initrd_phys_range(phys_addr_t *start, phys_addr_t *end);
 #else
 static inline void __init reserve_initrd_mem(void) {}
 static inline void wait_for_initramfs(void) {}
+static inline bool initrd_phys_range(phys_addr_t *start, phys_addr_t *end)
+{
+	return false;
+}
 #endif
 
 extern phys_addr_t phys_initrd_start;
diff --git a/init/initramfs.c b/init/initramfs.c
index ebddde9c8f..63fc0e7a68 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -768,6 +768,34 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 	init_flush_fput();
 }
 
+/**
+ * initrd_phys_range() - physical address range occupied by the initrd
+ * @start: output, first byte of the initrd
+ * @end: output, one past the last byte of the initrd
+ *
+ * Return: %false if there is no initrd (never had one, or it has already
+ * been freed), %true otherwise.
+ *
+ * Used by drivers whose memory is described elsewhere (e.g. a ramoops area
+ * coming from the device tree): such a description only exists in the kernel,
+ * so the boot loader that placed the initrd could not have avoided it, and
+ * the initrd may end up inside that memory.
+ *
+ * The range is only reported for as long as the initrd exists.  This function
+ * must not be marked __init: a modular caller may still ask long after the
+ * initmem has been freed.
+ */
+bool initrd_phys_range(phys_addr_t *start, phys_addr_t *end)
+{
+	if (!initrd_start || initrd_end <= initrd_start)
+		return false;
+
+	*start = __pa(initrd_start);
+	*end = __pa(initrd_end);
+	return true;
+}
+EXPORT_SYMBOL_GPL(initrd_phys_range);
+
 static ASYNC_DOMAIN_EXCLUSIVE(initramfs_domain);
 static async_cookie_t initramfs_cookie;
 
-- 
2.53.0

