Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309D151B19F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071261; cv=none; b=JBatsHgzeakyLK1JEBewDRt5QDLiUC6ROr4AyNVoEPWnCaxkmRedvKr4OVvzE9MscEDvUqSKVKOImp1Wb3CuzMdigA+nJ4m1obKMi7RFukXFVEC7XwGhb8ow9f45ugQ2WQQV8L9NsaV504c2ELtjPSzrFTeHlUY7N5RienPslhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071261; c=relaxed/simple;
	bh=OlLxK0kgVNVyPQc5F8MkuIa3UdaV8TkjyaoIHrUDjv0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I3NcWMV4AG+E7uZTawwtzdVcQHnrdFzPSkM0CjP3khtclsZVXH2gZQbX1jgg1y7DjW4FGhjm8Kae87Xa7IEdUyx7183SDWZUSXscE3i1WMB/Z2flo2SwwMWXvr/a+TIqFGLBu2JfD5jMb+D6inRyLalBTCioPWlj14miQTzF5f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNcoUQ0t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNcoUQ0t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BDE1F000C4;
	Thu, 15 Oct 2026 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071259;
	bh=wL0pcDUdhO+6B3feeMzk1v/C02vcc6EjWkQgbU5Zed0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=TNcoUQ0tDACV9eoxyyNp8hZJ3O5LXYmtHvu9Ct5s53NbEcHhjn3TbTpNBK7ApkF2M
	 ZKwm0B9R4oSdi+tD/HutwwqyKD9kmbXcZ405Y3irbXJAYD2aUYnRwX1TaapEm9Xss0
	 Gqnn1Nsm0A28xT2nmUr4ZV0HNrv1E6IpyZWLMDm/pLbTFV25E1UalCUvWHQphjvXvN
	 3Et4HCDLoMrXDKouc+bVcYWr73vPuSbiHUZqLCykUkfAg6K8a5lInCyCNbNna0zdSw
	 +dWH0EduXK6Dz+hyDYHtbQ/EUtvkXyFtXv5lh3cszJCUeGwX2CP5OPq0i59CH6BORb
	 C2v9kz18r08Lg==
Message-ID: <e80cc65e-22aa-45ca-892f-d13f2b1ae12d@kernel.org>
Date: Thu, 15 Oct 2026 21:34:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Nanzhe Zhao <zhaonanzhe@xiaomi.com>, Juan Yescas <jyescas@google.com>,
 Daeho Jeong <daehojeong@google.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v5 10/16] f2fs: support partial uptodate large folio read
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <20261014064445.2835813-11-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261014064445.2835813-11-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 14:44, Nanzhe Zhao wrote:
> Buffered write can have write bytes smaller than folio
> size for cases when folio minimum order is not zero.
> This can left partially uptodate folio in page cache.
> So we skip uptodate subpage read in read_data_large_folio.
> Also mark hole subpage uptodate in uptodate bitmap.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>   fs/f2fs/data.c | 88 +++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 59346b61615b..b9f2054f514f 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -148,6 +148,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>   		struct folio *folio = fi.folio;
>   		unsigned nr_pages = fi.length >> PAGE_SHIFT;
>   		bool finished = true;
> +		bool uptodate = bio->bi_status == BLK_STS_OK;
>   
>   		if (!folio_test_large(folio) &&
>   		    f2fs_is_compressed_page(folio)) {
> @@ -163,6 +164,9 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>   				(struct f2fs_folio_state *)folio->private;
>   
>   			spin_lock_irqsave(&ffs->state_lock, flags);
> +			if (bio->bi_status == BLK_STS_OK)

if (uptodate)

Thanks,


