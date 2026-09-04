Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928B03F44FB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528319; cv=none; b=WzDGtApfcttRPalpA63guD12rZT3rZngisQm2rLAXa+8XV67yX9cvKAVkO0O+iE+uKDvtq0/duZmosgCHf8SM0MiIr393WJ5koSGNdPJ0wKh9ZemwiafYykmwnfbySSXBC734Cvs5hxxFPzs0185es49nvvfgvQBc5DwnTLWpvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528319; c=relaxed/simple;
	bh=JCEfWe4srFMBNJ4IU6yb5jRT2Bq3G4Enf1em6g43bw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7l4fMymBF0rp88yA2MIenMTJ6P+E0SAugtLjy+srI+9cXBr4qYgmCQzy6mZk/VSj7LJIgd0Gk2zwCpvW0ISt2c+KNVUIkRX7EoyhA1ROX3NLy2Y2/OEwrn7zrdtZhiVPGTzN+SHxNUpfpUcVUJGT5J0t0kLotdFOHVzjSjb5oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEJk7XEU; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEJk7XEU"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8568e3ed034so672091b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788528312; x=1789133112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2CeoIWg3k0WZbamELoe7oneAzQm7kp/EWq+eOPXTPc=;
        b=LEJk7XEUVVwrjg/8XotpZiCKQ+6q0N/8h0/9ijUMl6h6xYIhDX+n0jjNJn2uK3IXwK
         U/+TMM3Yj8r4l3La9Qh8Ff6zQyMIE5BwoNuGtTbk3eJ8YFbYBhWPN8JYRKMNIe4R7/P0
         RMJfddfnv35uGOO2ZFrPp2PRiz95bV0o6p34i/yfTbyebZCck5w8IxndFoHypKohOQlV
         Ew5cigXIZKohFtbVxkcH18Eeoh4LIoYsZdw+IKbQn7YfREiOpI6GHsG/BgCnxmzx2Pkc
         dJ+GxpCRJz1PTbDtest0yMFDrG43iP4Tj8c7gENEaSAwB+XS38tzbkoqm6ESkL4IweaA
         qQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528312; x=1789133112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2CeoIWg3k0WZbamELoe7oneAzQm7kp/EWq+eOPXTPc=;
        b=Dy5Gq5lYGQXeT2KZ5rNabtQJj4f5KAFUW85yLQLkGTKOH8fMD/od7YOo1nhKnCrwba
         lCGyEDs4XK28zBkpCB5Rcm4Q2dbF793hkxlYbX0gogfD3yOnqRKPI7e6vG3Zm9tdwiYr
         /dDNO6J/M2TEOZnCxro8FNZfnTliZxHu9L98yt/B5Mnp127rnf06bbqduc2K9xgnKrFk
         +jN9bRFpWZA2zgl/r95ARvPDXywgd+ioseVA5rm//beSfTy6ROvGp0xnbyc7UZSbJDj9
         LxCfAMy9EGnu1jeAZcorykIL/iFx0vvk4T2wcifnk2j7tMc0eZgzUaGN3dO91THIZBbg
         zZVg==
X-Forwarded-Encrypted: i=1; AKwUvBy1c+Kn97D9bfFPgtUb7Xgk0OLWjX6dPy6S1h6lcPKgJl/OItOM5IYpDkEtpCeU0quI5o5O0fdX4Z1Vplo=@vger.kernel.org
X-Gm-Message-State: AFuF++l4RjLPqswYZakN4k3PkrXAyoQfRVcHC9a7+yWQ+IcEoVf8K8MM
	Xny6E4akG/3fzEXCRk/63QZw15iWYY5Z/tz/z9GnjbbtrrOhzlWQeWgYrRtE0puO
