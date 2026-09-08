Received: from mta1.migadu.com (out-117.mta1.migadu.com [95.215.58.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6310D1D416C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788834637; cv=none; b=cfgci9cb89fssDIuG93GCelRzw6AfDyKoIOXw4eODRtlv4YshHcMmbIs9+oxhjktIO+RPp2pDyqdgbx2W+FxHQLDvPwTzNHX3oavGXCQt4HeKT0q3BCEHbxV6ZgTcG+N8tSwSnwlLACh111ZtsWMQ/U8NGtbCx4FGI1ioKgiz5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788834637; c=relaxed/simple;
	bh=z0r4/wgDlm7GGYqJBZ08afo0a+iAQ+9yytpL1uANVFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQiNNLq7aoRf3IL3ckG0BetuG7Rl/vSf9In4yAu+p9g2hVPfnsqJKp2bDJVtqeDyFXtwkGN7u5OAtP6h4Vz0oyLmvmkgBZwQcLupyr2p/DD9ptLWoh0GzHfqZ5h3kwEcJ4AHJA61atosYO51oMJGBeVXQE2XeS8lOe1oShZb3lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DuABJVcT; arc=none smtp.client-ip=95.215.58.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DuABJVcT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z0r4/wgDlm7GGYqJBZ08afo0a+iAQ+9yytpL1uANVFE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788834633; v=1; x=1789439433;
 b=DuABJVcT3YDhXtDaPGcYhoZUite3GQp4Xz5SV0tCmimiJrJ3BXkU8BGYGu5k4RyKLvccg2Nt
 DAoAJr2ut4YrzNgEONOjPYOAShVxuLAawBM2/Jrs815G+mHLX5t1I3UxBs/KzqXewKgOSQAz9l2
 MFqPHWlJNP6RwNw9S/P3NRT0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 0f1918fe47817a4c;
	Tue, 08 Sep 2026 02:30:33 +0000
X-Mizu-Trace-ID: 0f1918fe47817a4c
X-Migadu-Flow: FLOW_OUT
Date: Tue, 8 Sep 2026 10:30:20 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, baohua@kernel.org, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com, hannes@cmpxchg.org,
	david@kernel.org, mhocko@kernel.org, ljs@kernel.org,
	ridong.chen@linux.dev, hebaoquan@kylinos.cn, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: mglru: clear the reference counter for rejected
 folios
Message-ID: <ap9zPPughaSlfXM2@fedora>
References: <8e4db9a298c5ea6ccb192e274caed5b96f0cf022.1788751143.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e4db9a298c5ea6ccb192e274caed5b96f0cf022.1788751143.git.baolin.wang@linux.alibaba.com>

Hi Baolin,

On 09/07/26 at 11:25am, Baolin Wang wrote:
......snip...
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 40d3f1b48a74..42c0a09938ab 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c

Well, this seems to be based on Andrew's mm-new branch. I usually track
mm-unstable branch. Maybe the subject should be marked as below?
[PATCH mm-new] mm: mglru: clear the reference counter for rejected

> @@ -5021,10 +5021,11 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>  		}
>  
>  		/* don't add rejected folios to the oldest generation */
> -		if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type]) {
> -			folio_set_lru_refs(folio, 0);
> +		if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type])
>  			folio_set_active(folio);
> -		}
> +
> +		/* See the comments on LRU_REFS_FLAGS */
> +		folio_set_lru_refs(folio, 0);

This looks like a great catch, while the code change could bring issue.

Because move_folios_to_lru() relies on folios' flags to decide their new
generation. You just cleared it before move_folios_to_lru(). This is no
problem for rejected folios that are determined to be put into the
oldest generation. But for those rejected folios that are determined to
be promoted, this could be wrong. E.g currently gen window is 4, and a
folio is referenced, lru_gen_folio_seq() decides its new gen as 1, which
is the 2nd oldest generation. While folio_set_lru_refs(folio, 0) clear
referenced bit, this causes it being put into the oldest generation in
move_folios_to_lru(), this is not expected.

Thanks
Baoquan
>  	}
>  
>  	move_folios_to_lru(&list);
> -- 
> 2.47.3
> 
> 
