Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793239054;
	b=a/2++x9lxMGyGAGSmtS9Adc996TUTZuF914ks0qT9IMJNrsniTaB0YRbyqRPErN3V1z0
	 FfD3No6LvQ0aPp9dzWaw24+/F3FdkL3OLQ+mMAFeEj+A+gmZEGICC/xXV2tt3+aivxA53
	 NFxDaUWIwiOzRXGD5zC1aWgTZMn34nboQRB0l50FCHDjNf0a2nA7GCPvYxBBpI48qv3OT
	 z66qVE3NomPTb7Pk/nHCQ1+IeLR/AP2qghQUsKlgFqyvoejT4W/c9873qvJwz2KXuzgXW
	 +HcH1O+ILawjCaYBn8H2IGOftEjL3gJEjnZBTKbYOK50Ttb5BlYK6Nqv3s3/5kLxMdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793239054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BjcCXH94r7SdjUIQrzA7CN3lEGDn7+Oy+/jo/lJEHMY=;
	b=Bb8tvsuF0e5bK1pAuDLx2esnDj9sM6jX3HDLe+19xUjUirHf6lEtyQGhzyB9pNnI/NOZ
	 ii7LP2Ydef3kej2NUl5jpGcOO8qYhTTNBvD3il9sl6Na8rYlQhTynLtd9bUOlXgfcquIb
	 p9BEsK3ssa5s6Zy+25y/LZ826KNeRMyOB0SRoz6ZZdXmoTr385GJaOGP0eE0t9GV9o/nY
	 6MQQjUdtlp4n7vNqf26MZxfoqZ7IYn0OTPTr/RhuvPJO/mKWt8SyODfcaKX3Ae0n9Y1fi
	 sUj/FCf1ufZd7aBgeGkXZTr91kQNIIMbj8jo+g4LzOxZtIdQSbzYh1bn/b0S15BZbPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tiCRJlE7;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527EF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tiCRJlE7
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd69954c755so1161230a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793239054; x=1793843854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BjcCXH94r7SdjUIQrzA7CN3lEGDn7+Oy+/jo/lJEHMY=;
        b=tiCRJlE7FTvJGkV99ezBt97VKVUbf5h6Z9c1cSmYApKK8+Qxl7+E1VbHaYhiwUrGxo
         Ic0nf8E6o+A1FvDg/i+gxzUy56xNPd8iY26bo6DSZT6bZPSdMC4ViU4oRkDbRUrloNKC
         EWazIvPmwdw1aHH362DGYGUV8k8pOzIqWFQxVboAHKDtA1uYAHkq5fOrVsGZ6uyHcTaB
         S59j1sZ8pIHPcRW9htWbeoATmw9bDwRUmfzv2EQxxosHxFuPtlBDnFCYKxLR9BjU+BYT
         IEqXfKwBavZ/mnpWyr4xoKJD6SnefL5D5W5HuEPZ2wHTcRjL6T6z4hU/3IG/rlIXfdgf
         dTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793239054; x=1793843854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BjcCXH94r7SdjUIQrzA7CN3lEGDn7+Oy+/jo/lJEHMY=;
        b=RfLwM7OxYpMFHdz47MiXL42VUp/MDoVeDEuJvg+dZvoXhjH24vT0uEQqyUobVz2wDS
         icGoeC0yinCPCZJ29xYmlb/zlsKE33iai7Ke8xy/yaW1oXIcXryJ0+GQM1BwS/b1eza/
         4IoeDr37tAofnisQ6kbZWtGIa/tjzhSi56e3XzzFC80O9uiVT9NmsRKkFcmMfHFyaeYV
         SGeO0u5e5UHvNf3rfGtLUkzSJgGWc0iKjsqO0ZqYvOdkFQePcPzK1qmcuZY3swc37mlK
         221njDoN1ZcCvSvHdhdQL9rXd6H0tMHiUyZsgL9SJrVrvGp0v9wN3oAKM21AbZMZWaTi
         InyA==
X-Forwarded-Encrypted: i=1; AKwUvBwb8g5i2MKVTJ+89x3NyuvR9J1BG/9sJx6/vNSJbLYBZPAS+Wu1smVNVKiFSNjDSOqtxk5IrvctfZyxX2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKASAIpgC1mVDhy5ASX5rO4HKV+QVtPDUHdJuH2x2hPQKel4Gu7
	hYwQQrCSuLZsADWnA2FxtkDVq/W33Kwd80azea00n9iq2u6fd4Inin39
