Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1343F7A98;
	Wed, 23 Sep 2026 17:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184710; cv=none; b=NgJ7gZqyezqzmSa72//Hk1s7oChbx0ZMkP9uoH+kJcOd5/qoTMebkqanei1K3io92ywWcqCFMHfinxPiYCfXSmDVm3hUo+f6NGfcL2Kgvv5hkAil1cQdfADLzPptJHJ9qkF3x7EFlRzQ5xsIt4Hc2uVKLogUFo02jIHu/0PWkWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184710; c=relaxed/simple;
	bh=CRk9GyQfapQIXDdZJ9W2tplIpp2+qnVrjyjfpkgX4TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LxRj3dr08ET/ZGyO6ZBS1lMJy9f6la0HJx8Q4Rqi2+F0pbHN3pZuWJsA9pa3Y5Eq19OOfI1ao8TtVyqFd61erDgTYvBJRyor0C1yA7jrHOPWYFTu54tC6NQ+cd9ZnsXBt7XkrC9QacVWgKGmJaoM8dED2X2liHTATxaipTSLpGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1009)
	id CE1E420B7167; Wed, 23 Sep 2026 10:30:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CE1E420B7167
From: Dexuan Cui <decui@microsoft.com>
To: tony.luck@intel.com,
	bp@alien8.de,
	tglx@kernel.org,
	mingo@redhat.com,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kameroncarr@microsoft.com,
	Dexuan Cui <decui@microsoft.com>
Subject: [PATCH] x86/mce: Report unavailable MCE support at informational level
Date: Wed, 23 Sep 2026 10:30:33 -0700
Message-ID: <20260923173033.4104944-1-decui@microsoft.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mcheck_init_device() reports an error and returns -EIO when
mce_available() is false. However, MCE support being unavailable does
not necessarily indicate an initialization failure.

For example, a TDX guest with TD_CTLS.REDUCE_VE set and
FEATURE_PARAVIRT_CTLS.MCA clear does not enumerate the MCE and MCA
CPUID capabilities. This is an expected configuration, but it causes
the kernel to print:

  mce: Unable to init MCE device (rc: -5)

MCE can also be unavailable because it was explicitly disabled with
mce=off or nomce. When it was disabled due to an earlier initialization
problem, the relevant path already reports the reason.

Report MCE unavailability at informational level and return -ENODEV
directly instead of routing it through the common error path.

Signed-off-by: Dexuan Cui <decui@microsoft.com>
---
 arch/x86/kernel/cpu/mce/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index f3a793e3a6c8..24ac10075263 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2825,8 +2825,8 @@ static __init int mcheck_init_device(void)
 	MAYBE_BUILD_BUG_ON(__VIRTUAL_MASK_SHIFT >= 63);
 
 	if (!mce_available(&boot_cpu_data)) {
-		err = -EIO;
-		goto err_out;
+		pr_info("MCE is unavailable\n");
+		return -ENODEV;
 	}
 
 	if (!zalloc_cpumask_var(&mce_device_initialized, GFP_KERNEL)) {
-- 
2.52.0

