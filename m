Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3E84D598A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064117; cv=none; b=lGakGEhCeuKYNQ/253Ik2guR//IsXk6h48p1JkInOr1uQPA6RKGVsHa0JwenteL87qLSFmMpXac1Vz+KvL6pod56gGY8fJZ5ICoAYjv/odkvCC6GDukKtVb1QzkcNWcknqE45BhWNva8jSZBwbJCiQqWupr/n6Q0wfY+lq2LiWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064117; c=relaxed/simple;
	bh=9ziRMOlF0fOTNkr1dL+Ne6qUpDk020zzCjQpb8OrhIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dK97GVObORX5uTQbdnUdhyE5rVo2kHXdIfe3k8l8SBkeQsFzblUZ5snSaBbua+EG/dRiXQE161LU8qXKT2ASSNHR3FhrO0IJw4/XNKTePKnCzKR4j37fnKrl1KrXiHgFzi/ZUvXVtjgErpccNz51W8dviVYqaRUmJYu0PheyHG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxyHqClv; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxyHqClv"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fbca514f8so2712845e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064097; x=1790668897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqiXccAHsUrIMDsLkLXR6P0dTgO5nQzYlI6kaXLWWHg=;
        b=OxyHqClvVDO/UmA1ObR7r4QdDC/7EQ830N3NMhjJrewQ0dIdYs9zq9gQMAGVOS6RW4
         vUyhjDfInPLzpwI+xDzCXCzRqUeb7x6LJE/S9aDiCMLfPXZf2nCZZhi+HZxo9u5LgRNn
         4PVJqiynscCNMuLDL0u31m6AAJU3x8dT+uTEhzHNVi2nJOdVTHLzPfvx6/rsaa34F4s0
         92WE4RT+ALOMmFDIXhN3xXoR49A6SS5FWyJ7BJzL4D25Xd7q3MaygyyrK4ET+/ALdaTV
         dOLKTBFqG5LIPz1ZgOndwCSwy5lOdYJvS9QwqUmO1x8caizm1WFgEjTE6wmo8OyiVJS4
         6Z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064097; x=1790668897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqiXccAHsUrIMDsLkLXR6P0dTgO5nQzYlI6kaXLWWHg=;
        b=lGzsfEOlzsm/rKyvhVjx1rVFlqKc52P2aykCRC3v1jrMFtD7jcXmQr0aOUcItkoJ+w
         DihIwcsq4PZqNRir4rrAUPinC8jTwUFzb9I2NQoUq7edr+PeoQTheSkzDtJ0VWENazoF
         v+Flzn5HZbZBZKqhUVS2McFvOJGhiUYD7w4DW+j8laWEnWMn9grjQvIdkyVrwblV7gE2
         1oS0cBrgccC37QxhAKDQmvjBewb53roLFesKNEo3cKdeOOWH4+v+QjJf4u56+nwKWQ+2
         4LFzsMrY1Ynhktebbz0qf0oaiYOUkblE1KN05YrW5kZzHhcA25y+gGsxwa3mPMG6Wpzl
         /smA==
X-Forwarded-Encrypted: i=1; AKwUvBztvPDw12DRhIv9yJLXZ1ETvOUrBb51+Kw642rlU9eGLRdOjvIyJVaqRiadBkwd8yryWsBm0E9X3xPC3wM=@vger.kernel.org
X-Gm-Message-State: AFuF++ldbLyF6pQ82gCv2V5ftv5eS/FJFUUQ6au+E0tGrGW3q44iejbM
	H7t2qgxjGtUMxI9sAaW8b6RIhmcih521QrhehawUsb0/LWsqqTUD9VL7
