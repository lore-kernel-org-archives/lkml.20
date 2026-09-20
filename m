Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08413B71C4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907072; cv=none; b=coFpt4SEtq0Hqatyr4d98GjX4xD7f/Cc/gupKOey4N4dLA+5ea2jSnBVx9y8UvIpyghW8XGueX2jPLAtpxbB8ftdWK0InxA5RWZj4JxrC5dYKwNHry1eXNzUj0INT9q0+i3BzUsG811NdsIIrYuo86TBYdpIcetDWsKnLXcL4MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907072; c=relaxed/simple;
	bh=X9og+gkcKs3FqJesjCqjxPxucohjf/RASztug2OUqqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbpZDWNnp6w9hybfAknPTHaiwMuEDLqjgUTIW6Z9EbHAFDoC3+Sf6bTWKgVfF6SwYY4VoEvUQgVbz1yVG8yD2Ea1vyyaStMTMTVQKmaBBuHwh+GLrcitVuL5G/Lqp9ERCA43TcS9KTqeTSGt2Gp0egLNN1Fx1sEukdF3Zek0ahA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvv9xhdB; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvv9xhdB"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso1693170a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789907060; x=1790511860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ONHA4wMDILxcRZ+Lg+d1Nlct6hNZeNgcOdxBA0gn77s=;
        b=kvv9xhdBSn+K4HnJhB98/4alaFtUSKqDKoCdI5PO8XQPIs4o1wIyDSZtu2sy2KlSvM
         taTKtVLigaxWd4lALeCSo0uc6/Jn+BKA2MybQbvU1tLbYQexa+EMutIgPODL+RK3I/eK
         Onbm9IeJLdczIXm8em/cGP7BBTLGsZw4NdaY+ALlqAtl/risfK9X0c75HSlBYtNlJNFK
         8D8jCLI9jbIRCs3dSLrnrR06HipRT220n1Anu5xdI9X8xo6FX5asj6NOxxXG/6jYflwg
         EhbL0hHDOtiqnGZ7sUuenZnpr2CT74IgeNqPx3B++NirXZ7WOgTOllbOZKZRiZuDo7s1
         YCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789907060; x=1790511860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ONHA4wMDILxcRZ+Lg+d1Nlct6hNZeNgcOdxBA0gn77s=;
        b=TQ4cwNM1CXlbuMa7XQvEYIPUyxLIeNOV+k0Hvw21rx80gPjmDjWxg8m2Yrk/5KLsik
         T/3t4GR/WF2KqYfzGLPW2fnyTKNTCEOmouAHyPMz2+mm81Vgj0TqXo6M2pOw60f9Gaed
         tajAq49j3iAur2zB9ltf+txK7Q4gUBGylL3wmZfN8BeeVhCO4s1F9db4zZRVg+a+38CM
         /EHb/jjKu0m8zArZxZwq4WtVJCz+gu5lxqN6aun8s36tal4kxBR+3ZQVyKAVBd+nBVS5
         9ALCvWAMuVCwJ3jgjJhHNpFy9WGlZan9U9CSWDhA9P3mW8Qk/k8iQ1KDQ2mdtf5rPk4k
         hArA==
X-Forwarded-Encrypted: i=1; AKwUvBz9K1vyPhSY42JHJybcvo1WQ8OipfPdtFbiz9lDcfU7U+hanwgE4Bz+2VqEo6dAgfH/WC1sXx4WXD85Rxk=@vger.kernel.org
X-Gm-Message-State: AFuF++l7u6jxV7PPEycT62YuBaeZ9j2WMqnNkyBDZiAtZeyL/UxwgNew
	+ciKK1GD9nwrbHHmO32PP7r2/1vFg1YFDBsXRvQ38JzU4PXYQybl6y0=
