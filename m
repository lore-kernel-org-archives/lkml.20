Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880716;
	b=EG2qefQifVDs/tmI9oJrMrhrVGVD/4aoLEmTyhYi/dCaKXP6b7EG1yrY8IYE7tLfy2bb
	 Hn8hGxs7ossvX74gSv6eA14JSVRDZlQMYeRjVMi//a00FSRid06erccNWlt0xVK1jcqaR
	 yK5dtaF0cZRamAevbCabQfCMJ00jgfI1LEKCZe66FdrgUl4iqXpS+COBSXYescKUhXrh+
	 4QFUkzs9NFaSGzrD1pH7Np4KA2HFBpyy7Z7Wr7nh8s/Cc9rjkYAM3vkJAkpS3j0KjJZR8
	 5hyP965P3rncCTcLGu3tj7cVIN0C2/qZqyQAXHTAGNZmW3GmgPETbooWixMC5I1/Rkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0lQuCGK3lhHseavPhy99usX6S5axUhc+gR6oEzHkYlA=;
	b=T9KvqMWdPRpChgMxglH6v00dPjbkvoNl8d1Go7YfwbXpDj4DeG6QwLnbOIRIwAhVkh2M
	 BatjOkLyi41dw02nHtWSowr8mkfSRJOU4IgKRo9ghh7Shsbggk2/jHbfoxVPGb52F1Sdb
	 4ZJ4rY/baaE5dMyw9W2i/mgs66XyBls2euEXQGwSK/Npd7ceNHqGDV8SPu333hgpcRlZ2
	 uvTlLof6md9VuzzPriAGqIQqP70J6El5lrD9V984Ce6iuOAlwoqlbg9rbYyEBcrzaRURf
	 9abWtjgJ4u26z/q/h+ntWiaH7tG6R+KLv+0Es5B+/De7fT51e8EQA1QhNS5DhrwwOkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oNNou98V;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5285C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5285C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oNNou98V
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed3f563739so31675ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794880715; x=1795485515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0lQuCGK3lhHseavPhy99usX6S5axUhc+gR6oEzHkYlA=;
        b=oNNou98Vpzfdr5N0/5VwmYXr2sTd8Uyxs/s7OYrm+32YN5a0u+ubIKotjM8WmTBRwf
         rTOfEk+53Rp3rmMOQyfVjo3AlBJ2uBCEIElA9YmTLP9dEizyyXf1XW22xdi/RTDxFWtl
         dcJMv+UyZSnST1M3HPjfJDm2SMSbiJOkzW73v7i6rKsqjndE7gHNatH94jvYCTedL1Dw
         JB+U8C4p27E4Cpn41bzauYgBQLE8EIveS9s4ST6tOHUXSytJ2qxAEnkBtx7HSP1UMWhP
         6aVarvzTBndcAKM5OBJzY5ODPmziO0RGee1tJETOHxxJhWJ+RvvWWyArS07m1eAel7rK
         v8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794880715; x=1795485515;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lQuCGK3lhHseavPhy99usX6S5axUhc+gR6oEzHkYlA=;
        b=U5SWiVmqsp4EuKifY9mS8Ycua4M+WUTRg/5ZL6Cn38Nko6ATXcSCeKGzo9Ixp3i49F
         JzRSBbCSKjF9MZvpn/Gl6DD0i2Eso1/xy0w9G7J8T+yYpVR4F+8v8wY43Pyx7UGH9il4
         efgpjspJAOdTNS0T0j92n6A4frkkZGhN9JAu+9ERLju9aqZkL8RCmf0zy+esPmNxMWJe
         Jj7XQuCDja6CcCmFB1OGBiJ4o0V+LOvK7QsNfJUwq6NnGvupHCLH42X8+rHuoGKk6Hi9
         dXEX5CMw3Eg0sO/rmEg3uhWY8jMd6KqkraScvTTtPOBOXgL3/1s9TBh7HSJ/Cqp20yf2
         4LyQ==
X-Forwarded-Encrypted: i=1; AL+hErEjKkOgzP3nD47JeMy+3SX2s95DtHv6dq0GisKesit9aSvIkaYyrsYQsvkdmw2W2kYH6pL4vnN1KKlAy9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iazwIXEe2xtZDrJZBeWaZ8+94MXpjn2T408yTeimh3cq4gnGg
	YW4JO1Y/OibH4NVJnEjT44djdcoaLUd/9BOYfBSIC+yh8+RWVMOIRcx5PLYV6kUllg==
X-Gm-Gg: AZFdTZc+hTVnmZ2eim8icMRfL8v1Tnk1XWGiBqt5lYk6jGu36mAtycwOkQSPN24y9hZ
	UQOdnsw1Yp2H6zq5GEu7rsv7mwecXCGVEGeTo2xzAKJsrFaTjU3bDsaGAi0IV/k6Wz8qfjOgDPs
	EYvxBQsd45H9oMHmJnwDQR6imubMmnTQlYTnQepBOlkck5mkRYhQLEsjMKUDtPJm6aF0sG/oLyI
	vwf8lmejfHP7U0l1V/pVw0BtlS2lvhlAAUUnbq3NcnoV5UYo6LeNReWU5ml3xDg3kQR8FeVeCRb
	08dDIRz/zU5iLtLTAIps/lywR31WfcCFHz1HXoxFhZVG+JrHkgvaLAU5QqXdFLDQsIwk5qnsYGy
	9q35THFOQT+gZ7Jurf6YO8PFZlNhhk/OaXqkr4XZ/Mv174hLKEcxX/61Aup0AymQJMseM3FEW3M
	w/r9/61ACKQiBlkTkm/fuyHTq9J49CqiFcQ9NelWR7PckaOGL0tcfIl+MV32iwggrl8EtUI+a3Z
	OaUu9nx4mzK0F+rWJuN8m3PQ7yeV+lqWFshfQg3wDWQCKyOroGiuV6pE17moLCtSTePOOmKaPVy
	UyIj4n48JXDKJVdgMBk8h+3rtlohmo2iPhhK7HpQSWDocAefv8OwGWNm9K8+6BRmYZiFp042N+l
	+FeICkORbKv/ILWrkEliHjBJCYnhnwnW/RRZe4AZ1X/4=
