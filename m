Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333AA479882
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107130; cv=none; b=eVfwzewikY99EaGmOb9RNoST+uvLkGYaiw5dNZnUiT7Wo+2Hx0aAb31rldM8nhi0hAb5ALQ4qqrWBIBP8IzYe9T2SSjGULqp5fXA0eyMvwC8qfZt3cx1XyzPO4rlG0GwTUOW+Cs6UzgH4EU4Aisj/Ir6l2dt8lHFG0bxzjuEYJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107130; c=relaxed/simple;
	bh=WKOh/3rPUbo6AQsl6PxuNwCtS+HOGnoHYPfAzkfTmTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rELYLGoc1ww5qIMtr7nN+Ru0XGutHmYTGjEb+nJ7jzKa8DBY4jmeV0CehATQip/LKZqgQFIW8GiX1ygVZ8UuUCw1t7hbN0QUA9LWPn1llxcb6Sg9cENbsK0QMbatc1I1307Inpj3oszyPbeg8TfZs0fNLHjOyXHvyU0gtx8YsJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=OPDp8dZC; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="OPDp8dZC"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144e32aaa1cso130178c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790107121; x=1790711921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BjX+mNuhQOmLJprMYKkZ8OPoLSpzkGrxDeWbqW/+m4I=;
        b=OPDp8dZC9ud72KyV3bUT7MLbrU2d8SjsIphqH7MnBzipGVTwlWGpBzHB4iwE6YHaXX
         na41k5QWFYXEGdHew5dek377TzotMn/0Haf7X7ztn+sTsZwfEXM87hao2bwQzhkJy1eH
         XcfglYVNz/jHmPO4rIrM7o5/nmsIhmqQvbqetHlxRfdLR3Jxg5/+xNuy8F0H+z9X9TJl
         3hDWS9zsCwfUz3bo9TSfsE6NsyxXKjGv7z7AtTwDwPq/NO4B1QAVjOOx8WfExJAvzeAf
         3W4+90DTKoI2fR/oZg5rPo0OWBX1jANqf6gOKTUQRalfjzJs6mNURZjaW+VcgfN1TKc7
         LTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107121; x=1790711921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BjX+mNuhQOmLJprMYKkZ8OPoLSpzkGrxDeWbqW/+m4I=;
        b=uaUfrk7FBCV5BdlffzJFRpN5W6q65vDbbToXaEnOVxM7kHKz9JMq/MWm6+QKa2tMLq
         YAKf330nhrdFK8uJrDZ+yCskD7+4/b63g/gV8VJzsPN+oGOPzKCIMed3E2oEvmy5KMih
         3J0RNtpBSMhrGvnBnMvKdlwbQ00+EyQRt3yibHQbh7dz0luVuTuL0vypnOXbaxGMVH5s
         rvCXREqWQZV0xEkN2n3Wo/EiSq4IwDbxq8YqfDNDxEwFwZ2z5P7YiX18zCEEk4O7D7fC
         8rwvKgiT1HeG7/aeLrywDLQV/1vjSJL8s6vgH/rJnZ6mJEzT+1yaK41KQqv8Y3n4jIi+
         nDXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzx0HnuXZPoUhtSRpgJ8ycaCHYsMUkUf9AoirTWK5om8oRcgnXf8dU7ojtUUPM0yTeW6rQ82oH/+XYrt3k=@vger.kernel.org
X-Gm-Message-State: AFuF++kPTzkb/Lcw0sOlNbU1+T/YqbkjCtBnRWyikg8Ga/lpCZ93uRCo
	R5tDIHpEEVGZL/rfsBZ1L7E7OdtxvHXuSoHHmUe3pcUU9VFsLO801TXtu6Cbt2reT7c=
X-Gm-Gg: AYBFou0GHo3iSFrY0F79DV6D0AThfS0kQ9SGU14uDvU7ezPNhtm7x4r8S6r7mr+QMzn
	kBJ6Gs8w99Hu36+75B/QZ0OlRZQ6nb3/haZkyRYeNCNRVd3cU3pp3DZzDMSYy7wOmoe+9tO7ArK
	dmBM9o2HxiNerOVxfXDlPLdtzUV61FPlGneDa75/wSdHghn+LbpSZ5PozK3iYgPL4L37v6BAgQL
	YlKz51r2M+91ZSt4M5jEOqf8STP16kqirROwdunJ+m7empWK/oqGww8+Wr83FDu6slRXsGOiye6
	bX4a/8GHkDRHKOFtgOxiv4xQXNNRwA+zKnwL/jJuAGhxHZ48a4+DJwjMRNTl247TlGysTIwoFiS
	kNhALxHIzcqAO6mkuA3ZK3ocmxoSiMDNK983dFzY/5JcmmPZCgJTdIRIdIC/518hYL1faGntHHJ
	gu8v8+Dz+i7kxuDnaYME44x0UhQMypJAHdouJYy6phoLvTvDqty2V5LwKuz8fJGXFIpccOTt0oO
	E05twbH7kdW5Lo9IxMhGSXvZhl17zZW3H5Ka3JQBeBQwjsQZ/bh8DrRZahGUGAFNnvJxMY=
