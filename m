Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571391;
	b=aoGObSYKqaNCTiNRZvY1ppdZGuFA1ycyo+YwvV0osvoFUm6ItBcPXLreroouln7qAfL+
	 kcHXKhz5WfOid4VpoFUFMGFTbYtqq0x+XuQKahQymib7EHwDqKDJKBecMQBGVZOYx06zQ
	 nm+z6PAKnsS5Q3924BK0DfFmXXL+yGygtpyPJtyVd04rBG9RcWU9w3s1yqcklrG1R1yAx
	 9Zwc8jtnG9gBJEkhEYrbqZgfc0JrwRYAdW1/zaitru8VOs8ID7dUwNMaSYCN5hBNOsDZI
	 WCaXjrZttL4DBnShVcjHmCyllvVo7gKX5NMo5ypRU8qe63r6puskRvg0ipY1WN1da/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571391;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=ah3ajt4QC1IW7eRN0niJ/5zSqKv/5nKHPQ3R7wAM5UA=;
	b=Pp83RobpNnHKfRYRJvfrF6MtyI+1m6+ZxlNtA5ivgI0LiKt3Yjztj1S+Ljh8gt61rzr4
	 MWcrnuIF6gFhShg70BdYC+QyO4een78hHFzkwLUmPy1QtwwrLpweSggppW31oECC1RKFf
	 lJj/S4s9+5U6NaT32KWyhryt0WfUUd332azVVIKm4oWH/EQctjCIZUjrqbDJ3h7nr6pwe
	 y2Y9HHlZdkZ6xdCORHjtpj+Fl2AqPkxSsmVhxJtjJAOWidDscn5+vPKht8DD9A0L7bbiU
	 yp/VWmk0ADvUoLOs/4DK20n7TuvqqoHbGeVNIXoO6V1bMTyYlpd78SXIOrCL4CI1+Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KSzB7rsy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33376606DB5B
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KSzB7rsy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0EE1F000C1;
	Sun,  1 Nov 2026 22:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571391;
	bh=ah3ajt4QC1IW7eRN0niJ/5zSqKv/5nKHPQ3R7wAM5UA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KSzB7rsysmHj0NokeU4XZg63gm2lZZdwMuvJUYGPqc86oRcCXcdwCcdn/X44tOsd9
	 nwm5Oc5ZpOdo/oqSt+P5wM/TeNcChfgfTEEmFprm1o+LPKvCL8SdOtWAyaggCELfQh
	 2PRfWu5ZmJosolN7pss10luoDpaHAYqwNOcxfP0bGYxrAyE495LbgHmtMAA/yM6exP
	 GezoOqDSJKx+24L9G/GVFvGAOopbblKkz+hSBtiqSsSiqvA53B+2Ma1R4JNTcnhcl9
	 n+3XgL1z82DyaRo4usFexg9sXSFt5jSkISdkxZk3dWICHJkO3acHI1xpTP+LnHcgaI
	 4OWDC53y1uVRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0306E38003B8;
	Sun,  1 Nov 2026 22:16:31 +0000 (UTC)
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
Subject: Re: [PATCH 02/14] irqchip: fix typos in comments
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357138979.2624073.9912661156420781171.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:29 +0000
References: <20260907065328.32009-1-hemanth.selam@gmail.com>
In-Reply-To: <20260907065328.32009-1-hemanth.selam@gmail.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-riscv@lists.infradead.org, tglx@kernel.org, radu@rendec.net,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 pjw@kernel.org, samuel.holland@sifive.com, linusw@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Mon,  7 Sep 2026 12:23:28 +0530 you wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> 
> [...]

Here is the summary with links:
  - [02/14] irqchip: fix typos in comments
    https://git.kernel.org/riscv/c/726285316f8f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


