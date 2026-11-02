Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630272;
	b=rROoW0cUF8Ptn+AIlOPYIVf2Mr1a9SZJvzbvuYbvQeXQoIMAnYJ7HR9R5+g+t/ThkzzS
	 BuBH2DilVGcLFiJzVkQ0tr9gq1cnJonFn9pm0gHqmMifH562zFiPGrtokw+FopQcG1PnL
	 QPb2evku5TvBaD0IxEzG9oPi7zZQDnkE4ShEV2fq//6Uzu+E98LlPWtFNUCSLdicjZcR8
	 SQJJ20e2WRQaftk10aEpS89UQs1x1If/3q685SdHYydFebsZKaVGO4Pj7KgZSDkIz4P2l
	 04IonsLKS3mBFYaOROGH3FdtbIMhA/OIjKLNn2ImU9kiUIDST9pBEX6gduRdJUjFPWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630272;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qZM0t32A/7tLt5ZViY1Lx/RwaN6nR10tuL0SRgKPwxw=;
	b=zFmPxu9LeM+ue9EEixHchfevg3/nxqroO1pcZp3RRHVWOwR2LcF9Dr59Qqf3PMSC6A2p
	 P4ldOmsc1JzHhTIaSSgMsjnTdFD1bEe/7gKnqX+JVO0aMwKGRSnxAoY+ZjCBFdW4ng5n7
	 IxfTRky5KNI5h9mUCWvEH4H47kTExdaNgc1rLybkRvSsZuJ67MoTNvEtew/0bVBJc3BhZ
	 8UgnjFnJHwzuDcnjmVrSKnoPSC9NlSBAxMjdwPxX4RtD6rA1EIVuhNFiFRwRJbFyHElPy
	 EZrEnBhPmpBhXivWAYg9E4xiXnIi0bI0FkPFlVLYtoajVemX+t7P9o8MbfvUpsG9ZKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BxpA50Dw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D996078273;
	Mon,  2 Nov 2026 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BxpA50Dw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E48D1F00A16;
	Mon,  2 Nov 2026 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793630271;
	bh=qZM0t32A/7tLt5ZViY1Lx/RwaN6nR10tuL0SRgKPwxw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BxpA50DwKknbB89mp/X1nZu7mM9unb6Vh5FlO30y4qTOYkAQUIHLg7FmQIobFgOEQ
	 3+0Q6mSbA64yGisSqfpQSpJTi+3tuH6CzsZCuv2vLiicf+Y/lAeISIZq2qcrrYltxA
	 4QpLxLTrXuxCgkQnnmgeyCSYC2hI14vT0pbD6TRGSyxX+YB9oj/mhKu2pBeM/vLSw2
	 8JQ9LvmvIAscht2tamTSjm+/wMV/oDx4bhIytRzfyawx/dbf6GTmVdWPbOwt0KYeTu
	 S6efzWAcjK63kH8HQPpkyf0E6irZKxi8xj694JbqYOP3Utv94W3iYL1efY3NNDlsrD
	 2h9Wi6r9vi7gA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E76F0239163B;
	Mon, 02 Nov 2026 14:37:48 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261031082318.1146398-1-shengchao.guo@oss.qualcomm.com>
References: <20261031082318.1146398-1-shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v3] ASoC: qcom: sc8280xp: Derive TDM channels from DT
 mask
Message-Id: <179362488950.1990291.1102369712993720367.b4-ty@b4>
Date: Mon, 02 Nov 2026 13:08:09 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=q+FupMn2YZMhVIkg0ZpIkbqp7R+diq23A3sR3O/sydg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeLLA5lzFFNsQ3mvF5b0zXgSxNBYWXr+wfTeTcoXn4O
 ++GwJW/O0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRZXqMDMtZ9+4yNrjxpHCR
 y3WujuqDj9NmSLg9Wqjro+VS4ub3IJrhv4dZbV9ckeqWadUzj+Z/tdeZ4LRDlluzR5fj7h21dZc
 ucwAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 31 Oct 2026 16:23:18 +0800, Shawn Guo wrote:
> ASoC: qcom: sc8280xp: Derive TDM channels from DT mask

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
      https://git.kernel.org/broonie/sound/c/45e9d148a0a7

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

