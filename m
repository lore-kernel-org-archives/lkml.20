Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5488A3C3F7D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169359; cv=pass; b=ZSRdGDCxlbG41Jx7TBNNXtS5iUaaDUjvjv8TbrNfe3TQObkdVjMI7kyeuw8wvR046lLoe/+Ek/XUDVWc15gU07fH7rSq0eLgQZ+M27Pw+rDWZK01pb1vzB0qDb9OkjE7wRepjfGxaSOCv3/z5MqOdvf3+M0F+6icMagFAfH+xo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169359; c=relaxed/simple;
	bh=rGbyQBkNbY5a1OXBSal5Mure3AlHLFxQtfgc5Bhzvks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KMw0szCqNxoSJG7+aH2iI9XWgGLOo2Njk4awCDqFekfkSMI3x4EHmAe0+hd8Vau8/EGjdtYKc2dD/YgPvSl913BE3JiaKZRB3I9mhPR3O/dYIh4jfUKdQw1yoXUF0RJY8JnD0eadc7axHdLS8NBb8h3L5DwtqIAch/f+cNDWdoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=OSpO+nDb; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="OSpO+nDb"
ARC-Seal: i=1; a=rsa-sha256; t=1789169325; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O5cMLdAMoDUutx0+TZxZxWQy6QyLTq80pweXOoEWL8Wh1NmhXLsmzFhm+6vbg4/S8VfsPqsKkSYSa9hamPW9vK77ZvT6GjZPn1eTRn6TJ8Z/38Q6yOXaoHSknnsnyx4pUDx4jp28qZGgxyVjJWHJZR6T+jp2HRdHvrD5OZSejbc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789169325; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YLJJEy7HObDD1CKVtOGtdrfPLM+ZQOVKX8SKLnJRFuQ=; 
	b=Ns9ICgC+pzFg1/yXpsoEyr9bvcwGhIC3tW51M0uq7VEYsninoZtRyMcOyU8AO548dlWdM0fpfO2AUFQtGoP881pTSIhP4bBZqEMcz6oh1Jim5OrMjgwmJQNdeGefZCyPjJZ6jVw71T9FrUPP1uVrAfaWe+SNN/7wQ1wmVYv01OY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789169325;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=YLJJEy7HObDD1CKVtOGtdrfPLM+ZQOVKX8SKLnJRFuQ=;
	b=OSpO+nDbjm2r8l7mkKIyJCujhuLFgB8OxrhQ2lGVZWFVRFpJViQza7tPy7ns1RKE
	8WAiJH4r81CPXGHruIVYHrai58qe0O6qgDp80qajGOVHr1wbb6v94Ps4aULAyWYi3aT
	Z5jIEVkIUokJ8c4wFKqOivm3GgXXEdSHf22Sdauw=
Received: by mx.zohomail.com with SMTPS id 1789169324521206.45016185233806;
	Fri, 11 Sep 2026 16:28:44 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Sat, 12 Sep 2026 00:28:08 +0100
Subject: [PATCH v9 07/16] drm/panfrost: Explicitly enable MMU interrupts at
 device init
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260912-claude-fixes-v9-7-e588feaa61ef@collabora.com>
References: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
In-Reply-To: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=rGbyQBkNbY5a1OXBSal5Mure3AlHLFxQtfgc5Bhzvks=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqpI6DzEr/T1iUFVkI2QPrIHIjMCvGnDL6nJbhV
 Va0sFemfgOJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaqSOgwAKCRAOJn5M7lND
 PcJlC/oCi3WiKFWYZgTrnQ2gv+Tw4xWT9OHb9rRQzRnac/kwfT/VZ5l8Ba/N9P32EgoK8zeOJgf
 9AiBzya4Aai/R42StuSPTxzOaEsL8acTMrg1EQEokOOEsNvYA5cHD0mruPRvFzUyxHZwspEBxbK
 uR1qkk221tS6yy4xhTpoHX4Cn6jth82RddCvvVRzx2JYIWkUnbfqPk5xzFIJK6O72Z3B5OixdoF
 tQevfDZUCUomgHigJDkEohbstluxPmatrN9TetSwAVuCabW+OVczoxzSEfEVNDbgPWrHrV1E2iW
 4uWzaVf2oISrHckaHOoAnUQa75M3zybRXNit5lg1EQKz+WsO7hwXvMeLJVPnpYo6atimFj+uaxa
 dxpx/YhCQLD72qHgqcqVxfSEtV6K7zSB+97MBQrt5GBd5RszpeuZfJr44HmR9Y2CdtToM1kxtuH
 RPNbT9JYrMdgU/wdBE9YucNWjkxDldQJQzyWXn0YVYlcWGCmc20nBxIcTZyKKghtCUcFQ=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Because the device must be in a position to accept jobs between the time
drm_dev_register() is called and autosuspend first kicks in, there's a very
narrow window inbetween during which jobs targeting the tiler buffer
object would time out, since the device's PM status is 'Active', but no MMU
interrupts were enabled at device initialisation time.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: 73e467f60acd ("drm/panfrost: Consolidate reset handling")
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 5c393ed6e310..faa62643caf1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -336,6 +336,12 @@ void panfrost_mmu_as_put(struct panfrost_device *pfdev, struct panfrost_mmu *mmu
 	WARN_ON(atomic_read(&mmu->as_count) < 0);
 }
 
+static void panfrost_mmu_enable_interrupts(struct panfrost_device *pfdev)
+{
+	mmu_write(pfdev, MMU_INT_CLEAR, ~0);
+	mmu_write(pfdev, MMU_INT_MASK, ~0);
+}
+
 void panfrost_mmu_reset(struct panfrost_device *pfdev)
 {
 	struct panfrost_mmu *mmu, *mmu_tmp;
@@ -355,8 +361,7 @@ void panfrost_mmu_reset(struct panfrost_device *pfdev)
 
 	spin_unlock(&pfdev->as_lock);
 
-	mmu_write(pfdev, MMU_INT_CLEAR, ~0);
-	mmu_write(pfdev, MMU_INT_MASK, ~0);
+	panfrost_mmu_enable_interrupts(pfdev);
 }
 
 static size_t get_pgsize(u64 addr, size_t size, size_t *count)
@@ -973,6 +978,8 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
 		return err;
 	}
 
+	panfrost_mmu_enable_interrupts(pfdev);
+
 	return 0;
 }
 

-- 
2.55.0

