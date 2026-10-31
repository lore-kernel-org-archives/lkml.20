Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417085;
	b=qzx6ZAbqJrXMfRpObFyQ22E90Gizpfy86X5UrOODjYaiR0fEyRnknCkL1LAAo/bvgIxq
	 WGNLP76gvz9W6eCOvKDoZin1V0wTMfgrqI4gWeMg6FKlorfRxIyRo7Aa9OpuRBMaqtER4
	 ukUui9C9xMc2o5PcOvSNwaoj6tvBr782CUzb3JVu/lvDJGENvLxLqasiwMrcqYb0hyPVV
	 +sjxn5WhooRHH2LiUn1jBs9Z2mxqRGZC/KucTU1DSP2zbibws+oh/Qu9+l7xQW50I8Zn+
	 P1cBpNR3foZZWv0SkfBZjPCm8wpqOvuGhrKC8qSrECNghoFZIWQhgnm6z2C3ck1aZdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CNOdgi8pXw7fCfRQBi53Vsp5m4ux5kk2uvEIcUUPf94=;
	b=toq5rSayraaqY50zskZNGOQwO0Y71bwtGrFZf1MPGR9+0MFccm+HgNlQEaPK6oEbwY5d
	 ga9nnJeGFdAQC98V1PEwsvRWVwgFSSRRzM2vgzeq4hS4OUMmfZ8YOg+ZSTKShBx/cTjt+
	 btUxj40PGSwhNmxjI4A63YRNn2MfPE3NVfMPhOGTFU0MQF88trbtra9vRx98vO3rqSqgu
	 qKnDPgktZbiJqSJtNQMR6F92pUod0nQ1w8SZrxBxcPBwVi2kHeFM/F8LxPJdcfA+O4lyu
	 /wqAZbqsr7GZwurarGSUzadRh/JyUHWzxaU/y97Nvx5mmR2daEbz5AsWwhP84TRlSQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OhTKwGRn;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60632606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60632606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OhTKwGRn
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9f6a16afcso18555ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793417084; x=1794021884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNOdgi8pXw7fCfRQBi53Vsp5m4ux5kk2uvEIcUUPf94=;
        b=OhTKwGRnN6WNEe41hKsNMqhgEkrpapctLjWqEJbNYyUZOwE7Kt4fhDi7jlSTr7n9Di
         4CJJeqgzx/7PfhNXPa7gk+YnzAidq/FLnqsfLJb1ERYIQKluGoQKSIiaNpJ8AeqOLiDJ
         1vTuDhx6g7Ot1GmrEAALkL4ExmeVFUzt5KgGEG6SXCS9+zypEliYfWqxe4xFXn/KAvn+
         2Ey5wUnWymoVZjoxzfIUm7g6t+sCbtvSuCw1mawlTjY50UBlSgt0tOR9LRHdYuxke5Vd
         l2s2PIgvtAfvLSG66+DI8vNcmdzOqATwOPnI/70Q96xsOfTNPrCbZUo+rzBzp2Lk/qDx
         53ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417084; x=1794021884;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNOdgi8pXw7fCfRQBi53Vsp5m4ux5kk2uvEIcUUPf94=;
        b=SxYN6Z+Oz8793zh6TqX/rmeStbNCINbfrYU5ZFJEJbtQpSXWQrFQNYXbK0Y/jKKP4N
         6fQc3AsMcrw6wAbw39zVp4ftMTok3TLetnih3CrJWJz1npyt+bvIVoCZlbRERVBWxiCM
         3u6T7T8b9lYHg0f9R5WjWJbIPVqquIR/ZJvtY5OB9gisbnHJX4am+Gu5y6DSBspuWcVy
         l4G3/YZiw7PujhpCu20Ybv7c40B8d6fIDgtoRuJAEfKzbF2ArTUhy59iaGLTw/c2viYv
         yoL3gXwlHpJx3R5HaIDhRhhyg9v/HDnuGqojPDDJfMniCS05T5jr59BSwlOGiuFshBnY
         EaqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzACa8su5b3ZP8cu4ScHnwC/0mSQnMQ5sYzWPPTi2xlsPq037Q56eKlekcWArlg5kICL20ChXLPGQjJE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeFeJBycAJaQGVcfugFQ+bT3lMoM5us8JQofE/u9fazqqshGD1
	B/D4w0n5s0pF14TV3/cf/Wo2/Fwarl9n2xyeQ6Y9DoAhJj0AASz0XhW8zYDcBJ2sjw==
