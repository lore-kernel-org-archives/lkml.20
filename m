Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9E9440A09
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543404; cv=pass; b=UzKL7K+r9lqfMZSAA26AujpcJM3f81k3R4NhkLC6/jJoCg1wTAl6TINrySaQZsa6yxOIv0YZZjSrAWBQfsA7jmSb5en8QzB3PJXgRpBdCf7XkHWL3rs+dMtot+sizWbrFKARNGV3D54aSwCXp6LFyW5huiaDGmk86MdLbKUSBOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543404; c=relaxed/simple;
	bh=v/sp/qPGCVSsES825gOzfHx3X98A9RP4UPRlHDoZ+5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MhsN33/uCInCbtB0Ew2cd4Eubp2mucyvccmu3FvmxI3Pp0LR8HblQ0+z8uD3abcq8DKRal1GrM9bZzOjZZrxr+jlEEuznMH/KtdoMl3050XToCJrcyPGCaFK1xj3NFXemrvdaaudaRAa76RTofxAsw819dgI/bFsam9CwcngByU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNFiI/B8; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNFiI/B8"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso379374a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789543366; cv=none;
        d=google.com; s=arc-20260327;
        b=bJp5i+YPg1F5gtQhaZxx+Z3MA/Y0NlHd6fNdF/YHhkL28dQCtbH71yQEE1ty3IUpRe
         6k5Q8C25LLeSjghPEntrEDH8HEBfb+gE5/zzyv8ySWSY3BxtjXi1COgF3MSq6ahqhyc2
         O7sVIxEG1v6hugG18f86HqFl/WlJSframkQNjUv1TSAck9p6u8t4rXMapjYlGYHOGZ95
         baviF+7ud5QRaB7EpSG5T+ziknsL4o02HQCswAG4IYkg9BeyUhCLkGkOviNGBaz6yzKE
         jIR+QZhb+4i6eL2vQgm8tW/QFCg6n88pUkxyoskK2B7l1w3J5kC6ZrIaqdnz51gxjFmx
         0vUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s+Pnc7qVstxJgUb+1pauRHnxHo4hAE5BG/iGKWeGubc=;
        fh=UzPr+iqnScDq8UoQCgmhWb3L6E2djjKynfTVAJnc8/I=;
        b=VDLTv59SVPU6vWT9wuitC66BOl89+/ECXfk9LRb1GAvSwPTUpzpugSUaNwduuJ21fY
         WC6XbxqmXVCRNBFD9z1Ogp9/oNsSwyHFbvYqgFS1yhoJSZizWXWjct/sdOxkYSPgHGpp
         /PrEI41kXYimT94+OQ+t0ge4JWNqd3AOSOQ2eG5japJzzD99X5ZCOOSO1EcuMxCuK23m
         ypKzintdO2TAxHzJfY4cykDfPZ8oaC6LKxq7HYMUeLyVolUPsjFOawlVfeBHXxLvQqUm
         ZwCjBTw6Zg7Yr+tXaG6yQsKGprAZxjCCgo1oN5Gh611KjyWKVzMk/wEWRZfIpQ/Vt1JH
         iiqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789543366; x=1790148166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s+Pnc7qVstxJgUb+1pauRHnxHo4hAE5BG/iGKWeGubc=;
        b=UNFiI/B8qoCU1DapmfT+sDlqPZ4m9sLOb89TFfWp8ZfOBL+7x+0gDKb+OTXHt7LpPx
         31IvYfsJU2Pw8CaaQjqQPSOtbrBRdvBlZBKTe8U9RAHN9dqzXx1BI4SajYKJYP5plYOU
         tHx4lv4p1Jf609EGuWhfb/PHQJeWsc3OHp84fDRKjkpFeRAXWfGv3tUFCcUpzHRJwMQ/
         GamlEZ+//JbJNLwnIvrFoUYjt1InhzO8TuWli2KhGilPTRvpiLBxJk7i+0uthHhtieGa
         2afWA54QhLFID/AFhK5/t2vQYj5yckHAFkQUuRupcgjqkQRydfTshDgsvBsRUbj/X8Sp
         4IfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789543366; x=1790148166;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+Pnc7qVstxJgUb+1pauRHnxHo4hAE5BG/iGKWeGubc=;
        b=yksv7bqKa1Aywcwi6N2x/y+VByYzIXhtPAacey86vRhTx4ILVd9eU9WjFPzV/YXUVB
         UcxoV7eINfckpZ8QLNVRXq6ioTdTNgmkzJ63tlWaDM+lgKygPG2WcEcE1ZruGBn4PFXR
         aroiIGxvyfVengwTSd4jLNR9vkQI4LWfqWkcpCCGNLyr1/Et/+6MEE4PW652enD39G/E
         7nsi5/ixQfqGygLFMg2ScrX5fFnc3IAniN087EIWfwfwQP6SZjQ8OZ2O/MVxFgIe5ixh
         Qp5wv03gXnbDVgLZKJhJzaTQVaIF+l7Oczsrx50FCUqP4tVy1pA22IHqmCJoZ0WAwDNY
         eRCA==
