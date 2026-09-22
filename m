Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F0E19F12D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790038211; cv=none; b=dFkCQKq2aHxQUhbdt1kY4M1tBZpJ6aXo/65WFdm6AWN89pvM0kzaigHKmoeOhMf9zVCC0OjBdJeXQUsc9OxxKwVbpefbIowEftXk0JYj2Yt1rxu+xdSgPAbv0QSepCaR5fDF6SNXHOBk7IUoXMUjHbfxLbH1MLgS8KClu0mm4ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790038211; c=relaxed/simple;
	bh=9edUGcd8chdIGybVJv9rjIZsgeN7lZHGmOVNjMi3idw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eAhCTBZSNY9a+aXZiGflsEfELVqwu1dj3VbL0OqIARM4vqUTCg6XXXciVQo23VlFUN/PPbV/jXgs7lW3LJYtzlIhzdKnCQNq4DKrm9HDjCmTp7vRcmas/7oPDL9NASmC35YQ/aWIYjf9+WPOvWwWs/gzIC/ZINa4mBOnU+Bwx1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bA/h5eOZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bA/h5eOZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB9D3C2BCB3;
	Tue, 22 Sep 2026 00:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790038210;
	bh=9edUGcd8chdIGybVJv9rjIZsgeN7lZHGmOVNjMi3idw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=bA/h5eOZE347xasat/9RITSH/Sz8DAULRq0732mXYvFDEuEHGysTUHaUK+oBb8eom
	 7WELuqnMvseBa4mIOqgngCJu2TFIjT3uw2xdCkSO100cOwoIRoBtk8JnZouYWss85X
	 BBt4Vo2DbkU6f9vOyKv0QOe28GpJD8rSMPSo5BzfQ9MV89DSJnXD7UNEBk7PoHx9TV
	 coU4iPO6CSAZKnHnz5dmj2lfsZp8JS+w8RjWt9VdV00JcnJENA4e3s01dQwFMcjFE/
	 CuSb4LP909/ul5tD88rzhdceM9c9Iw6bJKPU5S6g7nMwnRIczHJSHru3Q0klYY/eu/
	 wZU1lrXKsst7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1BAC982ED;
	Tue, 22 Sep 2026 00:50:10 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Date: Mon, 21 Sep 2026 20:50:07 -0400
Subject: [PATCH] soc: fsl: dpio: publish the dpaa2_io object only after it
 is initialised
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mb-dpio-v1-1-9e24539059c1@vt.edu>
X-B4-Tracking: v=1; b=H4sIAL7QsWoC/yXMzQqDMBAE4FeRPXdLEqXSvkrpIT8b3UKjZK0Ux
 HdvosdvmJkNhDKTwKPZINPKwlMq0JcG/GjTQMihGIwyN3U3Gj8Ow8wTxjb2wUdFsdNQ2nOmyL/
 j6fk6LV/3Jr/UeW04K4Qu2+THGh1c+2uL2Xew738AeU/5iwAAAA==
X-Change-ID: 20260921-mb-dpio-f3f7dcf0ef41
To: Ioana Ciornei <ioana.ciornei@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790038209; l=3325;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=wQTHCaf4jEy7NfQ0KFHxtOmt2diC3tsR4u0sPVS95G0=;
 b=EYwNFa/Y9LJO+l8U8Qu5Ve+uOVx+7ScthfwXG/thxilxOOhjz+LUF7h93j94QS/dHFtb8psGJ
 HKatJQwCKkeBDVb57JSN788q3+DIRuGUGlOgN7bvgpgyAFpcFCvDFYm
X-Developer-Key: i=jaidevshastri@vt.edu; a=ed25519;
 pk=J7+xYJRlTPds+pv5hbqFFRqGCpDeJDzmZT1ggRwj7/0=
X-Endpoint-Received: by B4 Relay for jaidevshastri@vt.edu/20260921 with
 auth_id=1044
