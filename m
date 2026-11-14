Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668561;
	b=Fp+3Eo/xyjflPZ7Foxufxj3x1qp/6cNBDYwks69mYBeNPsXWgHrPURUSlGI624ueaf7Z
	 AwXMKdrDhLb7EetSGKKIUstT/tZ+gvpYdwbBeLvqfPRJ/lg75j8f4Sc//Jk4ykSAaqLjn
	 W/PAUJL/KGyEELrJu2APchwfrKk/DSJsv63pN9iEnIfqpBDJCWmeUzaqJtC9F1NGJxy8w
	 R1e7y/xn0llb0kgexjz0KN2dqQAAHijYlZK+/MKYA69rJv0AxEM/RUf8HEN/9QNZrc3ay
	 iJjESzCRzfHCdNl31uRuCU76atuxOGFA4n7EL9dM8qVa3qAowIAISIp/E+ye+ijbpDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668561;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=P6hrqjHPPwHb0KIz9b8G1qhIpEHHHS1kn6GbRTl0/iY=;
	b=TXHqYvfZlISuSz13gpiEQbyB1EDa8O/aGbEzWsA+sM5xdfHihKAe9IaNN0dQHDfPccsL
	 ggPpAjId9qQuezSNpU6xUbdeLSuwrSMta0yCLJlVr+oRt3TPQKlu2cLQj8DeZHqkjpbu9
	 xARZlR5Zn1QRW0uzeKcPZzaH1a0Px4ySaBDyapIzhmMv7mCegfBLt9giqwmcpTfyHUk1n
	 ahtkC4SVTSjAaqwtWsrb6d3o1bL5cwYHMLzcK3UJyrBILF/QSZx0dcCg87hMcDOpfMwL8
	 fylMg1tZeRK3L11HPU8bocKtIlDpjVnLLLFvPAGet19HfDSBeBcETvu1fICqShRfisw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kgrOE5rg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0273606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kgrOE5rg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955EA1F000C4;
	Sat, 14 Nov 2026 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794668560;
	bh=P6hrqjHPPwHb0KIz9b8G1qhIpEHHHS1kn6GbRTl0/iY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kgrOE5rgqghq6MR3bT4G7mm1czhKXfLj/5AYYI8pzXeLU7HPFB/uMf+dSB09wKMko
	 N1VzNbEEfZEKZl3Nr9gNrJT60zPdowcoyQyleGjlI70+W51xkqz8q8b/Ghs22NI2VV
	 N0EOaWeK7fL6EmzBRcFULexAPIF8/tZRqbP62lzspyt34ZAqRMgM1TyCdGyaPi6Qye
	 SYXd9h4P1g+5TN15NI0fBoHHFJCVIQoL3ggMZ8bGHiSFyAafG9Qz9b/t4kNdMWnu+F
	 fdinh4yg2ZwZzZzzR79qf/pb+ZlZlUD+x8+t3vrk6Trsn1+ouTFmN2zvFPOXMJRIxU
	 UTo9nINgo0P/A==
From: David Hildenbrand <david@kernel.org>
To: linux-mm@kvack.org, "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
 joshua.hahnjy@gmail.com, rakie.kim@sk.com, ying.huang@linux.alibaba.com
In-Reply-To: <20261113192642.2618878-1-gourry@gourry.net>
References: <20261113192642.2618878-1-gourry@gourry.net>
Subject: Re: [PATCH] mm/mempolicy: ignore a bind policy whose nodes have no
 memory
Message-Id: <179466855730.4344.6857220443096829454.b4-ty@b4>
Date: Sat, 14 Nov 2026 16:02:37 +0100
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Fri, 13 Nov 2026 14:26:42 -0500, Gregory Price (Meta) wrote:
> apply_policy_zone() assumes that policy->nodes intersects N_MEMORY, so
> it reads a bind policy with no N_HIGH_MEMORY node as movable-only.
> 
> On systems with CONFIG_CPUSETS=n, nothing rebinds policies when memory
> is removed, so offlining all memory on the nodes a bind policy names
> leaves it with none. The policy is then treated as movable-only, and
> movable allocations are restricted to nodes without memory.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: mempolicy-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/mempolicy: ignore a bind policy whose nodes have no memory
      https://git.kernel.org/mm/core/c/528dc8e1

-- 
Cheers,

David

