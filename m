Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2AE466B58
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792087962; cv=none; b=lRK8EuuNuCmNpEjvXlIyBAzYu+87Je+zlsWVVHokjnAVwmreN0zHAQZCGQj1u6OBNZxKblawmwRVmly+E34Rafoo43fq9LaUScjRLtr/DiFhhSax9QWj9V1B1+Tl/cxlgut372uHcbpB487Abu8b0dDppXi1v0M6BpCjECi9PJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792087962; c=relaxed/simple;
	bh=QDCjVKj4BPQQ2TRdLH38IEHILLRayJsSVeZmDsJRJ/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JzUlkJdId6IHyFg5NpnnVBcsSo87qtpaEqdNovgyaZjfNHwNGirKYjcJY3zsn2oPg8Jd9BeDpy2KH733RC4Pxwldi56C2CqBs0m54fByKFoeDlNO+KETAvCQOgrbZZOfhmSKKxsIZIoVVF4fD8myXSGwneiu9FSPX5rX3oHl0Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nDE+/vYy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nDE+/vYy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6EBE14BF;
	Thu, 15 Oct 2026 11:12:30 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EC3A3F871;
	Thu, 15 Oct 2026 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792087953; bh=QDCjVKj4BPQQ2TRdLH38IEHILLRayJsSVeZmDsJRJ/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nDE+/vYyuG1W+NyCied4u7Qpgf3bt3UYa4NZOAX6uRC2XO4aWuOK1y/WE78xrCB7w
	 J/VGJ+Gyl3NEtlPtSV6IWeIfvZXjuxh/Oalag+JyGnwfA2ozJMRzzEmUPIRAt0tzbs
	 AFMgQSFZklYW74PXhonJPPLg43KX2xhwsxT7sz58=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shanker Donthineni <sdonthineni@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vikram Sethi <vsethi@nvidia.com>
Subject: Re: [PATCH 0/2] arm64: Add NVIDIA Rigel CPU definitions and BBML2
Date: Thu, 15 Oct 2026 19:12:26 +0100
Message-ID: <179208793359.161729.16006522437434117288.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013150508.1798938-1-sdonthineni@nvidia.com>
References: <20261013150508.1798938-1-sdonthineni@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 13 Oct 2026 10:05:05 -0500, Shanker Donthineni wrote:
> Add CPU part and MIDR definitions for the NVIDIA Rigel core. Then add
> Rigel to the BBML2 no-abort allow-list because it supports BBML2 without
> raising TLB conflict aborts during mapping granularity changes.
> 
> Shanker Donthineni (2):
>   arm64: cputype: Add NVIDIA Rigel definitions
>   arm64: cpufeature: Enable BBML2 for NVIDIA Rigel
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/2] arm64: cputype: Add NVIDIA Rigel definitions
      https://git.kernel.org/arm64/c/cd2a6b71f974
[2/2] arm64: cpufeature: Enable BBML2 for NVIDIA Rigel
      https://git.kernel.org/arm64/c/6be42f0e4dc1
