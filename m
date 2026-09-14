Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444B447F2CB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395546; cv=none; b=rbo9CHOARRz1A4BwZN9wedPpc2FsQaWUO/nUc0wwyxgCYmytKwqFe6UfprOUcvQA1fevaXV0t3MzeyyRF798H4tDrCT8BrxStxTlpmcTs1Nh1flMRGgXRocdSFPxar6gcKkcCNX8HqATyP/8JK9DTelAN0IQ4xPHX8bSe2SG840=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395546; c=relaxed/simple;
	bh=y+rIsWzSA+6uWvV5PBJwke/G8LxmV1+0yMywHiJ3kog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GwEWXjoH90Q88oLVVheJFBhak+kP13fH+A4Gu3RPrBuLTLjb8A6UrYVmmbYBkbDDdAHWd/T8l0bu8T0lvo2EYGDIvKuAH5Y4AzRUcR6u7gV9SxT7ZqtzZmBgwGK5M0vU9dSJir8h8yFCah8NdvOi5LZ+7hFtLQOa327qOhHQLjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgPmyk7i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgPmyk7i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C061F00893;
	Mon, 14 Sep 2026 14:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789395544;
	bh=OFE6uBPFy4Kt8NhVjhn0jBJdyEdXEQesNbkMWPSNUKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LgPmyk7izrcUpjeKGhUiZcgQlMrVMfYeKHLBjt6KodimObvxWPd9D5bL1hGSm/jX5
	 2Jratysr/vUFRNXQBfC04P9HuF+mtQiIqCMGZVArj6hmwPWxIQRafTv0XN9MY+MFRm
	 6wMbaeWOLjT3FpLLU96V63xMZiLzJ+NG8b4Bj28cIBQHNvNgo/9Pzzm4O14rxo7YFa
	 CkA7CoJmYiewokAsjLUMYV3Ldlzjv8fX5IS7UviZ0g3uZEU4gbnN6prxdZo1HmwM1D
	 DAHLpdUc2g9OIyML+QIxq6bmKwI7ZU8IEcH+pXuNChPWiwIpCpoDCsA4HwXnm7ykPR
	 S2mQIE7H/4Ezg==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alexander Sverdlin <alex@sverdlin.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: spansion: Cleanup S25FS256S
Message-Id: <178939554286.2550426.10506559169174764251.b4-ty@b4>
Date: Mon, 14 Sep 2026 16:19:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Mon, 14 Sep 2026 13:50:35 +0900, Takahiro Kuwano wrote:
> This series cleans up the S25FS256S entries in the Spansion ID table.
> Remove the invalid s25fs256s0 entry and assign the existing S25FS-S
> fixups to s25fs256s1.

Applied, thanks!

[1/2] mtd: spi-nor: spansion: Remove s25fs256s0
      commit: f917d9edf54c3dd578efc231b8fbcd35744f99cd
[2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
      commit: a96edc3f0b4f036a5b6ebc9b1eca4273ef5ce2d0

Best regards,
-- 
Michael Walle <mwalle@kernel.org>

