Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378DF3A1A22
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792030310; cv=none; b=fdElT9qEW9wuoMLCRpb4tr37s5VByCJHJ0h+OOfTz7Vt8NWIQPGTV8yWncZJ5quBKTpvbHnzO2V5luYIzZxF4TrtICsTu2DaKpX9rsD14Nbh125meB/rtEuzB7edrhEdfqdh9RxS/vzG7dh6Gk/XUa7D7PWAcM3w3L9C0GXM44M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792030310; c=relaxed/simple;
	bh=Do0iA8uNsiwH96pQFdYvdEdXnoS+GP1Eort9RjA8HUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+gPR3N83Hzt+B5nzQX5woRYkNeb3FFLknuNve0ineDswDOntN3BFHJ++xuDrts5tVnoMXlB8jT20OopKCFCvwJnFLRD2aUe3OOoS0Fhyq+0HqVMjO2WG5XXENLYohsbqVYVVlMEXMQQxWnLskSfuH4oqLJ5v17kJDbDgK412yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k/antPzB; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k/antPzB"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so1197926a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792030307; x=1792635107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvIiWBHgt9RJ8Lp49q+d6DWrLq7WNl23wUdd8hsh/fk=;
        b=k/antPzBLeg485CCGqKBqHAUS2UL6GXz3uUQgsiwaj3tiJhn+Hhl59X3NpX7mYIBcV
         ENBHJCi7xe6nZGtLgVaPiyaWjWqBUrrXfs1pjZAD5NqUdH26TpWtFW8Ku5OVnoT2jKX+
         N8HbKOaQsZGbOvdRIvqr9/4dgcpSMDQjy912w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792030307; x=1792635107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvIiWBHgt9RJ8Lp49q+d6DWrLq7WNl23wUdd8hsh/fk=;
        b=cJnkko6RTyk81cVkfi2oAB7IctslBruVHIvJYCOXQUqWGj0pSzYnF6dtLTfrJ3Ml8h
         4UhoZyTKDMCvvK3qORwK/3VWfncCig/2dg0gU4FsNbF1sABoHQ89rdiKZo/r3gY6Keoq
         WdhPUzeUgp1PEKIZgjgu92Xgjwo7PYnEcLMooBJKUUwzfeaDd5A9rmGb/Yxiuju/GpnP
         3kRuoM5yYa1SWjZS0n3IRNftrwsm/N3pHRAaw1APIRzOaDpodg33i9N7wfeWTTV0bkKo
         uXKZRSeIQSzK8vlYMujyrdhloP+yzViZSIcnK0zK6ZYpSfdUjGEdPB2hVYmqFSlCQiLF
         Wlew==
X-Forwarded-Encrypted: i=1; AKwUvByr1brwYvffzzY0wSnE65FgH3O9bkClteD+vmT0rVS/wVNmLIKa2qJFikXq3ft+tpNEbYMvYvTg2PtQqvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2CKo7ziiKLZigseLXfzMcfL0ORzZY+mhf5VFrI8fdxAxThxDu
	sgRdM8D9AWeafe2G9vMRidOgsrqJwsnS2DkRSOdXlJR0U283GeMXL1tfosM0ctfIUQ==
X-Gm-Gg: AYBFou16QI1ci4kXxmz3ZkHBdidKOQMKMObta/T1eW+nyoolYO/e3eb08CBY7iBOENo
	t9SLQP9PbE8CAp9itohloPzFj5hZSd0+KxXtkXx9W7hyTUGaaDkNyBDkvSa2pvsKwcfmCCXC4IG
	1Lq1cwom1XmZw3qZ+6uEf6MhqoFlOkgYS3cEuSddzXIx2HCDP7zeEyhalAOgDX+xu7gCs+5QHba
	L7HLV8vZX/j/v2mw/Zy4faOF3SjNZ0SuUTj6ucL7JrcjEgTot8gsAle5IOgI0L9Li/e4I3ERmg8
	qo2HJPqYfGI3eAUrUtBjZG4gydoVOfsKOuIagVZasBlLGoqKgfPP02nHIY85hWZOGalODg3XK/4
	rjzPXjf8fZVJI3tWlHaO5o44juayiEn60MmDadf0qhO95Eeb7KPRv9YFHQN2df89yt3mYbwE1fu
	Wj3H3xWBv7bU5zGm3WikszRew2f9esGJ46rNVO85Qfyy68oe0yZ59X4vDPK2MnzPPPjMdeDlYv/
	9sF30APnGkq+ZH7YWThNyfBFV3chTTf1171Muw=
X-Received: by 2002:a17:90a:e7ca:b0:3ab:36c4:b500 with SMTP id 98e67ed59e1d1-3ab3a39f232mr15295954a91.5.1792030307388;
        Wed, 14 Oct 2026 19:11:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:8455:7899:5a2e:26f8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac937f2d3bsm1227191a91.4.2026.10.14.19.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:11:46 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:11:42 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Bo Zhang <zhangbo0325@gmail.com>, akpm@linux-foundation.org, 
	bgeffon@google.com, minchan@kernel.org, richardycc@google.com, baohua@kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 10/11] zram: use rw_semaphore for decompression streams
Message-ID: <atA2JznFm8zLIMIb@google.com>
References: <20261013035201.2809924-11-senozhatsky@chromium.org>
 <20261014153603.1365617-1-zhangbo56@xiaomi.com>
 <atAj9o5IgrAeiGiW@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atAj9o5IgrAeiGiW@google.com>

On (26/10/15 10:41), Sergey Senozhatsky wrote:
[..]
> +	if (zcomp_shared_decomp(comp)) {
> +		struct page *pages[2];
> +		unsigned int flags;
> +
> +		pages[0] = sg_page(sg);
> +		pages[1] = sg_page(sg_next(sg));
> +
> +		flags = memalloc_noreclaim_save();
			^^^
			memalloc noio

> +		src = vm_map_ram(pages, 2, NUMA_NO_NODE);
> +		memalloc_noreclaim_restore(flags);
		^^^
		memalloc noio
