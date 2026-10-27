Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135747;
	b=Heog9+YRJSbZi3ImPjMB1x/QfTf5IK7RNe1bHjEy/Z02lewE79ihLDJE+berUfqwqnG9
	 OxLs/MwZu0JdPjbSkHfzW6DkK3PFOSvv4Fz7TuhukVFdn/0EIPLp6DPunURzDiiKghfT/
	 xARGPt09V1HVW/5Gvlg3f7rKw5omH6D9BPJs0UwFc6TtykhKswzW8HiIaa4llos/0nQ28
	 jtdt8TEjaGDwdZ+rI3iPNG9GCBz+Xlo4GLpcZY7RouihWWdy+58ys7LxihPDX2jYFuo7J
	 2twDjnuLPvtiVwxUzRwP0FXG/8sOpmUVLcOWzx2HA9i+DebquXTn/4wN/r3WwuGguLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sa7iGCeELZtURXOiW2lc5z/VEpz0Jw9PHYIzUSekpgQ=;
	b=F0V7g/xtChLzgC04oi0+BQmq+sadqyQRMrVdQdbETFeBh9/nv7V4mmikUpbdYdU+OOd3
	 Gv1/FZrafzsdwS0B4zPvZuSaBMSX5OvRQArZg+sxwK5Xw+PF7yl5RjiqHn+v690l+93TX
	 Jf3fLNzA81IlvtQW0dTPQf3e0s41T31g4BCiN933I4yMB6GaixRlvaha1wE+mAo4E+w8e
	 U8JjtHkDbPxFh1vJv2EZd9JNjx/2MMpSGY2iFpjKrR+wcZMeSZ5RVWe8ZHEpaRJhWpWhA
	 KXMxkCaaprWSDDHqOIjHE65SEYVwnAaMEOTsp6P9FOVQ47JhPy/aVKjhdtUZVgyDTeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n23xO46Y;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86990606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86990606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n23xO46Y
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso214676eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793135746; x=1793740546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sa7iGCeELZtURXOiW2lc5z/VEpz0Jw9PHYIzUSekpgQ=;
        b=n23xO46Yt4EHxY0+IBxA0vHRUMAiv3D4fk44zG6+9GofzQJnaku2ZNYtUUzfDhVq5Z
         czPYLesXClPMmy+Wvas4jcM49FCRNN0eH37iR3cx54B8HbSkyjrORVNpodzT2DzGI4TA
         NR+O3vm1/jWsp6gkJ4/wE7jNyRWwMbAE71E0X0AHCa3r0BZWwALPNk9gIJ8YPLL6St5J
         3mSzcZ4q/U5xdblS0sOOxdsgfnLwrhkC5w4v7vy13eRDI+nFhj45pquM2GTyfxPwt80L
         XO75/a2rgp35u6EdsXJiW6wLpdQRvZ/L7xqP7o5ouJmd8fAwt8f/IYpEJVPJyUt7vQ9L
         /7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793135746; x=1793740546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sa7iGCeELZtURXOiW2lc5z/VEpz0Jw9PHYIzUSekpgQ=;
        b=ZoG3E9vtAqDVKH41Cv2OgbD0r3o+2jEHHl3SbJ6SykrJDZpD3vpNMgEzVBa0eggIqB
         LB1hjrUt46ghxfm4ZKjJANErD9veqyD9yDPbSw+rpOJNErlXguBlVHLQKIu07KYBNaa+
         mRin0Qw5bQiDXb7wZgzDN4bpgk8TSUfTDkmqEDLcGuvcKduNJK7+ttfay5eD/+OoEpOA
         iut3SVzhgwd1bXj3lnoVP3eqIHWkgqRu0PgwDi2H7HNrXMS2YRlbdy26Qfi6OPUKQYdT
         PSQk071DTHUNfFWuB3K/kmBr8JLEBxgOXyT4FjNSYAMBr+s+xIiOppC+lYytOufhAtyK
         8lEw==