X-Gm-Gg: AYBFou3/zd6RLTAC6s82zRj4At62bevMa+ptEbritjiYvMNHLHXNPBIhNB40cgwV2wD
	maC0tiX8y+pVCqOuTo63D4vZDnne9pXYFR7hlf6xXe1mupiuoOUMK2nq+HSJptDrFM1Gu+R6GMQ
	wSWGMcg6jN1bUq3FLHWkraMI/OA4ix7akEKa1AjiqQeZWkwNLgGeEaEsQAZJZY6Nl/n+QX//bqc
	M7wzXISSYlNmnHLUJN2DSKvULwlW7SmJuGqxLvVrN9R6Q3LOM04vYEmPT2npsGneiXKwZ5LMJYU
	XgZy/N/YjCMA7Wi017WuIC7iz9/24TARpEAJaH7CzVs6CE5hLp+daaCPbfU1Dw3XXF95nauwc6A
	k0QfIQJzyOgDXjjsP6kVLBq2VeffWbOQqSKcjOymbIjcPeW9h/ft8wMLCO9xABeNxHPSPaJeuZo
	1ansVpGQ7k1jwUUtYHfzj0ZEExp0ya2nGJg6c/5DUxv2cY3u3gXxEka9jj1pu/wt34HSvOpDnrK
	jz/jDqFGcbc+O3OP1RSZqdS46nFSyIn40VolqjGWXsMu+Etg7UgcNNmNI1WBf/n/bHsm2Huvhcc
	7vE=
X-Received: by 2002:a05:600c:3b99:b0:49e:6683:d227 with SMTP id 5b1f17b1804b1-49fc7bbfe4bmr199180665e9.0.1790064096621;
        Tue, 22 Sep 2026 01:01:36 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:36 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 08/11] accel/rocket: restore the NPU clock boot rate before powering the cores down
Date: Tue, 22 Sep 2026 10:01:11 +0200
Message-ID: <20260922080114.44662-9-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compute clock is generated by a PVTPLL that lives inside the NPU power
island. Powering an island up while that clock is above the rate the
bootloader left it at does not work: the domain never acks the power-on,
and the first register access into it afterwards takes an asynchronous
SError. So the rate has to be back down before the last core goes away.

Nothing in the driver raises the clock today, which makes this a no-op on
its own, but it is the guard that has to be in the tree before anything
does, and the next patches do. The .shutdown hook is the same guard for the
handover: once devfreq is driving the clock, a kexec would otherwise pass
the raised rate to the next kernel, which powers the islands up before it
looks at it. What this cannot do is rescue a rate it did not set - the rate
read at probe is taken as the boot rate whatever it is.

The rate is read at probe rather than hardcoded. Mainline pins the RK3588
cores at 200 MHz with assigned-clock-rates, but that is a devicetree
property, not a property of the hardware, and a SoC whose devicetree does
not set it would be left running at a rate this driver had invented.

All three cores share the clock, so only the last core to suspend may lower
it; the others just drop the count. Lowering it is safe with the islands
already down as long as the boot rate is one the firmware serves from GPLL,
which on the RK3588 is the 200 MHz the devicetree pins: for that rate the
firmware writes only CRU clock selectors, never a register inside the NPU.

Assisted-by: LLM sparse checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
v2: v1 of this patch kept a struct clk handle in struct rocket_device,
taken from the devres of the first core to probe, and used it from the
runtime suspend of whichever core went down last. Unbinding the cores
freed the handle underneath it: KASAN reported a slab-use-after-free in
clk_set_rate() during a ten-round unbind/rebind test on this board after
v1 was posted. No handle is kept any more; the callback uses the handle of
the core it runs for, which is bound for as long as the call lasts.
"A reboot" is dropped from the kexec sentence and the comment: whether the
clock selectors survive the global reset the firmware does on reboot has
not been checked. The argument that lowering the rate is safe is now
limited to a boot rate the firmware serves from GPLL, which on the RK3588
is the 200 MHz the devicetree pins.

 drivers/accel/rocket/rocket_core.c   | 10 ++++++
 drivers/accel/rocket/rocket_device.h | 15 +++++++++
 drivers/accel/rocket/rocket_drv.c    | 47 ++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index 5dd260bacbff6..c736537cf28f6 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -12,6 +12,7 @@
 #include <linux/reset.h>
 
 #include "rocket_core.h"
+#include "rocket_device.h"
 #include "rocket_job.h"
 
 int rocket_core_init(struct rocket_core *core)
@@ -36,6 +37,15 @@ int rocket_core_init(struct rocket_core *core)
 	if (err)
 		return dev_err_probe(dev, err, "failed to get clocks for core %d\n", core->index);
 
