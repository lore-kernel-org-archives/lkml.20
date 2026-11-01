Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571421;
	b=pPxyf1mXspVkwLcA1PUPYhHOgOBjksNI+6Q9hmRJMTRF1DifsAMqi+/WTTsx/5P40Nhq
	 TWEal87zpz9qfITLXoMLannpsJMPAy+LVyFHSwGZV9ps1RFIJtGnzqeH0mu1K7fvvqpPV
	 NwJeovmYUJxgldagGt2+WFA30ttQkKfQbVPi6q+OeXMBYkUT2BfINCwP2T0rFj761mldQ
	 SdYBz/RqmjbQa40J4iKXErRoZNyTLnXDCn5sVkK63lKVv8ebIlUlXQCvMUO0DFeQxrwqt
	 d8TeYVmgEabcBNYaoPOvzBqW/pfDdwMuw7rEvT8HEyQC0JEQI3o/xafdikgP01QWrbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571421;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=jzfy/KnMU5oTCU0ghJzGH4xThVN6V3NlG6Cfjo/7zcg=;
	b=d/W8POe9p2SYWPCDCgGFalIrSTFFow/zeE+CNtasRVjxzmWQCCfHEtjQ3dn5vem5Pfdk
	 yH3EX2w7ihJuESJjTe4GEu5Q5gkNNPgNK1rKaVZL44ujNAXyyzALCP9djcLEixwfJ9JKj
	 yC46+1Sm1NQAdBgkjbVXS5PqK7t6V1aqFQ+H5r+YQFRrFbuvdn1+JvFJPNzE+ew87BqzQ
	 Hj/Obv73nlzv/AbxTjLn/jewx4Ris04CzD8uR3eamHsZN7Zu7SBP0cF1zpUREOHGHDIwe
	 PlNDFxRnNqQ8f7CxiUX0BYGROfQ3Sl/MaNF/HnPZdaAYb8UU6dnM5IlovBewZbEYABw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cL00EPsP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB92E6073533
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cL00EPsP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C481E1F000C1;
	Sun,  1 Nov 2026 22:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571420;
	bh=jzfy/KnMU5oTCU0ghJzGH4xThVN6V3NlG6Cfjo/7zcg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cL00EPsPLeRdjz0LaK8ylDMEtIvjhzaleh+eVK9p2LoFB48SNf3bWyOtNpuPL7Xp+
	 iQ8FRynHbDCt7dRIj9ntbJ2MWZXRGPy92K8RA5bq4Ifo8iWZN9/R/eU0xVHVm+ThTh
	 vqVrjMZTqZKwtlUQOt7Y44XayBTarPJ9db+S+UgJzxIMMpb96lGyL/F1/sX3REPElB
	 mQ401ESlhtJ5By24BWWO5iHvbckmoAjyDvIewmVcYYEwsFFzkn2TwMyRJ8j7snmUlx
	 4xhq9r6s/mwIVIqVTJWtdSQMEes3gxh7FUKQKvB1E9wNXb/MC6dtyf7RsDYnGsqwVQ
	 riUzUbHX7vr/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA40938003B8;
	Sun,  1 Nov 2026 22:17:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] kexec_file: remove unused arch_kexec_locate_mem_hole
 hook
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357141929.2624073.17874579803717871005.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:59 +0000
References: <20260905145835.501635-1-sourabhjain@linux.ibm.com>
In-Reply-To: <20260905145835.501635-1-sourabhjain@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, akpm@linux-foundation.org, rppt@kernel.org,
 palmer@dabbelt.com, pasha.tatashin@soleen.com, pjw@kernel.org,
 pratyush@kernel.org, kexec@lists.infradead.org, baoquan.he@linux.dev,
 mpilaniy@redhat.com

Hello:

This patch was applied to riscv/linux.git (fixes)
by Mike Rapoport (Microsoft) <rppt@kernel.org>:

On Sat,  5 Sep 2026 20:28:35 +0530 you wrote:
> No architecture provides an implementation of
> arch_kexec_locate_mem_hole(). Use kexec_locate_mem_hole() directly
> and remove the unused fallback wrapper from the kexec header.
> 
> This simplifies the kexec memory allocation path without changing
> its behavior. No functional changes intended.
> 
> [...]

Here is the summary with links:
  - [v2] kexec_file: remove unused arch_kexec_locate_mem_hole hook
    https://git.kernel.org/riscv/c/06ce2863e7d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


