Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793896018;
	b=uhsv3CUG6F166AlMfxDVN1T0CimVE3GvEezvxkpRtbqpSbGuwYIt1nm8bLMeJE8uCmPV
	 3RTiZ3ukX7McQiFJfUAFg/RnAjIMyCRBo9pX/x2YXzkVjhucBujzqf0rXbWCPAD9nCdwF
	 CfyiWtZVE7iYSJ9qRu0XjKlVWqasjJHlSH7uLte6RMQQJU1Hi+7Js0x8eofwdkxQg7soW
	 YeIxrVRw1QPLN3cKeZsk7+3EdmCudj2PJELH/iXV8xs9Y4f+QvXfapmElBPZA00qmEHtg
	 L6rnHCy/J/1EsnR4sZkK4BkyRGPfq057lkKhu0SkmVf+tiU3dSpWcx+a0pOzy3t060Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RXKLkTKvc7+/XeyXcf3gWRNGXsSdWTTIZy4YnfMAbSg=;
	b=Y2EN7OCmu6TFtE+nJ/KW81xRQpYv8Zxgm3ysAYv8Z2900KDXnc1extS+H2W5lvLUub5W
	 36X0+yhE2wGhrOc8qBmndTFq1RgjWSK0QtJ5K/5wSfPokK9g8qrQ1emoi9UAKcdwj67j2
	 YXdXUNs24ncNue1zHuA/pzGLCSxZ9zXrCodwP2CUcxpAsvGdlDayKTPq3sUYS1RC61i/J
	 F6jwhWB29DcB7wPDr5J9j7NE4/VIUnkMXcpZ4CfAy0fOldh4p8DKbeT1NZbeTWmVf2YA9
	 jLAma51mZhRKrXVlw7g5222NxFhXttCI8FZ2hyW9qXFPBhcZDI178rv5DFlavQBW+GQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XKqZC4Zr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4191606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4191606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XKqZC4Zr
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490c1d337d8so1092050f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:26:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793896016; cv=none;
        d=google.com; s=arc-20260327;
        b=XPGDmf1bUfSCO6KK129o7LDeo29klvbZM9cPPt21cjJFRYAOSNyKrthMM0Rrt7ZF0o
         KK7bNA/RuSycoTCSABMxWT/TNcp95qQnhFpT8OWz7w2Dv/x9M1wiUd31qHAknlFyuh0y
         +gc4b4kkilowm4IGTKQ0MQv61klQDfuziPu4ATh8z1ttG+rf0VY9dcP5UcMQY032wdW4
         7DsoccEDEfqevnBBWHi1EH6OQfVEq4Yhtsw4VMctzWpbrYHXhYTdxFv3B02H3Ov0TUk8
         p1wE+EmdH1CVESRfkuGdgbaUly8OcJCAJa5htb5cq8cKLB6+Cw5PxcWbOU54lp0FMD4Y
         1Dew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RXKLkTKvc7+/XeyXcf3gWRNGXsSdWTTIZy4YnfMAbSg=;
        fh=+ZDQU3i1nVbUylwAWnemKvZZNFrasezzh5ul0epEE7k=;
        b=K3nQB3aKBxT2E0Y6yeaxreFnVnppjAIlXY4gbZ2+xcei+2bk2IkG5gQzUntRjRS9wR
         tf14DwZd+WrGCn6LiHR043Nat/yiYP/7gsbVACAN2foPar+DlPDtVapmwU84oZ42q9un
         Y4BPKSkyAVRkBqpuh+XkJcNhZN65h7JjlQKF6UziB3kwawrYkXqZWhGyVMBeD+Hpk4VW
         545FR/G7f1jzClTZ3qATOAJbIUtGM7/7Ua58ac4Y9hHZ+MU4tNpMdR7KOTzkkh9JVc1w
         iCX8qMi3s++uvJ6V0bvM+Vhmfbjlo94uxlRJExAtrupGpPXL2VR2ysPDo0bspEPGqWbK
         0ITA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896016; x=1794500816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RXKLkTKvc7+/XeyXcf3gWRNGXsSdWTTIZy4YnfMAbSg=;
        b=XKqZC4ZrIihWNERfWnznoAIsTdvyiNesPRtIgvoY7GawaqFyEoS9G5/oNSixG5DS4E
         mIZsJWfOqLvhCxcspGUC0xNTa26nmzUytO+8Qim+qarwE/fMPJugG1xBl7YYTM5/zuQk
         M+ohKGeHV7IMRgDuz2OcKXlPC68KOgspbiuxzXiklhnYzwGVG/xTgrjGISTLwc+QW+OY
         Tjp8Lmss3/uifjXs2Gp9Syx40q5kzFcwOgVW3Fntao36O7tJo4iTROq5HGpB0yr/kO1Y
         vpSMf4Evft+0gQcsaEQj/f1iWQPgrfa4hpWZPR6nklUnIxfsySWARMvZ2JeOA66avovq
         HybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896016; x=1794500816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXKLkTKvc7+/XeyXcf3gWRNGXsSdWTTIZy4YnfMAbSg=;
        b=SNRba6+nIjLCwmqxTbTnSK/EB8Nx1NffHLCN2DubGUkyV5F5mRhNBfLyOaGTHuoKn9
         sV8UVVXgHKz4d0gHYbOp0jOUAyWk+QhG+O9Y/vCokhYzC4lUwXOTSRM+fM9A/MIfACtm
         nAmMtAAIeMNRI2aj6hZpAA0L7dQp6gLzRcGDdcGh8SB89+hvIochx0tuxp6ewAWHC/uD
         v391dumdsQoVhQ9vxG/VIxokXxz98L0Dr5BiUsPPhNlSEFPmGl5aDboVEOA3GYnyNAFp
         zsFkzAYyRcaou0mxGCbr0QnH+/8YO8iII9DxaN+XnPkA7v0xaJoAv74+35aM0uWp2F4Q
         9yCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbaVHZCJtePw+forRI6LUHIOHXwBQfOWp/8iNEGj0BiQmzTGMh3fbE86WSKjdRUn6+FNFCG7989+EGx0M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bcLsZKMJU2wctde4T160QHDbVLfIxZTBsB8SXUISH364qk2y+
	voAv/iATowZRP8lRQSys5KDiKxUgmKxJQt17jmY84frb/lB9OfRGC4tB4H6/jn+QcVlg+A7KyNa
	I/ljgdfSoqKO2+nRvZx+0WYo3t1NIuWY=
