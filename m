Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE82923E33D
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791033142; cv=none; b=FctJjzy9kqFbeFSoQGG+90vAnuvwhp/jMjA9yGVk/8QTmvopGlFofWCC6Acg4TZpG0VnXHnz45WoxeQUwVCWNFXMBPU3u2dSqit+a7TnPk/ubD0I+sO1Mv+HbeHafxH6p65MT+vVSVvYD+/L/IjbOkQsHEt5sSulT/M3//Kszco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791033142; c=relaxed/simple;
	bh=wbxrPLB9fCOw1n6c5eFrO4Kd6d5f++ievONKQB4qVls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WzV7swN6h04qLQA5tefW8nKyWwuLOIUhBia35fiCZ8fLaIx4w8H2ENF3erEca68jdx6svMPAGacvokE/XJVtpTNZUaou/y0vu4Rw4Uj/HL1UC1BEpOAgs/jzk22LZNpH+oktY3syJOM8EOj4LY4BOi7nH4pOxRrzukmP9M3QQYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tjgipNy9; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tjgipNy9"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57412143D;
	Sat,  3 Oct 2026 06:12:15 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A70EC3F86F;
	Sat,  3 Oct 2026 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791033138; bh=wbxrPLB9fCOw1n6c5eFrO4Kd6d5f++ievONKQB4qVls=;
	h=From:To:Cc:Subject:Date:From;
	b=tjgipNy9pJmz8WP0wTQ+Nj/RtPUSCVf3QAFllfWJUg+dmDQq5SEHQPAgFfjAX/rGn
	 z3Ang72K57KAtivMeSzk4OFnLTY5kVaJdTsHP/hBCOKrHKzSDEKZNGI8rQDuF9eUn5
	 DuBqoJzFU3dtrIMG9Gn6QyQURQCD6YEdI6NNZTHM=
From: Ben Horgan <ben.horgan@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ben.horgan@arm.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: [PATCH] arm_mpam: On saving mbwu state read the monitors before clearing CFG_MBWU_CTL
Date: Sat,  3 Oct 2026 14:12:07 +0100
Message-ID: <20261003131208.2023223-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mpam_save_mbwu_state() the monitor values are read using __ris_msmon_read_locked()
which checks if the configuration provided matches that in the hardware and if
not then resets the monitor. To avoid resetting the monitor before reading the
value that needs saving only clear the configuration after the monitor is read.

Fixes: d056d29aefbe ("arm_mpam: Use __ris_msmon_read() for saving MBWU state")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
based on arm64 for-next/mpam
---
 drivers/resctrl/mpam_devices.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c32175426433..48adc49b833c 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2052,9 +2052,6 @@ static int mpam_save_mbwu_state(void *arg)
 		if (ret)
 			return ret;
 		ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
-		if (ret)
-			return ret;
-		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
 		if (ret)
 			return ret;
 
@@ -2088,6 +2085,10 @@ static int mpam_save_mbwu_state(void *arg)
 			mbwu_state->correction = val;
 		}
 
+		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
+		if (ret)
+			return ret;
+
 		mpam_mon_sel_unlock(msc);
 	}
 
-- 
2.43.0

