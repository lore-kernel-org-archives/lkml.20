Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793232674;
	b=miuliEX3NDFv0JlM20IYUtLQspRw5tpzbLx3nP2SBB2KA2JntMmqsZBP9OxnghWYk9Ut
	 0ItpNwB37ULbNcgZehOxM9Aqz35/GAyhsWipGPryn51wR+oDiavBPtbBuLKDk6FGLQd3d
	 dERIPEwQLqRItHBac3Rk6F73PhsS3EwXL65KIlf4AvTEcfxBbhE46Fm6M2zJtU6ShPowO
	 bGyjWXjGkN367ciPyckfbsSi6uDJ/azQSYwB+51Nm6HQlCmGcZGcgIV+eWMvidoQQCkz+
	 PD6oZNfRilZAE58CPXYcT8dvfIZN+os5Rj+gOB72kJm13iLSWNvc4xbxEZ5oOh68hNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793232674;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qhSAMF/qpF7+6+/4sHnK7so2W7JtrOJTr6nBO3ha23U=;
	b=1ZoqD4t+q1hYVrXK3w/WRDaQzpHhgJ8oPpo6XBWjFpJwFjK+5G1D6ugOw/25Y/sa94HW
	 np4i7o4BmzyBYOm5g699iFKaLB4ljrNY8wXexvHG3OsRV63boUxB4+Um8R/N41o3cNxi9
	 mzkca2TzYMg2lgGqnfY/qsusB2LoXFHWoORVPh44k+tyJXqNRZcnHJxvXng8/WzRCxkOY
	 6TihMcLNFQ2raxENbKAlgD0TWCegeq9gW5Tovt3sUtSnlZOOMrXWwpLZ6yvfRU1nDdJUI
	 /F46SwSHovY/Sf/LaZRmeHsDEa0ACeTjim9k0Jsx1RreA+EqSV5StRBtMhIajYtyVvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYStTLdw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E749C606A31E;
	Thu, 29 Oct 2026 00:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYStTLdw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426321F01829;
	Thu, 29 Oct 2026 00:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793232673;
	bh=qhSAMF/qpF7+6+/4sHnK7so2W7JtrOJTr6nBO3ha23U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SYStTLdwp5Xg6LSXYYNwXsSu1oXHnUcr/WC0dEQJyM/jBx0bTD7CCLtXNdUhY8xil
	 JNRy2yIffWTpbX8thmiqVu9Nx3xR7J7g0KAoWODneHXlbNySSPgGLPK8tH4SUIOyGq
	 /7rQDhNB0BLmDQTkqHnQaUsG5qJjHoUVxgcHQVOq8qaPP59Nsk+SEAOm9kxa30WFBu
	 xs5S9T0z9hX6ddSEORd8yeh1SzErtGOditnvT0bpubgxkqTnDDg8/A4otAXexW0na/
	 6SatS0ZGLuPCMJLf8RhE3R2kEenZHKQcV9aLXSHBvr08m+4UZciZlxv4dLcu5SZy2U
	 1VpD6M8wi9aVg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id B10272062A71;
	Thu, 29 Oct 2026 00:11:08 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Michal Simek <michal.simek@amd.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261023102818.523331-1-phucduc.bui@gmail.com>
References: <20261023102818.523331-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: Fix read-modify-write of
 AUD_CTRL in hw_params
Message-Id: <179319131822.1308637.2787068567958851723.b4-ty@b4>
Date: Wed, 28 Oct 2026 12:41:58 +0000
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lgLc1rmq/XQgGeTsPBn6Mt5NgmB84IXpIhRo1kdmDTs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIe9YtNumnBnHTm2+uJy/O0lFQPn2uzfl7ImG6w+t7Po
 JxuNoZpHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhIxRJGhiXXVH/v9Dt0s7Dp
 0zrGx8IV99b/+/On5v1l60QN9Tdcl64w/DMVe396G+8tk5cNyYGs27rf8vbfmBD+LuioyLL8nEs
 LVzICAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 23 Oct 2026 17:28:18 +0700, phucduc.bui@gmail.com wrote:
> ASoC: xilinx: formatter_pcm: Fix read-modify-write of AUD_CTRL in hw_params

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: xilinx: formatter_pcm: Fix read-modify-write of AUD_CTRL in hw_params
      https://git.kernel.org/broonie/sound/c/3b54e7392737

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

