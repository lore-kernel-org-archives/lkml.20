Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801677;
	b=zoJMVLwwi7CIWOuXaK3HYMxjYIQEvdayR9i+EVVESmrKhleuv0T/Q43UBKo3ZMM/tgtw
	 xreey4Dt4+6XgSF4atdKo8lXh547xlK31gfylg14BW3vwmLOGEmRU5mHXxGjXzTfBXfXf
	 ze6X6IUpKAY9dF6m8TRJaNSSuzuNJ/kmmSfoAjQhxfagVt26pFfOahsfTgql6+qz+n5I9
	 gsPiVEv43pYTs0evrud8Bzncg8WA3gkYl8aVj7wzVGlCwdnv6b6Uhapql1AMfmkleAVOe
	 JZEmwAJHbdfWVDPE8EkfImTdGmZ4PQ23OEOseu97fJLKsme7nZcAOC0IPxnIxcBvs5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801677;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ZCLLQze8/fQ3hRPX3SFJuREFu7qydTYxhjlsyvRamcs=;
	b=5RuQ2GhI/EZAxx8cIT7OA/ApPOiGAKzLZmoOw2mGltAqYdueU8UvvEHwkuZlM1tfv04A
	 6fB3/Lze7v6VG27quJTk0xi/L6rzdoEoKU60+7EDb1DHTFVwVQZhDMCe77k5mjh2NE5O6
	 Lt238dEtVldsld9pzeM/t1s1lSQg4HCVHiTmiOXcMm2KGW6Xm3Jy/yZ9ZZrcRwCHSd5vi
	 Qb4whDnZY+mf0ufHqqyeCV2JVz7iGtNxoRoQIAgX8o2RGfUfvX0Hg8Tr8cfxyK7MOKtHt
	 9JCR44kYeOTsqkCFrqkrRXUnXBRRUFNeoEkiZLl3tb2cAm6NLFbOmv89JpsavRdT1NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=gwA7i1ey;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1207606A896;
	Mon, 16 Nov 2026 04:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1207606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=gwA7i1ey
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=ZCLLQze8/fQ3hRPX3SFJuREFu7qydTYxhj
	lsyvRamcs=; b=gwA7i1eyGsb7i2YKDS0KQd5jPt+tirmiNSAlf5i9he769GsQn8
	YjLrqA26pbQvHkgDb9Lcw7P3eT6GHhtFkALAC2Xrafil/wtt+WJQ/YQg6zNICokO
	MkpI0hdB511xUKOD5VJnw9Pw/Ei2BejWBWpt6dsvvZS8qdEiVUNIMi68k=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.186.145])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBH0UXxf_pq+23FAA--.2556S4;
	Mon, 16 Nov 2026 12:00:50 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] pstore/ram: skip zones overlapping the initrd
Date: Mon, 16 Nov 2026 12:00:49 +0800
Message-ID: <20261116040049.434247-3-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBH0UXxf_pq+23FAA--.2556S4
X-Coremail-Antispam: 1UD129KBjvJXoWxKF4kGF4DKw1xXw13Jr43Jrb_yoWxAw4fpr
	ZrAas5J39YqFWrJF43urnrWa1Yya1rJw18tryUG3s2vwn09r1fZ342y343AayktrZ5G3WY
	qFZ8J34fCF13JrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4
	vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUk18B
	DUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREKB2r2E9lQAwA8sk

The areas described in the device tree only exist in the kernel, so the
firmware placing the initrd cannot avoid them and the initrd may end up
inside one of them.  When that happens, registering the overlapping zone
silently corrupts the initrd: the console zone in particular is written
continuously once it is registered as a printk console, so the initrd is
destroyed within milliseconds of the zone being set up, and the boot
fails with "Initramfs unpacking failed: invalid magic at start of
compressed archive".

Refuse to register any zone that overlaps the initrd and log which one
was dropped.  The dropped zone is not used for this boot only; the initrd
is freed later, and nothing stops the memory from being used afterwards.

This can only detect the overlap while the initrd still exists.  The
built-in driver probes at postcore_initcall(), well before the initramfs
is unpacked, so the check covers the normal case; a module loaded later
cannot see the initrd and gets no protection.

Report the zone sizes from the effective context, not from the parsed
data, so /sys/module/ramoops/parameters/ describes what was registered.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 fs/pstore/ram.c | 114 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 90 insertions(+), 24 deletions(-)

diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index aa056d0395..250d7d02ba 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -21,6 +21,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/mm.h>
+#include <linux/initrd.h>
 
 #include "internal.h"
 #include "ram_internal.h"
@@ -720,6 +721,41 @@ static int ramoops_parse_dt(struct platform_device *pdev,
 	return 0;
 }
 
