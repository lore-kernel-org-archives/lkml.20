Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E899623817E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790813681; cv=none; b=LFBFXxdwoC2Lm1wGN7c+1mslPd0OZxHNw64d1Roqq0TPinbizV1TiYXayIjTi+EFJkUylpP4Jdl09/y8IdPmIcGFWICoeLbv7KNYCOPhYRm9cEVjUFJ3ewvry4PfmF5pNgs1vjtMw8WiU67m15+Ls5enT0IBwWtLzK0mx3LeTFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790813681; c=relaxed/simple;
	bh=m3K/nU+BPMsjP+r7kozu+Wc5LTEG/nNcFhtlcHe9AB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YDJg9fLHSIQh0PIhzmEopadY7VCXB0GvnODMEhAQ/kaPBtHreDe9hlElQ24cHtiP6xtbbwezFELZr7zFV96H8+/9D7d3a5UaiQTVIzH3yDjMryz8DXhrW212Hp2OLGHh4StjWK868yV7wx3TOsRcIxISkC0G9qDVnTkDdu9fxOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODZhkWwZ; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODZhkWwZ"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso2951924b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790813679; x=1791418479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esyIJ2uenCkgUW4Bg5yqCYNzAMp/sriEEB194HG2gS8=;
        b=ODZhkWwZ8GvBPsApVVeW3n57hcFbjylCythoVrjPMYx/jzdWgfu8gmnY2g8xwM7l2u
         NITDaF1SFfv/ZkTk1Jq8PPT9YRnNUcVSz0FKaBppLqJ2+F8kGt7YKzQPtTxWw3m4YQZa
         WXrxZmpQ2ZnE3xhEwKc2y/JnecpVV8pPVWIgwrKswiK5frx/+/qYOEk/K68nisUOJzsp
         AJY/9A3Fp0Prm5RY/w/fB0KS3ZQuF+19aJ9g5Qm0l6LTq69qV2Ikimup2RwulfNNWVVw
         mwdm0n8YZLTv6rWyA1OvEU1s92HPpWE/vghEmH4Uio1zDSkuD69viED5qqLeUVVMglu5
         OyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790813679; x=1791418479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=esyIJ2uenCkgUW4Bg5yqCYNzAMp/sriEEB194HG2gS8=;
        b=MTEg78vbjPX+/kYomxocpOk944z+bZv0nU8BIJIdfSpcog3PBGPyThkTYl7lEKNqQ1
         Bxs3BhbNz3NEhrs2uV1TYMFnnfrrDn8qq8vbItI0mH+x4FVhHQm3MMekTuFHeHUaj7nY
         BAyEYISCcsQ5vUnfjqP6oP4GNmKy0sPzVqpv/hpOalSqN7iWV711lBwCZdnBtEpAEY9B
         JTdZcNQcmkM2KjTZEI29I80Asougg+TV3AFZ/kaCXW92ACy/ENvr7iH8vezcg7gOQRUR
         YukSG3tIxOqc0GLdQzNZQ30YPcBP/J5cj/XdDGLlRQ78ZpnPn8nwBunb6tSbs2BDztT0
         Y1uQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCxNgd1eK+Y+RyGpSSScedU+Y8MUSEwcjluHfk3hUxtl7Xr8WlMNmP8cD3+u/5kjHhvJxw7jt+pge/UnE=@vger.kernel.org
X-Gm-Message-State: AFuF++kR4JOW+wvHnIo/Mf2Y5NiJLj6BcgMLFA8WWtvQ1LJqO1HAHh5d
	uAJfuH9mlbUzdQYqrDurRNQcEzy4iWO0vAmI6Bq1kKpbuQ11d1JOIM4B
X-Gm-Gg: AYBFou36g9xCx8GQFY5c/npvKCdJ+1ruSMgX53dAvEeyxe4U5ENJJhb8N7ocRJObVvA
	jfVkXo+KIXgYNNwACHXQ6+Jn2t1K43DeF5uyjfppvK/Ew0+QJm7rMlyj/VfEp2TIGAvDt3yCqYk
	qLxemJjCGUCLcVk6wyPu4de8RLTeQp3F3jwaP7UE+d6a+0b5El6kB/fr27tftxjrbla4fmU8aHR
	HUfNhL5RrSMGFVH3wFBag1I0MyJW2/TiwgSPmIppdfkcFsHC71bWDmzdUpDosow1TY5aGpHtoXk
	VMX34g3ZajiCiI92p+mlCZSHM6z1xUW2W/imqQ9zAcCRdf+H/0xd8CZnvBLHWb3KVv6u/AhY640
	AEn7O8zAIRnhXwPFy8iZmKF8Rl8HotHDa2oXT1PURV+rb4Xk+nKG7loBsy6gUUREIHa0I1J2zrn
	bCnxiTW9s688XoDdvZZdGfu33+IYqXrNDgwbGezA+KtyOcF/IAnC6Q3NP1RiriHZkFY8sxyIkcQ
	MDjVJp44bGTJPpG
X-Received: by 2002:a05:6a00:148b:b0:877:b053:2e04 with SMTP id d2e1a72fcca58-887498012a0mr2291130b3a.2.1790813679163;
        Wed, 30 Sep 2026 17:14:39 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818814b2bsm253287b3a.19.2026.09.30.17.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:14:38 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org
Cc: surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: [RFC PATCH v2 3/4] mm: compaction: skip isolating large folios that already satisfy mTHP
Date: Thu,  1 Oct 2026 08:14:11 +0800
Message-Id: <20261001001412.3837085-4-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001001412.3837085-1-zhangbo56@xiaomi.com>
References: <20261001001412.3837085-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When proactive compaction is triggered via compact_memory and mTHP
always-enabled orders are configured, skip isolating folios whose order
is >= the maximum always-enabled mTHP order. These folios already satisfy
mTHP allocation requirements and migrating them is unnecessary overhead.

Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
 mm/compaction.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/mm/compaction.c b/mm/compaction.c
index 3928a5483efc..0ff454ee5604 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -82,6 +82,15 @@ static inline bool is_via_compact_memory(int order) { return false; }
 #define COMPACTION_HPAGE_ORDER	(PMD_SHIFT - PAGE_SHIFT)
 #endif
 
+static inline bool mthp_always_enabled(void)
+{
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	return !!READ_ONCE(huge_anon_orders_always);
+#else
+	return false;
+#endif
+}
+
 static inline int compact_hpage_order(void)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -839,6 +848,12 @@ static bool skip_isolation_on_order(int order, int target_order)
 	 */
 	if (!is_via_compact_memory(target_order) && order >= target_order)
 		return true;
+
+	/* We are compacting for multi-size THP allocation */
+	if (is_via_compact_memory(target_order) && order >= compact_hpage_order() &&
+	    mthp_always_enabled())
+		return true;
+
 	/*
 	 * We limit memory compaction to pageblocks and won't try
 	 * creating free blocks of memory that are larger than that.
-- 
2.34.1

