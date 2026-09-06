Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE8D37F732
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 07:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788680850; cv=none; b=FydSLRt2Co+bk3lvQ8dOptQwPTVLQv64MAD58iH0ZdZeQJUq/V4mXgIfv5l+vXun81zkpWM5Ml4SB/ar6nI63e6tHKBRE4qOjF5Fkme14KO4KENr2VxdGA/FjaMQ/zXIIxIMocVGEp/aoFtp1ZzYVn92VnGW6LsJBqn0XAlomM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788680850; c=relaxed/simple;
	bh=WwjbCGbpKx3pybwGrUA8/VZT5w49m4g/k61kb6kkG0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQlRbvtM64Sj0OtBcY45WoxpMM+bPEWyPKGuXvCesgx900/1lRYSVpdZijqI8ADSX65w/RIoo1WqTE/r1JFwmzlvzFIjwFo9+nzWkGsRjUulIyPGdg0Fi7lgonhMTvGp/OevShDPlJC8GVswLiujQC9lyFyOh6xawfMTHg6DVbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZezG3rF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZezG3rF"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d8fd3b729dso19949725ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 00:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788680849; x=1789285649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cfzhdafKOPcmowjGTCbLXY0Cj8hfEc5olvSFaFljUsg=;
        b=bZezG3rFWJSLTQ68REQzcEQhI38jA4iGFDjaRn00Y3BoMh8J/vCkZ4p8CyzznS0hAY
         KszsESoKD6/PubbQW6F9dp/i5ImXAeFBOtsAzBbkZTC31Dfv2oz6l4MewdcIaUnZDXm4
         P4wY2GPd9JpWkj7832idj0nhzZ4IxElilaFsogu/Aq9kNHY4W9R6Fje4gEfLsq0a4X/x
         Tr4LVe88IrVz6WHPa9i/7uvk2Y1fU7lYpqnz2QzE+fgt2hZqW49OqGwz4rszSwA9qlYl
         vDDGY6pFSvi3mVp4O+qTXGrNm0S8zxvr+NUbAazYORVXWbB3pcpNpzIHny7Y/g501kg1
         2FDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788680849; x=1789285649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cfzhdafKOPcmowjGTCbLXY0Cj8hfEc5olvSFaFljUsg=;
        b=ArPyBUpZ+4WNr1Mo8qrPgQCw2jV5C92HfPyb+1OEPBM4wrdSfXwL6dKZwbATWHAkkF
         pzZYSD4zDV+kzWezTzwnMglgPKeDw7XTT/jqaacgEeQctsiZhZJGOszUQQhXyOrncCDy
         T/ulaw5LNrxx/CXzz5mYJ9krXMSUDv5oZSNtgiTz2eCfBZ6rkOCFTGmwiQ9JtAgOLBVS
         wjS8eX7sOFumiDP73DTJW1NaMO/rpvzsCKbkCw7/xNSFzIfQMjrWw1v57E+pPUlzj/10
         CJF97visalIda6n7nx2c316Sc7AxARy/hFlqbqTSvkj/ChyvdfEKRRqd/bpU1/sN3EqZ
         Kt1A==
X-Forwarded-Encrypted: i=1; AKwUvBxnTpBz2Y61Ng5EqJkkI3m+00UZ7lWmf4X/H6w2mWMm0A3tAswxum2q8ORxs2Yf/ncg2lanJY3DPjw3o3s=@vger.kernel.org
X-Gm-Message-State: AFuF++ku2dyW7BWjGvJYHcPyi5CWRbe1cyWv/MO/VZIV5HzF5zy/qpPl
	KAHcnD3pyk3q3zNPuJf2SMkOM/OFsSdSM9Kp+piJ2JmqwopiwG6MXv3jXc25R11ufvA=
X-Gm-Gg: AYBFou1hOMQtoU24bKCo02LaPv1w3ay+QpxVd/CNY8Q2Dw3bobS3nBDWdksaJ4DREEJ
	SEoh4HfLq+LHtnJrCdlp1bG2pdCMqI978ImnMof2eQMK7b6chHPzuI5tdNCMy35dnPTrCL0APdg
	EzotKZVNxyM4NAIBzgM4LivRD6IzvOqwK95NcGq12RdoORmFrwX4VWOq4YBvbZPuzvp8gvxBQEs
	OoRoymAnNR6jZkUdJps3jKTZxpMOUVW3XVqY3pOLpA6dei9YgueHCIKweEfjFr1sLh0qt6TthCr
	Ld6DkiAh5w+zhF1OU/61ydcmKvA0Av7fH3L27hQQ5KZT15eG99PWW06HiHhaL2oEyyer3KngbWj
	AXP2aiRpW6+J8LOcYM0TA7KVPWEscTyHxoRTwviOPIhrA2ykCclWoBYA8nUq6syCpKuNnUJIeSk
	Bs9kPLLob/R1KVCUQOw77/WtH1NYn5/ZSmtDWxCrM3x5GMMygFqXrC3Rj+T2oNQRz1t8QofAVqe
	XWS1xXYhB0HuA6U2UwsCPmnseg9Btqs6AxPwrU=
X-Received: by 2002:a17:90b:4fc5:b0:398:9be6:f996 with SMTP id 98e67ed59e1d1-39b262cee58mr28681622a91.21.1788680848803;
        Sun, 06 Sep 2026 00:47:28 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm21138905a91.16.2026.09.06.00.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 00:47:28 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Sun, 06 Sep 2026 15:47:17 +0800
Subject: [PATCH v6 1/3] mm/zswap: release retired pools via
 queue_rcu_work() instead of synchronize_rcu()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-shrink_zswap_entry_v6-v6-1-ac4cf61565fb@gmail.com>
References: <20260906-shrink_zswap_entry_v6-v6-0-ac4cf61565fb@gmail.com>
In-Reply-To: <20260906-shrink_zswap_entry_v6-v6-0-ac4cf61565fb@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
 Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1788680840; l=2137;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=WwjbCGbpKx3pybwGrUA8/VZT5w49m4g/k61kb6kkG0c=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMYNV8pIDrz+M/tSuqNBmingl1zVngKIT7QYZIxy2wkQbA4+uO1BijhHckb3wo/z69o0S4pYyv9
 Nlj2JS8UmdAg=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

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

