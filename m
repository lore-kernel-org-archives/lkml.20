Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854101;
	b=AXoiyxgYp/AXOKVQjZRrn8RGxcMbbFwzClCsDg6lC4JqJ8FE++bPvPWxTw6py5/DAMxV
	 9zmbw79R3+t0yW1bMSIFEdmi9kSPIUX9qpYTrKW0hRxCPzW1z16fAOa0CdlOSFDuRrcqO
	 Ipzrrdt9uUxX6Biybv0P38jP2XaZ2e+XECew7XfOSEy+BzNIH7rDRV2lGJYfLEd3rCWwi
	 l2NL5VGYS4ZSuFsByFhILkG6Yuna5Jemapm1cHgzwPkX+SkwWS3XmJ6z4NLVLpsxs2kLP
	 LYEcvA8wIIV8p6t6d4ewpPhMKO0XjP/d4/ZmQfIlsxjesZ21SMGEXAyc4fz1vY7OXBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z4CptPZ1xxIkHaBqUwJgyo6uh3NXVfD6E10G6VWgJe8=;
	b=2WC8YIMXcL3RrreYon8kyL0x/koWqTkv2EnEfVaYNvItpyumf+bQUryG4qpqExUjXgiv
	 aAdaJ37/Vh/LLWMVlUW0MW95Lbh+yq5MvRoFJWjLAPQSDViyTACXZp6sDGWU4IqCTvsFe
	 JljryZ4opV6t2iPXzpjL4ILIKvtQbAFgqjoF9f9c/JGQeRC5B0GMDvbdXGwMblRbhBs+t
	 67GPzJivh8A+ajjdYxoANcL39VM07U/7lCfKQdAJP9DW4DKbIPkin4t9DA1ff+K5c24lD
	 wzmoHDoDlq+BcLR4bZJPlDhdUb5uJYVEwTFLYEEe7BkEjIa1IDYxMTWC7J4cG5UrNJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=U+aQgEZx;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ECE606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21ECE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=U+aQgEZx
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so2523279c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793854100; x=1794458900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4CptPZ1xxIkHaBqUwJgyo6uh3NXVfD6E10G6VWgJe8=;
        b=U+aQgEZxeS5Pre7SDZg848BQdqMpLL7Cd5tR4LeM0Qd358dg8QaB+rw3k/7OcykJnh
         VIidf2eRyWud4n6W1l7WdXDRcxxw8rJeoMdABWWD0TFNc4DeYOlOndfx5+ZowprbJsjM
         9PqRK0VDzKr2FVQh9FMNwF2M8h8rIVf5VAQUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854100; x=1794458900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z4CptPZ1xxIkHaBqUwJgyo6uh3NXVfD6E10G6VWgJe8=;
        b=wr+q5NeZdmkHYG7sGpn33w3ThPz2CqZAaf+uXK9UFt9U/5l9/5PZQLE/hv+eeqRjiV
         616uYu12PNOF5l2UFpnYjQLjFmy2i5yZ/eISa6InQTCMnDilYn9dlS/2hqI7esl3fQvP
         hEwqTIV2Elg6TZwlzqmtCT0y5jV/y22JfRJfkiz+ieEvWbbI/CTPIgbnxMkz60GWw5/q
         dXWbDIzx3zfveDDOEhFGvmc9sdUKZR/kyoQUZ8Ip9lOnKeJzNtYHul6BVbKFOiBw2SaD
         BjdUflKoPjakG6U/AwnYilMXA+ND81f+TKgj0kn7J1FeTXauxxlom5M67Fl5z43tX4BK
         oBbg==
X-Forwarded-Encrypted: i=1; AKwUvBxa+69TIHAOoTUW0gU6ECr2a8T8OhfGhlnO7cKWB3RVenUNlAKkFISAIJ5e4fGq9F/HEx0XYQERb91v5hY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C9QlceKDWhg/IGXvuSNBDff5sitBmKSgafkbsbLzyg1FNyd8H
	1LPcPEKF+ZKf68l1UbEWavehX5xWEQHIcZxFX6N7YW9xjoWXg/pP4n73TxFM3XWybQ==
