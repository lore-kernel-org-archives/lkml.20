Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7857E477294
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253785; cv=none; b=oQ9nqhKHdYMkN65bWEJpvw81nqi2r/D+8W4chnVs+QjIYlFoCcP8NIL5ySLkx64LGtM7yK07iBbEjwAuUy4RlqOVFSZSkcrBuONriLGtt9xASTI6eo0RuF7Ky6Fmi3DdK4eKjcOUPCjjUWtkvv6MgpVJ2cUMAy1jRYQpJKyKFP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253785; c=relaxed/simple;
	bh=s7OwmMd7z/CvhHqL8SqrmB96oUwRDyMihyU61UF48Os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C0+0dt6Wzl5SESJ0Qg0jG19w+dB51VG+UjEfyAVBT4HKofUFX2H2FkLIUBXTi5gofhh3TbhbIDE+I+zXS7x0U3szYQWM0UMOTGg9LLShSUdzsHzqSuXNI4kdFqczOpmb81nkIvFoQLDz7WNDFICAjAVRKKmm6ij6ucDFmFIB0bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eMqT0tGo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eMqT0tGo"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so32603225e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788253774; x=1788858574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T9TiGLOlBJPaa6ACMJt76ajLLQMGHpzZnyu3DaDv9wI=;
        b=eMqT0tGoQS7uoYSWORui1JssXLeUfMin/saqc7XiNtm2Y/v0ahwzKgV79QeMmOBLta
         L/AD3HLXi+rEUlLzExkNPEyX5YdmlZ0BqfNUeROcTLEYUZ0yNxCuUPItlnCBqaHXs3f4
         AVpZMYTFxqDaXT+fLGV6q5BpxhRp6Hq7/Hq2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253774; x=1788858574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9TiGLOlBJPaa6ACMJt76ajLLQMGHpzZnyu3DaDv9wI=;
        b=jQqc18yXgiIAsSILy6t1p+PvYhIuK0xK3jBsX7T+afi/wdaqIqLMNDlxFrkcaAR3At
         zKKVYwEWI3sKIgkb2XAfR4uMey5X1ohtVJNHLZWLXdWt3+dXKYDrpiTNVPWdaD4F+Q8Z
         a6QuMLPPbQxaL5v8+5DFxOfIhJyZU8xwsyPnWV9C4gdx/qH8kuRDDWP+C3DtHEXbxJ5s
         0eNglLw9tEahbFSwTiY/0T//SBsE6CBEIb8VjK/fWKl3YzYqViBMRUj8/WUI5qqJlhYb
         tqQ0jHsjiY9PKuteu8Y7uJEIMsJcuwCTmnW3KrDQP9fSYzDb593HBSHBFFZgGjVaK8iM
         HvOA==
X-Gm-Message-State: AFuF++nJhFuAat+Krk3KEjWQ9i3f2xqikpG4rw29a7TgFviw7zRm5em3
	jvUsoo7Ax+pVH1B/+AJitrYSpF1Fr/cA0Abp3O00JNj0SLWH69nKuAik5PYrQQCPXbpY19x+P+7
	3cMXr0eY=
X-Gm-Gg: AR+sD137yl8oDGvuAggEwXIQ+SzMM6YmhmkAo4YrgzC49Dki6KHyG2kRcSqxzmMI6QR
	B4e7yl30k5Y3t4FaORJoCh9ZveaxwOsjwE7+OC9dhlf5yHshfZ8VkNBmFOK+y+MIIhJ7aUSsq/P
	RBXJJvgg0l26hxZoTfRtSsIJlm+FLasbAgAiSMp680bgwDUqJnGImq9+TkH8WHpRcRRVMEXOqPd
	WIpHUE3XkIhVUUoXGcG4n5uRWjg8KAbwQoqCTbrf7RdEgh/YfgrWfPjqj3biKcrdF+jsbF63Lbj
	CqS8xsSQauNOj+xDmNrDTY0j4KhSxV8Yg11J4z9ZEmUNQKBzrPpDQXa8+6ailYTIC5kqkFhjj1B
	NBayiN6Bzk+WywOeQbMChLX+abwkrSSV6p+rDcuwrd76+WWVVBPSAzmmC0Z8Y/dQLbOkB+mmJyF
	qvqHFChDif7A9x6p9J25CTMaK4Znns1bxdtIRCN+bxczD/ZHki2lnN/zEAlCmclAKwsUvZFKIBc
	HKzHWdRsR2wnDaO8Jq1kJYJUiq/3hg0z981IfMYNBgH+L2nWUrsAZaeWKct8xouc2Uo0l34WiR+
	+/+4DeB4auAygGW5rRkYP7eC5LMiGxLeYPfQzeEyJjW/CnmWUX7HA86CivLAcE1SOQ==
X-Received: by 2002:a05:600c:190a:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49ce1f13dd6mr5345715e9.4.1788253767752;
        Tue, 01 Sep 2026 02:09:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c425cesm3825273f8f.6.2026.09.01.02.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:09:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 0/2] Support spread spectrum clocking for i.MX8M PLLs
Date: Tue,  1 Sep 2026 11:05:16 +0200
Message-ID: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
boards using i.MX8MN and i.MX8MP.

Changes in v11:
 - Add patch "clk: validate spread spectrum configuration" to reject
   invalid parameters in the clk core before they reach the providers.
 - Fix issues claimed by Sashiko. See the details in the patch changelog.
 
Changes in v10:
- Drop patches 1-22, superseded by the generic spread spectrum clocking
  support from Peng Fan, merged in 7.3, so the i.MX8M specific infrastructure
  is no longer needed. This patch is now based on the following commits:
  - ae794aa6e88d ("dt-bindings: clock: Add spread spectrum definition")
  - c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
  - a7f16660af39 ("clk: conf: Support assigned-clock-sscs")
  - 7d98de6ffdab ("clk: Add KUnit tests for assigned-clock-sscs")
  https://lore.kernel.org/all/20260826165611.236321-1-sboyd@kernel.org/

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (2):
  clk: validate spread spectrum configuration
  clk: imx: pll14xx: support spread spectrum clock generation

 drivers/clk/clk.c             | 14 +++++++
 drivers/clk/imx/clk-pll14xx.c | 79 +++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

---
base-commit: 786262be6048deab760f68c8acc2c85607165894
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0

