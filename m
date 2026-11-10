Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329709;
	b=wHksVNQt0n9K90dTY3ksgJIXGRtawfWx0djE7kLN1AbwsaqMamAUZFcWnbwKf0iafolW
	 9VaR8Hqw8R0gd21ZKbnLIal66DHxcaiR3zKvE5TSPYGyRqJqw8pi00zxnbILyg3Q2UVSs
	 mGwFqKvkO4Z0jDm8G8cUAHYI6Kx/8AyUIREePHzVMaL3m+Lk3jDVdkbxgTZwzITCyF4An
	 z7nnu8dc5FKUi/EG+rEFeN0UQ7elBIc9TeWl/AV7zl0Hupw4KX9MiA2p1W8pMtinLRj+J
	 IP9JcDXFqkcudbwnds8cJ7Ienkwjl16eI6MucmilCOGbhlY4MuWYSjRVNVG1j8SJeYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329709;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=fX75Z40RlddIrDkoWsoAk3U6fOiHoJGDsJ5/Aw5b1AE=;
	b=2BMFpcn5HzHOzBIlTTnKoKW39ys0sLNinFG4U9jeYuudjUmU7BkatQClQnoMG7Gubxb3
	 F1Eym5GTcd7Y2qSW2sRIj0ZDVaptR7yPSeN7qyDHNW5s/QQOOu6sQ/HsYwV+tM3xau4co
	 W7qyb8jkjE9PusEBTdhYADmzKXl3em1sKHxNNtsvjiaYokxzg76W+eaPtLeJKVCf/d/ho
	 s5AxDmr8JHZXaSCaBlASI28o2DDYTOz51dnbioe1IKJiVW5Wt5/m+X1naCqgBlrd06Exf
	 uC6P4FTqf4Xq3/+w18uAGFJ/wCKk2BLRDMV3lj0xV/EgIQubRe2QpxqofX2O72nGPDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHn0uj+s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF77D60A383D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHn0uj+s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEFF1F008A1;
	Tue, 10 Nov 2026 16:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329708;
	bh=fX75Z40RlddIrDkoWsoAk3U6fOiHoJGDsJ5/Aw5b1AE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=UHn0uj+sFtGKGaLst/9muipxKqjAxKUpZ+JoQnL+duqe8G78dsi/abK5ag6CP9hJm
	 OP5wzOYOlDurhfr842HXp3hCAWB8YDNogKdbp/kzN6pDU7wNgpzn5749pSO1boCZlt
	 6wKejwWgFp+/su6c8JaDG20/CEgau226J8buSe7UDs9TKi6Sya0uZAbn2NkUxGa0fo
	 Et6Ef7UU2hOmBhoAKI5VBA2QYe5TXWmSOwZBsfBCWaIAh+OEfwpcnPN03mNODB/uDY
	 ZVJy6DuuviuuIuoQaLsxRS67TEQW/x2dI791szWv2aYwJ9hb0qxQUwxo47LjbLxQwd
	 9MBtuukDIdtTw==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Chen Pei <cp0613@linux.alibaba.com>,  George
 Guo <guodongtai@kylinos.cn>,  Kexin Liu <liukexin@kylinos.cn>,  Sourabh
 Jain <sourabhjain@linux.ibm.com>,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH v2 2/3] kho: skip zero-sized lowmem and global bootmem
 areas
In-Reply-To: <20261104-kho-bootmem-sizing-v2-2-b0d1a834780f@kernel.org> (Mike
	Rapoport's message of "Wed, 04 Nov 2026 18:50:10 +0200")
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
	<20261104-kho-bootmem-sizing-v2-2-b0d1a834780f@kernel.org>
Date: Tue, 10 Nov 2026 17:55:04 +0100
Message-ID: <2vxzy0b0hbiv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 04 2026, Mike Rapoport (Microsoft) wrote:

> The lowmem and the global bootmem areas can have zero size, for example
> when none or all of the memory is below ARCH_LOW_ADDRESS_LIMIT, or when
> either of those areas is explicitly set to zero with kho_bootmem=.
>
> For a zero-sized allocation memblock returns an address without reserving
> anything, and that empty area is recorded in kho_bootmem. If there is no
> memory below ARCH_LOW_ADDRESS_LIMIT, allocation of the empty lowmem area
> fails and KHO gets disabled.
>
> Extract a helper that checks for zero size and allocates memory from
> memblock, and use it to skip empty areas the same way as empty per-node
> areas are skipped.
>
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> Reported-by: Chen Pei <cp0613@linux.alibaba.com>
> Closes: https://lore.kernel.org/all/20261026131851.9942-1-cp0613@linux.alibaba.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
