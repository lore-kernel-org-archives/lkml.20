Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263949;
	b=fyHOKs5MKoVU2p9WvlxN59O/CgLG77J2mftN7jLW+jVYTWLUH4vnRUHxcjRWaPEdx6XB
	 n2JBMg+h0S713r31XuJvxUK0Jfc334PV7LTnp8sPgWGOtM1u3Wtbpu110wpZFVHkk1Fu9
	 54lKbL7NnbMzLoQYE7NZUs9kqlRvVOpalS+OsNyha9L7nhcGP1cIPGc+sk7UR9NyoJ6JL
	 tVq3/AVHRnwEayWJvWrkkDL03LkkBQ+jE/p7A3JkA12rOaKmwkOXQBFwCi4/isAIVplas
	 y42/+0du8i2qhOZUh9w0o3IYkJC+/wTg8aH0m/R9cS77DG8TF+oL8n0kBHHC0wqbwRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263949;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YLnVFyFONr6IZ0qWnzE2VmACyWLMzOH0CpLjhaa0LKw=;
	b=Nuo/Q8XuKnPbqMZfwW5lKZHN5x1QrHFM0tEpj6LLX2r4ZmQZIvJczmGbm0eoddGgiBBT
	 2GTmwcrRfCGHPs4iHH/uqd9eKL1P5HFd1B0hUgraH08w0QlxN3WzDDf377KLmDZBqKGfp
	 +HopHIhVzWiCn4dwY3BftKBiXONDWPTfRkt1wR1s8wrF+62kyaeC+uENHi8KuzDfB7p/Y
	 Zsh3Vfxtyrzz33ZIvkfFdypfnIitbA4bJ1PaPVy9fN2oznTZKIOsL6pVu7EpUMqco1OSw
	 oTxYSTPg8PW2sc1CqK+CGlej9tdu+F2l/SSyMRq0ehcfko356bgtJr4aEybf1Xibiqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZpBudgLJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703E4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZpBudgLJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2041F01828
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263949;
	bh=YLnVFyFONr6IZ0qWnzE2VmACyWLMzOH0CpLjhaa0LKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZpBudgLJKXWv7IjZEBVZnlYK1e81SDSBgKFVE3jfVrlNMMZmTdo9uKOMDnXP2FGRV
	 llg6ZZgC7thyIwFE2agOQOBAxbxwA7uM1lSQWB+ucOcdMUvieFH4fqSstJbddzg322
	 WG0jNgC0T6C843mRcCQzq5fMuWTfs8D5ggfDYbuTop6/VJLmjpxWBrXjIzzwQUcGfP
	 qtNb8ZeF7rHVjZpbI1Igp3c28AsFP4DUr/Byhgg5E94Qm8AfSoybIt0dLJZJNNLoQm
	 Sf/jSBsfF8LlkjAAkZFKAoDMDGPD8fIfNWBmXbV31PnXV/foSdTTbrj4Z3PD5p9DxQ
	 FqO9BGWDWIQqA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c37b612635bso253641366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:52:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz9jelNeLh8nFg02Auy9y/JX0KkPulIMsRDlSfkGvjpORZILhycNKi/oxVq9jFJaIjymGazh202AaJUPQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlHtOxOr8EQmxWxpEEHSpmqI3TH9WxAmZk68sMJIIdmZB1wCrL
	T2HXg1RSMr3yDEprr/7XLhRYDdWxWek/Otamk32Qj/xortNJo/HJ3Gzkz/2XdgEPbKkbUdCXyvR
	vytNMloP9dXh4UJcdfxMWnDw2wCVzgsM=
X-Received: by 2002:a17:907:e0c4:20b0:c49:cdc8:10cf with SMTP id
 a640c23a62f3a-c49cdc81499mr178546666b.40.1793263947788; Thu, 29 Oct 2026
 01:52:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028080656.1027283-1-zenghongling@kylinos.cn>
In-Reply-To: <20261028080656.1027283-1-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 17:52:15 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8F3vbDWJXQPpj_oBU-OhnUCEvtmfXPHAFL5V-J49hJtw@mail.gmail.com>
X-Gm-Features: AclHuK-VCELxn05ltUOsNiLGpudT_YW_HimgIUoBT1WVRj4F9xgQqRgf2Bbe040
Message-ID: <CAKYAXd8F3vbDWJXQPpj_oBU-OhnUCEvtmfXPHAFL5V-J49hJtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ntfs: keep the file size on a failed initialized-size extension
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 5:07=E2=80=AFPM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> ntfs_extend_initialized_size() only extends the initialized size and
> never changes the data size, but on a failure it calls
> truncate_setsize() with the old initialized size, which shrinks the
> VFS size down to it and drops the page cache beyond that point.
>
> None of the callers rolls the shrunk size back.  A buffered write
> into a hole has nothing to roll back - the data size never changed -
> so the file keeps the shrunk size even though the data size on disk
> is intact.  The mmap and named stream callers return without any
> rollback either.
>
> The sizes did not change, so nothing needs the shrink.  Remove it.
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
