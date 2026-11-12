Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513109;
	b=c+V99W669A++z5t62cKO6SeGlpOy8SgDN9m9h61uprNFCud3Yp0nLC7DiHXJSb1vPPEh
	 Oe4ljxYwJaJHPKwFG2WmHZd2xlDq5kCXUlTp6doWfohyjSjUomlx9OCjzMcyclm+3gXkt
	 CmvmC24GcIfxreZ7bY8asH339TLI90jjnGNIr9NP8SUAYVjEN6GIg34grbBRtf3IXhQYO
	 jZQf+c57n9hXzzqa5lEcScxlSIqLaroT8B/6pfeM+DAJ1G7EMJN8SiiA4Y6cOLTh3fAyX
	 lhmYrsgqVcCswTuXLI5eq/WzdXnbtnNAsSZGlykWQlmbs7ZyeV595OaHuOEfTGU8RXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513109;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=MXyZsHwfK2gvuQhmDt5WpMTW9zW4LN4v0nZE/aptwHs=;
	b=t2NIys1p3Pxevc4hZlk7Nx5Wy593X63rHv1p/4dv5BQejVXmcICfZnSv1tT15b65k1Ia
	 MRBqehtkDZ1XRMhQmMXiQ3IUtErGayGgtpOlhWBHEqnVdWNkKzqphywy9ubNN2h+tfx+p
	 CyqrbZM3BR7vuzwGS3lfMoPLOvG/Pj0aJmtwUhSe4wIH8gi8qMvibAMc/pTN03pZZkqOc
	 t79HSkmzdG+HlMf7eGjyZnkLKh+2dDR1DHXeeJyzb2juYQOLtMVn+u9uHjgK4CrqUazYL
	 I8brZ3l7dUKgxPx7qudWSyhQT02+tzO4gcDpa8ytS2E4r5dE7KxvIhOo2Q/KuL9oLtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MZPaFkrd;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD809606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD809606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MZPaFkrd
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA409339;
	Thu, 12 Nov 2026 11:51:44 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 979743F632;
	Thu, 12 Nov 2026 11:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513107; bh=J5uksauuCqtbIoAEhUXb2nyWugeHjgl0kBp4qFlJtqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MZPaFkrd/CaGNlf+0EIS5FLEDKIgvRYv3UGQsDQsuoy42IA+qOmWJSFeGzvvo3VNT
	 khv+wsJqx3LZp/+fwBE1dHXz0uRgEHisOYk4Qkr4+DN7VvtFrQiMGYr/qMRheb1BnM
	 XDyn8rSqP0W+NYlwIxJ4sgJch9QRSZkFhvE3Aloo=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Beata Michalska <beata.michalska@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Vladimir.Murzin@arm.com,
	christian.loehle@arm.com,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] arm64: errata: Update AMU workarounds
Date: Thu, 12 Nov 2026 19:50:25 +0000
Message-ID: <179451296804.3304937.11865929990379023674.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112191211.3336725-1-beata.michalska@arm.com>
References: <20261112191211.3336725-1-beata.michalska@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 12 Nov 2026 20:12:06 +0100, Beata Michalska wrote:
> This short series updates errata for AMU core & const counters.
> The last patch in the series tries to optimize a bit the paired
> readings of both counters, so that the workaround checks do not
> skew the results. It is also intentionally the last one, as it
> will not apply on older stable kernels.

Applied to arm64 (for-next/fixes), thanks!

[1/3] arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
      https://git.kernel.org/arm64/c/139a9b7d5a07
[2/3] arm64: errata: Add Cortex-A715/A720 AMU core counter workaround
      https://git.kernel.org/arm64/c/be7771458582
