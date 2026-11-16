Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871210;
	b=Sb4NfsWfcPsapT++mudPP4maYyEoNb5dvNnotkHcvzB7QpADx09e1dGMexKUn5LKxgmU
	 KomPUblzavnPyrb/Rzo3+4gPAjXbpPXsijKrcr+4RDl+J7I6Hepmalh3jAF72xnLNQTOm
	 wuONr9+UaCGmyXW2bNHEsz0fNuQxj4dfqPfvfavONKqFeeOueDg1m7hSnkT9FAIZlBA86
	 SkvfFmEumdeDQaHbmZ8NsCuyEGxrjPYbav0/oSS62/noPtrK6Paiyd9EPg5X1kXwFpNLA
	 Ect8h8JW3nIwiYAHChv/i0Hxpdi2yGXiFh9KLkpPkqS07i+11kHBKP6RVNXIEI1rCxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871210;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=JETE9dmzQWnrL9nTw50w/jRNsg1XMbRb/EUbNqHoa+I=;
	b=0vyCBeqswChurSUkQYTYnqttgELLuB1uOpb7JeA2wffUuwlzVm6KNJrAXrZpG0/zhO+L
	 FtiwusrBYA1K8UTFp0Lr9esSns8sL6ke48oiSD6SXnybM66I0siCseqsdoYsc4mVJsFEF
	 yFaI81kSsM0nU0aUDMllMXyxPidWpaTKO7VJ8+fvdJ6HePEja4EfLDa6JZPD8QaQjs2Xm
	 LKD38oNS8axB3uWYWMBCyP8Lpl7A2q+V8854XsV1fvTmdoWrsOhW0fngWRHpwEsNZAGcF
	 Tmr7PKKzd04nH8K12u2vJc49X9Xo5ShLoBwiO/0qQC/WW/PjPKTjacF70Jz/8aRuafg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dU9sAKSY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C69606A332;
	Mon, 16 Nov 2026 23:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dU9sAKSY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8811F000C4;
	Mon, 16 Nov 2026 23:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794871209;
	bh=JETE9dmzQWnrL9nTw50w/jRNsg1XMbRb/EUbNqHoa+I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dU9sAKSY2Bz/3Oo/tlbGH22nTFm6GGOKWw7TdcXwfdWk2d0zRg1VB4CByOFSHwxjG
	 YZKZpg6KcxXytvR9gKgU1Lzk65FwwbK8eufUa2tKuoeWR4QK5wID9RfSNJYjb8ggGp
	 ZVThZwGxjOmb8Sy+y7bfIVFNUlgWsPxdhZteeprnAHnl00lYNgV4LHD6bmZG8un5lp
	 VevcujnYs/rXMDhugIHrdr7bCEN75ICn374VzOa0BNd87R4NXl/Bm+LO1PtZEiGMB8
	 ydY2cQrGr6adNuZBtXuDBKBqFN98dLk4OkqGimmNFo84yRsk7nFzyTDeUEecrQlqI7
	 MYLvrz2NiDLOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43A2391B059;
	Mon, 16 Nov 2026 23:20:09 +0000 (UTC)
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
Subject: Re: [PATCH] net: sfc: run all the packets through GRO
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179487120827.232553.3824112679910149273.git-patchwork-notify@kernel.org>
Date: Mon, 16 Nov 2026 23:20:08 +0000
References: <20261109-sfc-udp-gro2-v1-1-025d385f007f@gmail.com>
In-Reply-To: <20261109-sfc-udp-gro2-v1-1-025d385f007f@gmail.com>
To: Michael Baikov <manpacket@gmail.com>
Cc: ecree.xilinx@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-net-drivers@amd.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 09 Nov 2026 13:08:35 -0500 you wrote:
> From: Michael Baikov <manpacket@gmail.com>
> 
> This commit partially undoes changes made by the commit e79255de8581
> ("sfc: Do not pass non-TCP packets into GRO code"). Those changes made
> sense back then, but now GRO can help with more message types. Now, when
> GRO is enabled - pass all the messages though GRO subsystem.
> Tested on SFC9250 with a UDP_GRO socket.
> 
> [...]

Here is the summary with links:
  - net: sfc: run all the packets through GRO
    https://git.kernel.org/netdev/net-next/c/2d1d687936cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


