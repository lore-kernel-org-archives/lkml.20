Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E0F369D40
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790394570; cv=none; b=dMvSePzyytNk9LMhSViASvv4Hrd9ABidujcwzFxVp5Lg8dDvOergS1w/AR6GOdxpS4AAsTPG0bBMqVX06RwPkNHXEh7z3E3CJGmk+gl5R72gR+Pe9OIC9up3mwZbCm75MK0lMSEXKdUTxgZ9ABRHjYrzwbbjknEWqRsG7DQfMVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790394570; c=relaxed/simple;
	bh=sD/rHkZvoU9SE+GEwXGBJP1gCMqdrV+0feI7JM1npg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=USmLWx7Vy7mSr+pl5TFMgNyPlLxdJjuTIeG7z/YHa5iAbdDOeDPSnWVFfPq6Mk4oSZM2Sl+zqqyGAsp5l7HZ509l/Cawc4rydaMH8g/XPm4rJVcJWBrsIhGwSfiTXprST65RM9NAFTp/Y8htEr4IUi/PvEs2hIf02YYW6PLMsps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEOXO63G; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEOXO63G"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so859738f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790394567; x=1790999367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mH8RpPDrFr6HJQvoLRU0PIhxtXNYo241XhZA1klSUjY=;
        b=JEOXO63GJWlB4uFfEFdH76Bf0JJrH57J+YOYuuwFd2g2bSozKU7CHtzvKQKQdjQsxF
         raXg0FdbcSZTRq5PclkqYDa+Nh9MBsIpnXMs+3u+3ytvaCrd+Yd9QbXWEmMvXhvnBPcV
         RN+ETvbjAbXrEajzeJJsS3KF3agMHWAeiHb943wQSOns1B/5Vu0PFp0X/rvtS2a8sW3y
         nvfcB4qlN1NFpPaEZwI8msuBzx2g5zy85EYIPEzgsM3fWmT075IUY4axWsYJAo7Soe2x
         WzxDpcwio/MRf2FCnHO11uU3Y6fMHYhNBcg3cZB24BfPtge2wv1ahLsjFIJf+2s8rbr4
         4qWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790394567; x=1790999367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mH8RpPDrFr6HJQvoLRU0PIhxtXNYo241XhZA1klSUjY=;
        b=hJCO1ftXuU5jHxAePEFAKox36QBDootqKMk84rPSoU9gK7Y8vbe2U4uonhbBobDCgm
         jRuRbfLnNIHGJEF+mTmoOH8HzHCAbXNFLl7lyjiNf0otzDtBWkmzn7wLkeYhSyLThj25
         oLOrE38kc9j5YsdJC21pHF4WFgPyBp23nnFCiEfZuLhbsOlC/L++G3vuQXNgtPjI5qop
         yDGv61yjOLqg9N8AHskRYCrUdIZ/lUpICGMQDlqy7AMGhX/lUK5XATh40m3xPWiKF11d
         iTIJdA7mZUs7T4KDn7aJz433KZKXAWEojoGUtmJQy3lp2AD2KfZOHtOIv+DVU5aA6DTy
         8pqA==
X-Forwarded-Encrypted: i=1; AKwUvBxF5YbXL4IH+N+iAwz+kzwB18+klliQ+CpfR1akpQkqj+CCh44tNtCB6SBtU9K3BPBk5jPuZsz2Crh/Y0I=@vger.kernel.org
X-Gm-Message-State: AFuF++n3ymh1yINhYE8Ryi1PEJ0jys9vK9bAvHkfY6cwU5w48cQ9+O8M
	zPhgyaN4/GOmaDD9nzII0+fhpvLjFWnE1QfwkOeK6uP4Hv7V/Luv/7So
