Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4897D2C21F7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967502; cv=none; b=LfqgFqO4Hy5iBddRjgsNCNsTlpaJOBsTNCypWSnL0jyy6MEPOhVL4YT58tB16bDoTY+Knvxc7P+xl7uBslqkW6GxYbN/L9wqJ+GfA1Akfww/K6VeXot0jI0klQSOAUYPasgBXx3AJR6RsQ+Q0k7V5WowRa4ObkLsZ7kuUjeZuiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967502; c=relaxed/simple;
	bh=iTtl2dl5UCNDlwuqM2xPR046WVi8G4ViELSur05jQSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OZWFMu0jPNO9vBeVRIDRjAVu9HCA74iY7HVKBhwM4B89X6Hei1NlDOa+DIXfYwGRh5onnDuK4Gk8rM0E3xqUZw6R3JQwUYFphCjkEdQAfJPufYP0lTRN8/8Lf2gtuA8NxDQQ5Kyp6EG2ej6sznE069x46udFkB7Tq0UhmIo45B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DFowl8aw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DFowl8aw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28F722F;
	Fri,  2 Oct 2026 11:58:17 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4B5F3F86F;
	Fri,  2 Oct 2026 11:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790967500; bh=iTtl2dl5UCNDlwuqM2xPR046WVi8G4ViELSur05jQSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DFowl8awamZz32Weo45bzjzZE3XvbdxWvLXA1wQVr26yrIXatyHfGYB41oNOAM5N/
	 zRvVwAQaB48DiLx46YJNZ06binXG9Pp113BYE8ugiqGsmicsbsof+Fql8g07acX/oz
	 Sm2BOf0muaOUMK3Wmj4UPhZ8CbA5RmtHA0JQNxPY=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Breno Leitao <leitao@debian.org>
Cc: rmikey@meta.com,
	kas@kernel.org,
	usama.arif@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2] arm64/sve: Don't zero the SVE state buffer when the SVE state is live
Date: Fri,  2 Oct 2026 19:58:11 +0100
Message-ID: <179096749123.2363044.5221430791699446886.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915-b4-arm64-sve-acc-memset-v2-1-14b7ab9c71bd@debian.org>
References: <20260915-b4-arm64-sve-acc-memset-v2-1-14b7ab9c71bd@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 15 Sep 2026 03:51:05 -0700, Breno Leitao wrote:
> Currently do_sve_acc() always zeroes current->thread.sve_state. This is
> not necessary in the common case, and avoiding the zeroing has a
> measurable impact on some benchmarks.
> 
> In the common case where the task is not preempted and its state is not
> altered by a tracer, do_sve_acc() will observe that TIF_FOREIGN_FPSTATE
> is clear. In such cases, only the live register values matter, and the
> in-memory copy is stale regardless of whether it is saved in
> FP_STATE_FPSIMD format or FP_STATE_SVE format.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/sve: Don't zero the SVE state buffer when the SVE state is live
      https://git.kernel.org/arm64/c/d6ae12c900f2
