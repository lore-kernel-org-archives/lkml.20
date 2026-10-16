Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1983EFD24
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792187757; cv=none; b=cSBzC14RNpyJbSbFg7VkBHybAcyRfo6pAlRvsbfxi2Ett84MLIc0vldwU2KYnwJHXFBzF+xOKZ2mGtLJZF3YlXgge7p8xd9yhj4N16ChF/p0+3Y7/0PDeBEhJikiR1tfoCJ7ahZ4IEa5AEYnqgsGDurojVGzb9pThUpT8h0y4lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792187757; c=relaxed/simple;
	bh=6PlFPl5yyg+7VyuqK7O9sVNkpaIz69EVRd4L3Av4NYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qMjmLpMm1tnpz8FFWgwy3j2yW+hi3zUWGoMKl2fAKvCzSUh0yv8CXhRXQAzG0bHIfkihko9wO5szEWVNA29Qd5IKWpRmrAi7EdO7u1OJA2PRdeOG/1YI3yMgRvmfiYXUg5OQ9qQWrk7aqs+UgpTJq8Gt35XXvHBMM2dmAZlQmek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoRCLT1C; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoRCLT1C"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35b2c599f43so710035eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792187753; x=1792792553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LEYeqJ4N4i7YjnqQCG2LK1nS6owgSqR6t1k2WUrMsnw=;
        b=SoRCLT1CKgL3vDityzJ3U6ecYc16qj0hQ2nhepLOMNuXtnLZ+mqEYX5w5G97VYFrr9
         BOmYKmV5EDsmBsKxii4OtcUG7HAoDDEPn7cX1r80sPHfKRkCVe+W6I6K1exlkAc0e2kS
         LkNiOtY2AafxWGGwxzlhAcX9Vi8K1xNzQBjsGYHqoHxTK7eWhyhAV6/p7VCK/n/UIfn7
         +rY6z5XPFSKtJZbPJf9xkuDrELD0sEOL7tEB8oieWtGRevS6L5gAqmR3zHQBZQ6SW7pf
         +PTnsYwIesisTyOZgzVhLpNUF/CcUDWhFtOccjnNJjVDoRODUy5s5GGJDeMNRWyGyur6
         0TJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792187753; x=1792792553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEYeqJ4N4i7YjnqQCG2LK1nS6owgSqR6t1k2WUrMsnw=;
        b=OJuTuEsbl6fyjFRYzmt4CuHHpCWOoWp7VH8w3l4C7S+ZHhFurmqHQpBEUBK0D9ihjd
         Z+N+lTGtopy6JJ298AY6fMTgxO3JkG6ysQqbpdNLcwNI63eS1HQB5IfE0a61UgGDUDXv
         DoYQr97SWHX+FVgTBWj2Qq+kvgtYa2/23T/fXkaXU0PhBNwxMv2sO35ZxHLfe3z1qCQH
         JiOolNU7HHoPwNlHyh3H5Xl9PJ+UFc7oP4Qi0JZ0cEzvPanRlT7aX3OKYMEcWsUvq8kv
         aZa1RFk9NeQH2qZngjS+uq9JD4GJL8g5+DcR0NIyz9Jwh/3O7zW8gz3F7IADCtH7q7XT
         gq8g==
X-Forwarded-Encrypted: i=1; AKwUvBy9ia75+FUNcdMr4V1zaWigugRotbI5LecPmf241WgRsSEDaVREKLScF2dnvF82yG+n+xVUdePYoB0mi14=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvGl0FLh51JBOAydP8ex1XkZgyORcvDYoczEaMEb0fHYcblbnt
	0mO/blxYeD9rGspO0esktEsbt0C8De6VOjxBz5qje4L2+cmWr3DN8FZU
