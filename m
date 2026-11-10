Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289747;
	b=0u8b6VZZQUqu1C2Y7CRY/wE6vLtnw6kZ6zOu4BLvGARr3cClb13danrx6fzvjL7QriE1
	 aVE6NWotZ8nPCxE2nigH02KQPsQ6Dpafr6EE1+lDODHHH/ZsB1xXO9ilk/5xZj7Duq2kT
	 5sB1dsis3pIC3qOrZmqkXyxb02BfvEB6Kw2cLGgC4/dbO1AiCDcOorRRu4WvykQIXwTUB
	 F+mjTKxn7pWD/AigLE/x4jOpWtBfJPQS/XJZlY3YLaB4g/rFMpWYGMHBL36ezz9wUSS50
	 zHr0vKpzt2qM+b+3qaTjo+453rgkF/5y5A+zk4cDKnU3bWmxCXSkJrmMbDbVYQvlgZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mw+D+bJ+3Noc/aZs++CvNqR5iNHaaWdAu9wnY20WtvY=;
	b=BmH+7nTqYYW6lAo6Q41tXkw/G8lUlqwgP7lLecxhoI5LZ9wJcq21NG/anwm6/mjIr2MC
	 molGMA4AVzi4v90LsDkTYOsJ6YTeh2zp9odNTTQMU9s1t0EokC3CuyRp9MfyiDVqzswAu
	 hP3Lyo3otOqxpgnjzR96sRRDIepfR1CJndI8hCnZtXdmKjU/Hwq4rgp7wGrSkQhoI8BeH
	 6dr3usLkjyNkqTMSzHcTm4/GBQCk9Btzn3SG/GNz7m257OGwNIdJaFjZfFXsJzCvC4s+H
	 qq3mwkb/xQ015xQ04E9Ylm26CXErQEHT5F9NeT19pO6P9AB5f4BoPTmiB8hMUvZDQJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KFU83Kpc;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039D60A2624
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B039D60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KFU83Kpc
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b5efadd183so746039b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289746; x=1794894546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mw+D+bJ+3Noc/aZs++CvNqR5iNHaaWdAu9wnY20WtvY=;
        b=KFU83Kpc0iJ8WkYn5i1oIurqszwzvl+btKAQE/lifusXqac4vu5FHzr/tO39ON79O3
         f8VdJ/IPYAIPXVxFa1m2gMubstFs445BMqK00DdyJE0kQR5OTybQ8qabuiYcw26hserq
         L1V38PA9xvsTUuDQ3phOPH85Xh7+zNlYBuSAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289746; x=1794894546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mw+D+bJ+3Noc/aZs++CvNqR5iNHaaWdAu9wnY20WtvY=;
        b=tUzgR5MOcM8hZbSPgNc/EPap+3xGtIdFh8aPqUlGPyrCQ+gBvI/qda0aqgJ+Kg6wxE
         jETMX/ZH00yjEJJqbo563xamZPFDWBF6Xo5uqDBMp2laiGFN+ebtp9jYxJw0zKxltXns
         koDIghZQV6tmXFXMuYSAOp4GfV4M7+SRnnVUVNTd0lBkvTSccfkKj0+Ng+ZKAQceR34Z
         HNbGmAqMXz1PN0RQwkRZDTklz9tnNbEQsClIL7NAOoJHhMn1yajNeh31w1oeSmoCaFwP
         t0dInJIQHAru3/csl85D5epDhAV5Ry4k3J5oFgd3IwhrzTzFXOjmQrbo9LYYyCbPcfwe
         mmkA==
X-Forwarded-Encrypted: i=1; AL+hErHlMDNwPgUp2lKvKwAvlBZdGOfK8Pn1/EQfy5SPN/+GrLXqGC1fZeG/kNVPXNAVpqLkujrP50rZpA5bpuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yf7eTf1Ir9Hktl7zD8ptmE1dxhxkHaE2AmR5iwI/GSeQ+YoHU
	4PrOxnYbjoANHV23F8d7V+Vsja/x1J9t00iNe4pn2i9sTpo0HDIXjFYQkpnvYLELVC4ApIjvPvt
	VBOY=
X-Gm-Gg: AYBFou3e0CUuAar9WC7bR+GjnUS9nfrGi3VWJM2LD6hQH6ucmDizK3D3FlAkedgX087
	61vUEc6K5qUAwze29ULrhbrFB+sa/sXaHXXJ593UeAkI105DP6tsqgq9uGZcPYz6KJbZTdM7aoq
	KRnZBwY8q3xc2gYKuADt1FYDhvCHfZYaT3wBgz68TkxucIfk1swfGFs4SdEVCEjQSo2Nwh2vRog
	LhjB951Yu0l+Jh8TiZvnnLJZtemTuMzYO9Rov769DL/tVNc52xlbUQ6BcsiElhyeGeS5yZx9+MI
	41Tz0Fqn4rSP++Q5yORVP9XG6xkIL1U2jIyPhvjhOltnrPLHVmXG5tmgJE6g2cDVNX7frSDn4xF
	KMA24S0m7BzKGmH8qQRODworrxfwmy1hy5tleYfm4/L+5LTaAdyHP34Dl/rBR7AM4iUacNjHzsK
	7JMG1L5TLz4Np718r58XkI6BYyxDnUpEujXR/TN1wsmXhUmyTALoeozM6/yI2fVelKbnAOR6B0v
	10drYgcspWxakx+W6AAJ9kJFLLMbB/ZtcKPoicFPgqtzL54y+N3jvRpMURrtMUd9XBSBiwoD+qd
	mzZTMfjuhBD+WXXdP30CUkqHz4mxLPsHWRMVoZEQSdcIEbBFSNochJWiN+yt1ZdbfpvDZFsJO0W
	srk96yXCwp5WSdUozQw==
X-Received: by 2002:a05:6a20:7d9f:b0:3e2:8c65:b229 with SMTP id adf61e73a8af0-3f172725e87mr1467840637.11.1794289746035;
        Mon, 09 Nov 2026 21:49:06 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d67e53asm444634a12.5.2026.11.09.21.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:49:05 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Yosry Ahmed <yosry@kernel.org>
Subject: [PATCH v2 07/11] zswap: do not free the entry if its pool is NULL
Date: Tue, 10 Nov 2026 14:48:12 +0900
Message-ID: <20261110054836.1515030-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <20261110054836.1515030-1-senozhatsky@chromium.org>
References: <20261110054836.1515030-1-senozhatsky@chromium.org>
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

zswap_entry_free() warns if the entry has no pool (which should never
happen), skips zs_free() and then frees the entry.  A subsequent patch
embeds zsmalloc handle into zswap_entry, so zsmalloc object will point
to the entry, and we cannot free the entry while the object is still
there.

Bail out early and leak the entry, its cgroup charge and stats instead.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 mm/zswap.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 1160bd34e289..dc0400d7e1a3 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -787,10 +787,11 @@ static void zswap_entry_free(struct zswap_entry *entry)
 	struct zswap_pool *pool = zswap_entry_pool(entry);
 
 	zswap_lru_del(entry);
-	if (!WARN_ON_ONCE(!pool)) {
-		zs_free(pool->zs_pool, entry->handle);
-		zswap_pool_put(pool);
-	}
+	if (WARN_ON_ONCE(!pool))
+		return;
+
+	zs_free(pool->zs_pool, entry->handle);
+	zswap_pool_put(pool);
 	if (entry->objcg) {
 		obj_cgroup_uncharge_zswap(entry->objcg, entry->length);
 		obj_cgroup_put(entry->objcg);
-- 
2.56.0.506.g506a7eabc5-goog

