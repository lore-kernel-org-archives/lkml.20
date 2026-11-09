Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214668;
	b=IS+0MyCYs/SSTblynhNob2VyWwHS11B6+okiNw9l1zCicZma/yTCeKGjB2oZ1+cq2pF+
	 beUzZNe7tG94onN4YXfPjoQt9YwnP5fLibv5ltRA8VW+4Xw6Z5syt4lA+4CD445iClfNw
	 dTGhvGBUyzJsT9A/gpd0Adc5GipvGAMp3I4+5zvphnc8AR78YTvKagh6ugu/FGPV/Rs3k
	 fkmmower+TBz4IuHT4sHF33KFwOS+Bb0J6FGZt0ER7Z5YvvRPzU8aije3gECK7vOYqXkH
	 QnVG3ZBBfqiadC0WHJjg4sOWoaRiPaSRSkMqUXXIO3UVh+kub/7fXA5rDQW1Nhg/Fjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6gPNbhKnS4UiPYe9GkhcEdm+Vle3xI8UXMcC7kdMJ/8=;
	b=FtgJKZRB9OOiTB7/C2AnOloYjZJ8EyzML119iqDF4lAM/ItzJypFvdVKc/Iw2BOy4w5R
	 uzrvckwUxBmLYcRv9SHN+/Q0ED/R6sf3KOyloX+j7He+Ms92Z9cdo9S8Rmmp9mF+wAwQN
	 Nv/VYCqfZh9HA8PScBGO/r00DP2YZCYI4MGDYUMPvMdnHem8fUmZ6P2i3stu/cGSFPMht
	 Xn/LrbgtwAA1DeI+G3PVrr9RO3k3xgAM8FDhWqgkVfY2e0m7k7fQaBRbGA8ClTkALKzIY
	 YLYfcI4Gf/tC6mDkxD8e5++qmuwRq5yOQRu1x5Q+Dhp/TbpdrPXVY063yJ2rlvubOKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WX99d5g8;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F21606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F21606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WX99d5g8
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so7505545e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794214667; x=1794819467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6gPNbhKnS4UiPYe9GkhcEdm+Vle3xI8UXMcC7kdMJ/8=;
        b=WX99d5g8HsNJ2Xc3dJWqBEteZ1Yzefr2XigtdxHvKUPJpgca1CoZqq4dp9NTaNP6YU
         bfxXvVbrXNq1MdQzDcVoMJst5p/JdASrGhqAQ35GgrQgGpWZpMZlArfgaA1khdBAvC3f
         UCgBrQaf6/SWaIrIz1cfg3VI8DlRIOxG1IFQ8rIXoFZQPGYzqcNzDEqWjIR9CgfeTAw8
         NE+Bm718A9eCD1tFyyGwavlgkgZz4MK9/UkYHD7WODjq9NCi/wfmLAsHbxT2jEtokNMQ
         8Q5NxTbvsYh5rJzdZ+Fl9IzESFScMGEZ1Re6QX6Qo6SLBiZakqLIE2CVv/0RDj39F8Jv
         /HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214667; x=1794819467;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gPNbhKnS4UiPYe9GkhcEdm+Vle3xI8UXMcC7kdMJ/8=;
        b=SsbGroWfS7oXI/QE8Bgk04qIgiJm3yj2Vzw6VAborIscl7IJpKKlhTnp0MHLKP4iLK
         WpJunVfto21apCDD0Y2Kzmaf9gPbMf0vQD+231aj6T0ffd9wiELj3x4FFHN9kPZnm2TY
         XLjjLzlM0g5RH/cXESoA/3xmv+5iWP2ZMkrDEIJwU7VPVabqnKOx8q/s8gHhKdInpa4w
         JfcetqURYMj9jBtEq7F6v/pyL2MMaRi396IV0EyL0kxet0LyqNot1OhDnFdKB0RKOGh5
         VYxE1hyDg++YFGDM/CVie7nNgbNFEi+yvBNRBQKozd6/vY69VEVge6yCCTjYV+OfMSFN
         K/FA==
X-Forwarded-Encrypted: i=1; AL+hErEwx+auPoDudFylzMaZADPQiDv53wWh+2gbMYUXXlBI6PHicXV7Q8FuLjQLx9hOeBskAwUU0JjKRGh/Auk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9teyjwlzx4VzpSFgfCOUvdhBXTWD9uB7Kk+neuflsOcSuGJSpz
	YU2nakWLZ6PmKDXeqY065BDVLHRdrQwGCaD1+xSjtCG/GE0hV1Xrr3BJ
