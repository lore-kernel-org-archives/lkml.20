Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202204B1B4A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443996; cv=none; b=eete6fZH6nqWLPkbXpmvLkEX/gfHIdwHUF7fZSZuaBDT3oxx0BmY8M+2oO+GPcxO/NBgp4+vvDE8dRKEM1yWuNo7XsKJY1zzJQYCBC+zRjqQrORQSeqqmcx646/c++dpAupZ25KcceBFLRNyMD90ESXzdH5zJhnx3crbTnBZGGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443996; c=relaxed/simple;
	bh=c70qdPWoorRAaIZApbf0u5bpS41rBNnY8bznQUVsI1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gyfHGNefReBx6kFtdIAHEOf01H523vnfRdpsCDzJOCjVCkryI+awPfYptSddHGUf/WzmMz/MHzSuBoCdX6hKQ/HWwKDpNgBs2toHqTyh0ZAo5jXRNygTxiYPSTomDFzu3I5yEXmSQggBIlopBODFnvi1fp1pVvw9r/a+rwAldWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzCWvkB5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzCWvkB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6785E1F00ACA;
	Thu,  3 Sep 2026 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788443971;
	bh=liaY4NC2sqVwf3er0oXP2F/nJmw+4O/kf3+17VC8Er8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JzCWvkB5JJJyHKCTiznMqKMgFXs6I0urpw97dPnBNdPHKxYrQoJDOBq82Y9//aPUP
	 HArh9YowHcG5YO3SmdyBgcgdAX1iWBIdi/eRdnvFM7Sn62w5MExECo1aOwsY61TBzF
	 dz/Qaajwvi5bfQWDkL5ff7F6AzAgu5Rg0VHAvCXRBwzUPNymjmEEtbzPXOC/WRzgu+
	 CznYZZ6I5tmE5ELwUXLA2TVKMu5X4ytSaVVjCfG3ZPhQ51S5UX76r8dKe1UgqwCNMh
	 A6DrQsN4bKjIfI4ypeqRbsnD7T1D5pr5HXdFQ+twjCefynmGmnaFedfCY87sEUCPc/
	 ve+2sdmUPbIqw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: mm: Fix the lockless page-table walk in show_pte()
Date: Thu,  3 Sep 2026 14:59:17 +0100
Message-ID: <178844029253.4160801.11282535964402738710.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828174131.46825-1-kmehltretter@gmail.com>
References: <20260828174131.46825-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 28 Aug 2026 19:41:31 +0200, Karl Mehltretter wrote:
> show_pte() walks page tables locklessly and can run with interrupts
> enabled. A concurrent teardown can free a table page while it is being
> walked. It can also clear a parent entry after show_pte() checked it; the
> regular pXd_offset() helpers then reread the cleared entry and can derive a
> bogus lower-level pointer and fault again.
> 
> Use the lockless offset helpers with the saved parent entries, as
> gup_fast() does, and pass the saved PMD to pte_offset_map().
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mm: Fix the lockless page-table walk in show_pte()
      https://git.kernel.org/arm64/c/a77644d009de

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
