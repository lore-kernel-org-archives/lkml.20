Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794693991;
	b=YOFr9wjBwoIXpIv9+McAEL8N+Klvpvv/YMSV8QcACQqamcJT9fRnj9DrWvw8m8asd4GU
	 NKdwCUtW5FmjJesmoIilX91Q0uUT5fwBzEI0HPBZ/yfjjU01cw+mzfE9SORRv1oK8BcTj
	 mKdV2aUDwZCVkFAckII1ECJY/a4CE97KV2Y89sko6hyeP9i++Gvm9a+A4mzh8r4I+lFdv
	 83GKo0OVnENexGnG/HcZ3i3iBk154WyZDpEtdpl0TuO8XAS7OgfzeEaKzQue17iSZPi8Q
	 NGUKVqJnJ5HCRtvHaUwcq7IdLUrIr8qyudeu6dEorkO7WIpPCC0lw0Gy/yeFRIcc3Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794693991;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZxeLD9+pUlJobhY1y7HdF3Lq0lNgVU7bbHqvg+Cq8lI=;
	b=qSC8C/dPHtTNx0+Zhr33buH465T2HIXHwcby6RKziTUQzfU46LF2431lkIYpggObxox3
	 dIS0sS0CBSvbgUnL7IxJAHE9izFDciii/iawMGnCnH5n/oyVfDl/zzBz3DX6cWlyulo/U
	 wfjkoqyizbj0z0Vidk7LY+5BkxYg2DfbdGQ4oiJurseNy1bOMW0hmhFgLV8S5KXnQ3y+0
	 dT82wOhPHaeRadlHuSRUp08nvIml08p+MGr0+xsEb7BK59HsSHlD8vsAebjcNe2rkDI4L
	 rIjik1aBIGBq3yeUl/Vy9GmFxQ4+ohIXN5HypgT1ZvqDyJGoltWj0qaTCoQcSTPE8Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVV55Mnq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F5460A2601;
	Sat, 14 Nov 2026 22:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVV55Mnq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E15C1F000CC;
	Sat, 14 Nov 2026 22:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794693990;
	bh=ZxeLD9+pUlJobhY1y7HdF3Lq0lNgVU7bbHqvg+Cq8lI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HVV55Mnqndbe6IMvr09x7lFChyOHtvKIHYTSWWrH2tr2VyC6e4x0BJ/B09qZYqhjd
	 JdcBGHIHwWc94sDc7n+PtvWRs8onissoiKjZr758CJIHhSsjawadSpR2RkGTsKheV9
	 6f+TkA9yX+QClyaE5t970+yZgpNgvAUjJguAwwwrf+qiouN3ejaJsuOIyty4IDU9pJ
	 8HTLxuVWqnKyh3SGl7WQ653lcNUFe0muLZnSw4GBjIy0Ed6gHQgWRARlkSFLE+5HoE
	 cW5fj4incaWBM4vYHFbXU+GakMcbvKItJ+msGMgC4wmlgYypzLRSE7ODMfALAZ9EQz
	 ghpx3VHqF3GLw==
From: Drew Fustini <fustini@kernel.org>
Date: Sat, 14 Nov 2026 14:06:25 -0800
Subject: [PATCH v12 5/5] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-dfustini-atl-sc-cbqri-dt-v12-5-6ef1f627072d@kernel.org>
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
In-Reply-To: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sunil V L <sunilvl@oss.qualcomm.com>, Tony Luck <tony.luck@intel.com>, 
 Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
 Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7571; i=fustini@kernel.org;
 h=from:subject:message-id; bh=iiI8JqUcmjuH9GT0lRLIS06KEF9yG+O8m0bvwjLvoFQ=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWT9uJ28+uerfo57Uy9ark8+cuMha61pyd6QVUlXVF8cc
 eCeoHZhekcpC4MYF4OsmCLLpg95F5Z4hX5dMP/FNpg5rEwgQxi4OAVgIr9ZGf7KVBX4zJ+3repe
 hkKGYvuhcIbyGzZbgzq/LFs+e7rj8gYlRobr6edtfzUlLdlm1ax8iu8q10mRp5eMz8945LR929v
 54T5cAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010

