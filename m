Received: from mail-pj2-f15.google.com (mail-pj2-f15.google.com [74.125.227.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002DC3D9670
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695495; cv=none; b=KpZ+lt3mxHD4CZg5Z35DnfMbF1J3vkt/JkAaVSH6vrGW8aqIM0ic4b+Byaj79O45nf9q2HwmsdP+pIWOovYZlA/aqQwtxFRRgGIRYFtRr3Z8YK7SyfamCy48xGk7rpciJiRLBrZEvTYaZsIpiIytYdhqk3rYjgkBxiUjyqNzkeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695495; c=relaxed/simple;
	bh=IsUrqnbkBzqR9+V+q6y0qSUhzMpi5uygr2LDVgI+dKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IwYNumtsLdjOcOM797Ui+AYBfEC9iBiVC5EDF9K7LgcfZ2cB9HfKYa3RFlZgwNMmNewEYNM6SizEOiVTAiw81m1BjY0BijI9l5RiNk5IidMUZhm6LoWhrWPDg+byNlaIyDNjf9DOUqq5HJRIcdA3oMwA6BNyLh5pDyiLvNjsPAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pM2yYYNk; arc=none smtp.client-ip=74.125.227.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pM2yYYNk"
Received: by mail-pj2-f15.google.com with SMTP id d9443c01a7336-2d747f01363so25516545ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695486; x=1791300286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4HlWCQVM32D4igNgCi92CyfQ5gH0706BFceUvI6QYz0=;
        b=pM2yYYNkhXD5wTImR6XmXHCoeXAMjdXO2hVtIQq9S6Vx7dg1UZvvHYqNQ7pO3AVCav
         O3JT50G4fBj7tZMVRQpK1hbmR+GOnG7/v8eiEBE7hNqrkcq9ZbgUJCupR1p3j0qhgrHT
         V+XMis0jHl99xUmYSHmbc7Ds68V3to0Zn1s4kChyHPWHrqaMDvAHxJdMcqv48WpOzdFc
         51F4/RW9cwr42+NjM0uktWUeMh66xDhMJMLwgfa02k76i++fsgPUAb4GwNuBrAfp+3Rn
         espGnphha/L1PS8buRw+CWfVInHxYbs7enGAlViSUFhtvxC2TEvwgBc48Uqze+CH4Qiw
         f0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695486; x=1791300286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4HlWCQVM32D4igNgCi92CyfQ5gH0706BFceUvI6QYz0=;
        b=Sv/21fsu8VtvqZL32DWCwMujJKyMie/GKuaKHSv9fZkVMRWQwgsp38UvJPYaPi4y6Z
         k1ghK0ukxd3OwtyJPcSU47El+WJG635x5zOIl96BK0TrfBo/yjcXfWaDJryBzjM/w1KA
         NrW1GejpaqSdOA9IBu7IKS9e39aOfOZLr1MZ7v6+wUxDRoV0ZkKqiRGHLjHtmu3SLTvZ
         e5JqVWDZGkO92pBEI7tEhoe0rycX9hispvEn4JcdpwCqPw2NiG3iSSAJbCGhlm9GWkpp
         hyFWYLqmdhz2Xn1bRo4x7n3ywoZaO6jX1bDc9OKeSctvoF/5j+pWrXYTK++cHMdca4+p
         9kRA==
X-Forwarded-Encrypted: i=1; AKwUvBxIeoTuAh/6kHGrI9c9syueCMwSpzE/fIrTNkYtBJb7WJudOCBJ8Da0/QoOsSlKXcHRd88Aj1ju32r1EVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4R+xNQGnWmP+YyaTY8yJfux1wkgIUTC+DIYT+dFNoy/away3q
	jzsz8nmRW76NzSHq6xYCjEPE+LXb/T2BzFPTb+py96+yJ7VOY/9hFjAM
X-Gm-Gg: AYBFou0FMqRzzMpKf6wvgeO7v3+dqwmDP3019573gY0ebR4ouvP47z1bHj7DFqRJ7R4
	GFbGFhI8ARg5/rs/yjumGA7YOtobaE8xI/RkaNo4xQePxMBWkHsh+bBKCmloRtqquJtLDKsirsa
	n9xhCpb2soxieccayGznKJXak2a2eTUnwW6o+vx68XCWT4lBDLUkqMgHtltq7oQeUDmxU0zOSz4
	aKRXaSBBf5YMThLqorUQYPiT5RF9NWMZzVOGswdukipbtq8mOGFA2d+9EoYQ/baC7iqVdSSrHrI
	I4qXdz34ORuuzNbLSLRmCiXtxo8V1nbtNjX5TKit3bippHTkdekDrr19DoJxuMZ+1kcYGNcFBPF
	77TX52cGniUXqOMPo3XbI2ZQ4bZYu8odj238qXQ6d0Wviq4UIBnDNvuxj7NhS0YOX8fZ+/ctiOL
	ZOZJ2a0DaMOryS3gTjTat938R8FsOx2rJLU0I2i4lZfSSFWh63dDvlTWM283RKWRQiPjW3548JM
	S2agQ7Pc2vmapATYL+D5MIrzRhZUosxwfAxTahWHwHxVbp6/ooFzgAUFSNMzWPiRXI4l36QY2GN
	QxLBhQbtSY1J+NpVrRlI
X-Received: by 2002:a17:903:3c4e:b0:2e2:cc2d:b84a with SMTP id d9443c01a7336-2e2cc2dbb2cmr15210305ad.41.1790695486117;
        Tue, 29 Sep 2026 08:24:46 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net (2001-b011-2005-5b75-0412-f652-3152-53f1.dynamic-ip6.hinet.net. [2001:b011:2005:5b75:412:f652:3152:53f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91476bb4sm59762255ad.83.2026.09.29.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:24:45 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Yiwei Lin <s921975628@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jon Maloy <jmaloy@redhat.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] rbtree: declare augmented callbacks per field, fix rb_add_augmented_cached() descent
Date: Tue, 29 Sep 2026 23:24:35 +0800
Message-Id: <20260929152439.91443-1-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rbtree_test open-codes the insertion of every flavour of rbtree it
exercises, while the generic rb_add*() helpers have been the way most
users insert nodes for years now.  Patches 1 and 4 make the test use the
helpers where the helper does exactly what the test did, so the helpers
themselves get covered.

Patch 2 is Peter's RB_AUG() rework from the v1 thread: each augmented
field is described by its per-node value, its aggregate member and how
two aggregates combine, and the template derives every callback from
that, per field and in a local; RB_DECLARE_CALLBACKS_MULTI() goes
away, RB_DECLARE_CALLBACKS_MAX() becomes a one-line wrapper and its
RBCOMPUTE is renamed RBVALUE.  One change on top of what was posted:
the third argument is a fold(a, b) rather than a "replace?" compare,
which keeps the same register-local recompute, lets sums and counts be
expressed, and replaces RB_MIN/RB_MAX with the existing min()/max().

Converting the cached augmented test exposed the cost of the
"suboptimal" propagate-from-parent path in rb_add_augmented_cached(),
2-12% on the augmented insert+delete benchmark against the documented
update-on-the-way-down pattern.  Patch 3 adds a ->merge() callback to
struct rb_augment_callbacks, derived from the RB_AUG() list, and uses
it during the descent, which gets the helper to parity before the test
starts relying on it.

checkpatch has plenty to say about the RB_FOR_EACH() machinery in
patches 2 and 3 (unused macro arguments, values without parentheses);
all of it is inherent to the token-pasting dispatch, as for __MAP() in
linux/syscalls.h.  The tools/ copy of rbtree_augmented.h is left alone.

v1: https://lore.kernel.org/r/20260928122611.336351-1-s921975628@gmail.com

Changes since v1:
- New patch 2: Peter's per-field RB_AUG() templates, taking a fold
- ->merge() is derived from the RB_AUG() list instead of being a new
  template argument; the propagate-from-parent removal is now patch 3
- Numbers re-measured on the final code, on the Pi and on x86

Peter Zijlstra (Intel) (1):
  rbtree: declare augmented callbacks per field with RB_AUG()

Yiwei Lin (3):
  rbtree_test: use rb_add() and rb_add_cached() for the basic tests
  rbtree: update augmented data on the way down in
    rb_add_augmented_cached()
  rbtree_test: use rb_add_augmented_cached() for the cached augmented
    test

 Documentation/core-api/rbtree.rst |  27 ++++-
 include/linux/rbtree_augmented.h  | 192 +++++++++++++++++++++---------
 kernel/sched/fair.c               |  70 ++---------
 lib/rbtree_test.c                 |  62 ++--------
 net/tipc/name_table.c             |   7 +-
 5 files changed, 179 insertions(+), 179 deletions(-)

-- 
2.34.1

