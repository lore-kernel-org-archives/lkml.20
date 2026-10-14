Received: from mta0.migadu.com (out-99.mta0.migadu.com [91.218.175.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10340476CD6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962772; cv=none; b=BmOsjtJ9ny8t6wnRzoCvN6GyDde1PA/JGqtCrO7CBAIDHX9xYGcP62xspHGejtrmSwanls4kXByIvSScWYVSDMoj0xhg8HKpSIYqfoEd+SxZNkNP60mqyH2uzx7r9EFLkRYDIpXM/vcLHQVZz2dPPKOlzx8sXij3AnRjg/L5Q60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962772; c=relaxed/simple;
	bh=hHZJT6a9AHSI0FRADan7O9ikGQ54SPVMGHXSCUhyLoM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eHygHrjsTAaImS0TTQikq+kALNgotE71y1wfUv3G/q1MCLHTAsOlSyPvIgEBvJ6u1LEG/JG4fVPi/vkZ8FPu6brmoJP8WQ/18nJesJH68AglJBp7kagxJWizy6KXykac7ip9rqVK/YJsiYXCQTjjsyJjC5EY0Ij5yT+1SHrIyTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oB3DKXHk; arc=none smtp.client-ip=91.218.175.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oB3DKXHk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hHZJT6a9AHSI0FRADan7O9ikGQ54SPVMGHXSCUhyLoM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791962767; v=1; x=1792567567;
 b=oB3DKXHkMuhLvG9POYZFUaxnUIrPLTFBXzWFIn7i+qwncHnSESILKnwBf0eY2QHtv4VdAPQX
 eOPeR2YThCubdiBSSNnDWVm+XFybWno5cchASX0YmDALhwBuTF9KjMYwb+yOm1e24tmShft22NU
 anA3U4oay4hVeTOQykwNz/GI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5a2aabe76301d61e;
	Wed, 14 Oct 2026 07:26:07 +0000
X-Mizu-Trace-ID: 5a2aabe76301d61e
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH] ipc/shm: fix RSS accounting for hugetlb shared memory
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261014062705.1997201-1-tongweilin@linux.alibaba.com>
Date: Wed, 14 Oct 2026 15:25:49 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Dan Carpenter <error27@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0B5B2CA9-8FA9-4DEE-BF78-8E280F337362@linux.dev>
References: <20261014062705.1997201-1-tongweilin@linux.alibaba.com>
To: Weilin Tong <tongweilin@linux.alibaba.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 14, 2026, at 14:27, Weilin Tong <tongweilin@linux.alibaba.com> =
wrote:
>=20
> Commit a08c7193e4f1 ("mm/filemap: remove hugetlb special casing in
> filemap.c") changed mapping->nrpages to count base pages for hugetlb
> folios. However, shm_add_rss_swap() still multiplies it by
> pages_per_huge_page(), overcounting RSS in both SHM_INFO and
> /proc/sysvipc/shm.
>=20
> Use mapping->nrpages directly and remove the unused hstate variable.
>=20
> Fixes: a08c7193e4f1 ("mm/filemap: remove hugetlb special casing in =
filemap.c")
> Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
>=20
> ---
> ipc/shm.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/ipc/shm.c b/ipc/shm.c
> index 25190965c9a50..5ed2beef0f1d2 100644
> --- a/ipc/shm.c
> +++ b/ipc/shm.c
> @@ -943,8 +943,7 @@ static void shm_add_rss_swap(struct shmid_kernel =
*shp,
>=20
> 	if (is_file_hugepages(shp->shm_file)) {
> 		struct address_space *mapping =3D inode->i_mapping;
> - 		struct hstate *h =3D hstate_file(shp->shm_file);
> - 		*rss_add +=3D pages_per_huge_page(h) * mapping->nrpages;
> + 		*rss_add +=3D mapping->nrpages;

Hi Weilin,

Thanks for fixing this. Using mapping->nrpages directly for hugetlb
folios is correct.

Could you please simplify shm_add_rss_swap() further as shown below?

The info->lock taken here only serializes the read of info->swapped. It
does not protect mapping->nrpages, which is updated under the page-cache
XArray lock. Therefore, taking info->lock cannot provide a consistent
snapshot of nrpages and swapped.

These statistics are inherently best-effort, so READ_ONCE() should be
sufficient for both fields. This is also consistent with
shmem_swap_usage(), which reads info->swapped using READ_ONCE() without
taking info->lock.

With that, the nrpages accounting can be shared by all backing types,
and only the swapped accounting needs to remain conditional on
CONFIG_SHMEM and non-hugetlb files.

Please also mention the lockless snapshot change in the commit message.

Thanks,
Muchun

diff --git a/ipc/shm.c b/ipc/shm.c
index bb1a721a3e74..6862f681373f 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -936,26 +936,11 @@ static inline unsigned long =
copy_shminfo_to_user(void __user
*buf, struct shminf
static void shm_add_rss_swap(struct shmid_kernel *shp,
     unsigned long *rss_add, unsigned long *swp_add)
{
-     struct inode *inode;
+     struct inode *inode =3D file_inode(shp->shm_file);

-     inode =3D file_inode(shp->shm_file);
-
-     if (is_file_hugepages(shp->shm_file)) {
-             struct address_space *mapping =3D inode->i_mapping;
-             struct hstate *h =3D hstate_file(shp->shm_file);
-             *rss_add +=3D pages_per_huge_page(h) * mapping->nrpages;
-     } else {
-#ifdef CONFIG_SHMEM
-             struct shmem_inode_info *info =3D SHMEM_I(inode);
-
-             spin_lock_irq(&info->lock);
-             *rss_add +=3D inode->i_mapping->nrpages;
-             *swp_add +=3D info->swapped;
-             spin_unlock_irq(&info->lock);
-#else
-             *rss_add +=3D inode->i_mapping->nrpages;
-#endif
-     }
+     *rss_add +=3D READ_ONCE(inode->i_mapping->nrpages);
+     if (IS_ENABLED(CONFIG_SHMEM) && !is_file_hugepages(shp->shm_file))
+             *swp_add +=3D READ_ONCE(SHMEM_I(inode)->swapped);
}

> 	} else {
> #ifdef CONFIG_SHMEM
> 		struct shmem_inode_info *info =3D SHMEM_I(inode);
> --=20
> 2.43.5
>=20

