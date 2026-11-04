Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809302;
	b=IykZSNeozg/x9S0wBfv06q/VsPTc7OBfvwOLnAOfT2XtQKNm01meOKvEX0I5UYXb6NNs
	 PHjmNZVE6IIMLRUaPGbOFq9q+Fdh70MOouoIg6Pj13YoIQd3ScWt0KnaNAece9OZxjBkf
	 8lqPcegZVGDfmkJ0deSG6/aZ8lamsNX73Mcuy0m4rOFDxf0E3FBg3myOkoIQAGtU312AW
	 6Y1jsKMStwz1H6ZM4K/ar9cOdg1ZSFBNBGAEwsQ+NQKEgI8b0KldSDCmL1vaj7xfh1u0I
	 ZgqElkqturp/8nz8wKPfGFv7cbxF/0gTKA2ls1cWrbkIt6s2NX+4kEdQ+E/3RcfJ/7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809302;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UICkO0eq7xsufrJ/bouYgK0OsN2iMyoORGskzlyfVrs=;
	b=QpNRhzpH8xCOqBgI8KD7HMib7yH9+0qYVv/wtWRJbk+KwU/OwHdjUM/InE2MIXHF0VfC
	 WM5TQs11d/QbZG4ThhRvWdj4w/phnBj72Atu5QB0vFGvIFiBllevsA3xvtDvmiU/3H9Yg
	 pT0oEDvu6OdJcRhFAx9AJgSiMq89pSLjNXJxOHhHs/5j42Omzw/5NfAnvSwARHZRsmf9M
	 sMO//biR9jwaGHnVOUQmdza/bbCsXYuvRA5my8eIkrYlKxQ/JeNOSbHY+mrYUwFQWObXg
	 8vRn8Cz9LvfXdGW2DLxtdntYOCOwFx2U0exyABSXXMVqVMnqfvSKd8p2+3JXpVwn2Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PeMiNyQ0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3DD606AAC8
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PeMiNyQ0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D8A1F00A16;
	Wed,  4 Nov 2026 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809301;
	bh=UICkO0eq7xsufrJ/bouYgK0OsN2iMyoORGskzlyfVrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PeMiNyQ0+PMDbJ4b2OGMum+DOMcmFLeArztOWHhrXErjRIUtDi+NBg6GrWmVhsElN
	 EU27M4/j0OhTT0piO/ylAJu+kemrR+CScBja42dhy+xtBm2cuRJdiQVxHvxCrrP2kK
	 UxiENlEy322KlrB7kaGB0fWjyiDOV+G42RpOic0mIrFLhe1AuwH6I21rjkKu+KjE2W
	 iNHTpnu8ImptCbwarvnNNJSj7sE+rin1iuIv7POk5+8yQuGwXDVuX9c0vzU71fu4vY
	 aVFZadPOimf9wU33FQ8ZHOzE4ouT+cGgLTnII7Tv0jiqOFJ5dAb3q9Ei4Mynpm/Lj5
	 jTebunXegdBJg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v2 1/2] reset: Fix reset_control leak when put after controller unregister
Date: Thu,  5 Nov 2026 00:20:37 +0800
Message-ID: <20261104162038.48622-2-tzungbi@kernel.org>
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

After commit 8c91302a29bc ("reset: protect struct reset_control with its
own mutex"), reset_control_put_internal() returns early if `rcdev` is
NULL.

When a reset controller is unregistered while consumers still hold
reset_control handles, reset_controller_unregister() sets `rstc->rcdev`
to NULL.  When consumers later release their handles via
reset_control_put(), the early return skips kref_put(), resulting in
leaking resources.

Call kref_put() in reset_control_put_internal() even if `rcdev` is NULL.

Fixes: 8c91302a29bc ("reset: protect struct reset_control with its own mutex")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- Factor out __reset_control_free().
- Call kref_put() directly in reset_controller_unregister() instead of
  calling reset_control_put_internal().
- Drop redundant lockdep_assert_held() and add comment for
  __reset_control_release().

v1: https://lore.kernel.org/all/20261102155840.20376-2-tzungbi@kernel.org
---
 drivers/reset/core.c | 47 ++++++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09..f0ab09795ae1 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -160,6 +160,9 @@ int reset_controller_register(struct reset_controller_dev *rcdev)
 }
 EXPORT_SYMBOL_GPL(reset_controller_register);
 
