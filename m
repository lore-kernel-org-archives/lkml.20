Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2DF375ACB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146533; cv=pass; b=N6pcbDUVW6dH7RC77njWSUhUfVU+/RIdEG0npMrQkNB1hV4jkmHRqvh9oU8LnhhK3h7z4OseuexHbHtQHBS721G6JnNXVc7OzjjqPX+W1yn0pQFab855nnTn//UK/s+wVoBBBB7AcGoTXR/R2shpl+N+T57OWVXG7++45ucSPiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146533; c=relaxed/simple;
	bh=pfrgNF+tr74oCJapKu2IFPZvUZW4uOtS7J0FD4Ai+4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ir+ddrx/YUm1P3P8goOTMNh5gtZHdw5AemBs+1EXCXpNGpVf8XlVLCLxbIZ0km2b7MgHjrYICnnERRGR94Df7JBgIKCRby14XNiO80yzq1BjVrMgV9nqzodpk1elzL4NGfwoscqHNqjkF7Q1GKycqhXUrpqbhuBWx3Q1d5Te57U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7i9VFS9; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7i9VFS9"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-888cbacf70eso68792767b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792146531; cv=none;
        d=google.com; s=arc-20260327;
        b=YBYU7SecSM819OXANZU1v8j1YUHvzR+rweVANL6o7glLkftAEIW1c59okMNu/mZn+Y
         KEh+wZCXR2KgXn0dqmydOSRR07k8bW9h304A8HngqEHjlWcBQk3rbAHujP7hPj3cqZTF
         Vj6QLeV0zq4ejrs8e0uBzs0Kh6quGs2I4BuWI0CW04V6QTMz/v27tKdJ9NaDMCe9t6Ac
         WoVt186w/NMCCxDiiQFzZD4voVOsffxl+SM/GPiKXPrml5SSfNxGE5hKqjD1SfiXj9/+
         q5KM7T8h4uYkG4omJGc0vnQ8yMXLibT27ILDPtcj1wqUGwI52sk5OABwmm1NybetVzUN
         BDYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zV6ZIduNaIczlafS5ObokQ7IxrGgGQYf/oXSNU6g1rM=;
        fh=PTDEX2XQDPHLRo5eYJ5i4eEVOh0C9t3mlyLalV0VHXs=;
        b=C72zB6RphbUDw85kGMkQJUSwYoevoYoAFQS7curu/fLg3YPyMnhEQVM4Jfq+C4t27K
         /yPz8P4UbFZVDYZiH6RBhM8Dv8gwDLaC34L5i8LJL6ullnY8Ic20VC/R/miw4mFvGveT
         MkMNsAy3A/hHxVZHpy1tHYOwHGaRtcAdAlEZbEg7SSKjCMZCv+PgpA26zX4IaxPsMRl9
         R/Ao6uUF8IgIsjHbyv3vwIw4F/PxFAyg/vqhr+THI/8ay7ehbT13FwJjmchmmPpRgfnR
         c8GsFXxuHOg5vNBGHQLkFVK2f5MUNWX66j5ytaUVvNd4vm7TEXH0sRa1flJA9n0b7FS2
         o/IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146531; x=1792751331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zV6ZIduNaIczlafS5ObokQ7IxrGgGQYf/oXSNU6g1rM=;
        b=X7i9VFS9f8nUvNVmCCpMeiWi/XXw6yTCUuJ8qKap0FMV3S6u2wU4lK+qrQhaCgDTC2
         26dnrGFIccZOYNCDAS94SalSsgiYFCGkFGCjokPNzlCGCEi9ZKz3hvF0oaEoKu0ds9jV
         a+bn0kxKDxnvwOaH/dHbYScvG29UkEeIkD06z/fs8E7ZDO/gBV0w6Zlcr4Y+khU3IbgF
         LQMS6+gjmvyYWn64WdHk7Zkvf3ZVqnFqs5WpoAGKMC22y05F7k7aRdScJxicmqWKvG23
         YV3Q9gNmhObDJVnqZ7K/GmBxlW6pifSjczRpA7jJOzdIfnZ8HuXMzsFCO3E0Q+EKuQRE
         6iMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146531; x=1792751331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zV6ZIduNaIczlafS5ObokQ7IxrGgGQYf/oXSNU6g1rM=;
        b=0rwLdn90HRjSVpXldFwD8lWX8gLQFh9OISgs4kYPuJWuuyJYSHg+6+wmUbh3Kpfnrm
         Vx3y/QsrnxHug1mORU4vhFftvCc+QysvhtAvYL3DJVMh27ytXIKgpNOpum7DptryLpJ6
         vX9hfhutLwcsmQ5NkoO5SsSSkVWWv0SEb14YVC8QVXfRnZcUdfuy52Y3dn/LPcgmIQQx
         uELfJ+0jm//11ud3B+tRNj7YPD50I/LyAAxDw+wCaFYlu+SywUBSdO6G4hPhicfHiKc+
         4+Gpyb9wBfNirX5exBCOQxJ6lw9vpNPt3MzYMd1uWwiK2suWyyQ/VqtEFSCtPGStcOFH
         UOFw==
