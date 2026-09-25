Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BEA3AE6FC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355375; cv=none; b=lVB2S5Wio8CPc6HpMNd4UGF9V3zwA72aMQN+Lmj3P8xXwfVEQaz4XFkgj3D1naIPdOkRHNckthVHmOKF8rSnubMlf30/ev/RH97SmgHQTVO2Anf8qCRO8trDjPInLY6qJjj8UYAc38yiTOjGADvqOFqERC14Y5APicmbNmtyUAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355375; c=relaxed/simple;
	bh=fQIn2krXCgmcO27EkqC/KY/KFL31Yh5adie8oUuUCN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bT8gHcbK1Iw3EZLH/M4r57VdGuEygvYRcxhMlmKS1cdw5JAiNDP5jBi4G/fTBs+EYwz7YXQAOkNtlbekiCOujF6TIHhj81mbHCS1EbnUZtW3cNY+4+wKYZt0nBHurMpl21IvLYxmqEhnjxXLvuVLqN4a5HkQkex4Op/6iIb6iOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyE329IJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyE329IJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0608D1F000FF;
	Fri, 25 Sep 2026 16:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790355367;
	bh=JyWMU3JvXb+q6hdn+2pHzQzTmrdk/tb2/VNmym1OxiE=;
	h=Date:From:To:Cc:Subject;
	b=MyE329IJKXECgPMCU7g59WRo4Z0HFKqQEFu1JcnSrB/pCQBVw1e+r+iE93uWZsSdZ
	 HsEf/LPxDGyS3WOPqB+eUQ6oScpK5EiZ9UIUqsj+wgylZKjU2nqwYll5iYa9T9QKHM
	 SEGzqZ9mgShJ0BNhiknIh2r6p1KYj6itYHi8wb84CbrxBPgS5xyDHaXaE4L9wf+Ilr
	 kgb8k8l9q2jLWpxa1/k9jthp4vOCx2mQue2K2P2wVmxWB2vn8xk/r+XPRsAT/ohK51
	 W5gTASa+BD1ynQfikdaBfq83OK17MzfEx2sbtEAKnOdylX+KqUxYe+4myfeKrquXtw
	 PlQx0NokznLMw==
Date: Fri, 25 Sep 2026 17:56:03 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V devicetrees fixes for v7.3-rc
Message-ID: <20260925-parlor-snowfield-6ca46312a610@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LTB7MCFcjfB9m+dv"
Content-Disposition: inline

--LTB7MCFcjfB9m+dv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Wee PR, but I feel like I should send it now rather than much later in the
cycle after we all get our conference fix.

Cheers,
Conor.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/conor/linux tags/riscv-dt-fixes-for-v7.3-rc

for you to fetch changes up to 0f70fd6f4c1d6c1f2ea298d8dd07c4a4d5dff9af:

  riscv: dts: microchip: beaglev-fire: remove double definition of gpio interrupts (2026-09-08 19:18:19 +0100)

----------------------------------------------------------------
RISC-V devicetrees fixes for v7.3-rc

Microchip:
Remove double definition of interrupts on the BeagleV-Fire, which cause
the sensor to be associated the wrong plic interrupt.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: microchip: beaglev-fire: remove double definition of gpio interrupts

 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts | 18 ------------------
 1 file changed, 18 deletions(-)

--LTB7MCFcjfB9m+dv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaranowAKCRB4tDGHoIJi
0qmBAQD2DjL9gXJ3DfkQQ1F/Yzuivzla65ZZxHDJAf+GKEjD9QD/QkrFmKI9/NVR
Tx74zNF/tvKx0SN4UAQC0eDmkflBVQM=
=rnWx
-----END PGP SIGNATURE-----

--LTB7MCFcjfB9m+dv--
