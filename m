Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955903403ED
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970531; cv=none; b=hRWw0QUipNDknkObQOMjOIz9SfEVCkeAHvTg+m7gXb/4JedFaSa8byKY3nPV9KJIoX8GoL/CDKSMXUPSKbw6MU4zN4Bol9F8Oi4LX4quhKQF3eiwl62oBVS7HOrt10xd1NKqRovkWyTWie3u4STlaGe9to6Ug2+yUl+Af+WNEak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970531; c=relaxed/simple;
	bh=mly6/gP9F/dCbeRJLHD//4+FgUdlvU+nezq0U6KGgaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DQL8V0cqJ31OrccmGz8tcmSBdus/1SoqztMUHJK2TVZqIQjJsaQDGO3YSlUVvPGSyZ7wS5QL5Vfkxif/3sIhPW5ZYhNg5XPRw3tlfyDcK/EXjucaDF/TEjAQpYegKaWU5uCrgg/jlwDcBro2B5BVGRZF3t+T39ie4x+MBbkQ0Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hl7Jn3Ls; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hl7Jn3Ls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2541F000FF;
	Wed,  9 Sep 2026 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788970530;
	bh=IWu/s8lMLLfBf4lkT9Bk6wYVwZ1FTPhp/al1n5d+IRk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hl7Jn3Ls1CaoYaltrfRyS4f/DNThrjpB+irbvZ6TWX8l95qV5vld65L/nej1RIScw
	 3z3sY6A02ciq3e0pkB2dgDVFQmfZaGwKSIoDz1Fee773GXiegGOcWgh3u0K9VAKjxW
	 GgDtujnfJFpp7+f43TFYsBepMto57gBRqVZH+AWEv8On/gqD9LJon5iIKJGPwrSsCR
	 QYC72+qRLaW4a78Qam53WZN/Rug1xhuDh4nHdu8XjXykpjvI4bsT2d3cbvW6I8H3Na
	 8PCafY0tGvjWn6hkIMu4Oxu/LBHsdgBHhcyy4qzEuF3+8rzFj4/95+JZTfS65JSWZ1
	 uFn6rWTgf240w==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Bradley Morgan <include@grrlz.net>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
Date: Wed,  9 Sep 2026 17:15:20 +0100
Message-ID: <178895828160.667293.6440468899339525914.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260809213615.11646-1-include@grrlz.net>
References: <20260809213615.11646-1-include@grrlz.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 09 Aug 2026 21:36:15 +0000, Bradley Morgan wrote:
> swsusp_arch_suspend_exit() reinstalls the restored kernel's hyp stub
> vectors with an hvc, but never passes the arguments. x0 is not set to
> HVC_SET_VECTORS and x1 is not set to the vector address, so the stub
> dispatch falls through and returns without writing vbar_el2. EL2 is
> left pointing at the trans_pgd copy of the vectors, a page that
> swsusp_free() releases right after resume.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
      https://git.kernel.org/arm64/c/955d86e5f3b9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
