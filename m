Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624581;
	b=lUxi+CfLzRJ9CfrmSS7yRkbnSOJnJF5Q2j2HaXl9zcu/3AnpX29d970b1PvutTMnW7qb
	 6H5SPtk4THjrFpKyhfVKlCp45QKvOj5kWGG7LBq4NAm41YhmGFhJM4yNyiU/KhnamGPPN
	 6jE2NiW3px4HVxFPJFpkNB4UtpC5JHCmGfxFnvs3iUJpDzL//JKABIYlIT2v2jyHsxFMJ
	 fivWn2sPLSU/eULRQXJFKRKIEYdBYozX1+ISSeDAi2xWav/voQ9IGwCLUEO8VZx9+AKxx
	 ovfkEL5K9ZtgG37OX6ZIitxp/vQEmP8X993uZD8D5kqaLy431f7nvY/+s+B+yV+O4kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624581;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+pIv6wjn417Lc1ZszwTiovYpOvOckM2NKeY/+3OgEm8=;
	b=ddJttwAKD0j+to0w3QFdD5jG893pkxuFRtJpeacYTRaRPRtvZSXvEZBeC7nSKITnkXRM
	 ygaNWjPsehE5BXUxnSv+t8SdJcwPbtv82GaGv0hWdrru0GWr/2FzaT4I+JLe+W8IZQ5yh
	 14x3UjazlR+MBLwbGcV3C/HjrbqBQRLctfL4pJot1/Hoh4WFzQB0U4LV2vxkZyMQHm4aF
	 E5gXOsS2jRJjzYpOyOUJxgsvCF/naU1I/qgAnu3gTMFhN4PiyYRWWv0jK3bqJfONqnaS7
	 entHqCCprY+KFUSkt5cBKm4Py9Bz1YErv8i5TEZSdrcnvYp6c6eKeBQhKL8lzXCyz5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NZDq62c0;
	arc=none smtp.remote-ip=91.218.175.50