X-Gm-Gg: AYBFou2qT9AU1PZhY2uWCSea6DcXLZXB5Z12CfX9yc/rc78ydVSX5TCn1UmrZ/zbIBg
	MPpCg7WgXq2jITt6ckubIQ6WseXjQx+T8NwK/0rym2nTQmqzslgWU+Q95Ta/qMKx/uB09B03YBl
	vmrIgdqrysvG6wiv/fJTIhV4rE9inZ6iHp/c1SZirqP2Q+azKu7xMp005MDFbr3CxGUHNalyjPI
	mhvCFFRvykeAmQdbQUojlF7+i2Q2a9Mw1tW7Jl7TiaapGABtdaVbdJVsgU3F80aQ72BAXZjsyFR
	cc4NwykGd3z4w/+BBR6LaHbYyCG/4C7VjOeI+tOR2P4Ki0h24kWgZQtWjhwqjXC6ef5S9cPD+ih
	iiyS4D7GqXp1P3qwiRFSe+SjRUAE0goM1Vd3U2kR2nybnHexzW01Hu4/a3Y0ITpF9zEDFYQpujS
	rdQTle50WV3bvWP5sqWNYmqFhlxHpgLRttV1/I2aVvM28+QNKjt93U4+Jqut39GD48nqESy/aDs
	iaVrlr40KwVv4YqVe16ADGpUZI=
X-Received: by 2002:a17:90b:1dc7:b0:39e:6c68:1553 with SMTP id 98e67ed59e1d1-39e6c68331amr8421991a91.27.1789907059964;
        Sun, 20 Sep 2026 05:24:19 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:e0d6:4b87:c472:c9ae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cae997csm8753943a91.11.2026.09.20.05.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 05:24:19 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] mm/damon/core: prevent size quota overflow in the temporal goal tuner
Date: Sun, 20 Sep 2026 21:24:10 +0900
Message-ID: <20260920122411.610213-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920122411.610213-1-donggeunyoo.kernel@gmail.com>
References: <20260920122411.610213-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damos_goal_tune_esz_bp_temporal() converts the scheme's size quota
into basis points with "quota->esz_bp = quota->sz * 10000", both
unsigned long, and damos_set_effective_quota() divides the result
back by 10000.  quotas/bytes is unbounded; bytes_store() hands it to
kstrtoul() as is.

On 32-bit the product wraps for any size quota above ULONG_MAX /
10000, that is 429496 bytes.  It lands on exactly zero when the quota
is a multiple of 256 MiB, which includes the 1 GiB that
Documentation/admin-guide/mm/damon/usage.rst uses in its example, and
a zero effective quota makes damos_quota_is_full() true on the first
test of every charge window.  The scheme then applies nothing while
the goal is unachieved.  Other wrapped values are simply wrong, and
any product below 10000 divides to a zero effective quota too: 429497
gives 0, 500000 gives 70503.

Triggering this needs a scheme with a quota goal, the temporal goal
tuner, and a size quota above ULONG_MAX / 10000 -- 429496 bytes on
32-bit, 1844674407370955 on 64-bit -- so it is unlikely to be hit on
a tested setup.  Nothing is corrupted and nothing leaks.  The scheme
makes no progress for as long as the goal is unachieved, which is
easy to notice, and writing a smaller size quota restores it.

addr_unit does not cover this.  It only scales the numbers a paddr
context writes to quotas/bytes, so a large enough scaled value wraps
just the same, and vaddr and fvaddr contexts take raw byte values.

Bound the multiply.  A size quota too large to convert now takes the
same ULONG_MAX branch as a scheme with no size quota, so the
effective quota becomes ULONG_MAX / 10000 instead of a wrapped value.

Fixes: af738a6a00c1 ("mm/damon/core: introduce DAMOS_QUOTA_GOAL_TUNER_TEMPORAL")
Cc: <stable@vger.kernel.org> # 7.1.x
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Measured on i386 under QEMU: one paddr context with a stat scheme, the
temporal goal tuner, and one unachieved user_input goal.  Each size is
written to quotas/bytes and quotas/effective_bytes is read back after
update_schemes_effective_quotas.

  quotas/bytes    effective_bytes    effective_bytes
                  before             after
  4096            4096               4096
  429496          429496             429496
  429497          0                  429496
  268435456       0                  429496
  1073741824      0                  429496
  500000          70503              429496
  4294967295      429495             429496
  0               429496             429496

Everything the conversion can hold is unchanged, and 429496 is what the
no-size-quota row already produced before the patch.

 mm/damon/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 2258b72da7a78..16d4145379a2b 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3274,7 +3274,7 @@ static void damos_goal_tune_esz_bp_temporal(struct damon_ctx *c,
 
 	if (score >= 10000)
 		quota->esz_bp = 0;
-	else if (quota->sz)
+	else if (quota->sz && quota->sz <= ULONG_MAX / 10000)
 		quota->esz_bp = quota->sz * 10000;
 	else
 		quota->esz_bp = ULONG_MAX;
-- 
2.53.0

