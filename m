Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794872411;
	b=FB5pgoByVpDFb96u7hW51sVPeGdhDl4PRn2V+wb3nixSrJ0+JXTcDcNbkaiXBRR3x6cy
	 ZhWeB7AsOxcUGmCuxMzlM4GtQ2EhnyNtPeYBpwAkZDeut9giQA3X71qtOiAQyW+XjxuPZ
	 FfOfYb3dUGlawLUembAXCCeGIgWqcpJP4XNUIWEVYm2x+Pip15sbBb6Xjl/vxJCMQkr7S
	 sSktH6RFU58iB+u0TILjr8HsydCMQni5atZJlJv72SG5TU1PPzG3fvHUgpMzGP+AHDjYX
	 +AFkqPg+xqAbqQAZLnZr+0d9NEmx2BWmf4s+gYATNXYYNeBl2AgcLnLLV6tsKoRpmZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794872411;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=9GzQqN9C4tUUY50++Ccr1EqxmPJKMHeJ+ACKBWOxuPc=;
	b=RYtOKrio94R6bcwe5dmqUQi+cM1NFmz5JiHsTvnG5NbtEhaCYOb6ox3TcG0oS8Bydgga
	 coIxS3Mck16wVG2z5gw1Lp04JjVbXJlz9yVxNvCL35eMp7JeCCbzuNH6PK/f2FqRPe1xf
	 y0Urw/EmTHkoxQsBgIxx+bog2aSEzXUM4PGU4dDBYmXyoC5e/J7fKpvbBLvEahGkUkz6u
	 z+8Rke+jAo3VB/5/QKUSiH4IqYEY9vSga7+wnmTT8gbFS+/vDHrAMue1yNTyAbNbxiply
	 hmYGaC4PVE6GZykuxBYXdo9n6+dwPWz0xv5wlzYM+VCb/NfOKAfB+SekS/W7yixOF3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Xj4unxS/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521BF606A893;
	Mon, 16 Nov 2026 23:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xj4unxS/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C001F000C7;
	Mon, 16 Nov 2026 23:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794872411;
	bh=9GzQqN9C4tUUY50++Ccr1EqxmPJKMHeJ+ACKBWOxuPc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Xj4unxS/rxg5vxfGApfZ9BwrIpuqHufMfiIXUzjCZqV2Avy0yBHIxqLFqrOnb14kc
	 C+dkrh7BlI0BkxpXdu/bPjMuVixFO6sswdYJU8ZrdSSfCNSRD+NTBtYvX8+mxeYCCm
	 MMuCbgsXtlA2sGeA5/23/NKluELTQ6S7dtQqPBNFtPvcpPY0cCNluL43Sd6ll03mfB
	 BenkyoT8K6WOXfrSK0/gfkBcMJOuQ9/kvXv2neslma6D0zhOMNB29H+DDSjDqjEGhj
	 n7mYtWgTGyjj0Kd4K16r5g27YnTM9WfXtl5vqJMpb3KCBIEzBHhSyEgwa8vIT6enjO
	 +HJFsUF/KAC3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14B0391B059;
	Mon, 16 Nov 2026 23:40:10 +0000 (UTC)
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
Subject: Re: [PATCH net v4] ipv6: ioam6: do not modify shared tuninfo
 eh.nexthdr
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179487240952.241382.3388765976328461502.git-patchwork-notify@kernel.org>
Date: Mon, 16 Nov 2026 23:40:09 +0000
References: <20261112-ipv6_ioam_lock-v4-1-89e3381be525@kylinos.cn>
In-Reply-To: <20261112-ipv6_ioam_lock-v4-1-89e3381be525@kylinos.cn>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: justin.iurman@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, liuhangbin@kylinos.cn,
 netdev-bot+sashiko@kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 13:46:44 +0800 you wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> ioam6_do_inline() and ioam6_do_encap() stored the next header into
> the shared ilwt->tuninfo template and then memcpy()ed it into the
> skb. The lwtstate is used from multiple CPUs without locking, so
> another packet can overwrite eh.nexthdr between the store and the
> memcpy.
> 
> [...]

Here is the summary with links:
  - [net,v4] ipv6: ioam6: do not modify shared tuninfo eh.nexthdr
    https://git.kernel.org/netdev/net/c/5aac571d9190

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


