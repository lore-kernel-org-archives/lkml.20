Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6CA39479C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754530; cv=none; b=LsbXXF8R+kxMVYSk1y7WNIU0kJ/LPPZX6WqtMO1R/zqUBX+kO07j57aCg7H8vJVaYUen0GKEi1D2Ykg8o+coqxc+/pmTtay6BaOPnMKOYV4jCY2ayn6FXylubAA4uA/66FVdNwwSYMQow1XKFWsP5OE8G58LGpRaNX4Ut/cd2Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754530; c=relaxed/simple;
	bh=q4tlk4ZKLEGHgmj4RCKWAn0yvsa57odQ0142O/epx8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDHTd969d4Kp8sDmC/EcdwUcLrhily+7gqjzNl7LJ7pypP5tLDYfnW2KrvJL6wWXgsZ6htMz+afQBeAqVZOpRJ33Orb/EluPDdeeEiucmmHp6O8gmkTA88ULC/KxpcKiSvcF+ln+warIQNHy75h41XngzzGodja8ZQ6Y71Y7hL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuOJKYJq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuOJKYJq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E571F00893;
	Wed, 30 Sep 2026 07:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790754528;
	bh=W8oH1Fi/Ld5hAhuB1dTiEaQRtEACoBcCrfBpjFkiric=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YuOJKYJq22XVYvSATU7UyMhkbwLBasyBFeHMOjwtF4d6iiPCiQohQwEXa4287dvTE
	 /LsLoJNZT6G4y0MEFW2wCFiLd+hmFAZCYywN3p1MQnlATCPhgfLRK6SK1WZoUy6JgE
	 k/uLTWT3sGu36vNsoy9IFpuUJmXD/6PqE6zKK7LPno/LxxuPN5kK9FugikBP/Q4z1Q
	 hSOmzrNNlY2TMFGXNb1af8wK1hUDtpUFvoOKTakkunvcTXesBLjBY4GIaKBx4ZQlAx
	 al4pFuQA9JBuTzanSrs/VFUO0gBJYVyrA1YYUvnNRi/M/nVgD1d+RaUr0dHqj5F5sd
	 31T/8Yfsu/P/A==
Date: Wed, 30 Sep 2026 08:48:42 +0100
From: Will Deacon <will@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Billy Laws <blaws05@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Ryan Houdek <sonicadvance1@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [RFC PATCH v3 1/1] arch: arm64: Implement unaligned atomic
 emulation
Message-ID: <ary-2rOs_b2IY6M1@willie-the-truck>
References: <20260930020138.2377090-1-andrealmeid@igalia.com>
 <20260930020138.2377090-2-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260930020138.2377090-2-andrealmeid@igalia.com>

On Tue, Sep 29, 2026 at 11:01:38PM -0300, André Almeida wrote:
> Implement support for emulating unaligned atomic operations on arm64.
> User applications that wish to enable support for this should use the
> pctrl() flag `PR_ARM64_UNALIGN_ATOMIC_EMULATE`.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  arch/arm64/Kconfig                   |   6 +
>  arch/arm64/include/asm/exception.h   |   1 +
>  arch/arm64/include/asm/processor.h   |   5 +
>  arch/arm64/include/asm/rwonce.h      |  14 +-
>  arch/arm64/include/asm/thread_info.h |   1 +
>  arch/arm64/kernel/Makefile           |   3 +-
>  arch/arm64/kernel/process.c          |  15 +
>  arch/arm64/kernel/unaligned_atomic.c | 521 +++++++++++++++++++++++++++
>  arch/arm64/mm/fault.c                |  10 +
>  include/uapi/linux/prctl.h           |   5 +
>  kernel/sys.c                         |   7 +-
>  11 files changed, 579 insertions(+), 9 deletions(-)
>  create mode 100644 arch/arm64/kernel/unaligned_atomic.c

No.

I already explained to you why this doesn't work:

https://lore.kernel.org/r/aV1YnOetDHhKe4hz@willie-the-truck

Will
