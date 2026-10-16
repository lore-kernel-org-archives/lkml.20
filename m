Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B930B4EB853
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167580; cv=pass; b=ExkVFgfrOmsSJ2sT5WTI1U7ihEIfHBLdS1DHRPNBCqyYC+wEMkE/up6MU3jb+PMFma3iC16R6/sYRQv6JGGhJucZmfOc4rrEuLtc0o+o7x7SfWEHGkGOv+31Yuw+PJ412+FF31OmGWON2/OLtQeLX9fgsJCK34b0OcHfXhGIskY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167580; c=relaxed/simple;
	bh=1IVZ3C+nJEr3Wn1A2hkwI/Co5KZ7cTS+XVJV/vRJaT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wix5ijU+OmOWeHjAvCPeUO/WnBhOny+DgIV01Nafss5BjQgX3lg4wbnJRkYMRsAPf1lWeQWbcUdkPpKiOjATVb4zK8onVyjqpp4/5u3duDIv/sLBoFIIc79cCYk2x+pKTNYuByshgqwAOfP6F0JsSKKZ2dhurCZE+mxKHBO9N7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGnov/6+; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGnov/6+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so1147265e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792167576; cv=none;
        d=google.com; s=arc-20260327;
        b=RmmR3WAv1hEfBR39XJ77T2YqE+W/cmyDECyJchF8Kvuedu52XnOZr/E/5DeiRBVtdl
         LnuCQMuFOHHMJ3MIPRMpugwn5OVlSCoYZ2N8An/Mw4LKuDym8Ldrx+Hk/0QAFnun4+Ud
         tKK+XP14iZD8JbHQm9ODRz5xNJGKSpK7h5jbOMTE/i63tngutfssr3NuNM9iyNFPz1L2
         qrhKu4gAyKW0ojo5Y/yW4h9+gz7MzlSXFFl9yzuT0L0bXgo1O0MaQ00aIgfZ0ALNeUzT
         mF1Q43kydnDigmw8wUP1swooNmQSRal8Qk6mPlOYK1VAtXDfxKwS+baQk5WJPYwDcfuw
         rFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sknvcXuzW07rbGsF6fwWjmew1+2afMy70Rv4vHSfSpA=;
        fh=GG4DA/LjWIt1MKG6i+AA/ecSVo9j2KcM5N1TrrSs6WI=;
        b=VEl7x5HbUR2vlbs9QwWzdALGmqv1Z4vZstnKs8zlaONPnrJI9nieygEuPHXcMjT/ke
         QoeZkE+2bAayM2DjEQ9ygmbvSkIvi4photUiwdJzW/d/itLoTF+suoaG54vDhlkBxrtM
         Uvw39SFsBnRKHw+Ab9rPTFZalaQQDRznT0UuFaeaACqeVMK3BioAJcqbAl1v0ht8FKh6
         xV9CqUyc9RCVH9pJ2n5wiWA+zg+e8XezYLcQ3Xbtvoo2u+ZZVmmmcY9hu/dCOHLcN1gn
         DIUy/pGULSm/0fEW6O0cOTA4PSW3htcKxWYk5ehKDg6iodeUS86SdfV8WpanXOeMDx3Y
         DuTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792167576; x=1792772376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sknvcXuzW07rbGsF6fwWjmew1+2afMy70Rv4vHSfSpA=;
        b=KGnov/6+qBeoTtZpr2lkpBLF48Shdek1ckJ/Nade/U4GSZ/2RFa0Tm7EUeZTjEuzlo
         ITvku5nQ8MCS2O0jq/AR6NtNwzEcy9zL+zr/Tsc/a1sXNw9YqE0tn0pyWkM9Dw5nCV9l
         t/LksnpzxUOGJR2nfGwCL1tGPykMRPTxIAh2vRtgqnpFJf+q913jGRLQMl1EFjwdSLhM
         RuNpf7Ifgl/+YgjFs7Y8DQGCtAS9f8wwM5+GNLgV5iVsM3NBNKnAGPn8KWpWlosGdY+d
         OZCSIVwr5TojSe3Oo1h99OU/I57hCH0pbPaXLaRZhXJU8ZD3qt6s+jaZe4xjDLomXD3J
         pX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167576; x=1792772376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sknvcXuzW07rbGsF6fwWjmew1+2afMy70Rv4vHSfSpA=;
        b=Kk9sT38/1v/PJeffipjm0FWfvmWI5qN6OmV3AoJgCwTN2/4i95+Qd3W7PmZg/pWLUq
         Sc5lSjqprpcsMK4XcGU5JLBt7J3lUn4AfuihnjzFh9Y5MpsKMSVkjtrmj2djFCP0sihC
         w14wI6jptdLiT/bEfLq5EmkiPrN2vIAJ/LW7TormQ3eX1Eem8Fc7XCTR6Y6LWSrUlUiP
         RRCupZFzCjdu7ux28ryNQ/j8VqfEZ+vj48cktJR2zNYn06LNO97b5Sgry1mWf2hk4T2c
         1WsjdeBVZczfZjaDPDIADVjlMH8gBZ+2IsJ7O0brEVqH2iQZWEtPanoTj5WQt4FSPxGR
         PbEw==