Received: from mta0.migadu.com (out-50.mta0.migadu.com [91.218.175.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E608E60A3807
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E608E60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NZDq62c0
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/8RQlGL7S51abmCsgp54sGU4Y3Ih0i3i5zQLReON33Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793624578; v=1; x=1794229378;
 b=NZDq62c0ML0Ba2M6WGoE6P/4Z8AhP/KH5Ib9tXqPbNCDeayP0CU56aEgB307w1325EhL8alZ
 33zLNrRUHq1p18YNqFpczKVGzjdEdwcEo7ONkLDKoRt5ldp9LUVtVyn3nzrndr4MRPKn3+UcvA1
 x1wTgsVGLnoA7OiWoHtpoYc0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eeae1e8e6abcf74b;
	Mon, 02 Nov 2026 13:02:58 +0000
X-Mizu-Trace-ID: eeae1e8e6abcf74b
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/13] KVM: arm64: Take the ITT for the lifetime of a device mapping
Date: Mon,  2 Nov 2026 13:01:31 +0000
Message-ID: <20261102130133.3684226-12-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102130133.3684226-1-fuad.tabba@linux.dev>
References: <20261102130133.3684226-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Once a device is mapped, the ITS writes its ITT on every MAPTI and reads
it on every translation, indexing the collection and vPE tables with
whatever ICID and vPEID the ITE holds (IHI 0069H.b B.7). As "The format
of the ITT entries is IMPLEMENTATION DEFINED" (5.3.10), the hypervisor
can't check an ITT the host can write.

On a MAPD with V == 1, the hypervisor takes the ITT's pages and zeroes
them before forwarding the command, and rejects the MAPD if the DeviceID
is already mapped, the ITT isn't page-aligned or Size exceeds
GITS_TYPER.ID_bits. It sizes the ITT from the MAPD's Size and
GITS_TYPER.ITT_entry_size, except on QDF2400 rev 1, whose ITS writes
16-byte entries whatever ITT_entry_size holds (erratum 0065). The ITTs
of the devices mapped before the takeover, which the driver lists, are
taken as they stand.

A MAPD with V == 0 gives the pages back once the hypervisor has seen the
ITS consume it, on a GITS_CREADR read or a GITS_CWRITER or GITS_CTLR
write. The driver's unmap polls GITS_CREADR before freeing the ITT, so
the pages are back by then, unless the poll times out on a stalled ITS.
The host's next access to the pages it freed then aborts.

A GITS_CBASER write resets the queue, so it now aborts until the ITS has
consumed every forwarded command, as a dropped MAPD would leave a device
tracked that the ITS never mapped. The driver writes GITS_CBASER only on
resume, after its waits, so a resume aborts only if a wait timed out
before suspend.

The hypervisor tracks a fixed number of devices per ITS and returns that
number from the setup call. its_create_device() fails a device past it
rather than queue a MAPD the hypervisor would reject.

Co-developed-by: Sebastian Ene <sebastianene@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
Co-developed-by: Bartłomiej Grzesik <bgrzesik@google.com>
Signed-off-by: Bartłomiej Grzesik <bgrzesik@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes since v2 (the ITT half of v2 patch 08):
    - The ITT is donated to the hypervisor on a MAPD, zeroed and
      cleaned, and given back after the unmap (was shared and pinned, so
      the host could still write it)
    - The ITT pages go back only once the ITS is seen past the unmap
    - A GITS_CBASER write aborts until the ITS has consumed every
      command forwarded
    - The ITT must be page-aligned, where v2 under-counted the pages of
      one starting mid-page (sashiko)
    - The page count uses 16-byte entries on QDF2400 rev 1 (erratum
      0065)
    - A MAPD V=1 for a DeviceID already mapped is rejected, where v2
      shared the ITT a second time (sashiko)
    - One tracker entry per device, in a sorted array, instead of one
      per page keyed on the pfn (sashiko)
    - The devices mapped before the takeover are taken at setup (v2
      never tracked them)
    - A MAPD V=0 for a DeviceID that isn't mapped is forwarded once its
      level-1 entry is valid (was -EINVAL)
    - its_create_device() fails a device past the tracker's capacity,
      which setup returns

 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 193 +++++++++++++++++++++++++-
 arch/arm64/kvm/pkvm.c                 |   2 +-
 drivers/irqchip/irq-gic-v3-its.c      |  18 ++-
 include/linux/irqchip/arm-gic-v3.h    |   5 +-
 4 files changed, 209 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 5dd959451f989..8f06b738ad118 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -22,6 +22,8 @@
 #define GITS_CREADR_OFFSET	GENMASK_ULL(19, 5)
 #define GITS_CBASER_SIZE	GENMASK_ULL(7, 0)
 #define GITS_LVL1_ADDRESS	GENMASK_ULL(51, 12)
+/* Erratum 0065: the ITS writes 16-byte ITEs where GITS_TYPER says 8. */
+#define GITS_IIDR_QDF2400_R1	0x00001070
 
 /* A GITS_BASER<n> table, as the register described it at setup. */
 struct its_table {
@@ -35,14 +37,33 @@ struct its_table {
 	bool			indirect;
 };
 
+/* A mapped device; its ITT pages are hyp-owned until the ITS consumes the unmap. */
+struct its_device_map {
+	u64			itt_pa;
+	u64			release_seq;
+	u32			device_id;
+	u32			nr_pages;
+	u8			event_bits;
+	bool			release_pending;
+};
+
 /* Per-ITS state, in the pages the host donated at setup. */
 struct its_priv {
 	hyp_spinlock_t		lock;
 	void __iomem		*base;
+	u64			typer;
 	u64			cbaser;
+	u8			id_bits;
+	u8			itt_entry_size;
 	struct its_table	tables[GITS_BASER_NR_REGS];
 	struct its_table	*dev_table;
 
+	/* Sorted by device_id, in the rest of the donated pages. */
+	struct its_device_map	*devices;
+	u32			nr_devices;
+	u32			max_devices;
+	u32			nr_pending;
+
 	/* cmdq_hw is hyp-owned; cmdq_copy is the host's copy, pinned. */
 	void			*cmdq_hw;
 	void			*cmdq_copy;
@@ -53,6 +74,9 @@ struct its_priv {
 
 	/* The GITS_CREADR offset last read. */
 	u32			hw_creadr;
+	/* Commands forwarded to the ITS, and consumed by it. */
+	u64			seq_submitted;
+	u64			seq_completed;
 };
 
 static int its_pin_host_pages(phys_addr_t pa, u64 nr_pages)
@@ -127,11 +151,118 @@ static bool its_publish_l1(struct its_priv *its, u32 device_id)
 	return true;
 }
 
+/* The index of device_id, or where it would be inserted. */
+static u32 its_dev_search(struct its_priv *its, u32 device_id, bool *found)
+{
+	u32 lo = 0, hi = its->nr_devices;
+
+	while (lo < hi) {
+		u32 mid = lo + (hi - lo) / 2;
+
+		if (its->devices[mid].device_id < device_id)
+			lo = mid + 1;
+		else
+			hi = mid;
+	}
+
+	*found = lo < its->nr_devices && its->devices[lo].device_id == device_id;
+	return lo;
+}
+
+static void its_dev_remove(struct its_priv *its, u32 idx)
+{
+	its->nr_devices--;
+	memmove(&its->devices[idx], &its->devices[idx + 1],
+		(its->nr_devices - idx) * sizeof(*its->devices));
+}
+
+/*
+ * The driver page-aligns ITTs under protected mode. A MAPD on an ITT that isn't
+ * all zeros is UNPREDICTABLE, so @zero is set for a runtime MAPD.
+ */
+static int its_take_itt(struct its_priv *its, u32 device_id, u8 event_bits,
+			phys_addr_t itt_pa, bool zero)
+{
+	struct its_device_map dev = {
+		.itt_pa = itt_pa,
+		.device_id = device_id,
+		.event_bits = event_bits,
+	};
+	size_t size;
+	bool found;
+	u32 idx;
+	int ret;
+
+	if (event_bits > its->id_bits || !PAGE_ALIGNED(itt_pa))
+		return -EINVAL;
+
+	idx = its_dev_search(its, device_id, &found);
+	if (found)
+		return -EEXIST;
+	if (its->nr_devices == its->max_devices)
+		return -ENOSPC;
+
+	size = PAGE_ALIGN((1UL << event_bits) * its->itt_entry_size);
+	dev.nr_pages = size >> PAGE_SHIFT;
+	ret = __pkvm_host_donate_hyp(PHYS_PFN(itt_pa), dev.nr_pages);
+	if (ret)
+		return ret;
+
+	if (zero) {
+		memset(hyp_phys_to_virt(itt_pa), 0, size);
+		gic_flush_dcache_to_poc(hyp_phys_to_virt(itt_pa), size);
+	}
+
+	memmove(&its->devices[idx + 1], &its->devices[idx], (its->nr_devices - idx) * sizeof(dev));
+	its->devices[idx] = dev;
+	its->nr_devices++;
+	return 0;
+}
+
+/* The ITT goes back to the host once the ITS has consumed this unmap. */
+static void its_arm_release(struct its_priv *its, u32 device_id)
+{
+	struct its_device_map *dev;
+	bool found;
+
+	dev = &its->devices[its_dev_search(its, device_id, &found)];
+	if (!found || dev->release_pending)
+		return;
+
+	dev->release_pending = true;
+	dev->release_seq = its->seq_submitted + 1;
+	its->nr_pending++;
+}
+
+static void its_retire_releases(struct its_priv *its)
+{
+	u32 i = its->nr_devices;
+
+	while (its->nr_pending && i--) {
+		struct its_device_map *dev = &its->devices[i];
+
+		if (!dev->release_pending || dev->release_seq > its->seq_completed)
+			continue;
+
+		WARN_ON(__pkvm_hyp_donate_host(PHYS_PFN(dev->itt_pa), dev->nr_pages));
+		its->nr_pending--;
+		its_dev_remove(its, i);
+	}
+}
+
 static bool its_mapd(struct its_priv *its, struct its_cmd_block *cmd)
 {
 	u32 device_id = its_cmd_get_deviceid(cmd->raw_cmd);
 
-	return its_publish_l1(its, device_id);
+	if (!its_publish_l1(its, device_id))
+		return false;
+
+	if (its_cmd_get_validbit(cmd->raw_cmd))
+		return !its_take_itt(its, device_id, its_cmd_get_size(cmd->raw_cmd),
+				     its_cmd_get_ittaddr(cmd->raw_cmd), true);
+
+	its_arm_release(its, device_id);
+	return true;
 }
 
 static bool its_process_cmd(struct its_priv *its, struct its_cmd_block *cmd)
@@ -157,12 +288,21 @@ static bool its_process_cmd(struct its_priv *its, struct its_cmd_block *cmd)
 	}
 }
 
