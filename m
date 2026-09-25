Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B573F86E6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359098; cv=none; b=P2Ia04OAOTaABLdvPObtJpcTchnvm5jLOEddWGdCHblohSnQHIgrHwFiJOFz9sAASxOq9TFz7m3GtRAaKXbgWPHl6RmUdmfa15+00s9bUidbIm8/jUsMMxf0UAiCxhoTbNfxSrAN166MSN/5HODp56GK8QeB+0vMdhMQwzBV50E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359098; c=relaxed/simple;
	bh=Hdmg/Nkzs2CwhsogwhmlPCn7C8u+AugN2r9TCsKGMZI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=epD0SFDc6obfmM26AkGT73v4on8oAE0i/psqJBnzwpB15OaVpRQudkybWT/rFcPudtOYX+CaK/+ldasuuKvjOa2I6vcTje4G3vVcPlAvyZGk20RAETTl9YNH3EVik4JlM/JCyV1YhcCPmEEc/UiH8fJ4NYNNBVVWAnoqpQnkBAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnXd6qNT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnXd6qNT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991791F000FF;
	Fri, 25 Sep 2026 17:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790359095;
	bh=BBmtjwDwVK6IQK2U0tawhHsCBoOLkWC8K1dreHSE4kM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=cnXd6qNTAGsScXdrb5gXUdGQqScMwnIPme+loB3FuDWhngVL+LAWf4aeuuzAU0sUJ
	 1mYs+908YJ87sMLiZ2wAnr5SMdj6EVVtLKt6WzrIdBnu43xDVtIW03He0i7HkEhzGU
	 YOUv7ptjjJfj7i2lonkCJBrps14wy19wxtcT6M/S5RRp+9nKGHrF4KYWu4bFQey9L8
	 OoxkDpA64EDa/TM0dFHKIrbcFWMnj6KyGunQXmwObQF9Tf1VfmYh6YUpbo9feTeTpD
	 dvzYeFQ82a2wAd0qeJzHaTF3LVG7HD5BkTinyQb8Yb2ZdjZi9OSo3iOVeYygnktzoY
	 BQevJ0B3mJPdA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 17:58:13 +0000
Message-Id: <DLOLBXAIDH5J.2H6LPY4E4Q2RA@kernel.org>
Cc: <tglx@kernel.org>, <linux-kernel@vger.kernel.org>, "Paul McKenney"
 <paulmck@kernel.org>
Subject: Re: [PATCH] futex: sample poll cookie after publishing new hash
From: "Chris Mason" <mason@kernel.org>
To: "Peter Zijlstra" <peterz@infradead.org>, "Chris Mason"
 <mason@kernel.org>
X-Mailer: aerc 0.22.0
Content-Transfer-Encoding: 8bit
References: <20260818011036.1138213-1-mason@kernel.org>
 <20260818011036.1138213-2-mason@kernel.org>
 <20260820104015.GE687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260820104015.GE687043@noisy.programming.kicks-ass.net>

On Thu Aug 20, 2026 at 10:40 AM UTC, Peter Zijlstra wrote:
> On Mon, Aug 17, 2026 at 06:01:42PM -0700, Chris Mason wrote:
>> futex_ref_drop() may only skip its grace period when one has already
>> elapsed since the current private hash was published:
>>
>>     kernel/futex/core.c:futex_ref_drop
>>         if (poll_state_synchronize_rcu(mm->futex.phash.batches)) {
>>                 /*
>>                  * There was a grace-period, we can begin now.
>>                  */
>>                 __futex_ref_atomic_begin(fph);
>>                 return;
>>         }
>>
>> The cookie it polls is sampled one statement before that publication:
>>
>>     kernel/futex/core.c:__futex_pivot_hash
>>         new->state = FR_PERCPU;
>>         scoped_guard(rcu) {
>>                 mmph->batches = get_state_synchronize_rcu();
>>                 rcu_assign_pointer(mmph->hash, new);
>>         }
>>         kvfree_rcu(fph, rcu);
>>
>> get_state_synchronize_rcu() anchors its guarantee at the snapshot, so
>> the cookie is cleared by the first grace period that starts from there
>> on, including one starting between the two stores which never waited
>> for a reader that loaded the old hash after it began.
>>
>>     CPU 0 (resize)                    CPU 1 (futex_hash)
>>     ==============                    ==================
>>     __futex_pivot_hash()
>>       batches = get_state_...()
>>                                       grace period starts
>>                                       guard(rcu)
>>                                       fph = old hash
>>       rcu_assign_pointer(hash, new)
>>       kvfree_rcu(old hash)
>>     futex_hash_allocate()
>>       futex_ref_drop(new hash)
>>         poll_state_...() -> true
>>         __futex_ref_atomic_begin()
>>           atomic = LONG_MAX
>>                                       futex_ref_get(old hash) -> true
>>                                       spin_lock(&fph->queues[i].lock)
>>
>> The reference count lives in the mm and has just been biased for the
>> new generation, so the stalled reader pins and then locks the retired
>> hash that is already queued for free, and its later put is charged
>> against the live generation.
>>
>> Fix by sampling the cookie after rcu_assign_pointer() publishes the
>> new hash. Drop the surrounding scoped_guard(rcu) while at it: it only
>> delayed completion of the prematurely anchored grace-period and serves
>> no purpose once the cookie is sampled after publication. The writer
>> side is serialized by mm->futex.phash.lock and neither
>> rcu_assign_pointer() nor kvfree_rcu() requires a read-side section.
>
> God, how I hate reading AI output :-(
>
> Anyway, the thinking was that by holding rcu_read_lock(), the current
> RCU-GP cannot change and the cookie and assignment are effectively
> 'atomic'.

From what I can tell there are a few ways for new grace periods to start
while we're holding rcu_read_lock(), synchronize_rcu_expedited() if no
GP is currently in flight being the easiest?

Anyway, this BUG_ON() fires for me:

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index a061f54b6..18d51c145 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -215,6 +215,14 @@ static bool __futex_pivot_hash(struct mm_struct *mm, struct futex_private_hash *
 	new->state = FR_PERCPU;
 	scoped_guard(rcu) {
 		mmph->batches = get_state_synchronize_rcu();
+		/*
+		 * Fires only if a grace period started after the cookie
+		 * above was taken, although rcu_read_lock() is held. That
+		 * grace period then satisfies the stored cookie, yet it began
+		 * before the new hash is published below.
+		 */
+		BUG_ON(!same_state_synchronize_rcu(mmph->batches,
+						   get_state_synchronize_rcu()));
 		rcu_assign_pointer(mmph->hash, new);
 	}
 	kvfree_rcu(fph, rcu);

-chris
