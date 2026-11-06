Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971909;
	b=Hd+jqfu6n72F0SydpfHKKAcQCIlOOOSfh87nmGxKVh3JewfWuNmbS4gEzuF8+xWArqVk
	 V/iZLEFOl922+/vYjehjkS4k1OFad9M30fqNotRNgd31JSCraXjhf/tP0JtRRZTjueRA+
	 7TqC4QDftA4w+heb7wo4rmeHfSWCh4nIg0d3ie2Rpmtf8bCL0kd5dLq9EVaphOGipL+jn
	 QYGWG4uZDUAgsU9GhiwiKby6TyqGA4jzmIMZhTPc5Fhf6Q4fIHapTErZ9/FDTXqt75n+c
	 hB/bwhlyhp6KS1++FHO5m2aZhL9DkTffmvN4mIrpwACPRzzCTOUJOUThkNxfc7kje/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971909;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mhTP+ansnWyCnsd8FIk5/G7cqO8hbPbQQPwxhP1XaSs=;
	b=RsGC/5WOYvtdlS00Bws/8JRuPDVsYhfGy7zobezZ7Xr6aRl1oDCvGCepFLBOXyHNW9Ne
	 GdpS4qiHxn+FPT1AMB6d7xraRChGWruA3xG+zZTuCAZb7M54AVHFUKPkhpG+CGsux2Sp8
	 kZnqBByyYi+mWviAMayrTX3LwekYpEubISmw6pxTXmUGZmDmOL4TkQTu2O4IEW9YYn2qv
	 JAD5ftoTmZCW37Wywqt8bMJXhObuWY0rqJCyGtP/1qmaqRoiJ/zXk7G+sn9B14OsWLCa3
	 RNPjRTKM9Omwjn7Lo3wGGOZf7QYsnKH8Q+FxbLdpmojXw34+X8Sp5oZ8rTiV6ivZWGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nxbGiJNd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E4F606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nxbGiJNd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F161F008AB
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971909;
	bh=mhTP+ansnWyCnsd8FIk5/G7cqO8hbPbQQPwxhP1XaSs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nxbGiJNdCDRPpn3Ds5xruEsDGjB8aOc1P4pg/362ujTefX0vgYJQ8lTUBvRzkr862
	 f7ZOiH5+YiYCrn1QDti0o0wKJm56Tp4BObB6JTy3yjn3dmycy+nwl4x4jCXkC7XlHR
	 rJZqt/6madjZa7ORCtscUytSSC5kTYL/m1PWeEZtHPcDc0X7mt8Xr2AFySGrUA1V5N
	 9KrHlseIOueB7UVeOi3ot+l4bvnWhU7tHgVKbiANWlkTtvLFKS+A+hj72UlMB0Esb/
	 +NxMUv6Z6wP/6Z48o9vrqC5jBNKcJf12QfyvPldO0A+xuSSQIMgemeRdtDqsCnJ7N3
	 2+ePiWFsMPL+g==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4ced671398so74847266b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:31:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwmg1LTGRi2PaTy59fC6ZSRkfGVUpoMxSD49SQckLOgsl2gJP7S1TE1qccBFgq1zz249L89CdxZbeApvrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gp25opbiW0maaP31xFPjeNYZsoIkOOxAxAL/if5tKDkXjz3yp
	N1w4fwFtKRMPwo6FLaUit9IgC9dmsWhSpI2KV5j6uDxasu3XgAw49uctrArvlAu/jHyfAC0rF0p
	mfvKB9dGi87dHDUzqMPMkLME6NTeNQys=
X-Received: by 2002:a17:906:c150:b0:c46:9ca9:f524 with SMTP id
 a640c23a62f3a-c4d354b9d04mr222051066b.32.1793971907691; Fri, 06 Nov 2026
 05:31:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106124553.2617026-1-wahidzk0091@gmail.com>
In-Reply-To: <20261106124553.2617026-1-wahidzk0091@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 6 Nov 2026 22:31:35 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8kw-aU=skSEtuE6w3_-gpb-RcHNqEf-b6NRKmx7k1BVg@mail.gmail.com>
X-Gm-Features: AclHuK8QlL2KYAlZd1A7gGj73Ok5BKOYr08SKud368ZUdJ-5i9SrAT7vTxdKcf8
Message-ID: <CAKYAXd8kw-aU=skSEtuE6w3_-gpb-RcHNqEf-b6NRKmx7k1BVg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ntfs: three fixes for crafted images, found by fuzzing
To: Wahid Khan <wahidzk0091@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 9:46=E2=80=AFPM Wahid Khan <wahidzk0091@gmail.com> w=
rote:
>
> I fuzz the new fs/ntfs driver with mutated images: an image from mkntfs
> populated with ntfs-3g, a few bytes changed, then mount, walk the tree
> and write, under KASAN. These three problems are still present in
> ntfs-next (e62b384ca). Each patch has its trace and reproduction steps.
>
> 1. ntfs: do not read an index block outside $INDEX_ALLOCATION
>    A directory without a usable $INDEX_ALLOCATION hangs on its first
>    lookup. The task waits for an mft record lock that it already holds.
> 2. ntfs: open the index allocation before reading or writing an index blo=
ck
>    NULL pointer dereference in ntfs_ib_write() on link().
> 3. ntfs: do not convert a named $DATA stream when making room in a record
>    WARN_ON() in ntfs_attr_make_non_resident(); no damaged volume needed.
>
> All three need an image to be mounted, so a crafted image, not a remote
> attacker.
>
> Changes in v2, after an automated review of v1 that I checked by hand:
> - 2/3: ntfs_ia_open() also succeeds for a directory without
>   $INDEX_ALLOCATION and returns an empty resident inode. Reject an index
>   inode that is not non-resident, as 1/3 already does.
> - 3/3: v1 opened the named stream and converted it. That would lock the
>   stream's folio under the mft record lock, the reverse of the read
>   path (ntfs_read_iomap_begin_resident()). v2 skips named streams in
>   that loop instead.
> - 1/3: unchanged.
>
> v1: https://lore.kernel.org/all/20261106091420.2461683-1-wahidzk0091@gmai=
l.com/
>
>
> Wahid Khan (3):
>   ntfs: do not read an index block outside $INDEX_ALLOCATION
>   ntfs: open the index allocation before reading or writing an index
>     block
>   ntfs: do not convert a named $DATA stream when making room in a record
Applied it to #ntfs-next.
Thanks!
