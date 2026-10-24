Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792828749;
	b=caPZ8Q8NebuXq3/kfnzeN5MpBepDPyi2FSkX5xfqN2Xlgt4Ni86Ysc4fqwT5iZMPLVzO
	 bNxIJLiq+AJvGnXVRbI7WUN4JAciZcwJ0aJlGgxQLhD+N6QrMZpa9SloscZl+iBBjzzFL
	 cpQLRpjWMACFCEtbaXR2+Ysuq5YS1CAojXaQlvmWoDjzIxuSYCDSBPAIkc5UeVGM6MQTG
	 Slo3KDJdMBGHKmuN569Pb/G8UZbkkXyu6JBfoHf9K7dfXVf4YDO4V4APyPNLjcvU+JtQ9
	 0YyxIvaGxB/kS93fLIyf82icEeX3tKQ+S5DvU6rj0+VpKsEwURC6mLtaOAYxSYhi55Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792828749;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=OS07joxRVIHTq4fBRVjBEm+fhLEIDQPx3a4oSl1o2+A=;
	b=D1+HN3pIWv40pOsI5JrEw/ueWY5iqOma6CbFpYboEVtL76tejI17StPfsG0Ze7c47L5v
	 im4VuVEDoxO8SjIYAuePvE1+0Vj0u7E5gbAcwW/z7pDg1UIeM+fvxBNiuOqjIuhaSvbF6
	 roiW7FSPWLJU02tU3qdOF/vA2zMW+1Erup+8qB+66ncsbtMtkVA/NtNYKaYqa4iI84Mas
	 M6UHPRU5ePUBMsAnitOYli5tmGwQaSJV1EM3bWbgmZjYgsgwcC8+A1ccdKHOCp7KEj0mr
	 rmnbJ3+5JzJsVAlqBBUUTiCuxpF3e1cdPpPaF8ROFMtSO27p5NPFgcTsM3wMcazFmKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Rv4LVBZl;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38A6606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B38A6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Rv4LVBZl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=OS07joxRVI
	HTq4fBRVjBEm+fhLEIDQPx3a4oSl1o2+A=; b=Rv4LVBZlXfVRJt2LoPFN1cGqYD
	zaqfJPFf/gWY9okA08NQIwBvoKh7lleN8pXQqIdyDpeiCsIU3Y9irIn4S8GDbKCJ
	qkKSBkdCZHtBLUNtuZ++ltU/ZCdPSEaK3BmLYc5vIIysvGNoGlM06/CZb+k5pBYl
	vxx2o15zSExDj/0Bg=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.190.60])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBXzjJAZdxqLJM6AA--.446S2;
	Sat, 24 Oct 2026 15:58:56 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
Subject: [PATCH] irqchip/gic-v3-its: Claim LPI tables inherited across kexec on DT
Date: Sat, 24 Oct 2026 15:58:56 +0800
Message-ID: <20261024075856.835932-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgBXzjJAZdxqLJM6AA--.446S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw4DWw1xAw1rWrW5Cw4fuFg_yoW7AryDpF
	4xKrWjyFs5Ga4FkrZxJr1Uu3WFyFWftFWUG3s7K342v3W5Wr9avr1xJryYqFyxJrZ3G345
	XF4Y9Fy8uF4UuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JU3R6wUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREKB2rbtdUUMQAmsP

From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

When a kernel is kexec'd into while LPIs are enabled, the incoming kernel
finds GICR_CTLR.EnableLPIs set and tries to re-initialise the LPI tables
from scratch.  That requires disabling LPIs first, which is not always
possible: on some implementations (e.g. Qualcomm SM8750) the EnableLPIs
bit is RES1 once set, the write to clear it is ignored, and
redist_disable_lpis() returns -EBUSY.  its_cpu_init() then bails out
early, LPIs are never reprogrammed, and every MSI command queued against
the ITS waits for its completion timeout: measured 99 timeouts of about
1.25 s each, pushing /init out from 1.3 s to 126 s.

The tables themselves are still intact and usable, and the driver already
has a path for that (RDIST_FLAGS_RD_TABLES_PREALLOCATED), but it is gated
on the tables being reserved memory.  On an EFI boot the outgoing kernel
records a persistent reservation; on a DT boot nothing does.  Adding a
memreserve entry is not an option either: the flattened DTB handed over by
the bootloader has no space left for a new one (-FDT_ERR_NOSPACE), and
kexec clones that blob when the image is loaded, long before the jump.

