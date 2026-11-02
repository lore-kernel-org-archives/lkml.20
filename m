Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624588;
	b=Brch+UVSD9ks877/JGXZd5Xihdmz8XlyU/zJvFeE5XMzbnhJUia5oZhGxAZAQDdcG89i
	 QiT4WcwLwEp6F2jSeIbYlWyXiUCRuicJcfOwGNca1Ny5piNqorczYfavLijrH8ZfUzLXg
	 hws5fCfSZcq7RPiW45vdh8m2ELb2zKN9B6evftB5Xq3E3Mt5UunP6Gn7KfXNzgaU4y8ur
	 HYv1ROqZIRg6N+nQxX/8bnRtTsvZQMVs1g8s8IIZAxzqdV418z/cs/RvD2QYCquoRSnPG
	 tVUGX4gUtLqrrY40jkiahZ6+iP0NxsuPKtd48X+azMlfFHVOGBNlFh7QMCeLMA+AJYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624588;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=faRMA1mhLkjqpnghPc6PRr7KsYaRPBjovOnD9EFU2+o=;
	b=MMNlVuJFKZlHsUvizN5abi61lXxFloaUM/jVnrs0oyvCtNH3Ay8yuGEzl5yRYUGccYxF
	 qca4eZm2UVTDnc/z8TJsR4xKHUiLhra1/U+aPviO4od7DBICZI4PxzA/ztAlAB1gvZfLU
	 aoxYGkojIzDCrEy4E2JbFiLaWRkU1uLxcWNgA4INcGpD7p8LJxsl+UsACG9yfAZZ71eqr
	 0YJMQHdOj0L5pi/TBCf3NQv1+w4dre7EhOmO2TZPUGUIMX931EiSXgnW+RYvl8asRZuzX
	 b59HVWKGgBw7MjZ+jgU3F7JtEN16hUtbU6/PhyDwF+biuWZVOYBATBw8YKgd79Msf8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jgvdxVZ7;
	arc=none smtp.remote-ip=95.215.58.3
