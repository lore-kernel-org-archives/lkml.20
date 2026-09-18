Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF8D4B4864
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749289; cv=none; b=lREQOz6Ty4Qd8MN+o3gBq+Xi71EST1P8b44MBfaCTDkKTVXKGtGuYUCMhvrflIr3oNew6LQqTJlwMnMif165Ueo36Ug1Tqi/7Kk15zemlQi9Xr5NuKHoUhB04H5YiLpWhWdO8Wtsxv9hlvdu2pNYZNb61HCF2vFHw1S9+UZi9H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749289; c=relaxed/simple;
	bh=KlIUYYGrvd+OtGlPnQ0kH51TWAVclS+RYyBAJa4uKB8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=YtKd/7T5mMgUENzueIoPMeFW1nWmTlCHOadAS3xBq9q0l/pIZ18KframK78CmD0jR2G7FyAQegr6emWeHmZkIDDk4U1v7mKPY5oA40fJ59QVv3Jbynif6SgO/5C76g+eBYVZMWgVkMlnHwfiaRmV5oWiL2vA5ZBZBTcx+Tv8Pag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ND8hzEqB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ND8hzEqB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9681F00898;
	Fri, 18 Sep 2026 16:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749288;
	bh=rwnH9zVddDW2WUbNCyZTKKy1dimOqgY9DBfn9f/BDW0=;
	h=From:Subject:Date:To;
	b=ND8hzEqBL5+6BA/fPxbZhb/Hh0KOSEtEecFHP9zPRhpsDq+ekU0Lc2oDt16kKFVba
	 CgKpaO8BXrzeRyfP3T8HcekIWowMb/O+mR6TI03+1pwNetUr1gKR16ByCTNFP5q8yt
	 yGYT5neQ/Tceap7kjtgBi3M+SDsZB7aMUMiuxuiKLmbG9XOUq78C3+i+4de/OHxOMP
	 yXLHKowVdc//Be5Y7qyDBkuEcmd1X6ZSHIU3Q+gzfnwvw5ZTZJQaEwvYl2omFVkG2z
	 i8N9h+ldKgSMdoolRYGXDdZPUGcgarlAqVegcagAV3oHjUAopEB1AkDyH1Fw1q2Mk5
	 NimC8zF3S73LQ==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [PATCH 0/3] MAINTAINERS: rework MEMORY MANAGEMENT - MEMORY POLICY
 AND MIGRATION
Date: Fri, 18 Sep 2026 18:34:23 +0200
Message-Id: <20260918-maintainers-mempolicy-v1-0-9a94cac6d135@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA9orWoC/yXMOw6DMBCE4augrWPJPBW4SpQCOwNshA3ykigIc
 XccKKb4ivk3EgSGUJNsFPBl4clHpLeE7ND6Hopf0ZTprNJ1eleuZb/EIYhycPM0sl2VrkyXF6a
 sYXOK3zmg49/ZfTwvy8e8YZd/jPb9ADhO71p5AAAA
X-Change-ID: 20260918-maintainers-mempolicy-06bf34b59ec3
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Gregory Price <gourry@gourry.net>, 
 Rakie Kim <rakie.kim@sk.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=david@kernel.org;
 h=from:subject:message-id; bh=KlIUYYGrvd+OtGlPnQ0kH51TWAVclS+RYyBAJa4uKB8=;
 b=kA0DAAgWx+nLGEVVu3kByyZiAGqtaBygwtYkDfAiMd8cRS5X2ycFUgJ9qMC6q7TbJd2hUNcie
 Ih1BAAWCAAdFiEEUlPfMOnprn17Rg4Dx+nLGEVVu3kFAmqtaBwACgkQx+nLGEVVu3lZrAD/WZsa
 l6CrLM3p8DGMdCvXefasFsISZ3KgP97oJtxRQC4BAKfh1H1N/uAOFGC6oI1JQUmLnTuJG//72Yt
 wqlRUQ7AA
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

Let's rework MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION.

As I can use some maintenance help in that area, add Gregory as
a new co-maintainer for the split out MEMORY MANAGEMENT - NUMA PLACEMENT
section.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
David Hildenbrand (Arm) (3):
      MAINTAINERS: split up MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
      MAINTAINERS: move memory tiering under MEMORY MANAGEMENT - NUMA PLACEMENT
      MAINTAINERS: make Gregory a co-maintainer of MEMORY MANAGEMENT - NUMA PLACEMENT

 MAINTAINERS | 68 ++++++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 40 insertions(+), 28 deletions(-)

---

base-commit: 5dd1818b15d98d4a20806cd00b1b40320b06004f

change-id: 20260918-maintainers-mempolicy-06bf34b59ec3

--

Cheers,

David

