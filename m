Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DC430EF8F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792358234; cv=pass; b=ut92KcCo0akP3yXUNhQHjBnWA27m9rOHTFdOARklmkK2O9I76idv52LxiSnLM+nbznTsk/SWVuKzFclN12IcBz/jxWGe2GVJ/0VVzMbynfx0lGwa6HdCYO75GE3S7BrH/caeRP2j9+o8PRQc9Vo6jBI0KHwjbTx/Gix7JVkUF+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792358234; c=relaxed/simple;
	bh=PqtNMasepIO9YacdMGYuJbx13ovqIavjJ/qBmC4bwa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=df1KUuzKpxF6XkGPQ489G0yrn5t5F16OTl2pUm5XFYQnNja/DHFzTpTZoUIEJ3SP+bquMRlHkQiucHtj0Oym3kKF5ze/7GVDPI70R9YGOWCx5z5eq8ZzeKO28XXgVIT+u9tpX10BhW6qAVplw1tMb29rJ4IlTy+RbG/clbAGrDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eo15CoT+; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eo15CoT+"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6798eb0d190so1185083d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792358227; cv=none;
        d=google.com; s=arc-20260327;
        b=rXnWR1kNTSzIbd4xC6WhoEEqdV5PasWYoDUKXM2bQHxlyNh9zsegePJYitW6ZJRNo4
         e9vUN1vZTDnbPW7lI3hrsKSmBgnjae6BlhQmsn8q3Tpl2cm4UeVKqCkjBmZAHkoSCiN1
         0C9TGDO9o1al82GTFKq5WXSGukbzgBkUFla3KjOLCytUjmWe/0BVziNm2YH+SJYss1vd
         H2TXLH8N7qbmD2rKfGO4MkGzYgI96UC+Zzdq3ZBQAnkCuYvXMvEcBu/RJy6Xg+JlRPPM
         3YSEDW1Sk4PJoaEQgYjZCybZvTGIgzxc+qJHtH+F9dOhJbinlKHmO477T/q3cBFpT1Hk
         Vn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KrNYnqPQ+SlBkmRO6PY6MJGq6BIBt5+rihjajz8ZlPk=;
        fh=F2LlmQ717zR2wlySguB51g39TTsbKlUX3tHgN6kDR/k=;
        b=hVhS/o5YvSDjNaRMMHCLq+qNjnsEFhWjv2gzViBc0P/mETgt4ZDD5GxcuXy48BERGv
         xz//Dc1pkle3TvTRbdyfzT+zHEdJYkvj5F84vNkrexL3hJ7CoM8noJ8All/ac6egOUPp
         y4owVEZKskgr3uSakMORgk1YjoYkGzNoB3T/AIGt/PSaUctFRoc5vu7+qqCxL6DnUc5s
         FrsX4ZwpUH0BlU0DYczt/ca8yLp8JFghJXzIeKWIofeuJsxIDIzX6UH5ib/Fv6Cr7Ab3
         Xhwv4qRuZALPM0VLNtRpu+mK7jJJi5XMKICxrP696M9ZX6i7+lpIm/ur3k9jb/WZZyMu
         8Yaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792358227; x=1792963027; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KrNYnqPQ+SlBkmRO6PY6MJGq6BIBt5+rihjajz8ZlPk=;
        b=eo15CoT+8IcxsR8kel9x06kajdy4xcFXiwckdx5D5mhyI3zaRfdysjnjivgZN03SOJ
         fntRd7KRIjF7C2DE4MsDY7ecdtRSQgANlSDi8TXC0vCaIBU1n+rAmogjRD1RgY2SGWkb
         UlPO76aoi+xby3BAoW6Qh17sbvoRy5zp8mjpXJEAqrjmkC7d0Zq8eNq96p3qS2jv7pit
         1IRvIvlpSLv6Quif5btQd9rUFM3RlFCiJsdYW8p7hDc3XhGz6+vFYEcrLchSWjmLd7Ss
         +JAez0d100gGVh6HZ8zTOJiXV87Qu+8BXut/e7TuqspZcDDqxNKRovPu9aZ6a+Zu05bh
         5OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792358227; x=1792963027;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KrNYnqPQ+SlBkmRO6PY6MJGq6BIBt5+rihjajz8ZlPk=;
        b=sJ8Fcn6ou7s0eOsvO+Y1DLw1sWEGejQUeYeAXsMGsbNVM81/HNxhAqYcA4we9d3ZyL
         KsotWOeYFEG++Xupe5i/fVpfR5ht/AvXKHcTgWcsMH/DQY6ZwLkMzQKwu70aYg4/dS0T
         q3g8g/H6K+d4yqOqxO9mRfS0QUdLWAgMo25gTh/77gbQNC7yXtv2okmDNvO2fdUWAd8s
         l9B57qFszS2STk6uam9SThuI8cj5z4gfVTgR6WuaRTQdj0qn0oEUkCNsOX/lD5kR4P83
         2Qw3ZEwbiEF9yRy7HDMtEC6JEaQEMEYKkaIfUml4ogNKDVLXuM5Sj/L32/+Wni+SHyC4
         L1Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxmfuBrD9itKNMnQIFk4v4hisnQuhsFEw4kRERHX7zvNi6mdodOaWgc9R1dn5ZgQiCfvUjFSc7HkbQnUTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeWIcFO+wOQp4piIb9+/rVFYcmR7D7koN67xbnzNUpueYvuZ5V
	uPxMYAykPC+Qyh87JXK9214+VRxzABmX7q5r5SsHuVOip8oBpjiaKIcHf6IjEAs9lntgxldKXvN
	GClgsuB4J9Ga8pFZdC/yeXUDpHcyDkdk=
