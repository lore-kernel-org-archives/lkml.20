Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809303;
	b=h9tin7epyBWDyDnFVMM+vVwv0szzHe5V6orH7Fyh1QgH13vxX3BFQmyqMtOzkfCD4wWB
	 pxEq8All98hJxtOgCfp3m31k20qHLuC31ut9B+XoLk4bTYvF7JWGfxafnpKXlis7LVeFv
	 rwsCz9N+FJmuTazXHoNdROjeyCkk2dyr39t7p+0Zkvj1qm/iDRqoRcMLlIgXbWqyC/S9o
	 tUJqmDJefB/WEu6u9u3UnTWh0BX9AaJP5pWNMGsGuRcZAnmAE7HXWIRe3J3IWXPAkC+yF
	 YtwgSf8vgPQxz+tt4TAfWq83XKvwlBKW4CHXKvk2LMEvwHhbEHzmp+8om/PINsIdf4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809303;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=oTxUofJiIXbPqYg2BkbDaFVJoZFZ6x++eMO36ELTr0w=;
	b=t+OlmePXsHJMzUs8x1Lj3MWG7dGTJorxADDBd0LnYB720nsgfRFrGNhdeuzEBw2f1WEm
	 ommu7vFuChr1w8U7QC8IlpBNUKgAVYtsVd/zjXHos9AJm8U741FIy+7g29HLWKeILxgUM
	 415i5yB3pcr0Zx5d9E2daT+OBuUjj43rsUm/Ep9mwyNB5Bg/9p3GsMKP2Xzyvt6zSC2nr
	 O7DH3v1wh8DatnX83ZRE94Y19PM3n48IUbupFturzHqupAScfvBdG74FrhnMNufWx9mj9
	 dREDxOD8w3+/RdP8rMP3X/AAWENFnPCFzRxjqp4SZHSX7bqGs8l2jKh9oPT7/xIEReA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GupS9U0Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A64606AAD9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GupS9U0Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B571F00AD9;
	Wed,  4 Nov 2026 16:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809302;
	bh=oTxUofJiIXbPqYg2BkbDaFVJoZFZ6x++eMO36ELTr0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GupS9U0YAcqJehg+967vJ9c2lH9DCDpH58wCbH+fJDicYzsen9Uk889ceJx78Wg4y
	 dmTupC+byOZxCM457wkNA6bgd1Vc+qoMvVkCX1xkarG1W9uDMVI1U+ufLWJsz+Haw+
	 LIRW3/s/Or6NqvTSM0bgRGHfpbJKPrB3pwoLHVrEwwjmeMbs2QJPYMk9qSjas9A/xd
	 E+kbyRAkfsGidRvwQZUpMWCxMaYBiSk8K7eOVVhT/+IK/ZHqw9rxCa+Huv2nHSJgTw
	 N5PBdf3l4im3Aa8c9x2N+jEEWunnsrm6Q8/yHb1Dxfz4bIULYPLuMu+DqeV0S/yMvL
	 lfeZIVKl51a1w==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v2 2/2] reset: Fix circular locking dependency in reset_controller_unregister()
Date: Thu,  5 Nov 2026 00:20:38 +0800
Message-ID: <20261104162038.48622-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104162038.48622-1-tzungbi@kernel.org>
References: <20261104162038.48622-1-tzungbi@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

reset_control_acquire() and reset_control_put_internal() acquire
`rcdev->lock` inside the `rstc->srcu` read-side critical section
(`rstc->srcu` -> `rcdev->lock`).

However, reset_controller_unregister() holds `rcdev->lock` while calling
synchronize_srcu(&rstc->srcu) (`rcdev->lock` -> `rstc->srcu`), causing a
lockdep circular locking dependency warning and a potential ABBA
deadlock.

Run synchronize_srcu() outside `rcdev->lock`.

Fixes: 44a0acb2caca ("reset: protect struct reset_controller_dev with its own mutex")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Test:
With "[PATCH v3] reset: Add KUnit test cases"[1] applied:
$ ./tools/testing/kunit/kunit.py run \
        --kconfig_add CONFIG_RESET_CONTROLLER=y \
        --kconfig_add CONFIG_RESET_KUNIT_TEST=y \
        --kconfig_add CONFIG_PROVE_LOCKING=y \
        --kconfig_add CONFIG_DEBUG_KERNEL=y \
        --kconfig_add CONFIG_KASAN=y \
        --arch=x86_64 \
        --raw_output=all \
        reset_test

[1] https://lore.kernel.org/all/20261104160123.6784-1-tzungbi@kernel.org
---
v2:
- Use list_move() to make the intent clear.
- Defer reset_controller_remove() after synchronize_srcu() to avoid race.
- Drop lockdep_assert_held() and add comment for reset_controller_remove().

v1: https://lore.kernel.org/all/20261102155840.20376-3-tzungbi@kernel.org
---
 drivers/reset/core.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index f0ab09795ae1..4a582721782f 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -163,11 +163,15 @@ EXPORT_SYMBOL_GPL(reset_controller_register);
 static void __reset_control_release(struct kref *kref);
 static void __reset_control_free(struct reset_control *rstc);
 
+/*
+ * Removes rstc from its list and drops the references on rcdev's owner module
+ * and device.  The caller must ensure rstc->list access is serialized (e.g.,
+ * by holding rcdev->lock or moving rstc to a private list) and that no
+ * operations on rcdev via rstc are in flight.
+ */
 static void reset_controller_remove(struct reset_controller_dev *rcdev,
 				    struct reset_control *rstc)
 {
-	lockdep_assert_held(&rcdev->lock);
-
 	list_del(&rstc->list);
 	module_put(rcdev->owner);
 	put_device(rcdev->dev);
@@ -180,6 +184,7 @@ static void reset_controller_remove(struct reset_controller_dev *rcdev,
 void reset_controller_unregister(struct reset_controller_dev *rcdev)
 {
 	struct reset_control *rstc, *pos;
+	LIST_HEAD(reset_control_head);
 
 	scoped_guard(mutex, &reset_list_mutex)
 		list_del(&rcdev->list);
@@ -196,13 +201,22 @@ void reset_controller_unregister(struct reset_controller_dev *rcdev)
 		list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list) {
 			kref_get(&rstc->refcnt);
 			rcu_assign_pointer(rstc->rcdev, NULL);
-			synchronize_srcu(&rstc->srcu);
-			reset_controller_remove(rcdev, rstc);
-			if (kref_put(&rstc->refcnt, __reset_control_release))
-				__reset_control_free(rstc);
+			list_move(&rstc->list, &reset_control_head);
 		}
 	}
 
+	/*
+	 * Run synchronize_srcu() outside rcdev->lock to avoid a circular
+	 * locking dependency with paths that acquire rcdev->lock inside
+	 * the rstc->srcu read-side critical section.
+	 */
+	list_for_each_entry_safe(rstc, pos, &reset_control_head, list) {
+		synchronize_srcu(&rstc->srcu);
+		reset_controller_remove(rcdev, rstc);
+		if (kref_put(&rstc->refcnt, __reset_control_release))
+			__reset_control_free(rstc);
+	}
+
 	mutex_destroy(&rcdev->lock);
 }
 EXPORT_SYMBOL_GPL(reset_controller_unregister);
-- 
2.53.0

