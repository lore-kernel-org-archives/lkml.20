Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAE83B3C01
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790802088; cv=none; b=pI5wh1IqKX4jFKWuexEGuudm4TIjS9oQJjdUdNnweTQrPaE+62me+dIuHqYLQt1NOYjmYlte067R+Pe8mQ0VbCyIa7njpPMTitPbf3jwY2dE3sXonrOwaFA/6o5ns7LXvRAxIWUDW0L0b6kK+bM6iIocRjxzFMjVLKQhAcY5PO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790802088; c=relaxed/simple;
	bh=h8mTmxiMa6j0BDVpqQQE8qTtnaK2gCeJkwytdDxRrLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJheeSPd2hepvGfI2aCfhxx4XLiw2YV3ZZ5GUXw7TX58RgbcQLF3bh3tLADoGgq6L8Ode+ttqgu5Z0jyavpoU42zDzcfVeXfJD+rlJMIy44HmwtF9QjFeu+L5KeMomLW+eqxRbzhk7JUr1yh4hvMNeQnu/VpeF8qyh/Y9CCbWCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHTE7awB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHTE7awB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B402E1F0089D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790802086;
	bh=h8mTmxiMa6j0BDVpqQQE8qTtnaK2gCeJkwytdDxRrLg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CHTE7awBingCn6+CYnIDvtmoEtX5CC/dNbrjVt90/jJs4T/nAh0ycXq+HTgAmXx5c
	 t32uij/TWCWTFhDdgmmNkFHysE+ad6PFrM1iQrjzQ1Zhi+sqosXIaoFGtZGx5DtZg9
	 6Hlu8rmsFQQZo4venEv792b/0RfwRTH8ebSgvwJc2eb3L4tsanemFe6TTlmJRVSr5E
	 oiBejPZorDHIHs/8e/6s14WuD/hiNNyNqQVGdqQ0lJtScqzUHhngi6XXHD6GJY+W5x
	 GDX/9yZ8LB78g+ZyGwq23ha/NUy8cosSj43RgPEUQmSx7kqRvDx44EMzm0YPA3xb+0
	 95PWH9GmgKNmA==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a770b3ee1aso14672091fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:01:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByII7MylxPj1GFT7VLCtNK/9VmJZ5Qr6ZVBE/YBaoW/p47b4EBGlUmCQI0vDollIfy3zEuTp/rNpL5JQz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdQutc0AtiFXTPj5BPit782BEIiI+JH8A0kFMm1acMW/J3Xdoh
	SDqghoxGVT/Zk+s8968X1xFXVsxnJha4u0pe9AVqKdfrNtmrG9wRZVoK1tyW4hT6V8nrXEEzkA3
	ZziUo5KO/78bt+C1tTWVK/xz+4TE0sh8=
X-Received: by 2002:a05:651c:418d:b0:3a6:10d4:61c4 with SMTP id
 38308e7fff4ca-3a779211d2bmr8529901fa.28.1790802085503; Wed, 30 Sep 2026
 14:01:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-4-will@kernel.org>
In-Reply-To: <20260918161407.2300-4-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:01:13 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Z01dxFg-+9MhNot2ibMoRnQwRQH--7JQLhFDFOPYzew@mail.gmail.com>
X-Gm-Features: AclHuK-CpLbmzPeMGgGn2WiiLWja7WmeJfZTnIg6LGM9G8yhcOxSzBBWyakJIfg
Message-ID: <CAD++jL=Z01dxFg-+9MhNot2ibMoRnQwRQH--7JQLhFDFOPYzew@mail.gmail.com>
Subject: Re: [PATCH v2 03/21] arm64: stackprotector: Temporarily disable
 per-task stackprotector
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, David Hildenbrand <david@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> Per-task stackprotector relies on telling the compiler about the system
> register used to hold a pointer to the current task. As we're about to
> change that around, temporarily disable per-task stackprotector for now.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

That's not the only thing that breaks in the patches between here
and re-enabling it, but what is the alternative other than to just
squash all the patches into one :/
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
