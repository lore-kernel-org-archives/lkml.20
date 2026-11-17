Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878400;
	b=N4mt9ccnzOU9bkbLHhdFfZZnbk101RDP82NBOhPBJfhtAX1Fu3lY/TG2PBl1XF7hLTuf
	 Ow++C/5SKpkR77MYunZe3ueeA3MBPEuGFg2DitGQB6dVMynN/AV88XQ4dQnL66NfILY+P
	 U9LyZ10HM6bM2Rsobsadwx/3RNn2D+0rsIL25TWknBXy/dYBeG8NjeHpzKULbkmrAKdLa
	 /7H8sKpaNeeM1JJ8gkbSrqj/DaGl4qI03mSGsTxWw/3t4zsliW8kyp/tps3FgDyJIxh6z
	 nFQFR/5kJFG9ciczd+K0UcuthN0Qi0iH6yqKVHCz5cDmTw++GUMJ2ftj8swCq6Z2ZtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NVBsEmD16FpESz0NWKiu98OgFV5Vu9Lx16xH0y2alVM=;
	b=lYFki5AtZ8PaEVjP1+CJ3YKva4MwaHcp5uoNW6Fpjy3/7/S4wpNo18x9zbcCNqieEvEY
	 jL/JI29T8u1JFrr2a7M8dIl2wT9CQzBY0BjTWzPS/z+mPlzhoegB11NUqdmtKdx+GMqvU
	 ptm2bZj7sgo8SpA63Bk1j03FqKgw/GUR9Fr0XrfWYNNltIW3ElRU+HLR3LO8v9LtLopQh
	 A0eB57mEwY0TbavZH4lF0Fhp76I/umQVagbuBmoolREFTfHYF5ko9/i0QxbZwS2Xlxqfy
	 hD8bSeOMbkWjTOIxAf5S6F9RLhm8zegOO34GOL8Z0/E9FaLxxmpr60HE1XRIytz959A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XMdOkI8o;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667D1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 667D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XMdOkI8o
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5365f9a04c5so68263441cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794878399; x=1795483199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVBsEmD16FpESz0NWKiu98OgFV5Vu9Lx16xH0y2alVM=;
        b=XMdOkI8oRv9yndwLYEnZiOr0Ma2YO7IA2OOBjZYWiWLQJp5gvOdnwsbFXDAQQcgqWv
         w/aVigQvQwDTfdMK0Qt8bq+LFQSbQSc9gfuar+GauP+XfkyKT8sHt1cW2BzBqX9moRn8
         2Vt5o1IP4SiKywHbLmDQ/JU8E0BfHFBoWEzpUrsvAKrudo/2BQA+3RuALd0IBJNq80Df
         yz4xv0pYNk/EV3UFxOLXtRUrQ2wBLJiyYdQOhZrwyaKA13Z4DpKH4ucU9bvBm9VqJ/fO
         9Fgqr7SpBH+5WLdyt8Wo+DgXWDAGov/qP36rPnQRy5l0hpSKWRgNGxDeH6BbRdSPPdFm
         tAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794878399; x=1795483199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVBsEmD16FpESz0NWKiu98OgFV5Vu9Lx16xH0y2alVM=;
        b=1o/r7LGhPqjtK0rP43pSCb/jouqHKAUze8Ze7pzzhsgdNgPkZoglecESh/7xxqTEep
         f5oc8UWaR4liSK1o3rzopM7pdBQgzSlMk6On9Jug1ZHARKpcl0wdm8kzz5jJgHrCmYhu
         gLrA9j5NrmH85MvQEe+gjqqWKj/ZJmWwO/7knwGyEAQwDuK84mdx1NL7/CZQytHVR8oq
         RxTu7i7YmUQF20V52DEBKrrQkZPW/tRKNw6Xx4O1F+LRFY4nGhWqQM6o3nMzFD8VKRDP
         ftw91RU9siMkutew4B2gXcGVWmfB5SmK4VXQhO8Brmjkc8vBHjU3IJMeMxWISFwVNg/p
         a1HA==
X-Forwarded-Encrypted: i=1; AL+hErFzvlQlX8UFqjZDGVILEMOV6SbVT58KOsOZ5dXfu5703gtTLY1XiwkAIAJeTiVoIRu8ypv4MNP72SnUJOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lCg7w2iBXB4FyjYP9rw4ZklmAkpqO/OvEd4Du8x+YcVA4mYSF
	P+MpGZCiDh0stBJPELEwRdz/iCtBx0uOP691hm7fJkoXTlr2+3po+RE6oy4nj1G1Z3A=