+/* Count the commands consumed since the last read, and release the ITTs they unmapped. */
 static u64 its_read_creadr(struct its_priv *its)
 {
 	u64 creadr = readq_relaxed(its->base + GITS_CREADR);
 	u32 offset = creadr & GITS_CREADR_OFFSET;
 
+	/*
+	 * A disabled ITS consumes no commands, so GITS_CREADR moving while it is
+	 * disabled, as after a reset behind the hypervisor, isn't progress.
+	 */
+	if (readl_relaxed(its->base + GITS_CTLR) & GITS_CTLR_ENABLE)
+		its->seq_completed += ((offset + its->cmdq_size - its->hw_creadr) %
+				       its->cmdq_size) / sizeof(struct its_cmd_block);
 	its->hw_creadr = offset;
+	its_retire_releases(its);
 
 	return creadr;
 }
@@ -209,6 +349,7 @@ static bool its_cwriter_write(struct its_priv *its, u64 val)
 		 */
 		gic_flush_dcache_to_poc(its->cmdq_hw + its->cmd_offset, sizeof(cmd));
 		its->cmd_offset = (its->cmd_offset + sizeof(cmd)) % its->cmdq_size;
+		its->seq_submitted++;
 	}
 
 	/* Retry has no effect unless the hardware stalled on a command error. */
