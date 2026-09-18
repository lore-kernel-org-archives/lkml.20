Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0DE282F26
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789690338; cv=none; b=L7Ti2ANwEzUnWNc4mSnjwftEmpuF/9bG+n1Nxq+pX69rI0py8U6b4jJvInfeAGU6R904KtoB9MzzCmDRL0RBs6GtB6Nl90CKfMiEqhsAsioNM+NrqOuHb9J8i12cQg38IbvFz7YU1SyNmtBhinE6nhpok21l62ySXtwmpL4wQDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789690338; c=relaxed/simple;
	bh=bK6d8a2smqhaZ/9jLtNrXlGeEycyGc2TzYuCpQm6RmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e7eirt3PdHZcOkIEf3lN4YD6oyfQcw7Csj/yOGprDOBuDNJkL1vDcPji1MxHprEXz+uCNg5noG1Xb/fo0qX/iHHZ3KgS1OqxrSRRXCSWwSLlLJtXiEeLb6fPGfj/++w5yjWU5wzGcIB2uCAUtnJlBM4shPTJ+6R9/kmxTAj5GiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=JQD1vwEK; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="JQD1vwEK"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a2a8c29c4so20690885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789690333; x=1790295133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YgDzwO+XF0qOz1Mzu3N2XDQzWY36fv7PmODRQrhdPD0=;
        b=JQD1vwEKFeZ1xrAYXBz4TKWCtsGdEcn6IxB/U3w9brAgxqMDz+Bd2NXYTOiZopdxlZ
         Kts1N3h0LhQU60vpc7rbE34Nl+k9Y40fZg/zhdcfEIzYBa/+cXaA6dG0obw6SErOtP8w
         RZqWoljEWp1oK91eHKmOW/vcZqjqOkZRRfRi3bO6tr2R4sKLrD2gx8frBVGWsSQir+l1
         UtuEEZEFSnpxjOYKDq8C1pyOEdVX1IHhESPkTgtIn/byh5cP2RE4Fl0yWWuJS+Cr0Q+H
         /mVRoD8TGapi1OlTn572VYzfywkX9ITVQfs3LRBw9qDEvqMHzSkou39igSVMx2eYn/v1
         gamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789690333; x=1790295133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgDzwO+XF0qOz1Mzu3N2XDQzWY36fv7PmODRQrhdPD0=;
        b=Zq46K8ysWBsEs/1IU763mXFOrjFpR5S9/lb04WfEib6LT0kKgpf9B2SCXI35+eQNcu
         M+ev9CsaQ4Jc8999e4r9NXcFO0Ipz3J9dBCXhJH33jqAVZYCGn5D1O7+oWC2KaOaWIvG
         +/UbQ57bydBK5vZ97WlC52dJDHXGWOmqca6i5rv0/8ugISXZ7QEO93K27rkHldxR78vU
         nbH213Uq/7sI4dbAefZO8GD7bV9KKq6fvjHvXJCcigN4go8i9HuMbU7f3VrV+FNFtC9I
         s1Lfcy8w+tZ4QY11lB3RGFY42SxQdA+ds88kbLCc9DR1VEPZOJ0BvhnLaQjwuEeaMGjs
         kOig==
X-Gm-Message-State: AFuF++mS7GpI9zhjyKjyTUFxhBlQhXn0CjugayNoI6bvqCBLX1K9pMIe
	+3S2OYTz/V4cmLthy6nhcqlxL08rq4KvJuGBizqI+5tZw9mESePfJ1aYY2p0R+qhFzo=
X-Gm-Gg: AYBFou0Wl9AyB+pl8VLGSZayitiZIyDHblyFQsMG1dh4vevtNxRXFdlACAVVYPPs3jo
	4Uwtqjbgp35SVNs3sHAn39uyiD6armLJ9zdpn6wB3O2ALnRHGjZpYft7D+XoPKRpxZRs/mETziS
	7mLIQ5qZI/tUGZo6YiqR8T7J1LJMvUgi7u9LGrKMvd7CedOe4I7E/tXmm4P67oSrU0s28Lp+HcI
	54uSfOV6KhZJ3d/MK+BuLqh6zZI3urknEAzOX8IOkSDxNTxlv5CNr4sNZRw0K730iOqNP85KGaE
	5DNpBqobRWlAaFRsnHQoAHMEXXgM5gaxJo4EVgLqfYstfAgKQTVn2vsluZ/7Vb/e6EMAjj6sbmT
	rGApRVGcbPDsaYNzymSrPBszNwgaooYdYxNWRKkhltHrcUNWCK0Y4Gv5axq/M2vnpi1nfXFEUDO
	TD4cIC9shhCYpj7UfZZla9LfcXaxR+adM58JQ5xlMM5dopOXOsn2QlxqPzDMSqu3SZEhhj7K4ce
	TSjbeFLjAuH/r83V7y9ZDAN5+y6pdBT6ewf2QNSgqqHN8tZttuZitYFoyzp
X-Received: by 2002:a05:620a:601b:b0:93b:d7a2:83ce with SMTP id af79cd13be357-93bdca0712amr95805385a.61.1789690332732;
        Thu, 17 Sep 2026 17:12:12 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81cff7cbsm583762585a.41.2026.09.17.17.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 17:12:12 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com
Subject: [PATCH v2 0/2] mm/mempolicy: stop copying state in the interleave paths
Date: Thu, 17 Sep 2026 20:12:01 -0400
Message-ID: <20260918001203.3389165-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interleave node selectors and bulk allocators take copies of
nodemasks and node weights (for weighted interleave) in the fault path.
Both of these copies can be entirely eliminated.

For node weights, use SRCU to pin the weights in place.  This eliminates
a copy and a kmalloc from the bulk allocator path.

For nodemasks, we can operate directly on pol->nodes as long as we bounds
check the walk.  A concurrent rebind can shrink the mask, or tear the read
of it so the mask appears empty.

 - The interleave node selectors fall back to numa_node_id() when that
   happens, which is what they already did when a copy came back empty.

 - The bulk allocator simply returns what it managed to allocate.

The node count and weight totals are read separately from the nodemask
walk that consumes them - creating a time-of-check / time-of-use race.
Just clamp the walk to a single pass (number of nodes), and clamp each
bulk allocation chunk to the space left in the request.

The cost is distribution accuracy during a rebind.  The copies never
corrected for that either - they only kept the code from dividing by
zero and overrunning the allocation request.

Gregory Price (2):
  mm/mempolicy: use SRCU for the weighted interleave state
  mm/mempolicy: stop copying the nodemask in the interleave paths

 mm/mempolicy.c | 163 +++++++++++++++++++++++++++----------------------
 1 file changed, 90 insertions(+), 73 deletions(-)

---

v2: Comments and commit message [David]

-- 
2.55.0

