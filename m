Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3201A9B24
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950654; cv=none; b=qGzfy8OESkEG7QFIoS0zlgbJEaODnUsnCjEF27tOGGZX6Ju/RAEytndZPjqmnyj97CBRvtRqaZk1YdK42PQ5Q0pXRiFcqP97r0Ea+C1z3FKO5M/PFntPKnavWn0BMD1P09EQCDwBpr/NFV/OYC1aDbUI2aUgT87GfqChXLVbwyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950654; c=relaxed/simple;
	bh=QQSAd2CYAnQxdw/DgFc6joStjKQYfZmSz3ZExj0RHZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jFtz8gW16FlCdSYzF2AwTEq4aQBJXE7QSi+9ty5N3Vcl3S8mVKpUfLFlORvMmH95vFCfj2aqXH/ieZdw2DS/kq1FP03xxE0dQ58yo2ylh9waj220iX0SHHcS31mqgimrjza0ucS5oyoKNOD2CoDGfnvHNeqxLoe6yhJudxtrvhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyBNMXus; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyBNMXus"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ece3so1855105f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950651; x=1790555451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8p2uHDJTRX2GGhCC6kgbhWuhGhbxvLj9khVv1KzE7G0=;
        b=PyBNMXusrf9v64NzGSK8NnmM3Xh1Vt8o4jWusKUYnnOTd2jwTd7ScvTfaklE37jGMG
         0X7wvoDWcTMe3iiVa6LOWRLNyshRuGFuacRlB4M67RoxTIP95AWkx5cwxVvUQrhfEfng
         69howN4n5cPor6tKck+JNVayGim9qY6SAb4je7RbbGN18khyobwDT+SxIkWzbV0LiWCL
         CZ4zMlJMuAGGh6s5dPMsIwkAn0IWAPBhexnWOxdVCKFt5YGmEv3zodkzzsVbRYieZ6TZ
         TE5v3KRCoY2uUWLBIqg/r7Aw2m7C+EP0+Hr/y0VM8uPnwuX9uWBMyBITV8pTyE6hg0k3
         nOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950651; x=1790555451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8p2uHDJTRX2GGhCC6kgbhWuhGhbxvLj9khVv1KzE7G0=;
        b=0djpROvmmX1vFh3Ksz8pA9xvChAKsxf4ioXwVx5K1n+APrOz072IsrAegYBXyYSJfJ
         T4+Rf6haWPQeisbSrUVz2wGbJ4t9OZRrQNYBINMXkgo8JJj+Z2TjvjraXnkIkRlrip98
         N/ey52MUHqSo/S/htSeB1SWnjrmQmh9a58ECq4hoTkWT0fHLsP8AM1IauW0TzZ19pS4x
         mKF3TiE7RopS5Ux50YkS9FdCXeQ3AcpypVRwNrtJbWP9BY+4WKfSfKp6PWSao0mfOcd3
         /HQiwld75Ay+D42G0dSgh7UlNsmO6y4tap82Hu3S+lyLie2e+Dhf4/FlttDSh7FgAmtk
         H88g==
X-Forwarded-Encrypted: i=1; AKwUvBxibtIyTwJZ3oMKIBfYYgIiQaRHFA3vMXpDr0aNlri0tDonNknHnf4cj4RP9dRTj8pbHyLFNRF0po6mLnY=@vger.kernel.org
X-Gm-Message-State: AFuF++l4NvDPfQ07+RPFG76dgSJCIA3IupMr1uaRP71nijRUtuBpPDD3
	/QH59fMEWxFArYgs8UGJ+ABF3u4YoodpqO8RJR7LY3A7Wy3zMdOpOSoc
X-Gm-Gg: AYBFou2o6XOB7ZdCQHHPg3iyjVRPh11rxEFZbJG8SEOzgvnWtpmvBsCh2P9tRCJuR9t
	GlgtXYwmaTG5SXDGV+WY4Fk/Sc2iCOO8pYzJ6meaqbuY8tBTbqNGRIeWHbGitPKqdu4eaPB6MGW
	g5eGerfm1yJzItxzYXMT1Xn2KVylDWt+OIiAqvLFqdcyduxjF32dogvAPXTDzNIY2A7X0YW2jJB
	JSjcuM3OKPrqbiqpGPMBPzAdYxCQ9BpJxpCpn29P4TMz/fM++Q6Q6TNCQ9EeE5snAKRYUSsUkib
	APxmJVmfUyXhAMzjWYTMlX5AYT7V/nElxlmfh9UxZwVmJ2OD5fBhZEgApmyYVzeJSYEfkRHRXie
	Ym18FlwifZU6GQszLw0tlCM04Re7pDfaxCt/Amynku8Y6VCLtO5VRwFkcJBPH3GR+mbAwoBsv0W
	jgXT6p5Gq70675+ufHm6TovII/i2BX9V6GlZZqNqmhSYtqli0++QP6DUqUKnBQd6P3VfYoc9Cp/
	eWUD0E6yWLXOALc+3wGTQ3EN/JGK6MgUME0KiFa84D+m4hYs2iSsPbS6dzL+1fdZr3qij33gnPi
	mY1R7hmjMH3RXXo+M0/qJlWtSZJ+n5HUVdSX9EHjecidtz7ohvyt8Opf7CJzrLuOaiD2mqOxrHd
	ckQ==
