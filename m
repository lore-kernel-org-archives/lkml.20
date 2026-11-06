Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968063;
	b=qyEYu0w92vthoQ+LY++4Rbqb7pztR83Zjk04RYIvaXlfLK05JZKPN5J2oM+cF2qRNfmP
	 8IEV6Ulv0xx2wqdeYLspOFmVo3k+VXN5kWNocW1ntLooZ60b/lb0EwPHpj8EizgYPTDec
	 vY3vsGsLPvoAAf95yFYytl64oKlGRErvfRSlmfXmkOQCNrrkvbikBITxKOqD1QFDRF+fN
	 vPK5fx9jkNeIAIJkJ6PYLcAI5WCfEXRyW+uCefGY0k9vn3qm1fXhhWPSFeGF+DhF0bKLB
	 iVDg+XJhN8G9bNDdqcZcTfG/BHurWi7zAObZAt+/xS+1bsj/5U3Ng7caVbDdmicPQlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968063;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gXaYki6uWSOGEqG2nnwjkCld7NyYwmbFRUn/nj+UBJk=;
	b=eEzIL9FHcx3JOvp0xtowRJyu3mzHCCBhJtW4zLDhZxsGx0BiKSBtc3bD2/T0iEJ2DUXH
	 o/U3RYKQJm9N/eEhfY7/AT1WFxT2tDHFQn3Mo2eBmZJOjnPD9bRwZj2V2SwsjPsfKAg72
	 uA0gZvjTqosHL9DLzmZ7+JypxNn3d+YOif3zJIxmiu7+OS1dFaNXGwTXTLJxYwk4QxeYp
	 /gs2EJAxKtCO7XBLC8mMhPVL8m3r/jPriQwMO1IwUF8TohnGl9ffmY7GB2GCxzANxuoRc
	 oMe4s2aFv0ENwV6AcLod7Jj3inXMSSmbX1Lk50gdDZFNqOcAoN36JrSqioH8JdvNzdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WRCNHhnj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2174606A337
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WRCNHhnj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228BD1F00900
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793968062;
	bh=gXaYki6uWSOGEqG2nnwjkCld7NyYwmbFRUn/nj+UBJk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WRCNHhnjK2/U6cTw19O5vG9KnmkI3EATjgbS8Vp12vvdhMZw0bS6+u2k25MpIX5OL
	 DijLA0057PexK4ZzikC7TgmkBtj2z12XbLzUGW1HtdyFQM7tci5jDlubuBkxlYXlVW
	 e4FxoCwwLEn+FCeZwcv17e4QFwMJv7QlTSaT3WvBrn4YjYa00g/SxWMlat3hOZtwzy
	 jtfgUoSW489vYcpneHL6LHI2uSsRtrRndthhPlDUwBXQhtZt8S5+7nyTNxlEccLcsY
	 pbB7E9esK+k5zo8A9LhxD0KUVVz3dYp249aLeA2wpE2QfWs7O8vYd4C4rnePrtv72K
	 AJEfXS5X32zrw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso658013a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:27:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxsKyTMSgJ0GwYaQhyxyDTnWSSKG/N/x5RxS/XdqV34RGfTrpsq9hM8aZrspnxfuqGZvfBoj2UVi/L9hAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EvKUByV18o68hcYUokxEgYNawUEx8FWI0VOP8WyxCK+YyvsQ2
	5e0leaxab59w5wbYy76a2vfNJ0nJ70S+IOA4+Tj6uHrVr30eZD30wdH+eCWIS2komoQhVkN6KfZ
	mSZfjzhwwxr+2Li2ByiZzqBQHT8WODXs=
X-Received: by 2002:a17:907:1b2a:b0:c42:102f:15e8 with SMTP id
 a640c23a62f3a-c4d35413244mr208015366b.14.1793968060730; Fri, 06 Nov 2026
 04:27:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106091420.2461683-1-wahidzk0091@gmail.com>
In-Reply-To: <20261106091420.2461683-1-wahidzk0091@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 6 Nov 2026 21:27:28 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_te6K0uKmJNQDzi9E5=-wqrQ6Vc7MP_cZpGCQZK1JaGQ@mail.gmail.com>
X-Gm-Features: AclHuK9pyTUmpj4YjLkVERCMkUy0IHDLyx8Ch1ej0-bKsscvef4Mm_oafumewPk
Message-ID: <CAKYAXd_te6K0uKmJNQDzi9E5=-wqrQ6Vc7MP_cZpGCQZK1JaGQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ntfs: three fixes for crafted images, found by fuzzing
To: Wahid Khan <wahidzk0091@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 6:14=E2=80=AFPM Wahid Khan <wahidzk0091@gmail.com> w=
rote:
>
> I fuzz the new fs/ntfs driver with mutated images: an image from mkntfs
> populated with ntfs-3g (directories, streams, sparse files, long names), =
a
> few bytes changed, then mount, walk the tree and write, under KASAN.
> Three problems from that are still present in ntfs-next (e62b384ca).
> Each patch has its own trace and the reproduction steps.
>
> 1. ntfs: do not read an index block outside $INDEX_ALLOCATION
>    A directory without a usable $INDEX_ALLOCATION hangs on its first
>    lookup. The task waits for an mft record lock that it already holds.
>    It needs one changed byte in a crafted image.
>
> 2. ntfs: open the index allocation before reading or writing an index blo=
ck
>    NULL pointer dereference in ntfs_ib_write() on link() when the lookup
>    ended in the index root. This is not the path fixed by 9365c4a1357e.
>    It needs one changed byte in a crafted image.
>
> 3. ntfs: open a named $DATA stream by name when making room in a record
>    WARN_ON() in ntfs_attr_make_non_resident(). This one does not need a
>    damaged volume: a file with an alternate data stream and a full mft
>    record is enough.
>
> All three need an image to be mounted, so a crafted image, not a remote
> attacker. I can send the images (about 380 KB each, compressed) if they
> are useful.
>
>
> Wahid Khan (3):
>   ntfs: do not read an index block outside $INDEX_ALLOCATION
>   ntfs: open the index allocation before reading or writing an index
>     block
>   ntfs: open a named $DATA stream by name when making room in a record
Please check Sashiko's review comments:

https://sashiko.dev/#/patchset/20261106091420.2461683-1-wahidzk0091%40gmail=
.com

Thanks.
