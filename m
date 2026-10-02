Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B3A3B101C;
	Fri,  2 Oct 2026 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934593; cv=none; b=Tj6eEeibFIj9KdMv3EVhTw7PqYd+5c9DqeJPOngMgJzeufDKLZECWh/xhZ0lzsGInuJrwMe9WsTZH+Mdi0+Vq+PeSseFkSO38C8hTtcWghCYpumg7OYd+S/m645jvKhIpg6VbOCnKQiNv79GEa3F17wnwOjaXR2STTNhm2H4rvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934593; c=relaxed/simple;
	bh=h+SRy9jbHAfrsR806r5aTGJhd6FNaEH3tx/aAR/zScY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=UoAtzmH6K2qnKJpKwhu/+qN0TIN12/dCsPgxMRFB5PpG5bmvCZuJStTtkvKSSDMZeHf7WFr1yIUNqBYopUzeFYZgP9TxIka1h3W3hy4XqsDNb2vV3QR7DHV2TH0j2nzkjXnSBwUuN7xKPSIAguNVL7yPbxMLUzQ+zjTLL3ahh3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nupJ8Yap; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1XbN7Zns; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nupJ8Yap";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1XbN7Zns"
Date: Fri, 02 Oct 2026 09:49:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790934578;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=50UM6FrgkabyPFEB/OH7dFG6EwKXi13cpnvzDfbC8lI=;
	b=nupJ8YapyfN8RssSeAHG2LtlmgVUlHij1uZ8cMNPpZDiSVe/6xdGk3BRR/v84r6bros021
	DKhrHOud4YqwMFMh9YDEtd4FXkApPDZH0XbnrGBYMIiIZElapYjSMx+yHTQPoWJHbN6z8K
	xOTvWwzXUz8vZbyZUVT6th4dxvOABn9lsAYPNDjVMS73qunvr7+EhgQSDAL/jFhoarGNS1
	AC/2YHyhgjVu7mcPllDGmtbndMcNXrCE6vaVd085Yf4QKFeKZbzGJAcNvSuhFo8fLhhwbv
	ora1eVj0MR5LP7woIfgX4LJKsA3Im0IqTYKTPNolraI6pMvbiDuYI0u4hyu4cg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790934578;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=50UM6FrgkabyPFEB/OH7dFG6EwKXi13cpnvzDfbC8lI=;
	b=1XbN7ZnsfBKRYMMfkWG/WLz2evhvMGXFMLwMC1x/y58NokhOIA9dw3W0x48mXn3E857js9
	a8d2r1NwNz9z9BAA==
From: "tip-bot2 for Chris Mason" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: locking/urgent] futex: Fix private hash use-after-free on resize
Cc: Chris Mason <mason@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261001135022.2220288-1-mason@kernel.org>
References: <20261001135022.2220288-1-mason@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179093457682.3910103.3783534936148571597.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     f35e3b5784221654f9cdbd6222275a7fa203f6c3
Gitweb:        https://git.kernel.org/tip/f35e3b5784221654f9cdbd6222275a7fa20=
3f6c3
Author:        Chris Mason <mason@kernel.org>
AuthorDate:    Thu, 01 Oct 2026 13:50:22=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 02 Oct 2026 11:47:13 +02:00

futex: Fix private hash use-after-free on resize

poll_state_synchronize_rcu(mm->futex.phash.batches) is used by
futex_ref_drop() to check that a grace period has passed since the
current hash was published. This relies on batches referencing a grace
period which started after the hash pointer was assigned.

__futex_pivot_hash() sets mmph->batches before it replaces mmph->hash:

    scoped_guard(rcu) {
            mmph->batches =3D get_state_synchronize_rcu();
            rcu_assign_pointer(mmph->hash, new);
    }

The scoped_guard(rcu) doesn't stop new grace periods from starting, and
if one starts between those two assignments, futex_ref_drop() can move
forward while a reader still holds a pointer to the old hash.

Fix things by setting mmph->batches after assigning mmph->hash.  The
scoped_guard(rcu) isn't needed, so let's drop that as well.

Fixes: 56180dd20c19 ("futex: Use RCU-based per-CPU reference counting instead=
 of rcuref_t")
Assisted-by: kres
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Link: https://patch.msgid.link/20261001135022.2220288-1-mason@kernel.org
---
 kernel/futex/core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index a061f54..095f9fe 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -213,10 +213,12 @@ static bool __futex_pivot_hash(struct mm_struct *mm, st=
ruct futex_private_hash *
 		futex_rehash_private(fph, new);
 	}
 	new->state =3D FR_PERCPU;
-	scoped_guard(rcu) {
-		mmph->batches =3D get_state_synchronize_rcu();
-		rcu_assign_pointer(mmph->hash, new);
-	}
+	rcu_assign_pointer(mmph->hash, new);
+	/*
+	 * mmph->batches must reference a grace period which started after
+	 * mmph->hash was assigned. See futex_ref_drop().
+	 */
+	mmph->batches =3D get_state_synchronize_rcu();
 	kvfree_rcu(fph, rcu);
 	return true;
 }
