Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917406;
	b=wCcys045MKj4hF5Hng8xZX9q0ouGlO5R90e0UA98tMz2XgBbFaY/XLrq326bdpCfHiDZ
	 ottcGwmmwzhGg5e1XgdIS1JR/U39DwbDJhI2ruf98eCBeDYSVlmtPv1VsBPy21zjhlx6v
	 T0Fg1hbulJwZ4CM62bowVJncdRji6F1f63WgOeY4B3gQobGC56HVVT0uE8hdZIW0oH8Ra
	 aHoA/MxXg6rUYCa6a0Nu361PJA+DpDLsEPB81wgKKEg8tJcjIC07vkXqHyzWKcpwJ/aSi
	 zmwro1clxT/6mdyDfLdxThQZNFxoyrUKwvMGCxdMXXg5+8rHAtmk6NSDg3eZ7oJaG9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917406;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=gqZ+veYLqVrqnYZiqLVMN5xeFmCHBA4ngsraJ5utYYM=;
	b=TJsYl5xErFNMrVjWvHaBE2eXOpxzMz9GsG3QRTe9jspjSY6RHwsKauz/NoDnE/KzsmBd
	 e1kp7sOj8MBMOSTaa5lwHicU3kYBoqA7E6rlM1yOMDGrxa+ed+WNd9IA3Tsd4x4vN8E8Z
	 pe+wa2RJ5QWenRMy31Jdi9pBcI04CMP2zLfi4RbYP3wuoeJm+LZtsoL5EAkPzeVjVCfTg
	 olnMu5kyMI2iVqb9Na84wI9HRzAc6UqFq1nJzVnXs1bqMftKFfiVokWE6W0CWYPISqnzt
	 W4HZJhqCes+hWGJ583C9hUz3LY2D7mXVoUe5FgJidSf/hWLOABeTIJ6HDKWdQUmqvsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XiROlj94;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C771606A338;
	Tue, 17 Nov 2026 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XiROlj94
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088A21F000CC;
	Tue, 17 Nov 2026 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794917406;
	bh=gqZ+veYLqVrqnYZiqLVMN5xeFmCHBA4ngsraJ5utYYM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XiROlj94B9MiArZeD+7hPaFGBGBYUSSAbZ5b6jwzOtB7HBkKRMQ8VLSBBb4Z2GYcN
	 6pBWeVfR1rUPurU2wQQ+dWWTBj1A/LT0CjyMt8Ln/ObTImfH0ZXH7xBH4tt24TLB1J
	 IJS62C5rn6nOu05UiVqxHsEWsXAbQ92FoKWt/X8hsYG0ZFsSb6O+i3z7eNXxPzgq/X
	 udGAWReeaEOMhQE5X374dwqJL+ojoz8Q/br35WJeAIOtcl56IfDkDfF/sh/x7FV6Jh
	 JrkM0tBZuBucxYVeLAtMFfopbcW2Gtzc77Ry/R33/DqmFpY0aDiUpf/46NhMzKxyOK
	 8jdZscNmko22A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F154F3926663;
	Tue, 17 Nov 2026 12:10:05 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] ipv4: igmp: report IFA_TARGET_NETNSID in
 multicast address dumps
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179491740478.541394.6915913156720247730.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 12:10:04 +0000
References: <20261112082352.152338-1-sunwenbo@cmss.chinamobile.com>
In-Reply-To: <20261112082352.152338-1-sunwenbo@cmss.chinamobile.com>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 hangbin.liu@linux.dev, yuyanghuang@google.com, nicolas.dichtel@6wind.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 1342116488@qq.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 12 Nov 2026 16:23:52 +0800 you wrote:
> Commit eb4e17a1d915 ("netlink: support dumping IPv4 multicast addresses")
> extended RTM_GETMULTICAST to dump IPv4 multicast addresses by reusing
> inet_valid_dump_ifaddr_req(), which already accepts IFA_TARGET_NETNSID
> and switches to the target network namespace. However,
> inet_fill_ifmcaddr() does not include IFA_TARGET_NETNSID in the dump
> replies yet.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] ipv4: igmp: report IFA_TARGET_NETNSID in multicast address dumps
    https://git.kernel.org/netdev/net-next/c/400bd920a724

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


