Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261971;
	b=USeztI3XsX0v1gyhIug1RltxbqL0zCmlZ9hpZi4My/AVAcWQqDwjTvBD0vuc6YGPWIsj
	 bcm8IIcseD1nfDaT6LFIVGKE1jGjWv+lZ73GqwmyJo2u9F+UvOscleeXdW2E2PlzWRRpL
	 qqBoUHioMg8lDazCyHY4Fuw9Dh/Ags6ExKgcucndo5mPJD1qxLpsKncng8m1ihDLIOr0+
	 rmEaUvMO93QVsj7kI/OSBzfiqMHeg5OEGThTmiPDzJvrCEByZ1QyEmRzEf3BExHjDSSG7
	 IvGhp1zMo/MWhdSwzfZNFP9MibsuMGYXr6SyT2Wsk39ZBE16dx8v+P834BNB+vzWvfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261971;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FeXIiIhrvwIbQYpkMBfVZTtFWwz8pmkJmpDbtGyoWCM=;
	b=tWz5uWvLEG4XvomjjEGdMioE4GhdIUnJNeqseiTZN6wn80E8dTDGuLSB8V9Kj8zxTCoQ
	 WnpYWnussQ0YSp63hTN1hbuIiKPZ3gBj9nBjdJ8YwORP7elwSkvo06YVeKTB+47D/7QXE
	 eE8gl5VlaV+MPYLNFvRSK4rAdH5h+0s0DTKUxs5tUyMHsagbVG+8KuqpYV/jSCnVk4FGG
	 LvqgeCZYJUtwyVMh7pe3OEOVEzDZs35kAMuPJ3+MSTRFmANyyQ7xpqxkg1D7SUjPQssxN
	 OICwWLVc9SMyJeVVtAGUTs17yyn+e9NxCM4+t8Xh5Rz4zs25brvZfXruVjP04+i8QoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SaS1trDJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A87F606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SaS1trDJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F86F1F01828
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793261970;
	bh=FeXIiIhrvwIbQYpkMBfVZTtFWwz8pmkJmpDbtGyoWCM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SaS1trDJ1gzpH2U0IGvtIQG3LLppT2u2ZK7Xc53HihvkiYLkdwb9aAzBz3yolfStB
	 C+qdRJMnj+8s/u5mu7VKoZajBeywc20wIPRj4qHjp6aC7Aejh9PfZ0o3xV3DQnzeQO
	 5uHcAErIy90MHIduVX6vVyt+oe/pDa9TeRhdevpt2X7IriDBvfVOQQNwMLDokKQT2i
	 hQy2qAhWWYGTDFa6Rghl9T6RcB13GdA0r9rQRM5XjcNKSBc07rzL2eacqUyUGAFmG4
	 L/OhGuk7kHzuizwgqX15M2B+2gwt+BdnywdgLJnUOAkZbaBwG0ZN8nDrSwEZQtYeyA
	 kdSIF6XEs71kQ==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4697404c2bso251640266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:19:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwvDZP8Wl2o1F9BmXrFYG8p7j6fxdKSt/rumELj4XLsSqPn4AeudHZMlCvh2bJToaWCrLjThFSc/phmbn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOSl4/P89XBg1EIEX8zEm8EPLVDPqR7IR9G2cnzBZnHaKhJJVD
	KP+o3z1dptlBan+xG/KAgIhNnhzDQPqbXC3EgsJTMOq51MBIpqAErM0jReIk908QoJzn2m0OWHx
	CVRE38U+OZ68jaNjv53olBYx/FuI/vSg=
X-Received: by 2002:a17:907:d78a:b0:c49:8fa6:f585 with SMTP id
 a640c23a62f3a-c49be05b2f0mr389440166b.38.1793261968871; Thu, 29 Oct 2026
 01:19:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029012532.222013-1-icb@fastmail.org>
In-Reply-To: <20261029012532.222013-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 17:19:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9ne0aJudrs2GEqOfTAzquTRN5Q4qfafCFgAo9baqH8OA@mail.gmail.com>
X-Gm-Features: AclHuK8ji3dmaGQDuALVjPa9jyjsHAG8Ln84jsSSYMUvBfi-wh1jPoXMHUmzyQA
Message-ID: <CAKYAXd9ne0aJudrs2GEqOfTAzquTRN5Q4qfafCFgAo9baqH8OA@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: enforce the read-only share flag when creating a stream
To: Ian Bridges <icb@fastmail.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, Gael Blivet <gael.blivet@gmail.com>, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:25=E2=80=AFAM Ian Bridges <icb@fastmail.org> wro=
te:
>
> When a share is read-only, smb2_open() rejects opens that would create
> or truncate a file. Creating a named stream on an existing file with
> streams_xattr sets neither O_CREAT nor O_TRUNC, so it passes this check,
> and smb2_set_stream_name_xattr() then creates the stream. On a Time
> Machine share, opening a missing AFP_AfpInfo stream also writes one. A
> user who can write a file at the filesystem level can therefore add
> streams to it through a read-only share.
>
> Do not create a stream or synthesize AFP_AfpInfo when the share is not
> writable. Existing streams still open normally, and a missing stream
> opened with FILE_OPEN still returns STATUS_OBJECT_NAME_NOT_FOUND.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Fixes: eaff8e924f60 ("ksmbd: synthesize empty AFP_AfpInfo xattr on first =
probe")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
