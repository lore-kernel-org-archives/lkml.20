Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D335F36C5BF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040382; cv=none; b=NAUxJoXh1yXcaHQ+KsIYVz/mOeczxI9BMMUcYyeuDmMI0/298kYzY7SaxHtSfRVX00tFfnlZ1PXBK6AXKjX8EzDvWVzg4T39uTxDNofeRayiyxURsf0MCu1S8FR6EbeUjNW6obvRRJ706Hlwg+fZn5FfqLLmJa7x7lmwHrmG5fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040382; c=relaxed/simple;
	bh=m/www3WOVnTyjawm+mXGkW9GgJmwX650MpKd9BCYbYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jxv0lPVUOkrmWfVPfm1r+vAnk4EvcgO/TkWAA8BjqaSxOBzfAIV3xNYFGKB811NCeXSf4TSqHTdxoNLmf2ebyAg2ux45V6FcAB+QHCToKlNsHgFyjktwb3yTKGj3xt4HhbTqAAMeS2rsdd89ILO2Ue+3wevhEonMv8Hf8A2Eb5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7IHjAGx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7IHjAGx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4ACD2C2BCB3;
	Tue, 22 Sep 2026 01:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790040382;
	bh=m/www3WOVnTyjawm+mXGkW9GgJmwX650MpKd9BCYbYA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=l7IHjAGx/50BD51dYMKPP0zy6YEi6nh4uBlaJc3PZGqOJRdsmWjEnTjIackkLfYeU
	 9qdWRmeVyPipicz5QUMZpxV5Jq+XEsV8cuX5z6wwcFbZ404Fgm4XD5o1WAnSeostsc
	 2sz/MM+vaAgvYLyLIWuxP4Az5lwqPUsfPNaVGkv/MWfg76uD113FCCtwJAWaxaCNSS
	 9W6IQ9ltsOvCSckk113RptKrquN23fGru+xXiplQPkHo2HyABNtsLQcpLkA5+EMRoG
	 1vak5L1K+eVO+hxy8qAebHeT4Aqi4top7vfJhyIjMNkA1ApXamee4sLLva1prS+Ikv
	 twA3um3dlcZ/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B64C982FC;
	Tue, 22 Sep 2026 01:26:22 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Date: Mon, 21 Sep 2026 21:26:21 -0400
Subject: [PATCH] random: publish crng_init with release semantics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mb-random-v1-1-6af174739807@vt.edu>
X-B4-Tracking: v=1; b=H4sIADzZsWoC/yWMQQ6CMBBFr0Jm7RjaGqRexbhoh1FqQjEzSkwId
 7fF5ft5/62gLIkVLs0KwkvSNOcC5tAAjSE/GNNQGGxru9Zbg1NECXmYJ/TRePLGdb3rofgv4Xv
 67q3r7c/6iU+mdw1UIwZljOVOY512XM5Hh0In2LYf0k1ZAI0AAAA=
X-Change-ID: 20260921-mb-random-9b19c9136838
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790040381; l=2443;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=f2zwRmBbzcu+Qd4/ZF0dmOL97OWEvzW9sCoURGH83Zk=;
 b=YJrnRWwULdMlclhEJRrsM324aoKMRvEXQo82zaQyUdz2bSp+j3D5jPRwK0wG3XQR+RIeLy6sZ
 ZKMlradyj48C7RvV3zFjx1mPW5Z7VKE47qo+p0kIlXo2uhF2PlafW5L
X-Developer-Key: i=jaidevshastri@vt.edu; a=ed25519;
 pk=J7+xYJRlTPds+pv5hbqFFRqGCpDeJDzmZT1ggRwj7/0=
X-Endpoint-Received: by B4 Relay for jaidevshastri@vt.edu/20260921 with
 auth_id=1044
X-Original-From: Jaidev Shastri <jaidevshastri@vt.edu>
Reply-To: jaidevshastri@vt.edu

From: Jaidev Shastri <jaidevshastri@vt.edu>

crng_reseed() writes the new base key and bumps base_crng.generation
under base_crng.lock, then sets crng_init to CRNG_READY with a plain
store. crng_ready() reads crng_init with a plain load and without the
lock, on the get_random_u8(), u16(), u32() and u64() fast paths and in
crng_make_state().

Set the state with smp_store_release() and read it with
smp_load_acquire(), so that a reader observing CRNG_READY also observes
the key and the generation written before it. crng_ready() becomes a
static inline function so that the acquire can carry its comment.

Found with MBCheck, a static herd7-based memory consistency checker.

Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
---
 drivers/char/random.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index b4da1fb97..2418c787c 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -83,7 +83,11 @@ static enum {
 	CRNG_READY = 2  /* Fully initialized with POOL_READY_BITS collected */
 } crng_init __read_mostly = CRNG_EMPTY;
 static DEFINE_STATIC_KEY_FALSE(crng_is_ready);
-#define crng_ready() (static_branch_likely(&crng_is_ready) || crng_init >= CRNG_READY)
+static inline bool crng_ready(void)
+{
+	/* Pairs with the smp_store_release() of crng_init in crng_reseed(). */
+	return static_branch_likely(&crng_is_ready) || smp_load_acquire(&crng_init) >= CRNG_READY;
+}
 /* Various types of waiters for crng_init->CRNG_READY transition. */
 static DECLARE_WAIT_QUEUE_HEAD(crng_init_wait);
 static struct fasync_struct *fasync;
@@ -282,8 +286,14 @@ static void crng_reseed(struct work_struct *work)
 	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
 		smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
 
-	if (!static_branch_likely(&crng_is_ready))
-		crng_init = CRNG_READY;
+	if (!static_branch_likely(&crng_is_ready)) {
+		/*
+		 * crng_ready() tests crng_init without base_crng.lock on the
+		 * fast paths. Publish the state after the new key and the
+		 * generation with release semantics.
+		 */
+		smp_store_release(&crng_init, CRNG_READY);
+	}
 	spin_unlock_irqrestore(&base_crng.lock, flags);
 	memzero_explicit(key, sizeof(key));
 }

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-mb-random-9b19c9136838

Best regards,
--  
Jaidev Shastri <jaidevshastri@vt.edu>


