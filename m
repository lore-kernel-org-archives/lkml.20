Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794772207;
	b=QSdsRl8lT66stsYqxVBeFtQx9p9loyCBDAmgetC4Xe/3BVzEh7Ec3aMj+3HSSCwUm3/k
	 qwA5tAvjOrymkOl9xt6OjqO6KUg//9sEpQVUJq/qR7A3NkzqZgpM97+MgIiI6MzGNDoHt
	 KV21tYbKeDy/oTaKn553X9JWK2lMGZvoLcFgTl6Z4Hl3KPRNbMomNDt4su+40DIn3a177
	 +T3Pq1beAWnP86c+RdWSmWjqVwKnnp1J1dK5KR2wTax6221xAea62lq/CeSWyCVfSF7/o
	 NfsBYOt2/PkY7MOY+UTBAA5zWtfc7Y5Wrf2+GVX0xExTlwfYzcKPMaIerfxaylzxDWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794772207;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=O6G1Hb7w7HKu/DtXrp41mYowr753WjHlB5harznQUmw=;
	b=jxVn27n8nkux2bXOFf9JIuwEm4hBLQGfHSiVlF/H+tHVmDkEuXQUm4uCke3HuY85NOun
	 hqQmmLdweuitY2hdKcnKh3gphpHxyZqkKvEvcQOJbxYnN9K5+SvWGYDzcPXrBIOSyLARv
	 L/9vw5HCPwIf0Uu3NnO90BzUkO68/daL6QxFJEvZh3JatZ//XEIImcOJ/YO74F0bRvlw6
	 BuA73l9EyUlc8CPL4CToCk5nJ6JZebKrddsO6PfNh77/zloJ9H9OGLUqlASYIPIKvFk8a
	 +jBMee65Lpp4Jrctp9opYxD3PXzhsEYxx2szvzWKFvcLnWF6m6Snv9SCR0HFCynxI2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHXKbgay;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A692A606A31F;
	Sun, 15 Nov 2026 19:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHXKbgay
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A511F000C4;
	Sun, 15 Nov 2026 19:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794772207;
	bh=O6G1Hb7w7HKu/DtXrp41mYowr753WjHlB5harznQUmw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jHXKbgayc+e4Z15JvHXBwHM2wEuFEfrEm8olU7Ftt4aNLuj20+vzz7/ghG/hKZZ0U
	 +KBjE4lbXXpHXAcp2aZrhspjUViXJlXokH0RbmLuAO98rp9rLaVBo8BM5rRM11jSvn
	 MoxuaWaQPHDpzu6O66fs0ys/4mp8JAOlaUkh4YlvnMbT6kaT8CTFBVKLnViVDosrrb
	 3nxlNBh3Q+10+aypLtNGs3IampyfYA0QrAmE4tKm8a8t8bLXbj4zg26YC/Y4aBeK+H
	 vAk6RIr97h6CESbHjIC+efTfHVuS2UA+r/8Xs2RfECbQma8WTVdDC223ZyIWjPBlTH
	 bRSDvPrSsRcrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773FB3808235;
	Sun, 15 Nov 2026 19:50:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next v4] erspan: drop packets with an unknown ERSPAN
 version
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179477220602.2712597.2387350653289450443.git-patchwork-notify@kernel.org>
Date: Sun, 15 Nov 2026 19:50:06 +0000
References: <20261110152848.23136-1-yanhaishuang@cmss.chinamobile.com>
In-Reply-To: <20261110152848.23136-1-yanhaishuang@cmss.chinamobile.com>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, witu@nvidia.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 11 Nov 2026 00:28:48 +0900 you wrote:
> The ERSPAN type II and III receive paths take the length of the ERSPAN
> header from the version field of the packet, with erspan_hdr_len(), but
> never check that the version is one they know: 1 for type II or 2 for
> type III.
> 
> For any other version, erspan_hdr_len() returns 0 or the type III
> length. With version 0, the ERSPAN header is not pulled, so it is
> passed up as the start of the inner Ethernet frame, and in collect_md
> mode the metadata is filled from the wrong part of the header. The
> ETH_HLEN pull in __iptunnel_pull_header() still covers the bytes that
> are copied, so nothing is read past the pulled data.
> 
> [...]

Here is the summary with links:
  - [net-next,v4] erspan: drop packets with an unknown ERSPAN version
    https://git.kernel.org/netdev/net-next/c/7ccc5e05043b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


