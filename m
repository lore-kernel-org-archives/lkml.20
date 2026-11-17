Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873608;
	b=Ylt+m4tdzC36t2vW53Tah8pipAtP59/eT1CwTOV2kF1Ixbmb5oWg4iLjH+mdHT+us+0g
	 dJEvJSDEhCaqhMf2cVD8YwjYjJEHBxrE4fuvtDflhqJP9rOIdQ5wW2gac56zg+4hiRB22
	 EMJaAsIPiocnA4gGIE54/8PdVbjI750t1Isg7HrBwiCHsyOLlbglQ+08DJETLjK5bvaG+
	 +fc+DkzTNvX+P1N4zkhBXnkow7tc7eExk5L8MNayTKsqIXsIqunJpFHw1DfKGWo+KFRJc
	 AgWNGObDXkU1jzhMj0wjsW0uc/N3J/n2eKcEpL2uEIrQ26hxHq+Ks/ixNtAtENkE12A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873608;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Dq7TfMW/kTMuS8oCBTkJpQVA3goDLDWa4OsUOEaTQco=;
	b=Xdc+QGAk1Va2TCyKBb+9eMITkYaaqiBs1Rxv2ETIsGdtkUPLHa12wXdEp8V06aQugi7p
	 cKXFZp46g2IMS1MiCR5nFD08fzxRpwqTQ2ckQqDnGo2tDyQQhLDC7Jo03zD2L/34kNyYI
	 hUXYr02STBuuilWIuRhzqK4Fx56krI4iPKUWnRf6Zkqviydu08iEzb2a8yQpv1tIOpaWE
	 13GPd9Xd6UHJxYbbynYY9qEgiSHE0X/Vg6ZtF1gi40fEo9TJbe12ipt6aDvqu7/f84+3y
	 cLEWvELTcW78VRajCvLWgWVzApY0C3GWrhtQC7HhzijmSLSGZS+lP8DQpdJv22agtHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVwSCm4h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FA5606A33E;
	Tue, 17 Nov 2026 00:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVwSCm4h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895E71F000C6;
	Tue, 17 Nov 2026 00:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873608;
	bh=Dq7TfMW/kTMuS8oCBTkJpQVA3goDLDWa4OsUOEaTQco=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dVwSCm4hh8ESVga6NfzJuaB1Q/4uaT1n2QfKYEs9UpjNNlNmNrKlVW0oczcPChqcv
	 8MTOkG8htzY/QlbHZyUDyYAE/1cBUw5r0GP2LQzkJzNstj3C0l8deHcFaqSF/Da7aN
	 IBbBMMIQ+GvEJMiGiAbhongTndxegbJMotrl81WSjhccoZ4MG/AmQ9bldtbghOeUN5
	 6zr/xYlyJ5VAYCpc7vwv5/7XLaPDGCFcn3IveMn5IJQKqT6JVKYbYHWT4FaliK6R6b
	 mQ7zHbDC3Y7lctC9F98Jw/26jfV/ChYrvmAUZiNdJuvXFzMLpUCCzhsTeE0hFeUN7e
	 HoU1BAHEfP8ew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773A5391B061;
	Tue, 17 Nov 2026 00:00:08 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] net: dcb: flush rewrite table on device
 unregister
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179487360703.250117.8797539923887130473.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 00:00:07 +0000
References: <20261112033622.40333-1-sunwenbo@cmss.chinamobile.com>
In-Reply-To: <20261112033622.40333-1-sunwenbo@cmss.chinamobile.com>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: daniel.machon@microchip.com, petrm@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 alazar@nvidia.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 1342116488@qq.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 11:36:22 +0800 you wrote:
> In dcbnl_flush_dev(), which is called upon NETDEV_UNREGISTER for net
> devices with dcbnl_ops, only entries in dcb_app_list matching
> dev->ifindex are freed. The entries in dcb_rewr_list added via
> dcb_setrewr() are not flushed.
> 
> This causes a memory leak of struct dcb_app_type nodes in dcb_rewr_list
> when a DCB-capable net device is unregistered, and leaves stale entries
> in the global rewrite table that could inappropriately match if another
> net device later reuses the same ifindex.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: dcb: flush rewrite table on device unregister
    https://git.kernel.org/netdev/net/c/6836fa400109

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


