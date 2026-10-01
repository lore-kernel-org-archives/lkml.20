Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9853C345D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848363; cv=none; b=c+FXcphIvPv4Aoue4iXVxpFNXWDNXKtyTMgJS7pr8gyYy+Wy2Z7g4gUvIQ2vNOE5UIL4XGG2f6Fjbnqa35CsfK3O+W0w/FGpKM8MtyeKwEn6ps+c8JbI8GviedGuKYUDCiwkJrHnY+PTi2Y2eEz7WthfQdmyyhFXKnHx1xTZE1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848363; c=relaxed/simple;
	bh=Va/oGk6dT45Cgb/aqZ/AaCJJTjZnEwHUu3G4NJN+aVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qr7Wt+pG4ghlyJjnPMZw4/F4W6K0k86ysXq5wGceflaPdvlz8Pk4BRJJiEWesjuqKK7Pp99fgwZDT46BvG1MG0bDGEH9OIfSt0qZR8QTTlcDFGaABGxyjEdHPzurTO82pDEvGwTvfkn/lJsdE3vEnkhfGs6sTB9PaOvL4CX0TCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLOc8gH+; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLOc8gH+"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b02c279beso224942a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790848361; x=1791453161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xY9QxUKpHNhbTr+dumQ0I1KTTJGdnP4miBBZLDZIWI=;
        b=tLOc8gH+YvZmlX8WmhVTOBeyBOeC803FxTJ3/5FYleCPVhpt/oByObBBNsIbVaJL7V
         xPcLRMzC2OJPozXFF1v1tGl/NfVXeM3pv3fOr6myBMfAWCEWUWWI0ZBMho2ePiE2PU4X
         jP9vxrKJQRfeVfoJpviH2ozs4n1m6pHI5sw9Tp53/Wfnk8tRye+HzceorihztW920P36
         +DnduRd/nPzTKH2yh2ztzGYuB0NeMFihGX4NnYqao8CwvL6GFesM4bXl+r1K0jadebFs
         lOYzy8d2EpM3Jh3z16hxhXtz7bW60navV2gOp23bLq2Y+X+jWIIGa4R7dqDMNpz6ZiLW
         oOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848361; x=1791453161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xY9QxUKpHNhbTr+dumQ0I1KTTJGdnP4miBBZLDZIWI=;
        b=Ozji/22qnrVxbuwFF3DRf6/hggCip8R+dFODdNucNmnC8uBnI+s8yIh7mjkvXQSFVy
         bSbvGupOuUzQaqq/qrni6QR+xefApWCzhPPoOjibwxp5ekeEcgZ9odZD5pmDOWriVkvF
         wCJUCHo96oPgXP+pvD8lPu3OQM3ZwMI5daDts7pFA3NkERzdj+bw5BRbrWfHGjqi/vq7
         23JYVg48pw+kW994LEUcavrzeoMZ1MDbi624jlvGyviOy1075QYSdk3jtzXO4jgXnBBj
         ++ac2wkQ24TRwBvqG+j7JFGeqkt9O2LipRttgJYnn3fJDWoDoR5W/WHzWqWyNGUFn84S
         UnNQ==
X-Forwarded-Encrypted: i=1; AKwUvBydJJUCo+wOt2eNnvCnwM+akEX0rf8Xh7sVLisw9dGoN07zxOmq7yV6hnYiJLblKBuJtzIdq0qX7H7wYdw=@vger.kernel.org
X-Gm-Message-State: AFuF++lQvGUGrMNNF+0z9S2mhsdi/gsI1jl0Hgu6ICCPEAfM0/NXp+mx
	YHmh5DieVpVlyO1Jg4DQFEBYmCvnYzKdV+CwywmA9CkyJQmMxyP6gGRnlnAOX999
X-Gm-Gg: AYBFou2HXIln7+ZYfuPQv4WMY477aFxr/PSxkKj6NmqhFTprswfiJd3p8GZnfyZd7x/
	C1k6YDAsBjYVrw5wWT2vxnmw9y6hJfwEoRkLVfXZI08aB0xnbJNAws0URA8KlEKUgDyIXeQJjcw
	qIcDjznq40JZjUR++Dr9v6bNIwCyDVakJwdMUJVLeD2EeAEyroL8UdPwFp7Ev9uEQjwT/kPcl+/
	lNQaySxtCsLWeuDau029L74JD1jD2+YKO3ydYXVBsV1Oa1Z2mHw0sVJdF1tI88pVNyCRWXsWxM/
	1y/u7fWbe7zWtIfuz3NpU16SPCM9Bxce+6M0qlA/C2uLDUdO+NJWbme5X3Ajz7yKUsSfutOjxZ0
	gKuyIaSEOaY8uUzDZw+7N7Mblq/i0Pe8eZOtrbWgsG9LG3uLm0hJYmE7d3Ph5HGL1J9NMYbMIeX
	SqdvD8BMVXsJuNIEmlC4IBkte51KwUR9IdCZ5xmYwA8RvUFOqfVSDrbq/bT0RDWoX27Wrtz89nw
	htkQBjrRj6nr60toj0lAClcaugNww==
X-Received: by 2002:a05:6820:4b0f:b0:6d9:979e:22ad with SMTP id 006d021491bc7-6dcf6122b49mr4129246eaf.54.1790848360630;
        Thu, 01 Oct 2026 02:52:40 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:59::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6dd988cf6cbsm2306361eaf.13.2026.10.01.02.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:52:40 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/swap: submit the last readahead batch before unplugging
Date: Thu,  1 Oct 2026 02:52:33 -0700
Message-ID: <20261001095238.2417205-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001085730.2029773-1-alex@ghiti.fr>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu,  1 Oct 2026 10:57:12 +0200 Alexandre Ghiti <alex@ghiti.fr> wrote:

> Since block swap I/O is batched in struct swap_iocb, swap_add_folio()
> only appends a folio to the pending batch when its slot directly follows
> the previous one, and submits the pending batch otherwise. Batches
> submitted inside the readahead loop go through the plug, where the block
> layer can still merge them, but the final batch is submitted after
> blk_finish_plug() and always becomes a separate request.
> 
> So submit the final batch before finishing the plug.

Hi Alex,

I read through the code and this looks very reasonable to me.

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> Fixes: dda8fb68b590 ("mm/swap: also use struct swap_iocb for block I/O")

My only question is whether we need the fixes tag, it seems like
dda8fb68b590 is still in mm-stable and not merged to linus yet.

Andrew, what do we usually do in these cases? I am wondering if it will
just become folded into the original commit or if this should still be
standalone.

Thank you both! Have a great day : -)
Joshua

> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  mm/swap_state.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index 2475ba29126d..ebef568cd62e 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -906,8 +906,8 @@ struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t gfp_mask,
>  			continue;
>  		folio_put(folio);
>  	}
> -	blk_finish_plug(&plug);
>  	swap_read_submit(&ctx);
> +	blk_finish_plug(&plug);
>  skip:
>  	return swap_cache_read_folio_sync(entry, gfp_mask, mpol, ilx);
>  }
> @@ -1019,8 +1019,8 @@ static struct folio *swap_vma_readahead(swp_entry_t targ_entry, gfp_t gfp_mask,
>  	}
>  	if (pte)
>  		pte_unmap(pte);
> -	blk_finish_plug(&plug);
>  	swap_read_submit(&ctx);
> +	blk_finish_plug(&plug);
>  skip:
>  	/* The folio was likely read above, so no need for plugging here */
>  	return swap_cache_read_folio_sync(targ_entry, gfp_mask, mpol, targ_ilx);
> -- 
> 2.53.0-Meta
