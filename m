Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635259;
	b=4U/yJgSBecnBGjiwPxASBMEfAdZ3hDsZNPYlCYzMD169zllTVIVsSQ9//dhGuDKx89OT
	 cm/VmEs08Ektux8sAOZaK0SmGp72zm1Rxa4aigvg3XnYotDWf+BnFLyeRLX9eS+fRP/0b
	 jGOpy14AYHLaSWFznw7Iwrh0hY1jVzcBo9qRdNkyCDn0SpbsipuZuTiQGLTthMmkqSpcn
	 aQS3ulNa63FiP1ZzzNWltBpxVO4fjG4OB5gqv6t9FktibmEAs942nq7HO3DesKmpWuDnu
	 dMFfuaDk3cQsUt0MGaQw839XgATSJjwQbgvC2PriU6vnUnt5m5/KNJ0wWkwgwJBTAYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635259;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=QbRGF6PDC1fukVZ1RsUA+unwiK3pOtG/EjOYGFz8Idg=;
	b=NXUbZPUBOF+epxKrB4NNbLR2vOI0yWreBhBxP1Y+dAXV/EiTrU6olEw3g0M2R1gZPVCg
	 t0HkBTmpLI/7Y98XDtPVsx86rU1/2QGBGUcpYZiuGt3Ni57xj9vCFUWFnEtonyN1krGMK
	 6bOHP+qQxOrTGWfLvFC0PgB8oCQG9xJt9WXMRUSwVsrXK8/1dHLOEE9tV15j/KHOFNmq3
	 IFhyJUBne+CNT1O+da9sizG5uS6TYhOxlVYCbXEj4duBIJLyZHVjFgSmH/AT/mjv8Atbl
	 fFyGcfcFZZ4aBT8/bOMJwvRGVX8CvT16hk2Po+xyWja0nit+73RwbX+U7hJxOOBtJdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gtLJONEn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF9606F233
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gtLJONEn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28CF1F00A16;
	Mon,  2 Nov 2026 16:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793635258;
	bh=QbRGF6PDC1fukVZ1RsUA+unwiK3pOtG/EjOYGFz8Idg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gtLJONEnovXZjXw4I7vzYTQZtxqLQUYvPv2DPJQkAjGqoNTwUtdp6xauWnIjqgwR+
	 Uwg/08/bhJQbWrj9yx7tkEWGkEq3APlXN+Mi5/FL7QnNAmeNBx7znYrg25szwmPrwI
	 plW5Lz6YbMemjWLO6mt3YNFXguzsNXhAUPHD7zA8NQcpok2Q3YyZYY5d2QGQ/MMJpb
	 Lkf+4FAkZi2KZm4lEQcvd/CEkzS+p+i9WJGJpen1CJN89tALbKEHQkbe2boJQP5PUv
	 o556y5+CG6JsnLsl+/mMRvxU//sC3tfeUpGcx12T6QUE5fafZA4+vmfBfhxzFskXf0
	 WEgPJH+utI/eg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH 1/2] reset: Fix reset_control leak when put after controller unregister
Date: Mon,  2 Nov 2026 23:58:39 +0800
Message-ID: <20261102155840.20376-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102155840.20376-1-tzungbi@kernel.org>
References: <20261102155840.20376-1-tzungbi@kernel.org>
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
 drivers/reset/core.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09..1f6d7ef48a67 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -160,6 +160,8 @@ int reset_controller_register(struct reset_controller_dev *rcdev)
 }
 EXPORT_SYMBOL_GPL(reset_controller_register);
 
+static void reset_control_put_internal(struct reset_control *rstc);
+
 static void reset_controller_remove(struct reset_controller_dev *rcdev,
 				    struct reset_control *rstc)
 {
@@ -185,11 +187,17 @@ void reset_controller_unregister(struct reset_controller_dev *rcdev)
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
+			reset_control_put_internal(rstc);
 		}
 	}
 
@@ -913,12 +921,13 @@ static void reset_control_put_internal(struct reset_control *rstc)
 
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
 
 	if (ret) {
-- 
2.53.0

