Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3663563FA;
	Sun, 27 Sep 2026 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790527847; cv=none; b=bIX5tF61Izviut71nDtXdDz4GlQ3ovSJH0MZIYt+He9rftlifOUkIxWCsmMuP77ZW2p4ZCnlwOKzEB2XH+N0SYCQ0B5CUAuZzvS9yB2ZbrPbuO91lCAoujrmmLVXjMzBqq8gWK/qbCAAmLifetLJquBAmdiUBJrXnj5qhp25Gh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790527847; c=relaxed/simple;
	bh=W2HXUiys3LGbxm3XGgUdZ9VD6f2yAoAEVScvRVgCpq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HeEju+AC2l4gGU5MeldLPvOHIeubh1MyptmA98FIrnz4xnQNXJq0e74+V3+TDchwbwj6ZSK1UFnroDO9VEGrP0vlq6BnUYwCTEQ5s2CSYysFV2ZHR1q2h/y12Tc+yLwCl1Clf0mExYTg/mmBussO3PnmGVC5Kf38+lv/YFLyMKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g09DHE8l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g09DHE8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5D81F000FF;
	Sun, 27 Sep 2026 16:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790527846;
	bh=xh4KzMUFpTj8qOebhQWdsAIU8pmtZ3z7e4KeEKEYSgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g09DHE8lTWfUZq2Qm6MoveJcrsrICkGKJ4Y4TmvPsp0pIpjTZlNyUv8NP/S9MDtac
	 aeliovvMLSurJRMDWqtFO0/cfWumaZl0cmHgtvV51OCR1UJWYahkLKqJ4u7aeiTulJ
	 4PEvrHhAbYUItiG0fJk3V2wcF9zXuOOwdF08nAcJp70/gopo27XjwH7LUsUMdYgWjw
	 q/ifnlvtSTEwwQggl9WzhB1r+hTdbwDvEhPOvdOCgaBR41z74a7z5g6EKux5fzyDOV
	 aP8UaU8fGNEu7ySD8iWcaiRukpdZxg3xIeytw5CU9UQMBAF7bmVlJtCX5y3M0Kxy5N
	 mBfUivAbSpa4A==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: apple: rtkit-crashlog: Add AArch32 IOP state parsing
Date: Sun, 27 Sep 2026 18:50:29 +0200
Message-ID: <179052779403.16295.253181744749057325.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
References: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 19 Sep 2026 00:47:02 +0800, Nick Chan wrote:
> Some RTKit coprocessors runs on AArch32 CPUs. When they crash, a 'CrgA'
> crashlog section may be reported containing their architectural state.
> 
> It is useful to get it so as to figure out what the firmware was doing,
> add a decoder for them.
> 
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/drivers-7.4), thanks!

[1/2] soc: apple: rtkit-crashlog: rename 'Crg8' section from regs to aarch64
      https://github.com/AsahiLinux/linux/commit/1a2ae085282a
[2/2] soc: apple: rtkit-crashlog: Add support for AArch32 state 'CrgA' section
      https://github.com/AsahiLinux/linux/commit/4edbfa916dbf

Best regards,
-- 
Sven Peter <sven@kernel.org>