X-Gm-Gg: AYBFou0NTXTnjbzQmGy4O4FgBLYv7Oge0Xa9+FG5eCs8u0dklWyhFmgy9/CTda+VfxL
	6YkNzEg3SBLdUxSEcwL0M0A42k9u0uRqzhFp6qbZ2Ks/cEO9+/beThVHaUYUXImlPqk2W+9HJty
	zbnHWzs5RlKRTzwyoMerBEorPSKyCYojxRVslrdlPbb3gvdK8KcdWFxweHzKqiR/gzRwJkSN48k
	qKrCySl2Jcpj7ORtqCJvj6bTF9+wGrfs7j6NHsOgBJVsPrslg5YEmL47Yll6wI0cNaI035YLUI4
	mlvsrz5g+hUX4kZ3bNjcyAXrDGXCEPW+K6B2w8hl1dFy5Sy55YeBNXj4errvFPgEHONvmf9PTi9
	CKMvpj6CtTMraHTByF0zaHpti5QxZhDrdRUXn4hW/jOqF2UmNK7RvqcLam0s3k6huU2F2tkB+gK
	TTTx9pDJeWCVlOat1WPsZss/VUIPviizv44FwSaRG9fjTmjPwIMwuF
X-Received: by 2002:a05:6000:400a:b0:48d:cda6:4dd7 with SMTP id
 ffacd0b85a97d-4927f78fe8cmr3795f8f.44.1793896015686; Thu, 05 Nov 2026
 08:26:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105155032.240457-1-alex@ghiti.fr> <20261105155032.240457-2-alex@ghiti.fr>
In-Reply-To: <20261105155032.240457-2-alex@ghiti.fr>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 5 Nov 2026 09:26:43 -0700
X-Gm-Features: AclHuK8sRHnPT3t5LKUKIDgVvInf7cfuedQZ01ChQHUhD1OG9l446H6tMb9bWpQ
Message-ID: <CAKEwX=ML2oK4+8aaz89GFNgq=AwmEdXusG_EtkDNY8cbLbGtAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm, swap: only prefer nonfull clusters on
 synchronous devices
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 8:51=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wrot=
e:
>
> Commit 9a42aed48421 ("mm, swap: prefer nonfull over free clusters") made
> allocations fill the nonfull clusters of their order before taking a
> free one, on every device without discard. Since commit 3cedb745d354
> ("mm: clarify the folio_free_swap() for do_swap_page()"), an exclusive
> write fault frees the swap slot, so a workload that rewrites swapped out
> memory leaves holes in full clusters, which then go back on the nonfull
> list. Reclaim allocates slots one folio at a time, so a batch of folios
> gets scattered over those holes, its writes can't be merged and it is
> written with many small requests.
>
> So partially revert commit 9a42aed48421 ("mm, swap: prefer nonfull over
> free clusters") and prefer free clusters again, except on synchronous
> devices like zram: they don't merge I/O, so the contiguity of the slots
> doesn't matter to them, and filling the holes first keeps the free
> clusters for large folios.
>
> Fixes: 9a42aed48421 ("mm, swap: prefer nonfull over free clusters")
> Suggested-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

LGTM for the most part:

Reviewed-by: Nhat Pham <nphamcs@gmail.com>

Quick comment below:

> ---
>  mm/swapfile.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 189f04d8838f..1c1b5d0b724a 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -973,6 +973,17 @@ static bool __swap_cluster_alloc_entries(struct swap=
_info_struct *si,
>         return true;
>  }
>
> +/*
> + * Prefer a new cluster over a nonfull one if the device needs discard, =
to
> + * spread out the writes, or if it is not synchronous, to keep the slots
> + * of a swapout batch contiguous so that its writes can be merged.
> + */
> +static bool swap_prefer_free_cluster(struct swap_info_struct *si)
> +{
> +       return (si->flags & SWP_PAGE_DISCARD) ||
> +              !(si->flags & SWP_SYNCHRONOUS_IO);
> +}

Side note - I wonder if it's worth it to also prefer non-full clusters
for zswap as well?

It's a bit tricky, but I suppose you can do a best-effort check of the
folio's cgroup's zswappability?
