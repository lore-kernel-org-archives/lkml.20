Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668839;
	b=1JkvW7jPTmK18JSoJMjpu6nGjrJH/VgRBQ9euvtMCIIyMgHhVzAaO0/W3U1iYr7Obzkh
	 69/Kcm+HNCQ7iReZ76s7UiWDtP3rxYA4Tkm/uZvzHslAVX77gSDnvgaFW6s9ut98ckNZ8
	 FCXLsBK6K5A3Ym4sgoqdDH7X/rBNPPHp7n/enM0DhLVdMpPJCvFevORpCw0a8X1da8pig
	 TpYhqvx78jZs7w7tTcx7DxFm/XL4Uf8B3gyuhM9M8bZVA5b+7RVFBZBCh7oP/K2LUR1Iw
	 Rx1YV/0KhxWOzXqEbNuRfR/zo9npYn9/CrvQuAS7aJ4YEgHbGBPTGPsVviCuaWDQJWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668839;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=ILj94+WskYmEK4Z/53i495F3j5ydMt0bfq/GRWV5o3k=;
	b=wua8HZIemqp1XKN2f7ZRCrz4aBlEYC9+90Iw8NOBtwWvNZeCNFERdmoFEjMj3HsqHOA+
	 KXRe2/6z0DRjrlwA3QZsRsaQjqz9yO5Tr1CpV4qXd/jIv5DvZiV1kGW/I11JKVKQw3vAE
	 N6kKoxn3wDARbaIOsXleyc+3ifNuBh6lfUIOHcgLhO+RRKkQ7/ogUjjgqz6liWvsoc1wR
	 y/1Vo9IoF6a/+KQRlxANt+T8XMbwDMTNXKdn8q9+E9VDu4Tz0+sLNETUXcBlabEzREJKd
	 rViHt3rEJSwx0KG6ptiIaV+jH0aPF12lcuF9t2ZH5b27SlLS18wrD0HFZXpJmVua7XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MoupP81X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37FF606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MoupP81X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA5D1F000C4;
	Sat, 14 Nov 2026 15:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794668838;
	bh=ILj94+WskYmEK4Z/53i495F3j5ydMt0bfq/GRWV5o3k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MoupP81XEoZLNGgPlnJf1bBzyzyT3Soss/Ait7cAQwp66sjPOLAnZoZyNMmpLCth0
	 n51UaiVYncDWSMJnvjnGBbhWZWI0YoTeK+4XI/ttPFs5mFYeq4GM96UG2y02qRrnZt
	 QAUgqeTwa6Wgi2Nsgg/Blb/ulPi38ZNLnzg7dhh7VsnmsX16MaVjK6ja4DQBrMFRpn
	 668jKuNgUjgAhBzSSPkKeAB1Io8BRtz9y4nedxGSr1LXybl+u80S5Dv9+JnTpnnP3M
	 vlL4Y4lf3I1mIcsHJkM1wH05HvgZmYy/DNs7nUSFcN+L8s/zJaCwJhhGSHunCI/J7s
	 IUUgwUmsADyow==
From: David Hildenbrand <david@kernel.org>
To: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261112-pagewalk-doc-v1-1-6cc5ce7148da@gmail.com>
References: <20261112-pagewalk-doc-v1-1-6cc5ce7148da@gmail.com>
Subject: Re: [PATCH] mm/pagewalk: document missing struct members
Message-Id: <179466883554.4943.14548802291606306999.b4-ty@b4>
Date: Sat, 14 Nov 2026 16:07:15 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0

On Thu, 12 Nov 2026 18:44:07 -0600, Oscar Alejandro Sánchez Lucero wrote:
> Add missing kernel-doc entries for @walk_lock in struct mm_walk_ops, and
> for @ptep, @pudp, @pmdp, and @vma in struct folio_walk. Also fix @pte,
> @pud, and @pmd descriptions to state they hold entry values, not pointers.

Applied, thanks!

tree: mm/core.git
branch: core-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/pagewalk: document missing struct members
      https://git.kernel.org/mm/core/c/8a834f42

-- 
Cheers,

David

