Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.196.96
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293992;
	b=yuL8P2Qv1Uo+LClsdYauwLZrXuSQPNni5vbsjVvVh89vq+ZzYEHOOEfXhcfXLdWnWsFN
	 EDJTLlTE84reIQvPPewEJbs2vy/l74bcAQuVBA/9EF1ruWtx1MvAGPSasoWlsssJ2jpP+
	 2TdSkakXL+5bp7JkO4ZYxiqM5iPz+7KUKRQW9oZdIYS1m0GbJwT5R1yQs7GXUmf/ufSjU
	 l3jK11dEoEFMKttyY4dHKcDToO02RDT3TCUpOYVqR3M0w/UlFcOs+7Gk8yCZM/XVqlRiU
	 1WA2jzOttfb1owxhP8HdG+eIZ89I6v+1A0uGLOK/peajphiLbBSIffWJ7aEw75BUKLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293992;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3JqNgxTP6qF/uh7s0hDBAOp+BiBb2Ay3BGjN8pwmpWI=;
	b=IvpovDGtJqd5s/7/sycP3bxBwxc1LFDwmP4EQAKrycJxNduiREMrxff/1zv3Wwh+HG/C
	 IG6bVE/D4VW+GGBs6cJXpIDJZID7U3KpepIznHwJCVRM4O3TEdiF6jDSWfISV95wb7wfR
	 KYuxHo/itXPh8hyu7mpWZ5gPW2prUvagzan4bDhUiovqs5GWLnePeRArFvSABeN2haYao
	 VNJjdK0t3aPyhnC0xgDO0qsbDso7nR15g1zhCYx9ur0bT+QFNUggOZQs/OU2uq0hfPdwk
	 tZFHlguExZa9cPyy1+eg+s37c/gN7pjJJ8He1v2TgQN3WIHMoC8amKtSPsgb0vdq2Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nod.at;
	spf=fail smtp.mailfrom=nod.at;
	dkim=pass header.d=nod.at header.i=@nod.at header.a=ed25519-sha256 header.s=v1-ed25519-20260901 header.b=oyRwHVuC;
	dkim=pass header.d=nod.at header.i=@nod.at header.a=rsa-sha256 header.s=v1-rsa-20260901 header.b=Km10Z0YH;
	arc=none smtp.remote-ip=188.245.196.96
Received: from calculus.sigma-star.at (calculus.sigma-star.at [188.245.196.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849D0606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 849D0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=nod.at header.i=@nod.at header.a=ed25519-sha256 header.s=v1-ed25519-20260901 header.b=oyRwHVuC;
	dkim=pass (2048-bit key, unprotected) header.d=nod.at header.i=@nod.at header.a=rsa-sha256 header.s=v1-rsa-20260901 header.b=Km10Z0YH
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1794293969; bh=3JqNgxTP6qF/uh7s0hDBAOp
	+BiBb2Ay3BGjN8pwmpWI=; b=oyRwHVuCEhzrZ0yi4CM9LFckMC8xze/6i8UL0YMByGIQfsJcQO
	c4hJejpnl8RbqE63BeaqrH9/XRzX5mVCBKBg==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1794293969; bh=3JqNgxTP6qF/uh7s0hDBAOp
	+BiBb2Ay3BGjN8pwmpWI=; b=Km10Z0YHXczK9nddurm0YZccmlPDPCrUEyl9Ce8o2bQEvtXmDW
	A3jTdKgQZMlj6oNKjJL83IHFlcYU8yBUr9PwvXz3YTYspbFKVgW3joI3f343o2Bdf738UwAx5/5
	KXg6QvOLVu4oafuLn/kg7QfmhLlnXrf92jbUfVAQhWtz9NQ7uU0pazsnyZkgwFmpbZQ/3pJEYKZ
	aOOybamt5zIWZaTTmInHOn3Jzo1CYflUEOmFDT85ctE3vXfXLif4VRvcwnaLIxwa2II+23Uuoum
	vQE8M5ZSh2QCurBmihVBNJAZCo1rvE2eRwLjs8Ay+wq6sHCLITNd9attg+RMZPZd7Xw==;
From: "Richard Weinberger" <richard@nod.at>
To: "Alejandro Pacheco" <ale@alepacheco.dev>, "David Woodhouse"
 <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH] jffs2: reject uncompressed nodes whose csize and dsize
 differ
Message-ID: <mwacav99.b8118d47-0161-4866-abc8-fc544b4ff347@nod.at>
In-Reply-To: <d1220d53-17d3-4ff2-b145-09047eeb7e23@alepacheco.dev>
References: <e979229f-af42-42c3-987a-c2ed289d8fda@alepacheco.dev>
 <d1220d53-17d3-4ff2-b145-09047eeb7e23@alepacheco.dev>
Date: Tue, 10 Nov 2026 06:59:29 +0000
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
Content-Transfer-Encoding: quoted-printable

Am Tue, Nov 10, 2026, 03:27 schrieb Alejandro Pacheco <ale@alepacheco.dev>:

> Hi Richard, David,
>=20
> Gentle ping on this one. It still applies cleanly on top of
> v7.4-rc2. Please let me know if you would like anything changed.

It's on my list. Currently I'm busy with other things and I need to allocat=
e
first some time to untangle all the patches in my inbox.
There so many duplicates and AI slop that it's hard to filter out the good =
stuff.

Thanks,
//richard
