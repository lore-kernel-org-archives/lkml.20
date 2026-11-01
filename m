Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571389;
	b=KlChszm/K62e57J1AZnXDygGELmbkk2n44glte+hMN+fWiM+Tzb+MGAqkmhqxCISrroe
	 snubfPG8XQTKhEfpTGs8lacbK4V2IrWVu/QHbJKwS2cpAVdLVUxiDqgia+PjWE+Pb7D37
	 7nK9iQz6WgrhyqV1kuPg3hDuR7iJkjtu0uCc6HO11/sgIY6bXQzOooCAxTnIdPLow64se
	 hs7Nm4V9ZQ9u+tbGp8woykYDJ78kOeJIouES4saxKE7VH8hpSMeJpzEjaAzgQRmGJ/yI1
	 5qO2ZzEtEK/9ooi1Dy9YrrRHQRtNN3ZvGMkyNzEQCu/G/11LsAUlD7hghQIQOEehKHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571389;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=mYyAayRoZikGuVa2eTY9XdZusf49iXjgOkDtLITdEgk=;
	b=FgXzY4f8kmJMV/cQGdc9Cg0ROkjCM0dUdUm8XYFeWYO38kDjAv/UDT0FjvaaaaBhsb0V
	 wpHrV7NY/ReJQgTY9bO1rlUFw7zdaVTrh4jmRbqzXENywvq+wsMjZDyOs5O0ysHcUpr9J
	 C8ZOeLFuo/3CKtV/NPYEqqARRAAWnq4L6uuVG/p7eTqgTosA+K8UoFB6ycl0ZueEK+KbU
	 KDkwC1YMW5rSEoASKjY8Re/uJSk0ikZwvpGqlUWzeAvjAtnMeznDJoK48HJpVCUFgOYwO
	 kkodGwj5NqE+jqJswUwItzcBNOVNsBNQC38IOik4aJ3MQAj3hdraRiXlce/BL9dSBGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mXLfuPXP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42C8606D137;
	Sun,  1 Nov 2026 22:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mXLfuPXP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5FE1F00919;
	Sun,  1 Nov 2026 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571388;
	bh=mYyAayRoZikGuVa2eTY9XdZusf49iXjgOkDtLITdEgk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mXLfuPXPchjyCsKqUUn6GfbB242wECSzlW5Nl5mVJ6Zte83mHJNI4R4d8xkp7uYcd
	 PsMB2hamerPq2dnWXNyCSG+wGVJoxOanUM42cDhwQZm6qnyCUjMMHEM/aieCRaZXTY
	 YZ6bc9U50iXAKJ6034iAZfuM4+M84BeH8T0pGIdkGJ0NIMUEZ1bKDwpu6Qimh7lTAM
	 tuhkR19/h7UrSYSq4bb66U5CX6UY/m+upd5rhiqJyHWOwF8yMk8WPOWyXOG1GECtPq
	 WPFZslCedVeFfgCdotFp5j/booJbOqPkd8OugZblxDJ9R1gbY68KHhHXNfQ9JRpvCq
	 9YL+YH3CTO18w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 873E338003B8;
	Sun,  1 Nov 2026 22:16:28 +0000 (UTC)
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
Subject: Re: [PATCH v2 0/2] phy: spacemit: fix and enable the K1 USB 2.0 PHY
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357138729.2624073.17557863773534626721.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:27 +0000
References: <20260825065007.69353-1-bbanelli@gmail.com>
In-Reply-To: <20260825065007.69353-1-bbanelli@gmail.com>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: linux-riscv@lists.infradead.org, vkoul@kernel.org,
 neil.armstrong@linaro.org, dlan@kernel.org, huang.ze@linux.dev,
 elder@riscstar.com, linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Vinod Koul <vkoul@kernel.org>:

On Tue, 25 Aug 2026 08:50:05 +0200 you wrote:
> v1 was a single patch adding "default ARCH_SPACEMIT" to
> PHY_SPACEMIT_K1_USB2.  Automated review pointed out two pre-existing
> Kconfig problems in the same entry, and that change makes them easier
> to hit: enabling the symbol by default means configurations that would
> previously have left it off will now build the driver.
> 
> So fix the dependencies first, then enable it by default.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] phy: spacemit: fix K1 USB 2.0 PHY Kconfig dependencies
    https://git.kernel.org/riscv/c/882af55e42a4
  - [v2,2/2] phy: spacemit: enable K1 USB 2.0 PHY by default on ARCH_SPACEMIT
    https://git.kernel.org/riscv/c/392101240b22

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


