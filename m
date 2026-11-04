Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810953;
	b=KtG6kGbXtGq6JKsrMoVUImZgD09o43CMPadjmk26Bp0fJjIyHkSccxm6UrUjshoRJLhu
	 IWczYAOhyjgtAa9z0jxlZxURdCQpceo07l1pec2so3hQ939uTGOqoS7KuHD4umSkVLvZI
	 +TMVM2L7XJjwY+09Mwk0Nzodg9T4ianAfsahE2i9BO4VTyeFp6RxBNbKaw/hjAvB2jj52
	 O2OHtghkOv9oiwLE4LsfYqrta6XwQ3YvDoA5BvKzINI06QxiYREjk7mCKwC60oe4i7LAG
	 9M3lZy2iOLZqDP+VlqEsKjUw8FV1IrmMpziw+h5WLw0apls9eHdm6EoQIMC9izzL9GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810953;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=C2NRokP+bbH0dmLN1ZxLcH6MsWDzT/y9CgvLjkqduKg=;
	b=k3v0F6tB+wWszvRTyyQo215O04StEV7XFfXztMkhONg6z6MKDLY4itO8OjI2YstxvjS4
	 DNDymBbf4SCHkkKLEUouwjpvOKuCp4N8FWyYThZR9KKYHZQoMIeQ1vXbCge8A2pYDCQpW
	 kfx3LnspGp0fhJu0HsGzHtiok81KFFUJ+Tar14RxtapNJQvrVSoAMr0yP8WoTGqfsR3h6
	 YOuQTjamVTI8sMG1TRqq5aGXeOrvRWBQ1CdTW7kAfmWHi8vbdUJfiRi1BoRNF+rk4QVOL
	 TBSynGL6a/BjKF+9bA5tyOKOwetehOATagM6n6o+bAJBa0djH2o/hW18mJ04fvdJ6EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EokqLgbv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294616083615;
	Wed,  4 Nov 2026 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EokqLgbv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2E61F00A29;
	Wed,  4 Nov 2026 16:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810952;
	bh=C2NRokP+bbH0dmLN1ZxLcH6MsWDzT/y9CgvLjkqduKg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EokqLgbvAaOOhyfgUWqUmPccdo9Jspb9yGQxSn7fI5lNK2RvUN2P/uwHlrnxscgLJ
	 LROrQ12ngebdCj0fp4XB6037zrTLqI/1r2KujV1tIxHr0u6iFu7TvGKVgNPLPZB1n5
	 1xbH3pJW0DV+niSbm7cbm+unzFdI4NGIeFpa2jm8PKn/pgHO4yaBXYpS231qOodnDZ
	 PNB3Ya1Lah41DoxpNHpiAXbvokj7KsCC3Q2Ib6f3X3Blx5AaExSo9wEJ8jbvMuWapY
	 It/MLHTq1vFRRRDzoMlPhKF2NDnEEKspzyEn9nz3YPpAkHg2rIEfB6RGiOibzOgnQu
	 hZTIvsYL5TL3Q==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 04 Nov 2026 08:35:22 -0800
Subject: [PATCH v10 5/6] riscv_cbqri: Add CBQRI capacity allocation
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
Message-Id: <20261104-dfustini-atl-sc-cbqri-dt-v10-5-1636a003a3c0@kernel.org>
References: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
In-Reply-To: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
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
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7107; i=fustini@kernel.org;
 h=from:subject:message-id; bh=o1FknqkA4WyM2Uj8xkXCmraI2e5z/UrQTTSf18kj0/k=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWS9TmI1ag6f01CkGjjDXyfHPuJr7Fz9pDsuftZ/v390f
 H4hO9q4o5SFQYyLQVZMkWXTh7wLS7xCvy6Y/2IbzBxWJpAhDFycAjCRM3yMDJtf+aWEfGs0njZn
 642Jy9b6BIix6qzi2Hb3m9+ZuIuz2z8y/DPdFFItanuq1JM32Fj/hsPrbrWUm24TLEWFbk2xPWw
 XxggA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010

Add a platform driver for CBQRI capacity controllers described in
device tree with the riscv,cbqri-capacity-controller compatible.

The controller node points at the cache it governs with a
riscv,cbqri-cache phandle. The driver maps the register block, looks
that cache up in cacheinfo and uses its cache id as the resctrl domain
id, so the binding does not need to carry a CPU mask. The controller is
then handed to the CBQRI core, which probes its capabilities and decides
whether to expose it through resctrl.

Nothing is vendor-specific and reg is the CBQRI register block itself,
so any SoC that describes a CBQRI capacity controller in device tree can
use the driver unchanged.

Tested-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS                      |   1 +
 drivers/resctrl/Kconfig          |  15 +++++
 drivers/resctrl/Makefile         |   1 +
 drivers/resctrl/cbqri_capacity.c | 131 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 148 insertions(+)

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
index 000000000000..3d3073c34c6a
--- /dev/null
+++ b/drivers/resctrl/cbqri_capacity.c
@@ -0,0 +1,131 @@
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
+#define pr_fmt(fmt) "cbqri-capacity: " fmt
+
+#include <linux/cacheinfo.h>
+#include <linux/cpu.h>
+#include <linux/device-id/of.h>
+#include <linux/err.h>
+#include <linux/ioport.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
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
+	u32 rcid_count, cache_level;
+	int cache_id, cpu, ret;
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
+	/*
+	 * Associate the controller with its cache instance via cacheinfo.
+	 * The matching cache provides the cache id used as the resctrl
+	 * domain id.
+	 *
+	 * Taking the first leaf at the level is sufficient, because fw_token
+	 * is keyed on the DT cache node, so sibling leaves of a split cache
+	 * share it, and riscv,cbqri-cache must reference a unified shared
+	 * cache (cache-unified), not a split private L1.
+	 */
+	cache_id = -1;
+	cpus_read_lock();
+	for_each_online_cpu(cpu) {
+		struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, cache_level);
+
+		if (ci && ci->fw_token == cache_np) {
+			cache_id = ci->id;
+			break;
+		}
+	}
+	cpus_read_unlock();
+
+	if (cache_id < 0) {
+		dev_err(dev, "%pOF: no online hart reports an L%u cache for this node\n",
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
+	dev_info(dev, "registered L%u capacity controller at %pa (cache_id=%d, rcid=%u)\n",
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