+	/*
+	 * Record what the compute clock was running at before anything here
+	 * touched it, on the first core to probe. Reading it rather than
+	 * hardcoding a rate keeps this working on a SoC whose devicetree does
+	 * not pin the clock with assigned-clock-rates.
+	 */
+	if (!core->rdev->npu_boot_rate)
+		core->rdev->npu_boot_rate = clk_get_rate(core->clks[2].clk);
+
 	core->pc_iomem = devm_platform_ioremap_resource_byname(pdev, "pc");
 	if (IS_ERR(core->pc_iomem)) {
 		dev_err(dev, "couldn't find PC registers %ld\n", PTR_ERR(core->pc_iomem));
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
index abb88a254e569..ba7c977cd6951 100644
--- a/drivers/accel/rocket/rocket_device.h
+++ b/drivers/accel/rocket/rocket_device.h
@@ -22,6 +22,21 @@ struct rocket_device {
 	unsigned int num_cores;
 	/* Slot capacity (DT core count); slots with a NULL .dev are free. */
 	unsigned int max_cores;
+
+	/*
+	 * The cores have no clock of their own: one clock feeds all of them,
+	 * so any core's handle refers to the same thing. No handle is kept
+	 * here: each one belongs to the devres of the core that asked for it
+	 * and dies with that core's unbind, while this structure outlives any
+	 * single core. Whoever needs the clock uses the handle of the core it
+	 * was called for, which is bound for as long as the call lasts.
+	 *
+	 * npu_boot_rate is the rate the clock was left at before the driver
+	 * touched it, and active_cores counts the cores that are runtime
+	 * resumed right now.
+	 */
+	unsigned long npu_boot_rate;
+	atomic_t active_cores;
 };
 
 struct rocket_device *rocket_device_init(struct platform_device *pdev,
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index b9b36c578db20..8f03de1af488c 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -297,6 +297,30 @@ static int find_core_for_dev(struct device *dev)
 	return -1;
 }
 
+/*
+ * Put the compute clock back where the bootloader had it. The cores share
+ * this clock, so this is only correct once none of them is running any more.
+ *
+ * Lowering the rate is safe with the power islands down as long as the boot
+ * rate is one the firmware serves from GPLL, which on the RK3588 is the
+ * 200 MHz the devicetree pins: for that rate the firmware touches only the
+ * CRU clock selectors, none of the NPU's own registers.
+ */
+static void rocket_npu_restore_boot_rate(struct rocket_core *core)
+{
+	struct rocket_device *rdev = core->rdev;
+	int err;
+
+	if (!rdev->npu_boot_rate)
+		return;
+
+	err = clk_set_rate(core->clks[2].clk, rdev->npu_boot_rate);
+	if (err)
+		dev_warn(core->dev,
+			 "failed to restore the NPU boot rate of %lu Hz: %d\n",
+			 rdev->npu_boot_rate, err);
+}
+
 static int rocket_device_runtime_resume(struct device *dev)
 {
 	struct rocket_device *rdev = dev_get_drvdata(dev);
@@ -312,6 +336,8 @@ static int rocket_device_runtime_resume(struct device *dev)
 		return err;
 	}
 
+	atomic_inc(&rdev->active_cores);
+
 	return 0;
 }
 
@@ -328,6 +354,9 @@ static int rocket_device_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable_unprepare(ARRAY_SIZE(rdev->cores[core].clks), rdev->cores[core].clks);
 
+	if (atomic_dec_and_test(&rdev->active_cores))
+		rocket_npu_restore_boot_rate(&rdev->cores[core]);
+
 	return 0;
 }
 
@@ -336,9 +365,27 @@ EXPORT_GPL_DEV_PM_OPS(rocket_pm_ops) = {
 	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
+/*
+ * A kexec hands the next kernel whatever rate is set here, and that kernel
+ * will power the islands up before it looks at the clock.
+ */
+static void rocket_shutdown(struct platform_device *pdev)
+{
+	struct rocket_device *rdev = dev_get_drvdata(&pdev->dev);
+	int core;
+
+	if (!rdev)
+		return;
+
+	core = find_core_for_dev(&pdev->dev);
+	if (core >= 0)
+		rocket_npu_restore_boot_rate(&rdev->cores[core]);
+}
+
 static struct platform_driver rocket_driver = {
 	.probe = rocket_probe,
 	.remove = rocket_remove,
+	.shutdown = rocket_shutdown,
 	.driver	 = {
 		.name = "rocket",
 		.pm = pm_ptr(&rocket_pm_ops),
-- 
2.43.0