X-Gm-Gg: AYBFou3mEMF/yAVAHfa1uGEzftwS9n6I+288PSRkE/MfJhzyfB5evCkNNoHbS62RLim
	eZkQW7b8kUh2TlQE3TBziwvws6RcpiQGW/Ct3QOEcZg30e9Ni4IVnEeD6Dpvte2lsFfW5a9qL2u
	B8qJUAr1T4Gfp/NGVAYwsbrEyRNtrDFJqwplnetUfKJDgt3Z7mfIZibSvybIPa+GCMWAjh2BvJp
	BauQCtzDKQlgA9mUehPccJt4gx6HrbFvgC3/auothvCyGK/kbkx4TSr16hGSC8jQJomJPWNQDSg
	ZImGcHIBgzNuDyaaZRSvggOCpuwwkc8SLHtLMx5hy3BVwJJdwO1eQlLIrDklL+AfBEbvXM9DUDh
	7MKrAv5HSWgAV
X-Received: by 2002:a05:690e:1448:b0:671:4cca:b8ce with SMTP id
 956f58d0204a3-679ca832860mr1864709d50.61.1792358226608; Sun, 18 Oct 2026
 14:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
 <aphFhDMOmtTtmoeY@lizhi-Precision-Tower-5810>
In-Reply-To: <aphFhDMOmtTtmoeY@lizhi-Precision-Tower-5810>
From: Allen <allen.lkml@gmail.com>
Date: Sun, 18 Oct 2026 14:16:53 -0700
X-Gm-Features: AclHuK-x4hxzrQZEDbbZc-GV1CxSgGshJEe0XYvDToXQDGG1IVSHwec79vUQUzg
Message-ID: <CAOMdWSJ_yUR2TVgqvn1O_6vzs9EsWqYrL--fF7D8ipQSGP204w@mail.gmail.com>
Subject: Re: [PATCH v3 00/34] dmaengine: migrate channel tasklets to WQ_BH
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

