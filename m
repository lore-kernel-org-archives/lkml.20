Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F833EC82A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187576; cv=none; b=Wtd5LCYG6SriRdeKU29w+CLG6B4R2evEMMTgAwVrpB1jwIKcd9zW3zG1BxjVUKaIKWDGB/XEM4av5voPzcdhtWQj02BybXkzbOffrpW98SObhSCe3h7frPUqUbHHfBW0j32iBtaAx8ncdJqSEWwkMgLNkh2u0a/QVhvfsLIfh1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187576; c=relaxed/simple;
	bh=k27GcWWMkRGuBaHvtiyzVovjQZNu7zMzILjuwfvM2gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EFaxR16DkiqkU5cljuqzsZqox/9FziawzDtI7/OL2YAuIFkOhwvirCnsHNn1ITeKU0trYR9IjtskOBCmuljRDL+Wv1hENFSNtqbAdxGxSfafpYKiadsnnqe0BvNF1wK6vS+SE7wzPEvlnTw1Bit3NhOjYdxBOitMWsCO/nMrFYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qr0vlXDy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qr0vlXDy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 817E71476;
	Wed, 23 Sep 2026 11:19:28 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80D7A3F632;
	Wed, 23 Sep 2026 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790187572; bh=k27GcWWMkRGuBaHvtiyzVovjQZNu7zMzILjuwfvM2gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qr0vlXDy/+n98St+Rw1mAZvR39IHvW9vAVDGs3QPXPOaf2X5wr0HajtLEnwzcv3Fi
	 0v6WV9/U6WkhKydtNcr2BMCgeCUaPAZ22SdZcanPaJIog4zh1Fh6HWefSKssPMs9sI
	 tv5KQWI9rBv0Lgo1jL7BnkBpOKxlkENr8BeYFa74=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 00/14] arm64: Remove unused big-endian support
Date: Wed, 23 Sep 2026 19:18:43 +0100
Message-ID: <179018752374.2942518.17477333903673435626.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 15:52:02 +0100, Will Deacon wrote:
> This is version three of the big-endian removal series previously posted
> here:
> 
> v1: https://lore.kernel.org/r/20260811140132.22778-1-will@kernel.org/
> v2: https://lore.kernel.org/r/20260907163726.17104-1-will@kernel.org
> 
> Changes since v2 include:
>   * Retain support for emitting absolute symbol references with PIE
>   * Retain endianness handling on EFI MMU-enabled boot path
>   * Invert compile-time endianness check in Hisilicon sec2 driver
>   * Added some tags
> 
> [...]

Applied to arm64 (for-next/be-gone), thanks!

I added a patch before 12 to allow GVE on arm64, as discussed offline.

[01/13] selftests/arm64: Remove big-endian support
        https://git.kernel.org/arm64/c/97c1757db39d
[02/13] arm64: bpf: Remove big-endian support from the JIT compiler
        https://git.kernel.org/arm64/c/883247de6500
[03/13] arm64: crypto: Assume a little-endian kernel
        https://git.kernel.org/arm64/c/2768ccadc1b4
[04/13] arm64: lib: Assume a little-endian kernel in custom library routines
        https://git.kernel.org/arm64/c/42b69efd3418
[05/13] arm64: lib: Assume a little-endian kernel in optimised string routines
        https://git.kernel.org/arm64/c/fcec2a198957
[06/13] arm64: assembler: Remove endianness helper macros
        https://git.kernel.org/arm64/c/6a1aeecf3db9
[07/13] arm64: vdso32: Always build compat vDSO object as little-endian
        https://git.kernel.org/arm64/c/b8409b9eb74d
[08/13] KVM: arm64: Remove support for a big-endian hypervisor object
        https://git.kernel.org/arm64/c/9afaed358394
[09/13] arm64: Remove all usage of CONFIG_CPU_BIG_ENDIAN
        https://git.kernel.org/arm64/c/eab76a8e1880
[10/13] arm64: Remove all usage of __AARCH64EB__
        https://git.kernel.org/arm64/c/e93a371bb49f
[11/13] crypto: hisilicon/sec2: Remove check of CONFIG_CPU_LITTLE_ENDIAN
        https://git.kernel.org/arm64/c/bbce799407f9
[12/13] arm64: Kbuild: Remove vestigial big-endian support
        https://git.kernel.org/arm64/c/134b0fbc5c24
[13/13] drivers: Kconfig: Simplify dependencies on ARM64 && !CPU_BIG_ENDIAN
        https://git.kernel.org/arm64/c/d80ff69c9a37
