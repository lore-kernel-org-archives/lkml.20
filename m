Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316523;
	b=O66KRJzl67dKkAcR+Becp8WTtlFj/C3Cik3BSo6nLgXzWKAPIFRVxHF8rmB2sRTyeEa+
	 /6tb1cjV5ciWkGMrwnHgsQlmNb3DxSQFWrR7ooSU/1QZj0KgpR3I9kBhY5b7FF9cHP/1o
	 lW30nZFLAe9SANwlOivMNLsh4aIiOXMXlXcUgucbl9sKEcuiESoVWdd19+n+PZn1zZ5Cy
	 V6M0utK6JLnHgoT+PsaoZyZz/RqNMOdk4g3EA7/6s/GLhSRjlTssXSBW2ZIXtPOxOn5WM
	 wO6PqHPePdHQJBe8KiN2vOw/nkup2c9RMx/vxJtRBvIRi7tyoq7ODC7cWdKmcYmMVBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xALy9/3B3JmFvBeVlhVKJosdW61/lASfDzGu+28LETQ=;
	b=4TH4l2MpwlVJLiwAtX9FBXRdYkbM1OOGspwhkQakC+IxSmovMrBjJclxTrZupF15VzkY
	 +R94PgBl30875XzbvoA3R6ZYPMIy7MU4ogjhqJFn2e3D/8hbkbs+9j8oYiYBPDlbd8WqJ
	 6FmMS0Yd0CWOYp4Dfvk6VAjRDSWR4L+TAE+sIzTLpKaAQjM5P5KS5olLFKfEFI/8uZMM6
	 QG9U91ivuU6cvHoQfz/o/aBPOcdr12g+sBFACB7VUimgX42wC5DfZ3ZQ5alLtLnvG/sem
	 /jUiGFVyoBXhOFe6mswe5rRGxIWmhODV028nm8x/lvtwDA1mXyqAzhhvLWf+r2ZEXAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhCu2bBr;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583F0606A7C1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583F0606A7C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhCu2bBr
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1198049a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316523; x=1794921323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xALy9/3B3JmFvBeVlhVKJosdW61/lASfDzGu+28LETQ=;
        b=PhCu2bBrxUyvWeRsqj0Mlz09JVJ9KuKACyHaz++YQOBiOIdAe0WaaMT7bM44k+kuWu
         IYhSzvN99GZ3WdCOWnNKdRphG55uKOnJPEr1KwL/0T3wjRAisbM78sJnvSsB/ls5E6pG
         jLI3n6R2hji0LMIw9LKUuIqkKizComOkJv82qdAdNmnP7+3tP4Y9k3yGD9qXlZ4zS9iy
         plln8RMEmp/+kuda+0GBERAoO+9jlv2x72rS5Mn/nTXOGoVfYHT/+sf/ClP4bjOWCT5+
         Wcr4ttjkYIDYtWW+nNkUZxz934OmNznf+PmOOmzKc8gcKjDi0q+jGV0W2W2T30U0Akt7
         LpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316523; x=1794921323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xALy9/3B3JmFvBeVlhVKJosdW61/lASfDzGu+28LETQ=;
        b=kCzuc31sTBOyYwWd9AxoQXKUlV56ZYoTWBJ1u2JYmOmllnWYeREevfrtSh8u+JMco/
         SAAucSlWYKRMw+QyJ/qKNhwV21W817S2K/1EI42LCpQ+6isSv2kovSGt8qKGbBkjFKUU
         PqyDh0Jl3/PT5eOwtZ+iYTUMyJCNKzLbEamdoXKgSwWJytAfhCsVWuJ0QiCW9y557OWE
         MNVtISMMyYzfQsMafHQ0eynDLuqZWll/iSbR7fnlpyt2jn66hDDcBx93i5y7I+a20w4D
         iGnvflESS7cUACLcnxW5Zn1myVAXIjWwsnvbhkCMqHKmdT+1lRwqNdj8JWH83C/uAhsM
         5wwQ==
X-Forwarded-Encrypted: i=1; AL+hErHqz+nez89i9pZnvP8KuCpJvYQwPlUqffBagYycAuVj95ohTHyZ6EFDmvEJi3CLENLmNh5QTdl+SycUndY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rln/5M9mNcZ3MxuDVTsdLiNYtRstf3mpQ4v906QjpilUmXHis
	YGXRd5H/9VkLupyMCJJsDUD8aq3tsn0TBPoMJCnPaWmf33F0hm3EKEMl
