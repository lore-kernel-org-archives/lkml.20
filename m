Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236222;
	b=vRYyJ7oHNa6MKvFB3XNRYoybTSijSmYz2QrqxY58VBq62n7gnqMx2LTupRKcphLflQSq
	 TroQ5Co9tGdbVXKY24idVwpYA0VNoLQBlL7DAb4XtWpoQXL+4eHZLpNU/krJVfzYTRt/5
	 xrZyLWxVT68bfJG9ddW4aBmEg1/fA2d1nJoZGIPJ3V6fA1n/LJ8i96RnsI4YoD+nqR8Ab
	 icseD4WVaY73fldsUd7RfenS6MpFYMAlLh5eLJvBKUs2OY8HkjtgnfserQL4Kb/FqYHD/
	 vuIbjGPkFltYtzUKLUR0tFNgiFtHJk+FYxf5rRRoC61mJpFyrVdmqIJvebkkVJnlqFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236222;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=y3Edryvb/99jgZMAk0x9cx0kGcMK+bKUAbn6GHciJAc=;
	b=i1zzPU3DPtD45BqZrMF2jo2dXabDkd9CQuxakuhtFWUIRn2rMAWBJBkQJUZPKG+43NAv
	 LlvdVjtljQJHLJWdqSUnWjJEbegdONuSMrsn0u9KqQSvljvakDsAhwk8/NKG/Y4NgXP7x
	 WGqyjNqzV2oIta++IqWBPHserO8BW1ZZyU9YKLZRjDPM3DLc7cr33wArrXaX6mu+ygp3c
	 wUAmpMAmnWJwTK2ZFujGiEu1S8eoZND3+jKfJT6OZO+W7UEUGaMlf5LkImj/ztx88oAmr
	 D2j5V32TzYf600QSApB91zB832Prr0ENmGjAdIwSsX5V98VDjGE1cQ5B8c+cy4wexSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VErdOrfr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA2A606A31C;
	Mon,  9 Nov 2026 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VErdOrfr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56A21F0089F;
	Mon,  9 Nov 2026 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794236221;
	bh=y3Edryvb/99jgZMAk0x9cx0kGcMK+bKUAbn6GHciJAc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=VErdOrfrOjE5zTQR4RL5qa3x8Gx06PwDUYXBiJvogjcO3MHStv1NmesmtYXwrnz/u
	 Tz8A68c4007AZoJweBe2OeTXplbRpvK4O1+G/XAYAGmuP5UNWRruBsVzL4BLfgk2pY
	 EUEtKqhLh+5n2jDybfiLSlWVFJ/YbUklKHxo6X2r1T7wHF5kMbqlbGsXxsoVsB5qyV
	 nhyp1+jsN7AaXbgPcwl5LUPBxp+ZDG+BCbidUghpyYLdSUMoYTlWuD22Ynnl7TT3W2
	 OwOQqIJv3tv1HhUcNYwFHA+HtPdFROnCkvk7+AuR8LHChivfJeIy66Ukir22mg2cpy
	 4G2eFuBFaJ9gg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 67D7C2EC581C;
	Mon, 09 Nov 2026 14:56:59 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/4] ASoC: amd: fix IRQ handler races in AMD SoundWire
 drivers
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: broonie@kernel.org, vkoul@kernel.org, alsa-devel@alsa-project.org, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com, 
 Poojitha.N@amd.com, lee@kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
In-Reply-To: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
References: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
Date: Mon, 09 Nov 2026 14:56:57 +0000
Message-Id: <179423621776.3711751.3620606745077536802.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=740; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iimiuuNag2wtVPDLPPbNdiQcTKjZe37XdcOGcsSwAHI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+3rc+vPCpHHPi/Fkz2h/bF+XlqQZWfyoJTFbh5L7Kw
 qdf+Mq8o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABO51c7w38PcVc5V3n4fg5n1
 Vzdrhvy7q90fh045OC2qYTPLxRkSjgz/3eb83Jx13aa+T0T9ksvzHOcq12l/XSwzRDqFaj2PXp3
 IBAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Patches 3 and 4 guard schedule_work() calls with the interrupt_enabled
> flag so that an in-flight IRQ arriving while the SoundWire manager is
> being torn down does not queue new work after amd_disable_sdw_interrupts()
> has cleared the flag.

> NOTE: Patches 3 and 4 depend on the following patch which introduces the
> interrupt_enabled field in the AMD SoundWire manager:

>   https://lore.kernel.org/linux-sound/20261107154659.3358223-18-Vijendar.Mukunda@amd.com/

> Until that patch is merged, patches 3 and 4 should not be picked up
> independently.

Please try to avoid mixing in things with differing dependencies into a
single series, it makes things much harder to track.

-- 
Mark Brown <broonie@kernel.org>