+/*
+ * The area described in the device tree (or in the module parameters) can be
+ * occupied by the initrd: the firmware that placed the initrd there cannot
+ * know about a reservation that only exists in the device tree, so it is free
+ * to hand out those pages to the boot loader for the initrd buffer.
+ *
+ * Writing to such a zone silently corrupts the initrd (the console zone in
+ * particular is written continuously once it is registered as a printk
+ * console), so refuse to use any zone that overlaps it.  The initrd is freed
+ * later during boot, so a zone skipped here stays unused for this boot only.
+ *
+ * This can only see an overlap while the initrd is still around, because the
+ * ranges are forgotten once it is freed.  The built-in driver probes at
+ * postcore_initcall(), long before the initramfs is unpacked, so the check is
+ * reliable there.  A module (or a probe deferred past the unpack) cannot tell
+ * and gets no protection.
+ */
+static bool ramoops_skip_zone(struct device *dev, const char *name,
+			      phys_addr_t start, size_t size)
+{
+	phys_addr_t istart, iend;
+
+	if (!size || !initrd_phys_range(&istart, &iend))
+		return false;
+
+	if (start >= iend || istart >= start + size)
+		return false;
+
+	dev_warn(dev, "ignoring %s zone 0x%llx-0x%llx: it overlaps the initrd (0x%llx-0x%llx)\n",
+		 name, (unsigned long long)start,
+		 (unsigned long long)(start + size - 1),
+		 (unsigned long long)istart, (unsigned long long)(iend - 1));
+	return true;
+}
+
 static int ramoops_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -786,32 +822,60 @@ static int ramoops_probe(struct platform_device *pdev)
 
 	dump_mem_sz = cxt->size - cxt->console_size - cxt->ftrace_size
 			- cxt->pmsg_size;
-	err = ramoops_init_przs("dmesg", dev, cxt, &cxt->dprzs, &paddr,
-				dump_mem_sz, cxt->record_size,
-				&cxt->max_dump_cnt, 0, 0);
-	if (err)
-		goto fail_init;
+	if (ramoops_skip_zone(dev, "dmesg", paddr, dump_mem_sz)) {
+		cxt->record_size = 0;
+		paddr += dump_mem_sz;
+	} else {
+		err = ramoops_init_przs("dmesg", dev, cxt, &cxt->dprzs, &paddr,
+					dump_mem_sz, cxt->record_size,
+					&cxt->max_dump_cnt, 0, 0);
+		if (err)
+			goto fail_init;
+	}
 
-	err = ramoops_init_prz("console", dev, cxt, &cxt->cprz, &paddr,
-			       cxt->console_size, 0);
-	if (err)
-		goto fail_init;
+	if (ramoops_skip_zone(dev, "console", paddr, cxt->console_size)) {
+		paddr += cxt->console_size;
+		cxt->console_size = 0;
+	} else {
+		err = ramoops_init_prz("console", dev, cxt, &cxt->cprz, &paddr,
+				       cxt->console_size, 0);
+		if (err)
+			goto fail_init;
+	}
 
-	err = ramoops_init_prz("pmsg", dev, cxt, &cxt->mprz, &paddr,
-				cxt->pmsg_size, 0);
-	if (err)
-		goto fail_init;
+	if (ramoops_skip_zone(dev, "pmsg", paddr, cxt->pmsg_size)) {
+		paddr += cxt->pmsg_size;
+		cxt->pmsg_size = 0;
+	} else {
+		err = ramoops_init_prz("pmsg", dev, cxt, &cxt->mprz, &paddr,
+					cxt->pmsg_size, 0);
+		if (err)
+			goto fail_init;
+	}
 
 	cxt->max_ftrace_cnt = (cxt->flags & RAMOOPS_FLAG_FTRACE_PER_CPU)
 				? nr_cpu_ids
 				: 1;
-	err = ramoops_init_przs("ftrace", dev, cxt, &cxt->fprzs, &paddr,
-				cxt->ftrace_size, -1,
-				&cxt->max_ftrace_cnt, LINUX_VERSION_CODE,
-				(cxt->flags & RAMOOPS_FLAG_FTRACE_PER_CPU)
-					? PRZ_FLAG_NO_LOCK : 0);
-	if (err)
+	if (ramoops_skip_zone(dev, "ftrace", paddr, cxt->ftrace_size)) {
+		paddr += cxt->ftrace_size;
+		cxt->ftrace_size = 0;
+		cxt->max_ftrace_cnt = 0;
+	} else {
+		err = ramoops_init_przs("ftrace", dev, cxt, &cxt->fprzs, &paddr,
+					cxt->ftrace_size, -1,
+					&cxt->max_ftrace_cnt, LINUX_VERSION_CODE,
+					(cxt->flags & RAMOOPS_FLAG_FTRACE_PER_CPU)
+						? PRZ_FLAG_NO_LOCK : 0);
+		if (err)
+			goto fail_init;
+	}
+
+	if (!cxt->record_size && !cxt->console_size &&
+	    !cxt->pmsg_size && !cxt->ftrace_size) {
+		dev_err(dev, "every zone overlaps the initrd; ramoops disabled for this boot\n");
+		err = -ENODEV;
 		goto fail_init;
+	}
 
 	cxt->pstore.data = cxt;
 	/*
@@ -855,15 +919,17 @@ static int ramoops_probe(struct platform_device *pdev)
 
 	/*
 	 * Update the module parameter variables as well so they are visible
-	 * through /sys/module/ramoops/parameters/
+	 * through /sys/module/ramoops/parameters/.  The zone sizes come from
+	 * cxt, not pdata: a zone that was dropped above is reported as 0, so
+	 * the parameters describe what is actually registered.
 	 */
 	mem_size = pdata->mem_size;
 	mem_address = pdata->mem_address;
-	record_size = pdata->record_size;
+	record_size = cxt->record_size;
 	ramoops_max_reason = pdata->max_reason;
-	ramoops_console_size = pdata->console_size;
-	ramoops_pmsg_size = pdata->pmsg_size;
-	ramoops_ftrace_size = pdata->ftrace_size;
+	ramoops_console_size = cxt->console_size;
+	ramoops_pmsg_size = cxt->pmsg_size;
+	ramoops_ftrace_size = cxt->ftrace_size;
 	mem_type = pdata->mem_type;
 	ramoops_ecc = pdata->ecc_info.ecc_size;
 
-- 
2.53.0