X-Gm-Gg: AYBFou2gfvr9Qdsgxop5PqWCgfjyxS/qXQghQ8OMgJLpE0CIhNxYaGBi6fqqR6sL0kp
	rYInDtM08mECK0XtXmmHXkOAruUeAxTYsWb0EqrUpIkWN3r0mzJ3PnbmQ9UfkNpd+RY4nQpOJeO
	9c+pPNiJ/YzyEE13IReFlVZqk2RaG8yNKUQD03rpGbV17ZYCxlOsTznBzhW67ZmZ37OtAlfKg1l
	w1k0WjcFStJOt055ma4IMsaudOM+eI8ZAShP29pbaAXVaY6wYkUR18jiYYldzn0swcwkYDeGszy
	mKiELDVjCfSu5a5GpqVI5Feq4wHGDKN1oh0aFXsyj+Ygehf0SEUTyIZrKlz68r8wpkLH18oCKji
	Z42EKh29lqdhY5YVCtql4MuvtsznIyfcJBwnqPjRbdxUxHb+eT9PoMeBdnJX9goMfv+JewP3q07
	QC/gATb+tc2mrPKUBRplYfFJzGZJeyzlSRevDjm6vqMLO+l/jmrkg20LJs4xBRpbYXKBPCzcFpp
	4AEc892otUBQKShjq+k8kQ1YeiX4GBESL2gy7lbTAI4
X-Received: by 2002:a05:600c:1907:b0:49e:63cd:31fb with SMTP id 5b1f17b1804b1-49ff06bcd54mr73179155e9.9.1790394567317;
        Fri, 25 Sep 2026 20:49:27 -0700 (PDT)
Received: from localhost.suse.org ([37.109.167.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm116657205e9.13.2026.09.25.20.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:49:26 -0700 (PDT)
From: Sebastian Chlad <sebastianchlad@gmail.com>
X-Google-Original-From: Sebastian Chlad <sebastian.chlad@suse.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Sebastian Chlad <sebastian.chlad@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] selftests: cgroup: Report failed checks in test_memcontrol
Date: Sat, 26 Sep 2026 05:49:19 +0200
Message-ID: <20260926034923.31718-1-sebastian.chlad@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_memcontrol fails intermittently, but most of its checks fail
silently, so a "not ok" line gives no indication of how far off the
measured value was. This series makes those failures print the observed
and expected values. It does not change any threshold or pass/fail
behaviour.

Patch 1 converts the terminal tolerance checks to values_close_report(),
as was done for test_cpu in commit 4cdde87d723a ("selftests: cgroup: Use
values_close_report in test_cpu"). values_close() is kept where it is a
loop or retry condition, where a mismatch is expected.

Patch 2 reports the "memory.current < 50M" check in
alloc_pagecache_50M_check(). Because test_memcg_high() calls the same
helper expecting it to fail, it gets a quiet variant. An alternative
would be to pass the flag through the currently unused void *arg of
the cg_run() callback; I am happy to switch to that if preferred.

With patch 1 applied, we observe at times failures like these:

  not ok 3 test_memcg_min
  [FAIL] actual=18722816 expected=30408704 | diff=11685888 | limit=7369725 | tolerance=15% | actual_error=23.78%

  not ok 4 test_memcg_low
  [FAIL] actual=20852736 expected=30408704 | diff=9555968 | limit=7689210 | tolerance=15% | actual_error=18.64%

  not ok 4 test_memcg_low
  [FAIL] actual=14364672 expected=22020096 | diff=7655424 | limit=7276940 | tolerance=20% | actual_error=21.04%

These are the child memory.current checks in test_memcg_protection()
(expected ~29M and ~21M). Their tolerances were already raised in commit
d2def68ae06a ("selftests: memcg: increase error tolerance of child
memory.current check in test_memcg_protection()"), and the values above
still fall outside them. In the first case the child is about 38% below
the expected 29M. This series only makes such failures visible; whether
the expectations or the tolerances should change is left for a separate
discussion.

Sebastian Chlad (2):
  selftests: cgroup: Use values_close_report in test_memcontrol
  selftests: cgroup: Report memory.current shortfall in
    alloc_pagecache_50M_check

 .../selftests/cgroup/test_memcontrol.c        | 50 +++++++++++++------
 1 file changed, 36 insertions(+), 14 deletions(-)

-- 
2.51.0

