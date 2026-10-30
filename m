Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380195;
	b=uTUZPWCI4DMYE3UgDzvlQLi19UjIi8dl7Z7QT292TNcYc6V5NjKFqf8Pu9aPtVklPk+x
	 z0YEyWDHQ5thiyVkplshPqSbCl6RlqX5XhFupfiO9ZZM/enY9e2eDK+PXsbaUNJou1UXb
	 tyM82RUBF0uGYfAnirUXVA/3D0ztZXhM4+qMdlxEAQ5DTbm9vWfKwP+ZlqGv/9MfOUpHR
	 ZXm3zXlDszpS8Olb6TfXBdfh6XAD8cQMg6WHTZA+l3sWLxG35lbYdQl0Nt+bzwz5EwwFD
	 fjqwxtN3JTZTnJc72JC24FExeoc6rzAZGgTOZvz1rYni+VOOpKyDvlDBQ2fK1pzsTJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380195;
	h=Received:DKIM-Signature:Message-ID:From:To:Cc:Subject:Date;
	bh=+yvQhvyO11HR7h01vfiBQnWLqcPmyj+LhN9c+qQEHAc=;
	b=bMp3UWLuHU0dnHiknb729P9NSGsv6hhqw9eP3lfP+RnsKgZx+rbAqBJa9CgT37YSiLXY
	 v/yiSPOcdBMlX7hHIpa1nVj4VVGh/1t44NfXWnNqaXnf1WX200nWx9vKfGwk8luA7UlvD
	 19UEeEPAWMRd5DTARpIUccfybvNPwNvBbazXcvjDcWKSvkSRdVSG0BEbV6UGzqJM3gYk9
	 ZBjB0NL2nVOQO1W71ecAj2Xd2mAGpVkoatJ+J0t9f25vBIKYK4TCDIxqMg0BApkdXIno5
	 V3Q0Qs29p139PgxRNj4oIvUnisYBTZwbmjXuYeHic4ocpgym562gl1s4yCX3qux9i8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMlEgwKF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id BF5EF606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMlEgwKF
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id ED0031F000C1;
	Fri, 30 Oct 2026 17:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793380194;
	bh=+yvQhvyO11HR7h01vfiBQnWLqcPmyj+LhN9c+qQEHAc=;
	h=From:To:Cc:Subject:Date;
	b=PMlEgwKFii1HYJ4oOVaGdXzKS0qLpoSBTIiXjp6UK6mN/LN8PtGuD/z7gRp1Hl2/u
	 FUd5u8R7X6fSYSPwvDsXGPDxf6mRk/wlNDTumVV08CEYsYHBSID2Ku77il8VXerZQb
	 mNCCpRQRDwJjqMDbnDz409fz6jlA3kUYN7VF8nMVos7Jgb73tr/0PGNJ3kw3ZHbOaZ
	 pGX4IM+BcBImplYTSzm22nVtkxM2CwqGQzTa8b+i+Fph0brNgC2x2FSOUgDF1eEWc6
	 1oeGNoD+D9WlvWsfFxkqD+LZzxcnIUiWL/EsMTtZoZCsxOk335AI7Vo5521b9RBxRX
	 YtC2oVoA4oUeg==
Message-ID: <40ab85dd02918aba26760f0b9cf1ff7a@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regmap fixes for v7.4-merge-window
Date: Fri, 30 Oct 2026 17:09:15 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The following changes since commit 2dee91ee94eec85d09c13c7ca83e3005906d3732:

  regmap: Merge up fixes (2026-10-19 19:23:44 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-fix-v7.4-merge-window

for you to fetch changes up to 1ea2927c1bc3c66d2ff69f131268e6be4d38a87c:

  regmap: irq: fix incorrect index calculation for read_sub_irq_data() (2026-10-21 17:53:15 +0100)

----------------------------------------------------------------
regmap: Fix for v7.4

One fix for a real issue that fortunately doesn't affect any in tree
configurations.

----------------------------------------------------------------
Qinguang Xu (1):
      regmap: irq: fix incorrect index calculation for read_sub_irq_data()

 drivers/base/regmap/regmap-irq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