X-Received: by 2002:a05:6000:186a:b0:486:e949:532c with SMTP id ffacd0b85a97d-4871e367f08mr12791266f8f.43.1789950651450;
        Sun, 20 Sep 2026 17:30:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a012-6c01-e0c2-ccc1-7acc-3570.310.pool.telefonica.de. [2a02:3100:a012:6c01:e0c2:ccc1:7acc:3570])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724583fffsm17515695f8f.23.2026.09.20.17.30.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 17:30:51 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mm/damon/core: preserve the caller's quota in damon_new_scheme()
Date: Mon, 21 Sep 2026 02:30:46 +0200
Message-Id: <20260921003047.12041-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921003047.12041-1-kmehltretter@gmail.com>
References: <20260921003047.12041-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_new_scheme() calls damos_quota_init() on the caller's quota before
copying it to the new scheme. This clears the caller's effective quota,
feedback input and charging state as a side effect.

damon_commit_ctx() first copies the running context into a temporary
context for validating the proposed parameters. When
damon_commit_schemes() creates the temporary schemes, it passes the quota
of each running scheme to damon_new_scheme(). The quota pointer therefore
refers to the running scheme, and damos_quota_init() clears that scheme's
state before it is copied to the temporary scheme. Even an update
rejected with -EINVAL loses the running quota state.

For a size quota, this discards the bytes already charged and allows the
scheme to use a fresh quota before the reset interval has elapsed. For a
goal-driven quota, the consist tuner loses its accumulated input and
restarts from its minimum input. A time quota loses its throughput
estimate and falls back to the initial estimate.

The constructor side effect was introduced by commit 70e0c1d1bf94
("mm/damon/core: factor out 'damos_quota' private fileds initialization").
Commit 60bd24f272d0 ("mm/damon/sysfs: test commit input against realistic
destination"), merged in v6.19, exposed it when
validating sysfs updates against a copy of the running context. Commit
b90408ef1163 ("mm/damon/core: safely validate src on damon_commit_ctx()")
later moved that validation into the core API.

Sashiko reported the same side effect [1] on the RFC of the core API
change.

Copy the quota to the new scheme first, then initialize that copy. Make
damos_quota_init() return void, since its return value is no longer needed.

Fixes: 70e0c1d1bf94 ("mm/damon/core: factor out 'damos_quota' private fileds initialization")
Cc: <stable@vger.kernel.org> # 6.19.x
Link: https://lore.kernel.org/damon/20260702212143.0CB6D1F00A3D@smtp.kernel.org/ [1]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 mm/damon/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 2258b72da7a78..e655863d33d9c 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -734,7 +734,7 @@ static bool damos_quota_goals_empty(struct damos_quota *q)
 }
 
 /* initialize fields of @quota that normally API users wouldn't set */
-static struct damos_quota *damos_quota_init(struct damos_quota *quota)
+static void damos_quota_init(struct damos_quota *quota)
 {
 	quota->esz = 0;
 	quota->total_charged_sz = 0;
@@ -744,7 +744,6 @@ static struct damos_quota *damos_quota_init(struct damos_quota *quota)
 	quota->charge_target_from = NULL;
 	quota->charge_addr_from = 0;
 	quota->esz_bp = 0;
-	return quota;
 }
 
 struct damos *damon_new_scheme(struct damos_access_pattern *pattern,
@@ -776,7 +775,8 @@ struct damos *damon_new_scheme(struct damos_access_pattern *pattern,
 	scheme->last_applied = NULL;
 	INIT_LIST_HEAD(&scheme->list);
 
-	scheme->quota = *(damos_quota_init(quota));
+	scheme->quota = *quota;
+	damos_quota_init(&scheme->quota);
 	/* quota.goals should be separately set by caller */
 	INIT_LIST_HEAD(&scheme->quota.goals);
 
-- 
2.53.0