X-Gm-Gg: AYBFou2D1lEySA2n0djRa1QFxaXuPlBW47bCbJMP3Wd0Ovs35c7MufbXdxcpLTkN4sl
	r/ef4ESgfQgLfyIaTnRmFs9aXVFkyslZjGM2lY5dBdgi7SBiyJVxmmFgCqv/ESgLIG7is3UZhW3
	HWx5SA1x/DfODah8Z3uWlG1HCJaXCtEyCo8iQsRQtOSsrOmKjRb97Dp3fEZAkI95wob0NFcD8ZX
	jf6sqNvOXO0fEL0yWsSmCR50p3H3umGCwhkT5ucL7c+RBYU99U1HORaYg5R5gsdFxbYmX7MWdaB
	9370GviTiJJUrBmghg3BEo77n75OHp0XO6XLYcNEZQPensn7Otlc6N8S3rd7Z7hQCXJ7GqbWGoE
	y4bg0BbtZM4ykA12ukxlWQtq8POuEAgeYeUnqzdnwhrciUefCTcl6m5bMmm59CfFYm/gkxKToly
	AuL4sG5E9iMCU0+2YTEdGUmOzyjWKa4aCLQdVi3u2dsczLPk1VN7c+++wV4+qQxj8n9c9LXX5mk
	rRpuLLRKIDEK2KHZB7/vrarw/f8UVwlq/H+4g==
X-Received: by 2002:a05:6a00:2d1d:b0:857:7317:cff8 with SMTP id d2e1a72fcca58-8616b2718f4mr7870760b3a.25.1788528311735;
        Fri, 04 Sep 2026 06:25:11 -0700 (PDT)
Received: from NV-J4GCB44.nvidia.com ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152c2a52asm1147302b3a.30.2026.09.04.06.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:25:11 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] mm/zswap: release retired pools via queue_rcu_work() instead of synchronize_rcu()
Date: Fri,  4 Sep 2026 21:24:54 +0800
Message-ID: <f9d47f077f55e68b18ab883c9cdcd166ee950671.1788528216.git.wujianyue000@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788528216.git.wujianyue000@gmail.com>
References: <20260830114731.8322-1-wujianyue000@gmail.com> <cover.1788528216.git.wujianyue000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a pool's last reference is dropped, __zswap_pool_empty() removes it
from the pool list and schedules __zswap_pool_release(), which calls
synchronize_rcu() to wait for readers before tearing the pool down.

synchronize_rcu() is a synchronous, potentially long wait.  Replace it
with queue_rcu_work(): __zswap_pool_empty() hands the pool to
queue_rcu_work(), which waits for a grace period asynchronously and then
runs __zswap_pool_release() from a worker for the sleepable teardown
(__zswap_pool_empty() can run in atomic context and must not block).
The grace-period guarantee is unchanged; the retirement path just no
longer blocks on it.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
Acked-by: Yosry Ahmed <yosry@kernel.org>
---
 mm/zswap.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index f3ae3c81e48e..e456e5080531 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -155,7 +155,7 @@ struct zswap_pool {
 	struct crypto_acomp_ctx __percpu *acomp_ctx;
 	struct percpu_ref ref;
 	struct list_head list;
-	struct work_struct release_work;
+	struct rcu_work release_rwork;
 	struct hlist_node node;
 	char tfm_name[CRYPTO_MAX_ALG_NAME];
 };
@@ -379,10 +379,8 @@ static void zswap_pool_destroy(struct zswap_pool *pool)
 
 static void __zswap_pool_release(struct work_struct *work)
 {
-	struct zswap_pool *pool = container_of(work, typeof(*pool),
-						release_work);
-
-	synchronize_rcu();
+	struct zswap_pool *pool = container_of(to_rcu_work(work),
+					       typeof(*pool), release_rwork);
 
 	/* nobody should have been able to get a ref... */
 	WARN_ON(!percpu_ref_is_zero(&pool->ref));
@@ -406,8 +404,8 @@ static void __zswap_pool_empty(struct percpu_ref *ref)
 
 	list_del_rcu(&pool->list);
 
-	INIT_WORK(&pool->release_work, __zswap_pool_release);
-	schedule_work(&pool->release_work);
+	INIT_RCU_WORK(&pool->release_rwork, __zswap_pool_release);
+	queue_rcu_work(system_percpu_wq, &pool->release_rwork);
 
 	spin_unlock_bh(&zswap_pools_lock);
 }
-- 
2.43.0

