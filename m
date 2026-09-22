Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5857A560ADE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096863; cv=pass; b=WhlZbjJ1gtkRnFs6JnavOO/pSjXnRqdPZ9ZJDrsFhuV5szJj4uj3s6os4dPtRr9ys8I061wYnr/X43zMd2/NeaNZml+5WnwLYpYI3egzzkUkv9XeOBI2LfHPVAHg13G+R/9ekyWEtmJ5I2fLnNQDARgd9xdiVUXtbbejDo6GYwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096863; c=relaxed/simple;
	bh=Ih6OaGZNiKLaqDnDwaBrgZoP/cAqBuRknw4NXDxmGvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2PM/R1sxmiBzYgoa7k6Y3ZPTO/lT5pAcOM6/7qlRSj9q+RDpoilvGunUiWFSHbCvV/i9R7g7r0wtFgMgsNXdP2rBs0JAGXS7w/iFqVGSvqZNxoSCgkAnusi+cvpJ6rJ18qFFuhIvh3cgyXTTmBvzOjzAXNeM84KXJiW753/whw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMEyq3SY; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMEyq3SY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso113128f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790096860; cv=none;
        d=google.com; s=arc-20260327;
        b=LWpJqIw6+27nwIntn9XGKt3YzsyBvqcj1sZ3ZH/fJn9/3HSQBM5lAwetWEVfmhDLDM
         sjmtvaBO97HzfZQa1U2A2G/35MkCEWw/TeRAAs0pbdPEYpOIzN96iQkpT9k8EoH8WZQk
         v6DvEoE3ShW4YspJ0zxIULJgcxtS+y0CZHG4iO2LcwdRJiE7KzXN/YiY5DK/fDiWWEDV
         lIDn8Pf4qhz9r9jnkse0FQL/h59y92OHMPSO6YKJDyuk5jP5oV3jJ7ggi1WdCb5UdzmX
         bpjtCNDHf8xPEOAYYOUqlL10uBgJF3Idw64FJTXM45acZXU0SutgBGiE7tPkgxTM1bV/
         JZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=abxLJH98wWB+F9upQRI+y1MVEfERsTBkUgSjrnH6AQ4=;
        fh=fcOnHAsiJ4NvfZLuGa57XszLOJUoSWJuvbFsAV1j7qc=;
        b=Zana9zlv4mJ3JRE8Amoq+f6OLhUgvcVOpen1tpQElGJiRsetOkvdDRQ78HQ4GYDtyH
         zgkeWGzGT3hcAh09XsxNUmMkF/MTJGBlatr2neZ2GzF+GClsSULTwpMLg0qBT9+YBe5B
         nex8MG7IZE9uiyCUekeuDCvzhvVbJvHaSRx/+ncS6i1sdYoMDzyfHdW5QbdaKUMX83nx
         AwXUwGWW7ETrMACMyInOJRvs5OJr5U/KEDbBtLH1dm4CGU7buH/qkzEwJcbxD1pQ+gYr
         8Lnh8Nj+TRATE9gTQ6IdhlOMOWk+oKIC2kLhECBFEzInc2cLjDQbxWv+b6U80sxjvRaX
         AweQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790096860; x=1790701660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=abxLJH98wWB+F9upQRI+y1MVEfERsTBkUgSjrnH6AQ4=;
        b=SMEyq3SYCxslonAjZZd9nKsSfq9U00qwiLtYIrEk2+VSfjFAz0u6q8l7Fx2/Eap4PC
         J2bms7Dsx9HlFOxReHsiBxc7KcOeXhRQHkRVLI6uRui01tiqFJJ8BH4oop/j8WS/TYvc
         STQxKcmHTYOnNrvrXXLMBqwkxSaWsJR7lSyZvs6gHRnf+DiiT2k1pRs5E8C8AHmALI86
         MyK1dqSyAlWya9+e0k4/E3pxSHAoDUP3axrMyoN8ndEW9cM5ZsA8VZoqu4sQwhZXmvVw
         EZ7SOsOG/FCpTWQQlpeYfCnQyIwQADldb9j1U6DLotPVFfdx7i1/3cezFgOHY42I3LMZ
         vJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096860; x=1790701660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abxLJH98wWB+F9upQRI+y1MVEfERsTBkUgSjrnH6AQ4=;
        b=VSn9jZ6eAzJgZsl2VyEQzi7Ol3SmdHYnZZM7shkNQT0Xqq5Sd875ZmeS1DlNS3ToX/
         9D+MyceJ+t3LuZXlCT8MRTOvIm63GTuNaJdE25Sc98lxCjdZl5nJljNWsofH+Bz4VHKx
         Yd8h4e2rnfMbCcabva7pZhcHMODk+tG1C/7ge15z6B80mVFMqnM97vUMOPs1fvXa1e4S
         V5VPyJCHhvXDiTbTXC7ggXLLfoUMmRLgWIrUH6c2TtCb24cQ5+AliIm0rTorP5GmnUoq
         CiQvjBNBDFAK6T7PwXi6+PqNFiFkE5zxKErnIzFTuIs1mD7Jvi4kuVkk2+bBhnjk9bZc
         sRRw==
