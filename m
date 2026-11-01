Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571418;
	b=mk+JkNac8mFSHzSaWYd+LtYPV1CJcXklq/aK3XGymJw37vbiwcju8gW2CHy/GEMWVc3o
	 Vx9+CqExau4WJpqDBlBp8neoPs58d/DXN3revNnhX0cJOhjth6iIIpli8eoqj0EKWneZI
	 ue88tYDm8TSbDRjV31IoqMWacXjXFA7OAv227KONISszctG2Z9oSyzuQn/BRYy4rRqCTl
	 bTUt8mMU2XDz15Ys0RTTPQdVJlrNxs0Xs9FCi7SdiO4eAVZuxorRKkDG7fqr4s7RBGUHk
	 1VUfItIAFrZm6v5CISdCOL2pKu6gX1JMw5V8GmFlK38O6jrHZn/Nqrg4MM7U6jDqdEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571418;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=K186/SGzGYR4oS1A94dDqqxVbN9s1DtPD9OQEKcxCLA=;
	b=bNudFhauvtc6devlA7aFhmRg9Axs1V1N3LuKNS3TMNdFTP6obbdjw3xyvi6TlTTsBZvQ
	 nMLBDIyL27Y+tOPkTyXwI6Ly9TEctJtCWaBk9rsqXx+Z59MJRGEdS8LQMEXcUupZG3cbl
	 /ElyTkf2MJfVk1qLn9avM11X5HSL6FdjALZLC2bp2/ZZyY4lIW63EoD8GyMq21DPqdyYr
	 Hv+MKVmao1GkwhacIELU1Iv7bFCCDiYASoIAq5hDoyvI9yhWd5zVSif80v+wykSrpYLfe
	 5rccZQtIMbvMcbQDETkQEmK0vIckNNxwnXGM7MA7IH9pTrYMkHbDXqGWEQFebr50jOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jCn3d1g2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137526073504
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jCn3d1g2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37F11F00A15;
	Sun,  1 Nov 2026 22:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571417;
	bh=K186/SGzGYR4oS1A94dDqqxVbN9s1DtPD9OQEKcxCLA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jCn3d1g2f7/1bmyBtViIODuRmCAq9BrODdhxoYZ5fA8VACNdgm7F7V8lBKmjf++ez
	 YGPKyeDDwmid3J94+0qTNhqSIFehaMhwELfnytjR8yY2SM/8GY+NHgRQElqs4XosEP
	 /6Hv2ozhKB91YzcVczxhREluOmfrzDWM1W1OffsGr/kqA52k6B2ndkBmJT3Wnw3YOh
	 hI7HNfui/yXGlmMwMD92yuxaNLeJD4GQVn6oxVPJLe3R8naLM2KKyI43g8ZKpzdIVU
	 Oki80VuJIXAXRF69NG9x2b1r+OFzhhBAsYMcnLpOB3i+cuJMzXmiswQPov5bIs2l7k
	 gy5JdTi8LAStw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA2A138003B8;
	Sun,  1 Nov 2026 22:16:57 +0000 (UTC)
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
Subject: Re: [PATCH] mailbox: Use named initializers for acpi_device_id
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357141638.2624073.5068532854637538801.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:56 +0000
References: <20261015-acpi-mailbox-v1-1-152ba71454ff@thegoodpenguin.co.uk>
In-Reply-To: <20261015-acpi-mailbox-v1-1-152ba71454ff@thegoodpenguin.co.uk>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: linux-riscv@lists.infradead.org, jassisinghbrar@gmail.com,
 rahul@summations.net, anup@brainfault.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Jassi Brar <jassisinghbrar@gmail.com>:

On Thu, 15 Oct 2026 13:58:28 +0100 you wrote:
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
  - mailbox: Use named initializers for acpi_device_id
    https://git.kernel.org/riscv/c/01a40ad5a968

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