X-Gm-Gg: AYBFou3aPTCG1uz3lXp41S8t0O/fFJD9TN85ymkK5AWoGF6eqI7rYrYlvEZMO5Abe27
	rJDo0Xck8hEUG1/vGuWIuaC1+PJZWaY0K4Va3GUKz8thZXbn61p0aJOTjvs5f1iq4ty2APeWbTg
	95J5Jc7IUYTCw2g+PN3m0hGXQagcrCsZ8v2uwRL9tZbKsfPE96BE3qGUnj16W1Jw0H7Q3C2Aivl
	Rn2l7IMq3o+OSOIOqEkquntNDEfCS9tOevFvFOXTO7hWzutV7LU9DxCKB7Kar25i70JwHa0Fh1I
	EClSZs3pTibYQGygaER1i3mNK8madqs00GJewv0mpvHFr/klAaKm9YCJ5tAWAcFrctMDgxs8iO/
	XL3jbz86dmK4jxUwBKylmQvWAko3C+eUY4oAf2GJWJwCgNzAHZZpCTC3pOAT7axNBDjE2zGJ5Q4
	GO2nl+5RxAbrHCrwZmie6FHjzxZrIRfXckeER8xiK4UgJOzzrFb46AB1BjRcOA37j7swECQrBVG
	FIb9+B7MoGT/177kztA1y9j1U+hy/URpbzurjsT4SzHljK8xgFXfB9UH4tq8iOW55FAV5iZM33a
	i6RPjpI14j9pSxCXT1T47rSLoRjoqmT6IAyvWalbKdy4mrT9hmAUG03Ds5+2bFM=
X-Received: by 2002:a05:6a21:39a:b0:3e2:8f64:e4ff with SMTP id adf61e73a8af0-3e9023c11b2mr3442531637.31.1793239053550;
        Wed, 28 Oct 2026 18:57:33 -0700 (PDT)
Received: from xiaolei-VMware-Virtual-Platform ([219.142.21.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccbaaa9sm4534694a12.23.2026.10.28.18.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:57:32 -0700 (PDT)
From: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	error27@gmail.com,
	xiaoleiwangxiaolei@gmail.com,
	yanquanmin1@huawei.com,
	wangkefeng.wang@huawei.com
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [PATCH] mm/damon/tests/sysfs-kunit: fix leaked pid reference in add_targets test
Date: Thu, 29 Oct 2026 09:57:25 +0800
Message-ID: <20261029015725.17378-1-xiaoleiwangxiaolei@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>

damon_sysfs_test_add_targets() creates its monitoring context with
damon_new_ctx(), which leaves ctx->ops zero-initialized.  Since
DAMON_OPS_VADDR is zero, damon_target_has_pid() returns true for the
context, and damon_sysfs_add_targets() therefore calls
damon_set_target_pid() for each target it adds.  That function grabs a
reference to the target's struct pid via find_get_pid().

The test then tears the context down with damon_destroy_ctx(), which
releases such a reference from ctx->ops.cleanup_target().  For the vaddr
operations set that callback is damon_va_cleanup_target(), and it is the
only place where the reference is put.  The test never selects an
operations set, though, so cleanup_target is NULL and both references --
one for each of the two damon_sysfs_add_targets() calls -- are leaked on
every run of the test.  Running the test with CONFIG_DEBUG_KMEMLEAK
enabled reports the leaked struct pid objects as unreferenced.

Fix this by selecting the vaddr operations set for the context before
adding the targets, as the real usage path (kdamond_init_ctx()) does.
damon_select_ops() fails if the vaddr operations set is not registered,
in which case the test cannot exercise the pid handling and skips
itself.

Fixes: b8ee5575f763 ("mm/damon/sysfs-test: add a unit test for damon_sysfs_set_targets()")
Cc: Liam R. Howlett <liam@infradead.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Signed-off-by: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>
---
 mm/damon/tests/sysfs-kunit.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/damon/tests/sysfs-kunit.h b/mm/damon/tests/sysfs-kunit.h
index 138a4b8d14e7..634387c6178b 100644
--- a/mm/damon/tests/sysfs-kunit.h
+++ b/mm/damon/tests/sysfs-kunit.h
@@ -79,6 +79,14 @@ static void damon_sysfs_test_add_targets(struct kunit *test)
 		kunit_skip(test, "ctx alloc fail");
 	}
 
+	if (damon_select_ops(ctx, DAMON_OPS_VADDR)) {
+		kfree(sysfs_targets->targets_arr);
+		kfree(sysfs_targets);
+		kfree(sysfs_target->regions);
+		kfree(sysfs_target);
+		kunit_skip(test, "vaddr ops not registered");
+	}
+
 	damon_sysfs_add_targets(ctx, sysfs_targets);
 	KUNIT_EXPECT_EQ(test, 1u, nr_damon_targets(ctx));
 
-- 
2.53.0

