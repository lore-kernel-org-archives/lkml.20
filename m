Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379667;
	b=b5yAqa2TazNY7CR42yhDYiqkxIF+/p40whajsrnDX+tXECD9fO2KKFz8HQQeLfwrBdOK
	 pJYCpaSNNdnZx339md4tEPPIMt1SOz22rkXlh+PIWVPFomtgVlxlhXOX/xsaR7iVl5Jnd
	 49E/21y8qmvx9UzQcfL1RNt2e9IIkCUS9bmibm8fPVujfoP6INqN/5TlJcupqmRY/v3NK
	 gRQMHN5TTVIMDFOtJOVvkrYrRgJd+O5ni+Mc8ll537couZsqkZFttLfkmsyGe8Lrpc9/+
	 DzbFlhqFf7F3P8FDQG/BQ93SFNl5qWv+wXaMFqBu7f1FhfsRO0e0ciJRRU8CaSGRfOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bvnurKRq/kU9ebhETLig/zqsjvD96i3F51B+gs0iQaU=;
	b=YoeMSH/D7WIav80r1znuvqe+5NFUCC6XCTizF3O2tvPNeDTn812aPVe5CvyN8y9hmXXy
	 2ZUbFneHMsPL8VUHf5IGy8hiOyjIoi4NgES6z/tUkMtDbEG2wf7dPRhNEjPTSjge6lFYc
	 1ysee1d+lo0G9p1WskFDmFFWUJcTYkcAwNV6ZhFl3NF+ImsaN0HUsTBUjfCMHuw7sYtDH
	 bCtYuz6m7V/GdD8ODKS4sreJHT6vGrGqxsxMqLsfukcDfmWK5DqvnQoaJPw/Hao8UNLb7
	 otvYLqWcnTAe/IfywWX50E7S7izYZruZX1BTOBKUjSvZwwuEZ+mn0X82HpAGeFFWYPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VLJ2HuRu;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AAA606B479
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1AAA606B479
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VLJ2HuRu
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb628232d2so1703717a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794379666; x=1794984466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvnurKRq/kU9ebhETLig/zqsjvD96i3F51B+gs0iQaU=;
        b=VLJ2HuRuoj5amitbJWoXTKqcESYkJs3OcUkRzhVvHMwJZpQGA2aGy5LI99GenuD+is
         CG7BpF/xXSkoyIKVAhrJjE0CdSsBSaYgt+vPR4GtDS1HPsRCu89Huzu396qSj3hT3jNM
         XPD//SbYtaO7o6inx+QxLcLXs0es5LZxvfIGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379666; x=1794984466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bvnurKRq/kU9ebhETLig/zqsjvD96i3F51B+gs0iQaU=;
        b=CWkvSGi02P/3fLnXkC6KdWjiMU0dwgRCg9iGRbBwOPwUB6JvTLDLaImgkwYO7LjYCs
         ImNf9WNUShIcUqVhJxIC+ijh5o10hgPrvrxB5oLJw9d0YPpRMrJnb/4ItEzQ4KBWHimy
         yz1Iovw5VMd+vucvfq/iGgLEcUpgDJa66rKAJZbm5qYqFGEpapmEy2K0XAnqQtFwkTam
         Lm/Pr59N20TVplMDE6gve79zlT5RTEnkmvnRtY8WFfRPMx970wLxXBSDfM8OBMf8AA+i
         8YlfLRIrVOF5E39VQqVLHqDrw1cQtEst/ntCad3rLouDZAnAuJWZQMTzn8dkNWhxdcI9
         Dwxg==
X-Forwarded-Encrypted: i=1; AL+hErE8Snzp8B/agthUVJdy4wX4YztYOG5lwehamiCeHvn1klMKFrs35YBDUg/pVcMUKeC6KrLF8W4cj9kEcb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z82PlAQr+SDaxt8orBTvVVSVjKoTHiBe17mqBWTYJfRmdSp/0H5
	0RkchZav7yTzaaGwQJl5kEWkK0Uji250OT4vCMuibEY+nf3YXJi4XAAQhOjLrsNoIg==