> >
> > This series moves DMAengine client completion bottom halves from private
> > tasklets to a common per-channel API backed by WQ_BH.
> >
> > The first patch introduces the dmaengine_*_bh() API with a tasklet backend
> > and converts virt-dma to it. It also updates every driver that directly
> > accesses the removed virt_dma_chan tasklet, keeping the patch buildable on
> > its own. This separates the driver-facing API from its implementation
> > without changing callback context.
> >
> > The second patch switches that backend to a dedicated WQ_BH | WQ_PERCPU
> > workqueue. WQ_BH keeps callbacks in softirq context, while the common API
> > centralizes initialization, scheduling, and synchronization. The
> > workqueue helpers remain internal to DMAengine, and dmaengine_kill_bh()
> > drains scheduled callbacks to preserve tasklet_kill() semantics.
> >
> > The remaining patches convert driver-owned channel completion tasklets.
> > Tasklets used for controller-level processing, recovery, or other
> > non-client-callback work are deliberately left alone because the
> > appropriate replacement may differ by driver.
> >
> > As agreed in the RFC discussion, selecting hardirq callback delivery is a
> > separate API change and is not part of this series.
> >
> > Earlier discussion:
> > https://lore.kernel.org/all/20260108080332.2341725-1-allen.lkml@gmail.com/
> >
> > v2:
> > https://lore.kernel.org/all/cover.1785183549.git.allen.lkml@gmail.com/
> >
> > Changes since v2:
> > - rename the new public helpers and callback type from dma_chan_* to
> >   dmaengine_* as requested by Vinod
> > - update all direct virt_dma_chan tasklet users in patch 1, fixing the
> >   intermediate build failures reported by Sashiko
> > - fold the resulting 30 empty teardown patches, reducing the series from
> >   64 to 34 patches without dropping any driver changes
> > - rebase from Linux 7.2-rc5 to d58772d8520c (latest Linus master)
> >
> > Review tags retained on unchanged standalone patches:
> > - 09/34 IOAT: Acked-by Dave Jiang
> > - 17/34 STE DMA40: Reviewed-by Linus Walleij
> > - 27/34 PLX DMA and 34/34 Switchtec: Reviewed-by Logan Gunthorpe
> >
> > Review tags received on v2 patches now folded into 01/34:
> > - v2 41/64 HSU: Reviewed-by Andy Shevchenko
> > - v2 60/64 BAM DMA: Acked-by Bartosz Golaszewski
> >
> > The HSU and BAM DMA changes remain in 01/34, but those patch-specific
> > trailers are not attached to the substantially broader 35-file patch.
> > Andy and Bartosz are copied here and on 01/34 for visibility.
> >
> > Testing:
> > - x86_64 olddefconfig, make -j$(nproc) W=1 drivers/dma/
> > - the same DMA build with patch 1 applied independently
> > - scripts/checkpatch.pl --strict on all 34 patches
> >
> > Allen Pais (34):
> >   dmaengine: add tasklet-backed channel BH helpers
> >   dmaengine: back channel BH helpers with WQ_BH
> >   dmaengine: apple-admac: use dmaengine BH callback
> >   dmaengine: at_xdmac: move irq bottom half to dmaengine BH
> >   dmaengine: ep93xx: hook callbacks via dmaengine BH
> >   dmaengine: fsldma: migrate tasklet to dmaengine BH
> >   dmaengine: fsl_raid: run completions via dmaengine BH
> >   dmaengine: imx-dma: flip per-chan tasklet to dmaengine BH
> >   dmaengine: ioat: convert cleanup tasklet to dmaengine BH
> >   dmaengine: mmp_pdma: replace per-chan tasklet with dmaengine BH
> >   dmaengine: mmp_tdma: hook completions to dmaengine BH
> >   dmaengine: mv_xor: convert irq tasklet to dmaengine BH
> >   dmaengine: mxs-dma: use dmaengine BH scheduling
> >   dmaengine: nbpfaxi: switch callbacks to dmaengine BH
> >   dmaengine: pch_dma: convert tasklet to dmaengine BH
> >   dmaengine: ppc4xx: replace irq tasklet with dmaengine BH
> >   dmaengine: ste_dma40: convert per-channel tasklet to dmaengine BH
> >   dmaengine: xgene-dma: wire descriptor cleanup to dmaengine BH
> >   dmaengine: xilinx-dma: use dmaengine BH instead of tasklets
> >   dmaengine: xilinx-dpdma: kill vchan BH on remove
> >   dmaengine: zynqmp-dma: switch completion tasklet to dmaengine BH
> >   dmaengine: tegra20-apb: use channel BH helpers
> >   dmaengine: timb_dma: route callbacks via channel BH
> >   dmaengine: txx9dmac: route callbacks via channel BH
> >   dmaengine: mv_xor_v2: use channel BH helpers
> >   dmaengine: mpc512x: route callbacks via channel BH
> >   dmaengine: plx_dma: use channel BH helpers
> >   dmaengine: sf-pdma: route error callbacks through channel BH
> >   dmaengine: pl330: route callbacks via channel BH
> >   dmaengine: altera-msgdma: use channel BH helpers
> >   dmaengine: dw: defer callbacks via channel BH
> >   dmaengine: hidma: defer callbacks via channel BH
> >   dmaengine: qcom-gpi: defer callbacks via vchan
> >   dmaengine: switchtec: use channel BH helpers
> >
> >  drivers/dma/altera-msgdma.c                   | 14 +--
> >  drivers/dma/apple-admac.c                     | 16 ++--
> >  drivers/dma/at_xdmac.c                        | 13 ++-
> >  drivers/dma/bcm2835-dma.c                     |  2 +-
> >  drivers/dma/dma-axi-dmac.c                    | 10 ++-
> >  drivers/dma/dma-jz4780.c                      |  2 +-
> >  drivers/dma/dmaengine.c                       | 89 ++++++++++++++++++-
> >  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  2 +-
> >  drivers/dma/dw-edma/dw-edma-core.c            |  2 +-
> >  drivers/dma/dw/core.c                         | 42 +++++++--
> >  drivers/dma/dw/regs.h                         |  1 +
> >  drivers/dma/ep93xx_dma.c                      | 12 ++-
> >  drivers/dma/fsl-edma-common.c                 |  2 +-
> >  drivers/dma/fsl-qdma.c                        |  2 +-
> >  drivers/dma/fsl_raid.c                        | 11 +--
> >  drivers/dma/fsl_raid.h                        |  1 -
> >  drivers/dma/fsldma.c                          | 10 +--
> >  drivers/dma/fsldma.h                          |  1 -
> >  drivers/dma/hisi_dma.c                        |  2 +-
> >  drivers/dma/hsu/hsu.c                         |  2 +-
> >  drivers/dma/idma64.c                          |  4 +-
> >  drivers/dma/img-mdc-dma.c                     |  2 +-
> >  drivers/dma/imx-dma.c                         | 26 +++---
> >  drivers/dma/imx-sdma.c                        |  4 +-
> >  drivers/dma/ioat/dma.c                        | 14 +--
> >  drivers/dma/ioat/dma.h                        |  3 +-
> >  drivers/dma/ioat/init.c                       |  2 +-
> >  drivers/dma/k3dma.c                           |  2 +-
> >  drivers/dma/loongson/loongson1-apb-dma.c      |  2 +-
> >  drivers/dma/mediatek/mtk-cqdma.c              |  2 +-
> >  drivers/dma/mediatek/mtk-hsdma.c              |  2 +-
> >  drivers/dma/mediatek/mtk-uart-apdma.c         |  4 +-
> >  drivers/dma/mmp_pdma.c                        | 13 ++-
> >  drivers/dma/mmp_tdma.c                        |  9 +-
> >  drivers/dma/mpc512x_dma.c                     | 74 +++++++++------
> >  drivers/dma/mv_xor.c                          | 12 +--
> >  drivers/dma/mv_xor.h                          |  2 -
> >  drivers/dma/mv_xor_v2.c                       | 20 ++---
> >  drivers/dma/mxs-dma.c                         | 11 ++-
> >  drivers/dma/nbpfaxi.c                         | 13 ++-
> >  drivers/dma/owl-dma.c                         |  2 +-
> >  drivers/dma/pch_dma.c                         | 14 +--
> >  drivers/dma/pl330.c                           | 18 ++--
> >  drivers/dma/plx_dma.c                         | 12 +--
> >  drivers/dma/ppc4xx/adma.c                     | 14 +--
> >  drivers/dma/ppc4xx/adma.h                     |  2 -
> >  drivers/dma/pxa_dma.c                         |  2 +-
> >  drivers/dma/qcom/bam_dma.c                    |  4 +-
> >  drivers/dma/qcom/gpi.c                        | 17 +++-
> >  drivers/dma/qcom/hidma.c                      | 18 +++-
> >  drivers/dma/qcom/qcom_adm.c                   |  4 +-
> >  drivers/dma/sa11x0-dma.c                      |  2 +-
> >  drivers/dma/sf-pdma/sf-pdma.c                 | 14 ++-
> >  drivers/dma/sprd-dma.c                        |  2 +-
> >  drivers/dma/st_fdma.c                         |  2 +-
> >  drivers/dma/ste_dma40.c                       | 13 ++-
> >  drivers/dma/sun6i-dma.c                       |  2 +-
> >  drivers/dma/switchtec_dma.c                   | 16 ++--
> >  drivers/dma/tegra186-gpc-dma.c                |  2 +-
> >  drivers/dma/tegra20-apb-dma.c                 | 18 ++--
> >  drivers/dma/tegra210-adma.c                   |  2 +-
> >  drivers/dma/ti/edma.c                         |  2 +-
> >  drivers/dma/ti/k3-udma.c                      | 12 +--
> >  drivers/dma/ti/omap-dma.c                     |  2 +-
> >  drivers/dma/timb_dma.c                        | 21 +++--
> >  drivers/dma/txx9dmac.c                        | 12 +--
> >  drivers/dma/txx9dmac.h                        |  1 -
> >  drivers/dma/virt-dma.c                        | 12 +--
> >  drivers/dma/virt-dma.h                        |  7 +-
> >  drivers/dma/xgene-dma.c                       | 19 ++--
> >  drivers/dma/xilinx/xilinx_dma.c               | 20 ++---
> >  drivers/dma/xilinx/xilinx_dpdma.c             |  1 +
> >  drivers/dma/xilinx/zynqmp_dma.c               | 19 ++--
>
> There are some dmaengine code out of drivers/dma tree. Do you plan to
> convert it also
>
> Frank

  Apologies for the delayed response. yes. There's a handful of
dmaengine client-completion
tasklets outside drivers/dma/ as well. Since this series is already
queued, I'd rather not grow
it further at this point. I'll send conversions for those as a
follow-up series once this lands.

Thanks,
Allen

>
> >  include/linux/dmaengine.h                     | 28 ++++++
> >  74 files changed, 482 insertions(+), 311 deletions(-)
> >
> > --
> > 2.43.0



-- 
       - Allen
