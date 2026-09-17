Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6EF5A0AA3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657007; cv=none; b=LPZpNkrg3nKAQ+fd9MOayaGvQr+I39onjzBmmSUozrbuEWEFP+hNXeSm532gzTshHOuZJ3rh5kfgUoaG2RfOMMJCpkv9dsjRuIp2iLLp8rMadAqkk3/CUUiJYT6PEwZX5nDYoeku7Mj1O7rSrr0G3MLQXspOgwVopwAosPO6UG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657007; c=relaxed/simple;
	bh=EQBvkZtIHffAkr5/QWRSIbFbmywWBucVousASbKrX8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gWbZETVCaNDqceX7kBAjgD4/8vYELJSNTtc1QpCANthufECz8H0O2ehMLU9J7orccAddzqw+fvOi5mL3eaarYKUJVnKIi/epsK1FVvDgyAzPj7RZdqYfBFwV8CGhA/4DJ95M2MLWSMaI/r/RWyU/mMfILKEIZ7MYMZdGzmiY3zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uOkCjQnP; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uOkCjQnP"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D123E1F02;
	Thu, 17 Sep 2026 07:56:26 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06B663F86F;
	Thu, 17 Sep 2026 07:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656990; bh=EQBvkZtIHffAkr5/QWRSIbFbmywWBucVousASbKrX8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uOkCjQnPBTnLED+Ju1Wsd5Ys3DpvforX8qQNzjUaaf+/HOyzl34vFEwDPh1tvVFmT
	 JGHngIm/imqQGLAj1jcWRbDMrIHUceHZuze7jHzq8LHA2I3uzV19KzIruXBXczz6xj
	 hgeHtuXflkeAe9klb8QfQiHRm9lNl+uX8LO7J0JA=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2 02/12] arm_mpam: Restore the error interrupt enable from mpam_cpu_online()
Date: Thu, 17 Sep 2026 15:56:07 +0100
Message-ID: <20260917145617.2202986-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When all the associated CPUs to an MSC are offline, possibly caused by
PSCI_CPU_OFF, the power supply to the MSC can be cut off and all the
registers that are unknown out of reset, including MPAMF_ECR.INTEN, are
lost. Afterwards, we need to explicitly set MPAMF_ECR.INTEN when the first
associated CPU becomes online and the power supply to the MSC is recovered.

Restore MPAMF_ECR.INTEN in mpam_cpu_online() when the first associated CPU
of the MSC becomes online.

Fixes: 49aa621c4dca ("arm_mpam: Register and enable IRQs")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
---
Changes since v1:
Update the commit message (Gavin)
---
 drivers/resctrl/mpam_devices.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 580d7ed38569..32bde94dfbc3 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1856,8 +1856,14 @@ static int mpam_cpu_online(unsigned int cpu)
 		if (msc->reenable_error_ppi)
 			_enable_percpu_irq(&msc->reenable_error_ppi);
 
-		if (atomic_fetch_inc(&msc->online_refs) == 0)
+		if (atomic_fetch_inc(&msc->online_refs) == 0) {
+			mutex_lock(&msc->error_irq_lock);
+			if (msc->error_irq_hw_enabled)
+				mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
+			mutex_unlock(&msc->error_irq_lock);
+
 			mpam_reprogram_msc(msc);
+		}
 	}
 
 	if (mpam_resctrl_enabled)
-- 
2.43.0

