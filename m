Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6554B47D926;
	Mon,  5 Oct 2026 11:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198276; cv=none; b=PXObUq+hlM0srVYBH1NzIZVzWfbvXvTDk7HaLKf22VeBC3FhNKdRs315r0IXgBbbwAN8NlWcN6nB/iA+mApe11CcqCzhvuqmknr4vjXMTuyro/wxZ1NbWv4M4y1RnxSQY5FSNPXuPc4mgf1S2xuR7nkdrsLSE9atCVy/yOKqOLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198276; c=relaxed/simple;
	bh=r9QOY3O2JMjozrFcWeL9WSb1mEHQftzj5pGsv5Fl7pA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nsGTvCBfUsTseHiouOSranBcnWlHkX9VP2H1fRrIub6A7mIBZuwYkp8kJWa1gzd1/S1vxGnr890iWh3D0YpyTGEZNoKJJ9mosD3BGUInfHXDxohBGnw5IfkWYAGuQNd5OMjOYnXkllnryRIFotj2G+tLMUf0CImB2rFSiwGMqh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZXXmjsG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZXXmjsG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7A51F00893;
	Mon,  5 Oct 2026 11:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791198275;
	bh=XgKj1qAkEBxnr/gqSQUFgn7O9TFS7TKhWyPEdAVH1w8=;
	h=From:To:Cc:Subject:Date;
	b=HZXXmjsGdY0SA/LHT/Lia7eGXTrIND/62TMyDyLi414mAu6KAuM7WqHAUW63qc18G
	 YBgKAK6UxjDJbMRBHMrnK/IWZVYiK+HIigz9DtAc1NWvbmAZLpBoJIvU6Ul/5ECR5d
	 kI0GbwuqWXJP7UCzXnkRbdhH1SioUa1WyIuxaCmIk/arulh/ZK6b1GpdrJ42AvLxdy
	 FhI2puZ3Z93es5y6zGUyX5fpXdoSwh/4dKCsXp7ya62o4sd6Vxf9s+FBSJRAsr9zWZ
	 f6DuNSLHD3L6AejUner+SiNlAqGVmnMsdjOM8P7djH831C+ogNPx+HCWjx0tr0iaVz
	 BThOxHYHvoWzw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memory: drivers for v7.4
Date: Mon,  5 Oct 2026 13:04:27 +0200
Message-ID: <20261005110427.41458-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3677; i=krzk@kernel.org; h=from:subject; bh=r9QOY3O2JMjozrFcWeL9WSb1mEHQftzj5pGsv5Fl7pA=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqw4Q7TD/2WfRKlrtBDpMBHS0k0bspKrcalDp6j x+UAd2poqyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasOEOwAKCRDBN2bmhouD 10ckD/9LNJCPgiH94Xq1x32bl9yw8SV4dQybiCXXdX/NoqhKz8HGwVjDVOFBZcwKn+BkNbfs4Vw aDeSUuzVlpJwLmzmQK6ylSy4e0DxQZaTtA34yQnMuOMf0l13FpbvKiSlTcmejs9lxND4VqrfEJx ZTWAp2ViyMVa3tic8fy0Qx+uopCi9laLVglR6PAKm2TUiokqq34j+mOriM9K9aikQpH+JCcBRw/ XkC9rzWzYBFTQo82s7Ybkugm5FxbPgJ7SegJdCLeO5iDOv7EUeDBEbhMBHwCCc2N3eMRWCFWigB wkpEHgvEyhFce2VQWJo0iqU5hdf46zl0uSOSeyupVTZqVQJGGjq6ZetMYVcsmO3JEzllm0q+NYY d7E3ZzMgh3BeAuiJlqIghkR0Sr2tR3mVtMpKpk/kUhm6rbpG9ExntlmfMfmezKq37CJul1Fmwqq +aX0sur32a1LReDL+EYGroFT+e8H7OvDueA5r4gcnF5Ei7jk0YuJJfXIwpUAj/PnPqT5WvtKDCm E3AZOFzAx4UnC8yrnZOibwY35m5tPY0omwSaQGObCzVLNulVrFM6gwGjndLja8Q1YoY83GMqvIz viO5D6hmGY/JvZ6sN7cC9Qi1Xb3l3ppJ+9IZI5DYXN/rI9k9EZu3/KbOc94cGCDvE2Y1fojShrw KyJBcVUfFelKwJA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Arnd and SoC folks,

