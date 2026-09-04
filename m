Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D742F8EA3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534788; cv=none; b=oGveeI7OXQ2BVl5zMcAqQK1GMBAgBArcicQy785TMMuLVfE32UiBfVoCA+GNdTa53c1w/LQQ4f/UiALum/dwyRqyLF7BYYmmeIurTw8O4rfpr3ogM6Pmr04GgShQACc6ymt1W3EwIrgDLg0+Jt4dUwpoiVInJblM2AS6Tz7H524=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534788; c=relaxed/simple;
	bh=1c+ecH8uuNYp3IKgpKgpW07tV0l3TB+x9EGP2nGu9ZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=prRM045N/ocmFG4b++Zg/59jx4vZEatxfnv+RVbjk59tBywH4iQjQ8aI8S7BhwElYZLv6mMEr0Q1/Cd3Br2yKx2ZegRv7tDkeCxn+g9Usrlk77uH2Hu37znjtfC2RpU5uEpqGpvZBllYPQwFlP70hyEShowAoTKz+1Be+mf1AVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gS8SMNln; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gS8SMNln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D08D1F00A3D;
	Fri,  4 Sep 2026 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788534787;
	bh=YTDhqWyU63qquth7ntQA9BiabBhfNeU/n3wjNRNaWCc=;
	h=From:Date:Subject:To:Cc;
	b=gS8SMNlnyBJwyDzDX8NtqkSCNTK4xkoeKOCPQuDtlyVCFYf6rYD8kz0s4kFo2o5zq
	 I2xZLrCjbJ7ZadErkGTUjIg5VsYNd2M6a0O39W2bSyNi3JxB5emRqrRFuAuXRgH21l
	 19Vownn4M/4cBuAP2Tr6DTPDkSuzWY8dZu6SvQ0PWgCl5/ywYVpjpAhWqZtI2Hxhdq
	 qU85lOSH5pcrobw2QGe8H5pQbWvHl98R8m/ir/O3Dr8I41ZmVHzqA73GkDgj+OiaEx
	 fOLsK7UNkVp7nS6hsFPDjP4qhTQcNvzpBqWERrepvcCadG1LYlVv+DOcGk5ujpNzQ0
	 CScblm/h/YzUQ==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Fri, 04 Sep 2026 16:12:53 +0100
Subject: [PATCH] mm/madvise: swap in CoW'd MAP_PRIVATE-file mappings on
 MADV_WILLNEED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-madv-will-need-map-private-v1-1-6b83cc99fcff@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqEIBQF0F+Jt54HplQ0vxKzkLzVg3JEw4Lo3
 5OWZ3MuSoiCRN/qoogsSf6+oP5UNC7Wz2BxxaSVblWvDG/WZT5kXdkDrjBwiJLtDq51AwM9dWr
 sqAQhYpLzzYfffT9GuzzMbAAAAA==
X-Change-ID: 20260903-madv-will-need-map-private-125e3e2f70c7
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, 
 David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Jann Horn <jannh@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Mike Kaplinskiy <mike@recall.ai>, 
 zhaozhengzhuo <zhaozhengzhuo@uniontech.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=ljs@kernel.org;
 h=from:subject:message-id; bh=1c+ecH8uuNYp3IKgpKgpW07tV0l3TB+x9EGP2nGu9ZI=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJm3f+3guFgy/vda766BCzVTUw7GKH9uXvt8upur6Cyi
 5dCsln6O0pZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjARn02MDE+sf7/kKp7qcblV
 b4Xbju8bDJuZpTdbvmC5VdXh927RWyZGhgWzjs6/7Dd1qll3pdA3Ab7mlb/VBI5/lZzJ/XzL8i/
 yO/gA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Currently MADV_WILLNEED treats file-backed and pure anonymous mappings
entirely separately - using POSIX_FADV_WILLNEED (equivalent of a readahead)
for the former and a tree walk and swap in to swap cache for the latter.

MAP_PRIVATE-file backed mappings straddle the two and currently get treated
as if they were purely file-backed, meaning any swapped out private pages
remain swapped out.

Resolve the issue by explicitly checking for CoW'd MAP_PRIVATE-file backed
mappings and performing both walks in this case.

Since the logic checks for vma->anon_vma this means un-CoW'd
MAP_PRIVATE-file backed mappings retain only the single file walk.

Reported-by: Mike Kaplinskiy <mike@recall.ai>
Closes: https://lore.kernel.org/all/CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com/
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 mm/madvise.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 73c2901b9adb..d0510dd49dde 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -297,10 +297,12 @@ static long madvise_willneed(struct madvise_behavior *madv_behavior)
 	loff_t offset;
 
 #ifdef CONFIG_SWAP
-	if (!file) {
+	if (!file || (vma_is_cow_mapping(vma) && vma->anon_vma)) {
 		walk_page_range_vma(vma, start, end, &swapin_walk_ops, vma);
 		lru_add_drain(); /* Push any new pages onto the LRU now */
-		return 0;
+
+		if (!file)
+			return 0;
 	}
 
 	if (shmem_mapping(file->f_mapping)) {

---
base-commit: e3b5239afe1b8f0194db7436b17c33e94c1988c4
change-id: 20260903-madv-will-need-map-private-125e3e2f70c7

Best regards,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

