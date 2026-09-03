Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919CF4B048A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443985; cv=none; b=M2Id5lFwVEFmVXZa3Yr+kZn2i9u/JkykfKBeVyRh/D+F6YmuPNdb4JaIJ1crOYk4Hg34QZWFyFpxRy+0ULWSoB+N8m4yjePa4xLOd43P1uk07+5obFUiFTL/u7nWbs7XodKekcKrO8hQLIu/AClRMEpohobew5z/LLK6Y8JUO5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443985; c=relaxed/simple;
	bh=RREp9X4feeJJjLQoQPBUAM1qPXfcC5rz+hdNVo/Gu1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ML0rkFtA23ktQmvQITv+qQsuXEAx0dHvIWwwrxrLXGC9/bSv0YMQff0VbB50B53OvG4U0M0rsG7K6kivi2gKNoo3pm8oDkOM5JI9LsC28bed1yCTJoQNG1tPfEtcdqB/xIQo6I1F8LhZquLBd7RcyDX627D12Smz/Nhz9l+XMms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwc6+cOF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwc6+cOF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF701F00AC4;
	Thu,  3 Sep 2026 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788443973;
	bh=0GHlpZjfbjH0Zch5AMd58KrvSY6G7xu6Z9gu+flHuC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fwc6+cOFW4oYHmvSGh/miUqeEF5R/qMCnirDUCEFBrBMqZ9Arcxt0keICcT8cm175
	 heMvQmCN0ltVOKhxX48u65Cf/lOZOl5QzjnqyiabNPNMGrRhrmsB7DVwfNuaZHcJBh
	 NbezFbViBaKrqvXEiIftJbATfp29ScyxeMBfTT1k0jMYmXZhZceV5mKLM0D6vG0HKw
	 QEl7Hb2eyIgWLrixQZZs3AtbntVtJO1Oy+rE2zPXmoS10KYvGyqiqnKwtkabo+dzLO
	 sMH7CeA2mk4/gMZewGzcXNoDPIwUkqjXcxxdvkO0Am9TA2/aLH24lVS2+RxqqJ7x6/
	 3HMjnFjzmFctQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Breno Leitao <leitao@debian.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] arm64: trans_pgd: clone only the linear map that exists at runtime
Date: Thu,  3 Sep 2026 14:59:18 +0100
Message-ID: <178844047586.4162266.2394578462363547662.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828-b4-arm64-trans-pgd-va52-v1-1-a66644372673@debian.org>
References: <20260828-b4-arm64-trans-pgd-va52-v1-1-a66644372673@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 28 Aug 2026 02:28:18 -0700, Breno Leitao wrote:
> kexec_file_load() fails on arm64 if we have CONFIG_ARM64_VA_BITS_52 but
> it runs on a !FEAT_LPA2 host (such as my loving Grace machine).
> 
> That is because trans_pgd_create_copy() uses the compile time
> PAGE_OFFSET (VA 52) instead of the actual VA size (48 -- due to the lack
> of LPA2). With the fifth level folded, pgd_none() is always false, so
> the walk cannot skip the 15 extra PGDIR_SIZE slots, and they all alias
> back to the same table: the whole kernel page table gets cloned 16
> times, KASAN shadow included. Without KASAN it does not blow up, it just
> wastes ~RAM/32 in page tables.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: trans_pgd: clone only the linear map that exists at runtime
      https://git.kernel.org/arm64/c/1537e55728ec

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
