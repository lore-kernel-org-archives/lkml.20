Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D1152121F;
	Wed, 16 Sep 2026 15:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572596; cv=none; b=jYPiSdfa/1iPc46srov9yB08o0KNJrHDCqY041sMsIdD5PaAPBITVTEbOS/sLLSaCP9ku9pdIWtKQF/vRPIokfXjbyi6hiTFC//jeHQQIpavYmWgafRQhsbbrGuzZd0kBWLCMDTBhSHyHw/8yEjuOlkntanyvhWYKA+GIwdAq6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572596; c=relaxed/simple;
	bh=8xhpwGozIr0T1lmQV0OryooWhP9CgyIQHWmTMTrbzqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZdcCe2BL8pGLRUe1EqfF3l0gYNQjVF6UaBfpTPjADxPg6Run/UFn5C7ky2dh9xH8Uz3p5Rv5zj75SBxIXU4clAENmY6xGBmM3zDAfFwO2/nLFsouejkpUoBp11v4eCGT3Woyk5RGIFpHIgtbepDf+xDzczXZXhQlAaSf634kyAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9MMBGAb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9MMBGAb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B371F000FF;
	Wed, 16 Sep 2026 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789572590;
	bh=QvxmsL8bBryD13yQT4Sh8NN03a7Rkbq2gIRrlYpwI50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=j9MMBGAbLsrRCAD0MM1rs/mTSCMpMA5e0VeHa0Bulw8MSzsgIJdNw2tw6lSu3hOS8
	 E80ewJgQTR/QmnQo1row9OYYxEqevjyy1DOsRy9EIaAXLLBKaKZqXvdj8YBdxsQNa+
	 Dp1+UqV7fkz9xX3TrbsmjEIGnSvNwrMF+OsjuY9JbTdFKwyEwYm7HR7of3XL7sb/D5
	 U+vhqLa1JB8YFN8NSR3SWSnzN5DYQ+VXOtI6ZEU0hsjQEzuXif1EaiQ/NMnKFDUJfZ
	 Dl5YCQmdP3Mk3n9O+ow9NZDVmvu5IwIp4ZOuUYTLLuGpqm7E852hlVecAkFX9zchz2
	 CusGF5wlZDHeA==
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260907045526.18873-1-hemanth.selam@gmail.com>
References: <20260907045526.18873-1-hemanth.selam@gmail.com>
Subject: Re: (subset) [PATCH v2] mfd: ab8500: Fix typo "interupts" in
 comment
Message-Id: <178957258952.1739336.2506970336565641469.b4-ty@b4>
Date: Wed, 16 Sep 2026 16:29:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 07 Sep 2026 10:25:26 +0530, Hemanth Selam wrote:
> Correct "interupts" to "interrupts", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches a
> comment, no code changes.
> 
> Since v1 the subject carries the driver name and a capitalised
> description, to match the MFD subsystem convention.
> 
> [...]

Applied, thanks!

[1/1] mfd: ab8500: Fix typo "interupts" in comment
      commit: 708222feb63451ecadfd0a70a5d99f96c7d021de

--
Lee Jones [李琼斯]