X-Gm-Gg: AYBFou2fngoRysuJbjpQmlc5FMchTzqLL8usCdFTI+CbEJTaS98KwUKtqwza3n46db8
	zdhZgX4MTxIhFUMjpK3Glb2qEKC4K1A92WSQGiPTy6aFV4aa6yG16cM7fv+xLX/KBqdG2lbhSDC
	S0/fn+kLAzhrQmyg+sYqOcrAQZPBy9liphgbta1r3w6VhikCDuZH50X3oxdVDhALHQzs/b0Urz2
	4pdr8vHwprVxDEigXvEm1/ruaj6xvWE71i6eHy6CauibTKvbLYhXQJ3FPmrTt9lwKcHQI8lIfh+
	6q7Sa+1kV+S6/0SMfFy6Fp8Nn4X0hKNXYeMKerc8uHsPcPDuJw0umUDNz5H/1+6QfCEKN+4FGW3
	XjHGcKtjNBv2g1W3POSyvsTHE1+EgoKP8Fm1G8T2Dm5Cv46Xq79cgI/wNHN83d08D8l7fMgq0Ek
	+zHO/DqxLE8qqQA6lwkd+/GbVyOKkplfgvxAdG79DeBI8/XP3mzdnh8dQCkWU9dIcC0dXSuv5cQ
	MLr7riL+g==
X-Received: by 2002:a05:7301:52c7:b0:35d:d671:933a with SMTP id 5a478bee46e88-361a185eff6mr1110380eec.15.1792187752437;
        Fri, 16 Oct 2026 14:55:52 -0700 (PDT)
Received: from FredPC ([2600:381:b915:8f8d:c200:c442:48e:8bde])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm10537981eec.6.2026.10.16.14.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:55:52 -0700 (PDT)
From: Fredric Cover <fredric.cover.lkernel@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	David Howells <dhowells@redhat.com>
Cc: Jeff Layton <jlayton@kernel.org>,
	netfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fredric Cover <fredric.cover.lkernel@gmail.com>
Subject: [PATCH v2] netfs: Fix off-by-one in the flush range in netfs_page_mkwrite()
Date: Fri, 16 Oct 2026 14:55:17 -0700
Message-ID: <20261016215517.33292-1-fredric.cover.lkernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a page fault wants to make a folio writable but the folio belongs
to a different netfs group (e.g. a ceph snap context) than the one the
write is being made under, netfs_page_mkwrite() flushes the folio and
retries the fault.  It does so with:

	filemap_fdatawrite_range(mapping,
				 folio_pos(folio),
				 folio_next_pos(folio));

filemap_fdatawrite_range() takes an inclusive end offset, but
folio_next_pos() is the position of the first byte of the following
folio.  The range therefore covers one byte too many, and writeback is
also run on whichever folio contains that byte.

filemap_fdatawrite_range() is a WB_SYNC_ALL operation documented as
waiting upon dirty or in-writeback pages in the range, so the faulting
task can stall behind I/O on a neighbouring folio that has nothing to
do with the fault, and a neighbouring dirty folio is written out early.

The off-by-one dates from the original implementation, which passed
folio_pos(folio) + folio_size(folio) as the end of a
filemap_fdatawait_range() call, which also takes an inclusive end.  It
was carried over when the call was changed to
filemap_fdatawrite_range().

The flush of the faulting folio itself is unaffected, so this does not
cause data loss or incorrect results, only unneeded writeback and
latency.

Fix it by passing folio_next_pos(folio) - 1, as the flush_content path
in netfs_perform_write() already does with fpos + flen - 1.

Assisted-by: LLM
Fixes: 102a7e2c598c ("netfs: Allow buffered shared-writeable mmap through netfs_page_mkwrite()")
Signed-off-by: Fredric Cover <fredric.cover.lkernel@gmail.com>

---
Changes since v1:
 - Correctly CC netfs@lists.linux.dev
---
 fs/netfs/buffered_write.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index ecf119b4f9166..b398c3bef6f3c 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -579,7 +579,7 @@ vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_gr
 		folio_unlock(folio);
 		err = filemap_fdatawrite_range(mapping,
 					       folio_pos(folio),
-					       folio_next_pos(folio));
+					       folio_next_pos(folio) - 1);
 		switch (err) {
 		case 0:
 			ret = VM_FAULT_RETRY;
-- 
2.53.0

