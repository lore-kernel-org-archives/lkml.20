Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD1438E8B1
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107787; cv=none; b=TsKqbaOZc49L4ZNAR5bKkPCGIlAdXnEwaWR/hTZmRuOOYbY7WOybqGMKCG9mB2xIPZS/lVopELY+vZbqCfparJk6KzqLB7+xOAeCWHmtcJQglAtSOuarTpJfO6Qhegv+HYVpvfzd3AxtW26ZAVEut3RCC2fesQFZbnYjBjwz6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107787; c=relaxed/simple;
	bh=5JlpBxYD40ztw40lbBmQXZ5uTOaCMTIyeOq/marxx8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FL0sDNTem2w6c9N94o27U1TI1rVFt+fwxa0h/H8cRATQ/nFbpAb3YEw786NCk0mjxEUqbuDFPzoXD8TrOj7X118ToifIMdnbes4JSPOYdTyDLbojP+ejxMww+PAwjLjVQ/3Y8NlRzRu0/kh9nSSM3EvYVTZtwuCtSaZBbrTGCz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOWFDKOa; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOWFDKOa"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8686f46e4adso462428b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791107785; x=1791712585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SCB/3AIaM5xEYyIzslZamlr+QZIK+RG4HQ9PeozLAY=;
        b=QOWFDKOa7O5eYIpmdgRd5NknduMiFbRlHyrJAEZh/ZgNYR7VIygZIw/iFuqOSlpJjW
         NZP4ABTogemy/JlpVpsqlmbeOuG2i9+ddu8mYg2b7ElmkfA1hyXT1OtXQA34SO1f/cGl
         8DpdNRokyIV4G/5OIwoCKMkd1j9APdmrWi2ih7xI6iVkIjylOFOSP0sMWsxpWw5XrHp2
         izq6E1LHbyaMiT1cRdr2+9Pi5C1NxkDtzw5JkkMedO6bAx0vFsc09OHxfIkNxL0Znlpa
         WaoXxjIvNgSa4TZHJ4CaW/v8/Dd9zNaIbVjGwxrJXuT4kf6LPaHnunISBlCLrRCQlzSX
         GVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107785; x=1791712585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6SCB/3AIaM5xEYyIzslZamlr+QZIK+RG4HQ9PeozLAY=;
        b=YqF2pra26HF6/Vb4sT4DM+ZrWz8XrocrU1frOKEqiNci1QKQu5dSlBaDR3M7Qtt4GL
         /MMPb2EbEL63JhQBMXfAZ65IeGH0tI5h1uZtMR8bqysfm/8ezC2yUoAdMXEE4lDJV7YQ
         1LzzuQtCW1aMhClKUqGR/8R8L7/BNbNRT0f8I2pVePHT/vaFKfox4d/BCL/+naqNboM4
         83EnIf1N9VX3IEgxYrvqpydPaSZqdX/XDzSAerFZnkJ+zBpi+QWodQ80od9IFBBMlPOW
         ZyLop54wC60Xo38wJdYrAzeZraMKvWlSrRLcLWo5mBYxDKOzT8v0HUDX3GME6b1a96zz
         vzJw==
X-Forwarded-Encrypted: i=1; AKwUvBxxJcFYmBSDOY3WoohvSRQDp7bz2wDsVVU/mC17igMXSoU47W1uu9Q1o7F9vYCNXvYv2SqXc6lYChOcABI=@vger.kernel.org
X-Gm-Message-State: AFuF++miq7ednnf2ie9XQwbEzyk5mfinMpRgfqIKdVKjZIebYbVimCCL
	srY2AZXSsxRwZL/OIEpHmKCYGNF+qjpKLrNXYrU0t5YBRpNL5CLftyju
X-Gm-Gg: AYBFou10HjBikxefOZIwkFdwkeYY6T8VOpE0Nd9GJC1rb5LHlpfDL9s8GKQPtzYZrfs
	eo4MJsmly+RqhVwElTXC9FgG8jP0zFSL7S43D8ALKSj10y6Kh4V2R1b2VW+VwPkKhS9z8/41lEb
	v/on3+NnKXwsniwlwpDPr3HFHIzvLLLMcN52GFzJ1oygINn20x44UpZSsB70Dg+7EhNMqyxd50K
	ZnheWEeB0yt4cDs8g+kj/+mYdOkQe0umax4gMIJQeGQ29pfjI8BIBXVkLjqT4UIg61BL5mA+ZuR
	42eiWC0DxEarhaU8UhykSRYvblWCsf8k3mmbTaZC3A+l+BS3lXD1TQfZqEgWtbB2MF/PM0mko5v
	hYX4pPg8TvA9Cssyw1aBCPkpAZ95zmcwrjg7Fo40MrXPTCxpLcoyGgzQYluuBbUvEHWfeIFXsXh
	89P8FuESxUeZgdJtVA8skgob0Wd2a7ZpDhH7bF5/io2f49bx7S8vjhvOlrhz6H6X5nL76vnf8td
	Y2hGMhQdpkGRBvlC5ilo7V7Lg6W27Dpt4OqorQc9Kz/mAaeEra57ECZMsF1jsUVw+BV6DdqAKiD
	eewA/wBLmrEc8vCDnnpjYhMLh7jGZwRaTTkm0xTYhPJHkg1xRwspZfOkGT0=
