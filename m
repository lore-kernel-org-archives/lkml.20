Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9505111A9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799239; cv=none; b=OIs9BXiDO8H0NDLQGfC25wci/xVmmvSTxneCwotJplUs+r4kGqhhje2sGloAAUcqABhEA8HO00Ue0sDpYm8QEtYniDPXKJMBk4MsOUu5GIddI5aIIbRie/od6j9MhUpoBZF6mocjqy+8JFBpQDy+53wabduTP+QuLd8jV+O2viI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799239; c=relaxed/simple;
	bh=/VXTzC70t4yVtBJrIF0JdWDh1gG30uuP/DaOv76dDnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yb8q0HDwcIDILeDqyn4oIIQSYC0qdhjVtYIx88Dy6itJf0Kdb0G70nXaysjJb0TLPNcxIXQLThOYseBriPVu7tI6w7F+UMmYxliMvEgxcZD+bnjEEV0lf3LRBXTTF2Yqr7sgvkmckqJ8cfhTbBitQUvgALm0ED2U+CgHrclFI/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEAuga3D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEAuga3D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82701F00A3D;
	Mon,  7 Sep 2026 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799238;
	bh=FqgwtArQEQvqOYaVK+gx/Kqx6LAzmgUYoWNYaDKBbKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WEAuga3D54bnE4s0DofA7MVFKNKHnqgNmAre3Hhj0U6WmlwtuxQPCrQu+AKNUPQJo
	 tr8Lxgx/y1EH6GKMDXEpYn739KWLPguFaMoTmniBwthEdL3qQkLe3BpdlLlatkkOHO
	 jQNNzZKR52nktGtQS2W6YR2dOr3Ml+i1cHA7wCK3MJnRRyQNdPa7MHODZhNWtVIlkH
	 UbxhpAPyvsRVidn0YSO9S2rvZWnVbYK8VjmkDiDeUhVLd2Q2SECL2xOHfB+72vH8yU
	 Wz9ys7Z7cbzILEqGiUruDo2+tuLhqnpunJwAsYf7U61fsMfNAOPdtIozNcVuutqo6b
	 N7PP+WS45LgTQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 01/19] cpu/hotplug: Clean up cmpxchg() logic in cpuhp_can_boot_ap()
Date: Mon,  7 Sep 2026 17:40:04 +0100
Message-ID: <20260907164024.17164-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog

