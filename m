Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB3D4ACC8F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187596; cv=none; b=uNBENY036yjJEAsduWKV8H5nBj3vfufRNnChDgz7doZlPQ5QIRQg3rHoJzduiC7+M8TO3In5hD7yGETJQieM/N4Tg35M+8AdqC07PseT64GxdjwesH+RoBYvx0IpxNPg4lmMCHn8xu2GAYtYgPFiWsl0+Zg8yzuONXnVxLksgBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187596; c=relaxed/simple;
	bh=3VQ3T/dY1nkZkaINCA511AIXTupskpWTUcnofy0zc/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R2EMvS8+h3s58CRUl2zpsJmLAfypwuBJwOEE30Y2P9zvtc5qySfG2WjLNa2RoLF1qQ4YRL9i1rL2+7VAKfCXtdTQfrIm35xYQNFSSsJC28qJkYLY2Axldk/MiuzYzOXcHw0xWIbHkQRQvGJBGpAuIWcruE537qsACYfb2IqjYT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UhCiWVI6; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UhCiWVI6"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03B041476;
	Wed, 23 Sep 2026 11:19:50 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC3C83F632;
	Wed, 23 Sep 2026 11:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790187593; bh=3VQ3T/dY1nkZkaINCA511AIXTupskpWTUcnofy0zc/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UhCiWVI6wgNRodO+cZGss2vSijQ51j1Uu1YNfeUCRuVm7jLhygRW3YGsSOSFrk3KO
	 AC+l0ayr5P7Fqrijv5CSAjovlSl/M5d5PxvQ2BsxmENr/v2XERYURFZA+y35UbZ51G
	 JTCO7BAUw+1hC4oHva0tZFuvvMxEgAZZWVOorbH0=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] arm64: fix typos and repeated words in comments
Date: Wed, 23 Sep 2026 19:19:47 +0100
Message-ID: <179018757672.2942904.4871347795419827965.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904105114.29474-1-hemanth.selam@gmail.com>
References: <20260904105114.29474-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 04 Sep 2026 16:21:06 +0530, Hemanth Selam wrote:
> This corrects 4 misspellings and repeated words in comments.  Each is a
> separate patch so that any one of them can be dropped without touching
> the rest.
> 
> Nothing outside comments changes.  Every touched C file was checked by
> dropping its comments, replacing each string literal with a placeholder
> and collapsing whitespace; what remained was identical before and after,
> so the compiled code cannot differ.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[2/4] arm64: fix typos in comments
      https://git.kernel.org/arm64/c/dc8afa34b5de
[3/4] selftests: arm64: fix typo "hander" in comment
      https://git.kernel.org/arm64/c/1ad42ed8a666
[4/4] arm64: include: fix repeated word 'to' in comment
      https://git.kernel.org/arm64/c/629a472598a0