X-Original-From: Jaidev Shastri <jaidevshastri@vt.edu>
Reply-To: jaidevshastri@vt.edu

From: Jaidev Shastri <jaidevshastri@vt.edu>

dpaa2_io_create() adds the new object to dpio_list and dpio_by_cpu[]
under dpio_list_lock, but service_select_by_cpu() reads dpio_by_cpu[]
without the lock on behalf of dpaa2_io_service_select() and
dpaa2_io_service_register().

obj->dev is assigned after the lock is dropped, so a reader can pick the
object up and pass a NULL supplier to device_link_add(), which fails
with -EINVAL and fails the consumer's probe. The publication is a plain
store, so a reader that does not take the lock is also not ordered
against the stores that set obj->swp, the notification list and the
object's spinlocks.

dpaa2-eth probes from the deferred probe worker and retries whenever
another device binds, so it runs while the remaining DPIO objects are
still being created on multi-core LS2 and LX2 parts.

Finish the object before publishing it and store dpio_by_cpu[] with
smp_store_release(), paired with smp_load_acquire() in
service_select_by_cpu(). service_select() takes the lock and is
unchanged.

Found with MBCheck, a static herd7-based memory consistency checker.

Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
---
 drivers/soc/fsl/dpio/dpio-service.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
index 317ca50b0..2dbd14aed 100644
--- a/drivers/soc/fsl/dpio/dpio-service.c
+++ b/drivers/soc/fsl/dpio/dpio-service.c
@@ -70,8 +70,12 @@ static inline struct dpaa2_io *service_select_by_cpu(struct dpaa2_io *d,
 	if (cpu < 0)
 		cpu = raw_smp_processor_id();
 
-	/* If a specific cpu was requested, pick it up immediately */
-	return dpio_by_cpu[cpu];
+	/*
+	 * If a specific cpu was requested, pick it up immediately. Pairs with
+	 * the smp_store_release() in dpaa2_io_create(): the object is only
+	 * used once every field written before the publication is visible.
+	 */
+	return smp_load_acquire(&dpio_by_cpu[cpu]);
 }
 
 static inline struct dpaa2_io *service_select(struct dpaa2_io *d)
@@ -177,12 +181,6 @@ struct dpaa2_io *dpaa2_io_create(const struct dpaa2_io_desc *desc,
 	if (obj->dpio_desc.receives_notifications)
 		qbman_swp_push_set(obj->swp, 0, 1);
 
-	spin_lock(&dpio_list_lock);
-	list_add_tail(&obj->node, &dpio_list);
-	if (desc->cpu >= 0 && !dpio_by_cpu[desc->cpu])
-		dpio_by_cpu[desc->cpu] = obj;
-	spin_unlock(&dpio_list_lock);
-
 	obj->dev = dev;
 
 	memset(&obj->rx_dim, 0, sizeof(obj->rx_dim));
@@ -191,6 +189,19 @@ struct dpaa2_io *dpaa2_io_create(const struct dpaa2_io_desc *desc,
 	obj->bytes = 0;
 	obj->frames = 0;
 
+	/*
+	 * dpaa2_io_service_select() reads dpio_by_cpu[] without taking
+	 * dpio_list_lock, so the object must be complete before it is
+	 * published and the publication needs release semantics.
+	 */
+	spin_lock(&dpio_list_lock);
+	list_add_tail(&obj->node, &dpio_list);
+	if (desc->cpu >= 0 && !dpio_by_cpu[desc->cpu]) {
+		/* Pairs with the smp_load_acquire() in service_select_by_cpu(). */
+		smp_store_release(&dpio_by_cpu[desc->cpu], obj);
+	}
+	spin_unlock(&dpio_list_lock);
+
 	return obj;
 }
 

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-mb-dpio-f3f7dcf0ef41

Best regards,
--  
Jaidev Shastri <jaidevshastri@vt.edu>