X-Received: by 2002:a17:903:2310:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2efdc8414aamr1929805ad.15.1794880714150;
        Mon, 16 Nov 2026 17:58:34 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3b3f7ae72sm493783a91.10.2026.11.16.17.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 17:58:33 -0800 (PST)
Date: Tue, 17 Nov 2026 01:58:30 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jiahao Xu <xujiahao@cmss.chinamobile.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] iommufd: only hold references to files
 memfd_pin_folios() can pin
Message-ID: <avu0mxBDmm_nvszH@google.com>
References: <20261117093244.652569-1-xujiahao@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261117093244.652569-1-xujiahao@cmss.chinamobile.com>

On Tue, Nov 17, 2026 at 09:32:44AM +0800, Jiahao Xu wrote:
>iopt_map_file_pages() stores a reference to the file passed to
>IOMMU_IOAS_MAP_FILE in the iopt_pages of the new mapping:
>
>	iopt_map_file_pages()
>	  iopt_alloc_file_pages()
>	    pages->file = get_file(file)
>
>iopt_release_pages() drops that reference only when the iopt_pages is
>destroyed, which for a file mapping happens while the iommufd file is
>being torn down.  Nothing restricts which file can be passed, so
>userspace can map the iommufd file itself, or a vfio device fd bound to
>the same iommufd, both of which own an iommufd_ctx reference.  The
>reference graph then contains a cycle and the file, the iopt_pages, the
>IOAS and the iommufd_ctx are all leaked; kmemleak reports it as
>"memory leak in path_openat" with the holder taken through
>iopt_map_file_pages().
>
>Reverse the test instead of trying to enumerate the files that own an
>iommufd_ctx: accept only the files that memfd_pin_folios() is able to
>pin, which is exactly the set of files the mapping can be built from.
>memfd_pin_folios() already enforces
>
>	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
>		return -EINVAL;
>
>and both predicates are inline helpers, so the same check can run here
>before the reference is handed to iopt_pages.  dma-bufs are unaffected:
>they are taken by the dma_buf_get() branch above and never reach the
>file branch, and iopt_pages holds the dma_buf there, not a struct file.
>
>Fixes: f4986a72d6e4 ("iommufd: Add IOMMU_IOAS_MAP_FILE")
>Reported-by: syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com
>Closes: https://syzkaller.appspot.com/bug?extid=7666ed2c3d42196bf7e3
>Link: https://lore.kernel.org/all/20261112105945.285526-1-xujiahao@cmss.chinamobile.com/
>Signed-off-by: Jiahao Xu <xujiahao@cmss.chinamobile.com>
>---
>v2:
> - Replace the iommufd_fops blocklist with the allowlist of files that
>   memfd_pin_folios() can pin, as Jason asked for.  This covers a vfio
>   device fd bound to the same iommufd, and any other fd that owns an
>   iommufd_ctx, instead of only the iommufd file itself.
> - dma-buf mappings are untouched: they are taken by the dma_buf_get()
>   branch and iopt_pages holds the dma_buf there, not a struct file.
>
> drivers/iommu/iommufd/io_pagetable.c | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)
>
>diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
>index 5ac736cf5..4d10b2253 100644
>--- a/drivers/iommu/iommufd/io_pagetable.c
>+++ b/drivers/iommu/iommufd/io_pagetable.c
>@@ -15,7 +15,9 @@
> #include <linux/iommu.h>
> #include <linux/iommufd.h>
> #include <linux/lockdep.h>
>+#include <linux/hugetlb.h>
> #include <linux/sched/mm.h>
>+#include <linux/shmem_fs.h>
> #include <linux/slab.h>
> #include <uapi/linux/iommufd.h>
>
>@@ -515,6 +517,18 @@ int iopt_map_file_pages(struct iommufd_ctx *ictx, struct io_pagetable *iopt,
> 		if (!file)
> 			return -EBADF;
>
>+		/*
>+		 * iopt_pages keeps a reference to the file until the mapping is
>+		 * destroyed, so only accept the files memfd_pin_folios() is able
>+		 * to pin.  Any other fd, in particular one that itself owns an
>+		 * iommufd_ctx (iommufd, vfio, ...), would put the file into a
>+		 * reference cycle with this iommufd and never be released.
>+		 */
>+		if (!shmem_file(file) && !is_file_hugepages(file)) {
>+			fput(file);
>+			return -EINVAL;
>+		}
>+
> 		pages = iopt_alloc_file_pages(file, start_byte, start, length,
> 					      iommu_prot & IOMMU_WRITE);
> 		fput(file);
>-- 
>2.43.0
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>

Thanks,
Sami