X-Received: by 2002:a05:701b:4591:20b0:144:fa79:174 with SMTP id a92af1059eb24-144fa79031emr52410c88.44.1790107120989;
        Tue, 22 Sep 2026 12:58:40 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:c016:77a6:d382:7611])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e975223fcsm459820eec.31.2026.09.22.12.58.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 12:58:40 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH 6.1.y] btrfs: don't check PageError in __extent_writepage
Date: Tue, 22 Sep 2026 15:58:35 -0400
Message-ID: <20260922195836.27193-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christoph Hellwig <hch@lst.de>

[ Upstream commit 3e92499e3b004baffb479d61e191b41b604ece9a ]

__extent_writepage currenly sets PageError whenever any error happens,
and the also checks for PageError to decide if to call error handling.
This leads to very unclear responsibility for cleaning up on errors.
In the VM and generic writeback helpers the basic idea is that once
I/O is fired off all error handling responsibility is delegated to the
end I/O handler.  But if that end I/O handler sets the PageError bit,
and the submitter checks it, the bit could in some cases leak into the
submission context for fast enough I/O.

Fix this by simply not checking PageError and just using the local
ret variable to check for submission errors.  This also fundamentally
solves the long problem documented in a comment in __extent_writepage
by never leaking the error bit into the submission context.

Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: David Sterba <dsterba@suse.com>
Signed-off-by: David Sterba <dsterba@suse.com>

[ Backport to 6.1.y: apply the PageError-to-ret change in this tree's
  pre-btrfs_bio_ctrl __extent_writepage(). ]
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and Btrfs maintainers,

I am continuing with CVE backports still missing from 6.1.y.
This fix is inherited by v6.6 and every later mainline release, but 6.1.y
still has the affected code. The target-specific adjustment is described
in the bracketed note above.

Could you please queue it for 6.1.y?

Thanks,
Artem Dinaburg

CVE: CVE-2023-53429

Build: This patch was included in an x86_64 allmodconfig and
CONFIG_WERROR=y build.
It produced vmlinux and modules with no new warnings or errors.

AI assistance: An LLM helped find, adapt, and validate this
backport; I reviewed the patch and test output.

 fs/btrfs/extent_io.c | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 28dbac0bfab2f9..aeea8930b973fd 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -2299,38 +2299,7 @@ static int __extent_writepage(struct page *page, struct writeback_control *wbc,
 		set_page_writeback(page);
 		end_page_writeback(page);
 	}
-	/*
-	 * Here we used to have a check for PageError() and then set @ret and
-	 * call end_extent_writepage().
-	 *
-	 * But in fact setting @ret here will cause different error paths
-	 * between subpage and regular sectorsize.
-	 *
-	 * For regular page size, we never submit current page, but only add
-	 * current page to current bio.
-	 * The bio submission can only happen in next page.
-	 * Thus if we hit the PageError() branch, @ret is already set to
-	 * non-zero value and will not get updated for regular sectorsize.
-	 *
-	 * But for subpage case, it's possible we submit part of current page,
-	 * thus can get PageError() set by submitted bio of the same page,
-	 * while our @ret is still 0.
-	 *
-	 * So here we unify the behavior and don't set @ret.
-	 * Error can still be properly passed to higher layer as page will
-	 * be set error, here we just don't handle the IO failure.
-	 *
-	 * NOTE: This is just a hotfix for subpage.
-	 * The root fix will be properly ending ordered extent when we hit
-	 * an error during writeback.
-	 *
-	 * But that needs a bigger refactoring, as we not only need to grab the
-	 * submitted OE, but also need to know exactly at which bytenr we hit
-	 * the error.
-	 * Currently the full page based __extent_writepage_io() is not
-	 * capable of that.
-	 */
-	if (PageError(page))
+	if (ret)
 		end_extent_writepage(page, ret, page_start, page_end);
 	if (epd->extent_locked) {
 		/*
-- 
2.39.5

