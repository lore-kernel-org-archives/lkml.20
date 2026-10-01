Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135BA50AC15
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862625; cv=none; b=Bk7sp4kcy0QAjl1xf2go7+yA09iVwUITEhopWTtpfFXzgmm4M4ZkqhMP+LVQonm7/QQHg/8/qXuae7gNvfd0aOqR0cHqGB0dmiFG6E1qNRNl3ofmJYgQZLQm7yYJJtKPJJOk2BxYyzcG6FVNwNMjBX+1uoUnyF6GmIMbjQMx8Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862625; c=relaxed/simple;
	bh=THLDyu66aba4rvHy0c0GIPxVV4sjXGGXtKSwb85msMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JO7Kwgi1UPZqVg4SXDsySL5CF8Ef7IuyjDqoiCb4KG4tdx22EdrnjTjSc/kCiMmuyFzRTZ0TZIMa/ZuYzCJbW4R2tPlNDc+x0Tlez8O3kSCqLjDcDKiQ5WLsIXjCG9FsVLBJ7YUIJ+9/othDXJenneLvxRMQCbiSb3QQpVGvqDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFfLAaLH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFfLAaLH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECDB1F000FF;
	Thu,  1 Oct 2026 13:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790862623;
	bh=x4NN7WYia8jHS5OzfI7U2jmkAt+5f+XE/0rGvZiMqpE=;
	h=From:To:Cc:Subject:Date;
	b=nFfLAaLHTeMiwyhcHpwpRU2IXniSzmNgOZ9MII1LHn4XA+sjYl0s7kTKtN6s9KheP
	 iVD0Fmabio0KwITCPAWapqVsy44ArTKxewZVgmcjkhJrKKbSxCw4OcSVfHBIPrXHIK
	 I5Y2wIyn4zOQPAmqC1EzZZnusrqZgWu7OJGtvy0J8m2XGYZSW5cSkLsVcdF01Gez7k
	 qx05jgmUHmlF/9n8kfRtJQjgbPQp2bxS9QbhEaokbym4i96xZpT1S4KKqoU2ElrbGb
	 tJZl9W/ybW31KK7M7C9QTaQfK9dWgEXojNzDA3bbjyo4a/8JPK3c8j/fjepWU9YAlg
	 ap0IqyRpAaC/g==
From: Chris Mason <mason@kernel.org>
To: peterz@infradead.org,
	tglx@kernel.org,
	linux-kernel@vger.kernel.org
Cc: paulmck@kernel.org
Subject: [PATCH v2] futex: Fix private hash use-after-free on resize
Date: Thu,  1 Oct 2026 13:50:22 +0000
Message-ID: <20261001135022.2220288-1-mason@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

poll_state_synchronize_rcu(mm->futex.phash.batches) is used by
futex_ref_drop() to check that a grace period has passed since the
current hash was published. This relies on batches referencing a grace
period which started after the hash pointer was assigned.

__futex_pivot_hash() sets mmph->batches before it replaces mmph->hash:

    scoped_guard(rcu) {
            mmph->batches = get_state_synchronize_rcu();
            rcu_assign_pointer(mmph->hash, new);
    }

The scoped_guard(rcu) doesn't stop new grace periods from starting, and
if one starts between those two assignments, futex_ref_drop() can move
forward while a reader still holds a pointer to the old hash.

Fix things by setting mmph->batches after assigning mmph->hash.  The
scoped_guard(rcu) isn't needed, so let's drop that as well.

Fixes: 56180dd20c19 ("futex: Use RCU-based per-CPU reference counting instead of rcuref_t")
Assisted-by: kres
Signed-off-by: Chris Mason <mason@kernel.org>
---
 kernel/futex/core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index a061f54b606d..095f9fe440e3 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -213,10 +213,12 @@ static bool __futex_pivot_hash(struct mm_struct *mm, struct futex_private_hash *
 		futex_rehash_private(fph, new);
 	}
 	new->state = FR_PERCPU;
-	scoped_guard(rcu) {
-		mmph->batches = get_state_synchronize_rcu();
-		rcu_assign_pointer(mmph->hash, new);
-	}
+	rcu_assign_pointer(mmph->hash, new);
+	/*
+	 * mmph->batches must reference a grace period which started after
+	 * mmph->hash was assigned. See futex_ref_drop().
+	 */
+	mmph->batches = get_state_synchronize_rcu();
 	kvfree_rcu(fph, rcu);
 	return true;
 }
-- 
2.54.0

