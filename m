Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446DF4A3417
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857384; cv=pass; b=BLqqWytyDGT8F4Dpdyu5xDtLSK+XIv4VHvpG4N9fJJRR7laoAHJq3tJBgwLzaKJnlfZyE4M4Jp1rbOROtbzNs2YqNt2yShDJ/yixb/j3IJdMz9JVTgFG8hwZT59oCS1pqldLGw/0GSQEfxI2oZz9n59CUfLS7+o0K3FfAXIWzhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857384; c=relaxed/simple;
	bh=VlUILLLz6j/ItrW8OiGkI/9S62d/o220tqGa9E3WryY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJii803d0eqZmxzo80Yd575ax6pHQwkYz517sYLyvdVt1Ud4MDxdxmVG17eTA4uJ4bRGsNJpOypZ9ZKfXKcrdHvg2nag5Iix36Ab1yRI7TWMm3dPbQ0izbkdMEcjOt/dXgouMxGG1ivyZQjopuqMYarfUHr+sfWOhvOiUDasvkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ja3tTzjK; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ja3tTzjK"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4843e9c5960so4264172f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788857378; cv=none;
        d=google.com; s=arc-20260327;
        b=gNq9Bb1dfNW/XkCnJj0BP2S9qhvwQ/xlPrDrUkhe4SMUW0TiyZqjTOeac5KROW0hkU
         7YqTrPkyE0rN6JqVCNa091qnAaxiWpc2p1wLwl+fw45IZMaxELmgIr6bvBz/qcUmrB+t
         U+YdoKygd6ciYGRJd8WJXwp4hlFCd9af5NcSgnX7ABdEFdysSM8aEi/iXzWv/JPE0GFr
         sbO/h2KfrWwwB3YvgUHiL9qXjWmpedxLx3cuKY0k6fll2kyYUW1QxtKAY/5HGw61NloP
         IG3tidZt32HFNzsbaELpLx3dIg4THOQlPm8l4DwTJei7q6wOcJDunyqyfiXE+1QDVJ4s
         M+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VlUILLLz6j/ItrW8OiGkI/9S62d/o220tqGa9E3WryY=;
        fh=6rc6OQ2YzcvjwdzpkX9wDHfvZQYK91v61lWJfUDKhyE=;
        b=EtI0OorI9Q3fSVEnnik52axLZ7AaRAWG2y4RgsPz+0yQRD08ADu09MmoAzhCQ68Am8
         vUHXIqOvmy8EqonWZRuQ+2aHZ/SOT/PrVS5ztcDHaiHE0GakMbeImvkQgVTje+Lbbibn
         SCmzHazeu0BG8LofYKh3R/dDMnoebdMbSEmhOayGEV1ezk/IchHOc+vMCfipumYncG1w
         MbzO5R/qwFhYFZ450zKEZcr4EAFamyt+JGP/gUPyHsUcgp0+pGgLbSUQtDOEmCaMohKb
         GpRQ1vvalUX/DaKjR3ZBQmdlb+BDooJR1tNbD7ygGpHasDiDHFY4xCGPSS0HBZTm0L8q
         2B+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788857378; x=1789462178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VlUILLLz6j/ItrW8OiGkI/9S62d/o220tqGa9E3WryY=;
        b=Ja3tTzjKLEI0EspicWD/xjfbSz6p8h/8kekpbV4awed9gO5PNOZUW1h5gZB1wVgyfa
         8zVdstTwVB31K68NTPa4JMYYOFV6jEdJpUmALtQ4hEEONE/4ZdHfVMehj6jkfBmwTMDZ
         XqxD2HWqcBynlhRJLv3HCYqinbKIMEDAPr5xBI4w0UQrqQHMy+Ds0PW1zNzYlNZt0pmu
         tpynEroKxXbO1DYqSatFCeqmJIzUOMd6HYbrVxOtEKPFyJD8KwMIyvR/Elqvdz6C8lGb
         0LqPc+KhHDB0JZLtJyKf7uRH8iH4vt4/Ivt4hxt90tK9AJUusExz7cU4AoovzCvwOihB
         +Qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857378; x=1789462178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VlUILLLz6j/ItrW8OiGkI/9S62d/o220tqGa9E3WryY=;
        b=WE0yYoqUKjJ4WvU+bS0gpechPqPz2MMSWGDsrV4FwVWsju1N0GZgY/SqaAKUPa2Otr
         AwazyrSLCGRGDPFVx8KQhTu/vdtD91v7Whsn8ydx4DgqSWZefrvb5Ubi2xHioQhFhmwY
         qzqhbk+IOvgzzxh7fE7gczEdFE0DHS0jFBCxF+c6Jr9rdertB6K7lgjisKPrKK9xm6/R
         vU6JhtAgUh/J7R9TyHczZDzClCX6fpxzbX7Mk7x+EULZi6d+7913ExXR70oUIvhiR+np
         FKJ862A3FeljmSG6Lmd1loa5Gu8QIeTBK2aIaMGXhLUfRWZkL4BPYLt4rJWsUUb40e3Z
         lBMg==