X-Gm-Gg: AYBFou084YwJe/QbJhbOQXFVtbQ5cQYTDiuOr7uhDoH3ui03qDFxrFPrT6LQOmFmdTK
	hlVGowYWcyyxZbGohCwnyRhCXmvW0a8vhgv8oUeYKjUaujWZMH9ZBp3aoYsh5rXePgSeTuvGlVB
	34byY6wlLiUjf+nlZRjA0T0lFOqLN7lo1Af25qS86bc71iYutWZ3tqy6+Un2ty/7E/mbq42dU6U
	TNYmgrBgXiIz15ovJHAJR7C7cBO3yBg2uFM6PBPdL+rd5PZX6Ormqb2pu3L97l6blJBTKrS8STj
	oFFdbOodwRLEdiEuf8lw6BkEHLcpSnDvbahr8EXtEvO+h88B66Q3blffXYWJ3PwFodHYPx6LUPw
	CTagLMS0j0htB0JPFr8O4OZ/ILu4RY4P6rpVCLu8te7Kw+yVadypcaWiqOg6zcRGsSivTCv+0ho
	BLkfvAHZyWcCqrFeiAMMHKCgTkkAvQJChA14Fs3TI4ZEjh0pjqKNLzDBYFLrDhigVrv/GZDf9Vs
	eYEz3r/Zj0ZxTxJRe7E2O8PSfGDKbJUGfC/ZWS14Cfv7Uzl726fTAPOghf5pAQupQ0MCRzUc9bF
	OSBLUn/1hLV2WXRuZyeGVxoJ45jBDBc=
X-Received: by 2002:a17:90b:1d47:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3b166cf8ccfmr2706997a91.35.1794316522421;
        Tue, 10 Nov 2026 05:15:22 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:22 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dave Jiang <dave.jiang@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Logan Gunthorpe <logang@deltatee.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/33] dmaengine: migrate channel tasklets to WQ_BH
Date: Tue, 10 Nov 2026 05:13:00 -0800
Message-ID: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi Vinod, Frank and Arnd,

This series moves DMAengine client completion bottom halves from private
tasklets to a common per-channel API backed by WQ_BH.

The first patch introduces the dmaengine_*_bh() API with a tasklet backend
and converts virt-dma to it. It also updates every driver that directly
accesses the removed virt_dma_chan tasklet, keeping the patch buildable on
its own. This separates the driver-facing API from its implementation
without changing callback context.

The second patch switches that backend to a dedicated WQ_BH | WQ_PERCPU
workqueue. WQ_BH keeps callbacks in softirq context, while the common API
centralizes initialization, scheduling, and synchronization. The
workqueue helpers remain internal to DMAengine, and dmaengine_kill_bh()
drains scheduled callbacks to preserve tasklet_kill() semantics.

The remaining patches convert driver-owned channel completion tasklets.
Tasklets used for controller-level processing, recovery, or other
non-client-callback work are deliberately left alone because the
appropriate replacement may differ by driver.

As agreed in the RFC discussion, selecting hardirq callback delivery is a
separate API change and is not part of this series.

Frank asked about DMAengine users outside drivers/dma/ that still
open-code completion tasklets. Those will be converted in a follow-up
series once this one has landed, to keep this set from growing further.

Earlier discussion:
https://lore.kernel.org/all/20260108080332.2341725-1-allen.lkml@gmail.com/

v2:
https://lore.kernel.org/all/cover.1785183549.git.allen.lkml@gmail.com/

v3:
https://lore.kernel.org/all/cover.1786384168.git.allen.lkml@gmail.com/

Changes since v3:
- post as a new thread instead of in reply to v3 (Andy)
- rebase onto v7.4-rc2. The ste_dma40 rework merged for 7.4-rc1 added
  tasklet_schedule() calls in the d40_queue_start() error paths and a
  devm action that kills the channel tasklets; both now use the BH
  helpers. fsldma and mv_xor gained tasklet_kill() calls in their channel
  remove and error paths, which are converted as well. zynqmp_dma and
  altera-msgdma only needed context fixes. The new amlogic-dma driver and
  the new at_hdmac channel cleanup path kill the virt-dma channel tasklet
  directly and are converted in 01/33.
- drop the DW DMA patch (v3 31/34). Andy considers it unneeded churn
  ahead of a larger cleanup of that driver.
- pl330: initialize the channel BH at probe time instead of in
  alloc_chan_resources(). dmaengine_init_bh() warns when called on an
  already initialized channel, and channels can be re-requested.
- txx9dmac: channels served by the shared controller interrupt keep
  scanning descriptors from the controller tasklet. v3 scheduled a BH
  that was never initialized for them.
- timb_dma: recompute TIMBDMA_IER from the channel BH once the channel
  has been finished, and drain the channel BHs on remove and in the probe
  error path.
- mpc512x: drain the channel BHs in mpc_dma_remove().
- sf-pdma: reset the retry budget when abandoning a descriptor, and
  spell out in the changelog how the new error path mirrors the done
  tasklet (Frank).
