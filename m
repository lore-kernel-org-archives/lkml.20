Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C3321ABAA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787798882; cv=none; b=rhCJ+VycWQ033kx/ty8BYRNEewS7Wb+iaRhUTNRMMnPuWRIMelHH1E8sNgWrVLqPYbG69RTKr1q0AB+K2LO5fRf/ggUO0j/mDYNrOJV9ZYXYoroDpBEYAgDpdrrPGMP4GLV61s4K5dNB+fjbfGDOzQZNz9Ca8wRiGJzpp2ZFwlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787798882; c=relaxed/simple;
	bh=DzwrLwKzQ5ilRPc6LazQgD7diGWIHlJUAmw3hEc2nAQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HOTu7RC8FCBg8va0XmD1AiAQcMkW3AGhYp2ePpNrHWRx53qTYNQUQqvu+ymAz2S7tWYJdxDaHEO6CpAhTL8/6T+kc1/sX3ThjqYr+KaxEeYOB6jdlsahxRZw3yznSZsBw0gvBB9nPWU5eVfwjAkoSVgxxZDMzGoLgYBoc2vndnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=15yFLZOn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="15yFLZOn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4581F000E9;
	Thu, 27 Aug 2026 02:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787798880;
	bh=o6ZWZ4mnze1+TrAWnC1NwqdFLlt5leWgM68OC2nnBwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=15yFLZOn+kXLxVcliUfnTug4xm+hRx2/BH3WZyMFH2Al0IreNPyG4PdoKEWzJdKT/
	 g+5wT+tzanMat/qnV1LX/Y/JHiI7lukHDMZkP7ryzp9k6sSZMnw02ca/Sq8FQ0SgnS
	 KmNPPVhUs7kA0irKvJPFD/u0n/o+9re3picuLWag=
Date: Wed, 26 Aug 2026 19:47:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
 steven.sistare@oracle.com, vivek.kasireddy@intel.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] mm/hugetlb: fix resv_huge_pages double decrement in
 memfd error path
Message-Id: <20260826194759.88487180eebf728c1df08f14@linux-foundation.org>
In-Reply-To: <20260825021013.25672-1-hongfu.li@linux.dev>
References: <20260825021013.25672-1-hongfu.li@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 10:10:13 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:

> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> alloc_hugetlb_folio_reserve() decrements h->resv_huge_pages when
> dequeuing a folio, but unlike the use_global_reservation handling in
> hugetlb_alloc_folio(), it does not set HPageRestoreReserve on the folio.
> 
> Its sole caller memfd_alloc_folio() pre-allocates a reservation via
> hugetlb_reserve_pages() before allocating. When hugetlb_add_to_page_cache()
> fails, folio_put() drops the folio without HPageRestoreReserve set, so
> free_huge_folio() does not restore the reservation. The subsequent
> hugetlb_unreserve_pages() on the err_unresv path decrements the counter
> a second time, leaving resv_huge_pages off by one for every failed
> allocation.
> 
> Set HPageRestoreReserve when consuming the reservation in
> alloc_hugetlb_folio_reserve(). On the error path, free_huge_folio() then
> restores the reservation before hugetlb_unreserve_pages() releases it.
> The success path is unaffected, as hugetlb_add_to_page_cache() clears
> the flag once the folio is added to the page cache.
>
> ...
>
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2178,8 +2178,10 @@ struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
>  
>  	folio = dequeue_hugetlb_folio_nodemask(h, gfp_mask, preferred_nid,
>  					       nmask);
> -	if (folio)
> +	if (folio) {
> +		folio_set_hugetlb_restore_reserve(folio);
>  		h->resv_huge_pages--;
> +	}
>  
>  	spin_unlock_irq(&hugetlb_lock);
>  	return folio;

Thanks.  I pasted an AI-generated test case which might demonstrate
this bug.  Requires fault-injection so I won't add cc:stable.


Also, Sashiko might have found an accounting issue in the nearby code
(Sashiko doesn't like hugetlb.c):

	https://sashiko.dev/#/patchset/20260825021013.25672-1-hongfu.li@linux.dev




#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <linux/memfd.h>

/* Read resv_hugepages from sysfs */
static long get_resv_hugepages(void) {
    FILE *f = fopen("/sys/kernel/mm/hugepages/hugepages-2048kB/resv_hugepages", "r");
    if (!f) return -1;
    long val = -1;
    fscanf(f, "%ld", &val);
    fclose(f);
    return val;
}

int main(void) {
    long orig_resv = get_resv_hugepages();
    printf("[1] Initial resv_hugepages: %ld\n", orig_resv);

    /* Enable fail_function for hugetlb_add_to_page_cache via debugfs */
    system("echo hugetlb_add_to_page_cache > /sys/kernel/debug/fail_function/inject");
    system("echo 100 > /sys/kernel/debug/fail_function/probability");

    /* Create memfd and attempt write to allocate hugetlb folio */
    int fd = memfd_create("test_memfd", MFD_HUGETLB);
    if (fd >= 0) {
        /* Force allocation path which triggers memfd_alloc_folio() */
        ftruncate(fd, 2 * 1024 * 1024);
        write(fd, "a", 1); 
        close(fd);
    }

    /* Disable error injection */
    system("echo > /sys/kernel/debug/fail_function/inject");

    long post_resv = get_resv_hugepages();
    printf("[2] Post-failure resv_hugepages: %ld\n", post_resv);

    if (post_resv < orig_resv) {
        printf("[!] BUG DEMONSTRATED: resv_hugepages double-decremented by %ld!\n", 
               orig_resv - post_resv);
    }

    return 0;
}
