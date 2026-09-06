Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A11E5B63
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788658365; cv=pass; b=Yjjjc4D1caE0MVPo29rOg56rxXpY1rEgKnIjMrP+ALbwDEGCXsjap61BQoCyzAfikLAL6zOVOPX7IdLLIXDEpV9VAcrZ83lSmHJNRXYCtCgaSw5M8iLxJDIM4kws7OXu/c4zvkKGsOV3CeKF2y59R3XwBGj6dXPVu+tmnekDKUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788658365; c=relaxed/simple;
	bh=XkGisV3Evjj7Mvd+zTCV+TdTT1vDp/RPTN9iZlFQXP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdyAw1u9C/1G/swPlusSUJQnYkfnwfU22DA5fwc/KYbL1MCq4dQSDUdj3ve+11aGgNh7bWEdXsivne7RJ7U7ZUCpIoOpctv9RZh3oqMklsDs88KpoTKymziCZlfqNhI+GXIIEo3J3bSg1MzKtFGZWTIrXZS5vkdEecJyEWGW6zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=hIsoI8dn; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="hIsoI8dn"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8525efa7274so1504886b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 18:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788658364; cv=none;
        d=google.com; s=arc-20260327;
        b=X9i2dT2C3oEmIRwHsBuoH85FIdA8Cj5wOHsfn0zK8nzaMsVhk//ypw1PixhtWS9ZcK
         YePBD94sWeCuVfLZAqIynfeb5KRMDnmpJLQJZm27db7xHzUW+3SXRLmpwQH+B988bcHj
         mPza02KH6DOY9Gti8DFEbSE+gHh05zolEMMxKtOznduRLt6Hoz1qInjd0n3nQ5pNn50b
         3zaju0CKT+whbKkgnve7K2Hvkhv6HZnsa6GMvirMeg4v3TepaCR/6pQL9HbnE0+JWfWD
         5JskMWc0TGeSvuzUNhKMA6E6ZLCcdo14qRmVfFsWc7qO18RwnqQnOXHrMshVBv0Ptcwd
         N6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5c69AaY32kskBXaaf974C8085cag74RfiCzN2LO7Q78=;
        fh=WAGJAVIYCbX3bNod1oZuXhcDkATd9g5y7T6dD5OOsEc=;
        b=EKCOKtd3h9VkAPcVnbu+QTjETX7nI2/UEzR8N0WwmPwI6x8d6mgpHBbJKtnfQg1J5d
         muuIFveWWXQ/EnorLHB/no00WXT4KjqrJTwKUvgz8x+cYvCjScO8wx15aSz0Luj+NFVU
         NF+liDEDpUwYfPBf0C1zEyqPlm9SQq6TBV+oQiyVom0joPfOrtYB5vtFY9U0+Jgypi/V
         WW24/u67xkZVAQX4XD/sY/LG441VaeOgbY/OgchBS5mr+ar7aBC1+OB/umb6Sav+tlyi
         gFK3MSeh2R2hMM4Oj3QcBrAPoTwbJG7DELRCpAlBTR+hbeGsXcU792FO2hz/SOxGKoPN
         Wlfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1788658364; x=1789263164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5c69AaY32kskBXaaf974C8085cag74RfiCzN2LO7Q78=;
        b=hIsoI8dn3ooUJo2RoZBogUyaO4ghoK7cpiIxKv+qbMk2p3FE0hyf/WVGtAcTBmyCvT
         mKf3wmOGaWGy6vVRsIV64RifYQLC6cDyiWtbHw/QLc+YSDrrPHg1XKJ63BVjsSPzk8jf
         nuBYQ4mO3AraaXSKMw6RemPLy+s5fNdjVkueakCX+nhF46YxNWoDjbKf+BEm0PIBycYf
         ipbRUF9DIDLbWXgVO/i83JEfytBscS5QeDTwJnIkQ8mgq77qMvqAXLF9XBdQUlCc0UgQ
         TX7REpZqU1Z3BQUpAdkSXkktOfsrMJOK5wr81oCTDrclTfUSpQX3S+UY7nR+RtIILsI8
         urFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788658364; x=1789263164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5c69AaY32kskBXaaf974C8085cag74RfiCzN2LO7Q78=;
        b=Q1kPfPrzfK6L9cEfnSfh1DyV9TcbDRAkkMpMy6S5jdHvcI3HYS8XzVIThf/tBGmFD+
         +F5AHZkw6Wk/rXov4UwvvTPz/1Gio/xg4ZRBO/ZuXrh+ox8/5Df2e06ie01rsgzSa5dG
         8vCw+B5Ap9bDvxauBV1XCoja+iZf5qDXdBP5k8p9BQSe8aARJ5cORIA/63lJ/tGSaj4B
         REpGVu7VqFDsZN3ORpJvpGvIJmPY9bphvgA47c+OQcnVvHQELx9ejRVhJJ+2vsybyvyi
         DM40MYtYbv+AIW5NtrMWoBdP0HWh4Faq0aCvbmtzw9Pmy8ovgQbHfhU6QCFxyyXDyekw
         y25A==