@@ -241,7 +382,11 @@ static bool its_bases_intact(struct its_priv *its)
 
 static bool its_ctlr_write(struct its_priv *its, u64 val)
 {
-	u32 ctlr = readl_relaxed(its->base + GITS_CTLR);
+	u32 ctlr;
+
+	/* Read while still disabled, so a reset GITS_CREADR isn't counted as progress. */
+	its_read_creadr(its);
+	ctlr = readl_relaxed(its->base + GITS_CTLR);
 
 	if ((val & GITS_CTLR_ENABLE) && !(ctlr & GITS_CTLR_ENABLE)) {
 		/*
@@ -268,12 +413,13 @@ static bool its_disabled_quiescent(struct its_priv *its)
 
 static bool its_cbaser_write(struct its_priv *its)
 {
-	if (!its_disabled_quiescent(its))
+	/* The write resets the queue, dropping any command the ITS hasn't consumed. */
+	if (!its_disabled_quiescent(its) || its->seq_completed != its->seq_submitted)
 		return false;
 
 	writeq_relaxed(its->cbaser, its->base + GITS_CBASER);
 
-	/* The write reset GITS_CREADR to 0; nothing queued before it completes. */
+	/* The write reset GITS_CREADR to 0. */
 	its->cmd_offset = 0;
 	its->hw_creadr = 0;
 	writeq_relaxed(0, its->base + GITS_CWRITER);
@@ -314,6 +460,13 @@ static bool its_emulate(struct its_priv *its, u64 offset, bool write, u64 *val,
 		}
 	}
 
+	if (offset == GITS_CREADR) {
+		*val = its_read_creadr(its);
+		if (size == sizeof(u32))
+			*val = lower_32_bits(*val);
+		return true;
+	}
+
 	*val = size == sizeof(u64) ? readq_relaxed(its->base + offset) :
 				     readl_relaxed(its->base + offset);
 	return true;
@@ -369,6 +522,8 @@ static int its_take_cmdq(struct its_priv *its, phys_addr_t copy_pa)
 	its->cmdq_size = size;
 	its->cmd_offset = cwriter;
 	its->hw_creadr = creadr;
+	/* Commands the host queued before setup are submitted, not yet consumed. */
+	its->seq_submitted = ((cwriter + size - creadr) % size) / sizeof(struct its_cmd_block);
 	return 0;
 }
 
@@ -499,6 +654,22 @@ static int its_take_tables(struct its_priv *its, struct its_pkvm_desc *desc)
 	return 0;
 }
 
