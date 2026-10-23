Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.162.73.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792779327;
	b=mH3svzK5ddurEbD3xtdf3wJUNCADqJoeO0g1//H6HHrUb3T/d1oDfYwSR1bw7kkTTLBO
	 /ftSSi3bM9RkUfex71tvCgdmEKDHyF3iK3nysTucxq55SsssGzPKtcXoAkDlvpsJSslN/
	 yUOlcYt+blOlvcT/m5erdYdFSxyNkoJx3sU/kfEAGeTWg8ORGG0emlOVhjIo73dYDwcP3
	 ngb82eBD4D55tst+w8SaK0FOjGYbs8C0qwhsNpm2OMpEUG99AaKnn1t07U95Pa6GXgApY
	 h8xOELAsA/Kkq5/TC6vRzxK3OwJz9blSOJ+vsTcXvvu/16jQHKlQA7APRbrSBsJrxOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779327;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=yn7b/s/X33OQkUvKI/RdgThC8jj0fEtJbA79eYM22w8=;
	b=P9dxaKoUKFv0PgPjb8z05auBhSa/trgLEbkmHP8vd47TCR1nXugIRqZLvZ600strx1zJ
	 NSZ6JuhdnnxDQhcqCE5U4ek66mIEORG5RehuPEKdZsBIcsYnU2tbr/PqmIz3va14mvfyZ
	 atgonFsm+kikRbKQsIC5ShFRrULsMWthhrU2Tnf/qbQtQfsS1JRry2nMPC6+zXC/7OPam
	 U1RU3aFANRV1dj7EybIH3cralAph1ks9Rr3xNMjpTr7xBZR9ZwY/xl0bkiEhUptGkanyY
	 tw1F699kEBh9poDhY6LlKPnrLnk9czPfoQbapORFwOD4DKkKUZetcOp6Xv49lrredzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=WFhRz2hu;
	arc=none smtp.remote-ip=35.162.73.231
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A783606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A783606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=WFhRz2hu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1792779327; x=1824315327;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yn7b/s/X33OQkUvKI/RdgThC8jj0fEtJbA79eYM22w8=;
  b=WFhRz2huXV9BhFZ8IedTYeeoRe31KKE8qZF4qJ+0Q14W5YYSMZkFeMIm
   rOa9z62N05a163dfj+GGUiGe5W14vXP6bV7Kab62cWtBN0g2BoBFYlpEo
   1uSWMGRR3BWYUg2iuSORpvAn74HBZcsEVD6Pi2ppE2V49zPsDJR3ksQMK
   6hCy7LjF0+Zj0jO/XRP85WeXyhZEfU9I2Pn7WZ882H9aNHJBmFIy4+h/Q
   jSDoTQsEW2iVk4J7270jwOw/j9H5bJHi+3qNSpdCAWUZiCv/gpJBc6PCD
   eCEfCGrLHO5Quu43lL6hNOpDGWcK65c+Vs4TtS0gSwjqwGsZy+3pOp9w4
   g==;
X-CSE-ConnectionGUID: UQ2rdduSRLeMXMMfylYGJQ==
X-CSE-MsgGUID: rKF/SIRtS16Az6WN+X/gGg==
X-IronPort-AV: E=Sophos;i="6.27,174,1787011200"; 
   d="scan'208";a="31896927"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 18:15:24 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:24933]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.97:2525] with esmtp (Farcaster)
 id 71a19e4f-90d3-4fa2-a208-89a28515b958; Fri, 23 Oct 2026 18:15:24 +0000 (UTC)
X-Farcaster-Flow-ID: 71a19e4f-90d3-4fa2-a208-89a28515b958
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Fri, 23 Oct 2026 18:15:23 +0000
Received: from dev-dsk-machaujo-1c-d6b511e2.eu-west-1.amazon.com
 (10.253.100.8) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Fri, 23 Oct 2026
 18:15:21 +0000
From: Joshua Machauer <machaujo@amazon.de>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>, Joshua Machauer
	<machaujo@amazon.com>
Subject: [PATCH] irqchip/gic-v3: Remember each CPU's redistributor from the init walk
Date: Fri, 23 Oct 2026 18:15:10 +0000
Message-ID: <20261023181510.50634-1-machaujo@amazon.de>
X-Mailer: git-send-email 2.47.3
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

From: Joshua Machauer <machaujo@amazon.com>

On systems that give every CPU its own redistributor frame, a CPU coming
online finds its frame by walking the frames from the first one until
GICR_TYPER matches its affinity. CPU n therefore performs O(n) MMIO
reads, and bringing up N CPUs costs O(N^2). Secondary CPUs boot
serially, so all of it adds to boot time.

gic_update_rdist_properties() already walks every frame once at boot.
Record each possible CPU's frame there and have gic_populate_rdist() try
it first, so bringing a CPU online costs one MMIO read. A CPU without a
recorded frame, such as an ACPI online-capable CPU absent at init, still
scans.

Recording compares each frame's affinity against that of every possible
CPU. That is still O(N^2) work at init, but it reads cpu_logical_map[],
which stays in the cache, instead of device memory.

The frame is kept apart from rd_base, which
inherit_vpe_l1_table_from_rd() reads as "this CPU has booted".

NVIDIA Vera, 352 CPUs in two redistributor regions, 69 ms faster.
Without this patch:

  [    0.007006] GICv3: CPU1: found redistributor 20000 region 0:0x0000fe0040180000
  [    0.463026] GICv3: CPU351: found redistributor 100610001 region 1:0x0000fe4043140000

With it:

  [    0.007794] GICv3: CPU1: found redistributor 20000 region 0:0x0000fe0040180000
  [    0.394395] GICv3: CPU351: found redistributor 100610001 region 1:0x0000fe4043140000

