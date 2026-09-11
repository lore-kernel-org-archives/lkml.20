Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C237D489886
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134265; cv=none; b=Z9/PGlLqth0GmsPf+kPPRI48cGikEyv+7b8pR5KKlST2Y4/ORP5OmYYKfKqBcouiefl33FwA5WrdHt8O0iJrITNl4/wdUBksgocTZu1r+X4nz6NX3K0alRmxGV1XNreSbu7yiIV5OFZH4sUe43pxoHU/uFTH339KySPJe+JKMRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134265; c=relaxed/simple;
	bh=V85KQJnv97+dW+4109lJToOuB2tqvpBrGzxZBjf+WcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oh5cqr2O/2BzcvShnWmbVLwA0X/8RmswPi9FJf6aC9/Ad6jvHSDin1zVYmUMsBHZzQDU9gMwbfZaP88LEcHPuBQLHB7Zxp69bAdtlROEDrhLgW8sdeAJFoZ9C2U4qTdrjj6WZDqwBvX6iocNaqV4F/jtqc6eTumY+VckV2yvSfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8wtgViK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8wtgViK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988871F00893;
	Fri, 11 Sep 2026 13:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789134263;
	bh=xrAFeAU1HONhylYuAElmqPqMHQ1RjTCsevj0LcygbgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C8wtgViKBZ4yAXkyZHrA0b4jjOcF5FSxZSKGhvLmk13Lev0eOijLaGm2Ts3YBKjH7
	 AWXB44Drylx7W6vF5mdbKmdo+Ccl3gyhgRiwG1JMBhJ/n/kXiaJdGFxd56tVkp0DRI
	 +Slhj7yvHMOBdLnceMMXOyaI5EF4j0F6DxcNNdWZyfWBk0sXp0WuWMbLYGhL6/V8zC
	 OLTn1fXpnRNftuuFiyXZ22+t0cJMMQTJ793Y+k+uusvs6e8Qr1TWgGNhF24Q7mxXsv
	 dJgl22+K+a9qfGM4sYTwlPzyPIb/r1I6UJ5WanRiFBXleHf63LWy7DUwzXKrTEnnHM
	 X0aXxOXcTzuIQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Breno Leitao <leitao@debian.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] arm64: hibernate: clone only the linear map that exists at runtime
Date: Fri, 11 Sep 2026 14:44:09 +0100
Message-ID: <178912888402.2443437.8441014922865389654.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910-arm64-hibernate-va52-v1-1-a584d9a7d65e@debian.org>
References: <20260910-arm64-hibernate-va52-v1-1-a584d9a7d65e@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 06:53:27 -0700, Breno Leitao wrote:
> This is similar to commit 1537e55728ec2 ("arm64: trans_pgd: clone only
> the linear map that exists at runtime"), but in a different place.
> 
> swsusp_arch_resume() clones the kernel linear map with
> trans_pgd_create_copy(..., PAGE_OFFSET, PAGE_END). PAGE_OFFSET comes
> from the compile-time VA_BITS, so a CONFIG_ARM64_VA_BITS_52 kernel
> booting on hardware without LPA2 -- vabits_actual is 48 and the fifth
> level is folded -- hands the walk a 3.9PB window while its linear map
> only spans the top 128TB.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: hibernate: clone only the linear map that exists at runtime
      https://git.kernel.org/arm64/c/e4a6f57d22e0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
