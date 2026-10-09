Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BF134CFB9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540472; cv=none; b=f8iEAxTqOWnHUPiwCZ7Y1vr8Of/aee+/c+2YWWp5eG26Zmk3BfyAl0xwtpBanN4bL6SXhypi27oYxRFtvBOtOgXw/nkpjHESLHckB/96qdAXqWcNpvOsZWDc0s4Iq60phnl7ji491jXNArBPdacD6Jj7Ado1aJ/50zuQuZAvhc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540472; c=relaxed/simple;
	bh=Rq/kuDq+rDL8Cxo8P2KFv74mO08o1Bg5PK9tRs/+gN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZueGbGJgJSGzd6aleHVoIcZ4gmy4g577gYLYeNP9P/XLyaMSaMJebpYu69tBiaqk2Aae+1d1vDvCc6XrIApu9heJKYeF8rQXmOTnrfse/fz+fL4ipLrfmYQ4IbO30/zXeEogNLZyEydVXY9G4sakrnBhEeXnIkArFbllcmLaizk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOQvmO+c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOQvmO+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92A41F00893;
	Fri,  9 Oct 2026 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540470;
	bh=Nmcl3acLOdghIcVWJGQcNUT1dxt+y4UDcmDoxuevzy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KOQvmO+cNIRV/YyuucnkVz9UG5LzNGDqnaVyRUMTsdkrXSJ8Fmzny2YgV2PDIB6+m
	 0uWHPbFLAEtjvO9ZBI14iLjFnyycNHnPy9IBDCUZtTR9t+DC3r8tpZwUm8NSgOPkNU
	 HPhj/vecc6HUAprhbE394HHGweNe+YxrdyhmvM8CAJjOzHscZZQ5IyCj/OHQX/KLed
	 DAdR8KXvnhgw0ssXcFwYVzh3eYwxbQStAR+GWKNLAUpWJjiqqIpfgDYz7JSrmK8Rb+
	 nYXjdXqaWwKNf7Pa+3ELyzZbOkVw9mXAGMZJ2S2LE2UaPWc5DJf13IUtl3Zzbkt5df
	 LjldAEUGNy8pg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 01/23] cpu/hotplug: Clean up cmpxchg() logic in cpuhp_can_boot_ap()
Date: Fri,  9 Oct 2026 11:07:12 +0100
Message-ID: <20261009100738.31288-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpuhp_can_boot_ap() uses atomic_try_cmpxchg() to transition the sync
state of the incoming CPU to SYNC_STATE_KICKED. However, this is
unnecessary if the state is SYNC_STATE_DEAD, since there will not be any
concurrent state modifications, and also if the state is already set to
SYNC_STATE_KICKED.

Restrict the use of cmpxchg() to the case where the existing state is
SYNC_STATE_ALIVE.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 kernel/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..198c929c452a 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -408,22 +408,22 @@ static bool cpuhp_can_boot_ap(unsigned int cpu)
 	switch (sync) {
 	case SYNC_STATE_DEAD:
 		/* CPU is properly dead */
+		atomic_set(st, SYNC_STATE_KICKED);
 		break;
 	case SYNC_STATE_KICKED:
 		/* CPU did not come up in previous attempt */
 		break;
 	case SYNC_STATE_ALIVE:
 		/* CPU is stuck cpuhp_ap_sync_alive(). */
+		if (!atomic_try_cmpxchg_relaxed(st, &sync, SYNC_STATE_KICKED))
+			goto again;
 		break;
 	default:
 		/* CPU failed to report online or dead and is in limbo state. */
 		return false;
 	}
 
-	/* Prepare for booting */
-	if (!atomic_try_cmpxchg(st, &sync, SYNC_STATE_KICKED))
-		goto again;
-
+	/* Continue with booting */
 	return true;
 }
 
-- 
2.56.0.385.gd3acb90ef8-goog

