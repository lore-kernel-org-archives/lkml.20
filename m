Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243304;
	b=v3A9Jf24j3gvZKQoHFBEwIQdAFbCSMtcRVknSNXTv66QXXZAJwLAJONmI0ePepDcZeAa
	 7SwpBFfHow4/Xew8OcoPgI+bAxHWX4rEvEKzu/rZGrahIi60kicAXrM6M4MMg2C6/zquN
	 hDp07X4Ilp1rCUBLSPqWGnxcv3pK2CZAnuHUXY5fOKQtC/EiIf0Odc4wLt/5DsxZNzgfb
	 u2bF9XVtYketIpRK/bnu/lx+Dlhs13uQyl0n4Ig70WYjIL7t09Oq1XP9980jDfhzNLEtH
	 GcqOzw7r8HJ0PAMZ77mfHg1oh/4ork2Qb1xptYLZQ/Fe7s26I7Komq7XZ7u0/kto1Tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wz4f5GFlzpgFeRAMcKCd/VPFtcaIvfSeX5hY9+feV80=;
	b=ssdHfhQV1wQDwAUAlYqGDzdT4ZWWN3fHI2NcTZpaDmtBgOltoXB4B3jUpht8yfJnhGqO
	 BKEq+z5FDF4558uO9pYYjeAU6/Ed66RukmO37EO4NTI1DwZZcnAAQNn7p5zuCdr7kcKfn
	 zbEq/n3xnlQ+n62CH6bhS9NEa/Yel4ZxagLHb8S7gLtIjbb2JWtjooozmoWN4l8pJhWG2
	 orAMBiA/s0wPf+RtSZnZ2lKnTMmw0ApyWLQPxUtUhfgj461QSc0np5NJSUL6D20Kr6LkE
	 nlSj+ba+Z1woEonBK+8k5o0PiRNXCEdgEoMiCxSAwOqIt2GvhrBCLro7cnJmSiCiAbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFdEGxdd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13399606A8BF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13399606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFdEGxdd
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c151178f0cso713829e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:55:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794243302; cv=none;
        d=google.com; s=arc-20260327;
        b=KDUeczP2hcIATPZ6QZsx5ewoI7K+VpXcrJI7PUQSmH9Vea9EwXa9BuVteEt4DgbJzI
         d7FXRE+9GlhwaQfJyBn7gJba3CIStEHQGxAje1jWe0EBwYaREEoI9TT9eCg9t7n5OBiT
         UevqxUZa9jjYeijcNTmc7uYpljIjRzPn++xvb1V06HC+Pl3sIFo+ng7fNKl28QJX28dU
         RtNjHWGdHYJS5SuqEYXOPGq4VqibRkEaewOWioPg3oLErjTUg3Ggl3mXpp0dX7xTg4pN
         MAELkD0MwijISoU2Qy3YsghHs59zO/pfyJBTuNRuamc4HH1egUoLEyxtF7ZO20F9GKnG
         N8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wz4f5GFlzpgFeRAMcKCd/VPFtcaIvfSeX5hY9+feV80=;
        fh=nornPS1ByJJ2awNXl74RVgzqGGAViBGYCouVGBjEo70=;
        b=E7fk2bNc9mU5z5ErYLfV1v8DKS2ozztBeDtUCPUC4F1Mpqr04qyO0+3ElNaxRWKYIn
         oW+SrtKtBY5DlL7Y0LT+WegoGghIuXn9mzpSe/flm17DJ/pn7ukBYqbKoURbqnvH07aj
         ZXuM4dUYCrUQFrTElHENn9QQ4/HMyT1OP24f/8ONGZfkfb2qA0sjsdtgzGZg44zP+SZ6
         jvsyXqcz0vTQmBuyNvQxx8jZphN6hnm35YF4/KYDacIrm0g/9jIKoxTbEgBAuVRA41Ae
         k+EoTRWw5gRXIw9AvKtd6WVdg0rmHIAZSrht+7rjAo6ydMaQje5b7gy1sb2wBU2byrxS
         R4nQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243302; x=1794848102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wz4f5GFlzpgFeRAMcKCd/VPFtcaIvfSeX5hY9+feV80=;
        b=bFdEGxddJqX5BX4pwqZuaRc/MfV48JNSBFpxk4lB1VmYqCeTysCvS9snhTAQODDh6J
         5D+Wea3NHEWipZKvkX4e/EjeTlhKaw4Xh3bqaw9QtRRAmQ9l6897uN/53suAnXBC1ie5
         o/s2W0ShbqiPSDJbs9QbPejS6A9g6icC8el1xJKwMScdoIslwfHhJscdHN7byv1kjjKn
         7TVgMUqPcG7wyThIoSBew9QegAcvonf7aJ9TF2dD7p3a/KG4HYOlvHmAjwid8lN0P2k8
         cRaSGgq5SlfleS2oTNBm8zUjZgS8UvgNSHpExuIlf6wlBlZQ7fq8u7a8w0s+Xvx1uXhq
         CRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243302; x=1794848102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wz4f5GFlzpgFeRAMcKCd/VPFtcaIvfSeX5hY9+feV80=;
        b=vA1JtRlTa5ZXBGgyXRM2IA6YyAxY72xvYz12tx1NnnP50YQcgiS931Aszwfqzm+hs6
         oRVqATDXiFrceqnQPwvZNdCl9gdx/i/Hjfw47Jrk0dfXFtGMDrdn9daedgijELgMsqZI
         9cnDz7FIYN409/xlVed7AWfoxPzJm1POSoBVEKvHeCIG+4ZcVm9PiraLTUz5PvYcehvc
         8J79ZCboqbnH/3Ve7z5dref1EHzKVLkMkJGMpCOZMfZYnIrRvMKfclwPOy6yXJNsx20p
         0O3HRIU7k+fomP0W5qOLROBsHvgAU4pobS37Pec4RBkkL1nzV38Y/wrxa0E7cV8dRkJ2
         b95w==
