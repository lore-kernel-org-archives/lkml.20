Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773183;
	b=CyYXe21B0IKXgTxVwJ82/MrA+Q5v5XRPCL/LXmFPBV+195wG8EiJsFvxFsumc6BBpII8
	 1wIKn4YkVkQijMlWzd57z0Ka5gkdu2StCo4QDTs+qygjY8FP5jYI17uHEwNwT47e86zmY
	 p7emiyJSxm5ugQbL8Uu8Sm45bRMWi0lBdIMgHAKxdWkveGWNdZgH4PhwjjzVhinueSRI1
	 yiS3tb5YoNklrUWZrWu2mjtBb6PBZZgHfRi2yEmjLFw9nQR6KWiBt+WHwx8AgqkJJLwEa
	 CMOD/BuD7MORcIdbet+DszziKbAjy2BsyYoabdRUFkzGkQfD2GAv5pECypcm375yUHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773183;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=IbS+wT9PeEBz33D3iVRt6Z6PZOduv+IFzo7AFmfhuHmp3B2XvImqXWgAKyoFDyPXfFIe
	 zdHjb8vQGq4WPlVZmrNoMVCklZ5J4fvCZYgIR6CCt/p7EL/f15pkhA86XnCMUbnG7YmS2
	 3C/6jldlYvhoazZYRQJPVOabcP2U4ybK+xk7NXsu2xLpR2h3kKFrSD9X32Ry9pdlnprkJ
	 jEda/U1j+JllaaGjOaSuPYp9vCOM9dLVouZktxebTpowzS7z5MS5615WBpRcl35ivi1Dl
	 km9u34r1Hged31diT38zhTaSeIsfr0UElmdT4pYAjh8LfwA0wHCFd4G+wS9W+no4G7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifnNbBk4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97979606A329;
	Sun, 15 Nov 2026 20:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifnNbBk4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA891F000C4;
	Sun, 15 Nov 2026 20:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773183;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ifnNbBk4/qU9zFwPrdQN8oY09ZXTk8trFtdN7KXYXsmRcMQelNKb7i4EVpFBwD870
	 vvIrro0rIkWaux6uRTyJKD7o8/D7uLUDgQO2Bjk5Qqh+ppR4e6nQutlRKaa+kDaeGl
	 DoU7Yk2uKdzF2KKRpik3Z07X/CSdbe/dgtjne8bc5GSNwTN31hyMHyC5jM9JgMjD61
	 YdiVvJvKgtuR4BqaVR5GSyWEKRQVhsG1mDApVdeZjUleC8KJOCTu8jEUPP1HujX5Wz
	 zA4qnM+FVSjJSe9QczeLSE551/BdymVmzoyRw8LQ/1H9yUi5ecEmQ6S65cmkE3lA+e
	 G4wV9jUVfajuw==
From: netdev-bot+sinfo@kernel.org
To: Janis Edvarts Lacis <janislacis06@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, wellslutw@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
Date: Sun, 15 Nov 2026 20:06:22 +0000
Message-ID: <179477318215.3291.9285043041919405179@kernel.org>
In-Reply-To: <20261114222744.535158-1-janislacis06@gmail.com>
References: <20261114222744.535158-1-janislacis06@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
