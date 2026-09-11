Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E978495501
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143052; cv=none; b=jpSvZey5INLl9Qq3Ab8zzMDznmjveZd9iMOf+x8ibHJIqCOouiGF4hqGnCKLru6eIPzfhjHOrMkPbrDFHF3rSiRhz79sEv6poByB5H+TWoeUskGwDQ+SknSQtG1LQhexmk/wNv9qQbF60JOCLVMKh9rmDvjSLR7zyxc8rxqNTvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143052; c=relaxed/simple;
	bh=vIUJ6WCC40ZhDzscPwqF9HgcJE/QKSKO2ELm3aI9oE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r0q5AAnLiZmHvD39g8gEarFZLjKgTNQ9QbZjNcimNim+FmLkMQgtHOY1TCfgxU4MsWKX7NqSyepAYptykQYFpkttPp3JdEL4h0C2t3XzOkqCWWqPH3kcsBdOZcLIEtdgNFBEtLD0yCio8r69f4T3ofSBe6N/Y8qzy7PObPwk24g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYcCZJ7R; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYcCZJ7R"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc02279so1097191a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789143050; x=1789747850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8qHku/lkcMyCUoex8XaxjopWRu7Z+oJaV2o4dRNVD6k=;
        b=RYcCZJ7RkRuP7ETlxBZjxrRzZhe0uotpInOEdm+VB5R//Qk+8b+h77ujKKMKTxx8GU
         U2gPVnlvQrWrtxa63BCo1F44H4mgwz0lZcoY+1c2huwjQs0MeVZdNcT4fi/rYBzu/iqz
         0MseUkwe0ezWQk7JP6Z1kDozfWpIbXXIpxA4JCvGRAldj4TF/PLfWFqLBpQmgwtjcnJK
         6ztFO2vo4d6wSHyFkG1esul85aZh2akFGWqrkzCAHwRzYoiI9mAfIXZ2bwZHbagWBAJM
         1F1b7hUBpieBjzFOHAy+lGIxtlZ2LkUN24777YJGZDkMPX+vjqRY3x+gbUdMif/2H7sV
         WbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143050; x=1789747850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qHku/lkcMyCUoex8XaxjopWRu7Z+oJaV2o4dRNVD6k=;
        b=iD/8ydAFVizQxfISK2QsUlGyP0lqgKBf4AE2nrM7JEUHdjrnJLgzRPIeWAWKKO7YRS
         Ji+RFTaVF3Kal01wtQW5zs5WjUEajNnOOxWSB0L+0P35/UeM2rPUE67W+ko94MnjL5WP
         +qyITzyBZV7RPh8m1GgJv7V1t46PtT62B4oSKUKdxwO46bNmZcDqo23zyBo9wAhs7a7P
         d1CEYSN8lFlm1niEDXJIL0yroN2VkkQFlC+ARjrglM8U4LPji9+dFJTQoXhWRVEzyGPp
         rmnw1uo9siMT0blLjygz1PBN5G5+uBaXisWpb0+ObsXfmj6+i9JyarhL6RzzP3YLaSgV
         94KA==
X-Forwarded-Encrypted: i=1; AKwUvByoSxj8fUP2lLydACtjYf4fEDrJUAbDv9y8c86AOtjM3oAtAhfcFNJ2vfp1sbVYXasJ5mGDifsDzXr052c=@vger.kernel.org
X-Gm-Message-State: AFuF++kA9HCGAvw41Q8WOBuwU1dOxdiu67PwQIzP9TGu7V9Y1Vcg5xc5
	ZcNamHOoL73ZyDPZhzKJUmCnpGED6mYDX8Z63eOli4H2FudXXEaujL/b
X-Gm-Gg: AYBFou1PGd4F12jpNkQPGGZ0V1ZvjdKyiahsFiGgzLgmbIs+1roRK/ZdaUph3e+YyW3
	DIdd4XYsck+18CiLi8qiTCeWFnNvJR9yQbNXkLMVo0TvPF5vvUNpUS1QZY4SNpoOsYAg8CFDycZ
	4po/iLe62zd9ztSi0UQjZhRhHHUhDrcYYiytxfnyhSjS7wxsFwACyRJJGGQG8HYHu11a2ddJ4Ki
	st/C4DNgH6HJwlpSh8q9370VtlRFHqE/KEOb+1xLBJZrF5DCOsxWScyBtzHhIRY5G7gacusV+o6
	+rrOeX8zVBi5i57LSMfS59kgMrAicxJtuL0nkOXH4EPTvh4+ILGjU4Oqj30UdFW+JD5/xQllTzv
	A4oPAzMJ4+ORv+vkTVNUdydgbo20ZXiAelL9muL/4myNMcQES3tQHgdVDLRv9FRRAtjWHGkKQjv
	E36ekqm+oe9ZpobkHOSX65GD6hzk+Y+QX09Un+3N13/9B+izPThYVk8wVgaB9TwxlHTK9WG6/zK
	JpB83mUuyWvM3ZY5kY=
X-Received: by 2002:a17:90b:1d44:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39d9c234a8emr8446766a91.13.1789143050047;
        Fri, 11 Sep 2026 09:10:50 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d6b08sm5966320a91.8.2026.09.11.09.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:10:49 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>
Subject: [PATCH] srcutiny: Add lockdep and early-boot checks to synchronize_srcu_atomic()
Date: Sat, 12 Sep 2026 00:09:13 +0800
Message-ID: <20260911160913.2859713-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RCU_LOCKDEP_WARN and early-boot check that the Tree version
gained, srcu_lock_sync() was already present.

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/srcutiny.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
index 99f8bfd98b04..76411562366f 100644
--- a/kernel/rcu/srcutiny.c
+++ b/kernel/rcu/srcutiny.c
@@ -361,6 +361,12 @@ void synchronize_srcu_atomic(struct srcu_struct *ssp)
 
 	srcu_lock_sync(&ssp->dep_map);
 
+	RCU_LOCKDEP_WARN(lockdep_is_held(ssp),
+			 "Illegal synchronize_srcu_atomic() in same-type SRCU read-side critical section");
+
+	if (rcu_scheduler_active == RCU_SCHEDULER_INACTIVE)
+		return;
+
 	if (IS_ENABLED(CONFIG_PREEMPTION))
 		synchronize_rcu(); // Needed for RCU Tasks Trace to imply RCU grace period.
 				   // And in Tiny RCU, it is near zero cost and doesn't block.
-- 
2.43.0

