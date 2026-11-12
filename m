Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503221;
	b=qSoN+8/xWJjWxKqtotN7D+VmKPpeY6exf7IhNrGYq2/G4SjT3HVQOgCxq8l5MNWd66w3
	 EoXvNrSpPtwTQgF8JF1AIVotkpseSPmjFCmIJNqcXKBk7I1TO5yTtpKDitM7LrasLeVLH
	 Cug5U8VPCK9VTQdpuj1vtEoPb69v6uw7InKgLhyhk8veLjhSbK5zRsZzAJIBiWianf/0W
	 IThEoTFI+ISCG4yBoo4amyakPInalKddmlpNKt2dqw9H6o4YsLrLt/XqNf7+mznHiLchx
	 bbUe0PwRb7Yv3VFJQWO7i0vZIdNPPm/Jg0Gp+Jf1pmM14V6e4W5dnXh7JHNiGoity+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503221;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EZjO8Rd5aju40Jas17/1asJC3gZRYfJanIkjFozuaJ0=;
	b=jcpNilBC8a2KvdsPl/5XMJnccpXpjDretr7Upou5p9bMrWxc3hp/sMwZVzhTEyKkq20n
	 w2D9+nK06UPuwBjgWDpCd8z2/r3f++hxTkSMFThhJCnP7Qe778uX8lxbMt3ov3I+wZmtN
	 fZnAjsU0+7S2Hi5UJdLMq0RyAs4r6FxXZ9qr0nvw+04pHTiKi7g+aukaES17M31sgH57n
	 exytbpaHOHiH2afTHK+wS6kPiQChsElYM8v7JClTxNvAebmOokFLl4Fi5hRn3xVkAazyO
	 IOT1vG4Z8pNcv3WBLWv6EqVR6HXVHdaLhQzIT7mWinSr9kVryRNlu9o1IXNzK7LvqIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhg3lLyE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3598B606A321;
	Thu, 12 Nov 2026 17:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhg3lLyE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C941F000C4;
	Thu, 12 Nov 2026 17:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794503220;
	bh=EZjO8Rd5aju40Jas17/1asJC3gZRYfJanIkjFozuaJ0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=mhg3lLyEEMZjkDsxfKJ2GO3I0tvroBQGgZAfri4YvF1zJhPGpvPxcXPPFv4g6fo9P
	 n+KVWbg3gXX074L+RrBPkjvg+8rp9gmw1FPQNHk1OX7d86wDJCb4+svqUyZAaCBO55
	 Lffje6DODRbQbDAsiSgRRvS1aJhu/Mj1/7b2AAMHROL8GD3/3Oc2DyqgOGuta0udnM
	 aeZ7QIf1zzLWD12aqJxO813JCG5lNWnR3OkR2KP9n7VNIenkQWvqEMH311g19+A8Ud
	 FVoAA1LbD8EKxqs7nPyPrPGNAhi/r61eiwdQYddOGrQxRehpnS4GsN+AmS/zXXcxD2
	 2xZczUML6vYgw==
Message-ID: <9d0bb966-91ab-49c2-ac45-204b1bf0e666@kernel.org>
Date: Thu, 12 Nov 2026 18:05:43 +0100
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
From: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Subject: Re: [PATCH v2] arm64: defconfig: drop four symbols that no longer
 exist
To: TAKANO Mitsuhiro <takano32@gmail.com>, soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20261111202914.2558187-1-takano32@gmail.com>
 <20261111220718.2586239-1-takano32@gmail.com>
Content-Language: en-US
In-Reply-To: <20261111220718.2586239-1-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 23:07, TAKANO Mitsuhiro wrote:
> None of these symbols exists any more; the lines are left over from the
> removal of the options they name:
> 
>   NFS_V4_1                  folded into NFS_V4 (7537db24806f)
>   SLIM_QCOM_CTRL            driver removed     (7cbba32a2d62)
>   NET_VENDOR_PACKET_ENGINES vendor removed     (aec3202247b4)
>   SCHED_DEBUG               option removed     (b52173065e0a)
> 
> The Ethernet line was added by commit 32379ad4060b ("arm64: defconfig:
> Drop unused Ethernet vendors") a week after the packetengines vendor
> directory had been removed, so it was stale from the start.
> 
> The built configuration does not change.
> 
> Link: https://lore.kernel.org/all/20251223134807.3543642-1-mikko.rapeli@linaro.org/
> Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org/
> Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-9-8eecb7fdd24d@kernel.org/
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>

Reviewed-by: Vincent Mailhol (Arm) <mailhol@kernel.org>

> ---
> v2: the commit message now carries only the change itself.  The test
>     record, the earlier submissions and the AI disclosure moved below
>     this line, as Krzysztof asked.
> 
> Tested as configuration text only: "make ARCH=arm64 defconfig" on
> v7.4-rc2 with and without this change gives a byte-identical .config,
> and "make savedefconfig" emits none of the four lines.  No kernel was
> built or booted from this change.
> 
> Scanning every Kconfig definition in the tree leaves no other stale
> line in this file; similar leftovers remain in other architectures'
> defconfigs and are left for separate patches.
> 
> Mikko Rapeli sent a patch for the SLIM_QCOM_CTRL line in December
> 2025, and Vincent Mailhol's "configs: cleanup obsolete or incorrect
> assignments" series carried the NFS_V4_1 and SLIM_QCOM_CTRL lines in
> March 2026; both are still unmerged.  I am happy to drop the
> corresponding hunk if either author would rather keep their own.

I am not working on this anymore. I have no problem with you taking over
and continuing the work. On the contrary, thanks for your patch!

The same applies to the other changes in that series. If anyone wants to
cherry-pick or rework a patch, go ahead.


Yours sincerely,
Vincent Mailhol

