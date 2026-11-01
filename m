Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571361;
	b=vtf7L4uFu9Aeh3+/ncS2ZvaLkIXfSrm3nXXR5keJci0V25itsrl8by/fQr22hBk+HwKG
	 D2ariMmE7LLzJIxF7UTps+ODowUdKkhf8w4/Zh8afjMNk1f2jOoJAdpGZLrjl2m60KCRK
	 QXVvYKSv8z+gbyYkld5xhKi9JFiGkWWTbc1FuR1Yp0nx/HY4cUdLBuXIF9rFXKXJp+pb9
	 dA0gZ42KFWMv5xgcoi77lnb4u5JBFdJlqqtEkhm7fRyKWlPty4/jUjRn7EJElNt/fzGPK
	 RMxbQ4R0cA1B7+1nt5awJrkVL3y1GXi8cUTzJd+z7AlFjkKtZcrG2tXnFEBMQ5NENzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571361;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=HaiWGXBSErIs4k623zp/ao2jxpqugtsdrB7YWP808LA=;
	b=Wrd9T666hYxzSYkZLmHTOZrp+wU7onJCNH8YC9YQXJlpYjLf0plJ+gYTXQ3KIxfr7AS7
	 Luj/2jZQqDXpc1PnhYxmBAlddZflV1ODmDw2mm0/hF78veFB5FJ9qU/oNVPaKF1Uk58Hb
	 UNCZxWa4rbwvKk7Rg9oDMc2gA2l1e08CJuznZNswG/x/kdyiju0hzpxGjgurpvAyXKS4M
	 QaJvwdwsuOqcD0UonXv0GwPF0TYX1AUUxmeET9DPKITei1lj5sPrf7kpzHCBbKXQ39EEd
	 zkcX7zNgGrX1g3Id8LlGiiJ7NR5fytTEQJtZzc41ZXhqCH1Cw+N4PXvj7tt8EB3VKxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAAdBT7L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE48360A3809;
	Sun,  1 Nov 2026 22:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAAdBT7L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8696C1F00A1C;
	Sun,  1 Nov 2026 22:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571360;
	bh=HaiWGXBSErIs4k623zp/ao2jxpqugtsdrB7YWP808LA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FAAdBT7LZWiow3HSB73F5Qhg5zJ4bgGnyl5I+sKWixLnuLEnazBGZUb7DEaISTEla
	 qe/iCgNu3IWYoqR8SbhcXtxfwtEdmS1g7OEnNehNWyv1HwaIunuanbKSKU9I2D9804
	 BHEX5zq0gvX9Aecn4T2zogxgL85S9U4X2WFfZlfs9/IgihuioIbqltE86ZToOaByPM
	 obMmIepdSuAjBbB1svcQhSFrU6dJ0xWCWSpw2aWHF21z+Xi43M/wSTWwLMNYpMkGaE
	 hduuGgX4/nKfy4nKPmB8nxGmWLraXzAoYd/KgSDQw51qZ6nF7OQ2QyIE2PTUMOfUXD
	 Cw7cwVyQPSv8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D2E438003B8;
	Sun,  1 Nov 2026 22:16:00 +0000 (UTC)
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
Subject: Re: [PATCH v3 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet
 support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357135904.2624073.18131553531055071528.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:59 +0000
References: <20261005093749.645014-1-chenyou910331@gmail.com>
In-Reply-To: <20261005093749.645014-1-chenyou910331@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, chen.wang@linux.dev, inochiama@gmail.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 hfranco@baylibre.com, looong.bin@gmail.com, stavinsky@gmail.com,
 josh.milas@gmail.com, devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Inochi Amaoto <inochiama@gmail.com>:

On Mon,  5 Oct 2026 17:37:47 +0800 you wrote:
> The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
> internal PHY is only usable through the optional USB & Ethernet IO
> board. This series adds an overlay for that board and fixes the name of
> the internal PHY node it exposes.
> 
> Changes in v3:
>  - Rename the PHY node to ethernet-phy@1, as the commit message already
>    said; v2 only changed the unit address (sashiko-bot). dtbs_check now
>    validates the node against ethernet-phy.yaml, with no new warnings.
>  - Drop the blank line in the trailer block of 2/2 (Hiago)
>  - Collect Hiago's Reviewed-by
>  - Keep Inochi's Reviewed-by on 2/2, since the only change is the node
>    name
> 
> [...]

Here is the summary with links:
  - [v3,1/2] riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
    https://git.kernel.org/riscv/c/627e4e43e555
  - [v3,2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
    https://git.kernel.org/riscv/c/673f8e66d5ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


