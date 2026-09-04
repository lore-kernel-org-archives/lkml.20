Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F183723D7E3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523359; cv=none; b=kH+AKBlcFPoznPgsb+TMWXwIIDigZFiJ/hasy8oqp9A3fCX/j3ytME0FVztAzg3O3ZTnPMXey+2SPk8wgkaYCwjJm00T2cHBU7ixYJM7CBQ5eKGFiOUKMigxVy+szLhGdPtANcEZ0FcKrR0BZ66qju1IITU+6d/lB0YVYYRnvQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523359; c=relaxed/simple;
	bh=OI8AniPiIqWkklzQbjxY+Nb99gQou3Fn4U7Efscsc7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B7aKGuLA8g35/kd6nnziJYBpmSzsLh43oxjlNc0vkj/yc17678mraThNhpGGsvQVwsQfDIjH7u/53oCEDHGkpcGKISUQJKb/SLdjfuMvUSgJguRcl/CeDW50GNCW5I3TjNcfE7We9VLRMEbaqg/8rvmkT/Cfa2H5uZOKednyMOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/DhtPNR; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/DhtPNR"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b1c75f0049so691042eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523357; x=1789128157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yfmx7WTSyy4uKIrbfyzZMpWqS0tZg4VeTqKKCHL8w8=;
        b=b/DhtPNRLQGhBbXhDTAl7oIadKStYEkaymNrpmrgwuScTTvfqdPipf7t7SsnEJUCBA
         SbaCFuLH2kLWNV9tdydPfUZJ7WA8NisUo08ZrPgfzysOhqRjrYRiCt8zxiT3K1pRynZJ
         ljBhq51p01BESMgj+YFBvRr50iqlF2Jz3q4bqQ6rIkliFW0uCYFG6HBMV/1YKYhXyFwh
         pBF0dCFjLls7R1TWu34y+AIld9G3s+T1nNvqbgBe9Ym6CI9Qd/vyaAXMymzkDRmUbJij
         I3fUuxvkqcg8yjXURg9sWAQeZoeVv2h0Hmqn4rATXGHWu50VQjLB+Utaxs64ppjfzZIX
         KIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523357; x=1789128157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yfmx7WTSyy4uKIrbfyzZMpWqS0tZg4VeTqKKCHL8w8=;
        b=dGD6ohMt/C+SEneBOiZlxNb89TlENL1fx/RF8l0HpGOZ8c0f54NqlzCR6L44f4jnBP
         +N8K8Rd5iI1MjM8qxkjoDXDrp1uFXmEC1nANH34/ppqkJk44tDksGkz5qQc2iyROwnxM
         yGeELpNcqEf1DLABMcV26s1suy8yvvoFCT+EZRMbuUBkt0xl03RBpyGhFxyNWW1bv4QJ
         MOU8gBOE6E3eFrTwkWrEZuDyQJ9kXNTy8mz1Rq6AHLhz88G5clz9frh/UAK7bIQWWgxF
         9kkb/WhOKy+e/mkCERKzy4ACgZBSk0sfTxANKbA9OyWBVmbY2WaqGpUK8Pzph2mUgHyD
         oZAQ==
X-Gm-Message-State: AFuF++l0UPiGYDuBxGAznfh8+yNJeT/sjxq9Wzm1jJNYh9gnPfNsfyYf
	pGqLE3OXSrvDjkKBYICiuG75vP2maYY0E1MCoaJj1CKCkTQ+47WWkAwUX0s3n10xfsk=
X-Gm-Gg: AYBFou2y7xpeMamq/0U369vIIvRLwSB+FFu87TDfj1Sy3wPbyOoQMK/xeP+HeU8df7+
	P14Vc2BaFXEc6anOuTW6H3h5bNX+yhfJIHOSFFmnLLGirZlLLsCm5riYaHT9jtpC1sjQdS0xjJI
	X/N0ingIYxH4mmXGfJDEjarwnbzOf5zWa5CKjCKPYLOPQUUsXp7Z5rQIMsinKQoff0ewscCs73J
	kmYyLNs9mGleCK0WzHx4PuCBDXRcv6XTou7tDye9L33f4nsNhGnUKMHhWQO0vnHwp4f79Dbt5e+
	0yqRokh0htIAE8joguhScz/ql1Dtiwj8ePzik2X9C/avgsch/ltMGwoKoim2KzuIP7oppOaCquv
	VisqmfNCRTu0IW0wksvuIBo+jUBSYXYt7OiBsSvL3S07EgeZxTJVqq6lQthHQzBuq7ZQel+53xQ
	M/3kRL3u6AlRJhzgg6OYQj5fEpWeSfoa2K61GImCg1QaqNZuV6xCEXya/V1rm1T4nLAG4LXGlfD
	LVbDnHddoKgLU0=
X-Received: by 2002:a05:6820:1524:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6b6fe0b8574mr3611873eaf.33.1788523349236;
        Fri, 04 Sep 2026 05:02:29 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm7713194c88.5.2026.09.04.05.02.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:02:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/i915: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:32:19 +0530
Message-ID: <20260904120225.15868-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  drm/i915: fix typos in comments
  drm/i915: fix repeated words in comments

 drivers/gpu/drm/i915/display/icl_dsi.c            | 2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c         | 2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c         | 4 ++--
 drivers/gpu/drm/i915/display/intel_vdsc.c         | 2 +-
 drivers/gpu/drm/i915/display/intel_vrr.c          | 2 +-
 drivers/gpu/drm/i915/display/skl_scaler.c         | 2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c            | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c       | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h | 2 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c           | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c            | 2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c              | 2 +-
 drivers/gpu/drm/i915/i915_gem_evict.c             | 2 +-
 13 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.48.1

