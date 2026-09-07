Received: from mta1.migadu.com (out-88.mta1.migadu.com [95.215.58.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E10D1DF736
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788749705; cv=none; b=krOzKAKobt8YRRvePlFGTsV1U/imYI5j5K/7o3WNUlGLasSSF+zZ9k74lIDjC7mu4OpusqFIDgolg7QZIQgbnWwgjWWdvS8ob/r/wOPbm9EY16pQX1Au5ANWQR9YkCd2CIFhXVDanM4OoywAEg34BaWpdR1M26/+/ZuQI4aPHRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788749705; c=relaxed/simple;
	bh=siEozKNwZMwLyUvwvGE498xwfE7YRELk03NIbRMtXmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VuqED1T1TTbkyGxntrHbdCRi/fv6swpkfUwSETtpgQcutHz5aQiYXFcvFhoQWx1Q7UfTpV4UzVvDMWLOPKHEJg41oC6sP1ART1dGFfkKM4XkgbozothirEcNMMYaPBfgkR2DA4nio5L5EAuBJwguyyK4w7lh+H2w5Rki4I4YOtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sN0eY5sc; arc=none smtp.client-ip=95.215.58.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sN0eY5sc"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=siEozKNwZMwLyUvwvGE498xwfE7YRELk03NIbRMtXmQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788749702; v=1; x=1789354502;
 b=sN0eY5scc5iiMJ08mqwQPCLFiSLkNKOoGw/GxGVfxqtiVGqewbbOX4ZRyIswks0+OrFFfMgv
 3uyVQT22RPXtFJyZPy4xwz4wdWBal2Xb6YnUFrvBgvy0rdesJqxszB76gms7Q6Chl6+21MoDMmV
 TSAFidCX9W0HM1EXvteB0xgY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5e5fb54c20b00d72;
	Mon, 07 Sep 2026 02:55:01 +0000
X-Mizu-Trace-ID: 5e5fb54c20b00d72
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Chris Down <chris@chrisdown.name>,
	Tejun Heo <tj@kernel.org>,
	Yu Zhao <yuzhao@google.com>,
	cgroups@vger.kernel.org (open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)),
	linux-mm@kvack.org (open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)),
	linux-kernel@vger.kernel.org,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH v4 0/2] mm/mglru: fix ineffective memory protection for non-kswapd reclaim
Date: Mon,  7 Sep 2026 10:54:43 +0800
Message-Id: <20260907025445.1836238-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

For MGLRU, memory.min/low is not honored during non-kswapd global
reclaim (global direct reclaim and root-level memory.reclaim), because
these paths shrink memcgs using stale protection (emin/elow).

Patch 2 is the actual fix. Patch 1 is a prerequisite: an integer overflow
in effective_protection(), spotted by the sashiko review tool, which
patch 2's new caller would also be exposed to.

---

v4:
- Per Barry's and Johannes's review comments.

v3:
- Per Barry Song's review comments

v2:
- Fix an issue caused by non-atomic read races in patch 1 [1]

[1] https://sashiko.dev/#/patchset/20260828092432.1257917-1-ridong.chen@linux.dev?part=1

Ridong Chen (2):
  mm/page_counter: avoid integer overflow in effective_protection()
  mm/mglru: fix ineffective memory protection for non-kswapd reclaim

 include/linux/memcontrol.h | 10 +++++++++
 mm/memcontrol.c            | 45 ++++++++++++++++++++++++++++++++++++++
 mm/page_counter.c          | 21 +++++++++++++-----
 mm/vmscan.c                |  8 ++++++-
 4 files changed, 77 insertions(+), 7 deletions(-)

-- 
2.34.1

