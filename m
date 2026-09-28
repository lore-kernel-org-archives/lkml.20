Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCED258EDA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573050; cv=pass; b=Yu5cpzdTvlmHetTUnUi4Vsgz7ZuT0IF64Uj8xroHBHBgg1djuiAO0vWogZHQUe6ysm/cagCH4h0Aj2rOeNkIqdrt83PpTv4oBGRvmy6A6kJS31XXfBzuHMpneHiiBRyfx0PaUGCXBVc0uFCdyOH0PaY9X6wiLebFJ1LWTMaYNOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573050; c=relaxed/simple;
	bh=W7axueZRrhaT48qqYWzpPitRQKOTeoZ+sTUZeBMTWsw=;
	h=From:In-Reply-To:MIME-Version:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=XAUM7YatXJQgoOIKkfwlnuQM+Dk1dTB3eIla+e6US8LSkPd4GtBYbZQuY9j3OZDLdOroB1L9616S+mzThE6FxoeTH7M+0E+afsb3DMS2ijm6iZRZ7Ph2kM/0W277fDK/LgzurYai1uNG/lHJxmG/sQljSnx9dYeWD1R/DkLGxdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KkHCFwIu; arc=pass smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KkHCFwIu"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-914351b2f5aso26673576d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790573047; cv=none;
        d=google.com; s=arc-20260327;
        b=URwGGwAl4JGipVbTEfpKC0ss4jP5064aql83opbNIwCs4moI2ytSZ0/fjsXjR17EXb
         ViA4CfhM22uS/RYEcW/g6R9zKamneQSAPI0Q7pKL8POC0w1zhfHpRe7zNWLTH2MniVRE
         kCay1v9Ntm9/NE0A8+8gY1hZEU/eoqIw2V1rwn0L92SND+/M+6/5xn6NYYuIudiUHc1C
         zNi7R7Lib3S5SCheMhEGQBejrYwDz+5y/7slcm+VaCdetaHGzultQIqa/zvYIZDxJvzU
         XeDnPsKhVnt8cku75zP63TJdWwK5tHxiEAlfBh3pLVjwzGpWPfQWKayx2v+9fe0qGX75
         PEwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:from
         :dkim-signature;
        bh=FSUAgom6ClfwbocQ8Hvkd64BKo/2JRKTu5CIvXmRMWI=;
        fh=kikfhgLv8FAXihF7RXCv0FXx99CexWrxuL4sYgvxcM4=;
        b=szPUaaI8AzG0uV27aAcSSNfQV0e8HM2mmNllnnurHq+iugEFS7eQxBl9jrXvEJ5Xhg
         7o/Nn2EurWuJnuCyE0Jkjmsdir//YmQkm84F8CZVHD9Cn87cGXliBhEMLITcoOgjPGka
         Y7cEDpjzInXJbeEPNJaS+2lMMKlvrSkS2Chxo4Hbkf15xdscgBNwK+mt6H4AQMf53ye3
         4j4PnfeMd/CMOalxy/1K0Ka+2yDRWyAxl8lJPcGdhWAuYfBIk+0umEPQR8d3YxmdEQ99
         DvV6bNVas6nVaaHks/aYhbPQHSjy2saXc14DBmKrxCEaHKQ3Cs9PaulZvQPY4LtspQTc
         M5pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790573047; x=1791177847; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSUAgom6ClfwbocQ8Hvkd64BKo/2JRKTu5CIvXmRMWI=;
        b=KkHCFwIugNG8Q/JXcV5rC+Jayxc1F5nqNCVENfc42oUuxoVKyivIJXA6j42je251uh
         ImequQITNqdm6SgiwOPZKWOMM3Kst4Tzb7xwMHRsw4ts6oXLHJZuQk+YNKnxh1MT2hA4
         pbxzR+PZ8mZOLb6+vjdTxrveKNRQYCrwcZaMLjtrTxTgu6Jkt/HJcx//s+wboWU2V7kn
         A8Sa3OPudEZvww0sfZkCqa/KFzKvZzfCx0qyhtyo4+CVi2WSQQzzqe2sHhE0NTsSMcv3
         e9QMKMv5ZBk6GQLTjuU+Kkhz94KOFM3v7z8zStkTi2uZfF2WO2rH4cikyfAA+1M6lUfb
         68CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790573047; x=1791177847;
        h=content-type:cc:to:subject:message-id:date:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FSUAgom6ClfwbocQ8Hvkd64BKo/2JRKTu5CIvXmRMWI=;
        b=uu5NkN/9vpwGH8iPv4OL0OlT4oURPRAZN000y5ntgKOVcVZUVGSoQA7P7fJankzvas
         xSF/icRvuKCp8dWOIS2a/S7UZC9oKe01OmuZVTk7N0gV4oluGc4C6KrTUU736NBozzFC
         MMKu8jJAixBSdNNBtxrn7H9uIvUZZ3HRKFQCc3IgzNo0NfDXP7mN9ppzC23bQ6m9ZDWR
         +pW2pRETjqMv3KWGiiL9mVkjohhhRJBYybIuOqeC1abYbc7z2wRp5nRfe80FpTxGSitb
         KbP1x1ULip+J9WcCUg/XoIcURpLhwxI0qe0Q0g8O1vG2mR+YAc9mnhWWbuhGqeD5B3uf
         STTg==
X-Forwarded-Encrypted: i=1; AKwUvBy0bqKjhL7rKfAOL+lrQ27wTOrkyyqjswAsoDZ3rZkPtEM5DmTQMgWI9CGqhH9/BiiY+k0YsnBFw1kVHAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo8HHyaOMlSI5ClVoqF7W8NxL4F88UFAsu5PqSgpBlQPiMyk5+
	IKK/eJSa9brYM6kLIS4HLiTFS6XwTLghCMtgXUAUpPXGfmuL+YMwM6voUZLP8gnjywlJn2QzDUa
	+F3pQij0zmkihA+CZNeQLzNN7m5KVKkvkMIK5mMxb