X-Gm-Gg: AYBFou0qpjpQi8+86Es25vFxLNG9Qthn5Ea6oTGg6lcUlM7mHtsfPNYkUroGkxAnLTJ
	wUdjf5Cyxkof/XuyhOQOWwF81TkWwPfO7oG939RoYOIt1jDRFdlAGx8zlCXiFhkWDQyBkBvvYIB
	kfEMPTa3LjiY2ceTKNuVUipTQyXE9YkJJ91AikWhojre+XFDUz4GGE4SZqSYu1d/e40YU5x5umS
	kdEtJsXYgbrZkIBvhrbDx9s0AmNNyvm+RyTDHGTObFU1nWQEYMZnaHr6/cXmjksNrAF740wPnxt
	Xu5QSSbVPlagbvP8FxIvPxG+V+fboY35C+7wkl+mhMs1ir5FkSlhZRN5vJEFRAk59BqSKcm5N7f
	xr+hnXrpaoI43EeaSyYTGXuN2/7rgMMzmsTELBLBhxZD5fjhd/xdYob+ZekO5jEVatq6XvhlI2U
	aiFE53QYbYKxuREiO6CTB5DQxU3PZmIEz5UvkJiiBlsOYO/QXsntuwldgH3MYsJSfKT1rOTuD60
	x+IvOzF3ruT5HTlhUwjw3f4wItqKM52CBCVY25Usrb62YnJxaFlb6R/UjEGZRhxc58GkZY+g9bW
	U99IMCgoqTk/YZPnzX7+XBYyi7pYiU+EGI9JJR9V8LKyA8cIJ3ktu+qAGHMoGbGr+j0I0LNhZip
	DLErO52eNr2n2aqbdj3bqeABb1AD6Z0+fu0zhWb81LRU=
X-Received: by 2002:a17:902:fc47:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2eb1ecbb24cmr15024995ad.15.1793417082975;
        Fri, 30 Oct 2026 20:24:42 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb2fesm10363129a91.4.2026.10.30.20.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:24:42 -0700 (PDT)
Date: Sat, 31 Oct 2026 03:24:38 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, David Woodhouse <dwmw2@infradead.org>, 
	YiFei Zhu <zhuyifei@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, 
	Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Ankit Soni <Ankit.Soni@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Subject: Re: [PATCH v6 15/18] iommufd: Persist iommu hardware pagetables for
 live update
Message-ID: <auVatSyjUkYAoFR4@google.com>
References: <20261025021930.674647-1-skhawaja@google.com>
 <20261025021930.674647-16-skhawaja@google.com>
 <98fe2806-d4a3-4bee-9324-d1862b2a2cb4@linux.intel.com>
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
In-Reply-To: <98fe2806-d4a3-4bee-9324-d1862b2a2cb4@linux.intel.com>

