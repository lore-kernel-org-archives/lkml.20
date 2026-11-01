Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571350;
	b=ICClELZNpl2EaFlm9rPav3M/uWe/RTqYWLiwzwNtq5UUcx0NJtkiB65uiwX3j9ZUCZgO
	 gawWIEyaygX1k7A7nnewM5mmYE4JmNCZ9r8mav5B4d/m6MyhbLWPmhyuh7w5+Wxtr20XH
	 T1/P7piYbN1pP/inePJhKtooJWrCljC+8GCgeC2At3y0YkdmxDI+y2V0SnsszEWNY8R9c
	 s58CQk25XBdZuCLVBmKyCLuXBE7ZtNa+kKYEPE8xDD29/sDaJyg/fENHq/GF2P/Tg9ArA
	 u8Mla7oN9XvCaIhYi720mjd9WphAND1wIn/oz9qX940diCrt58LyqF7l0UDPma9TX4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571350;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=mV/fldeY7E4VCzvixzPx4jAvmpdj3h5EpC9ZS84v9Yw=;
	b=V53NEbD5T3RKrb+bEyK6PvuDd1BNpiikgdCTpLMIya5zuHa1xt5qCdznGVHc1V5r95Jq
	 BAXm+JQhubyxDq3bSaSWz2lHs5Y1Vo8YaavJszWcJgQDeM4cli9X+dY4Z5Vn1J5Ko1hCZ
	 /5NWZo8ewhBzPbbqo3oc3BnUZh1NNNWd4ytziBx69r5vGu9fm5moynVT6DDZ6/8mf4/AK
	 aoRfejRti3dqrKJTrk5YVjRjEJZXwYzBFO65MKJq2katw2ePB6DgqqqC5jp5pokPeXc8J
	 vRpI2XGzFWY4E8hDSpDApA6x7z7kF7192yuNfyquv0gFzKXWgD/vGXU48AMfOdzTJ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QJmbn/sE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B53606A332;
	Sun,  1 Nov 2026 22:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QJmbn/sE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E26C1F00919;
	Sun,  1 Nov 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571350;
	bh=mV/fldeY7E4VCzvixzPx4jAvmpdj3h5EpC9ZS84v9Yw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QJmbn/sEiCcLIX9npgNt7/hSGB88aohj1izoIrdEv9d5KcCfEpZJUEFxoCnkwIxoh
	 E4rlmq5jt7WSHWppvhokPkWkW5BnE+HuI72cq8zM25olcDxf7GRXPcosfuLOFfhpk1
	 m/w3RRWX1qaYD2K4rhnKGxp98c6iQm/iIYi54O0uJ3Mst7MuzliBFf/k227iPw9YxS
	 acRWLFWWuBi1afvt4ACSLuWYcWv+UjOxjREz6eH7WvcdunRj0GvgQW6XFHSpUWeMcH
	 h8ExEIrC4uk11tzoopjThtSBg4n/p78268HLeBD35YV52cPlbCq/uMqn+l9wP/Tg6b
	 dNP20WYEcLyLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0312538003B8;
	Sun,  1 Nov 2026 22:15:50 +0000 (UTC)
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
Subject: Re: [PATCH 0/4] riscv: dts: spacemit: Enable USB and PCIe for K3
 CoM260
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357134854.2624073.4474736187144990416.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:48 +0000
References: <20260928231807.1757995-1-jberring@redhat.com>
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
To: Jennifer Berringer <jberring@redhat.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, jmorris@namei.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Yixun Lan <dlan@kernel.org>:

On Mon, 28 Sep 2026 19:18:03 -0400 you wrote:
> This patchset enables USB 2.0, USB 3.0, PCIe, and rfkill for the K3
> CoM260 Dev Kit board. This board has 4x USB 3.0 Type-A ports and three
> M.2 slots which may be used for two NVMe drives, Wi-Fi, and Bluetooth.
> 
> The USB Type-C DRD port is not enabled here because the necessary
> drivers have not yet been posted.
> 
> [...]

Here is the summary with links:
  - [1/4] riscv: dts: spacemit: k3-com260: keep dldo4 enabled
    https://git.kernel.org/riscv/c/f314c98807c1
  - [2/4] riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
    https://git.kernel.org/riscv/c/bd56cb9b84f7
  - [3/4] riscv: dts: spacemit: k3-com260-ifx: Add PCIe nodes
    (no matching commit)
  - [4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
    https://git.kernel.org/riscv/c/dad085951db1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


