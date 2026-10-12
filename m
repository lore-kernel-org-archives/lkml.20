Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A5D497B96
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816572; cv=none; b=esRBKHqf7gj7vLqtKZfF1KZD+UuzgHRbzuEMAzasLr8ui6zMOxYuTlIJWXc6Fn1l4dM1WZaz/A1GCz3awgM+wHzZvKc/m3UA9xX5dU0qy5zAcx7gZkiRQ06O0rD/DEntv8H+WzomM5nWqOyCtbFNaZVaMiVcpKGI3t1+yR1dF6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816572; c=relaxed/simple;
	bh=c16ZXWH+GRMU9Gv5D5TMERR/RKlvixHWFMYKRCEvbV8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MmQuVSbAti40dDNGQxnOrLK37bzu63sSVN+noy2Q6vwbaof1o+SjmASSazJkGavh/DddbnuA/dTamJ2htuZ0OfyBpXw+GivLfH9GRzb1gb1QMtRbwPRHiG9P3UgAA/adq0kQTspo6I7u3gDa6QehAKUWohBAocGQQhqHI4TG06k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjUNRMFE; arc=none smtp.client-ip=74.125.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjUNRMFE"
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-3538045633fso1678435eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791816570; x=1792421370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNefojtvKaPsWksx1KlDETs9fKwCel6Xh/eUYbsILEo=;
        b=FjUNRMFEC+pDGGGu8b63dqh18hWiqu5fMctk3Z2IyZ2Nr6Ao42/QBQh0xUvFzV5Msm
         FAMZKkpD5pzEYT6ogVyvGuejLAGGRmirA0pCff0245ea1fwpAE+IzX0fnskhqqqwJEHq
         HuIOb2QdL9auLOjXYfT/Guhy63chO03CcQ2mdOZTCNHNEUr2NGwQJi4QmJCJIzZEsS0v
         5eFqEeOpkoPfdUABtGvHvRtqOTU4MKL/H8Q23mUL7ukiZgBJWGdDNsXAZHvzDI0ILMNU
         i394zR2QxRvmAqFkj4nWLafHfJ96uuKLAcMh0Ct18V977s+dTl/VdKjIdGeCjazkCRwN
         f+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816570; x=1792421370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNefojtvKaPsWksx1KlDETs9fKwCel6Xh/eUYbsILEo=;
        b=m41gkmnqTt3cgq3KLCBz/BHErGvpP6WAwxb/svVRYLWUO45bImXCbwmUR6gAas4oiZ
         bX3UAJMVnt74ItHMwMRngZIea5t33gL3NxMTp+xy2637I9qzNz5UxLqCcefq07sgGTNZ
         GqoMAftKqIlBIOemsaXViGtnceHbO4Pz7S0ApLwOoYnqoIh88e+egnzVeWdeYWgcZMBG
         DkygdHGkCwspd7xrvbfvikZtBiDuZC5iZes7D42CvgRBq4ON/6E9mvX2ZsxE+iaUN95q
         jdnj+Qi4emXF7FvdFJL3j4rZjHOYh7fFHga68JpZ1k5FPAiM5Yr8Z7ExJKbR+QsvmkC1
         7CLA==
X-Gm-Message-State: AFq9FYLENvgqpAnUY6xxfZBJqVLcIapeX0uwHxIEj/atXUghegPrJ2vg
	JDC5vy4hd/rSJ8nKs9MPAIZEbP7GKpAGLeT00lnLQMcWNC1jnNiGH0SCuCd1JSzFsnLLX86b
X-Gm-Gg: AYBFou2MehpYCmBHx3/Pa/SziRrbNYAAJxg87df8XlSELb2LB33+WpgYHblFwWR/+mp
	0ckJXGdPMar+t66ZmysBFConGoxWOIndRNIV0GXyBfdaD7Wt7h+aTtmhC9Z6Ufog9RVrYOYQllN
	2garK8EWA73AzqvRAEPYFUBAOC5qSv4pBVyDYlrEDG/EJr2IJt1PwPzGZBs0ulu1guA4DKJ1byD
	lnD4Rlw00X/SnysN2MZ+ir3pxq9enLQCHPtsM1VZbMZlfhFQN+dAJxB46sjfx0Og8996gUwznVt
	8xCU/YhWkEkkuXROS6bTZcEA1eDfGfmmJONUga/vQJ4QCs6OaY62AGDnDFUS9TgFUmVc1ioHla9
	Tv9ySi9dapmrhA/I0+jzh8t/k8OHVJi95QbS4BVwNWjVuL4Eiq9FhK0ukvio6QBYqoPO+Qb3sEO
	gv7UJXFP0tkq5FpKvpkDvhXdDujehjBkF9X5nC4Sq/gf38ctF1UPkcQtU74t/cPzKfoOXS5h9M4
	pnJkgkM8mftvxJfQlokiv+2NhLr8hRUvnsMxg0k1YwEznMzjfxaFve4WUKUON8LZF9LOQ==
X-Received: by 2002:a05:7300:a50a:b0:33b:f5b7:f494 with SMTP id 5a478bee46e88-3537df8cf05mr20301538eec.13.1791816569788;
        Mon, 12 Oct 2026 07:49:29 -0700 (PDT)
Received: from localhost (ec2-18-143-158-86.ap-southeast-1.compute.amazonaws.com. [18.143.158.86])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm11272773eec.11.2026.10.12.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:49:29 -0700 (PDT)
From: jianyungao89@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Jianyun Gao <jianyungao89@gmail.com>,
	stable@vger.kernel.org,
	Jan Kara <jack@suse.cz>,
	Dan Williams <djbw@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	linux-fsdevel@vger.kernel.org (open list:FILESYSTEM DIRECT ACCESS (DAX)),
	nvdimm@lists.linux.dev (open list:FILESYSTEM DIRECT ACCESS (DAX))
Subject: [PATCH v2] dax: fix wrong error code returned from dax_dedupe_file_range_compare()
Date: Mon, 12 Oct 2026 22:49:24 +0800
Message-Id: <20261012144925.6728-1-jianyungao89@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jianyun Gao <jianyungao89@gmail.com>

When dax_range_compare_iter() returns a negative error code (e.g. -EIO),
dax_dedupe_file_range_compare() incorrectly returns 'ret' which holds the
positive return value from iomap_iter() indicating more iterations remain.
This positive value leaks to the caller, where vfs_dedupe_file_range()
interprets it as success (bytes_deduped = len), causing userspace to
incorrectly believe deduplication completed.

Return 'status' instead to propagate the actual error code.

Fixes: 39eb05112987 ("dax: advance the iomap_iter on dedupe range")
Cc: stable@vger.kernel.org
Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---

Changes in v2:
- Add Fixes tag and Cc stable
- Add Reviewed-by tag from Jan Kara

v1: Link: https://lore.kernel.org/lkml/20261010021010.19575-1-jianyungao89@gmail.com/

 fs/dax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dax.c b/fs/dax.c
index 6ba50142eeb2..1f6a4fbb97bd 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -2261,7 +2261,7 @@ int dax_dedupe_file_range_compare(struct inode *src, loff_t srcoff,
 		status = dax_range_compare_iter(&src_iter, &dst_iter,
 				min(src_iter.len, dst_iter.len), same);
 		if (status < 0)
-			return ret;
+			return status;
 		src_iter.status = dst_iter.status = status;
 	}
 	return ret;
-- 
2.34.1

