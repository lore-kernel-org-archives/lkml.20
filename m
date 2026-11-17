Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916210;
	b=Rld/Z/+TgfZyTeeZ8k+5qoYh0KYSOOt7370fZTjK9E9ws8ZU3gLSEKEAburwH2ROJIev
	 c6U1OC/BVPYRkwx7MC1VkbJ+jcIDmyYWCVDjP6/WSRDOO7jmPNPBpWQ9EAtXQqaY2Li1Z
	 hyCm4cvq2d5R76YqNydAvbvebTh1dbVvABGL9cKBJWubfVPNbmwvIp8mggSucM/dnkwzL
	 IxsqsvJ4cTAw/q5HUwO1XAnjgk09plFcxPIMaBLGSq0RMHIEISo3jtsINJH8zo5Ruqnzr
	 aDpGcPcKBrd6hbtUvLZ3R/WS8By6gC/4A+5UwsHWGQEr2ztYloc290SLrjtV/Osl//g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916210;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=r1YdVZ14bdR6BreskSYxpV++ApdZZnlmoWMv+w8ECBQ=;
	b=MOKUOBbbU3xp3kwVnBo4h0JvkOO2oOF7l3zu6CSTcmT8Zkp2onfqVq9jXWlUt8C4Qpyn
	 NsUAAd4Gk1brRzy7vkczBZWDRQB6cgzVTe325mKDNC+mPkoK51pwTMmvhZRakSVCax8cZ
	 XZcBUjoT4C/Y9wCVXKjH0yPD7Hgo3D9DXxFtgH29Nm7XOkayO/00YKhxFgY70xwuUfewA
	 Fyg9nw1YeitP9+WBt3hhDiOiZZvqDpm2mlyQ9RNbkTnmKS3EGhGiVs9xuylfUWbt/Oc3p
	 y80w1U0QhFndUyqVV5+4k+8Xzv7Hta2ZL+2zqHhohr1m/5NM0lmD65b/Ju9WJupr/KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TnZyV4Pf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B28606A88C;
	Tue, 17 Nov 2026 11:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TnZyV4Pf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EE51F000CB;
	Tue, 17 Nov 2026 11:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916210;
	bh=r1YdVZ14bdR6BreskSYxpV++ApdZZnlmoWMv+w8ECBQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TnZyV4PfVd5LNSxO/1Aw9/XMgU695MnKJaEeP8n8vL2UoyaWuOEHV0VspIQ0+9FFz
	 VBTNMpiGttm2aW0wyVmBzEJZHL4JxuymYi/lfaIuTkHe/mXpzncA8tXheyUQmn+80Y
	 HGQIcJVGe14a0KSGZzDE3NCI8SGb/tGoCOoy3t4sHM0FvHj4taayvflVmysaJANwax
	 7ynmE6+nr/WS3BpWDwHRdtpGYTdhbJt2SPqrTP76I5a9cg9UT2on4avZ84iouAHAQA
	 h+wV7xfniS/CS7Y/CEk/7E4oTc9WxJ8GoL2AJN70kHvhZazSaqb0M7M/tK/+emfTyR
	 R2jQUR7zBrnWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4893926661;
	Tue, 17 Nov 2026 11:50:10 +0000 (UTC)
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
Subject: Re: [PATCH] bonding: reject IEEE 802.15.4 and 6LoWPAN devices in
 bond_enslave
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179491620877.531240.2226036750385717075.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 11:50:08 +0000
References: <20261112130833.233208-1-skalpesh942@gmail.com>
In-Reply-To: <20261112130833.233208-1-skalpesh942@gmail.com>
To: Kalpesh Solanki <skalpesh942@gmail.com>
Cc: jv@jvosburgh.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 socketcan@hartkopp.net, yaojiale02@163.com

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 12 Nov 2026 18:38:33 +0530 you wrote:
> When the first non-Ethernet slave is enslaved to a bond,
> bond_setup_by_slave() copies slave_dev->type to the bond device.
> However, the bonding driver does not set up subsystem-specific
> mid-layer contexts or private structures:
> 
> 1. IEEE 802.15.4 routines (such as ieee802154_llsec_dump_table(),
>    nl-phy.c, and socket callbacks) identify WPAN devices by dev->type
>    alone and unconditionally dereference dev->ieee802154_ptr and
>    dev->ml_priv (ieee802154_mlme_ops). Because bonding never allocates
>    these, this results in a NULL pointer dereference.
> 
> [...]

Here is the summary with links:
  - bonding: reject IEEE 802.15.4 and 6LoWPAN devices in bond_enslave
    https://git.kernel.org/netdev/net/c/297ae1590173

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


