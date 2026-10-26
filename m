Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033832;
	b=UXJvmb+HbwjSv7FxEqGmwFZ/gMVk+vVYOXvt9HzIhvIwdbxHNYjn+SISJ6rJhweXagVU
	 lFkel8gcj63vDNnoZcNFCqHDXPlAR3tKgSKAaOUGteC5UArWJKwOTmKZlVVgn6UT977Hg
	 UZhLS5XPGnSgE+9/cmRYN85w0FNMmnq9SyTDsfi1UnHcAvXjBkV5pKK+Kjde+m8MJYpqC
	 +X7ZkGU4VFaRnPLuO8/ZiD268dUB9dcf+cjy/hQFH50V/S4DXOaYpxXEdT///7IOhFpxf
	 /Ql4H38CYK9AVZg9FKgQuamuGQYElou2+0fVrcoweHExx81pMXyug3TeIm2fQ2nrGTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033832;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=kFl7MRNvl9bJICGAhMQ+GwzQCnjh5kNzfKB9wEKMe7A=;
	b=nLXrwk7y+aMr8IPu3jqyBv6kpTB9Tia0sZ87zlqyfTYDJtT9lwffAa5p/+N5/ApKvuiU
	 2ayCqoLFrj89V/dwqVF5oX+D9nZxc1uERAWH8ltVqQL9TDB1AUw8DHeW+fqPWsvwU+mWx
	 wIacLGL9j9JN5iv5RUGdVdTlGhnPCH6L95XrPNSkQAXGqlyaH7neUO30/yD9afha9cEH3
	 iTq1xvp2SU8qXRc4wwXWzbPimQdgvtchm2fpiOBjGEveo9tx7D70D2aNWdvK4CaZY2hO3
	 IFmd3h0aSAud4NQxbDJbl1x2ym7JgL0I4rz6DpuEwg/7AYM7sQajjscEH4RUn4lwEhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P16kEGcT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0219B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P16kEGcT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3FE1F01825;
	Mon, 26 Oct 2026 16:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793033831;
	bh=kFl7MRNvl9bJICGAhMQ+GwzQCnjh5kNzfKB9wEKMe7A=;
	h=From:Date:Subject:To:Cc;
	b=P16kEGcTtbXLSgcPjCtDVsE0Pxalo8lbBtHYHRW0ubUD1cGT4BaTwX0bxAK64UdI2
	 0V9w/M/k1Rfuctr+JQxnyfGZ3DXjJemM6vSGSL3q9Le6phs9qzgv1Dv6Y3DwaM8I8G
	 tuu/1OFRU/BK6DDPcbU0KaqOsqvFsliMKyjxQX4XF3pIn0zOFEyey1EnO02nGx49CA
	 y3D2UHwdxPHTmjHVQYen0TpbshGn3kqFQq/yo5boF6stpH481PiU3ZzXbRnaqV6+/u
	 q+zyDdg8R5HFGMm0Q8BcdiBX/Wn9LB1hWMhbidXonUppQu36Ax6svYurqeFCUE+ay0
	 UHGv3hrOqP9Fg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 26 Oct 2026 16:57:00 +0000
Subject: [PATCH] regcache: maple: Don't overflow the register number when
 inserting
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-regmap-maple-bounds-v1-1-446f3eb8d406@kernel.org>
X-B4-Tracking: v=1; b=H4sIAF2G32oC/yWMQQqDMBAAvyJ77oJRq+BXSg9JXHVFo2SNFMS/d
 20Pc5jDzAlCkUmgzU6IdLDwGlTMIwM/2jAQcqcORV7URsFIw2I3VGZCt6bQCTpf5s2zd42tDGi
 5Rer587u+3n+X5Cby+72C6/oC74kpeHcAAAA=
X-Change-ID: 20261026-regmap-maple-bounds-bc3075fb7a41
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2989; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ds05t4xgg42Fe0hAeaIYRDVRqZ4oWDmU/T7CrU+eAlM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLut6XstUqVn8XxPanmwqIPL0x7G5w5zvhevr8m0HGGn
 uJL7a8FHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhIqiojQ9eSKLebH4NmnPqd
 vFY1+m71JxGzKP5Ze/fzlEtNnh/x9jXD/+ybGoY6fCKLnzCyq7wN8v58ckLkOYNH9VbSv766+P1
 OZAUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

When inserting a previously uncached register into the maple cache we
check for adjacent blocks of registers above and below the register
number we are inserting and merge there.  Currently we check for reg - 1
and reg + 1 without worrying about if reg is 0 or UINT_MAX, meaning that
the register number will overflow and we could consider a block at the
other extremity of possible register numbers adjacent.  Avoid doing this
by clamping to 0 and UINT_MAX, if we do this then our search for an
adjacent block will fail as we will be looking for the register number
we are trying to insert.

The current behaviour means that in the event that we do attempt to
add 0 and merge it with a block at UINT_MAX kmalloc_array() rejects the
allocation for being absurdly large, this results in us failing the
write.  Such register maps are very unlikely due to the normal patterns
of register design and the fact that register numbers usually have less
bits than an int.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/regmap/regcache-maple.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/regcache-maple.c b/drivers/base/regmap/regcache-maple.c
index 16e488da5f23..9bc217b1e6f9 100644
--- a/drivers/base/regmap/regcache-maple.c
+++ b/drivers/base/regmap/regcache-maple.c
@@ -41,7 +41,7 @@ static int regcache_maple_write(struct regmap *map, unsigned int reg,
 	struct maple_tree *mt = map->cache;
 	MA_STATE(mas, mt, reg, reg);
 	unsigned long *entry, *upper, *lower;
-	unsigned long index, last;
+	unsigned long index, last, lower_reg, upper_reg;
 	size_t lower_sz, upper_sz;
 	int ret;
 
@@ -54,18 +54,33 @@ static int regcache_maple_write(struct regmap *map, unsigned int reg,
 		return 0;
 	}
 
-	/* Any adjacent entries to extend/merge? */
-	mas_set_range(&mas, reg - 1, reg + 1);
+	/* Avoid overflowing and wrapping */
+	if (reg != 0)
+		lower_reg = reg - 1;
+	else
+		lower_reg = reg;
+
+	if (reg != UINT_MAX)
+		upper_reg = reg + 1;
+	else
+		upper_reg = reg;
+
+	/*
+	 * Any adjacent entries to extend/merge?  If we are here then
+	 * reg won't exist so if we clamped lower_reg or upper_reg we
+	 * won't get anything from mas_find().
+	 */
+	mas_set_range(&mas, lower_reg, upper_reg);
 	index = reg;
 	last = reg;
 
-	lower = mas_find(&mas, reg - 1);
+	lower = mas_find(&mas, lower_reg);
 	if (lower) {
 		index = mas.index;
 		lower_sz = (mas.last - mas.index + 1) * sizeof(unsigned long);
 	}
 
-	upper = mas_find(&mas, reg + 1);
+	upper = mas_find(&mas, upper_reg);
 	if (upper) {
 		last = mas.last;
 		upper_sz = (mas.last - mas.index + 1) * sizeof(unsigned long);

---
base-commit: 2dee91ee94eec85d09c13c7ca83e3005906d3732
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.4
change-id: 20261026-regmap-maple-bounds-bc3075fb7a41

Best regards,
--  
Mark Brown <broonie@kernel.org>

