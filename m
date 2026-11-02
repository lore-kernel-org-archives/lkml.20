Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623346;
	b=S16V8ZHdXlKmN9+32c4PS3dGx4QMqDHfLS6EbEZY4mJgsuWkSf2MGU7fBlAqvuouvk7d
	 kDx7REFbpps0UjRht2/5GrvND59pXdN557PCUBSwbDr6SKSRm3BOLizCgN5ybKhiTbU78
	 6oTkNl1zWZScJVIqHOREsb4PFvFLx7OmkvHOYADvXxsLJqZcSuhFPjGKE67sNOisraVIF
	 xI7IOy7OXe+Zss5Ms7dsX3vw/JNUWunc+WaHSWbqxXGpfumE/bQ29jBWmYD9dd5Y02q9L
	 aJbhKo7cWUW41p0XcpJO71Y7wqY3DRNHiCR0R2Mhgj9B6F+tJLSkN/M6dL/FK6t0uvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623346;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=wNFBAMtBFiUoqzwvIebrkT7W9QmBJ7fSnYGesY4q/Rk=;
	b=qhyMwdWX1Anrla27lxlpIqtpmQ2e2Swd4LiULquMAB54rSveEYu/qc38uZgdO6Mjv4AC
	 ybKcI1/EZbeSU7QlPCi53J+k63ISA86FIHcCQJOEupyfIVX2weqsmUHeLMa7RMaeImZc9
	 aCrNpYko/Hiqgvma96HPltCca5raX70EQ6Rm0ml//Qo5d0lqozF9DsVEt+p0t6mhmyKvm
	 8WlHklOeG9bf3u+Bjomq+wGurTGplb4FLyThuMOeU38wYIUubkP1M5a9IHTftJ7zA2H6F
	 e68TjjDuWFWt7WzKSrVO1AuppPHrflpXoMrtaPkHcc2MCv+j4eijPU+7RbU26H+RLyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=koAn34HZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A07606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=koAn34HZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F601F00A16;
	Mon,  2 Nov 2026 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623346;
	bh=wNFBAMtBFiUoqzwvIebrkT7W9QmBJ7fSnYGesY4q/Rk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=koAn34HZNUcAm5Jqye2oFdomqGi7+UpC1m/Vkt2iCYV27klLhOZJ9xrJ3w99+JPXX
	 LCBlsrT4DB6V7Ykjmvcyh+aBkTtfMDaDWrbxZCG6jiyXNjfy4CDNt6KJy8KsZjnQcW
	 CUGR94q5Rax8XQNljovuNmoOZ/lXvcl413TfZOr7AoRC0ga77XdQ4G+KjF2VJhyHb9
	 hD01kIVCAKwNirgeMaX5L/afMSfs3n1Wm0Z3KW06HMvHWr09KU7OPgdHWnf+e1dunQ
	 ookwqJGN/2z/28wB7xVxqq1e4WCLkWIXXrbYp+gVXA7Q1NzF4nSCLcfydikXmhZite
	 CQP3CPG2f4I4w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 48DFD2310468;
	Mon, 02 Nov 2026 12:42:24 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, kr494167@gmail.com
Cc: neil.armstrong@linaro.org, kancy2333@outlook.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260724024625.11057-1-kr494167@gmail.com>
References: <20260724024625.11057-1-kr494167@gmail.com>
Subject: Re: [PATCH] regulator: sgm3804: handle gpiod_get_value_cansleep()
 error returns
Message-Id: <179357826454.1716893.8508212144256627147.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:11:04 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ou7oUlcrAM1OKfSMpQLNLHts03lvtFl/hVBIRmwAKCM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetBr01/p467Ceu3oleENcgbLZcoE/s36r+uV9XfiL9
 /ucUyLPOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRD7KMDOt+Z0dMqpaSnKi/
 /uf3E4avu4ud//6tbA0JzHH0mLj0qw/Df+dPlsrsK6bPOH7F6p6Mv4eR4IZL7yImpMzof7JOsDt
 ZhwEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 24 Jul 2026 08:16:25 +0530, kr494167@gmail.com wrote:
> regulator: sgm3804: handle gpiod_get_value_cansleep() error returns

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5

Thanks!

[1/1] regulator: sgm3804: handle gpiod_get_value_cansleep() error returns
      https://git.kernel.org/broonie/regulator/c/cdfbeace852d

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

