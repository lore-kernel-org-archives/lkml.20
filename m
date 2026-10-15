Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D452651D525
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071977; cv=pass; b=I0oH5WsPGMoyetOxT5tcIszJWMkZc+sfJWBkFiXMQYUTFfOzi3js76xvaQSe29YxFltUC3oBvxe/WyyEYWKllQHtSdvnXh83BxOe4jglpNzMicWlJ2TKKof2GHbaly0ofV3R/+1ByNrOZXjzjQNsA9jpIyYhSFt7YEevG6tpvaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071977; c=relaxed/simple;
	bh=7+NpiJdMwvIGDZde8K+YQfxuPLMgAy7KNWXIiEPPOOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLGvEwEPXxJAVQzCnSkVJtgsm3xHKAoEucYGKePQcA+QUClGuQChGwzTooltpINOKVPZCIwjArx5bLOFSjKy/VCrPtre5afSb+MxQ5YpexKEy7e758XL0iXKY0YvLGEwk5rUU2oZy88FYwdpPD1JzzZzJnHW4EKGhluXElEQxoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=pbEWmpsp; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="pbEWmpsp"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533972e0cccso59994681cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792071975; cv=none;
        d=google.com; s=arc-20260327;
        b=LyAPSP/LK2EZOdJs3bjCgDWPumKVu1gtvXWNLn3Kubsad1vDjCS2ebB2pNoVuiJuJI
         qq9c/KsrK0tMxujPFA15zE/MAjkE6RnVP/Ca23CFDua4Xpc5wVzdCF0omr5c6Ic/vKP8
         lKZUAyS+gn+oT0uMgWMj+XPtJeBJoc3LfFEqO7BG3191JrzH1lJZ0Hg1wIuk7ij8EkuY
         436jtzVHp93zxB4++ocxkdhrrk1WYE/F2X490JXds1XYfRA8/B4iJ5LXgl6DGgMBWbmL
         rKz+RcB9qBkF0hUdjaYtq89YoAW2lCxjLC5WKO2iZdFvMzo7GHvRDagBspMd3By6Vjg8
         ihiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7+NpiJdMwvIGDZde8K+YQfxuPLMgAy7KNWXIiEPPOOk=;
        fh=1IVH9R54r3s/AzayxoX2z0nMWqEEabMj/5NsoUjsdxs=;
        b=sZmphwEjZhdRGhlvDz8Omf+1dIJV+10ItyPfnxni1EuOiY6BxCUi2SFWYHpVumia6k
         +wQfQYwcJuuYTdR2py2WMkL9yy+Xs/BP/U8d+rUJYGEHuwl07sKy8lPbHbdioUf+oL39
         BDrN8F7uLDdKmvAFVje4ORNuVIeJss/MbjRlzJ14+zHGEJA2y9S+rvyWT9irhBIedip8
         wI78T1ohKXEDAZdiUigSzUhLPGJ2LtW+CZ64M+I2lS42vdZenuIidjYtVBaxazjJ8r/b
         WmJV9PUk1k4Ce+K5CPioDUpivCBXA6Qt+QFDmDbZpLS6v7kYF24C0w69btm3uCwegVJI
         LTyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792071975; x=1792676775; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+NpiJdMwvIGDZde8K+YQfxuPLMgAy7KNWXIiEPPOOk=;
        b=pbEWmpspviTMLVtIqIfjbkNhmDBMk0o6W+WUvQQODxSwTT0itPyrPyLHC9Ocsgg0Xk
         jKWXUNPYTnQ9o9W8kn1hxxzRuPuMlKIjNohyXqJEKswGCxDuCOMVbCbze/492BHpeD5q
         O3VZAgvgQ+AIQMYwnf5THhKi1BuEqHrdn4Gq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071975; x=1792676775;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7+NpiJdMwvIGDZde8K+YQfxuPLMgAy7KNWXIiEPPOOk=;
        b=eeexNSHrB0hsSodM6H62m34h8wtmYwGgoa2Fz0vXIGspjsY7bvytja9fNUgVI+xZen
         VK9FjiMolDZzReMnhikuGgjNsHM7RKqLIhwZvV2QAKifmh9/lzVA+YCSCS+V4z/JZNj3
         j9Mhyp1OyeYGAGeAkA4A/mtGkTDgLYxQchcSqh2VZAx2Nj5eGE8v1UmjHNo2XaeRJzRe
         EMKJcHp0IO1gZ+TeAMdqmacL2StCPqN6mFS0jNI74Hz8ux8GJclAUXZQ5QTm2KB+IxXq
         tAIIwxOg8ulwmuze9D/pSSd1nB5449SXB9zdnzgPVUutFX66OcSzDHpWSlHVv7QOsoQV
         Zx9g==
X-Forwarded-Encrypted: i=1; AKwUvBzTCAN4dONhKODUopYcek/QBY5M1SkCqH4R4uKO8v9BBMZHvyMdhSO6VuFwFKMQ4QYcNgZf5clp/vZqL40=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvEYGgSUfGA7/YIdOHESPypBvKpt87W3v3Nvi5i2SY8RnwMDu3
	sEGYyH/2SCDJvoFdrIVNm2+fe9K/AzAcdAbMCFkYKlwvtd4ITKEbWKLbwWBLd7L+pP7G+8DJONr
	EM/1OHn/WJSY7YYbwNv6+ELqxPqUlYNdxWmzI4IQ76g==
X-Gm-Gg: AYBFou13bRykBCLvt7tX5pQXP7bSA8aUxexU7F3FxL5/uASi+RElMBDS5/1uRFiMQuK
	uBmPaHi8jQxo1M+22Pl4N0ccb9BwbBk4I5nAEHIaR56GBAQnrN9bgQI5T1xBFZ5GIV9gHcOwiif
	l/AT2YxzHoQWp392xtsohfdk1qs9CzQm6jna3JbctN1ejmrLwG8OAb8HGhptd6MEL8NKO5kHxT3
	qKR0rLizwp8CMb+vo08ScD/caLQj+DmzVasgIBOvPdQJPrYgLLVuvJ826f1FHdPymK59th9aZCy
	FhH0IWlCuPbsEFyTKcB4XrdbqJ7plGkfQXBzYKYC9g8OOkyybE9S2z4iqTBWvNPfU40B7hV1pLW
	RUNqEStI=
X-Received: by 2002:a05:622a:98c:b0:533:9a5c:ca0f with SMTP id
 d75a77b69052e-5359f49969bmr307051941cf.7.1792071974646; Thu, 15 Oct 2026
 06:46:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
In-Reply-To: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 15 Oct 2026 15:46:03 +0200
X-Gm-Features: AclHuK99YqmEhkTyFYYadsda_EyTtGyDCSTbIpPdLvNyxG-_V0VYO6gSpi7DIyY
Message-ID: <CAJfpegu_dyO4Xczb4F6d1uMT+r3R+j6UVnYfV4tTaJ8a6DYrrA@mail.gmail.com>
Subject: Re: [PATCH 0/2] fuse: convert the readdir cache to use folios
To: Tal Zussman <tz2294@columbia.edu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Sept 2026 at 01:42, Tal Zussman <tz2294@columbia.edu> wrote:
>
> Convert the readdir cache lookups in fs/fuse/readdir.c to folios. This
> removes the last caller of find_get_page_flags() and one of the last
> callers of find_lock_page().

Applied, thanks.

Miklos
