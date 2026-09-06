Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B90438330C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788700844; cv=none; b=mBsMVl/FOk556buxvcSKuJq24giPaPJjbEXrm0WeLihNgXTCa5rIiUdwY/Jfho6iRZHiPpKd/LFcdSKPfRj+qRgcY/liihyURfRo483SLis+VyG7g0iRQaaBdx21pwq9UyAKtu+kTxyWNHCRKNS77uzXFWhrYRGSWZtVeWdQoLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788700844; c=relaxed/simple;
	bh=JaDqY+FMnvMV9N3lkdS7P2z3YllJmR6KY4jBHM+kse8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AouCXTNSGoAliX/a5a5uR1L1KLCmwEojYzz7vZsPgx8phmEUutu0BGYvpWquNrt3Jo/yk4vNqNUcGZbEftTSvQ1hWm1zs5GYlLmxW1cLGNxnk3/vMpUFHHjhlXHtjUVkiR7KL9dkb8bOilQympFOpmhYx/F+Kuwf71NUJlvqG0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=D1pDpeqA; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="D1pDpeqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1788700825; x=1788960025;
	bh=Bo7D1KVEvw4vJzHAZyECQCZWWddAzI2Ir5Nr3Dj6Dxs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=D1pDpeqAl9mOF1RUw3klQZfh+qC/2dPE6o3so9bJz2beu6sGNOdbFITxEgx5DA1Kj
	 q1a4HVByMcYwKgXYbZrTSjsBDrXc8OUfCCBg/3CQshsGOhOuDpd4PoDhquzMraYwPk
	 O3N/XY5E4rDQI7/dQuBomkeubgb7s3gScWED0UEwY3RCYH4rhHYRv30oul3I/WH2oV
	 lrCR549w1nQLno26gw17uIpxYiEEtGgnpzbj8KqD7D/q3ZssvSaKAEUps+ZEjYlAJp
	 4U6DuqAUoaPub6b7FNwWIy2n1evCsGu0ACEjqn96sa6HsO1QPp3fdaClkIPff3wCgP
	 1kI5xBBn+okOw==
Date: Sun, 06 Sep 2026 13:20:18 +0000
To: "hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
From: Tobias Jakobsen <tjakobsen84@protonmail.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "clm@meta.com" <clm@meta.com>, "linux@leemhuis.info" <linux@leemhuis.info>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Status check: dropped CONFIG_X86_USER_SHADOW_STACK fix in vdso Makefile (a48acbaf99d2)
Message-ID: <ofdR9pSRAmQ7lqupZ9_7rWr3vopf2pSRMnUi7Mq3MKoCahxB1sENnVCPxuw9HV8XUW3bjqTvi4A4QQG_BdgduvtxBfkD82cH6KZZJgnlMps=@protonmail.com>
In-Reply-To: <E2noDa6jo1NnrYFapbObdbWsUaIxYsnVxVN3X6bbrj-oNKctuuMb1dmUqNn_P5mWqFL4fOlCwaDuAa38ICbsAfNnOcwLUKIVEPyV-H3w6_A=@protonmail.com>
References: <E2noDa6jo1NnrYFapbObdbWsUaIxYsnVxVN3X6bbrj-oNKctuuMb1dmUqNn_P5mWqFL4fOlCwaDuAa38ICbsAfNnOcwLUKIVEPyV-H3w6_A=@protonmail.com>
Feedback-ID: 214933398:user:proton
X-Pm-Message-ID: 8d9665bded3c6dc9e81d545f0570cbcf232ee239
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, 14 August 2026 at 03:19, Tobias Jakobsen <tjakobsen84@protonmail=
.com> wrote:

> Hi all,
>=20
> Following up on commit a48acbaf99d2 ("x86/entry/vdso: Fix filtering
> of vdso compiler flags", Jan 16 2026). That commit fixed two of the
> three typos Chris's AI review found, but deliberately left one out:
>=20
>   "Chris's script also found that CONFIG_X86_USER_SHADOW_STACK was
>   missing CONFIG_, but it needs a different fix."

I wonder if this missing CONFIG_ will be fixed before or after January 2027=
 which would make it 12 months to fix a typo in a Makefile. What an absolut=
e joke.
