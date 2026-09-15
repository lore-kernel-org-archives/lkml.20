Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BB636AB6B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508255; cv=pass; b=F+QPPvImqJXpWPz1CGY5HYOWtWwj1lqz8qhw+CqwmMq3CcvWpzGfYXYZV9IKGGCF4qSZ46vf9MMbhVH6LbiMb0n+trYXvywm3Eed/YCgtC29MlWYvbCmdHp9mlSQpn2zPvJ+WvRGQDgQfiWV3zPwFEJE/syCTY6r1pOAyMf/4uA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508255; c=relaxed/simple;
	bh=ur1w+Huz3VjUsugrae0ABUDbihSU6kbcSo+S2pD4nY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAGMbdEFQuaR5QyzVvqVDr07dDdOu7uRsEnEmODiRtrBu+qRqIJoijrmfPDidH4sDzqdOjRQEWz5r8oyV4PbmvkeCkHmi4cb2ruv5UsDFSENasfeQoKtXeEw2uHEM/COQzpdB3akVSqDsIEjRDWWdrFLwgz+X3zW+t0pXMKGHo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wcnr64bf; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wcnr64bf"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so35491cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789508253; cv=none;
        d=google.com; s=arc-20260327;
        b=UrIqKLPaHh8ElI/8VQ2WSzTJtmTG9gzry3Ixf+IEQ/oC4CdJ73KxTWRre+AOfogh+9
         G2QxeXggz0vu/CXVXnh1LdXDnPyk+BIp0iyzGDzXesNBQrDnVsNyYunRgNKfvKF36ERG
         P1GTyCdUls2CzJUZV9RZXhqNdmjEUMwDbr6kikVuKDk1vh52Qwwey+az9kEgBspssdng
         bLfDyJo89FbR9P5ToT4xgxf0dM9tO9L3CvKe86F5Em1q/oWeAZSADviFBah4USh55rZh
         2GnDyUTK++D3pBAIBvT8XVHZBEv2b+6T0XaLSK487OiFb7Shl4GfjTednxoxA4mUxb5Q
         3d/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CzDB3zl6ECoCJWFAzT7KlDMa3X+/5EYs8hOVz4qQG+s=;
        fh=R60hljQp53A8+9UyiUEBMH75XD0ovjs17mVRFyffPFc=;
        b=Jvw+vyJyLx6zG5rWZ6FHBAAtPPIrUZLqOiP570bDeKXzbK2uxel4456hE4XxwnJ+1w
         RTlB37i+toYqFMLYwWjPKWk/p7cVLlHHFSkhWG90akBwDd4bTof0QzAIN7aAJJ8Ue0h9
         g31Mt+PyHB1J6dPtgxQe2JHMjiKwNd2luJvbL8XPmcSq7dXYl/H8CbRBXbbBhlCUyVzL
         l4CrhDUkDvtEZ+InJ5RuW466gJIl0PjU9Y+NWLvZK95yJyU41nj+/CbyoWxuRuQ2maa4
         vPs1aunkwKjqh5is3LfLqz6AVA0DIe95mcGoU1STMakqNrA3sUnylqOdKRiiR95NjGR6
         k4fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789508253; x=1790113053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CzDB3zl6ECoCJWFAzT7KlDMa3X+/5EYs8hOVz4qQG+s=;
        b=wcnr64bffWjN9when2hGfSH/N5Pd2MTkwmVMsr2K6Vn4ND90m8LZAH6po9IlEyU+Xk
         xjUDtZ2w/ulXEKmxYzs0RQuvEpoq/XfAslvKMCGKP/IzWcpLyvhlNLHlFtXyVZ4ZoxC/
         meFFzOY8M6S3vjtedEfAG4PrH6pyvsQG/dfgKckbhv3NIbBqq8pw5Dpl7IXIZb5RQ2Fu
         Ze9jNKdwcWFrAh5/3RWl3A1TN2QZdszUJQoPS1YAbxRWiOaYtJ9fMqD6sel8mw3R+myx
         XIUxytw2CvJu6nyqGATPpXJG/6xFrb9F4z/C0VAsaoLVNUoKboojsEUSKg28G43x9M1F
         tJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789508253; x=1790113053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzDB3zl6ECoCJWFAzT7KlDMa3X+/5EYs8hOVz4qQG+s=;
        b=ob5aArJ5f+yy0yHfXLhPOPB00pGQ+CMUX253PLE81brq9m8jptbdsp+mNO8ZrZOxRi
         B6NJfaqV1RuTcsPi5Z1t7MmESBgyTVwOV09BQR5MhOczJft/Jtm5QR6fkWOOYH3NnquG
         +Nk1oLq3Ut+Y/rA+hz4p0HO91D3vowcl2UKKg/XPmaeBCXS/FAnwBWL7LaW25WFD8NEo
         n/6lIpvbXrScsqAN5NT9VN+6I2F0mdSTEqxGuhHd1iWpyrgCoBuMEM+zswOguhmVb5xW
         6DULlQ/qSyp63kbL6zzUKr4NvQF7w+9pYEXbcfOFUWvp/Iwr0kqGdksMFhRzqiMHq/8G
         MvSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqkweocf7TqfUi3bNdpXrBrDWirkxrgOER62yD3MJng4osrIhPwrs/+kZa147krzUUeQxnL4e8mG5UyOg=@vger.kernel.org
