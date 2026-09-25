Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDDD4302FC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361996; cv=pass; b=LixsPYyUjr9VtcMBI3vGjVuDuqWrDLFM1dX/sitFRA4xHkqqsAv2nfXD/mlbNTF3TCcq+Qui3qGdYZnor7mOJs+/E9C6UT2Msz/ulU//F6e3s3Drux9ng+d2EkTatjf4zGzVoZsdtFpP7vVmFl8XSImuaMOCwvvVbJebtd5M3Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361996; c=relaxed/simple;
	bh=rGbyQBkNbY5a1OXBSal5Mure3AlHLFxQtfgc5Bhzvks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfYtlKrqv+nKTQawUQ82zQM97uGZ+wEwFt/oVfSLJgIOKWTWY9KX2C8PAGAOwz8QKEfhS/bHeFBxztyPpQk6tqZlpSOOUGyKesLpHf6p+u46nsu6YMOobdnX0gXVHBsW6ZUfZDPRiFI2x479Ugst6nsSJOomjvRuSbrKLAS9jmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=dluWMrRu; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="dluWMrRu"
ARC-Seal: i=1; a=rsa-sha256; t=1790361970; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ka+pYRyslv1YKG26P0taMDp0iqLp+7tBiCE0zdASL5hR8gdicvUmqagk6RAy1DzdCTpnNNutJShKsybUh/WMKb76NAqsEcu3ldHdbbg50xXTr6xaDZ8ZhxVK8w4z4Z6gCqWgUEKnD7AdTqQpd+iffJqarW6aB1f7iTnQCNQfHJQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790361970; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YLJJEy7HObDD1CKVtOGtdrfPLM+ZQOVKX8SKLnJRFuQ=; 
	b=VOoShBhockOgAytuRxz9LnabGwtKvkOl1Jw4KQ8qBvx15nWnXpzmVojKK+PiG3YjAYCPFSBYRjnJTJREBnziDL5RgX3tQs0k9Kc+7+E0K/kkkx83Mys/vHr+MHohkX/PJpzizEnS5alr95Scm/uFyOuDADRPG4+orLNbMpX7HC8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790361970;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=YLJJEy7HObDD1CKVtOGtdrfPLM+ZQOVKX8SKLnJRFuQ=;
	b=dluWMrRuyqqM2UZ33uAa1bKifBvgBun+9346uyBBsiZhq5B9whIHrwO+NE0Bqzif
	tHhoKzIGl1LP61uVgb2SQ7Mea1/o66SOvl+9mzYZ6DDCRTZsxzLMzG7YDythZZVitrM
	6pb5IYv68eGsXkNOUqvOcMsFqPTHDcoWIQltmlS4=
Received: by smtp.zohomail.com with SMTPS id 179036196907533.2915581794565;
	Fri, 25 Sep 2026 11:46:09 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Fri, 25 Sep 2026 19:45:28 +0100
Subject: [PATCH v11 07/15] drm/panfrost: Explicitly enable MMU interrupts
 at device init
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260925-claude-fixes-v11-7-0dbf5a58e7ce@collabora.com>
References: <20260925-claude-fixes-v11-0-0dbf5a58e7ce@collabora.com>
In-Reply-To: <20260925-claude-fixes-v11-0-0dbf5a58e7ce@collabora.com>
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
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqtsFDWo7ZkrhAq3gw04taEgo2P4WNvLU/HEyuG
 4tcLtKj75+JAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCarbBQwAKCRAOJn5M7lND
 PUkDC/9TEQlyErsZH+gsYdWvYifzNRDRNqivltPKfC7XaO57NXN6EfPav3wgaHliPrhxJQtTCFQ
 0KUcDMMFD+SpHFhDlqIYXiNf4VzkAqp3T9i0VbnOkxrichaDkeuaKs2CAW78mrs2Mcn1TwQaT+0
 7sQjXAT17TGahBnmgw2UZbmKV2prwnWKHuZnHc1e7m8baK4VcKyCBi49uVTyfY9TtiIMO6paYzD
 pZwPnFQcegm0uT/BiAS5PnqqekBM4W70t9tguY4qO8b98aNTu5OqQmBNugz2VEGqmDkeXmvDcf7
 C0kQ9krqfytVgrhb2plWu68RUTeNWswRaxhzA9K2eDI3lhpQG2HD0Niq4r0HoOuDk7AZZSdQlqb
 x6B8fiegUa4uTUhIODxmtQk+ev6sp7bkUVEMGpsQLCliIchOknnZ7Aamaqt4FYmPCmbuHNuecgy
 7+Fe337yCHWPupddnfz2jJLLzgCLPCD0ie6ShNxWwEDcRXgRAHBg2zT7nqZzTC1XD7Ivc=
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

