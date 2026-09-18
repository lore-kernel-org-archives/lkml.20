Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797C530B53E;
	Fri, 18 Sep 2026 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734504; cv=none; b=kfZPf6PdzbNwxrdhGpssGpH6q8lr1DUwkiowLXqa2ReeTOQnBUqE7yqFWtWjkGeHUmW6ZCzyzl9fNGYvtjcouxcQfgweCGJcFAJPdYluM0WZEx41S7Hdce2F2qk5fMXaRCsm8UejMnGWsI4kJjcNecpHXn5V5vGwlyOQv76b204=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734504; c=relaxed/simple;
	bh=sFgd2AHXuL8t5mnllgJ9v+bBdWF3SiwzYQwOTUCwaCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eUv1UEze3BvjWronIXqPfxVFr3eVmE7pvi2Sr9C/SCrB2Uk496vhwtgSVs6yrr2PMhoP91HUgikhgxqMB3Sl1jsjiskGCE64bnJ2+pR8wnEPvwhbdudWyXQtxLjY095ojTo4RcftOfpEqTQ2UR2/0rkHivhFcLTRCLGnoTYDrNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aavxnDm3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aavxnDm3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB0A1F00898;
	Fri, 18 Sep 2026 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789734501;
	bh=GF57Guc/hEoVR1W9U/7839FvcxFLrW5Z7yneN/laqwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aavxnDm3rLFcdc2xDDtdRHhWAkkn7ROT0+84yG6Q0r1tqZQkC8NNmYieKrOnZhOgJ
	 r7obWAvVm9jfF2yObC61EHeJ5I8YFL6pXuLcu0G9ri2VKMANMM914vGlN0vcu6BgjJ
	 6ePy4bH4JivPjNbWt6Unug5Ot45RmMrkAWJzI4JAHFoXHi+nRgjuDXpAD2MnhVfOmg
	 9fjg/RpM/DUNo8sR6wTPYB8bRlYBLz361d9E97CFMtAHGTFztPRlJCK9lnL0C+M3qk
	 MX+LmyaQsQEBrPC5nBhbWbB7UXQ1ReX9dNHfghvU2ar606E3E/xsbLT3BssLxJ9JPV
	 itc4mogiZzE6Q==
From: Will Deacon <will@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yureka Lilian <yureka@cyberchaos.dev>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH RESEND] arm64: Add override for WFxT
Date: Fri, 18 Sep 2026 13:28:07 +0100
Message-ID: <178973022288.2321839.7112827418351546215.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911-idreg-override-wfxt-v1-1-7917636741f3@cyberchaos.dev>
References: <20260911-idreg-override-wfxt-v1-1-7917636741f3@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 11 Sep 2026 19:02:10 +0200, Yureka Lilian wrote:
> Add an override for WFxT support within ID_AA64ISAR2_EL1 to allow
> it to be disabled using the new arm64.nowfxt command line parameter.
> 
> This accompanies the idle=nop param introduced in a previous patch
> series [1] in dealing with misbehaving WFI and WFIT instructions on
> Apple Silicon SoCs, and eases debugging of other quirky WFxT
> implementations.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Add override for WFxT
      https://git.kernel.org/arm64/c/baaa9b126b87

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
