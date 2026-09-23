Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B9441A766
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187587; cv=none; b=U5ngxBIdsl/XqlIZ24B4kPe914CG9EHkS4QLveTxD4GeCgSuNoNcSTKCbhZjGIeYlBWif7/mFutETYK8fjIFOD0Bu4t2L+/mVPOAvSefYFZDKWTmNtSfvtGO3A42af2dgtD/WTEoNKD7NTHPLAoa85JzbWkWPjcExrA6XSpa6TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187587; c=relaxed/simple;
	bh=PbQLuwLwXn0fX1RVLXtQOqY+MF5vBAWCmCnBChPy1a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I+oQF/LHA3uUBXY7iaaAcGPbxBXkhkFE6hPo4YQHL9f0GmKLQPRv0T50JJw+8AegyFa3Zn7pOeGTYHLkOsZ2MwQt2aq0H9UxhttEXoWXIr3ZDC/JwJlhvDch8aOnWJ9i1c/i+EePMbVBMPX8qp+2WvwcIoxFGjjDO9lY+niSzz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dj0qfraX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dj0qfraX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94D171576;
	Wed, 23 Sep 2026 11:19:41 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 063A13F632;
	Wed, 23 Sep 2026 11:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790187585; bh=PbQLuwLwXn0fX1RVLXtQOqY+MF5vBAWCmCnBChPy1a0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dj0qfraXAH3tlJFvcGRxEz+5Hsb204IK0GSZzFtEwYW9dhsKtCrrkONxdi1m4po0X
	 v5lFFyylvoXB0Xsy2MLFoqMWNl7KnzQ2kE/X/uQ4GNswhRqveEJUd8S4/zZurC4mkl
	 B++XSPtwzpy15UNMV/cp5G+MxZVQWVWw0RwjousY=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/cpufeature: Change description for ARM64_HAS_LPA2
Date: Wed, 23 Sep 2026 19:19:36 +0100
Message-ID: <179018757671.2942904.4569029517179842152.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916055141.2702145-1-anshuman.khandual@arm.com>
References: <20260916055141.2702145-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 16 Sep 2026 11:21:41 +0530, Anshuman Khandual wrote:
> ARM64_HAS_LPA2 represents CPU capability detection for FEAT_LPA2 both in S1
> and S2, regardless whether KVM gets enabled and uses the same subsequently.
> ARM64_HAS_LPA2 in itself is not really anything KVM specific, although the
> description suggests otherwise. Drop 'KVM' from the description and update
> it appropriately.
> 
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/cpufeature: Change description for ARM64_HAS_LPA2
      https://git.kernel.org/arm64/c/9d9523b6cf42