X-Gm-Gg: AYBFou1+7hHrAX0PClISz+XDKSDeDejLi8tnoHuU544D2eeenUOKDhMftuO329GBZxB
	ACx7V/DsLZrlsNvOjOlSh4kVx7B2AbtKvLqzR/md0Al9VUJcxDI9eUXMT5cswTh+pXAdCyjfQq+
	WMu8aftUmRdZ3A7mPzxDPgKCM21ROpY2Gnsq1uVecEDh0GF2TPg9MgmR56563f4edxP1V8DYjF6
	Yt1DL3hPAsygZe+OwhJpDZ0tNwwRaQHMee9spngEhVi4hhgnGOsIZW7ucirfwph0Q4lHSFcHvO3
	Mwcz+l5cCav+jSUFjTiV5V2V63g4mc8h/rpt38qmsrOvDf0Swa5isRCzAWeAOOVQOLyezeYb6B+
	klNHCEb9CODaKvFYleNNfHGpJ7VdYmLHmI5V21mjS+7ReQsPgHJt16jIP2yFhG7kJSeIj8jw9q/
	Il92VZMlEnhGhjIaV+pxlu2KYfJZIjl2UI1Vwifmb6zx0XwcKv4ESDtm5rXGTI6m5PRN5APDLSQ
	kqEFNfnatoXlrN9AUj/DAicNLWrPv3i0+zpxED3BsZIiVM+3MFzj+LhrXxu+KMgdBmxes9p0ihI
	nH4Ys/7dxa6A5EKEFN0nOvCCde0=
X-Received: by 2002:a05:622a:13c6:b0:55c:c7ab:4445 with SMTP id d75a77b69052e-55cc7ab469bmr135845571cf.29.1794878399070;
        Mon, 16 Nov 2026 17:19:59 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ace25973dsm94741791cf.2.2026.11.16.17.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 17:19:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT7rW-0000000B1jo-16pQ;
	Mon, 16 Nov 2026 21:19:54 -0400
Date: Mon, 16 Nov 2026 21:19:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiahao Xu <xujiahao@cmss.chinamobile.com>
Cc: Kevin Tian <kevin.tian@intel.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com
Subject: Re: [PATCH] iommufd: reject mapping an iommufd file into an IOAS
Message-ID: <20261117011954.GB2606445@ziepe.ca>
References: <20261114004101.GE2532299@ziepe.ca>
 <20261116113808.560717-1-xujiahao@cmss.chinamobile.com>
 <20261116134920.GK2532299@ziepe.ca>
 <20261117091333.399547-1-xujiahao@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117091333.399547-1-xujiahao@cmss.chinamobile.com>

On Tue, Nov 17, 2026 at 09:13:33AM +0800, Jiahao Xu wrote:
> > And how do you let dmabuf go through?
> 
> It does not reach the check, dma-bufs are taken by the branch above it.
> dma_buf_get() only succeeds for a dma-buf fd:
> 
> 	file = fget(fd);
> 	if (!file)
> 		return ERR_PTR(-EBADF);
> 	if (!is_dma_buf_file(file)) {
> 		fput(file);
> 		return ERR_PTR(-EINVAL);
> 	}
> 
> so with a dma-buf fd iopt_map_file_pages() goes through
> iopt_alloc_dmabuf_pages() and the else branch with fget() is not entered
> at all.  iopt_pages keeps pages->dmabuf there, with type
> IOPT_ADDRESS_DMABUF, and never a struct file, so dma-buf mappings are
> unchanged.
> 
> The shmem/hugetlb test is not a new restriction either.  The file branch
> already ends in memfd_pin_folios() when the pages get pinned
> 
> 	nfolios = memfd_pin_folios(user->file, start, end, user->ufolios,
> 				   nfolios, &offset);
> 
> and memfd_pin_folios() rejects anything that is not shmem or file-hugetlb
> with -EINVAL.  The check only moves that rejection to before
> iopt_alloc_file_pages() takes the reference, which is the one thing the
> leak needs.  A v2 doing exactly that compiles and passes checkpatch, I
> have it ready to send if you are happy with the shape.

OK

Jason