+static void __reset_control_release(struct kref *kref);
+static void __reset_control_free(struct reset_control *rstc);
+
 static void reset_controller_remove(struct reset_controller_dev *rcdev,
 				    struct reset_control *rstc)
 {
@@ -185,11 +188,18 @@ void reset_controller_unregister(struct reset_controller_dev *rcdev)
 		/*
 		 * Numb but don't free the remaining reset control handles that are
 		 * still held by consumers.
+		 *
+		 * Hold a temporary reference on rstc before clearing rstc->rcdev:
+		 * once rstc->rcdev is NULL, a concurrent reset_control_put_internal()
+		 * will not acquire rcdev->lock and could otherwise free rstc.
 		 */
 		list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list) {
+			kref_get(&rstc->refcnt);
 			rcu_assign_pointer(rstc->rcdev, NULL);
 			synchronize_srcu(&rstc->srcu);
 			reset_controller_remove(rcdev, rstc);
+			if (kref_put(&rstc->refcnt, __reset_control_release))
+				__reset_control_free(rstc);
 		}
 	}
 
@@ -886,14 +896,16 @@ __reset_control_get_internal(struct reset_controller_dev *rcdev,
 	return rstc;
 }
 
+/*
+ * Detaches rstc from rcdev (if still attached) when refcnt reaches 0.
+ * If rstc is still attached, the caller must hold rcdev->lock.
+ */
 static void __reset_control_release(struct kref *kref)
 {
 	struct reset_control *rstc = container_of(kref, struct reset_control,
 						  refcnt);
 	struct reset_controller_dev *rcdev;
 
-	lockdep_assert_held(&rstc->srcu);
-
 	rcdev = rcu_replace_pointer(rstc->rcdev, NULL, true);
 	if (rcdev) {
 		lockdep_assert_held(&rcdev->lock);
@@ -903,6 +915,17 @@ static void __reset_control_release(struct kref *kref)
 	mutex_destroy(&rstc->lock);
 }
 
+/*
+ * Must be called outside the rstc->srcu read-side critical section after
+ * kref_put(..., __reset_control_release) returns true.
+ */
+static void __reset_control_free(struct reset_control *rstc)
+{
+	synchronize_srcu(&rstc->srcu);
+	cleanup_srcu_struct(&rstc->srcu);
+	kfree(rstc);
+}
+
 static void reset_control_put_internal(struct reset_control *rstc)
 {
 	struct reset_controller_dev *rcdev;
@@ -913,19 +936,17 @@ static void reset_control_put_internal(struct reset_control *rstc)
 
 	scoped_guard(srcu, &rstc->srcu) {
 		rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-		if (!rcdev)
-			/* Already released. */
-			return;
-
-		guard(mutex)(&rcdev->lock);
-		ret = kref_put(&rstc->refcnt, __reset_control_release);
+		if (rcdev) {
+			guard(mutex)(&rcdev->lock);
+			ret = kref_put(&rstc->refcnt, __reset_control_release);
+		} else {
+			/* Already detached from rcdev. */
+			ret = kref_put(&rstc->refcnt, __reset_control_release);
+		}
 	}
 
-	if (ret) {
-		synchronize_srcu(&rstc->srcu);
-		cleanup_srcu_struct(&rstc->srcu);
-		kfree(rstc);
-	}
+	if (ret)
+		__reset_control_free(rstc);
 }
 
 static void reset_gpio_aux_device_release(struct device *dev)
-- 
2.53.0

