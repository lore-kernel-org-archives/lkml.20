Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434271;
	b=PgofKn+/n6MJP6qvdrq0zfBWMkZndg8/9kOgMVrg8JN9FRacBnAXKbQ6tcdPY3PJXkZN
	 Bt1bB9BNQgNQS+zB327XAB1ZBQ1+oRyV5aD6DYwRPHOb/b8yWQjBLXjLMkP0+TvC3eo5F
	 a7yNc98/t1qpqRIG0cLvCSW4daBLMtaBzweMtS+MjePIs5kGq2KG6gkN5Visohu/lDv/C
	 1/kegkZlATWgSVm7+eJKbj9SHaJKlFi5Jkmqbisf5ZvoxXipd3Fm7l5EmnRPocgCO4ABz
	 V5RUTRa29j0QzWCYh4IsXImMZUakOAdoVK8TU4Svl5bboRB7cvcy1mTAc6PCU3MX/QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=kVQzCHWMhDAXGaFSs/w45J/x4L4pGUMMFJgDsU1GON8=;
	b=zyYRuo2qNTtkM5dJGjclGsRAkPABnnDhr0TVUgfDIYQDgzhF1Fk/3g1/MEddRHGFPzys
	 zbNnueNPno2346BkcDxPTKq3N8cX5bZMlW/2vmKpO1mxiTDlnphzHCpfkGZm8gsXIgASD
	 nmYZzbb2u9AjdgMLStPJKUzWLnzNL1B+x20IhFvV3Nge2S5WJXqXtqXGboKlL7LgEhatY
	 0V7QbqUQBn8RjvfUl6ng7DhN7rGMoqo8VyZt3WWRojkiaK+z1hHVc4q2B2mhwMfJo24mk
	 G+cd39CT/oFMYaHNQ3JOgU7NhnyinHqdBUBNU36GHvEKNoZHPvJSjNlwckGYWPLzNBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="mHr/B30u";
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10115606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10115606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mHr/B30u
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98c78660542so1541862241.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434270; x=1793039070; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kVQzCHWMhDAXGaFSs/w45J/x4L4pGUMMFJgDsU1GON8=;
        b=mHr/B30uJCg+9dz8ifw1Ei5OItcuSEN2zojt85n/IH88as3hIjQ6PGxkyo+lJp3HeE
         LRKJahdu0insr50PFyPMoz5QXci5S9pbZV31y6/KtW4nd2PfSltB1urFDw6ZPGGr/73u
         qmjDNT+oCaq9viasnov5gdvHummk2luG4MASYbGTgJe2RnVmA4KB+FtsU9nB1Z3jLv1X
         OcvpWv1hzah9CIEiMpFy2DhG2onQbZh/wOVk8EqhWdv8ByVVLjcVbl/OoMzePN7yfmNO
         at/YzyAvlHaTrxvvj54fFjKmyeYl7HyQKhCC3ShStXGePbZ/b/ZQxHSFGM6dB2j1BK9t
         1v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434270; x=1793039070;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVQzCHWMhDAXGaFSs/w45J/x4L4pGUMMFJgDsU1GON8=;
        b=s1SUN6U+bBwyC0vciW8m+is6SGtdpgU9/GB3YFJFDUPyML6doZNzg+jhY5nkTV40st
         0bklB7RqYtsFf/gnE678jafqM2tP+Kkc/K7Znnz6W36VnYB24Q5QrwOBMpnTx9YPTBNQ
         fJyDPG89QTd092QAWJEr3CkYu4xGNYrNCzm3bj2nD12XM6pI/4ONF2OqDKfLCRH+LJtS
         ndzpkbl4WAnyUdjLHQqH75Fb2wC54s9XcnsT9Z529xkELukw2WK37yu4CP390M2f66JR
         R4wr8w8QnyyMysjzNr+flGHLwJdumoTyA+y7X6c8W9ZsW0Sb8yOesnWJwCQZtdgHQynj
         T/xA==
X-Forwarded-Encrypted: i=1; AKwUvBzUAJ3Cvi+alqIohoQ4dDYubiA6SDp0z29VqGOR6qHYpuDYPFBNUZhPpkynP/4S5UsdNdPMWc/zJxWtcS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1cQfeDsOsDHnoOcHjf4mTHlDFnJkJhKVMSHH2kC2dS9KfkLeC
	xON9QaSbf2Vw8B2rYVE1aS9XEXlW2YUNgoCRNjPeuIOxtmHipxXl2ZE=
