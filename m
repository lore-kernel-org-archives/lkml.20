Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C27330D29
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598381; cv=none; b=YpX1gDEeLtgmeu+kTC4F2PxbVgk6a8AoTFD/bQB5MXE87nIvOtIlvW+N+Vqk3G01ft3Lf5iKjllxOj/PlqF8d8mNXq3/dKwe3nuE9C6XshXENG7Ahqs/gUcINDk1BKP8fQFwGs9ECzFTN9Hv6reAu5y5o7nTSdcLF4fELDrrkYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598381; c=relaxed/simple;
	bh=oz+qnBneuNzgbgcPeVN/yZFP9YuMrQDJ//Xl7DWeReo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pDrwy08qtTLcg/bHg69X/toqLdxY4RR4jD9aTWKkTUheqRt6SJ6BxRKPDXVURmU0EXinFZVVqaKTSgaQL+WZRMkezpJjw/VLVCmDOIojmwmSCEaWAVsXiw/4TjW6xnaRdGIODcgK4fYcy+FCqRxgN29Q1tRIaKfCXEUNr+3JkKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/XgSONT; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/XgSONT"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1800764a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790598379; x=1791203179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUjbO+I4hM4lCPUnf5SJ9NB/2+aftjjp44Cv82ayP0Q=;
        b=m/XgSONTEwxPmWu9uY2rh/c1mYIdTb6sYJP1Kj+HoOV1YyCsrHglRHbVZezImybIuG
         kglqEJeiJLVrsmIYp5MlWSSMJMaoM0UfQbpHOBCUh5Kz/uVGqusALgy2Qwvd6DT+X4Sb
         4CFeNoo8YZpoVLTZjM5mfrdpqiYRerMvTXg2cJ3/sxulFohI71lcEuu+amtUoSmT02JK
         /mHeA9Jd02vB8kE+syIm0EKDVJCAzgZU7VWGHoJtz/Yws6hwMeqlR8rtv995dpoBMhBZ
         sQaOVFaiw6SkoUWpt9erif/cnGEX3LJ43H33TUNOliaQKUxlqFHrZIuss2Ab4mmLm3GH
         24gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598379; x=1791203179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUjbO+I4hM4lCPUnf5SJ9NB/2+aftjjp44Cv82ayP0Q=;
        b=kWf7N/qnPpACGfneZVJJA/VEq+yxQCOyyjgJoolwLbj6Y5d+zYaXklWSKjmh2vVvYQ
         9XVVwOtVeiR3x3ata+YGp80HGpTRPDdIH6MS3v8D7e3k62IHfzFtmKdNsQG2XOrZ5L/4
         EYVTC/Ensx9hju1TTLTnausmPHLhdUo8fxA0zT0DbVyGk7DGB8GNkgvNQ4igkPwcAMII
         V2XJVaY+RN5bMjnsBaKu7nU9gsJGaShqXo61bkkPt3EYozoaWKI/Z1W6mbojd6lcTsiS
         NgY2kukQ6kztzw8otOC+HhPW/+xq9f2gPAHhY/NokHi4HU9afAFsqVXteYl0S0x0bpBl
         Zsrg==
X-Forwarded-Encrypted: i=1; AKwUvByjfqQOiXo3EEKisaIywl02QpE3rCjXbbxXXkrqgKJL+LIEsiVeHJ6UVxyaghJEcZ6hfbeQBStmbGQlmxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLi3nrH0CiCKZ3nB/ZSh+md2zcRtRKBZS8w8u69nvq9e3XvjiiX
	xC1sUpH/dy4XCLPNNMRtY3KwwPveYnwQMx5ZEN7kmdWZZpQjNgI71RDZ
X-Gm-Gg: AYBFou0Ag9IVJl6AStSUMGFOoP/EpyymUk7WXKnET7gVX/rMJ4LkWxMZl6UM7T0J1e2
	HqC7VWcKmnRC3loKQ9DV5usuI91E15Nm44PfOmju9+B54K/FvKnTyjX94F21WxHP4UnvRw3Rzj5
	s6YKjcw8XrrXjfksjLroCOnIcoI4h2/7mk9f86bsr9xEiPngbDqgqV7obuzcCyKobdiMs+tUXqx
	MeFU/T/REgO+BtdbS4VYajTknGyaJJ8kupWsWdS0/zlyY3oS+x0a3PVafLLzWDKmoNAmMMYbDje
	0X3LaoWnRYZJUdRV11hiN/RkGaAmt6UtUxsuKIQE3FYjTLsR19pnyFvTs6DooVQfzPWlzvTwnud
	3l0wQJcRXck0WbFzTMZ1DlI0y2NsaOjP8NsaJD4E9QniSO3nlkcII38qxgWaTf8I8dzaJ63iXCy
	6NsWULoIvAetgqAnpvu/mcw7lQxqsDKqu+Cp7YBSr+n8q5PKujgk/D5xz+YY3m47IejQYo2y40N
	87kz5Habehem1xIFdPNRGyXukg02dyD37gti5mkqfiQCcYYVvu81PhzcDHSjyRU1jIlCGKYK41K
	8MsMGiAGhwoXE3TgQX2d
X-Received: by 2002:a17:903:26cb:b0:2df:34c0:7302 with SMTP id d9443c01a7336-2df7e3a01c3mr67555875ad.39.1790598379324;
        Mon, 28 Sep 2026 05:26:19 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net (2001-b011-2006-1fb9-8409-0195-705e-5b47.dynamic-ip6.hinet.net. [2001:b011:2006:1fb9:8409:195:705e:5b47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbc951sm40485615ad.8.2026.09.28.05.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:26:18 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Yiwei Lin <s921975628@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] rbtree: fix rb_add_augmented_cached() descent and exercise rb_add*() helpers in rbtree_test
Date: Mon, 28 Sep 2026 20:26:08 +0800
Message-Id: <20260928122611.336351-1-s921975628@gmail.com>
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
users insert nodes for years now.  Patches 1 and 3 make the test use the
helpers where the helper does exactly what the test did, so the helpers
themselves get covered.

Converting the cached augmented test exposed the cost of the
"suboptimal" propagate-from-parent path in rb_add_augmented_cached():
2-3% on a Raspberry Pi 4 and 5-7% on an x86-64 KVM guest on the
augmented insert+delete benchmark, against the documented
update-on-the-way-down pattern.  Patch 2 adds a ->merge() callback to
struct rb_augment_callbacks and uses it during the descent, which gets
the helper to parity before the test starts relying on it.
sched/eevdf, its only user, supplies the callback from its existing
per-field helpers; the resulting kernel boots and runs on the Pi.

The augmented invariant checks pass at every step.

Yiwei Lin (3):
  rbtree_test: use rb_add() and rb_add_cached() for the basic tests
  rbtree: update augmented data on the way down in
    rb_add_augmented_cached()
  rbtree_test: use rb_add_augmented_cached() for the cached augmented
    test

 Documentation/core-api/rbtree.rst | 27 ++++++++++++--
 include/linux/rbtree_augmented.h  | 40 +++++++++++++++++---
 kernel/sched/fair.c               | 13 ++++++-
 lib/rbtree_test.c                 | 62 +++++--------------------------
 4 files changed, 80 insertions(+), 62 deletions(-)

-- 
2.34.1

