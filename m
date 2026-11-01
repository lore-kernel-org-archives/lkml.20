Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571377;
	b=DSmUx9C0WYsGPiDyk6qoMBjLUmiOoIliuiKjPUh+/Mz31FQp4/R/k12+ZIlYGaJa7UCC
	 6hpzhoC0/PNRAz/mRomOagv6w2nqlkWG+z19oWP0vT5TXWvjt8gRnKTx5Z3KE/16HB2Qi
	 NxROzqCMueRrpyw6evX6WOYEq+HoX1BKhP+v4DGVnfkwHsbXodUCmQ2Xqk6cwp/tQt7xa
	 6uuoajhXUoNk3/Aox0PmbSrQMMyMkyDmHGcTVUFe4alHYWjvrCthquUl6GiEegjtGhpJQ
	 /K2trgmG5aAbpVPCEQpCHJMN0/mlk5EnB0DaDPbY3JYUqinmkM512x2kB/Tv7rt6/Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571377;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Y2PM7PaXPlUtwF7G8UYPMk8Ond4TLwOL7+2XwT/8nDE=;
	b=Yp8wp1NYzhtoPMWYQLOVyoC7DN7hvX28hkdK3wPxgHZyJIsJMvfsqe9oPvyvy/xP+PPC
	 HQc6Xn1jG3dHRZcdryDqkamkLZBBp/momrZz3qzVbUt5O6zsECvzecEg4ghP6gQ20fqOJ
	 sMRIaFritgkK3UFCNR7A9K8+qZrwNa5t4dVf9uR0y5MPHzsLPXe9iEZF+Zpwd4ywnnBnZ
	 PTDXDcIpugqLQF8I4JUQ//cGTNkOT2tNgnJFD0ntATkniL6d1cj70ZhlOw3rzsCzd81gZ
	 YtHMnsHG+7QErmvYDEEaYIDG5WI20YYixZgIQOgELOC1xbKsrlwFzcJ18E674L451lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b93Tisum;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCF260A261E;
	Sun,  1 Nov 2026 22:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b93Tisum
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E473F1F00A22;
	Sun,  1 Nov 2026 22:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571376;
	bh=Y2PM7PaXPlUtwF7G8UYPMk8Ond4TLwOL7+2XwT/8nDE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=b93Tisumf6w7GwGg8JsDtZTrtSbJIwBF1ayU27ZD9hDVNCKU+qHGncd2hKM6zZeEE
	 jqomQF87URgdYK6poFOsR7kRwDChp6ccHh/bHjl9SrnVqpaxdjTQuZcMjisuMRbwBa
	 8XGe+/7YUCA13wsqzPzmfTYPvAyhD6EnG59ZBNv+/suxVtJ9hEBYgi5Jmc1KVs0kwx
	 bb3J2bs2zH9njzILt2JEGLSf3CPj4Sz/jrt8R8D19hpYS25c4F54gOQIW+OZzODjHg
	 CQtQL42bgXBw4WrzOMtlYI14bZwlPgLM+40OhowN0JkJluG6I2TDV4KM6/AVlWy/PT
	 yoYfcdU5IiCvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D442738003B8;
	Sun,  1 Nov 2026 22:16:16 +0000 (UTC)
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
Subject: Re: [PATCH v5 0/5] Enable Bluetooth and WiFi on K3 Pico ITX
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357137554.2624073.2079736918807982610.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:15 +0000
References: <20260928205012.3689405-1-aurelien@aurel32.net>
In-Reply-To: <20260928205012.3689405-1-aurelien@aurel32.net>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 dlan@kernel.org, spacemit@lists.linux.dev

Hello:

This series was applied to riscv/linux.git (fixes)
by Yixun Lan <dlan@kernel.org>:

On Mon, 28 Sep 2026 22:49:05 +0200 you wrote:
> This patchset enables Bluetooth through USB on the K3 Pico ITX board and
> adds the rfkill nodes for Bluetooth and WLAN so that the devices can be
> activated.
> 
> Note that WLAN support (patch 4) is only useful with the following
> patchset, but they can be applied independently:
> - https://lore.kernel.org/spacemit/20260923015016.64069-1-inochiama@gmail.com/T/#t
> 
> [...]

Here is the summary with links:
  - [v5,1/5] riscv: dts: spacemit: k3: move USB3 phy to board level
    https://git.kernel.org/riscv/c/a87ca1e5b5d2
  - [v5,2/5] riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board
    https://git.kernel.org/riscv/c/2b9612eceb96
  - [v5,3/5] riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX board
    https://git.kernel.org/riscv/c/ea5cef6d5f3b
  - [v5,4/5] riscv: dts: spacemit: k3: add rfkill node for WLAN on the K3 Pico-ITX board
    https://git.kernel.org/riscv/c/2f3b7240a4c2
  - [v5,5/5] riscv64: defconfig: Enable BT and WLAN support for SpacemiT K3 Pico-ITX board
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