X-Forwarded-Encrypted: i=1; AL+hErFNqGPL6dsE4IQwBnpJSQ+knyMV+MZwDC+KBCnV+5jBs9qZWQyyldlz24wW0VFfH6qUOP+FOAHZ4DDJlR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AiNdlGEZTtBQmTUN0a9N75NG/oGEzxH/05bJ1pY89AEGj7RRj
	ctXEFIEiXwsJ30H+5T/IOJpm++qgdoIX1ADuevnDljcPeT8Xcb1TpAcHT6aWC9xcT+91G3bnI/e
	WOjr8r4YNhFSfyGAOBxroonUWmlt563c=
X-Gm-Gg: AYBFou0wL0rujRTKjCHkrUrFGmUIk5xy9SW4isGs08zck1CIGJSJhHcqtP0bUHmFMSg
	MTJutvQlQYy2QoOTKtWtiw6tV9tScFyWeLuk+/w72R95d48AUud6Z6j/nZE6eMSCe9ctlGsp6pa
	ZPkmam2LSZR0NtQgGPZsWYAneCHAS3joVq3bxHyrINqFCDnap0QGtNykRJR06OfttWJjMzY4Lyh
	sqhp3PnwWB6GKWvDCzRYrIWxOfgkjYA9y04cShoZnSHtLuTHm6XptqBby0jir63EIM7+awGHmlZ
	BgREEPowS2Q8T8z+LL6TThGX/erpSYn31iyrl8Y+jOx9PjlENzig+ehKXfxBBscJ+3dN+BER0n0
	2BToJTHPL3a9oXtCrbFERGu5znwMChCary2DZ4zm3uRP5RtVwoFFBfUrMGtD3HEHWyf5wfQQkN9
	WM+4q5HwCnykfz32r+6fwQxbHPmhxt/SPRmY0Njv0eMMnATB8r4HyZ
