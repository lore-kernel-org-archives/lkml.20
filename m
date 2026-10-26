Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793007144;
	b=sAkCa81jLpwUDSN6e6H1dlolMvmo53EoeShi3umth+9Lpwo5jqvso3HOsCdEXDjbXAJY
	 JwA6gmx2LbEbwGLpm40wsmxhoJGUp2px7SiTKazvO3t9hjik50PSue+XtCSVz6PJ0X+GP
	 vkU7410+jLfdqZvvYJinTt8jWr2F6G7yPRH73MQeuI0a6LOtDAz8ucj6V2CJuo4wCVEQt
	 eY8VOQcazROIXcBKx26BIIPneU5Z9sLAOr8dumPPygOdSt4CsKubNNHeLzUyGs8bEt/H9
	 tYCbGsK1pqavyWTHFfnx9KKt+2+Rpz9YY0P3JM7mn94wu2zLH+euuanQj3UZpuAsogQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ecBvG4CyxdXuobVHi4VrXk03Jx/FAmyBpo68trKAaEw=;
	b=hbGYJXe0hlQBI7NJevJ/imN5/qB2QFpZQcqSsFuQGqfwNscbzaTgByv8fuTrj8PeoIgc
	 EKbq/SewbfQu9yS2p0OC9XFyCtt8GxsRljgTloikzW+aHI5p4s0AE61ldtuNowEwrM0bj
	 ADJEtCBmO7Rvh1eKUZ2oi4+F3cZaVui0MJUTkEGTAViDLysyFLetOqEOAyNv63R+BCl9Z
	 hbBFqm4ZF0dwOoF/iiHcr5kQFE+5z0sqqjRydzpQfyl+kloCl7ZWVSPaSvF9XKGtEiN5X
	 SrKlt+uypEULhfQB4KZteC5IFSqD7tzYJztmbg6sZCAsJoTFGxcffS8eYDi5KJ0xxag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jJgZ1kRT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A701C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A701C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jJgZ1kRT
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso4106229a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793007142; cv=none;
        d=google.com; s=arc-20260327;
        b=IrHshHAdMw6YuDsrLocY5w6NVYzT56l1GSHAUJv6ubnSBVYf3I7Ch7m01/KHFKPKVD
         YrmJRLx5Sa5owiJAJABRYSYujXsUGnGxX5wTCSYQ9PCV29a7AbCeywFEvyZcOV+qNsp2
         /2KdwXJCzxxBTXD5xvafuuUREa0wCuxGwQZZZCWaU4771jfO0Gk/6QxUdSvMJ9YnFSAM
         G2oFpzcfDLpidZjRefvnY4uYQeMmDORddI6m3kf8Dc+8o2uNpscpLtuv85QNg8uSPAqa
         xEfsmQ/jemba704Mbm2eH5MnvMILbak8y5G/zkdtl3f1OTRY4tyV4blGYuTKrR5x6MMk
         UCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ecBvG4CyxdXuobVHi4VrXk03Jx/FAmyBpo68trKAaEw=;
        fh=vLl5wnJl9eiLN5yTtFQ0ktEEr5cHBIYgpLR50SP5wsI=;
        b=YjgHQHF54uKRSeJoPxNpZCPBpEg8ZzrbD05jFdd4nZQRgoe5OHAxjE7iVorLBp4ba/
         YbTmzhkzqoSOwGREASQw2+b42ah+z+ghLBAuBPKKazRnu/gvQF4eGv33qSn3s/VuVDGW
         8mrq+FmeyJ4O5jR3g6FVNtkou9XeN+O83+e7fbDgM1FrDROQqe3u7HMxMC7T/4z9UvoM
         TtE1yEXnaPjJjUsxQgttfo74abGWO38OowsYMr+qTiE360ziTtNg6/eCGWU9d9MflcDt
         Ls5DRwmbQKDai1re978+5IzUDvJZ3TNiHWYty0hnzT9hRN5XofJhJzk/qgcxAfqIgAig
         lChw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793007142; x=1793611942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ecBvG4CyxdXuobVHi4VrXk03Jx/FAmyBpo68trKAaEw=;
        b=jJgZ1kRTnuHOfldZYkyTH7Q7gInsSNyGbuCrnkEaHqjGU+VEafB1g6eX0BhRsyA26h
         k9t9loRX2tqzrB67q32zXLg2ywkofxQa2Ee3xXwnj8CAcr1J6eskhZ+H+zhsNQzP5Q5H
         FyarA3x4ZYdySiwD1GinjcyzHt7LsXxfaYgLLKqX6iQxFx4lD9CcFYC5e7NAoEoCYaTT
         mN2wjFzP7BNoREeHxvonn9fZeN0FPKjAPCTbFc46ZCt+/p03GLv1K1Hjzy4+DNvKBIl3
         3hbaoGRy7A5EjdV2igBOGhFgsyTh3RfLOHjFt+QFFckflFF+d9TWjVow5YoWI+Hf3HNC
         JPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007142; x=1793611942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ecBvG4CyxdXuobVHi4VrXk03Jx/FAmyBpo68trKAaEw=;
        b=1bZRGkMQKMwOQLoYdfo6h61gLCKZBiKvDqAbmD3C311f5FT7gitu91fCwyFqdT2NBE
         WToKerov4xq7ygwpBRxcI2nsVW/xhCouxodENBWBgUFJojB3nGNb/bEqn9wWNy6Nh6mi
         oqoOMPB6UADN0C65eL4IEav6yABxE0bCz087dgW2RtLR6T2F7b6roSsnDq9LUavWW5xw
         Yhhvetfk6atGDTGx0V52psQ9L4AZutWYsPwPq9hFPq3VSoQKeJdTUckHnY3Di5NpyYDr
         gll/lXyQV/AB3BDzlA7Rd3ZhaLoz1eykVCRD+XH0QCphlcA7azYXBF8aEezK4q6H8+oC
         n3QQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKd6PT423LRuEea46DLXucXH/AFtY7ulrI8bm4qMOkq2LnFTr1xJBkjNY437xn8Jt2+Wsc10Tshs689FE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4qBzjShzd+UBgXnZnZ0FRQXUJ1XyFfUa8g5hTcc4SzRbcAaix
	75FYggPJF/yycn7E4IqohefyZ6411+yRuCs2CJ/7lfvFQA2YcQttKaP+oLVlh3Fd4DxC9OuYGMB
	9P3zRUu2g4MJfk6jTD6Cs7FtHRUBP9WdinPKB