+static int its_take_devices(struct its_priv *its, struct its_pkvm_desc *desc)
+{
+	u32 i;
+	int ret;
+
+	for (i = 0; i < desc->nr_devices; i++) {
+		struct its_pkvm_device dev = desc->devices[i];
+
+		ret = its_take_itt(its, dev.device_id, dev.event_bits, dev.itt_pa, false);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 int pkvm_its_emulate_setup(phys_addr_t its_base, phys_addr_t desc_pa,
 			   size_t desc_size)
 {
@@ -534,7 +705,15 @@ int pkvm_its_emulate_setup(phys_addr_t its_base, phys_addr_t desc_pa,
 
 	hyp_spin_lock_init(&its->lock);
 	its->base = region->hyp_va;
+	its->typer = readq_relaxed(its->base + GITS_TYPER);
 	its->cbaser = readq_relaxed(its->base + GITS_CBASER);
+	its->id_bits = FIELD_GET(GITS_TYPER_IDBITS, its->typer) + 1;
+	its->itt_entry_size = FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1;
+	its->devices = (void *)(its + 1);
+	its->max_devices = (priv_pages * PAGE_SIZE - sizeof(*its)) / sizeof(*its->devices);
+
+	if (readl_relaxed(its->base + GITS_IIDR) == GITS_IIDR_QDF2400_R1)
+		its->itt_entry_size = 16;
 
 	ret = its_take_cmdq(its, desc->cmdq_copy_pa);
 	if (ret)
@@ -544,8 +723,12 @@ int pkvm_its_emulate_setup(phys_addr_t its_base, phys_addr_t desc_pa,
 	if (ret)
 		return ret;
 
+	ret = its_take_devices(its, desc);
+	if (ret)
+		return ret;
+
 	WARN_ON(__pkvm_hyp_donate_host(PHYS_PFN(desc_pa), desc_pages));
 	/* Published by stop_machine()'s exit: no host CPU traps until then. */
 	region->priv = its;
-	return 0;
+	return its->max_devices;
 }
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 3293e3c7353b8..3e9c734c264bc 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -85,7 +85,7 @@ static int __init pkvm_init_its_emulation(phys_addr_t its_base,
 	int ret;
 
 	ret = kvm_call_hyp_nvhe(__pkvm_its_emulate_setup, its_base, virt_to_phys(desc), desc_size);
-	if (ret)
+	if (ret < 0)
 		kvm_err("ITS@%pa: emulation setup failed: %d\n", &its_base, ret);
 
 	return ret;
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index cc89691f43cb4..35ab7bebd36f0 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -128,6 +128,7 @@ struct its_node {
 	u32			pre_its_base; /* for Socionext Synquacer */
 	int			vlpi_redist_offset;
 	struct its_pkvm_state	*pkvm;
+	u32			pkvm_max_devices;
 };
 
 static DEFINE_PER_CPU(struct its_node *, local_4_1_its);
@@ -3468,6 +3469,11 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
 	int id_bits;
 	int sz;
 
+	/* The hypervisor rejects a MAPD past its device tracker's capacity. */
+	if (its->pkvm_max_devices &&
+	    list_count_nodes(&its->its_device_list) >= its->pkvm_max_devices)
+		return NULL;
+
 	if (!its_alloc_device_table(its, dev_id))
 		return NULL;
 
@@ -5251,6 +5257,7 @@ static int __init its_compute_its_list_map(struct its_node *its)
  * and the hypervisor checks each before the ITS sees it.
  */
 struct its_pkvm_state {
+	u32			max_devices;
 	void			*priv;
 	void			*cmdq;
 	struct its_baser	*dev_baser;
@@ -5262,7 +5269,7 @@ struct its_pkvm_state {
 /* Held, with every ITS's dev_alloc_lock, from prepare to finish. */
 static DEFINE_MUTEX(its_pkvm_lock);
 
-/* Pages for the hypervisor's per-ITS state. */
+/* The hypervisor's per-ITS state, its device tracker included. */
 #define ITS_PKVM_PRIV_ORDER	3
 
 static int __init its_pkvm_alloc_copies(struct its_node *its,
@@ -5347,11 +5354,17 @@ static int __init its_pkvm_hand_over(struct its_node *its,
 				     its_pkvm_setup_fn setup)
 {
 	struct its_pkvm_state *st = its->pkvm;
+	int ret;
 
 	if (st->dev_l1)
 		memcpy(st->dev_l1, st->dev_baser->base, PAGE_ORDER_TO_SIZE(st->dev_baser->order));
 
-	return setup(its->phys_base, st->desc, st->desc_size);
+	ret = setup(its->phys_base, st->desc, st->desc_size);
+	if (ret < 0)
+		return ret;
+
+	st->max_devices = ret;
+	return 0;
 }
 
 static void __init its_pkvm_switch(struct its_node *its)
@@ -5360,6 +5373,7 @@ static void __init its_pkvm_switch(struct its_node *its)
 
 	its->cmd_write = (struct its_cmd_block *)st->cmdq + (its->cmd_write - its->cmd_base);
 	its->cmd_base = st->cmdq;
+	its->pkvm_max_devices = st->max_devices;
 	st->cmdq = NULL;
 	st->priv = NULL;
 
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index 64c594c23bd46..794d37c3bbf55 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -700,7 +700,10 @@ struct its_pkvm_desc {
 	struct its_pkvm_device	devices[];
 };
 
-/* Called with every CPU parked: no allocation. */
+/*
+ * Returns < 0 or the number of devices the hypervisor can track on this ITS.
+ * Called with every CPU parked: no allocation.
+ */
 typedef int (*its_pkvm_setup_fn)(phys_addr_t its_base,
 				 struct its_pkvm_desc *desc, size_t desc_size);
 
-- 
2.47.3