X-Forwarded-Encrypted: i=1; AKwUvBxkl2zXggF6luH4LHA5c9XFAiPdChgjb0lPqYKl2NC8o6IJrLs0NvrEc4U2fkNhc6SvQYQ5tu76+QaKRQs=@vger.kernel.org
X-Gm-Message-State: AFuF++m4ptpPtniwuMQdz9iu70G13GJz/nXuET+E9enuGM7MDW0/Z1hX
	/GK7naENqA5m16f4e6FSZg/AUJITQ+3fYaCuIYXJTuAfo9lxnazI5/cXkLlBjTDnSG8p+SHwg0M
	6ofitavkEzKXBLSrS/kaNksq6R0huahbxkqTkHm3P
X-Gm-Gg: AYBFou1WuiM4uBFsngnuP7DHbVDlrLtDq+S7ouA2QUNpzJ9FExcnlkO4PD4rka5NErH
	Q9Z/W0dKns5UwvqvXg2YY3Tg5728aqkMAM4X7y+My74yBgz0o/UhNe5WTgJmIyB9YmhqHfxtYbq
	g3ZIlxY+plq6mmMF8GcKGfLuUebGe3Fdclxlmbp45S6CEyXN5wwKH+W8tkN9YLu3aPeg5GBsDh6
	0zsjJx7pNd5PIpd5E1QsIskgKJf8HNhMVxd1F1GKdnhOvQVW5fa5nOOnDG49CIrBxo3FEc2KeMs
	j2i7sUhEUkApoED/R8v1enRMFR/jqHp85VAgTEebvEtYdkEFMfQt/CLqXgHBhkotqiFDHP+sNhi
	hzaSXYndAsK6jZ21DqF8y3EyJrsc9PcKA3ogi3nD0
X-Received: by 2002:a5d:6f1e:0:b0:485:8c16:5ef0 with SMTP id
 ffacd0b85a97d-4858c166129mr26214143f8f.42.1788857377473; Tue, 08 Sep 2026
 01:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-maple-tree-send-sync-v1-1-43adcd4a16e8@nvidia.com>
In-Reply-To: <20260908-maple-tree-send-sync-v1-1-43adcd4a16e8@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Sep 2026 10:49:25 +0200
X-Gm-Features: AcwNN1UnrR9dkVHvDMvsysJouh6r2YnSm2JySmMBpuB4OQ_lYYOQ4OyEmCZHEfw
Message-ID: <CAH5fLgh_TQiqKxXsz_DVcQxkCaEw+q0JyTh4e4Tnp28V0JDmYg@mail.gmail.com>
Subject: Re: [PATCH] rust: maple_tree: implement Send and Sync for MapleTree
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: "Liam R. Howlett" <liam@infradead.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, maple-tree@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 9:51=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.com=
> wrote:
> +// SAFETY: `&MapleTree<T>` never hands out `&T`; all entry access is ser=
ialized
> +// by `ma_lock` or `&mut Guard`, so `T: Send` suffices (`T: Sync` not re=
quired).
> +unsafe impl<T: ForeignOwnable + Send> Sync for MapleTree<T> {}

This is true now, but will change if load_rcu() from
https://lore.kernel.org/all/20260116-rcu-box-v1-2-38ebfbcd53f0@google.com/
got merged.

It might be better to just pre-emptively require T: Sync now?

Alice