- hidma: leave hidma_free() unchanged (Frank). Drain the BH in
  free_chan_resources() and in remove(), after killing the low-level
  completion tasklet and before hidma_ll_uninit(), and add a
  device_synchronize() callback.
- qcom-gpi: synchronize the vchan before the channel ring is freed, and
  add a device_synchronize() callback.
- collect Frank Li's Reviewed-by from v3. I kept it on patches that only
  picked up mechanical conversions from the rebase (01, 06, 12, 17, 21,
  27, 30). timb_dma, txx9dmac, mpc512x, pl330 and qcom-gpi changed
  enough that I have not carried his tag forward on those.

The driver changes above came out of going through the Sashiko reports on
v3. Most of what it flagged are pre-existing teardown and locking issues
in the individual drivers that this series does not make worse; those are
out of scope here.

Review tags retained on unchanged standalone patches:
- 09/33 IOAT: Acked-by Dave Jiang
- 17/33 STE DMA40: Reviewed-by Linus Walleij (the rebase only added the
  mechanical conversions mentioned above)
- 27/33 PLX DMA and 33/33 Switchtec: Reviewed-by Logan Gunthorpe

Review tags received on v2 patches now folded into 01/33:
- v2 41/64 HSU: Reviewed-by Andy Shevchenko
- v2 60/64 BAM DMA: Acked-by Bartosz Golaszewski

The HSU and BAM DMA changes remain in 01/33, but those patch-specific
trailers are not attached to the substantially broader 37-file patch.
Andy and Bartosz are copied here and on 01/33 for visibility.

Testing:
- build-tested on top of v7.4-rc2 with W=1 for drivers/dma/, with no new
  warnings compared to the base commit:
  - arm64, x86_64 and arm allmodconfig
  - powerpc 44x/katmai_defconfig + AMCC_PPC440SPE_ADMA,
    mpc512x_defconfig + MPC512X_DMA, mpc85xx_smp_defconfig + FSL_DMA, and
    the same with FSL_DMA replaced by FSL_RAID
  - mips rbtx49xx_defconfig + TXX9_DMAC
- every patch builds on its own (drivers/dma/) with the arm64 and x86_64
  allmodconfig configurations
- the series also applies cleanly on dmaengine/next (currently v7.4-rc1)
- scripts/checkpatch.pl --strict is clean on all 33 patches
- the sf-pdma and hidma changes are compile-tested only; testing on
  hardware would be appreciated

