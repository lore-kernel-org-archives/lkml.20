Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555402;
	b=ubdmsFxQX9evrbRt66eo/ywQ+tzMz1/nGzh1OvTR0xlJ+XV7nOQtYdMUeQun5QeAa8m9
	 kNkU9yQBcQAF4pWMGGzq70NCK56EsRSq9rF+mxSp0nzUhdu20KMCpPq6iMmEn6AHZ6D0S
	 7neLZayfftda5OrE9SBBoZfu7HR0KbZB4eMGMfzT5zVp1E5qW/243Gz2pEtyh5yKxdwEt
	 uuHhdC53NqH4db5S8wLdOlTyihXvU1pAERI80YvSiRH8uCr9PPp/Rmy6J0oEYm9ZygJai
	 Yafp5kvMYORsplxHzWW5NA6OrgGnpEDQf6/N3tEwGIdyGkl9eiAH9P/QlA9mWDs2wxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555402;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=BHtfXCiI/3J7we5i2m8+PEigqbS+6waVrqmdGce1Xfk=;
	b=iBYzY0MYPgcFK+l/BntoKgcx455bdQlubRLIxhXz+SLo66jowXTTPqfGqHPteMZMGdCn
	 hKwslKZScva2TuiKzol8KYULAlMGhgz6xkAH0LHUhzRdeLqDjDm287ueIWL81qhicR1F9
	 5maF0wlKiNkN3F2mh+S1Wk5f8cNQvhlUMZ5WFuDVSgEpLdCG9n64ga7ydt/inLO0R+LMG
	 xTW3xOn43yEX9wPDo2vj0y3ezRJt5yuhllsEfjBzOVc8jdBL4sZMIBSWrVGpjf0LOiSyj
	 5VlkLUtxLA/QRRwiCf2xAoWsjptW7LSVawKFI3/0oOy/feoJsdAJJ2vbSHxuXT9kijQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ia0ArtiP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E65606A31C;
	Fri, 13 Nov 2026 07:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ia0ArtiP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604041F000C4;
	Fri, 13 Nov 2026 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794555402;
	bh=BHtfXCiI/3J7we5i2m8+PEigqbS+6waVrqmdGce1Xfk=;
	h=From:To:Cc:Subject:Date;
	b=ia0ArtiPxqaEIvSgZboGIhlwNKIhwzWC0+xMMspLjd49GGN502TVIVsNjTpO9G0ca
	 9woq5ZToytkFIiyQFTgKZ34MdW6LjE+t94HDUwN5pvodPzBxgEm+12N898+hkmeZVU
	 I8fsokab6Sw9l+rTyLPVI8nJUa/6LWonuYsENwzVcm47i+da6ERn0Hm/LZoE4Syu0m
	 /+74nyOowygEMzB+t5uszKEXQtCgcRO9qRXcS4NeY4ks70lJ1uD5MWHiAOIyiFSYzi
	 WnsACliUYetmGFtjbu6GQ4Z8BUln5THtNMlp4P/eI2/aa0Kh9b6kQsEm+D/z/LIxnR
	 sxqCtrNiqIA4A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memory: fixes: driver fixes for v7.4
Date: Fri, 13 Nov 2026 08:36:32 +0100
Message-ID: <20261113073632.34241-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2567; i=krzk@kernel.org; h=from:subject; bh=ZpzDHm6gT+qgra/rLO5sIUzhjSnwWAiDGTaAmcLwHNA=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9r4A4/2bxvDejOPDCBOuPOpbeJHpGcP5Ow6wS euUYLYqh3+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCava+AAAKCRDBN2bmhouD 1wYmD/90FubDxCCbR6nMKIeNFC6ofdn15f5h/LPhNACc6SsjPXMGRfdu5eJEreKIp+tQYiCUsd8 Vl7M4mjD84egJrQhSYY2nPZCqLzEnIfv+I3Lej6KlrlpvqewL4pswbnVlf38+LSpxFD/vfhScsz zUiCpJdVBVhD8fjzNNEVQHaE6bpXd9AKD1oEw6aL5QYk1e598WXael+RRAVb5byQ8fnTmz1ULqs GQv/Y32wYOa/FQNvStRdyCDUZxNupCnGQSoeSYp2yjdd8Ilv8KoFWyOfmwQhSnrJHuHwInYvzt9 y7KIbFUUGnMObEW3C4FlZhBihXRRzd2vX5fOcsHvibM3WoP8He9bMq5cJk0B6j7Az5432G5dY0d NLYQ8LC4UK9LhZWPam0jf10dTen6WiNN0nSehS9qmGmSCuKC9KQ+sIGpvEdoRZ8+ICgLftfQg7p GdaWnpCsB7PKnOj8Vcp838OxLWCJEEvYWT7D3x8jqGWwwIoGVN79leEFznOZ6RXxRjL6ulEPI+a m76f4Z5dlqBGgMb82mzuxTQcsRIOACdb1kGphoZEZCO0CnJI8i9rEyVQMWSuP6ny4hzQD2NVgNO iZy4F2BqcnsOFLiSnizLS7m2AJLoG5E8UZ+iVcXYRIKY74W6CH6pHvjDHZw+3IV8cD0ACiU5HAK BXoHk9/rU2wJO5A==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Arnd and SoC folks,

A few less and more important fixes.  Sashiko as usually exaggerates and calls
some of these "Critical" but exploitation likely requires already root
privileges, e.g. through device unbind.  Cannot rule out chaining
vulnerabilities these days, thus sending these as fixes.

Best regards,
Krzysztof


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-fixes-7.4

for you to fetch changes up to 1a509eca07176bc3363031c030d038ca9be9dfc0:

  memory: fsl_ifc: Do not dereference the unset global pointer in probe (2026-11-11 16:22:36 +0100)

----------------------------------------------------------------
Memory controller drivers - fixes for v7.4

A set of fixes for more serious looking issues reported by Sashiko,
although in practice these target only a very specific condition, like
probe/removal racing:

1. Tegra210: During probe error paths or device removal, disable timers
   before teardown to avoid theoreticall possible use-after-free.
2. Tegra186: Fix OF node reference leak.
3. Freescale IFC:
   - Fix possible probe error path use-after-free on unrequested NAND
     interrupt,
   - Fix possible use-after-free of a globally exported device control
     structure after device unbind, if used by out of tree drivers
     (in-tree drivers do not use that export).
4. Atmel EBI: Fix leaked SMC clock reference with missing enable/disable
   balance on probe failure (e.g. deferred probe).

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      memory: atmel-ebi: Disable SMC clock on probe failure
      memory: fsl_ifc: Clear fsl_ifc_ctrl_dev on probe failure and removal

Myeonghun Pak (1):
      memory: tegra: Shut down Tegra210 EMC timers before teardown

Runyu Xiao (1):
      memory: fsl_ifc: guard optional NAND IRQ cleanup

Sasha Levin (1):
      memory: fsl_ifc: Do not dereference the unset global pointer in probe

Selby Mashiki (1):
      memory: tegra: fix device_node leak in tegra186_mc_probe_device()

 drivers/memory/atmel-ebi.c               |  27 ++++++--
 drivers/memory/fsl_ifc.c                 | 107 +++++++++++++++++++------------
 drivers/memory/tegra/tegra186.c          |   1 +
 drivers/memory/tegra/tegra210-emc-core.c |  16 +++--
 4 files changed, 97 insertions(+), 54 deletions(-)