X-Received: by 2002:a05:6a00:1bc7:b0:880:ee58:2768 with SMTP id d2e1a72fcca58-88af8b3f3c3mr6115341b3a.56.1791107784970;
        Sun, 04 Oct 2026 02:56:24 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a39f6sm2418175b3a.28.2026.10.04.02.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:56:24 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] ntfs: do not give a contiguous cluster allocation a second run
Date: Sun,  4 Oct 2026 17:56:08 +0800
Message-ID: <d839fd6fce07e1303ae8627739d6db361e50bf07.1791107674.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1791107674.git.matthias.goergens@gmail.com>
References: <cover.1791107674.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_attr_map_cluster() asks ntfs_cluster_alloc() for contiguous
clusters and merges the whole result into the runlist, but reports only
its first run, so its callers zero only that run.  Within a bitmap page
the allocator keeps such a request to one run, because a cluster in use
ends it.  The zone search can also move on without testing the clusters
after the run, though: it skips a bitmap page that has no free clusters,
it goes from the end of the zone to the start of pass 2, and once every
zone has been searched it shrinks the MFT zone by half and goes on at
its new end.  After each of these jumps the first cluster tested is
still taken as the next one of the run, and if it is free it starts a
second run elsewhere on the volume.

fallocate() over a hole then leaves the clusters of that second run
holding whatever they held before: on a nearly full volume, 16 of 20
fallocated clusters read back a deleted file's data, in each of the
three cases.

Delayed allocation gets a second run without punching any holes: filling
the same volume with write() reaches the last case when the MFT zone is
shrunk.  The allocator then takes only the first run off the
dirty-cluster count, and after the fill statfs() reported no free space
while 939 clusters were still free, until the next mount.

Before setting the bit of a cluster for a contiguous request, check that
the cluster comes right after the run, and return the run as it is if
not; no bit has to be cleared.  ntfs_attr_map_cluster() already handles
a short run, which a cluster in use produces in the same way: its
callers ask again for the rest.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
Suggested-by: Namjae Jeon <linkinjeon@kernel.org>
Link: https://lore.kernel.org/all/CAKYAXd-agPFvDj2-HvjP3SLtG7AxkqUeNPqYyrLt-BN7fT8w6g@mail.gmail.com/
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
New in v3, after Namjae Jeon's question on v2 2/3.  Patch 2's early
return for the run from the hint stays: without it the restarted search
would read the bitmap until it found a free cluster just to return the
run, and if there was none it would fail the whole request with ENOSPC.

The other contiguous callers are the attribute list allocations, which
free a result that is not one run of the full length, and
ntfs_write_cb() in compress.c, which writes the whole compression block
from the first cluster without looking at the length.  That was already
wrong for a short run before this patch and is not changed here.

contig-paths.c and its guest init script init-paths in
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-10-04-ntfs-nearfull-v3
set up each case; the README there has the results.
---
 fs/ntfs/lcnalloc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
index c58e689fb585..3ebcac4c2864 100644
--- a/fs/ntfs/lcnalloc.c
+++ b/fs/ntfs/lcnalloc.c
@@ -375,6 +375,16 @@ struct runlist_element *ntfs_cluster_alloc(struct ntfs_volume *vol, const s64 st
 				has_guess = 1;
 				continue;
 			}
+			/*
+			 * A contiguous request gets a single run.  The scan can
+			 * move on without testing the clusters after the run
+			 * (past a bitmap page that is full, to pass 2 or to
+			 * another zone), so return the run when this cluster
+			 * does not follow it.
+			 */
+			if (is_contig && rlpos &&
+			    lcn + bmp_pos != prev_lcn + prev_run_len)
+				goto out;
 			/*
 			 * Allocate more memory if needed, including space for
 			 * the terminator element.
-- 
2.56.0

