Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792854626;
	b=2qXpuJXYB/OYJY/KkDNLHa/cuCzzGOkLMxJhYiQi9zdRr64aHhlRnY9SZXfa6z5etYmx
	 68QzWDJxYxXhtoS6sxCmX4P13HOQqkq2lZj5TFpSa9X9Up5kvJofH93XzBx5dw4TQxIV+
	 U0I2AqQ0UdPgbbJltI93+5HI+yMBuQ5Nkmj/dCrILogHGuNJ4dRnvmjeHQ9jOgvKiZklJ
	 kYbZ5Ca87XpR3fLdmUtgd58XIkwD4zBH94/1SAPEXbnPz+Lf9klGU0Vnz3Ik9O9bD7+qs
	 1yTNB9D8y97RTckQyn0aIoZKn5nkfioPvwow8u/DJV4wueZ2SspsG3A7eDye7prPV/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792854626;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pgOgHSkQy+vlG7fTbkBba2DJALi86z5qXnzSUHGXa6s=;
	b=4cL+eN3RqYtYbdBqfGIRDJOtZiIb/hQxi1tI44LWQwVI1bW3S1soh+Ai2f8iJAlZ8cMS
	 1zudgfyNHJM4wZ0VNWhEZk5I0M5pyGcg2DehiQplNihPtrCS8sObniCNnEYb7HdKNI63V
	 wbs0gxfYXyAVZLQBR3dzrAlkvcm1jh7rzhSW1/coe1vB7i/oKUa2TjjQH/6TvhGXFONPV
	 UsDfW/3Qc2+CtW6KxP2zDM1FfgAaF+6bpfsNSULNuU/JLiigECZaxiHOaHybj5k6S2O0U
	 /GyxbZbXlPqiVXRkT8kfqjsiglnJMn79dTSlvI4TxdG/uU1quZRIaPqoLx1C58PVRoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NnYMNx0t;
	arc=none smtp.remote-ip=115.124.30.131
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAC5606A33E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AAC5606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NnYMNx0t
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792854613; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=pgOgHSkQy+vlG7fTbkBba2DJALi86z5qXnzSUHGXa6s=;
	b=NnYMNx0tm1uavPWyzzAIGb6RD0vFeG4CTHzUIemBGWyeC44XJx78bNa3lovV8C1odmYA8vE+diWnM9og+wOU++KCUC/PjitdVzJJv3RSbhcd4BvP/SESdyLUwgsZw+v+akOLFVNcftBEVdbaJ2w9Q/tzw4nDkPYlf9Ka5I5Qw84=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XDONePF_1792854612;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XDONePF_1792854612 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 24 Oct 2026 23:10:12 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] ocfs2: fix stale xattr entry pointers and empty header reads
Date: Sat, 24 Oct 2026 23:10:06 +0800
Message-Id: <20261024151012.1059683-1-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
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

Five defects in the ocfs2 extended attribute code, plus one robustness
measure that belongs with them, all on the paths that move entries
between a block, a bucket and an index tree.  They fall into two groups.

Stale entry pointers (patches 1 to 3)

ocfs2_xa_set() writes through a pointer into xh_entries[] that two of
its callers invalidate first.  Defragmenting a bucket ends in a sort()
on xe_name_hash, and lib/sort.c is an unstable heapsort, so entries that
share a hash can trade slots.  Copying a block into a bucket changes the
order outright, since a block holds its entries in insertion order while
a bucket holds them by hash, yet ocfs2_xattr_update_xattr_search()
relocates the search by the index the entry had in the block.  Neither
path compares the entry's name with the one being set, so setxattr() can
replace a neighbouring attribute's value and still report success, or
trip ocfs2_xa_reuse_entry()'s BUG_ON.  Patch 1 takes the hash before the
sort; patches 2 and 3 look the entry up again afterwards.

Reads of an empty entry array (patches 4 to 6)

A block and a bucket may both hold no entries: ocfs2_xa_remove_entry()
keeps the last slot when it removes the only one, so an empty bucket
still carries the hash it is keyed by.  Three sites index xh_entries[]
without checking xh_count and so read xh_entries[-1], which lands on the
header and comes back as xh_count | xh_free_start << 16.  Nothing
faults, but the value is acted on: the collision check reports no
collision for an empty bucket, the divide commits a sentinel hash that
hides part of the key space from ocfs2_xattr_bucket_find(), and the
block to bucket copy claims storage the bucket does not hold.  Patches 4
to 6 guard each site and keep the one read of xh_entries[0] that
ocfs2_xa_remove_entry() documents as intentional.

Joseph Qi (6):
  ocfs2: read the xattr entry hash before defragmenting the bucket
  ocfs2: find the xattr entry again after defragmenting a bucket
  ocfs2: find the xattr entry again after converting a block to a bucket
  ocfs2: do not read the entry array of an empty xattr bucket
  ocfs2: do not index before the entry array when dividing an empty
    bucket
  ocfs2: do not read the entry array of an empty xattr block

 fs/ocfs2/xattr.c | 146 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 123 insertions(+), 23 deletions(-)

-- 
2.39.3