X-Forwarded-Encrypted: i=1; AKwUvBxaiTdd+P7fTopPvc2aufxHtUveaDFeDNOypkwnc/izmIpif48QuKNrIyUQbx2r82Z6YQ04dncyRn+xCg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTxnt0hqU62Liq23NdzzDVKSP+Qhe24c2emyPiTyMFpKCP/QRH
	pzVDS8HusbzhWYE19AugH3YnDLQ4+ZMaznuKGnHdn3/iPSe2wAfEffsnKMCfa8DmtPeFeHxPIJf
	ii/4HgG1ybuW9bnTrPCh62ZS8GJ8duR4u2iCPp/wXdT53iaA=
X-Gm-Gg: AYBFou2MnDjPlXosPToaUFudwcFKJuH4odYyB0ccFQUnBmEW8GlkGXNyRZBql5l7IrT
	URGYfdKXBbTeisUNWMRCAaldLJZCFdiBNa6/BA8mekb5YRLhXz60zbNl1utv1s4B7HVbPc1644c
	x66VxoUXWls1E5UAzoTBQBF9QdX/P6w0sMrdThRjxWzLWjxBviXAOvX2cGFv3x3chXYkrrGrDIR
	ec7+Jrw8ceZdZTa0wo4vaQJthKXdCYYhIoVol0riu1ldnOnk0c0p8nNXnu6vn4bwsSLOhY81+di
	jXYIhJdOkVh/VM39YOEGAXUtq6s9oIVYyn00vJPK232n5bPkr0+4CySsUSYRpx0FBiwCvubf2A7
	2YNw6Kpkqjg==
X-Received: by 2002:a05:690c:389:b0:8ab:436f:6e7b with SMTP id
 00721157ae682-8b07ee91c26mr65816367b3.63.1792146531063; Fri, 16 Oct 2026
 03:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-fuse-full-objects-candidate-0002-v2-17d6013e5066de33396c@gmail.com>
 <CAJfpegteiu8+=1QJbHq9Z9BuBHRYnmHAkYn2bMxbxxhNGvpBxg@mail.gmail.com>
In-Reply-To: <CAJfpegteiu8+=1QJbHq9Z9BuBHRYnmHAkYn2bMxbxxhNGvpBxg@mail.gmail.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 18:28:39 +0800
X-Gm-Features: AclHuK-KMTYlHjEguu9yYQE4h0G8BU9J8aYJfl5UYC5ANVzGsYvGxeSqHSHMniA
Message-ID: <CAFRLqsWfJpH_TF_B13AzBFGNsZM7MQ3NLJn8tG8Z25RY4XGH8A@mail.gmail.com>
Subject: Re: [PATCH] fuse: serialize processing table installation with I/O
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miklos=EF=BC=8C

Miklos Szeredi <miklos@szeredi.hu> =E4=BA=8E2026=E5=B9=B410=E6=9C=8816=E6=
=97=A5=E5=91=A8=E4=BA=94 18:18=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 8 Oct 2026 at 08:29, Cen Zhang <zzzccc427@gmail.com> wrote:
> >
> > The processing table of a /dev/fuse endpoint must be initialized before
> > I/O can use it. fuse_dev_open() leaves pq.processing NULL, and
> > fuse_dev_install_with_pq() publishes fud->chan before assigning the
> > table. fuse_get_dev() accepts the published channel without taking
> > fch->lock, so the installer's channel lock does not protect the reader.
>
> Thanks for the patch.  I arrived at a very similar fix for this issue:
>
>   https://lore.kernel.org/fuse-devel/20261016082243.2865588-1-mszeredi@re=
dhat.com/T/#u
>
> Added Reported-by: tag from you.
>
> Thanks,
> Miklos

Thanks, Miklos. Appreciate for that.

Best regards
Cen Zhang
