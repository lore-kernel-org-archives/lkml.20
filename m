Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571376;
	b=WJyEdeA8/oc9mzbuYY9NuGNvGWLcawR6xVZuYBlGTHCUWcK1EuxJ1x5x2/djiNnPlfEO
	 EH6JMG8+OptuLutObuyT7oaVs0cnlkU/R4v+vl5etQ+twHkIYXahmfiL/HmyIX5Ydi1u7
	 UelFCQnf0QEEIN8tqDycuRycvNlRNk84aO+M4Emt3mES2aabG2SnazHyIUYXTOYZuI5Pk
	 kXjnpUwdnvAbglnyqHNuHUxNm3piXqAUv2e3E9CEtUBLqBt/6mlqQDp7qM7rHOFyUpI6w
	 eHOLiAk6aLX9DGsskqdeH0pfFYl1A5rAvT2C+TuMbU3Kfkowq92TMqS9DIHDfC8ls7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571376;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=pqV79QmChFOf3bbPGI4+7921MVE85dKKWV9jL57f3sM=;
	b=obeYWEINmYD/ogNxPzrWPKxscJzMt/B9tERFaQWT6t5g0s9OgOmW4lvW1++jLTiEmWDI
	 MMCe2LVMj4rku7zv/WJQziaq/5XT1IfvLiC/vxRjIpBEVYW7q8I7jObodaivpfYqg54LU
	 RtetPHliaxy9oLj8iL3WNbQViRq8GS2dxYQlkk10tOrq6Qypv8l0W/Ve4Ya2iEr9fGkWQ
	 gAXEqJh3L4xImKdJIWDVuqBHMql6oNsEFndtJhv3ggS6xSDZFe68LG2oNgpdun0uO/S2a
	 3qbbF+LtyHyvQjwevqngxCt4/CUJYci5JVio/IMfIydPQGPJbI0oTd26H1YUdqC01kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0LOEbRv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAD360A6F77;
	Sun,  1 Nov 2026 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0LOEbRv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8632D1F00A1D;
	Sun,  1 Nov 2026 22:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571375;
	bh=pqV79QmChFOf3bbPGI4+7921MVE85dKKWV9jL57f3sM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=P0LOEbRvwTcNBUSW901O5u0IbTsFAS0u7tlHAilX4zpQhlj7rov3kTzRYxOrtXJkq
	 +kLlB6UyHSdCxIZGfBJQPBLWPHsIw97WryXY4R57r+FehjA0yUzJg9yHCqGZu5/j7u
	 qF/Ye8qIspqZju8mEmIBaczCeiWVktuLMbCu4tTlypu/S5LEtFoYvRsLOGiwJOxDK2
	 fhKyBYx4IL+DOEPxJrlBKp6SmfV9nsobQTiRrZDMrgZQPiFYfY0ahvxyOCsHSIIgxn
	 7zGTWtOhm+EOfESSKUksCnsHptg+CLBeRTvGHiV3Lmw6GrMNWHipG3V8ozR5jeBUhV
	 pcMZBgzINShfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D49838003B8;
	Sun,  1 Nov 2026 22:16:15 +0000 (UTC)
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
Subject: Re: [PATCH 0/2] Do not reserve memory for coprocessor FW
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357137404.2624073.6489638020939885844.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:14 +0000
References: 
 <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
In-Reply-To: 
 <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, chen.wang@linux.dev, inochiama@gmail.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 me@ziyao.cc, devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Inochi Amaoto <inochiama@gmail.com>:

On Mon, 21 Sep 2026 17:08:58 +0200 you wrote:
> Milk-V Duo and Duo-256M reserve a region for coprocessor FW at
> the end of RAM. It is not correct because:
>   - FSBL can be configured to load FW into a different region
>   - if no firmware is loaded, the reserved memory is wasted
> 
> As explained in [1, 2], FSBL should reserve the region at runtime.
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved memory node
    https://git.kernel.org/riscv/c/6645398c4621
  - [2/2] riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node
    https://git.kernel.org/riscv/c/60e4cafd3090

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


