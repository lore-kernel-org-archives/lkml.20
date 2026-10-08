Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5770C3839AC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791470847; cv=none; b=nn8LqBw3adFcF7wXu2y4DaSXYLbocCxN08ciqDdcZjIyz0g66R7OrNIDE77lDVglqichD9TpouxGk2JkpOgZN3aqajbUc6MT+5kONtJLStk8lgPMySN1XJujPHDvMBT2xTqlmKxYXBllJqTKjB5y8P78Kmnh0e2GxGnMdNWJ50I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791470847; c=relaxed/simple;
	bh=RyEyHIhBxJtf2c3PhcIBxsx8S5z4imV40tf6kOX9tR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QV/sBtu/lwnkMsHBb+Di9vxTF1LZJnSur32BdMZ9CAEDceCVxgBdgsA6vtH3Ityvi+zurN7A7zqMbIWPCMLR1G3fXSdig9NWTmIT4U5hxs7++ewr7vzUjXRxMfDLG4XT7TBOJ4ztEzd/wfuUHtUC7wbICqFfMNTsP6JIHbfHL30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeV52aC2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeV52aC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F292C1F000FF;
	Thu,  8 Oct 2026 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791470841;
	bh=wXTcdwnDzVIvGijsB17Q058yuGWjveFjoq9zAMPXR5A=;
	h=From:To:Cc:Subject:Date;
	b=aeV52aC2Dh4Cs48Pr3GtCvhFdwZS8oRmyVmefK15RYUXPNrNGNKj2z08ICWQMQDOU
	 lJ+4ATDw2r6M9LyPUoct9Q7iu9pvT9Lyi42jxuXJJMe76Q1UuyEot3jIUlhbXH9aec
	 9FcUjfCTd+wNcZRVbzeLG9Qia7XJwqMJj7uI/PmkXnr14ty+a7Op9O88l61RxdkXVg
	 8c8SUorSO2tepEUNnVYHrQHip/sKKPyJMStTg6hn6WDHZdMRrL89BwcUzlGjYwNiQm
	 zo22LQJMroxwoUfNK0nFza2PsmBhGZl7cfYPSPa2h9wQr/feY/44we/gXrNDNG9G9Y
	 N99yDlUFpymCw==
From: Dinh Nguyen <dinguyen@kernel.org>
To: gregkh@linuxfoundation.org
Cc: dinguyen@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] SoCFPGA firmware updates for v7.4
Date: Thu,  8 Oct 2026 09:47:19 -0500
Message-ID: <20261008144719.551095-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_firmware_updates_for_v7.4

for you to fetch changes up to 580c64140e174c27cfeb3e499e2eb851571e0773:

  firmware: stratix10-svc: Reduce polling interval for command status (2026-10-08 09:41:24 -0500)

----------------------------------------------------------------
SoCFPGA Firmware update for v7.4
- Turn off secondary CPUs using PSCI on Agilex7 and Stratix10
  Warm resets on these platforms require a clean PSCI state.
- Clean up stratix10_svc_free_memory() to reduce nesting
- Add SMMU DMA coherent support on Agilex5
  Use DMA-coherent buffers and IOVAs in the service driver for Agilex5
- Set kaddr1 to res.a1 which matches the existing error path and allow
  callers to retrieve firmware status details
- Allow older firmware that excluded COMMAND_RSU_UPDATE and COMMAND_RSU_STATUS
  to return SVC_STATUS_NO_SUPPORT so the firmware can continue instead of
  waiting for a timeout.
- Add support for SDM mailbox interrupt on async transactions
- Reduce polling times by introducing polling modes(Fast and Slow)

----------------------------------------------------------------
Adrian Ng Ho Yin (6):
      firmware: stratix10-svc: add PSCI secondary CPU offline on warm reboot for agilex and stratix10
      firmware: stratix10-svc: warn on unmatched free in stratix10_svc_free_memory
      firmware: stratix10-svc: add Agilex5 SMMU DMA coherent support
      firmware: stratix10-svc: populate kaddr1 from config status response
      firmware: stratix10-svc: remove RSU exclusion from no-support path
      firmware: stratix10-svc: Reduce polling interval for command status

Tze Yee Ng (1):
      firmware: stratix10-svc: Add for SDM mailbox doorbell interrupt

 drivers/firmware/stratix10-svc.c             | 598 ++++++++++++++++++++++-----
 include/linux/firmware/intel/stratix10-smc.h |  44 ++
 2 files changed, 541 insertions(+), 101 deletions(-)
