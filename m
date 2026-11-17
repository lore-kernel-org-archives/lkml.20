Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913623;
	b=cgB07fmC01kTQvdZjncZJqkJgk368jNSVyz1Z++VzOVuNaz+XnyKElZ0/LaydVt3CUdj
	 nqUwtjjFICKm5bGj02TWqfm+N62n5SwfivyjwDtxuh0lJIK9rxqynI8mBJZ55i2uuU96j
	 KYBzcr2/P/HzOZIp+Up0kXAGF6o2WhrggGrfKhQ7ral1IhZKz5osVMpciuVMA66RAeLkF
	 vsPKR3ua3PrhnhPYAelj14Yh+nrQmNqq2K8c6hYAmLertfiaCpptfRl6hmD31drxfT5Eg
	 K3/QkDXNJkp4EM6I3+RYPwAo58x4FobV/gChLeyhQ3HsGiL4j4Q9y3jygdXHufSsLMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913623;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U7eA5LPuk4c/+S8//EtVG4Wjzn1u58voQn2J480A3+A=;
	b=yIOkujftgATpOi0yyNDiDiCHsSfIdBBvV7yzJs9MZs9Tfo//5GPu0XYKMeBON/rci8up
	 0Fzf6+ECbkoqTMLJ3AgP/z/I6spcuLjLItxa85pAmANZSlkvZ27UJxYH+Fe0JnvZBfSJW
	 W2Dm8M7oc5B8NNNaK6tNz5XQ7tDKFP7FQCwYItx2e3q2freWpF5AZF4+pfbbXlnt6vKns
	 mH0Hg561IAF/lOy8b5hQDOpi1GY009rQ16apvDA/79Wm14IomdYX+ap8EuAycIQ6RBpg4
	 aLjHh2sWYzTi6XBwwvPbHLBKxfLv5XRvJ6KWwrzj/cIyKQ6W0v+r+ZFlR7Hkbodjqpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLKINg1m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1455606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLKINg1m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3891F000C7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794913623;
	bh=U7eA5LPuk4c/+S8//EtVG4Wjzn1u58voQn2J480A3+A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oLKINg1mpF97FFcv0O9QmFXoZHzZjGZGTrDEVNGAwkyBdhc6BvWinyBX26ymN+nTY
	 8gNJV9P8rMOaGrSgL9V101D2JIZetMCQ/vF7S5hPRBcoOaSVT43ROIRtTV1IZhRMAy
	 OdhA5Qx9bRy7t/nX5a0XTre4wdKjMo5rwgH71v3hc7BCElflyO+MhenUDSHAON5JqM
	 IhWfGtdz/p7v5jtiQi+QNVL+jkQLsnJ3NdyRIup21KyLxWjrLGXKDzqvbW9Nm2wOIA
	 1Ba9xrnYK/sWDs62UkPnICQdIjBak5eA0UXmjEYnjJ2V6OdfOxh2X/28orYmkctJ92
	 12LXyhEkZS6Zg==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50cc8e0f84so332249766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:07:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHuCZJnjvkQVWdP0337iwFxxNczQXh3WWcouSo08onUkpCx0PTJOpjvLFk1z9qNetXzgdNrfNj6xdVyWyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W7KN6oMaWYZBIy1HOl4DS3e5m+KWi6r++BovKFAKinHYxIipP
	cSK6rDs8gwANuiPR42CWb3eRy3n48tzt6Jc1jIXAVHpFAMlNj70w/90UJELPwgdpvZG1NhfofMJ
	TSANDstCgwpnm8skTFghZ5+fbKsCqhg8=
X-Received: by 2002:a17:907:3ea1:b0:c48:ddac:7eb1 with SMTP id
 a640c23a62f3a-c5096843bb9mr1090429366b.45.1794913621836; Tue, 17 Nov 2026
 03:07:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116090720.3226446-1-youling.tang@linux.dev>
In-Reply-To: <20261116090720.3226446-1-youling.tang@linux.dev>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 17 Nov 2026 20:06:49 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-a4QMscwfciy9A6bup-kzJwHqyKROhKxoaJEvOkUMNeQ@mail.gmail.com>
X-Gm-Features: AclHuK88_jDt2sIwKx414fgBd8FwyOcClLvEkKx86DnSIZvPL8c7nppncL8vBqA
Message-ID: <CAKYAXd-a4QMscwfciy9A6bup-kzJwHqyKROhKxoaJEvOkUMNeQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] exfat: fix iomap mapping vs truncate race
To: Youling Tang <youling.tang@linux.dev>
Cc: Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Chi Zhiling <chizhiling@163.com>, exfat@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 6:07=E2=80=AFPM Youling Tang <youling.tang@linux.de=
v> wrote:
>
> From: Youling Tang <tangyouling@kylinos.cn>
>
> This series fixes two related problems in the exfat iomap path.
>
> Patch 1 fixes a race between iomap mapping and truncate: i_size was read
> twice, and a shrink in between could make the mapping length negative,
> which underflowed the cluster count.
>
> Patch 2 fixes the handling of the EXFAT_EOF_CLUSTER sentinel.  The iomap
> code used to convert it into a physical address; now exfat_map_cluster()
> maps only the valid prefix when a range straddles the end of the chain,
> and iomap reports the remaining range as a hole, matching the old
> buffer_head code.
>
> Patch 2 relies on the non-negative length guaranteed by patch 1 for the
> hole mapping.
>
> Changes since v1:
>  - Move the valid-prefix clamp into exfat_map_cluster().
>
> v1: https://lore.kernel.org/exfat/20261113080658.2440516-1-youling.tang@l=
inux.dev/T/#t
>
> Youling Tang (2):
>   exfat: fix iomap mapping when writeback races with truncate
>   exfat: don't map EXFAT_EOF_CLUSTER as a physical cluster
Applied them to #dev.
Thanks!
