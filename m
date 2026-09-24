Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9ED42BC23
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233905; cv=pass; b=cvdkl+zw4mXSKsS+j8JAzwr4aKgT6a3q4lYt3xcy4fEfASbAT4bzCnEdxKLBdrL2Hq8fOPkHxfqRjqDrKbhPAnj7FQHtoq64TAi6wRtV+blBePWjJmBnfgnlCHgHUTGrQvmfTvaxt5aA2Xpq/2DTWPc1+YB4J77Z/+CaZ8NmeoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233905; c=relaxed/simple;
	bh=I8ZS9uQVTg/RTh2r6b83ebQzg64nZ6k+e24taUncwLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G9bLOUlEfZ6DjqjB0uIaEeIhwxa+fpx2SIOqFYVNSKmZVhVqOHSja1yDUoCJvdl/8IBZLEwQo8L7sFgstSuEF0nwXiRaimTdCMstywL0R9yCochBzypiRZAoNNitnqej6qCh2twG8jhn+nEDDuxvgK96KuZ1gw5vnEgncLBjvLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IAuqno/Q; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IAuqno/Q"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so11808945e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790233895; cv=none;
        d=google.com; s=arc-20260327;
        b=g/GB4Jticc2UiHW2hu9Th1rgXRAboqdpS2UMN0ciasl5c06KnhL1ibnk3l7DBahvGe
         sKoYpH047sRwxf7z8B46M9MRFsojHQOegyS9IFEFS/QOMLhx45SRcUd8TMizfkdN8LT/
         n/a9L8tSNWlJqu4zqcP8vhoMUaEJ8nhUl6DmfqDthYSv6YvoFzeDVHSq4cWY41gnJikR
         j5x/F+EHdMraIw19wFUgEcbLHC8VdJpPF0zqG4ux9aHkmF/jSCOjuTFQBkvGT5UjeCf1
         TMUBUkZgM0tNydeABb5s9tCjcfvKxPb9+OmG8t3yZbjA5qE2MLmG2SG/RV7bFyVDZg7T
         Wmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I8ZS9uQVTg/RTh2r6b83ebQzg64nZ6k+e24taUncwLw=;
        fh=z43gZqlsFapmgLVE/NujgIRMxVLdIyrfJHWrufdtvAk=;
        b=ot9fQHeHwr48YuxvvPapTZoc0uWBnu0IRqmnuzmC0E5KB10q6GeR3lcwygw5LDDXWX
         9/IOHeEooyzxqgXgSuR5qgBf5jjSKPplYlbNIIUJrZnjYl8QR57jdx7U2ZV0NAp/Ai1i
         1wkxCQmvIapmO1/XfcvCyOkVFrZoMZrWxctfELFgnpYLCieB1IuB4X74gop45slZ/42d
         +VNrQCCbZejAnOo2hXCy4oxThTwYuX4N4hsrNQVq32bpJio0brjskguT7B6FMv5ylrLZ
         94xyZXwo4LIxdO+sF/vU44U1z64vPmay5NNW1VQ+foy06dQbVOzhA5D3Ljkr0GS/9pdG
         eiZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790233895; x=1790838695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8ZS9uQVTg/RTh2r6b83ebQzg64nZ6k+e24taUncwLw=;
        b=IAuqno/QAsppfXjr5pItRP0nHf312w6RO7ePQKoHgW6dMq7CpundioifgnKWYAxOwT
         UZCuVi1akY16NUQLYq5gIfFkEZp22V1PuxDmN6xLI9eTRtiFx6Aetm8mHbdquSQepG+a
         +zI7ukfflLAW/bgb0aplWUe84tigpSNd1V1K+mWXu8CrQAxd98QlM8q5BOk70mnUSYxG
         SteEmDLnFMFNl3gSPe3IxqRHfP9xzvmAt6cz3Ia2a1Lc3wqhW7wrn9JcC64AF/HU5BJI
         lzE4ACf7eqMi0HkbM8sbiZuJwUm0BUmk/xbqFyxEkxJas1aBEZBMSet3h0qPad1g+tcW
         ql7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233895; x=1790838695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8ZS9uQVTg/RTh2r6b83ebQzg64nZ6k+e24taUncwLw=;
        b=fOj391AQWw4SodlNME8x1RFZ6sOSy3Y614Y6UVDc0zde9QODsm4vHMpGKcmjDNHpOB
         c6IlDziBaJzrh66CeHw1CG/Jj4lReoBH0DRPuUPIID7CkhhL4Fv9kRCsYVDyjMMZ5kGS
         2NITG87WmwbyrSiDMZGjZLj9jbdc4JdRfvZG94crBiSyzTV95WqdD8t+KAyIxLciylPh
         lp0eODzZg0ia1rMlKDyQpa6mnH/2ePcnxMX7p67H6o1IGtwwX5f8Ylab5/S26lRShhjK
         UH5P4TodZti9miyiQQP/fNDWMerVJ2Bk1g0PRMbAEENHELzRbDwfy2o8os4f78iKgWX6
         AJMg==
