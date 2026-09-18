Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB1A47A0DA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754883; cv=pass; b=KHkzBuRIApAAL4ZhhF9JTLt+/H5KabGnVWWE/DGBK12LMek4r8sYMTu3ZaRD2UvYa5YyrCEMX9OLrB427jGiaciWNY0aEr2BgTPlG+MFerKmjND1p+93J0NEXone6mZ6y2DtfJP3M8QGULLjo3HAc2r3N5jATnmG8E//Im+iH9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754883; c=relaxed/simple;
	bh=yrQsHhy6u3WkbV5pxscEOWCkYhTAD9EPZK+ycsiqyqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lBAX9FoSrgvajKWqux7OuUPh5bT2ZbaNx+OQoS56za7fTUeE3tn2jeWviK3fQogHrRpj1+PRB0sd+0Y4oyUZSZb+UZte9bay8sequ66qT2rZafT0/Qjxqpi3Subng3ieowsS4bWQx0MkHKTY0HZ4DITxmeFGtWhQzRsOt1ciKmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFdB0PDB; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFdB0PDB"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso11193495e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:08:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789754880; cv=none;
        d=google.com; s=arc-20260327;
        b=oBa4WlMjnTimWBxOIMZju295Gc0cLi7ojKbIBamKdAcH8CiMoNsy2+Ci9gKAFPfgCk
         hRveqAItogFlMDW9wz+PzQS1SCNrsVyZNOLsG0H7zgX4WWSh/wDcuyhgF/CqNCf21eVU
         cO2U2F5W2UGYrJ/RDpiOfGQ2dUTO4540Taxn3aezwV89iHNAEe5Ihlt/G/t2+2XA/ezm
         L/0RWDMX8yKlqrphWDG8hICjj65VxREx3XRHJzs+hmuIv+7BXB6kguAVWs6mtZUWv3Nf
         rJWi6TsaEHNSYtLMCz7jH17C1MeQSpa/P+LSOstFKvkt5RqCXASmTwfFzyBMFwAM7A1e
         wzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yrQsHhy6u3WkbV5pxscEOWCkYhTAD9EPZK+ycsiqyqo=;
        fh=mmFZJktNaNo7c/D7fwMtiMt6EVTJONz8RNWTrsT2HLE=;
        b=lagYtvqzUctvEq52QiSEQH7/C0nzjYLa7hJukiT9Dg8Vs2GEX4796VLfkarpNN56oD
         fTgFHNncfVzopJKDvl8E/gi3cS1d0Lvu2KpHzPqbgEI+TfW+KLIuTcDvLSa8IfxynXL7
         VbmSbpD3yQwcFcWjHLF9cMaT6g2ObV8iyh4tsVZVGUjgdg2n0HgHRpP+zUEjAHRS6F0f
         A3p9+w9J7XGUMDQbv0J9KGgEpfxzDr98v51VKTgrQatLE8bX0thjqNrlypUh8Io/9M+y
         l/RDvtHJynhT9jzJPwTUZ6/vEl4nDnN5JWdqrLN1yErBXhYCaohNyE+mKIF8wfSV1cMO
         nWig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754880; x=1790359680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yrQsHhy6u3WkbV5pxscEOWCkYhTAD9EPZK+ycsiqyqo=;
        b=EFdB0PDBAhvDmfeWtaf3KANVyFj61W9HtDi5x2q869KfI8khgld2pCeVBNyHs5FySx
         ONN7y71eZGT6Ms66pZQ0fCn3QRk9UrNZNWtjKeTb25IlwkNKnCj0py1HSuP8GmuXds15
         VHFkvyE0mNOnsqXQzJDNERWfYDiKtNqQj0fDW3uBOwI2ALkDZoIxgF5gHFzVDtwtXxkn
         QKQokm67izVyLwY3DJ0cPQhGpkg6PbjraJhYmvqqVwXARYCBZDHLutPtWablS8nxGc9p
         DfcYIkZoeSxg/wq2sSOtqFXgjJQEKdQVy0M5UsVn4xJTUgNhSqETl0y8VTItoTdIPEMn
         GmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754880; x=1790359680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrQsHhy6u3WkbV5pxscEOWCkYhTAD9EPZK+ycsiqyqo=;
        b=GPbISmfmDQ/yiNtZLtC5KGXUqHjtUxkClKtfQ2H4N64Q1dfGZtUABrBmy1qosv/1HP
         60U2YjLSerSPH+2G0LG8EQ5bmVgsW83tPPHca7QU1DWEo4cOQFqTerzbaMolVyaoKpQ5
         kq+Q9HWE9oXbooEPnFYKX5Oq9Wp12UoS/0Bgca/W5KPWwCHKzE9Sb+bmZfxg4sGUKnVn
         h457pxQTuwy8wdiUQGaO57aTV7ectNsSKocFWnVFlOpJn/OqQRD5qZBoGIEXJ3QGwD6n
         z6Pa/gwgiZkbDoTQTmnXNN5PgBKy/a/HADtQp1eBFwNGH0tYTsO/GeOTFD08VGPw1wGY
         7KqA==