X-Gm-Message-State: AFuF++nWJztZNV+P0GKWC/uv9FnBahJ/wrtY+b7SZuAjeRyF1oA268tC
	sSejCHlC/OIsnd9DbT85qGU/TKdSOGq5oSjq1LDOl28Ws9+CMAbWmC6d9OnsIvRZfpM4BmdrKFp
	3ZRoT8+eTIwejRHcd2Dlo4Pjkwxg8rMfdVcbYzSzU
X-Gm-Gg: AYBFou1K0n84Vp67VjEbvTtN+YNr1wz7UAk+P9CNour1JxTyI8uk0yl215HjZhQ8pee
	x4+XcmM2BfwDJNpvcKOnK/ui3OCm7xBE4MdjyOL5t+aiHZ8avLC66P6aT4azJa0qGZ3mL/FET+O
	rgaEX5nNNrdjDKw5zaafkluayJg22MlB9itCwnK+xKLNruWOv4HsqKQOmy3Y6lfwH/0Bh79O718
	ohH4e8ECSeSadxWYUjBhLfZx0/0ZFbRLEVMMWXMYVhhObjmYJ77b5HADzu54/b7DIm11J1lq9jC
	Fo5iYp8dKeJzPjeTczTL3JvgrW45O/ETE+LHGuVL4O5W4OB1UgrOyKBhwFQel6Jl611p4w/fvqz
	yt/c14Nl3Uw==
X-Received: by 2002:a05:622a:1486:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-5324676bdaemr4921571cf.0.1789508252359; Tue, 15 Sep 2026
 14:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915202404.3568029-1-arnd@kernel.org>
In-Reply-To: <20260915202404.3568029-1-arnd@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 15 Sep 2026 14:37:20 -0700
X-Gm-Features: AcwNN1XQSkg9pE7_xSfbHj0OA8OaBxEwDSWKpD4m_jf9jMzfVYG-cGVZ4qCDltU
Message-ID: <CAJuCfpHmPis4_B8MJWmJ89E-23d6hK2_yXqHqAXizA1coFdOCw@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: avoid implicit padding in uapi
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hao Ge <hao.ge@linux.dev>, 
	Abhishek Bapat <abhishekbapat@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:24=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The impliied padding causes a harmless warning when testing the uapi
> headers with -Wpadded that could in theory indicate incompatibilies or
> data leaks:
>
> ./usr/include/linux/alloc_tag.h:41:1: error: padding struct size to align=
ment boundary with 7 bytes [-Werror=3Dpadded]
>
> The code here is fine, but it's better to make the padding explicit
> and avoid the warning here.
>
> Fixes: 1d581ab2348c ("alloc_tag: add ioctl to /proc/allocinfo")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Suren Baghdasaryan <surenb@google.com>

Thanks!

> ---
>  include/uapi/linux/alloc_tag.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_ta=
g.h
> index e3ad94444864..7d4618bea043 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -38,6 +38,7 @@ struct allocinfo_counter {
>         __u64 bytes;
>         __u64 calls;
>         __u8 accurate;
> +       __u8 pad[7];
>  } __attribute__((aligned(8)));
>
>  struct allocinfo_tag_data {
> --
> 2.53.0
>
