Received: from mail-pj2-f19.google.com (mail-pj2-f19.google.com [74.125.227.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DC12D7DC8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123167; cv=none; b=GXcXg1oxcgcZ0CYHWLoCVMJAgxRgSdCTDERfLIZciCYptVztM5OUFLk4uYqMRwlEDW5B+uNn4/0zyhZdBlpuA1uxmmSmK7xALv3J4+YOi/Bwzfi3FQ1yaANZu0m2nP1kuHS+61T3J9Ng3nideJ8tcqUBPgar3bqvCuCinpj8Mo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123167; c=relaxed/simple;
	bh=2UkxcYpEpjXUSVhtjAB1jX1sZrCQUIpz57c0kmQK6Og=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d3dMqvP2W0qXTvQQKdYS8tiadafK+ATrxWSRGZE8Lgrpe9vIHSjDb/VjGuJJIpQM8WsTruKTjQQyCcW1Ps2UbglT9tqMmcfzwDsvXZtxo4Lj6NDxXGmAmcfJ5smEqq+vqEwUKpN/K6XmW1kGjRonsyxN/NKZbXwcfZK5xIZlILI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qChqT3pV; arc=none smtp.client-ip=74.125.227.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qChqT3pV"
Received: by mail-pj2-f19.google.com with SMTP id d9443c01a7336-2db18fe433fso1862565ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790123165; x=1790727965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLteDfPUx3uF6M02dhFfxPuSSO1R7kydwzqevjI1MZM=;
        b=qChqT3pVp/mSgz66tGo95/6XrOSlt6RoUyW1Gem9G7QM2eUaEuJpANoQ13CKfeDT92
         pUUx+nRTDovoOl9GWYgRs3L9u4J+eShsTw9PQHIQ9d3giByb9ekOEdpfGV3x0PcCsKdJ
         VEGJzfNpA/Da51cdoo7FlJ2GLmwJ5TLvFqKIEpEJfgYRMTuX26xJdAMlVoGJrExFNKZk
         TO9EBSUr0kEe3dP8a0Oc8yN1o1zEGAwfXnpOlCiFGDx85VcgpybW+UuJp5U53ShMjt6h
         agfRIkl+VxK5vwNC/PLI5K+kSjmi9bvFrb9vKC5q68y3FQNjxkiSqdeAaStaoo2sMGb3
         cqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790123165; x=1790727965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLteDfPUx3uF6M02dhFfxPuSSO1R7kydwzqevjI1MZM=;
        b=zJ3Kf87NXGdKIJCr5nqZUdkavcahbmH2aPKRe1z6Ezki6/jpEyAKaDHjuO4Bt8rq+V
         H61p7izZTgRY68FLOxP67AJOgelJEeZAVjbavA4g59RK+iap7BzOQvdXONU6HpJI8V3w
         Gb5e1F0ScB6rA8km0fhKSJovhKki8S0zVxorFG2HdoSaXEnvm7+Gpsu3z68RL22/5umD
         JVfzg8MTKXSctRqbRXNgnPVxbERD2FGfjI7MyCAcj7kG9K7w543tr/syk0mynjAfSEvs
         Ti+1cvARTjlISsek8p3szqf/8AVfLoTLMBjNG7jg8IYLREWWNrAHc7MNmfvFKD4YMGAK
         WTVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEA1xot48zQ+eFpFZW5dyiDXAJlJm6zREoZSxcHw1UE3C7iO56bUZjqrI/ZY0dlJOdWveYbl7hxN6o6Sw=@vger.kernel.org
X-Gm-Message-State: AFuF++kVLKrb4vlmeSt9mk3hRtW1k0tdwxT+DA0Qu6cteMJZoK/xxPAu
	ADzL166phdCJDxQ/0+CNQInzFD/4otAVecYKBcf6ruh1t/5xZlCRMvE=
X-Gm-Gg: AYBFou0h3+qx7Yarbnv1T5KciCjjzv2Vqh6Nk6ThegGlFI/CYgmWJtIDFS0qB2sdgsv
	jAz2SREA2IBzLK1CK8D5rHtSP1K7RCpXAK5ADlWYwTWUGh6nOj6SvL1lvSuaOWgBcMPReOhyd9/
	zD5eGHg+/+CoCnDaHPs2un9+u8G2MIuPqNiIJoKhL9D6evYOlgE46mY3t8CXc6FIhjKLLOZNXAT
	8u5n8FODXZTerDKp3qYNULwLgeDndvRhWQuHv6Y1XMb/kt1DxKLJk72t2Yt18m7NANaFc71Y3Ei
	lsjdEXjJiokON8a7/DFDU04yMk8Ck+N5GIACJyhS9hKrURUAIF1qdcm2bO9XVzFfltbLjkdjF6B
	rDg82j8S5yw9H+bLHRpxOAbbdyBetT0wWSaha1GvF39R/qCuuorzW5yY3xF0IRVUn3tQisxMmFy
	P2w7S1vD52BSjI7+RUaYug/a2BX/XoVQ2t6K0R1TN0APV730t0fAScQ8aysPv/nvONCGmRnsjiR
	YEt4D3kiXFfpm+5FigLvrHedZ3V0vkcuixtIQ==
X-Received: by 2002:a17:902:e552:b0:2d9:3850:2741 with SMTP id d9443c01a7336-2df69be125cmr8314255ad.0.1790123165341;
        Tue, 22 Sep 2026 17:26:05 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:2466:805a:e198:cde8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a7b76sm2176595ad.20.2026.09.22.17.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:26:04 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v4 0/2] mm/damon: fix the temporal goal tuner's size quota conversion
Date: Wed, 23 Sep 2026 09:25:57 +0900
Message-ID: <20260923002600.1825448-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damos_goal_tune_esz_bp_temporal() hands the size quota to
damos_set_effective_quota() through quota->esz_bp in basis points, and
the multiply that gets it there is unchecked.  On 32-bit it wraps above
429496 bytes, and a wrapped product below 10000 divides to a zero
effective quota.  damos_quota_is_full() is then true on the first test
of every charge window, so the scheme makes no progress for as long as
the goal is unachieved.

Patch 1 bounds the conversion.  Patch 2 pins the boundary in the core
kunit suite, where the new test would fail without patch 1 on any word
size.

v2: https://lore.kernel.org/damon/20260920023111.2466265-1-donggeunyoo.kernel@gmail.com/
v3: https://lore.kernel.org/damon/20260920122411.610213-1-donggeunyoo.kernel@gmail.com/

v3 was posted before the discussion on v2 had finished.  My mistake;
this version was held until the thread settled.

Changes in v4, from SJ Park's review of v2; the code is unchanged:
- patch 1: drop the 256 MiB mention
- patch 1: say what the user sees before saying the setup is unlikely
- patch 1: cut the closing paragraph to "Bound the multiply."
- patch 2: unchanged, and carries the Reviewed-by

Rebased onto mm-new 8d29b5365d52.

DAMON kunit on x86_64: 39 tests, all passing with both patches; 38
passing and damos_test_esz_goal_temporal failing with patch 2 alone.

Donggeun Yoo (2):
  mm/damon/core: prevent size quota overflow in the temporal goal tuner
  mm/damon/tests/core-kunit: test the temporal tuner's size quota
    conversion

 mm/damon/core.c             |  2 +-
 mm/damon/tests/core-kunit.h | 48 +++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.53.0

