Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618070;
	b=R1mHop/D6cEdI0h8RETmafXciD7Aa719FZk/wcaQRNegJ3CV05/xpDWkgBwe3Pbwvc/u
	 yM6YZGx1DCiMWAlS/zd/dz07f5WQm2aDo8u9OwF2B0DpfATEdZkSB/hS371SBNHARd//I
	 FGUT+TZYffzjz1+gwEFWRMDr3BWAd/u9CSlDHJGppCIUCNHBwejX/X5JftsLIMlfsUcYT
	 /Aa3rNEC1nUfx4YRfhK/cDR+dgsq7AbXV5t2R5WE8oroNj3QjS+BXtpEdVSKj95FX3OWa
	 FGv3ooOMMSHJOdOpnZLWFnpiHuDlHj0bHB0uu4HWZ0v+nqfYJL/oUdM7WPaDpm6ig3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618070;
	h=DMARC-Filter:DKIM-Signature:User-Agent:Cc:From:Mime-Version:
	 Content-Type:To:Date:In-Reply-To:Content-Transfer-Encoding:
	 X-Lms-Return-Path:Subject:X-Original-From:References:Message-Id;
	bh=2HjTWIQal4WNqfbdSCQgFb6hxzEStlTsUt7GL9dNGCA=;
	b=UAngZikTElcHLdVNBA48c2KR6XG3zi0VzOY8mUh1a3Me5dlZtweBaxyN84O9i6nzNXV0
	 jTAplRYH67YwJHSBSZE6yMrdKdxAS5z0DSJ1kYf5p79BygDJPhsYBDaPE2Y8+HFof3Oow
	 91LmNE16QOSIu0mhhetHcHonLnsylGvjoK32vFrbHCvGTGMsSOUQpb7s46co+yRR0igU0
	 xOGJsDEsEUsjvlKVCZK/xSJPAoIMtd+cb+P5ubQ42sCPQSYnpz4xLRGfGk1hiz6sIgoZx
	 myD2cB62JbzAEl+19tbqkq74sWImSppfRKB1muJ+Pk/7EnGBa1nxSS7AMyt+vdzExlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=BJyklodr;
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FF5606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1FF5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=BJyklodr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793618064; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=2HjTWIQal4WNqfbdSCQgFb6hxzEStlTsUt7GL9dNGCA=;
 b=BJyklodri7dpOBv0cp8g2K8bmK4MmzM+MB3zUjL2lXxlX4UBjFrBc6rCvVMjn1ibx2sa8e
 +yXWnx1kEYxF+1ITc8WlHrZRDRpo0MlYceK96REM4/bF2rM33wJ04d1i+HcloCWijJ8hnT
 nlhNK4JDVXx4U4HzPV1LRCNK0ZcgbbnZ6bbUTT7wpBaDjjt/vwYK3uvMiTYyAYlKjkRubV
 cpwdCD/PmqCDwm39oXAm21dYE/ZudjeqhIeKmRd8+q9vFygUsjSXEHy3T5ppBsM0WLG2US
 /g3XWlmzcxHUxExs00NByWe4PwudmCn1GBGbAhHZaR7SUXebEvk+HFCvAyq3zQ==
User-Agent: Mozilla Thunderbird
Cc: <aarcange@redhat.com>, <akpm@linux-foundation.org>, 
	<chengming.zhou@linux.dev>, <david@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <riel@redhat.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: <xu.xin@linux.dev>
Date: Mon, 2 Nov 2026 19:14:04 +0800
In-Reply-To: <20261102101831.218090-1-xu.xin@linux.dev>
Content-Transfer-Encoding: quoted-printable
X-Lms-Return-Path: <lba+26ae8708e+a4147a+vger.kernel.org+zhaogongyi@bytedance.com>
Subject: Re: [PATCH] mm/ksm: avoid anon_vma UAF during page merging
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
References: <20261031182256.40205-1-zhaogongyi@bytedance.com> <20261102101831.218090-1-xu.xin@linux.dev>
Message-Id: <b208b102-81b6-4e39-9be3-202fc0519e07@bytedance.com>

Hi Xu,

Thanks for the review.

On 11/2/26 6:18 PM, xu.xin@linux.dev wrote:
>=20
> I=E2=80=99d like to ask whether this issue is easy to reproduce on 6.18 s=
ince
> I suspect the accuracy of the =E2=80=9Cfixes=E2=80=9D tag in the commit d=
escription.
>=20
> Besides, adding an extra folio_test_ksm() check is unneeded, see reasons =
below.
>=20

I reproduced the issue twice on v6.18
(7d0a66e4bb90, CONFIG_KSM=3Dy, CONFIG_KASAN=3Dy and
CONFIG_KASAN_GENERIC=3Dy).

The exact invocation from my previous email:

   /tmp/ksm_fixed_pool_static 4 2048 1 100000 64

reproduced the issue after about 220 seconds:

   BUG: KASAN: slab-use-after-free in page_address_in_vma+0x292/0x2b0
   Read of size 8 by task ksmd

   page_address_in_vma
   write_protect_page
   try_to_merge_one_page
   try_to_merge_with_ksm_page
   ksm_scan_thread

The corresponding free path included:

   __put_anon_vma
   unlink_anon_vmas
   ...
   mremap_to
   do_mremap

A second run with 4096 slots reproduced the same UAF after about
142 seconds. This confirms that the issue is present in v6.18.

I also rechecked the Fixes tag. Before 21d0d443cdc1
("rmap: resurrect page_address_in_vma anon_vma check"), the anonymous
page path in page_address_in_vma() computed the address without
dereferencing the page-side anon_vma. That commit added the comparison
between vma->anon_vma->root and page_anon_vma(page)->root.

At that time, the KSM scan path already retained a page reference,
dropped mmap_sem, and later called page_address_in_vma() from
write_protect_page() or replace_page(). The page reference does not
pin the page-side anon_vma.

Commit 4829b906cc06 ("ksm: fix page_address_in_vma anon_vma oops")
added a NULL check, but the helper still dereferences the anon_vma
when it is non-NULL but stale.

MREMAP_DONTUNMAP, especially commit 1583aa278f5f
("mm: mremap: unlink anon_vmas when mremap with MREMAP_DONTUNMAP
success"), makes this race easy to reproduce and explains the
unlink_anon_vmas() free path. However, it did not introduce the
unpinned anon_vma dereference that this patch removes. Based on that,
I think 21d0d443cdc1 remains the earliest appropriate Fixes commit.
Please let me know if I am missing a lifetime guarantee that made the
dereference safe before the MREMAP_DONTUNMAP changes.

You are also right that the folio_test_ksm() check is unnecessary.
cmp_and_merge_page() already checks folio_stable_node(), and a KSM
fork page that continues through this path is handled by the
page =3D=3D kpage check in try_to_merge_one_page(). I will drop that hunk
and the corresponding commit-message text in v2.

Thanks,
Gongyi