X-Gm-Gg: AYBFou1vQezmHuNlifsYv4nc18UKQgz3TYRZwh7T+7Ya+P9bj32QrYWrl9oqYhXVFzn
	hm8k1c904/J3/y7Xmllnufxcjp/DEdTfZ1ZSbrw3fnVdcUrCbeBgl8Fl44dygZd9fIepZsorQDk
	5DAev9pQb9UXAzsMLWYAtdOJZI3YQfR5aTil/XLVpFNsEsLVP+/G/xUApHn19P5LvmBT52BtDZe
	Q77ZS7fFynAxvPWEJT+RW34hENrGRooyft5wy9H0OQC3F4ov9RUV9sO2o2+og6zHJJBAtmYeOkr
	u54F4+jIx5cg39RfwfWmO3tk6e9v17gP6ENhzdPm5sdOc2DNqkFozDPAtMlP3jLmmV3ltKqB89V
	9SXjz838U58GdWZvBknEnAJNlq5LgfuM9NmPxTHE+l75hhyuji0RKERnhZ4DWOgqAL2QF+4Mu1z
	eaDhfgD/YI/yLf1b9PscpFIQzy0NybStpDCMrTzgHlGNKsVCL0r4Pqf5Rs587ly+tdk7X6nmHva
	UwzWaytrTt75NmPFeH4rE7IPNBRnV4hCI9W63RH6i4S9sE/l1SsJXboNcEPZ/3grG7plCZ0wAVz
	upZmyJBXJyRPnvI/sZQ7XkU=
X-Received: by 2002:a05:600c:4f86:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4b960d9b17dmr61969495e9.9.1794214666809;
        Mon, 09 Nov 2026 00:57:46 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79501502asm149200295e9.2.2026.11.09.00.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:57:46 -0800 (PST)
Message-ID: <a9fb2d3c-d518-49d3-9479-a25fa2cfc5b3@gmail.com>
Date: Mon, 9 Nov 2026 09:57:43 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] mm: limit pagecache folio refcount when splicing
 into pipes
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Song Liu <songliubraving@fb.com>, Rik van Riel <riel@surriel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Steve Sistare <steven.sistare@oracle.com>, John Hubbard
 <jhubbard@nvidia.com>, Josef Bacik <josef@toxicpanda.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev,
 linux-arch@vger.kernel.org, iommu@lists.linux.dev, stable@vger.kernel.org
References: <20261107-refcount_overflow_stable-v2-0-c38f6809b106@kernel.org>
 <20261107-refcount_overflow_stable-v2-2-c38f6809b106@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261107-refcount_overflow_stable-v2-2-c38f6809b106@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/26 11:23 PM, David Hildenbrand (Arm) wrote:
> Similar to mapping pagecache folios into page tables, let's reject
> additional references when splicing folios into a pipe if the refcount
> is at its limit, similar to how we handle it during GUP.
> 
> This will prevent more cases of possible folio refcount overflows with
> large pagecache folios.
> 
> Let's keep it simple and check in the two callers of
> splice_folio_into_pipe(). Return -EOVERFLOW if the limit prevents any
> progress, so do_splice_read() can fall back to copy_splice_read() when
> read_iter is available. This keeps sendfile() and other splice users
> working when ordinary reads would still succeed.
> 
> Also fall back to copying in FUSE when taking another reference through
> fuse_ref_folio() would exceed the limit.
> 
> Also check in try_get_page() to cover pipe-buffer duplication by tee()
> and partial pipe-to-pipe splicing.
> 
> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  fs/fuse/dev.c      |  5 +++--
>  fs/splice.c        |  8 +++++++-
>  include/linux/mm.h |  9 ++++++---
>  mm/filemap.c       | 11 ++++++++---
>  mm/shmem.c         |  4 ++++
>  5 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 3641abb90d6bb..4f6b7b42bfd3e 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1265,9 +1265,10 @@ int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
>  		if (cs->write && cs->pipebufs && folio) {
>  			/*
>  			 * Can't control lifetime of pipe buffers, so always
> -			 * copy user pages.
> +			 * copy user pages. Also copy folios at their refcount limit.
>  			 */
> -			if (cs->req->args->user_pages) {
> +			if (cs->req->args->user_pages ||
> +			    unlikely(folio_ref_count_over_limit(folio))) {
>  				err = fuse_copy_fill(cs);
>  				if (err)
>  					return err;
> diff --git a/fs/splice.c b/fs/splice.c
> index e6d43329ed3f0..df73a4e65118b 100644
> --- a/fs/splice.c
> +++ b/fs/splice.c
> @@ -956,6 +956,7 @@ static ssize_t do_splice_read(struct file *in, loff_t *ppos,
>  			      unsigned int flags)
>  {
>  	unsigned int p_space;
> +	ssize_t ret;
>  
>  	if (unlikely(!(in->f_mode & FMODE_READ)))
>  		return -EBADF;
> @@ -977,7 +978,12 @@ static ssize_t do_splice_read(struct file *in, loff_t *ppos,
>  	 */
>  	if ((in->f_flags & O_DIRECT) || IS_DAX(in->f_mapping->host))
>  		return copy_splice_read(in, ppos, pipe, len, flags);
> -	return in->f_op->splice_read(in, ppos, pipe, len, flags);
> +	ret = in->f_op->splice_read(in, ppos, pipe, len, flags);
> +
> +	/* Fallback to copying when hitting folio refcount limits. */
> +	if (unlikely(ret == -EOVERFLOW) && in->f_op->read_iter)
> +		ret = copy_splice_read(in, ppos, pipe, len, flags);

here it can't tell where the -EOVERFLOW came from, if another file
returns -EOVERFLOW (i.e. tty_fops uses copy_splice_read, and
n_hdlc_tty_read() returns -EOVERFLOW after dropping the frame), it now
gets a second read. also, the first read already lost data. so the data
read returns different data, the dropped frame is never reported and
returns the next frame instead.


-- 
cheers,
jose a. p-a