On Sat, Oct 31, 2026 at 10:46:56AM +0800, Baolu Lu wrote:
>On 10/25/2026 10:19 AM, Samiullah Khawaja wrote:
>>From: YiFei Zhu <zhuyifei@google.com>
>>
>>Register iommufd with the LUO framework and implement the preserve and
>>unpreserve ops to save marked HWPTs.
>>
>>To make sure mappings do not change during preserved state, add a
>>liveupdate_immutable flag to IOAS. When an HWPT is preserved, its IOAS
>>is marked immutable and any map/unmap attempts will fail with -EBUSY.
>>This is synchronized using the domains_rwsem to prevent races with
>>concurrent mapping operations.
>>
>>The preserve callback iterates over the marked HWPTs, verifies that the
>>backing memory pages are preserved, and calls iommu_preserve_domain() to
>>preserve the associated IOMMU domain.
>>
>>Signed-off-by: YiFei Zhu <zhuyifei@google.com>
>>Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>>---
>>  MAINTAINERS                             |   1 +
>>  drivers/iommu/iommufd/io_pagetable.c    |  24 ++
>>  drivers/iommu/iommufd/iommufd_private.h |  16 ++
>>  drivers/iommu/iommufd/liveupdate.c      | 327 ++++++++++++++++++++++++
>>  drivers/iommu/iommufd/main.c            |  10 +-
>>  include/linux/kho/abi/iommufd.h         |  56 ++++
>>  6 files changed, 433 insertions(+), 1 deletion(-)
>>  create mode 100644 include/linux/kho/abi/iommufd.h
>>
>
>[...]
>>diff --git a/drivers/iommu/iommufd/liveupdate.c b/drivers/iommu/iommufd/liveupdate.c
>>index 5fb491ff3a3d..828203d7254c 100644
>>--- a/drivers/iommu/iommufd/liveupdate.c
>>+++ b/drivers/iommu/iommufd/liveupdate.c
>>@@ -9,9 +9,28 @@
>>  #include <linux/file.h>
>>  #include <linux/iommufd.h>
>>+#include <linux/kexec_handover.h>
>>+#include <linux/kho/abi/iommufd.h>
>>  #include <linux/liveupdate.h>
>>+#include <linux/iommu-liveupdate.h>
>>+#include <linux/mm.h>
>>+#include <linux/pci.h>
>>  #include "iommufd_private.h"
>>+#include "io_pagetable.h"
>>+
>>+static u32 iopt_inc_num_preserved_domains(struct io_pagetable *iopt)
>>+{
>>+	guard(rwsem_write)(&iopt->domains_rwsem);
>>+	return ++iopt->num_preserved_domains;
>>+}
>>+
>>+static void iopt_dec_num_preserved_domains(struct io_pagetable *iopt)
>>+{
>>+	guard(rwsem_write)(&iopt->domains_rwsem);
>>+	if (!WARN_ON(!iopt->num_preserved_domains))
>>+		iopt->num_preserved_domains--;
>>+}
>>  int iommufd_hwpt_liveupdate_mark_preserve(struct iommufd_ucmd *ucmd)
>>  {
>>@@ -70,3 +89,311 @@ int iommufd_hwpt_liveupdate_mark_preserve(struct iommufd_ucmd *ucmd)
>>  	iommufd_put_object(ictx, &hwpt->common.obj);
>>  	return rc;
>>  }
>>+
>>+static int iopt_area_validate_file_pages(struct iopt_area *area)
>>+{
>>+	unsigned long last_index = iopt_area_last_index(area);
>>+	unsigned long index = iopt_area_index(area);
>>+	unsigned int page_offset = area->page_offset;
>>+	struct iopt_pages *pages = area->pages;
>>+	unsigned long iova = iopt_area_iova(area);
>>+
>>+	guard(mutex)(&pages->mutex);
>>+	if (WARN_ON(!area->storage_domain))
>>+		return -EINVAL;
>>+
>>+	while (index <= last_index) {
>>+		phys_addr_t phys = iommu_iova_to_phys(area->storage_domain,
>>+						      iova) - page_offset;
>
>iommu_iova_to_phys() returns 0 when there is no underlying DMA
>translation. It would be better to check for !phys and return -EINVAL
>before passing it to page_folio():

Agreed. I will also move the page_offset subtraction after the check.
>
>		if (!phys)
>			return -EINVAL;
>
>>+		struct folio *folio = page_folio(pfn_to_page(PHYS_PFN(phys)));
>>+
>>+		if (folio->mapping != pages->file->f_mapping)
>>+			return -EINVAL;
>>+
>>+		iova += PAGE_SIZE - page_offset;
>
>This walks a full page table per 4K page size, right? Isn't it slow for
>large mappings? Why not jump ahead by folio_size()?

Yes. When filling a domain, iommufd reuses pages that are already pinned
(by an access or another domain). If the memfd was punched in between,
an old page from a different folio can sit in the middle of a folio
range, and jumping by folio_size() would skip it. I will add a comment.
Also see batch_from_domain() implementation, it also does a similar page
walk.

In parallel, I sent a proposal for memfd to block or track hole punch,
so this walk can be skipped. It can be a follow up.
>
>>+		page_offset = 0;
>>+		index++;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static int iopt_validate_preserved_memory(struct io_pagetable *iopt,
>>+					  struct liveupdate_session *s)
>>+{
>>+	struct iopt_area *area;
>>+	int ret = 0;
>>+
>>+	down_read(&iopt->iova_rwsem);
>>+	for (area = iopt_area_iter_first(iopt, 0, ULONG_MAX); area;
>>+	     area = iopt_area_iter_next(area, 0, ULONG_MAX)) {
>>+		struct iopt_pages *pages = area->pages;
>>+
>>+		if (!pages)
>>+			continue;
>>+
>>+		/* Only allow file based mapping */
>>+		if (pages->type != IOPT_ADDRESS_FILE) {
>>+			ret = -EINVAL;
>>+			break;
>>+		}
>>+
>>+		/* Make sure that the file was preserved. */
>>+		ret = liveupdate_get_token_outgoing(s, pages->file, NULL);
>>+		if (ret)
>>+			break;
>>+
>>+		/*
>>+		 * Make sure the mapped pages are still associated with the
>>+		 * preserved memfd.
>>+		 */
>>+		ret = iopt_area_validate_file_pages(area);
>>+		if (ret)
>>+			break;
>>+	}
>>+	up_read(&iopt->iova_rwsem);
>>+
>>+	return ret;
>>+}
>>+
>>+static int iommufd_preserve_hwpt(struct iommufd_hwpt_paging *hwpt,
>>+				 struct iommufd_hwpt_ser *hwpt_ser,
>>+				 struct liveupdate_session *session)
>>+{
>>+	struct iommu_domain_ser *domain_ser;
>>+	int rc;
>>+
>>+	/*
>>+	 * Make IOAS immutable so the DMA mappings do not change while
>>+	 * the HWPT is preserved. Since one IOAS can have multiple
>>+	 * HWPTs, if an error occurs this call needs to make the IOAS
>>+	 * mutable again if it was the one that made it immutable.
>>+	 */
>>+	if (iopt_inc_num_preserved_domains(&hwpt->ioas->iopt) == 1) {
>>+		rc = iopt_validate_preserved_memory(&hwpt->ioas->iopt, session);
>>+		if (rc)
>>+			goto err;
>>+	}
>>+
>>+	hwpt_ser->size = sizeof(*hwpt_ser);
>>+	hwpt_ser->token = hwpt->liveupdate_token;
>>+
>>+	rc = iommu_preserve_domain(hwpt->common.domain, &domain_ser);
>>+	if (rc < 0)
>>+		goto err;
>>+
>>+	hwpt_ser->domain_ser_phys = virt_to_phys(domain_ser);
>>+	return 0;
>>+
>>+err:
>>+	iopt_dec_num_preserved_domains(&hwpt->ioas->iopt);
>>+	return rc;
>>+}
>>+
>>+static void _iommufd_unpreserve(struct iommufd_ctx *ictx,
>>+				struct iommufd_ser *ser)
>>+{
>>+	struct iommufd_hwpt_paging *hwpt;
>>+	struct iommufd_object *obj;
>>+	unsigned long index;
>>+
>>+	xa_lock(&ictx->objects);
>>+	xa_for_each_marked(&ictx->objects, index, obj, IOMMUFD_OBJ_LIVEUPDATE_MARK) {
>>+		if (obj->type != IOMMUFD_OBJ_HWPT_PAGING)
>>+			continue;
>>+
>>+		hwpt = to_hwpt_paging(container_of(obj, struct iommufd_hw_pagetable, obj));
>>+		if (!hwpt->liveupdate_preserved)
>>+			continue;
>>+
>>+		xa_unlock(&ictx->objects);
>>+
>>+		iommu_unpreserve_domain(hwpt->common.domain);
>>+		iopt_dec_num_preserved_domains(&hwpt->ioas->iopt);
>>+
>>+		hwpt->liveupdate_preserved = false;
>>+		iommufd_put_object(ictx, obj);
>>+
>>+		xa_lock(&ictx->objects);
>>+	}
>>+	xa_unlock(&ictx->objects);
>>+
>>+	kho_unpreserve_free(ser);
>>+}
>>+
>>+static int iommufd_liveupdate_preserve(struct liveupdate_file_op_args *args)
>>+{
>>+	struct iommufd_ctx *ictx;
>>+	struct iommufd_hwpt_paging *hwpt;
>>+	struct iommufd_ser *iommufd_ser;
>>+	struct iommufd_object *obj;
>>+	unsigned int num_hwpts;
>>+	unsigned long index;
>>+	unsigned int i;
>>+	void *mem;
>>+	int rc;
>>+
>>+	ictx = iommufd_ctx_from_file(args->file);
>>+	if (IS_ERR(ictx))
>>+		return PTR_ERR(ictx);
>>+
>>+	mutex_lock(&ictx->liveupdate_mutex);
>>+
>>+	/* Count the number of HWPTs to preserve */
>>+	num_hwpts = 0;
>>+	xa_lock(&ictx->objects);
>>+	xa_for_each_marked(&ictx->objects, index, obj, IOMMUFD_OBJ_LIVEUPDATE_MARK) {
>>+		if (obj->type != IOMMUFD_OBJ_HWPT_PAGING)
>>+			continue;
>>+
>>+		hwpt = to_hwpt_paging(container_of(obj, struct iommufd_hw_pagetable, obj));
>>+		if (!hwpt->common.domain) {
>>+			rc = -EINVAL;
>>+			xa_unlock(&ictx->objects);
>>+			goto out_unlock;
>>+		}
>>+		num_hwpts++;
>>+	}
>>+	xa_unlock(&ictx->objects);
>>+
>>+	mem = kho_alloc_preserve(struct_size(iommufd_ser,
>>+					     hwpt_array, num_hwpts));
>>+	if (IS_ERR(mem)) {
>>+		rc = PTR_ERR(mem);
>>+		goto out_unlock;
>>+	}
>>+
>>+	iommufd_ser = mem;
>>+	iommufd_ser->size = sizeof(*iommufd_ser);
>>+
>>+	/* Preserve HWPTs */
>>+	i = 0;
>>+	xa_lock(&ictx->objects);
>>+	xa_for_each_marked(&ictx->objects, index, obj, IOMMUFD_OBJ_LIVEUPDATE_MARK) {
>>+		if (obj->type != IOMMUFD_OBJ_HWPT_PAGING)
>>+			continue;
>>+
>>+		if (!iommufd_lock_obj(obj)) {
>>+			rc = -ENOENT;
>>+			xa_unlock(&ictx->objects);
>>+			goto out_unpreserve;
>>+		}
>>+
>>+		/*
>>+		 * HWPT is locked so it will not be destroyed. The xarray lock
>>+		 * can be released here before preserving the HWPT.
>>+		 */
>>+		xa_unlock(&ictx->objects);
>>+		hwpt = to_hwpt_paging(container_of(obj, struct iommufd_hw_pagetable, obj));
>>+		rc = iommufd_preserve_hwpt(hwpt, &iommufd_ser->hwpt_array[i++], args->session);
>>+		if (rc) {
>>+			iommufd_put_object(ictx, obj);
>>+			goto out_unpreserve;
>>+		}
>>+
>>+		/*
>>+		 * Mark the HWPT as successfully preserved. This is distinct
>>+		 * from IOMMUFD_OBJ_LIVEUPDATE_MARK, which only indicates the
>>+		 * userspace intent to preserve.
>>+		 */
>>+		hwpt->liveupdate_preserved = true;
>
>Can userspace re-mark an already-preserved HWPT with a new token? It
>seems that mark_preserve() doesn't check hwpt->liveupdate_preserved.
>Would it help to simply return -EBUSY from mark_preserve() once
>hwpt->liveupdate_preserved is set?

Yes, I will handle this case.
>
>>+		xa_lock(&ictx->objects);
>>+	}
>>+	xa_unlock(&ictx->objects);
>>+
>>+	/* Store the actual number of HWPTs that are preserved */
>>+	iommufd_ser->num_hwpts = i;
>>+
>>+	args->serialized_data = virt_to_phys(iommufd_ser);
>>+	mutex_unlock(&ictx->liveupdate_mutex);
>>+	iommufd_ctx_put(ictx);
>>+	return 0;
>>+
>>+out_unpreserve:
>>+	_iommufd_unpreserve(ictx, iommufd_ser);
>>+out_unlock:
>>+	mutex_unlock(&ictx->liveupdate_mutex);
>>+	iommufd_ctx_put(ictx);
>>+	return rc;
>>+}
>>+
>>+static void iommufd_liveupdate_unpreserve(struct liveupdate_file_op_args *args)
>>+{
>>+	struct iommufd_ctx *ictx;
>>+
>>+	ictx = iommufd_ctx_from_file(args->file);
>>+	if (WARN_ON(IS_ERR(ictx)))
>>+		return;
>>+
>>+	mutex_lock(&ictx->liveupdate_mutex);
>>+	_iommufd_unpreserve(ictx, phys_to_virt(args->serialized_data));
>>+	mutex_unlock(&ictx->liveupdate_mutex);
>>+
>>+	iommufd_ctx_put(ictx);
>>+}
>[...]
>
>Thanks,
>baolu

Thanks,
Sami