Note that I do not treat untested, LLM-assisted fixes as critical fixes, thus
usually do not take them into fixes cycle.

Best regards,
Krzysztof


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-7.4

for you to fetch changes up to a22355280361d2a376a2020059a2bae11e6cea10:

  memory: stm32_omm: fix child clock leak on set_amcr() error path (2026-09-23 19:57:14 +0200)

----------------------------------------------------------------
Memory controller drivers for v7.4

1. Broadcom DPFE: Fix handling kernel memory accesses with malicious or
   compromised firmware and possible out-of-bounds read triggered by
   buggy co-processor.  Also validate firmware image contents before
   processing it.

2. Renesas RPC IF: One fix for volatile register access, several
   cleanups and enable autosuspend in runtime PM.

3. Several minor improvements and fixes for various drivers: TI EMIF,
   Samsung Exynos5422 DMC, Nvidia Tegra264 and STM32 OMM.  The fixes
   seems to be effect of LLM usage, thus they were neither reproduced
   nor tested, making them non-critical fixes.

4. Mediatek SMI: Add support for MT8189 SoC.

----------------------------------------------------------------
Diego Fernando Mancera Gomez (1):
      memory: stm32_omm: fix child clock leak on set_amcr() error path

Jiawen Liu (1):
      memory: exynos5422-dmc: handle clock enable failures

Justin Chen (2):
      memory: brcmstb_dpfe: Fix out-of-bounds access due to DCPU offset
      memory: brcmstb_dpfe: Bounds check DCPU-supplied MSG_ARG_COUNT

Kees Cook (1):
      memory: emif: Remove const from min_tck allocation type

Ketan Patil (3):
      memory: tegra: Use named defines for Tegra264 MC apertures
      memory: tegra: Parameterise Tegra264 MCF slice bound
      memory: tegra: Refactor Tegra264 mc-err code

Lad Prabhakar (6):
      memory: renesas-rpc-if: Mark XSPI_CDD1BUF0 as volatile
      memory: renesas-rpc-if: Move static bridge configurations out of dirmap hot paths
      memory: renesas-rpc-if: Consolidate XSPI_CDTBUF0 updates in write path
      memory: renesas-rpc-if: Consolidate XSPI_CDTBUF0 updates in read path
      memory: renesas-rpc-if: Consolidate command setup register programming
      memory: renesas-rpc-if: Use runtime PM autosuspend after transfers

Miles Krause (1):
      memory: emif: fix device_node reference leak on np_ddr

Pengpeng Hou (1):
      memory: brcmstb_dpfe: validate firmware section sizes

Thomas Huth (1):
      memory: emif: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

Zhengnan Chen (2):
      dt-bindings: memory-controllers: mtk-smi: Add support for mt8189
      memory: mtk-smi: Add MT8189 support

 .../memory-controllers/mediatek,smi-common.yaml    |  21 +-
 .../memory-controllers/mediatek,smi-larb.yaml      |   3 +
 drivers/memory/brcmstb_dpfe.c                      |  41 ++-
 drivers/memory/emif.c                              |   6 +-
 drivers/memory/emif.h                              |   4 +-
 drivers/memory/mtk-smi.c                           |  45 +++
 drivers/memory/renesas-rpc-if.c                    |  87 ++---
 drivers/memory/samsung/exynos5422-dmc.c            |  11 +-
 drivers/memory/stm32_omm.c                         |   2 +
 drivers/memory/tegra/tegra264.c                    | 392 +++++++++++++--------
 10 files changed, 398 insertions(+), 214 deletions(-)