KVM guest with 352 vCPUs on that Vera system, where every GICR_TYPER
read traps to the hypervisor, 139 ms faster. Without this patch:

  [    0.023231] GICv3: CPU1: found redistributor 100 region 0:0x0000000010240000
  [    0.432895] GICv3: CPU351: found redistributor 15701 region 0:0x0000000012de0000

With it:

  [    0.023456] GICv3: CPU1: found redistributor 100 region 0:0x0000000010240000
  [    0.293807] GICv3: CPU351: found redistributor 15701 region 0:0x0000000012de0000

Graviton4, 192 CPUs with one redistributor region each, 5.6 ms faster.
Without this patch:

  [    0.009300] GICv3: CPU1: found redistributor 10000 region 1:0x000000b8fc1c0000
  [    0.091853] GICv3: CPU191: found redistributor 1005f0000 region 191:0x000004b8fd940000

With it:

  [    0.009343] GICv3: CPU1: found redistributor 10000 region 1:0x000000b8fc1c0000
  [    0.086299] GICv3: CPU191: found redistributor 1005f0000 region 191:0x000004b8fd940000

KVM guest with 192 vCPUs on that Graviton4 system, 33 ms faster.
Without this patch:

  [    0.008751] GICv3: CPU1: found redistributor 1 region 0:0x0000000010220000
  [    0.115862] GICv3: CPU191: found redistributor 1050f region 0:0x00000000119e0000

With it:

  [    0.009036] GICv3: CPU1: found redistributor 1 region 0:0x0000000010220000
  [    0.082898] GICv3: CPU191: found redistributor 1050f region 0:0x00000000119e0000

Assisted-by: LLM
Signed-off-by: Joshua Machauer <machaujo@amazon.de>
---
 drivers/irqchip/irq-gic-v3.c | 66 ++++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..8f1007facda9 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1017,25 +1017,43 @@ static int gic_iterate_rdists(int (*fn)(struct redist_region *, void __iomem *))
 	return ret ? -ENODEV : 0;
 }
 
+/*
+ * Convert a CPU's affinity to a 32bit value that can be matched to
+ * GICR_TYPER bits [63:32].
+ */
+static u32 gic_cpu_to_rdist_aff(int cpu)
+{
+	u64 mpidr = gic_cpu_to_affinity(cpu);
+
+	return (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 24 |
+		MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
+		MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8 |
+		MPIDR_AFFINITY_LEVEL(mpidr, 0));
+}
+
+/*
+ * The redistributor frame of each possible CPU, as found by the walk in
+ * gic_update_rdist_properties(). A CPU coming up checks this frame first
+ * instead of scanning every frame from the start, which on a system with
+ * one redistributor per CPU makes bringing up N CPUs cost O(N^2) MMIO
+ * reads.
+ */
+struct gic_rdist_frame {
+	struct redist_region	*region;
+	void __iomem		*ptr;
+};
+
+static DEFINE_PER_CPU(struct gic_rdist_frame, gic_rdist_frame);
+
 static int __gic_populate_rdist(struct redist_region *region, void __iomem *ptr)
 {
 	unsigned long mpidr;
 	u64 typer;
-	u32 aff;
 
-	/*
-	 * Convert affinity to a 32bit value that can be matched to
-	 * GICR_TYPER bits [63:32].
-	 */
 	mpidr = gic_cpu_to_affinity(smp_processor_id());
 
-	aff = (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 24 |
-	       MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
-	       MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8 |
-	       MPIDR_AFFINITY_LEVEL(mpidr, 0));
-
 	typer = gic_read_typer(ptr + GICR_TYPER);
-	if ((typer >> 32) == aff) {
+	if ((typer >> 32) == gic_cpu_to_rdist_aff(smp_processor_id())) {
 		u64 offset = ptr - region->redist_base;
 		raw_spin_lock_init(&gic_data_rdist()->rd_lock);
 		gic_data_rdist_rd_base() = ptr;
@@ -1054,6 +1072,16 @@ static int __gic_populate_rdist(struct redist_region *region, void __iomem *ptr)
 
 static int gic_populate_rdist(void)
 {
+	struct gic_rdist_frame *frame = this_cpu_ptr(&gic_rdist_frame);
+
+	/*
+	 * A CPU that was not present when the frames were walked, such as an
+	 * ACPI online-capable CPU added later, has no recorded frame and falls
+	 * back to the scan.
+	 */
+	if (frame->ptr && !__gic_populate_rdist(frame->region, frame->ptr))
+		return 0;
+
 	if (gic_iterate_rdists(__gic_populate_rdist) == 0)
 		return 0;
 
@@ -1064,12 +1092,28 @@ static int gic_populate_rdist(void)
 	return -ENODEV;
 }
 
+static void gic_record_rdist_frame(struct redist_region *region,
+				   void __iomem *ptr, u64 typer)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		if (gic_cpu_to_rdist_aff(cpu) == (typer >> 32)) {
+			per_cpu(gic_rdist_frame, cpu).region = region;
+			per_cpu(gic_rdist_frame, cpu).ptr = ptr;
+			return;
+		}
+	}
+}
+
 static int __gic_update_rdist_properties(struct redist_region *region,
 					 void __iomem *ptr)
 {
 	u64 typer = gic_read_typer(ptr + GICR_TYPER);
 	u32 ctlr = readl_relaxed(ptr + GICR_CTLR);
 
+	gic_record_rdist_frame(region, ptr, typer);
+
 	/* Boot-time cleanup */
 	if ((typer & GICR_TYPER_VLPIS) && (typer & GICR_TYPER_RVPEID)) {
 		u64 val;
-- 
2.47.3