X-Forwarded-Encrypted: i=1; AKwUvByY2ERN5ANVArXUQLzfQV3SdbG50WjVnrppMhARFvsyWelus4C73k3UZMnIlO3DFM4eR9ErGpcY4KZTpHk=@vger.kernel.org
X-Gm-Message-State: AFuF++m3c0bLjMFyWPbF8L5f7oO8pKx/XZdzvAnBO3P6np73Ampmlwwt
	Yl/GSFfwwAwpbQbB99/ByoYkIHYCm/ok8Vf7fllnRpXIT1uYRPU9AoYsCm688NqEsFlr1X/c3Fs
	rIcKIfmAIfCj/JvXLo0tYcw67B8DDkJs=
X-Gm-Gg: AYBFou2vYcmTnkfEvFQH+mIyfBRE/ZJOI8tzMkjvDEfV7PUXiCY8SKb33oFcYUYm8Vr
	lWxr58E9E3kpvXUl/BwYj2DTec3sc5R+QILTQDTa9pcFdicOWtufKp5SxosjZsU9ZhF0IGZ/vI4
	U4PpfWTX2KzQESHNxABlUm1T8hMpMnf5Bb1ryLY9blic2gtzV2psHVk/Y8La1yGlnqAQQ1TOf2e
	wmOiZoVtvqBBhxpyn+GPzdk+E+23X89cGgnbJS1+2tQ2kINoMCTXlvW/nHVEVtEYTAD0MNYfOJX
	TUR0dOnriz0f4jLwVsUNwQeVdA5pKgai1PJKXeD3k19CWTojy75Lj3fyh0Jc7TBPpAelaVsABPR
	j2pjlyusM1MI=
X-Received: by 2002:a05:6000:4303:b0:487:452:dbd3 with SMTP id
 ffacd0b85a97d-48867095690mr343670f8f.47.1790096860382; Tue, 22 Sep 2026
 10:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722163536.773166-1-alex@ghiti.fr> <20260722165907.784020-1-alex@ghiti.fr>
In-Reply-To: <20260722165907.784020-1-alex@ghiti.fr>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 22 Sep 2026 10:07:28 -0700
X-Gm-Features: AclHuK_e4jnjL37WW70pjKEDayayY4BwnWgy3gypratcWUMOYC5nt2OmVrBvIcA
Message-ID: <CAKEwX=NJH2nM=vMPk_=ugJ26uNjH4AMdHXeaasuPrbSEGxpJOQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mm: swap: overlap synchronous readahead
 decompression with disk I/O
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, yosry@kernel.org, 
	chengming.zhou@linux.dev, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, kasong@tencent.com, ryncsn@gmail.com, chrisl@kernel.org, 
	baohua@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 9:59=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> Swap readahead reads the whole window sequentially: the device I/Os are
> accumulated along the way while the synchronous, zswap-resident entries
> are decompressed inline. The I/O is only triggered afterwards, at
> blk_finish_plug(), so the synchronous zswap decompression is pure added
> latency in front of the read the fault is about to wait on.
>
> Trigger the I/O before decompressing the synchronous entries: split the
> window walk into two passes. Pass 1 issues the async device reads and
> defers the synchronous neighbours; pass 2 reads the deferred entries
> while pass 1's I/O is in flight, overlapping the CPU work with the disk
> reads instead of serialising it in front of them.
>
> swap_cluster_readahead() walks a contiguous offset range, which is cheap.
> swap_vma_readahead() instead walks the page tables so we cache the
> entries we encounter in the first pass to reuse directly in the second
> pass.

Hmmm does not seem like you're taking advantage of the device-level
contiguity of swap_cluster_readahead() either way? You're calling
swap_entry_synchronous() (i.e zswap_is_present(entry, 1)) one entry
(i.e one tree walk) at a time.

If you're not taking advantage of contiguity, just share the logic haha.

>
> Results [vm-scalability mixed zswap+disk swap-in, 256M zswap cap (~73%
> disk), Sapphire Rapids, zswap=3Dzstd, shrinker off, n=3D3]:

Hmm how do you have disk swapin with shrinker off?

>
>   metric                  mm-new    +patch    delta
>   swap-in tput (KB/s)    119247    131261    +10.1%
>   swap-in wall (s)          106       100     -5.7%
>   swap readahead (pages)   1.56M      1.55M    ~same
>   zswap-in (MB)            1895       1872     ~same
>   disk swap-in (MB)        5207       5190     ~same
>   major faults            260148     260212    ~same

Obviously this would help zswap, but what if the backend is disk swap,
and all of this is just pure overhead? How would the numbers look?

>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr
