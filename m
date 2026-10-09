Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E18E3C10A8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527696; cv=pass; b=dpUNreuSKAVS5TZQbOZ3aTDMZc172T9DBW+uW18Ru/tVxODceMtgruUCsqy9VquslGGlVk4K2ewoTnwd/vxZMS8DdhhpTD+a1aDtBZ/efD2IsSdlSEBIom73xmIHj8UjAeSuKr+edbj9IRylXwAJeI8odSbb9sAKk2UIx6x93l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527696; c=relaxed/simple;
	bh=MLWg1+aSGxP17FrLZB9onzmJw3V1m89tClO4ggHl4oE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehEms/v01FLegflO8fPjNA2NSTRkB3sVDa7OdW9hqkDAZLyWQ70ABbIhTYiVuKXdMOZ82rEG3sdaGb/EDckIuOf8KVZV9K7p9CoTmsPjXc/U7vMfYR5iyF5X9mm8owE4gb9qhCsFeDeXguQ3KDMso7zdJVvEGXkD0yFyL5xo9lQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDeLZSwO; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDeLZSwO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so31634935e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791527692; cv=none;
        d=google.com; s=arc-20260327;
        b=QjVSITsMqFIkKR7eOvuHB+BhGgTdtLNCWNJsMpEhL1I4kJwSSEGLjKMY+5/LDBNGdr
         h3z4SwI6RZLOgZglf0xHE/wu30xHrnEkkdzve5fv6wVU89VFAoLxgU4cGneKMacklcfi
         mM4N0ROuOi2p1eKvIvvQ9OuD5fpaqqW0L1Qjinhe5i9oPpH3vZO32DIkR+x42SvGtWjZ
         VguXrkKnvOWq3RwOsAGliAfdEZYc/cVf0t/m0A0ymdZFw5IOHfL7ZAVBfdy7ZOSnqiSL
         1WWpbhDIj4Z6TSjGMLFreF1ggIrLaP2SJts+HIaIR1rFge6RUZIaocmMHM/QLYkTr+v2
         NqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/FPgtZeMX9AGe2HbHCGRW/KD//MP8quxuz9bO2dJ3o=;
        fh=8JFZpS6E5O7i4DVNaTL6bGejamJJdvmcFpqJY4K7Meg=;
        b=U5okYrwC5DgzIRrvB/iE6nNGbLGXBZvlkn60B85HVQ0UbpLTJ4RWVL99jyxZma/p+e
         N6loiATN0P1gS15DivAnZ+f2Cx3tWBosmyMo06PEk8+UFttx0hqiYhKoXYYoVXWiiWQD
         kgAmPx4h5ZDrKywmiSxcLwPr3cofpCXG0LkP32FphQsjiHANG/ZXq/LUwcecPid/Dj7o
         XvyYvHt6QF6z227rDGan+1Q0gXsooREfauHdkrI4sTEH38tYxm20ifOsRmEyT9Wb6/uh
         zWuLQk98qGlWXlgoECyKoz91GERcEE2+SMvog3WIia8ZXDz5jhsO+QkNmUrzEGHAn+pD
         W9SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791527692; x=1792132492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/FPgtZeMX9AGe2HbHCGRW/KD//MP8quxuz9bO2dJ3o=;
        b=oDeLZSwOZPl5s5SGL4X3OKt2mu26tgzdg1rSFHwfVNqzIi/xPtZrufy+kqidYHK4Kg
         /0hGSfVTmi6xmYvYz3h/1CdUTe7FFBx+43qyAAGcJL1GiyYIV+3ALVTuu//Y/fOn8fU8
         UikRx3BicoRH9iNJA50IqTVcXZC/9wscAqZ1UNr0mXeoC0fz9gMYEmvpNo09jVbaJjXt
         e/PBVdiFBtSlhlynP9FnUkdjN7Y/iOT6OxR5FXv+FVN0tJMHz6dDqKwyanUxWwztvfI6
         +Q3ql/WJUDrfGTAkIBIrBV8OWqDMuT/IPMPIhObDxWVGkkHMn0gYmIDXu/RpHxmVDMuR
         XC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791527692; x=1792132492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/FPgtZeMX9AGe2HbHCGRW/KD//MP8quxuz9bO2dJ3o=;
        b=IlnBJLZ60l3L7QkmfTd63/RZzEQ49va2pvo2qynYJ0yHG/6XmwfNto2ZRtNG9KYc0g
         dD5+sXbY5FxtBRl0U6yYYt2KtKiDb8EztOsLksRuDFx8F8zFZSlcz7JwLBQX665vx1cl
         uyod6Z4BqfPUNFVFzrJFUefL6Dnkfb6v00tmvyZm+8JqlQkvQzKxGzdhAXGol/lpzgVG
         GKv8i6YxLhxlX+WrGqF5noWPfPJgg88h8uNRR7A47fuSyJUToluXrGh1U1A1hZBO4xol
         dEi2dLJaL0AuLxamt1fm+c3MCPcl+gfLcOC+mXYD3jdd9ZriSEK0DZMs5Pl0IDduSscE
         1i5A==
X-Forwarded-Encrypted: i=1; AKwUvBzWD3ooMmDx9H21qpk77nTtWptlYIs7I9/LVzE7TP5s2ZSCD5KOvPD0JoyV+T2DxAa9ZOWHFRYhxADa5/M=@vger.kernel.org
X-Gm-Message-State: AFuF++mgA+fnVb1ZcLwZ9/iypG4JCzG2iv6Jx29JPs31X9A4Tus/+Py/
	ZubuGSXu+AMtAvD0mOFj4Y3XchZpknunJdcf8OLLc9p+qakLwvuEmXpwVG2ZMxhpSv/ftJRCp3Z
	5YIRxLdiJ/ItM6EqoNvcLh9doTWMwU3o=
X-Gm-Gg: AYBFou3OdjRN/LYl5MF18lgqPdqkwTQEhsv6MaVTpRRfNXuPuW9IfGK7rDYdqFNQK+x
	Pq7V2uWOHdHhOi0v6N2jYxdHs/XU9iGAYvCMrC07Z1qSzyiYyAX1v0x3JeaeKyzN83XSDB/Yutz
	546YMx6aRSL7jPBQuqcN2+H6ipBDvlaEX3XKu4kXEUz3Ohggo6uT/tp1XxCGOU0jgnZf+6fLr2B
	b+ZDtZoX+grkaUD8sqByqpYfBXMi6ePSwSSScEWTXy25WY3yJlB0CfK6dw4Er48hfjYm5NmBRwr
	h7mAmbULggxbqsYOHG1CoIewYl+7qRCg851Faw6sSxABjC2EPWvXhulTP7NOClEQtyVuG6bPJC7
	7EhERYWUO1nv8
X-Received: by 2002:a05:600c:3ba5:b0:4a1:70d4:c69 with SMTP id
 5b1f17b1804b1-4a18e4c03bbmr15672005e9.28.1791527692297; Thu, 08 Oct 2026
 23:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153507.50715-1-alex@ghiti.fr> <20261007153507.50715-2-alex@ghiti.fr>
In-Reply-To: <20261007153507.50715-2-alex@ghiti.fr>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 9 Oct 2026 08:34:39 +0200
X-Gm-Features: AclHuK99dJ221d2Hn3wf-Vc20XRBPV9xr32gHo7d1FVChelU5vepJjOhair59mU
Message-ID: <CAKEwX=Mr=9hbGo+L+2418auHhA8EUAQAKYxNhXOXP0UZ_vHAtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/zswap: batch the writeback IO of consecutive entries
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Christoph Hellwig <hch@lst.de>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 5:36=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> wrot=
e:
>
> Commit 8f29aa226f82 ("mm/swap: introduce struct swap_io_ctx") introduced =
a
> simple way to batch the swap writes of folios with consecutive slots into=
 a
> single bio. zswap writeback does not use it: zswap_writeback_entry()
> submits a context of its own for every entry, so every entry written back
> becomes its own IO.
>
> So let the two functions that walk the zswap LRU, zswap_shrinker_scan()
> and shrink_memcg(), own the context and submit it once the walk is done.
>
> Kernel build (defconfig, -j4) in a 600M memory.max cgroup with the zswap
> shrinker enabled, swapping to an NVMe partition with iocost enabled. It
> runs alone, and next to a sibling fio random writer with 10 times its
> io.weight so that iocost throttles it. Mean +- stddev, counters from the
> build's cgroup:

Number looks good to me!

>
> Alone:
>
>                                 unbatched       batched
>   build time (s)                1066 +- 9     1061 +- 2   -0.5%
>   write requests (k)            748 +- 47     596 +- 26   -20.4%
>   pages per write request    1.07 +- 0.01  1.30 +- 0.01   +21.2%
>   iocost debt (s)             15.0 +- 2.7   12.1 +- 1.2   -19.5%
>   iocost wait (s)              7.5 +- 1.2    7.2 +- 1.1   -3.6%
>   IO full pressure (s)        19.0 +- 1.8   18.2 +- 0.9   -4.2%
>
> Next to the writer:
>
>                                 unbatched       batched
>   build time (s)               2269 +- 50    2203 +- 62   -2.9%
>   write requests (k)            714 +- 31     605 +- 24   -15.2%
>   pages per write request    1.08 +- 0.00  1.30 +- 0.02   +20.3%

The improvement is pretty big, but still only 1.3 :(

Is this because writeback entries are not contiguous in physical swap
space? Physical swap allocation algorithm has a bias for allocating
contiguous slots, but by writeback time we might have already punched
a bunch of holes (refaults etc.).

Ironically, vswap might help a bit here, because we defer physical
swap space allocation to right before writeback time... But who knows
:/

Anyway, I'll take the 20% :)

>   iocost debt (s)               685 +- 25     646 +- 26   -5.7%
>   iocost wait (s)               655 +- 26     632 +- 23   -3.6%
>   IO full pressure (s)          655 +- 31     624 +- 30   -4.7%
>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Looks good to me FWIW:

Acked-by: Nhat Pham <nphamcs@gmail.com>
