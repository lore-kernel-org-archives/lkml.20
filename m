Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93BC518138;
	Thu, 15 Oct 2026 10:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060329; cv=none; b=gLpgMxapsPDA12HFq5BFlu6quI5WeGV2Ofu/H17HIU3TyXYM2Ve6vF3HY6ikch4EJqlgu18oaaE021LLJtAZaHOWI2IE3LvuuqXqMg2y/P7LU5T03mOtwnVv08GwtF0psEkDIXZDHmz5kjmTL+rUVqOnxAojBW0IRPlvw9kH2vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060329; c=relaxed/simple;
	bh=LcWbFO8zjAN3DhExzsNtFCgaIvqYnv1vk4kMT0BDPig=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mA7S9xCijGhRETRPkaDjxMEeAtOP6ZAdtvA5BCh1o4QZC7wKGYr9XpzzrgTH2vyYNoo6g7ujQXvNOlWjjRukDwbbuJuFt7XT6TqJ69uyGUrWdR1x+lQY0Ky5LzCImt9AjW6GN6+SWmFC5hntgjJT0yXyGaR5Vw4gvAyIjQEzjYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWyTJZci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWyTJZci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFD81F000CA;
	Thu, 15 Oct 2026 10:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060328;
	bh=jDnCgTsFaG3i6YRuANbbCPc4tFO5pxd0EPf4KSAuchY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kWyTJZciqMqr61y1Ag9eqhBevVezxIM1cEg7awV0qK2CYXyl6Gh/CWopkelhvH5h7
	 AvewpxGbdsKYm6t3+ayHtbHr3rak1q2SM1MEk39R4MdAojrTVCy5WFQJ1X2LNRNr+0
	 fCVa5skJYRstfgzWBa2QoNsNSGrkXW5WVdOUtllT67jRG1DKggXE04RZ4mxjypWIf9
	 aJhqzCbA0CBWq1GLMpVONS+/O76je5L6vL7lXRBIAtMmgTu0FQs3XrkGIWmrl7bTb8
	 m1BWyrOhiwsAFkAQpdGJymTQZnJnVH4rKErX+MIn50E0AFW4Vv78jPlRL1uCJ5zh03
	 zyWHiHBmk/K1Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Milo Kim <milo.kim@ti.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261013181417.492252-1-clamor95@gmail.com>
References: <20261013181417.492252-1-clamor95@gmail.com>
Subject: Re: [PATCH v2 0/7] lp872x: remove platform_data based probing and
 adjustments
Message-Id: <179191936114.42298.15974586022772125890.b4-ty@b4>
Date: Tue, 13 Oct 2026 20:22:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2025; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LcWbFO8zjAN3DhExzsNtFCgaIvqYnv1vk4kMT0BDPig=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIurF56Sp1zo3r8wgPruZ+c2S8kblvH9c3ayO+m1YrZN
 +2TS1b/7ihlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEbv9kZLji18y440Irf2z3
 7sTpIuL3BcP/XLzAscVY+Ynu9yiPNnuGPzwvhA3XzS3ce9FaMd/vadUfQY15Gp+DxH5UsX1Wvbm
 XmRMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 13 Oct 2026 21:14:10 +0300, Svyatoslav Ryhel wrote:
> lp872x: remove platform_data based probing and adjustments
> 
> Upgrade schema. Consolidate driver file, remove platform_data based
> probing and add missing regulator/chip supplies.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/7] regulator: dt-bindings: ti,lp872x: Deprecate ti,dvs-gpio and ti,update-config
      https://git.kernel.org/broonie/misc/c/c299083f5d00
[2/7] regulator: dt-bindings: ti,lp872x: Document input supplies
      https://git.kernel.org/broonie/misc/c/3fa475838a7c
[3/7] regulator: lp872x: Fold driver header into driver file
      https://git.kernel.org/broonie/misc/c/2411d590ac10
[4/7] regulator: lp872x: Remove redundant regmap wrappers
      https://git.kernel.org/broonie/misc/c/67b4e8a9426b
[5/7] regulator: lp872x: Remove platform_data based probing
      https://git.kernel.org/broonie/misc/c/58f1f2c36970
[6/7] regulator: lp872x: Add support for input and regulator power supplies
      https://git.kernel.org/broonie/misc/c/646e25232f75
[7/7] regulator: lp872x: Use macro to fill regulator descriptor
      https://git.kernel.org/broonie/misc/c/399bc14dec56

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

