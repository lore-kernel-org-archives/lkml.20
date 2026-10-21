Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593340;
	b=BHCAugL+VSnz17/S2+7yZ/nOl8mzSt/ME4KvoOf8ytsBLldI2mo5NKTTa6VmvWh/Us6Q
	 KEJpK88fgoWTD2Z7CAK9xtNf7cn/Tr51HXuxqjmbnbkm6wZ108EtlOVggsxrjsrFBNcbS
	 wu8oUgF5qH7VzIpMmzfDQwiIke2kThBviWgI5wbP6DGhYkTS616X30IfaUWIEcRz395uA
	 Fo+dFMnUv5us1rfqsAV9TgBdSZUQdkIDAn7s1djKkNV5BalHvjODBkoypQCJR4WoU/bf0
	 TkGd50fsSLmQCqVOhWk7p6wHoxfPo3q/wFUbHIjCINPJm8XQ3nP0pOE5VKoFWUMbuog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593340;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=hs2GSp5wBVscxyuN5/J1aSAgHTZwqMhi9T+F9us40ao=;
	b=nLwbVPrSXg9tM7UMbB5+HpQp7Ax+dBFuW0xjNQch+d5bsiWar2S5gRz/lc41E9D1DVVZ
	 bKK2eqEIIQniW6gdMVko4PDvFOfAj+ewg2beiG3A4zFX2WQqixJXqykgzjQNH0t7Ud/1q
	 FbNrahZX0UNZrz53ibPe//8B/3K3r29tmneX1qB1ZV2XcA+dXpSNAmnMCdctCI+w5t9gm
	 Me6fIvLTckSvLhTz/KvC0afZouyhfef/Juwe65laaKCFMTtkU+ynSF+udFsLS1YRPRecN
	 BbpvDnaGyv0Q0uTMpD6ndISODmE38qODvuXyeVZuWN8RFPxeOy5oOfgenaX3nxEJG3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hd//Klit";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF3E606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hd//Klit
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F281F000C4;
	Wed, 21 Oct 2026 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792593340;
	bh=hs2GSp5wBVscxyuN5/J1aSAgHTZwqMhi9T+F9us40ao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hd//KlitNpsAvoSdCFOnEKdopip6xaN4TR0tCShAz2g1Mlllpbnbexfni2+wv+T4R
	 fNwec2mUmmgfIaHJpxNMWRgiDXIiwLpKqzbJ54ipBNOWmBD5jR19cpn2yddqZbfhqA
	 0OIHm5TQEuXH/hrjWngSJl//eGFozcayxf7sDTPaR/sxU1Js7cYbXmsH4XktvCyyY0
	 95ymV3mJn6GEu4t2N0d7k6AOK4GtFS7cd0RGisvwpmoCQ+Yh2SzXssOc3XKObMYLH+
	 dmq9O4XcoMgzvzxCVkenF9QWXE0PZLWx2+CZRTe12Hn6xeGUxlCI1Z6xV89Fz2NEgt
	 iCHnjzsu0GMxg==
From: Christian Brauner <brauner@kernel.org>
To: Alexey Gladkov <legion@kernel.org>, 
 "Eric W. Biederman" <ebiederm@xmission.com>, 
 Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Serge Hallyn <serge@hallyn.com>, Bradley Morgan <bradley@mainlining.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261019185913.805378-1-nickolai@csail.mit.edu>
References: <20261019185913.805378-1-nickolai@csail.mit.edu>
Subject: Re: [PATCH v2] ucount: take the rlimit reference before checking
 the limit
Message-Id: <20261021-zweimal-kutschieren-leiht-94d9218ef57a@brauner>
Date: Wed, 21 Oct 2026 16:35:36 +0200
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
X-Mailer: b4 0.17-dev-3d1b8

On Mon, 19 Oct 2026 14:59:13 -0400, Nickolai Zeldovich wrote:
> inc_rlimit_get_ucounts() takes the reference that pins a ucounts level
> while its rlimit count is non-zero only in the walk whose increment is
> the 0 -> 1 transition, and only after that walk passed the limit check.
> A walk that raises the count from zero and then fails the limit backs
> out without the reference, while a concurrent walk that raised it past
> one keeps its increment and never takes one either:
> 
> [...]

Applied to the vfs.fixes branch of the vfs/vfs.git tree.
Patches in the vfs.fixes branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.fixes

[1/1] ucount: take the rlimit reference before checking the limit
      https://git.kernel.org/vfs/vfs/c/b9742ebcce34