X-Forwarded-Encrypted: i=1; AKwUvBz4Y988Rq4TWaV1+FTh8FjCXK4I1K5NGj9xm2Jh2/QvxCtbyoO0+GNte/rkRAobO8etLEbO3Qd2btgw08c=@vger.kernel.org
X-Gm-Message-State: AFuF++n14soZuFnb5tMndc7YIuplyV/ZuS3Dl2ncBROAL5RsI+zlQofI
	oe4XTmTCKRjbWtI3+/+VRJ9D1EmNXrJSrYhtWyKIACctUr1QpcIa394a2+aMThnX0SI5Tkqco9b
	NJYJGOeHDS+jTOJzNVDVjBKxUK7irLgU=
X-Gm-Gg: AYBFou2VqBY+dZdykqS1I86CxAcKNlOKqWoh6NOd3R7I4ECYjiWR29d3dBAWc3Xg4O3
	p04VEZkxrNJ5BAyh924wKyHjIjELUU5gz3j3MfwqzYVs0LXWyk3FAgF1FHaxGzfADNkkFPlz4rc
	qOcO0stZZvrX00rH+68pT6uuxqHlL8PX6M+19OhYiepPlJ3fUpvQAyR3rHuAdLy590vqb26X1Bj
	iR3RI7iG1woD+aK+a5pUF9ukZVx+dF4eVDtNe4jHYeaMlgwi/b5KooCleR/DcA6vS2PlZc4Uvub
	4nLBIf2+c5/lcf9ViCjREdCPr/PKki8znot10uAk9e0FG0LrNF4P4nwDN4wb9w/lr6qLGHA+KyU
	G8ZtECyZ6tdI/fDa6tCrxchBNmBnDpuZu3gyUVRD22iYolDOhTriTrDfIXA==
X-Received: by 2002:a17:90b:39af:b0:39d:f247:bb3 with SMTP id
 98e67ed59e1d1-39e1e4b0168mr3646797a91.21.1789543365922; Wed, 16 Sep 2026
 00:22:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915160207.2952-1-dmytrokoziuk68@gmail.com> <20260915153542.3b9afbd00f7e6cea87a3350b@linux-foundation.org>
In-Reply-To: <20260915153542.3b9afbd00f7e6cea87a3350b@linux-foundation.org>
From: Dmytro Koziuk <dmytrokoziuk68@gmail.com>
Date: Wed, 16 Sep 2026 10:22:33 +0300
X-Gm-Features: AcwNN1W1l09nB0LfeekZ-yb_tFsOsztqosXb-8SnA5PHNdJWCVOsJr_2fBYC5WE
Message-ID: <CAO63FDVJaRzwE_z4-Yd6Z8fZNEGQyx=YbeFatBN30d9X8SYLtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: kmsan: fix iounmap metadata teardown
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>  AI review might have a found a couple of issues - please check?

I don't think the patch needs to be changed for these issues. For
normal iounmap(), the
caller must ensure that the mapping is no longer in use. Also,
the x86 implementation keeps the virtual range reserved until after
kmsan_iounmap_page_range() returns and its TLB flush completes.

For the kmsan_ioremap_page_range() error path, the mapping has not yet
been returned to the caller. Cleanup and the TLB flush complete before
the reserved virtual range is released.


=D1=81=D1=80, 16 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 01:3=
5, Andrew Morton <akpm@linux-foundation.org>:
>
> On Tue, 15 Sep 2026 19:02:06 +0300 Dima Koziuk <dmytrokoziuk68@gmail.com>=
 wrote:
>
> > While studying the code, I noticed that kmsan_iounmap_page_range() call=
s
> > __vunmap_range_noflush(v_shadow, vmalloc_shadow(end)) inside its per-pa=
ge
> > loop, and does the same for origin. The first iteration therefore unmap=
s
> > the entire metadata range, removing the PTEs for later pages before the
> > loop can recover their backing pages.
>
> Thanks.
>
> AI review might have a found a couple of issues - please check?
>
> https://sashiko.dev/#/patchset/20260915160207.2952-1-dmytrokoziuk68@gmail=
.com
