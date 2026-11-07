Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794051196;
	b=SS0caDPbZFyd6+59Uy268EmuLb/wiuUNLvLepwNwq1bNgi/IuktLz2sWWiwjZjeCUD2m
	 8rZ9z5pA+FWYGXiqit4Tq0h41/RNVY5vh5j8MBNr+5gqcK2LmH3E72hK3jJtHpqY3ESUF
	 xycWg5OjuBvwFogNHEyPrSAMn1+MIL46DLBJKWNVheavPI9M+eFnFlfPCdPSA3ayMi360
	 ff8/0pdeVSi82BdixMMFMLUkErhx6H1x9wOCk2jcLyXsK/ueSKoQ2iwukyADrgsI+apjn
	 Ny0ZYypT7Xd1dfzvrrayFsHF2/m9zQSeiEHcmI6/89TzhYQwZBbUcp3Q/xr+243QfOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794051196;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id;
	bh=HnpzxKYD+zh17vZd5RepzSXXXkCuiP23wkJrmaklCT8=;
	b=L9x+g3BEPII2Krh6HWp0s7FZnFEoTXlAYCwG+nAk716ejZ2TSPNVI2hEqVCL3u26M95J
	 3KnCIbX8rd/Ck1NuxdA+r9W75TWUUgbp+CkHxIcSF05znf16M2lddXUvepcbnjECDTdub
	 syvwdTffFeDLMngDG3DS4DXX04qki1KIKkmINYuiN0Wqb0hqiPAmTZKrsOPLxWqlMLWpz
	 vgNKkNkUxy/gRQnj6hWOPYkj80NN7pCNScrzMAduvoIktDfZazmmP3ijYK2pezHGOxZ7l
	 Q/XZ9cAOdlPCkYX2FiVirWOLiwfDEWDy4mL6uRVhD0wU0hnD2pJKfyXYYC7PUvLPU3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nf91rxL7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A9E606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nf91rxL7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3503E1F0089F;
	Sat,  7 Nov 2026 11:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794051195;
	bh=HnpzxKYD+zh17vZd5RepzSXXXkCuiP23wkJrmaklCT8=;
	h=From:To:Cc:Subject:Date;
	b=nf91rxL7QAjxmAC6+JSOukGfiL6i6r2yugvg79IRL6lHrejNj+hnIKXGZ5poUiqkV
	 qPMdVhfva4s704k0PoQRtcrJ+2NgnA9eRmmbJ11wItW1m7Ms2wn8Lqme3jpa4eks1j
	 EscCE3i5CdZYwSx9Or3zSlfdqueaeXVHCsPnVS0dDivu9ARxdPtBhDvIvdGen8t5n7
	 pplH3NojHUKbIMJxKLhkJwg2weRcE7kqLTUDq8fS9kXDPNI1mCm5gJpDW4pDR25Q/i
	 MK6CpMLNYAaasbBGidmbTDiO14wumn/XZ/Sor9tABQEr5chQNrA/Q+CQ5QUtUSOVHp
	 Q1d5xil5npUEw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id F27D128F32FB; Sat, 07 Nov 2026 11:33:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator fixes for v7.4-rc1
Date: Sat, 07 Nov 2026 11:32:40 +0000
Message-Id: <20261107113312.F27D128F32FB@traversing.sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.4-rc1

for you to fetch changes up to 7904338c38426d72c5f7cd9402cb9a20232a7af5:

  regulator: mt6363: Fix register access and VEMC voltage handling (2026-11-02 18:02:22 +0000)

----------------------------------------------------------------
regulator: Fixes for v7.4

A small collection of mostly fairly standard driver specific fixes.  The
mt6363 changes are a little large but are the result of two independent
users running into the same issues and testing each other's changes so
given that it's only -rc1 it seemed sensible to take the changes as
fixes.

----------------------------------------------------------------
Alexandre Mergnat (2):
      regulator: mt6363: Use 8-bit register values
      regulator: mt6363: Fix VEMC voltage selection

Dmitry Baryshkov (1):
      regulator: qcom_spmi: don't take a sleeping lock in the SAW IPI

GIBEOM LEE (이기범) (1):
      regulator: mt6363: Fix the registers of the VSRAM CPU and APU LDOs

Mark Brown (1):
      regulator: mt6363: Fix register access and VEMC voltage handling

 drivers/regulator/Kconfig                  |   1 +
 drivers/regulator/mt6363-regulator.c       | 156 ++++++++++-------------------
 drivers/regulator/qcom_spmi-regulator.c    |  35 +++++--
 include/linux/regulator/mt6363-regulator.h |   1 +
 4 files changed, 81 insertions(+), 112 deletions(-)
