Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571386;
	b=uegkSSrdj1fc2e4Akf+qtIrENfoSDbhXW18BmOIiw5bEwR7qJ9427uekikHJLClY7iG6
	 Q1RoOeGi88kTd1RnyE7z0UDcVFaO5MlKWxVJ2iWj9a1bRF277UgbSqu8WGErGeB40rTtR
	 l8tw5/yXK3ODypXvIqhkgbI7nWFOAJZFBc/hDi1D9sRWSpUFzbnoBLDjgx5XNuTqP4THl
	 zdEfzAQAslDHGaTzmwMSUSKHVlWurO5FDECw5J+T4tUdEN6NFPVbLleWDGha2aRJCkALs
	 VaRG+L5EBWNL9SGhB1JvTOCAAX4PLoF/R7Or5V5Q4+UY2Dfigw8FbP1gCUA8X9jH8xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571386;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=gxnzr9CHNsaian4NJ4Y2SZ//tSxSvWjL6cChQq4Rrpg=;
	b=l80YHkV52F2gt51EzwZeFxJy5HNVFgxwiE1KI8kv94t7HVGImOln6/BG4QR4SCZUpjJM
	 qntsbBmhcSRO19Ff3+KNFn7P9Vcv9+3zPTGjGlU6kI/Mq2f764+9BF+tIq6UbjjkB/NWa
	 1P6J7Btx/4ZLam318BItks6bMudu1hD3UB45+buSKsDJeOZtk9YR19uMqhVu9rCgBT/wq
	 7MruZjbWoXb7/raT04zk/DXViSs2qS2AsW+pEFm9uLTg4RETiAWcjDFuyGBRRhfn5FtTy
	 cPWR6u4RHQD+yD39LwHnevxabXn+EHK/fSKxRbdlnxx70FbOEuhDcapgj2tGX3QS0fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hq7DLy2T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4464F606D103;
	Sun,  1 Nov 2026 22:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hq7DLy2T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51A31F00A26;
	Sun,  1 Nov 2026 22:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571385;
	bh=gxnzr9CHNsaian4NJ4Y2SZ//tSxSvWjL6cChQq4Rrpg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Hq7DLy2TQoJ0Ctl5IHF974aTyizAE09VgM/lIznCEBIAPBAzCRF6N0R6vMGfDQh88
	 ZzPnuzDoBeE59eORO+BV0CP3mKm6caXiWgsMajU+RMHLYEpNy7F7IvqZtfGtSzb29K
	 OvLauvqUW3TWoZ+1XhQsjBL7O2SJwFzOsE3jOwNF2NV2w3SXAkwTTeblh91ABtpkcm
	 rRZbhpvWSbslYoDRFymzfG2rD+hEI3xAYDyP9byGoARdlKLPfvjqA5rrocNCwSJghT
	 3KtfqLzX2TYvpSyLxOW10IX8GiNIaZkm7iWKzry57L096cm4ZRvK26YWCxg4MWsMK5
	 sEA5Ul+BEotnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA2C638003B8;
	Sun,  1 Nov 2026 22:16:25 +0000 (UTC)
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
Subject: Re: [PATCH] irqchip: Use named initializers for acpi_device_id
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357138429.2624073.5733369311209292789.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:24 +0000
References: <20261014-acpi-irqchip-v1-1-821917378de3@thegoodpenguin.co.uk>
In-Reply-To: <20261014-acpi-irqchip-v1-1-821917378de3@thegoodpenguin.co.uk>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: linux-riscv@lists.infradead.org, maz@kernel.org, lpieralisi@kernel.org,
 tglx@kernel.org, radu@rendec.net, anup@brainfault.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 rahul@summations.net, samuel.holland@sifive.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Wed, 14 Oct 2026 12:00:43 +0100 you wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> [...]

Here is the summary with links:
  - irqchip: Use named initializers for acpi_device_id
    https://git.kernel.org/riscv/c/5919f587ea37

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


