Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C06F41F348
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 22:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791151792; cv=none; b=HTJJQ3uciLzdDt71Fq49dCwriGVaNaeNYY2zdgIshCpaiqnMHiJ5fggN4R4IyKsTu/znfb2jOSZzRtYRS/EPUmKvs6WII8039/PIF74FO4yR0Zpaje7JGI0sS3BrjJpe5H03wy43/VgQVCOPnn+KHDTvGlWQBRAewD6yqvt1fF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791151792; c=relaxed/simple;
	bh=HFlS6zbaIf3o6BJi5Oc9EtcoSzewPa3xFOrotaVWmQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U080cnW4RXjxY/EH/ax/+8WeudysMn4vlvkiZ7SEB8JIsZeON90i+st84mTKsde1bSBsgg9BmuYEJlh52QjHxYnjhBl1odFBYSzDQu4pLUME5eB251QwcEahrGJKRB3fuy+Dx+wiDd/fw668rkh2Gi00hZxRi3HXhhZZTNOeiXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5Zyv5MT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5Zyv5MT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D134E1F0089C;
	Sun,  4 Oct 2026 22:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791151790;
	bh=0a14oKoy0hGUwl14Hk8RU7rKTvewWF1YWf6zha/hyIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n5Zyv5MTZ0zOCqwrSKCOEolSaVcLU9JMCtvCNhhelqGJZfoCTAtnpgntlDQE5tLAj
	 0IUtejN0rG779RBdHIkl+OFKun4DtDNmDryEDJFrp4+N7pMGBghB2Krfqx2vI0pVd1
	 okBm5bJPF2pGWf8xxv5Zv7IYsPYfWGPPPPkbV08g4pb89fTqohe4mbQ0Pwln6bVKwq
	 MUpzCuA6+R+VNZo+N7rJ019ZUXj9ZYgq4vplViFE4kuDctFObjRtVr8FWlQqm0USE7
	 nMn6j7PcJ4wCf6GkSfcHqqZNTBqAXSVsqQToig4zBeW01iXxEE977DZq2QK/Pw6TcI
	 HdDLXLgdS1yYQ==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	robin.murphy@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yushan Wang <wangyushan12@huawei.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linuxarm@huawei.com,
	liuyonglong@huawei.com,
	prime.zeng@hisilicon.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v6 0/3] drivers/perf: hisi: Updates for HiSilicon uncore PMUs
Date: Sun,  4 Oct 2026 23:09:20 +0100
Message-ID: <179113241038.1478216.17577065797192083960.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916065348.3957834-1-wangyushan12@huawei.com>
References: <20260916065348.3957834-1-wangyushan12@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 16 Sep 2026 14:53:45 +0800, Yushan Wang wrote:
> This patchset adds support for the ITS PMU and a new version of MN PMU.
> 
> The ITS (Interrupt Translation Service) PMU counts the number and
> latency of interrupts routed to the ITS by category (LPI/SGI/PPI), and
> collects micro-op statistics for the ITS itself. It supports filtering
> counters by a 32-bit interrupt id (int_id).
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/3] drivers/perf: hisi: Consolidate uncore PMU cpuhp states
      https://git.kernel.org/arm64/c/4c226fa3238a
[2/3] drivers/perf: hisi: Add support for uncore ITS PMU
      https://git.kernel.org/arm64/c/38de567676bf
[3/3] drivers/perf: hisi: Add cycle event for new MN PMU
      https://git.kernel.org/arm64/c/8a76246afe04

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
