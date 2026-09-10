Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3564A395D9F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034294; cv=none; b=FABtuRjtFBMH6Gw76d4Vvpd9NGZWAZOpF4aGNSEQf/cjQKlNTkKyC1Vm/IC19zPKzOD4ODJU/0aSd9mlb3hxKfUtudzAzc983CgnhgMHDgQCnboGBzRSF2E+AdypSfJWVDsbx/qIU9NBA2188wbM4lANsEeJkVHUliH4/Ys0g6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034294; c=relaxed/simple;
	bh=iiLwRtnCzxChKl7zhrk9QmVL1OcofPkc9OkVKtgNkHI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FvKyyEpwUBrhThrW67ATNGZW0d99kbbqHfDsDAMc9f+ZgOxtpxQWSxa0WnBwUS41HlIrb4QOdBDaCRvfGLSuXcn/r0yhLwkLCxZiYkvktglovbzJnC6NIWbt9jSxtmul/3aWdoEzcbx1bPqQKPpnPOjxBsErRNhatu758PkPKRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKaF9uVF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKaF9uVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA2F1F00893;
	Thu, 10 Sep 2026 09:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789034293;
	bh=ipF4yAyH+8cCr/5i9AssjJeIC5nrzhoLBaXZQ+ebQbg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WKaF9uVFSuDdkvnZUv3XVv2Ww4wViV0R7H07gTfwwn1hONZCNV2Bx702FMNcvfM9d
	 QDpHT09iVgcFFWsUrSnK4y/cbdd7Y8bJvRLO9QhnFwCpOFJNqClSd1qMGelcDXzdA+
	 +wyhI+eixS2A42tuo5pnWmFQLs60NeTdidSi+dph9LWMRLXoQ0Op3bHL9uWolWS0qJ
	 mIVMSxGBTrF8dpkSDOYFXMlfnrE0htjG+f4uJXMTb5CT46iTZmJikHd5ow2SL9hWfG
	 Zewrg+p8Zur/nAaZ3TcPz/HWkqMKnhtLMhC+748FLabJIbjEPXCEGhiIs7ipcNdFS/
	 sefzwbHF0f8mA==
From: Mike Rapoport <rppt@kernel.org>
To: Tianyi Chen <hi@tychen.cc>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1788997523.git.hi@tychen.cc>
References: <cover.1788997523.git.hi@tychen.cc>
Subject: Re: [PATCH v3 0/2] memblock tests: cover low-address allocations
Message-Id: <178903428798.1489479.5765028250372068441.b4-ty@b4>
Date: Thu, 10 Sep 2026 12:58:07 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Thu, 10 Sep 2026 07:55:22 +0800, Tianyi Chen wrote:
> memblock tests: cover low-address allocations
> 
> Model a low allocation limit within the memory registered by the simulator,
> then exercise memblock_alloc_low() in both allocation directions.
> 
> Changes in v3:
> - Describe the low limit and simulated RAM alignment directly in comments
>   and README.
> - Use Assisted-by: LLM in both patches.
> - Start a separate thread for this revision.
> 
> [...]

Applied to for-next branch of memblock.git tree, thanks!

[1/2] memblock tests: model the low allocation limit within dummy memory
      commit: 5c194192279e0894b898967ff939e310a9bd06b5
[2/2] memblock tests: cover allocations below the low address limit
      commit: ba7b611a1fada0bff7f6c3fbc6ff13978bc1af91

tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
branch: for-next

--
Sincerely yours,
Mike.


