Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879230;
	b=nmLSa2+CtoNdMj2vT2ASC/hkEJEGl7SNnvRhnG5YD62p7FEgAxfE9i+va5kuIk3RiIIW
	 LgLo38D5Yas4KRlf3FE9tPQE2Hzogshj3ektiQfuT6Fdhwk/vD4DyMTB51eqe3VsKpOcx
	 irmo07v/A7jk9SgG/O5Ypo+0IJZ/67SvVKz5XJ+b0oWr/OQDcA7nMB/5BWYEPMDwDeile
	 eSkmdo85mF9PVzzXxlOoJZDJde1BTKUqd4zv2gxCmVQOdhfl6FEMNuYpLewE14P3d1CmV
	 JIzmtN/jEyyu6TjRQiZWJx85FWFFrvn6cUsRJ5nXjdh9DHBwW7gpBRFg3aeFSH+tCNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879230;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P+QEA++iXRaxC5LQOF3XNzROfRpDGeTIxDLuT+8IbNA=;
	b=vaVbqzJK+hRiH4e3fEU0FdhO/i6aTILddBPRiKE5z+ETJvqDetIKz8FwsR0xBMKo5Wir
	 50KdXPxBv0Ved9JsG0T08APLSxJVvpfjHL33XvGkESNiRIMKZlJsOWT9dSXGr6I76HO5y
	 DZXa91Nmao1gVqWi5dwmngu2yD+c5ycw1lBkbn2lPOpER2JZIuXxIPz4a7UbK0sx4+S51
	 zQvelzjzVn0WNyZGKvT459rerh/5+8BmwKcXJ8sxp2F3BhNaY+9BChdZ1IJKKWBD9+l9G
	 rq7dyeZQFr89YtIRc4kz3lKQp2AwK4EgIQ2qjCIP2h9VQ5WC76+o5xWwCdL34CLBBfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=mDJW1g6y;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52980606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52980606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=mDJW1g6y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=mDJW1g6yAMh3kLJ3lyCz4iTWyXygBlB0ozEqwHyt72u7MSOeCtLhoHPIiC6LQqHW8u9wu295wEXJN
	 LIkHIk2ow7oi/CX1rPP9ducxX5tf/SkD5wWnvbs8FS8PtlcH9hULyoln1Ei5xuD6SEoGzfndWyokLl
	 jSj17HxEgLSgwkQU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16afbaef4b8b-df46e;
	Tue, 17 Nov 2026 09:33:42 +0800 (CST)
X-RM-TRANSID:2ee16afbaef4b8b-df46e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [25.255.2.225] (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26afbaef4ac7-9df62;
	Tue, 17 Nov 2026 09:33:41 +0800 (CST)
X-RM-TRANSID:2ee26afbaef4ac7-9df62
From: Jiahao Xu <xujiahao@cmss.chinamobile.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kevin Tian <kevin.tian@intel.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com,
	Jiahao Xu <xujiahao@cmss.chinamobile.com>
Subject: [PATCH v2] iommufd: only hold references to files memfd_pin_folios() can pin
Date: Tue, 17 Nov 2026 09:32:44 +0800
Message-ID: <20261117093244.652569-1-xujiahao@cmss.chinamobile.com>
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

iopt_map_file_pages() stores a reference to the file passed to
IOMMU_IOAS_MAP_FILE in the iopt_pages of the new mapping:

	iopt_map_file_pages()
	  iopt_alloc_file_pages()
	    pages->file = get_file(file)

iopt_release_pages() drops that reference only when the iopt_pages is
destroyed, which for a file mapping happens while the iommufd file is
being torn down.  Nothing restricts which file can be passed, so
userspace can map the iommufd file itself, or a vfio device fd bound to
the same iommufd, both of which own an iommufd_ctx reference.  The
reference graph then contains a cycle and the file, the iopt_pages, the
IOAS and the iommufd_ctx are all leaked; kmemleak reports it as
"memory leak in path_openat" with the holder taken through
iopt_map_file_pages().

Reverse the test instead of trying to enumerate the files that own an
iommufd_ctx: accept only the files that memfd_pin_folios() is able to
pin, which is exactly the set of files the mapping can be built from.
memfd_pin_folios() already enforces

	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
		return -EINVAL;

and both predicates are inline helpers, so the same check can run here
before the reference is handed to iopt_pages.  dma-bufs are unaffected:
they are taken by the dma_buf_get() branch above and never reach the
file branch, and iopt_pages holds the dma_buf there, not a struct file.

Fixes: f4986a72d6e4 ("iommufd: Add IOMMU_IOAS_MAP_FILE")
Reported-by: syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7666ed2c3d42196bf7e3
Link: https://lore.kernel.org/all/20261112105945.285526-1-xujiahao@cmss.chinamobile.com/
Signed-off-by: Jiahao Xu <xujiahao@cmss.chinamobile.com>
---
v2:
 - Replace the iommufd_fops blocklist with the allowlist of files that
   memfd_pin_folios() can pin, as Jason asked for.  This covers a vfio
   device fd bound to the same iommufd, and any other fd that owns an
   iommufd_ctx, instead of only the iommufd file itself.
 - dma-buf mappings are untouched: they are taken by the dma_buf_get()
   branch and iopt_pages holds the dma_buf there, not a struct file.

 drivers/iommu/iommufd/io_pagetable.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
index 5ac736cf5..4d10b2253 100644
--- a/drivers/iommu/iommufd/io_pagetable.c
+++ b/drivers/iommu/iommufd/io_pagetable.c
@@ -15,7 +15,9 @@
 #include <linux/iommu.h>
 #include <linux/iommufd.h>
 #include <linux/lockdep.h>
+#include <linux/hugetlb.h>
 #include <linux/sched/mm.h>
+#include <linux/shmem_fs.h>
 #include <linux/slab.h>
 #include <uapi/linux/iommufd.h>
 
@@ -515,6 +517,18 @@ int iopt_map_file_pages(struct iommufd_ctx *ictx, struct io_pagetable *iopt,
 		if (!file)
 			return -EBADF;
 
+		/*
+		 * iopt_pages keeps a reference to the file until the mapping is
+		 * destroyed, so only accept the files memfd_pin_folios() is able
+		 * to pin.  Any other fd, in particular one that itself owns an
+		 * iommufd_ctx (iommufd, vfio, ...), would put the file into a
+		 * reference cycle with this iommufd and never be released.
+		 */
+		if (!shmem_file(file) && !is_file_hugepages(file)) {
+			fput(file);
+			return -EINVAL;
+		}
+
 		pages = iopt_alloc_file_pages(file, start_byte, start, length,
 					      iommu_prot & IOMMU_WRITE);
 		fput(file);
-- 
2.43.0


