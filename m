Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.74.67.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676703;
	b=kRfAvJm3ab26D2PEP+LPGQ4BTTZCSlOWGlpFT6xWRhfvTqv9okvqSFgapuBzVDcSvjwO
	 do+6Ah2npuX6PZzgAMYGEUy4MrxXl8nSQbD7Ph6wJ8m8je3VcqlVQExhtgh19pwqgK/ep
	 OZ31ZwjPrJp8LyO+atxjQ7l1KMoC6MZEO+QzhjJ5ke7JmlUAsYgmCIDlgbs507hIDqg4a
	 sNfcbi9Ij+mJTi8HI5FsslQ5uRzPCImlQy1iva4hVU8NeMhd7fP4p+0HXTGWuESuuQo4M
	 pndGAFly0KSbX/b2bp6BGiaot02fqWBEQ0vn9DF2QgRjACTXpj5rRg6U61t0LrxrVuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676703;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:DKIM-Signature;
	bh=MSm5kBNSoIVp8X+8c9wTFiq6d+atq8XM+dpEkHoRdzU=;
	b=HZiJcbNQj55YNzx58oRgZICdoUwYDvTj8lQofh56OHiDgCZ75Xn7al86BeC5kHrcpC8H
	 q+Ils25nY2DypWXkY2Pz89gFHCv1Btrx7VjHGDCh8lhalvPAxiQuVVfVx2gchLd7DUGsc
	 6b+GrEpmZVD1iYWqAT/3dpvCCVzaQujgz9QUeAJlHL8wnbTMuFE9gjo4bV35rH/c0caej
	 W32R8S1b/GQYyPUBOxihejznPF8uSMjQqJLeW5K43axwOFnDsuoe/F+my4xFzojAs5Lwx
	 QqQvWwmVBp/XTYvnJSzIAerF7/PFrmh/29IRMLdc/UQ87zOaHSzFJ3edtvclcuH2C/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=poczta.fm;
	spf=pass smtp.mailfrom=poczta.fm;
	dkim=pass header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=mns8DzrO;
	arc=none smtp.remote-ip=217.74.67.63
Received: from smtpo63.interia.pl (smtpo63.interia.pl [217.74.67.63])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF05260A5BD3
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF05260A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=mns8DzrO
Received: from localhost (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Thu, 22 Oct 2026 15:44:53 +0200 (CEST)
From: Slawomir Stepien <sst@poczta.fm>
To: leitao@debian.org,
	a.hindborg@kernel.org,
	k.opasiak@samsung.com,
	nab@linux-iscsi.org
Cc: linux-kernel@vger.kernel.org,
	Slawomir Stepien <sst@poczta.fm>
Subject: [PATCH 1/2] configfs: handle unlinked target in configfs_depend_item_unlocked()
Date: Thu, 22 Oct 2026 15:44:42 +0200
Message-ID: <20261022134443.1122318-1-sst@poczta.fm>
X-Mailer: git-send-email 2.56.0
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1792676694; bh=MSm5kBNSoIVp8X+8c9wTFiq6d+atq8XM+dpEkHoRdzU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mns8DzrOtbuQ1clp5TKHMLVI90N7gGEF4vDW/j7dugqHL55fiZWFvBbwXjv7q9KOl
	 M7Spup7fGUoP/PQteelzTZmkM++qkLBkKe0WUEet25prsBqP71YGTspbuqXBOqKTY0
	 U5nmAhsxedC7adH7Hyms7dg1R960+rufKHUG+JSc=

configfs_depend_item_unlocked() starts by reading target->ci_group to
find the target's subsystem and the configfs root, and dereferences it
without checking for NULL. ci_group is only valid while the item is
linked into the tree: it is set by link_group() during mkdir and
cleared by unlink_group() during rmdir, both under the subsystem's
su_mutex, which callers of the unlocked variant do not hold.

A caller can therefore pass an item that is allocated but not linked.
f_tcm does this from usbg_make_tpg(): a TCM function instance becomes
visible to the target subsystem in tcm_alloc_inst()/tcm_set_name(),
before configfs_mkdir() links it, and stays visible after
configfs_rmdir() unlinks it until the final reference is dropped.
Creating a TPG in either window makes configfs_is_root(&parent->cg_item)
return false for a NULL parent, and the following parent->cg_subsys
dereference crashes.

An unlinked item is just a target that is not in the tree, which
configfs_depend_prep() already reports as -ENOENT. It skips items
marked CREATING or DROPPING, and rmdir marks an item DROPPING before
unlinking it. Read ci_group once with READ_ONCE() and return -ENOENT
if it is NULL.

If the target is unlinked right after the read, the snapshot still
points at the parent group: unlinking drops the child's reference on
it but does not free it. The depend then fails in the tree scan, since
the target is already marked DROPPING. The parent can only go away if
it is itself removed in that window, which is the same theoretical
race the root walk below already has for every caller of this
function.

Fixes: d79d75b5c518 ("fs: configfs: Add unlocked version of configfs_depend_item()")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 fs/configfs/dir.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
index 0c80feec5926..7f4f448a6c66 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -1243,7 +1243,14 @@ int configfs_depend_item_unlocked(struct configfs_subsystem *caller_subsys,
 	if (configfs_is_root(target))
 		return -EINVAL;
 
-	parent = target->ci_group;
+	/*
+	 * The target may not be linked into the tree yet (mkdir in progress)
+	 * or may already have been unlinked (rmdir in progress).
+	 */
+	parent = READ_ONCE(target->ci_group);
+	if (!parent)
+		return -ENOENT;
+
 	/*
 	 * This may happen when someone is trying to depend root
 	 * directory of some subsystem
-- 
2.56.0

