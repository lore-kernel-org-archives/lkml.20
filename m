Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909696;
	b=T2fP0K0FJBc+3dOCe/My0ib5D/v/x2+pTSLRuQznIUS+Jzm6zazttJ/8m9hTlhB2MDRS
	 Y0z/16klg9m1IiGyosKbTDpFLcLn0CUutW8mGKweW4ISs4Dqf4fvjJfzGCcZHDFKgiK8C
	 SyigeGSTWIbQg0D/4X61stzBDKKBP7PzB/NDuJG13VYDcMmHhyO4Jd96ONPf+/yn2ReG9
	 h8aS3/VkyXHaiDkpqFIqrBuNtKhobHJXaRBr2/zFV9+WOet09rmaXKcrGFzPUQoAZGqPO
	 iEJlzwQj7O04KEUJt6VMTsAz0nix8d5+0wMr4nE9GItttYvBP3xBddko0CN4S4Z217w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909696;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5oABWPCQflLUdKTbaIQUUOlSS1RGm0erDPyxm9dVT7E=;
	b=X2Z+igGzdbTMOjDr5sFx/I/uvePW4KJ+BmmFuCeq8kIUELepjhAOhQpfWycV6S/+4g9R
	 07KSB0hrnDX2cMhh5fBTZmdNjUjeD9mztaIOCWYP4KlS4/4W4uMdTRaPhuzI0wNVE5Fkr
	 UAqjP/48vvuB8kVktUfKV1TQvCM3xNYIhsIg12yZsLx7rLy6DNcvYr+vuhWrQnH4uLkGI
	 nZX3oHwvpZNq8Cmcf6UaWQ0kTEoZw+mYpTrNoEBa8vVymQk5dAowcbUwfzFUNQy9p1sUy
	 BObPHa+e6Wt2X7amarleWp4St5WbFzkrvjcTzj77fa4CUo35lLqYDuYPD1fmi+rPDCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPjlXGFn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB50606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPjlXGFn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDEC1F00931
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909695;
	bh=5oABWPCQflLUdKTbaIQUUOlSS1RGm0erDPyxm9dVT7E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dPjlXGFn5f1uNLVj3maDK+PGwOiHUTLKPCiWcOPWQuNfUhLUbp6oxT6soenc0wGQV
	 oWgyb5J4i1Kg0rmJgW2eNt4MpdQ3b4Ahn+Fef0DGpgxVCZLfZsdUw8k4vSie8EbdAe
	 iK+lK9TP8Zd9NvOkly3FuyUY9E4YyrHjK2JgeLI7aENbnoUQglZA9fM48fgqtKTIMA
	 NUhvwDSr5V6Y3tHT9bbaJlSCsu85TLKRmIZjwZVraiNDn+i8Rj+ADMP/fvBx8fjeF8
	 gWcTc91iOVB4TFYWYiQdGhKEIvsdtGUK/w2BVfR9OCuJI7o7iHEc0rTkW14emkxjMV
	 CgqySzLCi3lnw==
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-745497ac8fcso1326071137.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:01:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHHTVP5fyt4l1sU51MohzYA/8rfjM9IK8DqpLgGLOLfxSK9uZZQZJvI9//yDwgx3ZHSE3DuS3ZDi6n57hU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5OxZGvilygcdG7gCvKpkJW/y0bw15en4oxtvZTF+cIYGhwfWv
	aSvPYm1D/EpXFE4zIJLaPV/UxEZgjFz8GNQYHcGG4cOkAg3tlIlgjqaEfaWr4RkdnjV0orPT0ik
	B4SAYIdVjN1TfwbX6Tr9aTVpLECYBetg=
X-Received: by 2002:a05:6102:3eca:b0:7c3:6466:3155 with SMTP id
 ada2fe7eead31-7d64d8da06cmr3888168137.33.1794909694939; Tue, 17 Nov 2026
 02:01:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-unused-sym-mm-v2-0-2f845e94dd50@amd.com> <20261117-unused-sym-mm-v2-1-2f845e94dd50@amd.com>
In-Reply-To: <20261117-unused-sym-mm-v2-1-2f845e94dd50@amd.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 17 Nov 2026 18:01:22 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yteXmuK=UUyBjKFSkKsX=+pOJxRXcCoxf=Xeq8EgCEkw@mail.gmail.com>
X-Gm-Features: Aa3M54p76ruRPy5nC_e2T_VRxviAo5UTb8trf4PyX1lbTffANmrCzu4bfZBZpDk
Message-ID: <CAGsJ_4yteXmuK=UUyBjKFSkKsX=+pOJxRXcCoxf=Xeq8EgCEkw@mail.gmail.com>
Subject: Re: [PATCH mm-new v2 1/5] mm: remove unused helpers from pagemap.h
To: Shivank Garg <shivankg@amd.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:17=E2=80=AFPM Shivank Garg <shivankg@amd.com> wro=
te:
>
> invalidate_remote_inode() lost its last user in commit d73065e60dcc
> ("afs: Use alternative invalidation to using launder_folio").
> mapping_clear_release_always() has no callers.
>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