Add a platform driver for CBQRI capacity controllers described in
device tree with the riscv,cbqri-capacity-controller compatible.

The controller node points at the cache it governs with a
riscv,cbqri-cache phandle. The driver maps the register block, looks
that cache up in cacheinfo and uses its cache id as the resctrl domain
id, so the binding does not need to carry a CPU mask. The controller is
then handed to the CBQRI core, which probes its capabilities and decides
whether to expose it through resctrl. Only an L2 or L3 cache is
accepted, since those are the cache levels resctrl has resources for.

Nothing is vendor-specific and reg is the CBQRI register block itself,
so any SoC that describes a CBQRI capacity controller in device tree can
use the driver unchanged.

Tested-by: Chen Pei <cp0613@linux.alibaba.com>
Tested-by: Zeng Heng <zengheng@picoheart.com>
Reviewed-by: Zeng Heng <zengheng@picoheart.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS                      |   1 +
 drivers/resctrl/Kconfig          |  15 +++++
 drivers/resctrl/Makefile         |   1 +
 drivers/resctrl/cbqri_capacity.c | 139 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 156 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 636835e313ee..df051086b5dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24141,6 +24141,7 @@ F:	Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
 F:	arch/riscv/include/asm/qos.h
 F:	arch/riscv/include/asm/resctrl.h
 F:	arch/riscv/kernel/qos.c
+F:	drivers/resctrl/cbqri_capacity.c
 F:	drivers/resctrl/cbqri_devices.c
 F:	drivers/resctrl/cbqri_internal.h
 F:	drivers/resctrl/cbqri_resctrl.c
diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index ed2e4bedb21b..844dfd75e2aa 100644
--- a/drivers/resctrl/Kconfig
+++ b/drivers/resctrl/Kconfig
@@ -43,6 +43,21 @@ menuconfig RISCV_CBQRI
 	  allocation through the resctrl filesystem at /sys/fs/resctrl when
 	  RESCTRL_FS is also enabled.
 
+if RISCV_CBQRI
+
+config RISCV_CBQRI_CAPACITY
+	bool "RISC-V CBQRI cache capacity-allocation controller"
+	depends on OF
+	help
+	  Enable driver for a RISC-V CBQRI capacity controller that
+	  governs a CPU cache, matching the "riscv,cbqri-capacity-controller"
+	  compatible. The controller's cache phandle gives the cache level and
+	  id, which the driver registers as a resctrl cache-allocation resource.
+
+	  Say N unless your device tree describes a CBQRI capacity controller.
+
+endif
+
 config RISCV_CBQRI_RESCTRL_FS
 	bool
 	default y if RISCV_CBQRI && RESCTRL_FS
diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
index 9473b47c93d5..6ce2c8fe8cdf 100644
--- a/drivers/resctrl/Makefile
+++ b/drivers/resctrl/Makefile
@@ -7,3 +7,4 @@ ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
 obj-$(CONFIG_RISCV_CBQRI)			+= cbqri.o
 cbqri-y						+= cbqri_devices.o
 cbqri-$(CONFIG_RISCV_CBQRI_RESCTRL_FS)		+= cbqri_resctrl.o
