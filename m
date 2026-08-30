Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD0E346ADB
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788090471; cv=none; b=ZCT1utCDqHwj03VLM65nkspaLSy0gm/UKi1e88gJPBdS7cMqEXwU2vnJqMmX3os3iWeaX+Jx3lnbMICtoc57Rb6uC+KmDmKM7wiCF5s7OCkFY3vRQoPNDsbinHD0kVoQbbxrLqsdQM2KE1ZHvf+usqPGB8f0H3ZecnQ6im8t0QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788090471; c=relaxed/simple;
	bh=8Lf8JSPERRhAveP2ulwaGRXyS4FqNXOTCVEmFATgblg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHW6JsYFJ+fVnJvmNYXk1STVE8x3YE8CauOGF/qR9WxOsfLWNdlcbr6IfmOg8fbpTJwr0c6cAV8QUKAYp6pGl6VarZgK26NwWux1zIVOMPe4zTuv9MkaZQLr8rzM1tVZUa1/qzo/fYIosv1PUrqnO4VjEoGiTNulSWckRvVdPHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L00LwaXe; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L00LwaXe"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so2602295b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788090469; x=1788695269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wo0HLGDj3y3Y33U9g+Ukt7jsaJQ99Obk41w4N/1Rf1c=;
        b=L00LwaXe0I/cvjQZY5BbxVRhCGemizzzEAiO3laCFgwuYmCxzhWPeEaEwInYgT6X7I
         mHPxQt1/2Uz0bShwV1oyUwrxEnaZK93afAG1jvbNFB3K5FeomlpbmPDB3B7t/Oh3Qq9f
         QhN6PLDMFW5y7UGXIfKE04dINX0du25AKSgMinheFobz7LJLZtEgovk1nML8ddDNzJ0U
         kecpn4JWx4sS2+k4Sw70M003wLNF2OJeY6rfLgNQSIaU1bOHeMPm7cBvkUekb3GxVlt9
         fRdE4Xd4DOXfKECJZCsahundRZHsgWMde+P9hU5yqrzIZ6++/LFxFCr+ZnHGj2va15FX
         3wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788090469; x=1788695269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wo0HLGDj3y3Y33U9g+Ukt7jsaJQ99Obk41w4N/1Rf1c=;
        b=EPUeUYdNG0XlyY7p3bPNPUjt2Z6Muii/RD4NQs/V9/heWqg3+3nGSGTpOLGKJ3aO0o
         MnJ9WYisGYTefjBszNshGx39aOLQDdv6eIurscgnM2xW1237us5JZH2jWfvDiOL4Ozj0
         QFGV2NtAXrEKYpZcnbq/6je+e8TTnU/ngzwX1zzfgkBgbcRZ9kTD3yOdqUOqwB3hrfjR
         f9++OPBroPRTPHXK4EdrSxHVem7eXOae4FtyZZpfptJDUVYAQ/qOz+tawPk3+fFRr2l+
         QL/pjUZcIWJCIxji/j23irzs747mvian7oUOXMgHvd07fVD78v3MP/EobHsjgRtl5jt4
         2auw==
X-Forwarded-Encrypted: i=1; AHgh+RpZ+11XUzlxPmFgM/IaD1kYR4cnfFCxkpsziV/Q76vVGGif3SoFjMgkL0Mu1BkWnrjXCDJ1vVg4xzoQrP4=@vger.kernel.org
X-Gm-Message-State: AFuF++mLAFPBteWjsH4X5rEIzTtYpC2AjQ69uW6N++8LBjdr2HerZamm
	nJwbbHgTHKgfidi726eJS3sBPfYD6bFRIK/FoHmHPQw9Uy+dwSyi/IoE
X-Gm-Gg: AR+sD13H6i19umzZYBlnC+dUGmZ6028fH+DuLSj2K38Ox5O9jenhUDy4c0Jhd0DXgBG
	xdizL/QQSvgw3VHyL6KiqVDu7wK+JIGPD7oyFe77VDPmzt2F/tbkUhNEXujwSeRapBovafW25bW
	NkMJS3PnXq50SGEwQuPm8/d4Rw9lnx35dUQnMhCp9+Pkg4fZQTQo+4a1qvkwi+w4FAC9nacMztE
	s40ia8pQ2nzMXWCnsw7ZrF7OOYjNWqypYgAHArYYL6aFRvHA1clhN7bzDc7YRIQh5TDkSbExxL1
	Np29DLbpc+VRSyGY/EQyRmyKksiRUxcpDSfIREFU+FH/c4nUYcn5ebI+U1Cfj6dmsWneBcPHx3m
	mDBz2jqj+21+WH8SAFzGYO1mT7jpT1JmGiEkNrxenR0PW9XJoeVejTKYPVRLXxxbCY5SzsXegwf
	MPwgHRmKOvvuzdhqIuaHuYHZ79V6aCQH4cit1RphGRSQpUBz4X1AccHg9hvhac0IgsYRVgPGphD
	wKEqsFQxo/apnMtSyuHSZ5bNeGs6OYmN6RVtQ==
X-Received: by 2002:a05:6a00:14c1:b0:848:8619:c149 with SMTP id d2e1a72fcca58-8562868db75mr29260125b3a.2.1788090469003;
        Sun, 30 Aug 2026 04:47:49 -0700 (PDT)
Received: from NV-J4GCB44.nvidia.com ([2409:8929:a7b:121:d0e3:2a32:8ea7:5ade])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a397c0a7sm2395264b3a.49.2026.08.30.04.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:47:47 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Jianyue Wu <wujianyue000@gmail.com>,
	Chris Li <chrisl@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 1/3] mm/zswap: release retired pools via queue_rcu_work() instead of synchronize_rcu()
Date: Sun, 30 Aug 2026 19:47:29 +0800
Message-ID: <20260830114731.8322-2-wujianyue000@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830114731.8322-1-wujianyue000@gmail.com>
References: <20260830114731.8322-1-wujianyue000@gmail.com>
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
---
 mm/zswap.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 37f34e406c8e..0bb30e58950a 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -155,7 +155,7 @@ struct zswap_pool {
 	struct crypto_acomp_ctx __percpu *acomp_ctx;
 	struct percpu_ref ref;
 	struct list_head list;
-	struct work_struct release_work;
+	struct rcu_work release_work;
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
+					       typeof(*pool), release_work);
 
 	/* nobody should have been able to get a ref... */
 	WARN_ON(!percpu_ref_is_zero(&pool->ref));
@@ -406,8 +404,8 @@ static void __zswap_pool_empty(struct percpu_ref *ref)
 
 	list_del_rcu(&pool->list);
 
-	INIT_WORK(&pool->release_work, __zswap_pool_release);
-	schedule_work(&pool->release_work);
+	INIT_RCU_WORK(&pool->release_work, __zswap_pool_release);
+	queue_rcu_work(system_percpu_wq, &pool->release_work);
 
 	spin_unlock_bh(&zswap_pools_lock);
 }
-- 
2.43.0