Received: from mta1.migadu.com (out-3.mta1.migadu.com [95.215.58.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DBB606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DBB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jgvdxVZ7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jfMbSdvFeToanOblzM2qnSXimwftl4Nc9RBM7D5wNIY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793624585; v=1; x=1794229385;
 b=jgvdxVZ7kLoPnyJWWk/pys/Za799lnNoQef7/hIQLHfuYvf5eoA7Gwf6RMXidhmMowE6PUDh
 S9VuFm23aBZJUWhYAEHlNY2dXkcH3fg1EFYTS3eW1wBYWiqVZIMA2rdTPu8QM82QN2jSnKb8Yrj
 JssbfMJlWem4xH2zIxtm/YpM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fe16e33d5f126d1c;
	Mon, 02 Nov 2026 13:03:05 +0000
X-Mizu-Trace-ID: fe16e33d5f126d1c
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
Subject: [PATCH v3 12/13] KVM: arm64: Reject ITS commands whose IDs are out of range
Date: Mon,  2 Nov 2026 13:01:32 +0000
Message-ID: <20261102130133.3684226-13-fuad.tabba@linux.dev>
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
Content-Transfer-Encoding: 8bit

The ITS can't be relied on to reject a command with an out-of-range ID:
IHI 0069H.b 5.3.2 makes the response to a command error CONSTRAINED
UNPREDICTABLE, and one permitted outcome is "The data that generated the
error or errors is treated as having a legal value, and the command is
processed accordingly". An out-of-range DeviceID, EventID or ICID then
has the ITS access memory past the device table, the ITT or the
collection table.

Bound each ID before forwarding the command: the DeviceID by
GITS_TYPER.Devbits and the device table, the EventID by the size its
device was mapped with, and the ICID by the ICID width and the number of
collections. Also reject a command for an event of a device whose unmap
is queued, as its ITE would land in an ITT the hypervisor may already
have released. The driver loses nothing. It never allocates an
out-of-range DeviceID or EventID, or sends a command for a device after
its unmap. Its ICIDs are CPU numbers, which exceed the collections only
on an ITS that already treats its MAPC as a command error (IHI 0069H.b
5.3.9).

MAPTI's pINTID, which the ITS only stores in the ITE, and the RDbase of
MAPC, MOVALL and SYNC are left to the redistributor series, as both
concern the redistributors.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 49 +++++++++++++++++++++++++--
 include/linux/irqchip/arm-gic-v3.h    |  3 ++
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 8f06b738ad118..8bcdb06632b65 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -55,8 +55,12 @@ struct its_priv {
 	u64			cbaser;
 	u8			id_bits;
 	u8			itt_entry_size;
+	u8			dev_bits;
+	u8			icid_bits;
+	u32			max_collections;
 	struct its_table	tables[GITS_BASER_NR_REGS];
 	struct its_table	*dev_table;
+	struct its_table	*coll_table;
 
 	/* Sorted by device_id, in the rest of the donated pages. */
 	struct its_device_map	*devices;
@@ -254,7 +258,7 @@ static bool its_mapd(struct its_priv *its, struct its_cmd_block *cmd)
 {
 	u32 device_id = its_cmd_get_deviceid(cmd->raw_cmd);
 
-	if (!its_publish_l1(its, device_id))
+	if (device_id >= BIT_ULL(its->dev_bits) || !its_publish_l1(its, device_id))
 		return false;
 
 	if (its_cmd_get_validbit(cmd->raw_cmd))
@@ -265,21 +269,42 @@ static bool its_mapd(struct its_priv *its, struct its_cmd_block *cmd)
 	return true;
 }
 
+/* An event of a device whose unmap is queued is out of range too. */
+static bool its_event_in_range(struct its_priv *its, struct its_cmd_block *cmd)
+{
+	struct its_device_map *dev;
+	bool found;
+
+	dev = &its->devices[its_dev_search(its, its_cmd_get_deviceid(cmd->raw_cmd), &found)];
+	return found && !dev->release_pending &&
+	       its_cmd_get_id(cmd->raw_cmd) < BIT_ULL(dev->event_bits);
+}
+
+static bool its_collection_in_range(struct its_priv *its, struct its_cmd_block *cmd)
+{
+	u32 icid = its_cmd_get_collection(cmd->raw_cmd);
+
+	return icid < BIT_ULL(its->icid_bits) && icid < its->max_collections;
+}
+
 static bool its_process_cmd(struct its_priv *its, struct its_cmd_block *cmd)
 {
 	switch (its_cmd_get_command(cmd->raw_cmd)) {
 	case GITS_CMD_MAPD:
 		return its_mapd(its, cmd);
 	case GITS_CMD_MAPC:
+	case GITS_CMD_INVALL:
+		return its_collection_in_range(its, cmd);
 	case GITS_CMD_MAPTI:
 	case GITS_CMD_MAPI:
 	case GITS_CMD_MOVI:
+		return its_event_in_range(its, cmd) && its_collection_in_range(its, cmd);
 	case GITS_CMD_DISCARD:
 	case GITS_CMD_INV:
-	case GITS_CMD_MOVALL:
-	case GITS_CMD_INVALL:
 	case GITS_CMD_INT:
 	case GITS_CMD_CLEAR:
+		return its_event_in_range(its, cmd);
+	case GITS_CMD_MOVALL:
 	case GITS_CMD_SYNC:
 		return true;
 	default:
@@ -639,6 +664,9 @@ static int its_take_tables(struct its_priv *its, struct its_pkvm_desc *desc)
 			copy_pa = desc->dev_l1_copy_pa;
 			its->dev_table = t;
 			break;
+		case GITS_BASER_TYPE_COLLECTION:
+			its->coll_table = t;
+			break;
 		case GITS_BASER_TYPE_VCPU:
 			/* Taken: writing it while the ITS is enabled is UNPREDICTABLE (5.2.1). */
 			if (its_vpe_table_taken(t->baser))
@@ -654,6 +682,17 @@ static int its_take_tables(struct its_priv *its, struct its_pkvm_desc *desc)
 	return 0;
 }
 
+/* GITS_TYPER.CCT indicates whether the ITS's HCC collections add to the memory table's. */
+static u32 its_collection_count(struct its_priv *its)
+{
+	u32 hcc = GITS_TYPER_HCC(its->typer), in_mem = 0;
+
+	if (its->coll_table)
+		in_mem = its->coll_table->size / its->coll_table->esz;
+
+	return its->typer & GITS_TYPER_CCT ? hcc + in_mem : max(hcc, in_mem);
+}
+
 static int its_take_devices(struct its_priv *its, struct its_pkvm_desc *desc)
 {
 	u32 i;
@@ -709,6 +748,9 @@ int pkvm_its_emulate_setup(phys_addr_t its_base, phys_addr_t desc_pa,
 	its->cbaser = readq_relaxed(its->base + GITS_CBASER);
 	its->id_bits = FIELD_GET(GITS_TYPER_IDBITS, its->typer) + 1;
 	its->itt_entry_size = FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1;
+	its->dev_bits = FIELD_GET(GITS_TYPER_DEVBITS, its->typer) + 1;
+	its->icid_bits = its->typer & GITS_TYPER_CIL ?
+			 FIELD_GET(GITS_TYPER_CIDBITS, its->typer) + 1 : 16;
 	its->devices = (void *)(its + 1);
 	its->max_devices = (priv_pages * PAGE_SIZE - sizeof(*its)) / sizeof(*its->devices);
 
@@ -722,6 +764,7 @@ int pkvm_its_emulate_setup(phys_addr_t its_base, phys_addr_t desc_pa,
 	ret = its_take_tables(its, desc);
 	if (ret)
 		return ret;
+	its->max_collections = its_collection_count(its);
 
 	ret = its_take_devices(its, desc);
 	if (ret)
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index 794d37c3bbf55..9e2a42a5ceb40 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -392,6 +392,7 @@
 
 #define GITS_TYPER_PLPIS		(1UL << 0)
 #define GITS_TYPER_VLPIS		(1UL << 1)
+#define GITS_TYPER_CCT			(1UL << 2)
 #define GITS_TYPER_ITT_ENTRY_SIZE_SHIFT	4
 #define GITS_TYPER_ITT_ENTRY_SIZE	GENMASK_ULL(7, 4)
 #define GITS_TYPER_IDBITS		GENMASK_ULL(12, 8)
@@ -401,6 +402,8 @@
 #define GITS_TYPER_PTA			(1UL << 19)
 #define GITS_TYPER_HCC_SHIFT		24
 #define GITS_TYPER_HCC(r)		(((r) >> GITS_TYPER_HCC_SHIFT) & 0xff)
+#define GITS_TYPER_CIDBITS		GENMASK_ULL(35, 32)
+#define GITS_TYPER_CIL			(1ULL << 36)
 #define GITS_TYPER_VMOVP		(1ULL << 37)
 #define GITS_TYPER_VMAPP		(1ULL << 40)
 #define GITS_TYPER_SVPET		GENMASK_ULL(42, 41)
-- 
2.47.3