So claim the inherited tables in the incoming kernel instead: reserve the
property table while LPIs are being probed (memblock still owns the pages,
well before memblock_free_all()), and the per-CPU pending tables when the
preallocated path is taken.  The preallocated path is then selected
normally and the ITS keeps working across the handoff.

Measured on SM8750, kexec into the same image with a disk root:

  before: 99 x "ITS queue timeout", 8 x "Failed to disable LPIs",
          /init at 126.35 s
  after:   0 x "ITS queue timeout", 0 x "Failed to disable LPIs",
          /init at   1.31 s

Behaviour on a normal cold boot is unchanged: enabled_lpis_allowed() is
only consulted when LPIs are already enabled on entry, and the
preallocated path is only taken when that flag ends up set.

Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/irqchip/irq-gic-v3-its.c | 46 +++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 6f5811aae5..6dcd903e9f 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2280,7 +2280,7 @@ static void its_free_prop_table(struct page *prop_page)
 	its_free_pages(page_address(prop_page), get_order(LPI_PROPBASE_SZ));
 }
 
-static bool gic_check_reserved_range(phys_addr_t addr, unsigned long size)
+static bool gic_range_is_reserved(phys_addr_t addr, unsigned long size)
 {
 	phys_addr_t start, end, addr_end;
 	u64 i;
@@ -2300,13 +2300,27 @@ static bool gic_check_reserved_range(phys_addr_t addr, unsigned long size)
 			return true;
 	}
 
-	/* Not found, not a good sign... */
-	pr_warn("GICv3: Expected reserved range [%pa:%pa], not found\n",
-		&addr, &addr_end);
-	add_taint(TAINT_CRAP, LOCKDEP_STILL_OK);
 	return false;
 }
 
+/*
+ * LPIs are already enabled but the tables we were handed are not reserved
+ * memory.  On a DT boot there is no EFI persistent reservation and the
+ * flattened DTB has no room left for a memreserve entry, so the kernel we came
+ * from (kexec) had no way to hand them over as reserved.  Starting from scratch
+ * is not an option either: PROPBASER/PENDBASER may only be reprogrammed with
+ * LPIs disabled, and on some implementations the EnableLPIs bit reads as RES1
+ * once set.  So keep the inherited tables and claim them before memblock hands
+ * the pages over to the buddy allocator.
+ */
+static bool gic_claim_inherited_lpi_table(phys_addr_t addr, unsigned long size)
+{
+	if (gic_range_is_reserved(addr, size))
+		return true;
+
+	return !memblock_reserve(addr, size);
+}
+
 static int gic_reserve_range(phys_addr_t addr, unsigned long size)
 {
 	if (efi_enabled(EFI_CONFIG_TABLES))
@@ -3067,7 +3081,15 @@ static bool enabled_lpis_allowed(void)
 	val = gicr_read_propbaser(gic_data_rdist_rd_base() + GICR_PROPBASER);
 	addr = val & GENMASK_ULL(51, 12);
 
-	return gic_check_reserved_range(addr, LPI_PROPBASE_SZ);
+	if (!gic_claim_inherited_lpi_table(addr, LPI_PROPBASE_SZ)) {
+		pr_warn("GICv3: inherited LPI property table @%pa is neither reserved nor claimable\n",
+			&addr);
+		add_taint(TAINT_CRAP, LOCKDEP_STILL_OK);
+		return false;
+	}
+
+	pr_info_once("GICv3: claiming inherited LPI property table @%pa\n", &addr);
+	return true;
 }
 
 static int __init allocate_lpi_tables(void)
@@ -3175,7 +3197,17 @@ static void its_cpu_init_lpis(void)
 		paddr = gicr_read_pendbaser(rbase + GICR_PENDBASER);
 		paddr &= GENMASK_ULL(51, 16);
 
-		WARN_ON(!gic_check_reserved_range(paddr, LPI_PENDBASE_SZ));
+		/*
+		 * Same as the property table: keep the inherited pending table
+		 * rather than handing the ITS a range the allocator may reuse.
+		 */
+		if (!gic_claim_inherited_lpi_table(paddr, LPI_PENDBASE_SZ)) {
+			pr_warn_once("GICv3: inherited LPI pending table @%pa is neither reserved nor claimable\n",
+				     &paddr);
+			add_taint(TAINT_CRAP, LOCKDEP_STILL_OK);
+		} else {
+			pr_info_once("GICv3: claiming inherited LPI pending tables\n");
+		}
 		gic_data_rdist()->flags |= RD_LOCAL_PENDTABLE_PREALLOCATED;
 
 		goto out;
-- 
2.53.0