X-Gm-Gg: AYBFou33aMyIrxzxTndlDFyxMvHBNVJmSJ9wsLeKKHUVLg7wEtGL+Gs5WxeYYcKL/Ea
	U412ZQq621Cadw/FyVZWJRA1wUxjl2+irOZpsmN0KnxVKW8NyVYY3upaRSxjRNVzzoVJUlZT5t2
	uvgo2MnY8XHlRjZnDP8xhwRiNRKBBiYyeg6B7aNGzodGb23RuAFaHThAe8ZbFAR6QekwsYwVvJl
	T3fL/vAf6i58HzGUHjitI7HA5S8RI+8RuBnvxkj04shA6pbWjcLiSZrhwHyhGVXnJISaDEsB3Nk
	VmW7LpET4EWkSa7jsi0MqbOxj0zi1Yr5OA9aaOsNHW5tIdBXIC9hecTheN8puNofV8vZR0zdtB1
	+lLh7yt+L3jrVoMaKSqO3kjjBsyNuH29lxK7w+504oG995ea7lz6Gpc9Nm0RbZXpA3ocVGnToGB
	xHsIzZO8vA3tm5eao=
X-Received: by 2002:a05:6402:a515:10b0:6b4:2fc3:7d85 with SMTP id
 4fb4d7f45d1cf-6b442fe9a23mr5162442a12.26.1793007141857; Mon, 26 Oct 2026
 02:32:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025232251.58252-1-dennylin0707@gmail.com>
In-Reply-To: <20261025232251.58252-1-dennylin0707@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 26 Oct 2026 11:32:10 +0200
X-Gm-Features: AclHuK9HrNxGfGq3Xk8d9bF60_YyoNgGHS0nIQi_8ycsJWClOpl0dBjTH6NbKO0
Message-ID: <CAOQ4uxifE0G4r=cpevTB4mzq+HhGdVsNhddzFNuH=BN9YrD6Ag@mail.gmail.com>
Subject: Re: [PATCH] inotify: do not coalesce events with different rename cookies
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 1:23=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com>=
 wrote:
>
> inotify compares the mask, watch descriptor and name when coalescing
> adjacent unread events, but ignores their rename cookies. Distinct
> renames can therefore lose an event even with IN_ALL_EVENTS.

oops. Somehow I remembered that we never merge MOVE events.
Maybe that's even a simpler check. IDK.

>
> For example, prepare two files in an unwatched staging directory and
> rename each onto the same pathname in a watched destination directory
> before reading the events. Only the first IN_MOVED_TO event is retained,
> although the two renames have different cookies.

Thing is, the "wrong" rename TO cookie is meaningless without the FROM pair=
.
If the second source has a FROM, then the two TO won't merge.
Could you really reproduce this case?

> Similarly, coalescing
> distinct IN_MOVED_FROM events can discard the cookie needed to match a
> subsequent IN_MOVED_TO event.

THIS looks like a case that can be reproduced.
Can you provide an inotify LTP test for this case please.

>
> The original inotify implementation compared cookies before coalescing.
> The fsnotify conversion lost this comparison. Compare sync_cookie as well
> to preserve distinct rename events, while retaining coalescing for
> ordinary events with zero cookies.
>
> Fixes: 63c882a05416 ("inotify: reimplement inotify using fsnotify")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  fs/notify/inotify/inotify_fsnotify.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/ino=
tify_fsnotify.c
> index 7c326ec2e8a8..6456d9c0e408 100644
> --- a/fs/notify/inotify/inotify_fsnotify.c
> +++ b/fs/notify/inotify/inotify_fsnotify.c
> @@ -40,6 +40,7 @@ static bool event_compare(struct fsnotify_event *old_fs=
n,
>                 return false;
>         if ((old->mask =3D=3D new->mask) &&
>             (old->wd =3D=3D new->wd) &&
> +           (old->sync_cookie =3D=3D new->sync_cookie) &&
>             (old->name_len =3D=3D new->name_len) &&
>             (!old->name_len || !strcmp(old->name, new->name)))
>                 return true;
> --
> 2.43.0
>

Practically, this means that MOVED events can never be merged,
so a slightly cheaper and simpler test would be
if ((old->mask =3D=3D new->mask) && (old->mask & INOTIFY_MERGEABLE_EVENTS) =
&& ...

Thanks,
Amir.
