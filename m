Received: from mta1.migadu.com (out-109.mta1.migadu.com [95.215.58.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1F44483A5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353176; cv=none; b=OxD0KmJx/Mo1TcCyJtyS/ABGdFR/v/2NZE6hUEok2Vb7Jy5mZpxuBn5/fZ59CYxnhy9reChPlRJj8RKa8FUB/5xToTxlpxrwE8ud0dXJxOYUIXXs5F1XtjK5ons/6Yp948oFihQNjGE1S9aTKkND94h1hBf0eRje3Ndw94Yw7Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353176; c=relaxed/simple;
	bh=LIIZ67WyrJ1BbHKsYGuShJUWhBgeY1V01Hjjf2SBjxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sQF4j0/QX0pNQp8y12evZFTfCvMd+7hBu0bcVn9qqvKqeIB1O4Tgr/IPdvEfR9kwBBAeNu7cx7HQPQWzYdkvuZYaG1HRZpiPCivkFuO0WfSHdAXjxayPMnMamG3iMfxJfsaYZ3zeTerRBF1E57zs1+hOQzeXWyHsjWCS8ZPdJ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gzDEtWMK; arc=none smtp.client-ip=95.215.58.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gzDEtWMK"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LIIZ67WyrJ1BbHKsYGuShJUWhBgeY1V01Hjjf2SBjxc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788353172; v=1; x=1788957972;
 b=gzDEtWMKn+ameBW1VAcv/ZCPYnwBlVSSM1c9SSbEQeC6XYttpIBazfQaQYXZYXgsJT3gSwEe
 gsrk1SxFgfwbJmPuD0Ym3yUidYoROPmec7qq8NFOmLyuBIPzELmK7QBG1VBriyx3a7bnlZMzIvj
 kbLIpX5A+uE12eCHjkuC52YY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f210d0b17b2194c4;
	Wed, 02 Sep 2026 12:46:02 +0000
X-Mizu-Trace-ID: f210d0b17b2194c4
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] Docs/mm/damon/design: fix broken :ref: usage and a typo
Date: Wed,  2 Sep 2026 20:45:50 +0800
Message-ID: <20260902124550.31175-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

The Statistics section refers readers to the DAMON sysfs interface
documentation for how to read the statistics, using a ':ref:' role.
However, the role name has a superfluous 's' appended (':ref:s' instead of
':ref:').  Moreover, its target label 'sysfs_stats' does not exist; the
correct label is 'sysfs_schemes_stats'.  Fix both.

Also fix a typo, 'frequenceis' -> 'frequencies', in the Adaptive Regions
Adjustment section.

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 Documentation/mm/damon/design.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index aed6cb1cf483..08c981c1dd91 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -249,7 +249,7 @@ For each ``aggregation interval``, it compares the access frequencies
 sum of the two regions' sizes is smaller than the size of total regions divided
 by the ``minimum number of regions``, DAMON merges the two regions.  If the
 resulting number of total regions is still higher than ``maximum number of
-regions``, it repeats the merging with increasing access frequenceis difference
+regions``, it repeats the merging with increasing access frequencies difference
 threshold until the upper-limit of the number of regions is met, or the
 threshold becomes higher than possible maximum value (``aggregation interval``
 divided by ``sampling interval``).   Then, after it reports and clears the
@@ -875,7 +875,7 @@ the scheme is deactivated.  Note that, unlike watermarks, even if a scheme's
 ``nr_snapshots`` reaches ``max_nr_snapshots``, monitoring will not stop.
 
 To know how user-space can read the stats via :ref:`DAMON sysfs interface
-<sysfs_interface>`, refer to :ref:s`stats <sysfs_stats>` part of the
+<sysfs_interface>`, refer to :ref:`stats <sysfs_schemes_stats>` part of the
 documentation.
 
 Regions Walking
-- 
2.53.0