X-Gm-Gg: AYBFou3R8oIpK/WNVDUz/twV3EMYaHFY06UiSEHOhamYQN8PDUWv+voWw612quZQ3SX
	OIix7ujHfOxkz3GmmDPEYSNkWab6Jn31GPeSyXNWHVCQQsAefSJ3Dgnrjqx+eiIFP0slDHTbTQo
	E83lhyWRwNfA13IIod/6oJ4Nr+Cn0nLA/cOD7klHs3g+vSYGKHYMBOr6JN0XGABEiiDSjiCWzZi
	Pl2iP1ztx4PhmHRMtFob7SlZUvvFqIZ1idoVzZckicb3WYa/EAHWufN0xl3lzr/7I69h7AhLBa8
	xuxknT5X2GO/bFvy/MqS8Hcw/yVTnjaSjFPyxJPVzecIEmF5p5XbZ52FXil6Z/cD2nRY8quoYp0
	JIxwAD4csTNOFTNo6IpXMXC00xnqrPWKTRlDmZpNBr6SvlGVwRX/FHXUyTbL8L0IwsrUU6guwoe
	78B28k1KTashi9ufZGf4y4sQUZA5E3rzeh2r8e8AxQQ8rjddw1AoD7x18JemzT39A6mSx4OXG4g
	nY4MeqksIqpK5kv9lpkpLx9oRrZRlU2ybyIpF2qVKkbg0RY3QtTZfx8JfKyp2eEBQUWPw7o+iX3
	h7v9DR/TFGQxZM8S6GF0NG/6nluRIL0/nLelDuYJEI8+CjCMxDHSLxyuKYxSSM6n/mVLrCCdFaH
	NK0UhBc7Njed6WY34sQ==
X-Received: by 2002:a17:90b:3c12:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3b182efb4e0mr1748244a91.37.1794379666174;
        Tue, 10 Nov 2026 22:47:46 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db85a9bsm3268666a91.14.2026.11.10.22.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:47:45 -0800 (PST)
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
Subject: [PATCH v3 11/11] zsmalloc: populate new zspage outside class->lock in zs_store()
Date: Wed, 11 Nov 2026 15:46:34 +0900
Message-ID: <20261111064707.2568433-12-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261111064707.2568433-1-senozhatsky@chromium.org>
References: <20261111064707.2568433-1-senozhatsky@chromium.org>
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

A new zspage is not on class fullness lists and is not movable until
zs_store() calls insert_zspage() and SetZsPageMovable(), so neither
other zs_store() callers nor compaction and page migration can see it.
Nobody else has the handle yet either.

So for a new zspage allocate the object and copy the data before we
take class->lock, and don't take zspage read lock.  This makes
class->lock critical section shorter and saves a zspage lock/unlock.

Suggested-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 mm/zsmalloc.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 7f1cedd34081..4a6ec43f418b 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1323,8 +1323,12 @@ int zs_store(struct zs_pool *pool, struct zs_handle *handle, const void *src,
 		/* Now move the zspage to another fullness group, if required */
 		fix_fullness_group(class, zspage);
 		class_stat_add(class, ZS_OBJS_INUSE, 1);
+		zspage_read_lock(zspage);
+		spin_unlock(&class->lock);
 
-		goto out;
+		obj_write(class, zspage, obj, src, size);
+		zspage_read_unlock(zspage);
+		return 0;
 	}
 
 	spin_unlock(&class->lock);
@@ -1333,8 +1337,15 @@ int zs_store(struct zs_pool *pool, struct zs_handle *handle, const void *src,
 	if (!zspage)
 		return -ENOMEM;
 
-	spin_lock(&class->lock);
+	/*
+	 * New zspage is not in class->fullness_list or movable yet, so we
+	 * can allocate the object and copy data before taking class->lock
+	 * and without zspage_read_lock().
+	 */
 	obj = obj_malloc(pool, zspage, handle);
+	obj_write(class, zspage, obj, src, size);
+
+	spin_lock(&class->lock);
 	newfg = get_fullness_group(class, zspage);
 	insert_zspage(class, zspage, newfg);
 	atomic_long_add(class->pages_per_zspage, &pool->pages_allocated);
@@ -1343,13 +1354,8 @@ int zs_store(struct zs_pool *pool, struct zs_handle *handle, const void *src,
 
 	/* We completely set up zspage so mark them as movable */
 	SetZsPageMovable(pool, zspage);
-out:
-	zspage_read_lock(zspage);
 	spin_unlock(&class->lock);
 
-	obj_write(class, zspage, obj, src, size);
-	zspage_read_unlock(zspage);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(zs_store);
-- 
2.56.0.542.g3ef89b7020-goog

