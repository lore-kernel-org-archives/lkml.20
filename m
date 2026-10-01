Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA5937DAA3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871152; cv=none; b=YNU5o5Ec3lNmTXjAB991oafSmnhtntTUtF/NUTAtMTVa4vLZniSfpuWSDCJs54bWzR2MaZVaYZnnb+zxCwaKgcPSkTrE18j5NdoxOnbGI2fpheK4jZHHfOGW2eiB6xlaavo+yfArcqTi5hoAHVvNCebvoAbsXuaJuLFxse7zfpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871152; c=relaxed/simple;
	bh=9bd9AEnsGKNpH+D/yIPJ3kXVXuQ9SDa2Lj8IdvT698M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EVxym3MfxOCeZQIEakfZAJBHz3T5pW3sClm8J1ONY578KPTTU8naHcCXURiqxhY/79/Rq0T4kqg7PvLTtwXpr0Wu9TEj17AHsHs1NHAsLHi1vHxjRRZ8ZSO8mD5+KPbBa390zDo8Z/4omAjxfxksIp/Imi4Az8N0ssecBHmctzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=s08UdgTt; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="s08UdgTt"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFC6D497;
	Thu,  1 Oct 2026 09:12:26 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C7B23F8C6;
	Thu,  1 Oct 2026 09:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790871150; bh=9bd9AEnsGKNpH+D/yIPJ3kXVXuQ9SDa2Lj8IdvT698M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s08UdgTtlGgiPsQj0wMZhoVKaIvaw4i5QoKRZqKAJRH23BCXBysWllyrCROG4qTgN
	 ogHvKm4t0PjwUDIaRUt81CIj4/k6+ZNdSDeK93SW1SROtBA2Bfz8tvDHOenhdGM1QI
	 eoUCXkoEmBV1UQ4tQYKoyI2gPnEsufF0xssx4N3U=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/cpufeature: Drop redundant define(ID_AA64MMFR0..._SUPPORTED_LPA2)
Date: Thu,  1 Oct 2026 17:12:22 +0100
Message-ID: <179087114214.1104965.13059453342725371380.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917024152.3660794-1-anshuman.khandual@arm.com>
References: <20260917024152.3660794-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 08:11:52 +0530, Anshuman Khandual wrote:
> ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_LPA2 is always defined as 0x3. Hence any
> defined() test on the macro always going to be evaluated as true. Hence the
> very test itself is redundant and can be dropped off safely.
> 
> Although similar defined(ID_AA64MMFR0_EL1_TGRAN_LPA2) test is retained back
> as the macro does depend on the configured granule size.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/cpufeature: Drop redundant define(ID_AA64MMFR0..._SUPPORTED_LPA2)
      https://git.kernel.org/arm64/c/f73411ae5be6