X-Forwarded-Encrypted: i=1; AKwUvBwZr+thGPPTDMuh/9oZqYZbLmdtaFySFa+75BTVL4XJx8IOR8PTRFjSKBnLYLOO3/QPzprcjlFC1g9tMu4=@vger.kernel.org
X-Gm-Message-State: AFuF++lwb8TYRZZLfLbtUybaK1FMjsFDLuQe7DV0VPtVOvEPgPL8Ha2r
	M7rH1awPLZWFF180bV2tJ8lVGuxia7kV7d4D++8/ErD2lfBa6ztzjRDmeQifikMIXovvWW96iQI
	M+U+gp8cIrHXIcgeFItjA3ZsB9L/Xf4PA6IMF8y3E
X-Gm-Gg: AYBFou1H1mW3l6Ug6VuPYXo5d6jytPpWPvdaZg2RYwERcyg5gG8ktbKH72Wlm9JCuRK
	2YzPVpuHNsKnp6MrMTj1GEwCjRZfq5WAky+JnV92KIomZou/2we/U4xIZGAYX8If9Q6Wh17ehBx
	n8PIpDAehGlHQw/bqlzDOtvyi65C5hLPKQB+3ln5OoG6iW83lLKgjvbgwC8y7Z02z/8ewMGx/or
	z2hIth2DeyVrLCfLjojoz0Rr6vZIbW3IQK3SnO7MY9JpnF4QeR95Zqz+p90tmF9W2kIkfGEQD01
	cI3ik6cXNhokzQXQFCb3R/Px9Ujaffe54g1sELINeTimcYkpaCJVKOyHe06MNpSSe7FkEFr9ccl
	zjbzlZ61NNg==
X-Received: by 2002:a05:6a00:2c94:b0:857:727c:a1f2 with SMTP id
 d2e1a72fcca58-8616907f6e9mr21628645b3a.20.1788658363695; Sat, 05 Sep 2026
 18:32:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727233706.218446-1-xmei5@asu.edu> <20260727233706.218446-2-xmei5@asu.edu>
 <CAJfpegtvYJPBt=AcssH25mn5VDR3Gdkhf1PvuLR5HkJ=CmkYpQ@mail.gmail.com>
In-Reply-To: <CAJfpegtvYJPBt=AcssH25mn5VDR3Gdkhf1PvuLR5HkJ=CmkYpQ@mail.gmail.com>
From: Xiang Mei <xmei5@asu.edu>
Date: Sat, 5 Sep 2026 18:32:32 -0700
X-Gm-Features: AcwNN1UPXRzFZw8ZZGT_UcW_OJxAT5DgOQb9MbK7fu1zShy4ZYp6C_Z4xnhZ2ys
Message-ID: <CAPpSM+RgWtmFLUAMfCvCg0ek0z-fSLAjr-eCVYivv0z5tKNVxQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] fuse: bound io-uring payload copies to the
 registered buffer size
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	Baokun Li <libaokun@linux.alibaba.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 5:28=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Tue, 28 Jul 2026 at 01:37, Xiang Mei <xmei5@asu.edu> wrote:
>
> > Store the registered payload length (payload->iov_len) in the ring entr=
y
> > and use it for the import and both bounds checks, so the buffer the
> > server provided is honoured and an oversized reply/request is rejected
> > (-EINVAL for a reply, and -E2BIG/-EIO for a request, matching
> > fuse_dev_do_read()) instead of panicking.
>
> Can you please update this on latest fuse.git#for-next?  It looks like
> some of the checks are already added by Joanne's patches.
>
Thanks for your help merging 1/3. I checked the latest version finding
there is some changes to these functions but the check is still
missing and we can still trigger the bug so I rebased the fix and
dropped the review-by tag. V6 has been sent for your review:

https://lore.kernel.org/fuse-devel/20260906012924.1928316-1-xmei5@asu.edu/T=
/#t

Thanks,
Xiang

> Thanks,
> Miklos