X-Gm-Gg: AYBFou3aecmjNOyItx2h5wPuLtPDcdxtj6b29vDViWDnox3TDR4Hr+rAO41rZM40Qgd
	Xl3bACd0CXI1xotyVc/ql4EN1uE/I4YltE1Fijw3QETRdeaoTB6gvHmdc7Aifzjb7P1aNJ8CYzC
	5isMCKcybEhOl154W2XlM1ucLCZ/P/bzkGXEri047BtCN8InE9TZoHVbvSHR894/ueBLv0Z8L2H
	ky6YjNwtTrXP7qNbVrS7+atndaE2/AGXZjeacynYbjpDX3IkexRnHfGZDTzCIAcH/vEaIdPBwc9
	LBp2uuvKLeCy60ZrLpOGWlYoOA6ZLeu76lZqcEAfdHgz9HULyN0QnsgUlbueZbfClpJO+z+YswX
	5zYPC9Ef4Sbw5v5gXreJFJRQbUDsfSCWhvNqiAhiB8e8FYiQH3F42Mfiw6b5nUHDwGY9B4977Yg
	f5AcdFdmXYDSrxAoIl2mIR7lQyl/FGsxE2orzee/FmL+VaPTZGH5p1cebRk6TYlOu9ZTJy/qAqC
	bgVWOoF3Kryw4jjRIxAVHBLerb0BHufkw==
X-Received: by 2002:a05:6102:26d0:b0:7cc:1192:5636 with SMTP id ada2fe7eead31-7cc36905d1emr2860017137.12.1792434269987;
        Mon, 19 Oct 2026 11:24:29 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3642b1sm853242241.8.2026.10.19.11.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 11:24:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 15:24:22 -0300
Message-Id: <DM90X0PTA682.3UJMZH614WU9V@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Brigham
 Campbell" <me@brighamcampbell.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Gary Guo" <gary@garyguo.net>, "Jori
 Koolstra" <jkoolstra@xs4all.nl>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH 1/2] rust: pci: remove TryFrom<&Device> implementation
 for &pci::Device
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Georgios Androutsopoulos"
 <georgeandrout13@gmail.com>
X-Mailer: aerc 0.20.0
References: <cover.1792417858.git.nico.antinori.7@gmail.com>
 <d128d86b751a51fff46a1702b636de74a4807097.1792417858.git.nico.antinori.7@gmail.com>
In-Reply-To: <d128d86b751a51fff46a1702b636de74a4807097.1792417858.git.nico.antinori.7@gmail.com>

Hello,

On Mon Oct 19, 2026 at 1:13 PM -03, Nicol=C3=A1s Antinori wrote:
> Remove the `TryFrom<&device::Device<Ctx>>` implementation for
> `&Device<Ctx>` since it has no remaining users.
>
> Fixes: 7edc491f6fca ("drm: nova: Use nova-core to read VRAM_BAR_SIZE para=
meter")
> Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1264
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

I got two reviews from Sashiko [1]

> [Severity: Low]
> Does removing this TryFrom implementation break the build when
> CONFIG_DRM_NOVA is enabled?
>
> The commit message references commit 7edc491f6fca ("drm: nova: Use
> nova-core to read VRAM_BAR_SIZE parameter"), which is not present in
> this baseline branch. Without that commit applied first, File::get_param(=
)
> in drivers/gpu/drm/nova/file.rs still relies on this conversion:

This is true for the rust-next branch in the R4L tree, but the named
commit is present in linux-next [2] and drm-rust-next [3], and the patch
application and compilation were tested in those too.

I am pretty sure the patches were created based on the master branch of
linux-next tree (because of the discussion in [4]).

> [Severity: Low]
> Since TryFrom::try_from() was the only caller of bindings::dev_is_pci(),
> should rust_helper_dev_is_pci() in rust/helpers/pci.c also be removed
> along with it?

I didn't see this. I apologize for the oversight. I can send a separate
patch or a v2 of this patch alone, since the patches of the series are
related but can be applied independently.

Best regards,
Nicol=C3=A1s=20

[1] https://sashiko.dev/#/patchset/cover.1792417858.git.nico.antinori.7@gma=
il.com?part=3D1
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3D7edc491f6fca8e22f51e37a16d74914cd959274d
[3] https://gitlab.freedesktop.org/drm/rust/kernel/-/commit/7edc491f6fca8e2=
2f51e37a16d74914cd959274d
[4] https://github.com/Rust-for-Linux/linux/issues/1264#issuecomment-619469=
5910
