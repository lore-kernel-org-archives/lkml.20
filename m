Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B7038F938
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791502587; cv=none; b=UZ5xx6Dw0hlOgDwOSxA1B9j45daxp/7aS2A4OfJW41y35okESAFqxAQq+CugR1+riKFacZpFOczRJETLYalthJrK+4xNfj60obkxD0qfX247sx0ri07gpzi1770Yf6n4jG8pK2wKlsxw0UL+zJONMNUkNX4rPcqkO8Mq3V8kG6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791502587; c=relaxed/simple;
	bh=z9XdaDwozt4DVNCBsjCCo4rkJo41je1Q1+kLf3Q23Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vfda/Ar7Z0RZn4fTZ0m+WOdhNlQ7IWBsJ+4zdjNPHLuINn+Ju9cxjxZSzVdLT7BhdDeznBRq+EJ9o/BSwVGXn5Xvuu6IhQM1+InpdKkK7UhpbCliCqJlhg0W3idMqWkg1bNS0rX17wu89S5/HSxcHcR2T/fVrecxKR3vhZX53j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKwK7lCv; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKwK7lCv"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-917a20e9efeso41954536d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 16:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791502585; x=1792107385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0aMo8yA757AIchUgl2zcuEjDzZI6HgSNUOupZw3Xrg=;
        b=kKwK7lCvJz1wVTkLfGaKVKfr70dIJRtyWct7BtoHRxe3CXDSUhd4E2lyJhjnrN4m99
         sORMFy7GVSAyMIOUouqjD03TbB0RbQBeyi4xo0ZHaeZ89XjWXO0pqcjBdWXsyiY/L3Ul
         16zGbHDwkQYLkTKD1wiKQ0aMzufklwBVhfOWabGS6h6AcwxBU1AHPI5NTcSmhVTPYZgW
         LD9j6b5Kwu3XZY7Caigs/5NY4keHAcTyihauPisaT+d2XHnoRGeoTqqgTXHxizQVvt9f
         i38990xka5QM+qq/4qk2Cxabe2eQzcMXqIRb1HsWtXHeiXC7UK4W1PAoZosgMiStREX6
         3+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791502585; x=1792107385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0aMo8yA757AIchUgl2zcuEjDzZI6HgSNUOupZw3Xrg=;
        b=110okydBh/NBtvcEi+KZ34+k1r8iY9mu9j46BL+BM+if4cPg35Wp6C/7wL2Pif5IAV
         vB9+4X5iRfZtQfV+tkwNDbCi/wxgq/+799c0Rz7uqF8oJOCA3jvnAYyR3IbhVfopCV22
         P4K8ieGrRDIbUY3Stz7ZK6up3+AZp0FXnrhRIQNHhVAapI3BUDf7g+wPQpz1MVjl9QBY
         gSkKVORKKy+XCgSCXqLf9dB/dPhgp/jBUwOXj/yv+g/zYugnA7mr3+VqtytDAVQpfEVV
         qrdVuHrD6ajw8Is0vVvjgjEM2CJG2WeqWwCnx2mph4frxJRIBZGSkN2QU0JZ0J9lGghg
         PzTg==
X-Forwarded-Encrypted: i=1; AKwUvBz2pvimEgoXUMXbWIjGRTvCYKBvDrYubtjxSvyaozSKHxgxbgH5hs8lhbR/b/2y3lRwr4ab6rXtNv6DRo4=@vger.kernel.org
X-Gm-Message-State: AFuF++lZrViA2rLc+qVdCVvUfMTtGAg+hAhvuoOfGWHX+EcaUz4FgVUB
	Hw05Ue+G44WbfJtczDOym0xag1jy0keYGrNwngU3sXLCe/mEOB1t4v2B
X-Gm-Gg: AYBFou1dRAxCu1CVq3hl51gdtZ03jUxDW9hBV8fln7p61ocgSkHb+Yqi30ESHrv5XVd
	hnIW/SkrbZqdDk+F1Gedt+2mBd2MGb+teibJX6W85fTmvv6e77p8QfkgvN4QlX4V1GDvHguaanc
	t572eYqy8D/gjQX3ai2PZkR6+Si+dJCdxCHkMK8YK9aTbD+iGouZfK/MR+tCMyA4ALtSEf3LeNH
	6OvDJODN9mzTwjQ+SSchLDi5WU+gxcflrcfEIdmAmgmqIBfbjEPt2OII9qZfyr81at7/jOngkmU
	J47O4b5/Ks347wvpbQChEnp44V3HM5JnFpgud93Q6c99B/h4espEhooGw7DQGDbisxv3sSuCrCD
	Dg955XA/bmtRXL/frSPBeUxMgyk6XvTR05Zkxb8pdZAocWotE18wzUXRyd85FXWQeLKGh9woz6k
	mu5Sefb7Vq9PaOGJSr8uwRLH4Nm4dV6OvNQz8mMcixJxkWkZo12r+r1ZgyyaCaCflsps5rTpKO/
	65OiwB9QJLmqffa7NoBkoWEFo48LSql4k+7EJiJC3V6efmTx+/hvIVmvtwReOr17ObswfJa6V2G
	QwIfpe4r
X-Received: by 2002:a05:620a:890c:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-93ebd2675e2mr26192385a.64.1791502585481;
        Thu, 08 Oct 2026 16:36:25 -0700 (PDT)
Received: from battery.lan (pool-138-88-31-60.washdc.fios.verizon.net. [138.88.31.60])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm51693885a.12.2026.10.08.16.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 16:36:24 -0700 (PDT)
From: David Windsor <dwindsor@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	yunwei356@gmail.com,
	David Windsor <dwindsor@gmail.com>
Subject: [PATCH bpf 1/2] bpf: Fix state pruning regression in bpf_loop() callbacks
Date: Thu,  8 Oct 2026 19:36:22 -0400
Message-ID: <20261008233623.4011127-1-dwindsor@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f597664454bd ("bpf: bpf_scc_visit instance and backedges
accumulation for bpf_loop()") left dead stack slots in cached callback
states while SCC backedges were pending, defeating state pruning and
causing previously valid programs to hit the verifier instruction limit. On
affected kernels, ActPlane fails to load with -E2BIG.

Removing the incomplete_read_marks() check from clean_live_states() is
safe because zero-branch states have already had their stack read/write
effects propagated into the liveness masks consumed by
clean_verifier_state(). Pending SCC backedges only defer verifier-state
precision propagation and cannot add stack-liveness requirements after
cleanup.

Fixes: f597664454bd ("bpf: bpf_scc_visit instance and backedges accumulation for bpf_loop()")

Signed-off-by: David Windsor <dwindsor@gmail.com>

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index e3814152b52f8139a5565b2e4ac1b80d82d1ea65..1e300ca71a8a833eb4c2a340b4f94342f54af5f2 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -19791,8 +19791,6 @@ static void clean_live_states(struct bpf_verifier_env *env, int insn,
 		if (sl->state.cleaned)
 			/* all regs in this state in all frames were already marked */
 			continue;
-		if (incomplete_read_marks(env, &sl->state))
-			continue;
 		clean_verifier_state(env, &sl->state);
 	}
 }
-- 
2.53.0