X-Received: by 2002:a05:6512:39d1:b0:5bf:d54c:1fb6 with SMTP id
 2adb3069b0e04-5c14c0269fcmr1310915e87.44.1794243302053; Mon, 09 Nov 2026
 08:55:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106160432.2552507-1-nphamcs@gmail.com> <20261106160432.2552507-3-nphamcs@gmail.com>
 <CAKEwX=PiM8vc27jOVdinOGO9AdCOpbKozu=Hj_b55y10-ynFyA@mail.gmail.com> <CAMgjq7BuAKZ1BjTmdTmXHV+SZCpGMT2YL+q1qvbDOSeqYA==Tw@mail.gmail.com>
In-Reply-To: <CAMgjq7BuAKZ1BjTmdTmXHV+SZCpGMT2YL+q1qvbDOSeqYA==Tw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 9 Nov 2026 09:54:50 -0700
X-Gm-Features: AclHuK-YPpD4TepwOXmHYRcmkMcbFS6VvgciVhmro5ByiYQtUy7Yf8RUTGbR0xc
Message-ID: <CAKEwX=O_wiq-iYhLrw_zVFuO-cMigoSF_zmKYAQtcGFVj2BmKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/swap: publish cluster tables after reacquiring
 allocator locks
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, axelrasmussen@google.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, brauner@kernel.org, 
	chrisl@kernel.org, david@kernel.org, hannes@cmpxchg.org, ljs@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	shikemeng@huaweicloud.com, weixugc@google.com, willy@infradead.org, 
	youngjun.park@lge.com, yuanchu@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 11:03=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Sat, Nov 7, 2026 at 3:59=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
> >
> > On Fri, Nov 6, 2026 at 9:04=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wr=
ote:
> > >
> > > Under memory pressure, swap_cluster_populate() can publish a table
> > > while its locks are dropped for a sleeping allocation. A cached
> > > allocator can consume and free that table before the populating
> > > allocator resumes, leaving the resumed scan with a NULL table.
> > >
> > >     CPU0                           CPU1
> > >     swap_cluster_populate()
> > >       drop local/global/ci locks
> > >       allocate and publish table
> > >                                    swap_alloc_fast()
> > >                                      consume the table
> > >                                    charge failure cleanup
> > >                                      free the table
> > >       reacquire local/global/ci
> > >       return ci
> > >     alloc_swap_scan_cluster()
> > >       read the missing table
> > >
> > > Keep the count table, cgroup table and zero bitmap private until
> > > swap_cluster_alloc_table() restores all allocator locks. Install them
> > > under the cluster lock and retain it through the scan. Initial bad-sl=
ot
> > > setup takes only the cluster lock because the device is unpublished.
> > >
> > > A stale reclaimer can return the isolated cluster to allocation while
> > > its locks are dropped. Abandon installation if the list state changes=
 or
> > > a table appears, freeing only private allocations. Restore locks on
> > > allocation failure too, so the caller can return a still-isolated
> > > cluster to its free list.
> > >
> > > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > > Link: https://lore.kernel.org/all/sashiko-outbox-181084@kernel.org/
> > > Link: https://lore.kernel.org/all/sashiko-outbox-181086@kernel.org/
> > > Co-developed-by: Kairui Song <ryncsn@gmail.com>
> >
> > I think I need a
> >
> > Signed-off-by: Kairui Song <ryncsn@gmail.com>
> >
> > here as well...
> >
> > (Kairui - up to you if you feel like Co-developed-by + Signed-off-by
> > or Suggested-by + Acked-by is more appropriate here. I just filled in
> > the sketch you gave me.)
>
> Let's go with Suggested-by then :), I didn't even check if that sketch
> actually works, so thanks for taking care of that!

Okie dokie - will update that in v2. Sashiko picked out another issue,
so I'll use this opportunity to fix it too :)

If something sticks out as obviously wrong to you though please let me know=
!