X-Gm-Gg: AYBFou1HR6pWvRETN0uca1YTfVImwPX5XmKHOcdypnKZdCMMiY9hsQ+eRO7Ikcrs9y/
	xyzIhLe7MKpUR8AXzAuY1fJotLVcPXvcL55+MnPvZRVHQV/7YZteoWekQM8ueXnskvLDVtj4ITV
	kjNy+IQt7KtpqBK/dZvACwxjivCs0I98xnc7dmeeUs9L8AK9zUjJ5PQCXBQBOCDWMJnr95ZDUEY
	BIceaMASrltX03C7QZy0MhSAU+MUCcnBwQ5yAsDTN9UL1yCRWeaYKdZW3V85LV6sZFfvtgl2KVW
	e+6O77ORDywJecobRg2sxuIgmFrmTgRGPs3AvxtTeycorgHMmtW/QVKyFVmUejjP1osbeb5K2yu
	w8Gobr5fFzg==
X-Received: by 2002:a05:6214:5345:b0:910:3453:505d with SMTP id
 6a1803df08f44-9142f8f69a4mr164488216d6.31.1790573046662; Sun, 27 Sep 2026
 22:24:06 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 27 Sep 2026 22:24:05 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 27 Sep 2026 22:24:05 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260907132055.26696-1-zhoujinmeng@bytedance.com> (message from
 Jinmeng Zhou on Mon,  7 Sep 2026 21:20:55 +0800)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 27 Sep 2026 22:24:05 -0700
X-Gm-Features: AclHuK8WOXn4uKOxOQYa2ZuB88hz03DSLUKDlBeo924q-8b9bdy1WbZFMN4BZbY
Message-ID: <CAEvNRgEvbCB_y23odHurRnhA7Fxo5oWYwrFyMy9+r6fFSCRw1Q@mail.gmail.com>
Subject: Re: [PATCH] mm/hugetlb: fix subpool minimum reservation rollback
To: Jinmeng Zhou <jinmengzhou22@gmail.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org, 
	akpm@linux-foundation.org, mawupeng1@huawei.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, zhoujinmeng@bytedance.com, 
	stable@vger.kernel.org, Karl Mehltretter <kmehltretter@gmail.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Jinmeng Zhou <jinmengzhou22@gmail.com> writes:

> When a reservation request is partially covered by a subpool minimum and
> the remaining global reservation fails, the error path first calls
> hugepage_subpool_put_pages() for the subpool-backed portion. It removes the
> failed global portion from used_hpages only afterwards.
>
> hugepage_subpool_put_pages() uses used_hpages to decide whether rsv_hpages
> should be restored. Since used_hpages still includes the global portion, it
> can remain at or above min_hpages and prevent that restoration. It then
> reports the subpool reservation as releasable, causing
> hugetlb_acct_memory() to incorrectly decrement h->resv_huge_pages.
>
> This was reproduced with four 2 MB huge pages and a hugetlbfs mount with
> size=10M,min_size=8M. After a successful three-page reservation, a two-page
> reservation which needed one subpool page and one global page failed with
> -ENOMEM. HugePages_Rsvd incorrectly dropped from four to three even though
> the subpool minimum was still four pages.
>
> Roll back the failed global portion from used_hpages first, so that
> hugepage_subpool_put_pages() evaluates the minimum reservation against the
> current usage and returns the correct global adjustment.
>
> Fixes: a833a693a490 ("mm: hugetlb: fix incorrect fallback for subpool")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jinmeng Zhou <zhoujinmeng@bytedance.com>
> ---
>  mm/hugetlb.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 785772845795..3e3cda181e72 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6808,15 +6808,6 @@ long hugetlb_reserve_pages(struct inode *inode,
>
>  out_put_pages:
>  	spool_resv = chg - gbl_reserve;
> -	if (spool_resv) {
> -		/* put sub pool's reservation back, chg - gbl_reserve */
> -		gbl_resv = hugepage_subpool_put_pages(spool, spool_resv);
> -		/*
> -		 * subpool's reserved pages can not be put back due to race,
> -		 * return to hstate.
> -		 */
> -		hugetlb_acct_memory(h, -gbl_resv);
> -	}
>  	/* Restore used_hpages for pages that failed global reservation */
>  	if (gbl_reserve && spool) {
>  		unsigned long flags;
> @@ -6826,6 +6817,15 @@ long hugetlb_reserve_pages(struct inode *inode,
>  			spool->used_hpages -= gbl_reserve;
>  		unlock_or_release_subpool(spool, flags);
>  	}
> +	if (spool_resv) {
> +		/* put sub pool's reservation back, chg - gbl_reserve */
> +		gbl_resv = hugepage_subpool_put_pages(spool, spool_resv);
> +		/*
> +		 * subpool's reserved pages can not be put back due to race,
> +		 * return to hstate.
> +		 */
> +		hugetlb_acct_memory(h, -gbl_resv);
> +	}
>  out_uncharge_cgroup:
>  	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
>  					    chg * pages_per_huge_page(h), h_cg);

This fixes out_put_pages in hugetlb_reserve_pages() on a mount that
specifies both min_size and max_size, and does not introduce any further
bugs AFAICT.

Tested-by: Ackerley Tng <ackerleytng@google.com>

Further details at [1].

[1] https://lore.kernel.org/all/CAEvNRgHQLifmcD1NO6cd7EVcCiQb6gJgNUo4HkFhZAvzuwMq0w@mail.gmail.com/