Allen Pais (33):
  dmaengine: add tasklet-backed channel BH helpers
  dmaengine: back channel BH helpers with WQ_BH
  dmaengine: apple-admac: use dmaengine BH callback
  dmaengine: at_xdmac: move irq bottom half to dmaengine BH
  dmaengine: ep93xx: hook callbacks via dmaengine BH
  dmaengine: fsldma: migrate tasklet to dmaengine BH
  dmaengine: fsl_raid: run completions via dmaengine BH
  dmaengine: imx-dma: flip per-chan tasklet to dmaengine BH
  dmaengine: ioat: convert cleanup tasklet to dmaengine BH
  dmaengine: mmp_pdma: replace per-chan tasklet with dmaengine BH
  dmaengine: mmp_tdma: hook completions to dmaengine BH
  dmaengine: mv_xor: convert irq tasklet to dmaengine BH
  dmaengine: mxs-dma: use dmaengine BH scheduling
  dmaengine: nbpfaxi: switch callbacks to dmaengine BH
  dmaengine: pch_dma: convert tasklet to dmaengine BH
  dmaengine: ppc4xx: replace irq tasklet with dmaengine BH
  dmaengine: ste_dma40: convert per-channel tasklet to dmaengine BH
  dmaengine: xgene-dma: wire descriptor cleanup to dmaengine BH
  dmaengine: xilinx-dma: use dmaengine BH instead of tasklets
  dmaengine: xilinx-dpdma: kill vchan BH on remove
  dmaengine: zynqmp-dma: switch completion tasklet to dmaengine BH
  dmaengine: tegra20-apb: use channel BH helpers
  dmaengine: timb_dma: route callbacks via channel BH
  dmaengine: txx9dmac: route callbacks via channel BH
  dmaengine: mv_xor_v2: use channel BH helpers
  dmaengine: mpc512x: route callbacks via channel BH
  dmaengine: plx_dma: use channel BH helpers
  dmaengine: sf-pdma: route error callbacks through channel BH
  dmaengine: pl330: route callbacks via channel BH
  dmaengine: altera-msgdma: use channel BH helpers
  dmaengine: hidma: defer callbacks via channel BH
  dmaengine: qcom-gpi: defer callbacks via vchan
  dmaengine: switchtec: use channel BH helpers

 drivers/dma/altera-msgdma.c                   | 14 +--
 drivers/dma/amlogic-dma.c                     |  4 +-
 drivers/dma/apple-admac.c                     | 16 ++--
 drivers/dma/at_hdmac.c                        |  2 +-
 drivers/dma/at_xdmac.c                        | 13 ++-
 drivers/dma/bcm2835-dma.c                     |  2 +-
 drivers/dma/dma-axi-dmac.c                    | 10 ++-
 drivers/dma/dma-jz4780.c                      |  2 +-
 drivers/dma/dmaengine.c                       | 89 ++++++++++++++++++-
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  2 +-
 drivers/dma/dw-edma/dw-edma-core.c            |  2 +-
 drivers/dma/ep93xx_dma.c                      | 12 ++-
 drivers/dma/fsl-edma-common.c                 |  2 +-
 drivers/dma/fsl-qdma.c                        |  2 +-
 drivers/dma/fsl_raid.c                        | 11 +--
 drivers/dma/fsl_raid.h                        |  1 -
 drivers/dma/fsldma.c                          | 12 +--
 drivers/dma/fsldma.h                          |  1 -
 drivers/dma/hisi_dma.c                        |  2 +-
 drivers/dma/hsu/hsu.c                         |  2 +-
 drivers/dma/idma64.c                          |  4 +-
 drivers/dma/img-mdc-dma.c                     |  2 +-
 drivers/dma/imx-dma.c                         | 26 +++---
 drivers/dma/imx-sdma.c                        |  4 +-
 drivers/dma/ioat/dma.c                        | 14 +--
 drivers/dma/ioat/dma.h                        |  3 +-
 drivers/dma/ioat/init.c                       |  2 +-
 drivers/dma/k3dma.c                           |  2 +-
 drivers/dma/loongson/loongson1-apb-dma.c      |  2 +-
 drivers/dma/mediatek/mtk-cqdma.c              |  2 +-
 drivers/dma/mediatek/mtk-hsdma.c              |  2 +-
 drivers/dma/mediatek/mtk-uart-apdma.c         |  4 +-
 drivers/dma/mmp_pdma.c                        | 13 ++-
 drivers/dma/mmp_tdma.c                        |  9 +-
 drivers/dma/mpc512x_dma.c                     | 78 ++++++++++------
 drivers/dma/mv_xor.c                          | 14 +--
 drivers/dma/mv_xor.h                          |  2 -
 drivers/dma/mv_xor_v2.c                       | 20 ++---
 drivers/dma/mxs-dma.c                         | 11 ++-
 drivers/dma/nbpfaxi.c                         | 13 ++-
 drivers/dma/owl-dma.c                         |  2 +-
 drivers/dma/pch_dma.c                         | 14 +--
 drivers/dma/pl330.c                           | 19 ++--
 drivers/dma/plx_dma.c                         | 12 +--
 drivers/dma/ppc4xx/adma.c                     | 14 +--
 drivers/dma/ppc4xx/adma.h                     |  2 -
 drivers/dma/pxa_dma.c                         |  2 +-
 drivers/dma/qcom/bam_dma.c                    |  4 +-
 drivers/dma/qcom/gpi.c                        | 27 +++++-
 drivers/dma/qcom/hidma.c                      | 24 ++++-
 drivers/dma/qcom/qcom_adm.c                   |  4 +-
 drivers/dma/sa11x0-dma.c                      |  2 +-
 drivers/dma/sf-pdma/sf-pdma.c                 | 18 +++-
 drivers/dma/sprd-dma.c                        |  2 +-
 drivers/dma/st_fdma.c                         |  2 +-
 drivers/dma/ste_dma40.c                       | 29 +++---
 drivers/dma/sun6i-dma.c                       |  2 +-
 drivers/dma/switchtec_dma.c                   | 16 ++--
 drivers/dma/tegra186-gpc-dma.c                |  2 +-
 drivers/dma/tegra20-apb-dma.c                 | 18 ++--
 drivers/dma/tegra210-adma.c                   |  2 +-
 drivers/dma/ti/edma.c                         |  2 +-
 drivers/dma/ti/k3-udma.c                      | 12 +--
 drivers/dma/ti/omap-dma.c                     |  2 +-
 drivers/dma/timb_dma.c                        | 41 +++++++--
 drivers/dma/txx9dmac.c                        | 10 +--
 drivers/dma/txx9dmac.h                        |  1 -
 drivers/dma/virt-dma.c                        | 12 +--
 drivers/dma/virt-dma.h                        |  7 +-
 drivers/dma/xgene-dma.c                       | 19 ++--
 drivers/dma/xilinx/xilinx_dma.c               | 20 ++---
 drivers/dma/xilinx/xilinx_dpdma.c             |  1 +
 drivers/dma/xilinx/zynqmp_dma.c               | 19 ++--
 include/linux/dmaengine.h                     | 28 ++++++
 74 files changed, 503 insertions(+), 316 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