X-Forwarded-Encrypted: i=1; AKwUvBzejvlqqpaLXsQtTGYbDI/cn0btV/tTeUIllIGIlK3nd8HwPHKq1xtY5EidrZGFQbyWBnjbupd83dfunEA=@vger.kernel.org
X-Gm-Message-State: AFuF++lruOb6xQR5DOkgc3NBbw6D/DhyPU/aIXczF4tsB3dBu2qnnwyT
	BUfsS6GrbycCHOZMEDgZ8kdsw748c837h4NNl6o3sQW5rlD/5+boJBCT6LTHhRvSxWJriy3T9ma
	OZPPT4L/m+dM5BZ23U8BwrtiN1HqzrCA=
X-Gm-Gg: AYBFou3c7M6ZS4WrYL8SyIbIIsFvz4S9CxY3sZkR2Ib/xdNy0F2G2sxIXxMYuU0V0Oo
	4F8b0J+gtefU51A6EDEaJcJ2qfXbImbTVPr92svtdA0WXTtHI2y2+iQuMKBG7VD2rRH8asBRpON
	FsovRhdL4DrU2rjTg42DhqsdUfmgScW19pfIQ5FeRdxk4YeHkvKMcThiCdtj3L8IULdIGhkBiMn
	vd8HWKrgO8rpvllvdM/t0jpdY8+Y7LVgBuhFExrvrJJ5jyBucUL0d1J9N+ydqE16p0v/FSt+v6x
	R1SVqUbG/M8d0sJoBjB6Vno5eaX26EXJ7SVDGDdX2MFcStZ0DlP5b01xq/alCzFW3x2ZQuZ1HC+
	d31NEwTE4w+o=
X-Received: by 2002:a05:600c:c8f:b0:49e:6c9b:4e94 with SMTP id
 5b1f17b1804b1-49fc5743124mr44989645e9.28.1789754879842; Fri, 18 Sep 2026
 11:07:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <CAKEwX=PEEkYiNRaVhCuM4E6mxB9huPKfkDa4m62VMTzedg1oYw@mail.gmail.com>
In-Reply-To: <CAKEwX=PEEkYiNRaVhCuM4E6mxB9huPKfkDa4m62VMTzedg1oYw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 18 Sep 2026 11:07:48 -0700
X-Gm-Features: AcwNN1XGRA_fvsrUeEhqxwkqGz--tC36CQoczmeazWAt0rrZHU3NzipYJr2xKaU
Message-ID: <CAKEwX=N0FGDH=A9-j7uG6Pf3EqyGWkhqbqdpE7jG7owdzmyeLw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] mm, swap: extendable swap devices (xswap)
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 5:13=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Wed, Sep 16, 2026 at 3:19=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn>=
 wrote:
>
> Constraint liberates; liberty constrains.
>
> So let me flip it on its head. What if we keep the interface I already
> have, and use your data structure instead? I tried that too [2], and it
> was significantly easier, because it is just a data structure change,
> without having to accomodate for the full interface of swap device.

Here's an updated version of this proposal:

https://lore.kernel.org/all/20260918180241.3424851-12-nphamcs@gmail.com/

Per your earlier request, I also:

1. Moved the virtual_table inside struct swap_cluster_info (since the
virtual table is the only new field now), and deleted the new dynamic
cluster struct.

2. I skip the shrinking mechanism, but instead I dynamically freed the
virtual table to minimize metadata overhead of free clusters.

I have not run performance tests yet, but it has survived a couple of
simple stress test rounds that I threw at it so far.

If you think this is a good proposal, please pick it up and drive it.
The code is yours :)