X-Gm-Gg: AYBFou2vxUUWvShvoHKKAsWDoVMLjB6ZL60hBJX03sFk3MezA7ENKtJw2/3OjwUG1rg
	pH99vIz8Exy1oIvzOD3Hy0BzmuzkDX0f1RPRJ/9M2PTXy3WekArCFgsaNMAtKZXVqGvWNpObc6A
	g3aREeqmH8YUSpAi08pJ/GSywg3A7K/gxdU81k753UsnRYFrzloJ5c5jz2FqP/6AaAYJ5l9TN66
	KphAy6+ToTVsxrP7edeCf2diYM/YYzkY21RDgicgGRhGgECFQz3EaTa6ijNnLbEUWjjogSW3gUK
	MOUPbW810zP41V2rUgA7VcbCXAy0+SdG3Lhho5ptSSxIhn1vTMlidPUInm2Rz8HHGFi2yaUXp58
	7UkozC6FMNLgzMlGz2b63GnzZ1gh3cBHY49j+Stb7bJvZZdc8zx9W+kgNa77gSFNIXGHwmbuDjH
	ZxgbdNy+rcL7zfX1as0QxWE3arklOYVsFF1ihy94st/qGmrKtq+wVd8XdAg9k1+FJfgKBgsLm7Z
	breRGmpsh0PgAqeJ1guD4nuxNsPlFdyfPItioiEQPt7fulZxBSZap9YDZGdmSsfkSJ/246NPpAr
	e4TiAMK25eTrVJ7Tz3LcWDcp8mqqE5JdBe7vcYO/UzcW5KEqqjWtw/koybv/ahfqJidZHdvQ/k+
	zOd82Vf8hqHHdavKSac66Ay6sgXptK9H7Ud6qWMQ=
X-Received: by 2002:a05:7022:7e0c:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-1ac5a0b8a9amr26997590c88.14.1793854100117;
        Wed, 04 Nov 2026 20:48:20 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:37bc:b763:7ec7:65b4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm17142927c88.21.2026.11.04.20.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:48:19 -0800 (PST)
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
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 7/7] zsmalloc: constify struct zs_handle pointer in read-only functions
Date: Thu,  5 Nov 2026 13:47:37 +0900
Message-ID: <20261105044752.1997895-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105044752.1997895-1-senozhatsky@chromium.org>
References: <20261105044752.1997895-1-senozhatsky@chromium.org>
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

Constify struct zs_handle * in functions that don't modify the handle.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/zsmalloc.h |  4 ++--
 mm/zsmalloc.c            | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/zsmalloc.h b/include/linux/zsmalloc.h
index 674358f39191..793fc887015c 100644
--- a/include/linux/zsmalloc.h
+++ b/include/linux/zsmalloc.h
@@ -65,9 +65,9 @@ unsigned int zs_lookup_class_index(struct zs_pool *pool, unsigned int size);
 
 void zs_pool_stats(struct zs_pool *pool, struct zs_pool_stats *stats);
 
-void zs_obj_read_sg_begin(struct zs_pool *pool, struct zs_handle *handle,
+void zs_obj_read_sg_begin(struct zs_pool *pool, const struct zs_handle *handle,
 			  struct scatterlist *sg, size_t mem_len);
-void zs_obj_read_sg_end(struct zs_pool *pool, struct zs_handle *handle);
+void zs_obj_read_sg_end(struct zs_pool *pool, const struct zs_handle *handle);
 
 extern const struct movable_operations zsmalloc_mops;
 
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index ff1cde4c5dc2..e0f89a3b77f1 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -805,7 +805,7 @@ static unsigned long location_to_obj(struct zpdesc *zpdesc, unsigned int obj_idx
 	return obj;
 }
 
-static unsigned long handle_to_obj(struct zs_handle *handle)
+static unsigned long handle_to_obj(const struct zs_handle *handle)
 {
 	return READ_ONCE(ACCESS_PRIVATE(handle, obj));
 }
@@ -1110,7 +1110,7 @@ unsigned long zs_get_total_pages(struct zs_pool *pool)
 }
 EXPORT_SYMBOL_GPL(zs_get_total_pages);
 
-void zs_obj_read_sg_begin(struct zs_pool *pool, struct zs_handle *handle,
+void zs_obj_read_sg_begin(struct zs_pool *pool, const struct zs_handle *handle,
 			  struct scatterlist *sg, size_t mem_len)
 {
 	struct zspage *zspage;
@@ -1157,7 +1157,7 @@ void zs_obj_read_sg_begin(struct zs_pool *pool, struct zs_handle *handle,
 }
 EXPORT_SYMBOL_GPL(zs_obj_read_sg_begin);
 
-void zs_obj_read_sg_end(struct zs_pool *pool, struct zs_handle *handle)
+void zs_obj_read_sg_end(struct zs_pool *pool, const struct zs_handle *handle)
 {
 	struct zspage *zspage;
 	struct zpdesc *zpdesc;
@@ -1395,7 +1395,7 @@ static unsigned int obj_to_class_idx(unsigned long obj)
  */
 #if ZS_OBJ_CLASS_BITS > 0
 static inline void obj_class_get_and_lock(struct zs_pool *pool,
-					  struct zs_handle *handle,
+					  const struct zs_handle *handle,
 					  unsigned long *objp,
 					  struct zspage **zspagep,
 					  struct size_class **classp)
@@ -1415,7 +1415,7 @@ static inline void obj_class_get_and_lock(struct zs_pool *pool,
 }
 #else
 static inline void obj_class_get_and_lock(struct zs_pool *pool,
-					  struct zs_handle *handle,
+					  const struct zs_handle *handle,
 					  unsigned long *objp,
 					  struct zspage **zspagep,
 					  struct size_class **classp)
-- 
2.56.0.398.g882cbad275-goog

