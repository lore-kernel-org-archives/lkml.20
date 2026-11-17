Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928805;
	b=F2Avz3jrepg4LM+ihI34l2ZP6mYzUBJ92+kcyJDdOXW+OPsCim2ToaowcCWTyK8QVEks
	 199llPpGcsj6Bs9Y2BU5ZMS0Ob7MJTJeYIgxaOJOrD952oChWEhu5N4uehxEKmYxrU03b
	 QdMNYJLX//NMJuoTBP1vF2jGO/WhP31Ql9YNE4J46JWqvdjcHdv0rctqjogpzXOHXKHb9
	 w2sV3BwKoud8zle5rQVuVBtxIta688Od2QDJtpjnP8gc5KZ5f27Ok1AOHok01Z7dHrpG3
	 KA54YCUSQlAkr5UJtph2WOq5r/mrdOeaChFkq0Gam3BCiEFXgwrM91xDVJyAA+3T1DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928805;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=hEdkIRFmjzJZgXYIFKRJ1DfJOxy6oC4ux3kp+at786E=;
	b=nQ2QHQrIHu9XEa71xtaeS/pD0W3M8hogUqpml9S8Rkt/4J/uYfkkWzDwoAI7Ync5VNn7
	 6LeKtyBvBOXZnSW0nuZnDXDGlGdsIOHtpdLKIc65Ag64GOKbQ3tOVjr6dV2HwoBBlx2vU
	 ytZtXcQSZZkzp1SUo3yx23qJcTFC4x15HeoVkBajmsMbZQW3OYBYRVkPInCd6/sGVcOc+
	 tvYgupCReV/Fba2xUWzZc77i5cgT96uckkqPC9yBaZa6lnTCU+mol/ZlnPg+TWDlDgVm/
	 ZZAPxm+KrVIckA0zRN1O394/gZo4xiRpuT03KtwwWGkbwvy2PThDxI7QcQU4lL3XdVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SDE2eEij;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60A9606A31C;
	Tue, 17 Nov 2026 15:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SDE2eEij
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801FB1F000C4;
	Tue, 17 Nov 2026 15:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794928805;
	bh=hEdkIRFmjzJZgXYIFKRJ1DfJOxy6oC4ux3kp+at786E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SDE2eEijzK+x34Xt3tXT8OamR47XSX9JbeShtSQTZ+wTfZxjST4oiBmRCFZ5Q2zX6
	 WohlDpct5qn+K8dckS0DJb3TTPjLVc4HAAWNqSFCj154RysjC5dhJajGyF/Mn3pyAM
	 T5ryMJp5GCWlL6L3TWm3WnBAjjg2T2RK8b2X9HljmkyAFlfr3HyW9RhN8oaTtweZjl
	 EpbXes+4cHnBd0PbSiAgCSw3OsYxna9QuR5MXkzbZpoPm2zju5CiHcTL4x+pXqtyIZ
	 iOs7Zjz2OAWCjiaAqoPQJ90IvpV95ZYvRnALuo7dW7YyqBNW36O3sFjdvepBGYXfWq
	 BuGFdpskRMt4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772FA392705E;
	Tue, 17 Nov 2026 15:20:05 +0000 (UTC)
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
Subject: Re: [PATCH net-next] MAINTAINERS: Add Suraj Gupta as AXI Ethernet
 co-maintainer
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179492880428.651948.3046035497338060944.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 15:20:04 +0000
References: <20261112174926.2102832-1-suraj.gupta2@amd.com>
In-Reply-To: <20261112174926.2102832-1-suraj.gupta2@amd.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 12 Nov 2026 23:19:26 +0530 you wrote:
> Add myself as co-maintainer of the Xilinx AXI Ethernet driver. I have
> been contributing patches to and reviewing patches for this driver, and
> will continue to help with review and maintenance.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [net-next] MAINTAINERS: Add Suraj Gupta as AXI Ethernet co-maintainer
    https://git.kernel.org/netdev/net/c/09599d876dd1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


