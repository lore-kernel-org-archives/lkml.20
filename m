Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794429498;
	b=ixWd60F6CBh8rdslrUhE7At98K/E9I7aROenVPd3W/kmrzIZNVvGPSGk0O8nc74Vv47M
	 42VjBxUxaJk72SfI22p+oAa5lMXaqEx/xq55uE5ZwFfSkvZ6bmdCIfSMHDqXamOP/SrJT
	 oOVzUm9yn0d8MPcnzN60RH7DL/Ro/vzwKD5puyfpJpDyGKtSjXOxRYZNJE9wJRCLkmJwD
	 TDlj+iHR3QtqZfkHvW/noF/FlatjW5vPUdRO/5kQfD4wtatn0AS1GwPx5rW0TwTr4sbxo
	 PswdHjL6w8T6ALBMXD4C0plt7oKZWAUnvgM61kpULleLxanb5bxQcscHM7X/uRzq2uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794429498;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=BXCg5/9AvBgoxGXtHqmAleI7yDwWo/ptOCsztMkRr8Y=;
	b=O5AT+a+XW/la+zNeKzz1Zbew4mpz9xevkhH6eqOjS1c6DkitAEcco1T2AJayyzhPUDuj
	 DEszDQHo7gt/5eQy7rpgFJhSQFrBYH3pKd3Uw06MDfLWePpdTIFm/S/uWvejZ8fVebleY
	 dzsHVQQl1bCOvnfdEUmrzIEliGqIme9dgkljJOAdjZkd6yDQB4vDTVG8p4gMcq9e0D1Zv
	 7E8U6qPda+4+RMFA00ieFd7MXeL2/a9znoUzGgYLRsX8VfdvG7m7FA+0qsyXQuA8rjxDf
	 kRfiO/6Kt+HzxZXGMG6RDJpZD8TSJgvgTM5GthZ+Xm45hGXotr8uZCbQNpoOKlewGKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nLEjMedY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDAD606A33C;
	Wed, 11 Nov 2026 20:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nLEjMedY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5901F00A05;
	Wed, 11 Nov 2026 20:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794429498;
	bh=BXCg5/9AvBgoxGXtHqmAleI7yDwWo/ptOCsztMkRr8Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nLEjMedY+zSvWsfmO0qAhPG8fJy0ryoRI73J/jyFu1jMf6cGQthaaLu8qm1Ysfuq0
	 kBAZgC5K/FDlkqSnbJLOovawQqfjZJ70hTpCPxIIyTUdtUhmM6R9fK7+JQQCMoX4ea
	 NpySGbhx1d1RBQI1KgkiaWf83f76lTrevZ6/CyPx+4xhn2R1AdJRz/vfjycRahQDFd
	 hJq7sNTc1iP2EUdImBIiOPyWziuzAntLyPYoKEKB/O4vF1dqddthXok41tzKyPkgPa
	 U+kXdHKiO2JzFgYcTH/ugFTmotEsQC9PHpK/M/wPe2DzinMzTpsiOCJ6bopri/oYF5
	 X96J/Aua23WXw==
Message-ID: <2097d211-8d96-4038-b21d-6285e5a16c53@kernel.org>
Date: Wed, 11 Nov 2026 21:38:12 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: drop four symbols that no longer exist
To: TAKANO Mitsuhiro <takano32@gmail.com>, soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
 Vincent Mailhol <mailhol@kernel.org>
References: <20261111202914.2558187-1-takano32@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261111202914.2558187-1-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2026 21:29, TAKANO Mitsuhiro wrote:
> None of these symbols exists any more, so the lines look like options that
> can still be chosen:
> 
>   NFS_V4_1                  folded into NFS_V4 (7537db24806f, 2025-12-04)
>   SLIM_QCOM_CTRL            driver removed     (7cbba32a2d62, 2025-09-12)
>   NET_VENDOR_PACKET_ENGINES vendor removed     (aec3202247b4, 2026-04-22)
>   SCHED_DEBUG               option removed     (b52173065e0a, 2025-03-17)
> 
> Three of the lines went stale when their symbol disappeared.  The Ethernet
> line was added by commit 32379ad4060b ("arm64: defconfig: Drop unused
> Ethernet vendors") on 2026-04-29, a week after the packetengines vendor
> directory had been removed, so it was stale from the start.
> 

Nothing below is suitable for git commit, drop.

> Scanning every Kconfig definition in the tree leaves no other stale line
> in this file.  Similar leftovers remain in other architectures'
> defconfigs; those are not touched here.
> 
> Mikko Rapeli sent a patch for the SLIM_QCOM_CTRL line in December 2025,
> and Vincent Mailhol's "configs: cleanup obsolete or incorrect assignments"
> series carried the NFS_V4_1 and SLIM_QCOM_CTRL lines in March 2026; both
> submissions are still unmerged.  This patch covers all four lines and
> would supersede those hunks; I am happy to drop the corresponding hunk if
> either author would rather keep their own.
> 
> Tested as configuration text only: "make ARCH=arm64 defconfig" on v7.4-rc2
> with and without this change gives a byte-identical .config, and "make
> savedefconfig" emits none of the four lines.  No kernel was built or
> booted from this change.
> 
> The change and the changelog text were produced with an AI coding
> assistant (Hermes Agent, model deepseek-v4.1-flash) working from the tree

This goes to changelog, not commit msg, so under ---.

> and the git history.  I reviewed the diff and the reasoning, and I am
> responsible for the submission.

Not suitable for git log.



Best regards,
Krzysztof
