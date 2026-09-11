Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7B279DAF;
	Fri, 11 Sep 2026 03:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097279; cv=none; b=mzRFt1FCW+SSuZ/yZkWJe0PaCWb8c0VAgpkh3r6mjlHTcK1gobE3eYtPhSIHjv/zcJniyTLVWEE1URgEaOJfnKyWpvj3gnFoybNZX7eCJ/HALW80YFmZMbJcqDOw1zowLGa1dOgTNuAbOTiUUocwKH+6BmxQU3jUcTZ3i5BwS4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097279; c=relaxed/simple;
	bh=dWuFXKTDKxD3wMoKwKzfgBU03Jmf30boKdpdxHzuHuw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NfbuIxmuRRVEhDBY94mnB+rQVrq5FNP93xGHQ2LJp1aYnTTifLcq7J4mjSPQPRXp31B1b0/l6xQqw65Rym4VrmAZyfvhfEong1eyy9/e1vX8xH8TDaSqBL5ZL8tl9EEZdYayUaJf4UGtdS0ZrBlue69UD7nLzb9OZnKjnMwHp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOqrtC/i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOqrtC/i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582441F000FF;
	Fri, 11 Sep 2026 03:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097277;
	bh=S9ZL8gXFgJqiskXHicHGLASvBh5QA9FwPPVdwmC2QNQ=;
	h=From:Subject:Date:To:Cc;
	b=UOqrtC/iqJPmJBaQBRFzBwLv2zdHHTCN7JJM3aqF+clJQVNp3rZ9AOx0EjRjunjaw
	 7NpcJfvsx1ZuvJTacqO3mt8h1UTIU2IU1WEVoOKJP5dxq66MNvPGaEcGzccI+tZlOm
	 JmrpV1AJdiX4EGgBSn2j3jVTccf2vV+HftfOMfRG5peNme1hBwbI7lNxNU76u30LsJ
	 ZGo+UDKY8vJ5YqmMB9+jobYQrY4pcjFSNclAHQFBZp1YT9yvT7xr1u1wwA52Uti1uN
	 OF182eHi4oahdRD05RdaTRjERPf9/moY2EqONnE583aypihiZK/Y28EjjebH+NIxY1
	 Gld69vS5DWuog==
From: Guo Ren <guoren@kernel.org>
Subject: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it consistently
Date: Fri, 11 Sep 2026 03:27:08 +0000
Message-Id: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAx1o2oC/z2M0QqCMBRAf0Xuc5NtjC176j8iwvROb+UmdxqC+
 O/Ngh4PnHNWSMiECU7FCoxvShRDBn0ooOnr0KGgNjNoqa2slBI00m2oF+G9U4h1661vIdsjo6f
 le7pcf5zm+wObac93w3McxNRzjv7Ho7LSSWmqUsvKGaOFEt0cGcP5iRzwVUbuYNs+2oEHo6gAA
 AA=
X-Change-ID: 20260911-ipi_max-ff71eeadf6fd
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16.0

This series removes the implicit assumption that RISC-V supports exactly
eight IPI message types.

Currently, the SBI, CLINT and ACLINT SSWI IPI providers use
BITS_PER_BYTE when sizing the generic IPI mux, while IMSIC carries a
separate IMSIC_NR_IPI definition set to 8. These values happen to match
IPI_MAX today, but neither is the proper source of truth for the number
of RISC-V IPI message types.

Move enum ipi_message_type to asm/smp.h so IPI providers can use IPI_MAX
directly, then replace the BITS_PER_BYTE and IMSIC_NR_IPI uses with
IPI_MAX.

This also makes adding future RISC-V IPI message types independent of
the current eight-entry assumption.

A follow-up patch renames the MediaTek VPU mailbox terminator from
IPI_MAX to IPI_VPU_MAX. That token belongs to the VPU firmware IPI id
enum and should follow the same prefixed convention as IPI_VPU_INIT
(and SCP_IPI_MAX on the SCP side), instead of reusing the generic
IPI_MAX name.

---
GUO Ren (XuanTie) (4):
      clocksource: clint: Use IPI_MAX for IPI muxing
      irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
      irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
      media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX

tip-bot2 for GUO Ren (XuanTie) (2):
      riscv: smp: Move enum ipi_message_type to asm/smp.h
      riscv: sbi: Use IPI_MAX for SBI IPI muxing

 arch/riscv/include/asm/smp.h                  | 12 ++++++++++++
 arch/riscv/kernel/sbi-ipi.c                   |  4 ++--
 arch/riscv/kernel/smp.c                       | 12 ------------
 drivers/clocksource/timer-clint.c             |  4 ++--
 drivers/irqchip/irq-aclint-sswi.c             |  4 ++--
 drivers/irqchip/irq-riscv-imsic-early.c       |  4 ++--
 drivers/irqchip/irq-riscv-imsic-state.h       |  1 -
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 12 ++++++------
 drivers/media/platform/mediatek/vpu/mtk_vpu.h |  4 ++--
 9 files changed, 28 insertions(+), 29 deletions(-)
---
base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
change-id: 20260911-ipi_max-ff71eeadf6fd

Best regards,
--  
GUO Ren (XuanTie) <guoren@kernel.org>

