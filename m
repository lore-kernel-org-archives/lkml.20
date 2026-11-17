Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873607;
	b=xhzR6U4MPnjRB0z7kYRnx55nEXSN9UX/5aF8vgr7TE88XYO3xp6Lw68nsv68KvbpHqP0
	 /n5kkNw6v0P6FWEi5opbWvxQ8bHxd+U8eUG0ms4YGjlvr5wPMmiuHtoeM5AHEK9guBFXU
	 oVHGvn1qg4DBH0mwADDhkhhTwkNvhcnwkN0ody3umUEuolVANL1dYTKjiqmFQAUF2FQdz
	 gvP+thhD/jsvmuqmG6Ucjpvuf0oVhHrAK5WXIC3YXbzaGmEnryLa+BLlOo5VS6MqPBHBU
	 MmwFtdOPtnu5SPFcUFrchWF3UDxtYS2QoCcBq2ms7FCYClihpqcIJahNGGZKUVUc/Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873607;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=gb226OdwCidc6WSe+jGRW6bvAhVCxuI44YctW7ONTT8=;
	b=TQ2WJ4azdF6CdBvvMC1Km13l9FnZw1an3ToDREd1lTpwzHr2cjx9cv/ISBlBjoUJhB9t
	 pMRUXeyB1Jh3Ctg9w0jMpNsYEJYqFTSi44Q+2kikqBSeeDhl/OJ3wG6BzqCmRCR4R2OCY
	 XwB/3uqy9A8Rh0hVLS4y/aWUuBbDP49+E63RhqC1RVmD/WEBrjymQmI5UPBU+1aa9am4e
	 2hCS1sTU7hGjQ1KaeyZlBiXvGTP1nyLQnIHFvAN+tfBilAwZ8VSrZ4nNjjimxQospdZY+
	 cpXg7Y+OxLxKNA+GncjXy1y7gVFJfVoMtW2gyjKdS2N85AUH6PcjExo2bry1RbD1YeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cvrhhiXn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82348606A332;
	Tue, 17 Nov 2026 00:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cvrhhiXn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0A11F000C6;
	Tue, 17 Nov 2026 00:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873607;
	bh=gb226OdwCidc6WSe+jGRW6bvAhVCxuI44YctW7ONTT8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cvrhhiXnwhGxqRWYkUq273HCl1AdWsNek+1Jwp9tl5PEoCzEJ4u2fHtvGKyHLqJzc
	 4H82skI/oPdohVII00ayAG8fvzJX4/4O7rLxhW1BBEhL+9DmDnBOaC5NkBw5sjplu/
	 gxbdRnkNuqoJtgBIS6/xq5fJCCrofDucQItW1O+Td2jPAqK1+yzuj1goUJ+GSvQY1M
	 Lab36csJg34DJ0gPiF2hQerBQQv7nkMEqwt3ryl/jclxnUEU6jwjlDKgggcfk/i+7r
	 Nm2bF4Tm7XW2c1u01geaZhdYma2kfkTIXfqlw/n7xsBHr8S0QuEV+gYCZoQy562mgN
	 ew7VUmtT9guAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F160D391B061;
	Tue, 17 Nov 2026 00:00:06 +0000 (UTC)
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
Subject: Re: [PATCH net v3] team: validate the length of U32 and S32 option
 data
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179487360552.250117.3472263145936765475.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 00:00:05 +0000
References: <20261113090108.175889-1-sunwenbo@cmss.chinamobile.com>
In-Reply-To: <20261113090108.175889-1-sunwenbo@cmss.chinamobile.com>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: jiri@resnulli.us, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hangbin.liu@linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 1342116488@qq.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 17:01:08 +0800 you wrote:
> In team_nl_options_set_doit(), the policy for TEAM_ATTR_OPTION_DATA in
> team_attr_option_nl_policy is NLA_BINARY because the payload layout
> varies with the option type.
> 
> For TEAM_OPTION_TYPE_U32 and TEAM_OPTION_TYPE_S32, the payload is
> read directly with nla_get_u32(attr_data) and nla_get_s32(attr_data)
> without checking its attribute length. When userspace supplies a
> truncated attribute (0 to 3 bytes), nla_get_u32() or nla_get_s32()
> performs an out-of-bounds read past the attribute buffer. Conversely,
> oversized payloads (> 4 bytes) would also have trailing bytes
> silently ignored instead of being rejected as invalid input.
> 
> [...]

Here is the summary with links:
  - [net,v3] team: validate the length of U32 and S32 option data
    https://git.kernel.org/netdev/net/c/de9886cb02f3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