X-Forwarded-Encrypted: i=1; AKwUvBzAmbDjgN0GWjE3UCjlgYZ500eYY9m70sKqTaKlrKoKpn53/rlzer9RslrK6a10SXUWgkghEjOkVHIGuwg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC+Y57rhVmdfVfhuaT3ymtiTZMWsb3lnynJiWTOVTbdYTMHDM6
	k03JZ0Px3OtYgvS2ar9EItPs4UFN5qthnHcNAJ/m0YBm5wrUfLyIZNp3GNZ4F3oXgt+mq9+1iah
	j4Iq2ac+icocDG9zD5sizSG/h1A7kYjvCe/wAUDg=
X-Gm-Gg: AYBFou0zhAPMW/dFAHB6kaCowWtqkhhXzuzh9x1fzTXTz5mtfy09KYgaDG60Hwk2aIy
	lE69QdStpaWfw+NqvnhmCaOuHw+RYxTeDpIpb7H4gydVrp9wSkEUDOVWqSrJGw4kh7RtxgWLq21
	PoldMuMGFU01cPODmdhv2RnlekIFK0IP88Gx+lTOMnA1xmmSTmj0Eo3T++d6zkN04TVJ+wqqZlQ
	zCfja89eJtQgem2evZ1/bRPzVJ/4IuHDNTQCMyrS+Od6UEXLWmQis5IWDtm6Ltw8C/cx+61D3LV
	hB3aawjrIjUb2ArqNDTE21I1a7O0QwbLVLTVwfrXypB5Hb4a4wzcyNZeb3zL/0aUOzSGnNiDa8v
	n8whXg/SRnXJBBylgY8BsyRrd0RjBDj5yNZQJp0SfD2Hy9zZbV4AcZeWymQLUMOcezYRLVA4=
X-Received: by 2002:a05:600c:8219:b0:4a0:108:3b48 with SMTP id
 5b1f17b1804b1-4a1d760746amr7046915e9.7.1792167575523; Fri, 16 Oct 2026
 09:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr>
In-Reply-To: <20261007153915.53429-1-alex@ghiti.fr>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 16 Oct 2026 09:19:24 -0700
X-Gm-Features: AclHuK_qydqamMBdCBeNyLTJ-3vLIcUmGK3v6Myyg5hV89s6EoTGIQhr4IJjhWo
Message-ID: <CAKEwX=M6G3NPOrGJg7Sz68BDSjzrF4R-tTjcX07L9oZ0GK4Upw@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, yosry@kernel.org, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, youngjun.park@lge.com, 
	chengming.zhou@linux.dev, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, kasong@tencent.com, ryncsn@gmail.com, chrisl@kernel.org, 
	baohua@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 8:39=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wrot=
e:
>
> Commit 0bcac06f27d7 ("mm, swap: skip swapcache for swapin of synchronous
> device") made SWP_SYNCHRONOUS_IO devices (e.g. zram) skip swap readahead.
>
> zswap is the same kind of in-memory, synchronous backend as zram, not a
> swap device flagged SWP_SYNCHRONOUS_IO so it still goes through
> swapin_readahead().
>
> Here are the results from bypassing readahead for zswap too: it was
> measured with a kernel build (make -j16) in a memcg, zswap=3Dzstd, shrink=
er
> off, on Sapphire Rapids and 3 iterations.

Would there be regression with shrinker on, when we have mixed zswap
and disk swap backends?

>
>   768M memcg (sustained swap thrash):
>     metric                 mm-new    + bypass    delta
>     build time (s)          405.0       341.7    -15.6%
>     zswap-in (GB)            79.5        53.0     -33%
>     zswap-out (GB)          144.8       115.6     -20%
>     swap readahead (pages)  6.79M       0.45M     -93%
>     swap_ra hit (%)          72.1        89.9     +18pp
>
>   1G memcg (light pressure, build not memory-bound):
>     metric                 mm-new    + bypass    delta
>     build time (s)          177.7       176.0    ~same (no regression)
>     zswap-in (GB)            10.2         7.5     -26%
>     zswap-out (GB)           27.7        25.1      -9%
>     swap readahead (pages)  1.07M       0.08M     -93%
>     swap_ra hit (%)          68.6        87.2     +19pp
>
> Similar gains were observed on an AMD EPYC 7D13 host.
>
> The gain is from no longer prefetching pages that are pointless for an
> in-memory backend: readahead inflates anon residency and thrashes the
> page cache (file pages get evicted and re-read), lengthens each fault by
> synchronously (de)compressing a cluster of neighbours, and adds
> compression traffic when those extra pages are reclaimed.
>
> Bypassing swap readahead for zswap therefore makes sense.
>
> Suggested-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Code looks solid to me otherwise! Nice job.