X-Forwarded-Encrypted: i=1; AKwUvBw/8axpcEVPACgJreUOVPhFmuYmlFcl1027EAFE/cNSI1+tvNmDjVpRYzKDH/3qm0M1/ew7vApBObX7m3I=@vger.kernel.org
X-Gm-Message-State: AFuF++n3GC7F4NNja8kvy7pno/C7F4KZZbtdnXimikKKionY5egfGleN
	xCqEHloZzSNnNt5iRQSEDdcVgP6puujaTbdiRgn8WkoHWJBLQ3RqQIr7PLz7pKEevl5a0kIv9UY
	sON2TP1wXGtjCWFYdfl9zoCt9e8LWogyE+W5sfdQx
X-Gm-Gg: AYBFou1rs81WlTvnm+OuoC8s+UyXjcUXnWaEqFjH+Y/Faq9ZQU4xgSks6PM9vwEXiND
	tTrXt7+YVXb/jSZ4ciFSwPV/tvRiwKgcT01WKhAEZ72fBJO7CMZNzwAiLmLXnyf79Nkc1sU3KNU
	v71r4f2jmRl7YWxmQs7EU3L7RVS0PVjeWkPRS+NxE1Gap32d+JOCKAjolfN3+XjOfxXMO6IVQVL
	nzQta7hY7m2zgQqVXeyuO+jBsbawNO70jZ5jCjLQzbQdQjuEDbYEKrD2xMk86vNaXKumOkuxhDP
	64xJt4bhBFavBXsVkoFNIYvOyHAPuuS7E/OqaOL1Ase8dgkipXlN5eQxPInYZAN/lTf+rqXy5NA
	OL/sXy5TLmeWtTku9kbdMCY9ls9rwRX0p
X-Received: by 2002:a05:600c:8486:b0:49e:745d:c317 with SMTP id
 5b1f17b1804b1-49fe66b426bmr22734545e9.12.1790233894197; Thu, 24 Sep 2026
 00:11:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-b4-gpu_info_zero-v1-1-7259840069c6@collabora.com>
 <CAH5fLghN0w908Z-MYDfmaeC7gvAB78MMT7zg599=1kU0HexkOw@mail.gmail.com> <arRua6cN7FXIDOvF@um790>
In-Reply-To: <arRua6cN7FXIDOvF@um790>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 24 Sep 2026 09:11:20 +0200
X-Gm-Features: AclHuK_E9AAemunGDpBVxiUGy0rHsdGrBH4aZK_TH2BuNmOFFvcup1Ldi-77Xl8
Message-ID: <CAH5fLgihqM5WcUaQd=WTUs6JhxoGyn-m2N1kkrsNvBXShRZWHg@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: gpu_info: zero out new/unused fields
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	karunika.choo@arm.com, boris.brezillon@collabora.com, laura.nao@collabora.com, 
	steven.price@arm.com, liviu.dudau@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 2:27=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> On Wed, Sep 23, 2026 at 09:42:23AM +0200, Alice Ryhl wrote:
> > On Wed, Sep 23, 2026 at 1:16=E2=80=AFAM Deborah Brouwer
> > <deborah.brouwer@collabora.com> wrote:
> > >
> > > If a new field is added to the struct drm_panthor_gpu_info in the pan=
thor
> > > uapi, Tyr must initialize this field or it will cause a compile error=
.
> > >
> > > To pre-emptively avoid compile errors, use ..pin_init::zeroed() to ze=
ro
> > > out all new fields added to this struct. Tyr can subsequently change =
the
> > > initialization as necessary. Also use it instead of manually zeroing =
out
> > > existing fields at the end of the struct.
> > >
> > > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> >
> > Merged into drm-rust-next, thanks!
> >
> > With regards to sashiko bot, we should look into whether the
> > MaybeZeroable that bindgen adds to structs applies on this struct. If
> > so, we can remove our unsafe impl block. But it's not an issue in this
> > patch.
>
> I couldn't use MaybeZeroable directly but if I add IntoBytes and
> Immutable then we can stop implementing unsafe trait AsBytes. Could you
> please review:
>
> https://lore.kernel.org/rust-for-linux/20260923-b4-gpu_info_intobytes-v1-=
1-bb2173f91e11@collabora.com/

Oh, yeah, MaybeZeroable isn't the one we want. We'd want MaybeAsBytes,
but I'm not sure that exists yet. I think we asked for it, but not
sure the state.

Alice