X-Forwarded-Encrypted: i=1; AKwUvBwK7HcWbkAusI1ZkHntIX2HHIn2LwUilDA4wElrNKtgtp7vwqXsL9Roz2GGnj9TCTVghQnNWuKnf7y/bWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDktXaLwYEIBu2ZsV+TIMI620bsx2y5eLXxl90iZSQxGLR9XQD
	8TVDvEYYsnKS9WJjsv4fmLr5SmJRZbtoMogz9h1ooEW6aM1OHvNYgLJp
X-Gm-Gg: AYBFou0vkd9rzUHh8lSGzBYUK+J3IpkAAoTwN4jdo6tDr6DgWfy+G5JcVFqS7B2hww5
	1JFP0KybyNXIhLMAyMVfCPuLgHJwl59R//Fk8TT1lLuKjzsCcZkgYHvU1f4GcaQXZ2yYopSeqKg
	Y5TOgaTaMZLzevR8fSQ7iQ2Y7dwhMBoFvOzvjgo/etMh0wZcuBATia70QGgE3gO7g9Ir4Q36rQF
	USaxfyP85+CQlT/xl7GV4djQ59UG8oyLUx4k7cYJSW7Q95SF4L5HEfYsUraLkYF8+cyJ5AfjRPz
	xX6oWhFt7R9Iksk1SWWFqGi+NW7IrSkoeAMAYv+7ZH2XmtIAsTGYuCwC5ZFDqUuD9wdWLQbHSY9
	bhX2WxoMc+bCLDmEId0I0wFKA/Aj9J/BrGVcEnLCxJwZ2fLKIATZtYhHkovPs0J7+5pnnFKj1ZQ
	oOIGzczWjbDsTID2t2F6AQ80oRIATWaRCqDwXCz5BOs4n8uWhc53q1EjVO/lUMevxJLgju8rauW
	zUHKgHDpzzlIlnAfn9IfArnO+2I0NIdcMPK+GDj8/+nTlMAgwoWuONmQQcv8ZExmc5J/tyZAX20
	4aR8Fg0=
X-Received: by 2002:a05:693c:2a17:b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-36a2039cb09mr845127eec.18.1793135746335;
        Tue, 27 Oct 2026 14:15:46 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8c576ebsm35750827eec.3.2026.10.27.14.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:15:45 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: willy@infradead.org
Cc: jack@suse.cz,
	akpm@linux-foundation.org,
	lczerner@redhat.com,
	tytso@mit.edu,
	hughd@google.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] mm: skip empty finite ranges in truncate_pagecache_range
Date: Tue, 27 Oct 2026 21:15:05 +0000
Message-ID: <20261027211505.22044-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a finite range ending before the first page boundary,
truncate_pagecache_range() calculates unmap_end as -1. The unsigned
comparison then treats the empty full-page interval as nonempty.

For example, lstart == 0 and lend == 0 cause unmap_mapping_range() to be
called with a zero length, meaning unmap to EOF. Punching one byte at
offset zero in a mapped FUSE file can therefore remove mappings outside
the hole, causing unnecessary page-table work and subsequent faults.

Compare the exclusive rounded end against the rounded start, while
explicitly preserving lend == -1 as the EOF sentinel. Perform the
addition after converting to u64 so the largest inclusive end does not
introduce a signed overflow in the comparison.

Fixes: 5a7203947a1d ("mm: teach truncate_inode_pages_range() to handle non page aligned ranges")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 mm/truncate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/truncate.c b/mm/truncate.c
index b58ba940be47..43c6cf99027f 100644
--- a/mm/truncate.c
+++ b/mm/truncate.c
@@ -919,7 +919,7 @@ void truncate_pagecache_range(struct inode *inode, loff_t lstart, loff_t lend)
 	 * once (before truncating pagecache), and without "even_cows" flag:
 	 * hole-punching should not remove private COWed pages from the hole.
 	 */
-	if ((u64)unmap_end > (u64)unmap_start)
+	if (lend == -1 || (u64)unmap_end + 1 > (u64)unmap_start)
 		unmap_mapping_range(mapping, unmap_start,
 				    1 + unmap_end - unmap_start, 0);
 	truncate_inode_pages_range(mapping, lstart, lend);
-- 
2.43.0