+cbqri-$(CONFIG_RISCV_CBQRI_CAPACITY)		+= cbqri_capacity.o
diff --git a/drivers/resctrl/cbqri_capacity.c b/drivers/resctrl/cbqri_capacity.c
new file mode 100644
index 000000000000..6f3d06c4f74b
--- /dev/null
+++ b/drivers/resctrl/cbqri_capacity.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Platform driver for a RISC-V CBQRI capacity controller that backs a CPU
+ * cache. The controller is described in device tree by the generic
+ * "riscv,cbqri-capacity-controller" compatible together with a phandle to the
+ * cache node it governs. The driver hands it to the CBQRI core, which probes
+ * the capabilities register and exposes a controller that supports allocation
+ * as the resctrl cache allocation resource for that cache.
+ */
+
+#include <linux/cacheinfo.h>
+#include <linux/cpu.h>
+#include <linux/device-id/of.h>
+#include <linux/err.h>
+#include <linux/ioport.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/riscv_cbqri.h>
+#include <linux/types.h>
+
+static int cbqri_capacity_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cbqri_controller_info info = {};
+	struct device_node *cache_np;
+	struct resource *res;
+	void __iomem *base;
+	u32 rcid_count, cache_level, cache_id;
+	bool found = false;
+	int cpu, ret;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	ret = of_property_read_u32(dev->of_node, "riscv,cbqri-rcid", &rcid_count);
+	if (ret) {
+		dev_err(dev, "missing riscv,cbqri-rcid\n");
+		return ret;
+	}
+
+	cache_np = of_parse_phandle(dev->of_node, "riscv,cbqri-cache", 0);
+	if (!cache_np) {
+		dev_err(dev, "missing riscv,cbqri-cache phandle\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32(cache_np, "cache-level", &cache_level);
+	if (ret) {
+		dev_err(dev, "%pOF: missing cache-level\n", cache_np);
+		goto out_put;
+	}
+
+	if (cache_level != 2 && cache_level != 3) {
+		dev_err(dev, "%pOF: unsupported cache-level %u\n",
+			cache_np, cache_level);
+		ret = -EINVAL;
+		goto out_put;
+	}
+
+	/*
+	 * Associate the controller with its cache instance via cacheinfo.
+	 * The matching cache provides the cache id used as the resctrl
+	 * domain id.
+	 *
+	 * Taking the first leaf at the level is sufficient because a
+	 * unified cache node yields one cacheinfo leaf and
+	 * cache_setup_of_node() walks one cache node per leaf past L1, so
+	 * the first leaf at the level has that level's node as fw_token.
+	 *
+	 * get_cpu_cacheinfo_level() returns the leaf only when cacheinfo
+	 * assigned it an id (CACHE_ID), which the resctrl domain id needs.
+	 */
+	cpus_read_lock();
+	for_each_online_cpu(cpu) {
+		struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, cache_level);
+
+		if (ci && ci->fw_token == cache_np) {
+			cache_id = ci->id;
+			found = true;
+			break;
+		}
+	}
+	cpus_read_unlock();
+
+	if (!found) {
+		dev_err(dev, "%pOF: no online hart reports an L%u cache with a cache id for this node\n",
+			cache_np, cache_level);
+		ret = -ENODEV;
+		goto out_put;
+	}
+
+	info.type = CBQRI_CONTROLLER_TYPE_CAPACITY;
+	info.base = base;
+	info.addr = res->start;
+	info.size = resource_size(res);
+	info.rcid_count = rcid_count;
+	info.cache_id = cache_id;
+	info.cache_level = cache_level;
+
+	ret = riscv_cbqri_register_cc(&info);
+	if (ret) {
+		dev_err(dev, "failed to register capacity controller: %d\n", ret);
+		goto out_put;
+	}
+
+	dev_info(dev, "registered L%u capacity controller at %pa (cache_id=%u, rcid=%u)\n",
+		 cache_level, &info.addr, cache_id, rcid_count);
+
+out_put:
+	of_node_put(cache_np);
+	return ret;
+}
+
+static const struct of_device_id cbqri_capacity_of_match[] = {
+	{ .compatible = "riscv,cbqri-capacity-controller" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cbqri_capacity_of_match);
+
+static struct platform_driver cbqri_capacity_driver = {
+	.probe	= cbqri_capacity_probe,
+	.driver = {
+		.name		= "cbqri-capacity",
+		.of_match_table	= cbqri_capacity_of_match,
+		/*
+		 * The controller is registered permanently into the
+		 * CBQRI core for the life of the system. Block unbind
+		 * so userspace cannot leave a dangling controller.
+		 */
+		.suppress_bind_attrs = true,
+	},
+};
+
+/*
+ * Register at device_initcall so probe runs before the resctrl glue's
+ * late_initcall, which copies the cbqri_controllers list.
+ */
+builtin_platform_driver(cbqri_capacity_driver);

-- 
2.43.0

