Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310690;
	b=dqICRzJtfLqoT93jGhu2cCnQzytk+B89uWzTVaXxj9lGnjBvqMo4BsxX7ccC4eBun/d5
	 NDUHSULkMS65vhGg7wVj5FKRlS2jvF8KQdmAbPus7yw2AFBjO2hxYB7kNj9SJ61psQIBy
	 VYffQQOXB5f7E71nnlKa1M4rlKkTWkRxSN/3wSkQgxMKtO9WKDqq2QMDwKDjsjkzvwgG5
	 sxHzyKB9M8v6uW6zpI5JHRChA/U9UbpZ+y/BEb/V6FmXjJJ7DUxgtTbioV2uM4v5r9LEH
	 u6dBFxjPJPb8z3PMG9OQoXnn8B4H9me7DFbX03wXNberwy7PbvREudfbKmGBdFxdQTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310690;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=CudUFuj5dClosZBdK9MwstSvNU6VLseFnLJU28vtse0=;
	b=N/BA+X8FBBu0suE1fWeWh36FLNtA5dLpRPngBDTJeP4dhjXQrBFqqXDT5TjIJXnMiKZP
	 6vunq0AkyTidPvcp8ftafb1XGxOxwOqbRnLVcca59wi/CqH+b/4Y+FeV+VE9tS7DTuySw
	 MPED6V7PevnoeehydZTBt6cA7GHFBjt5CjhdnABFFhcxhdt2gErozbiMnP8MyD3BOMG1h
	 +fdSE9JeSFWGFJaaELPO82r8wVIot9ZC2RgtET7hoj9WmCRBU3oac/1lvicS8VCf/CUyg
	 dDwmKGcWrUm0gS2tniXp7K4Jk6V9srPN4VnhlVpJq7qYOvvP1eaAjvxJ0OQwxqpITBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IoDS/s4Z";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D72260A2606;
	Tue, 10 Nov 2026 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IoDS/s4Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5FA1F008AB;
	Tue, 10 Nov 2026 11:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794310690;
	bh=CudUFuj5dClosZBdK9MwstSvNU6VLseFnLJU28vtse0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IoDS/s4ZUFxv74o04r/l3DwIZcfSjhlpYf6eYeiphVyjZ3q0IydI8lg7hmiUDnPr7
	 ZFVTbhjl7b/GF5QnlaVcAk6CbqmgWSOOb03cFeIi2cPTUR42nB3E9R2EDoXNffCBOt
	 QcHLLu6nvRIEkPhI6Ybs0Vk06mnGF+pHEkt87wC/Hfehk1Xz0BIT4ccNrNZ9IGSR/W
	 Dz9m5clYaQABojlPFFRa4mCzYQB8cvMJYvFehs28qZQcxk1ne1jlyPDwBTz3j0CHyp
	 WWQYIig2/enkxk/M6qFUGBimWVcVnjVsTD7zqBuGHu3iDTXVCNMGT950lLs2R5lhMC
	 MPhtJpcs4E7Cw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E689C310B6AC;
	Tue, 10 Nov 2026 11:38:07 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261109022621.56376-1-zhangheng@kylinos.cn>
References: <20261109022621.56376-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: acp: Add Lenovo Legion 5 15AGP11 to ACP70
 override table
Message-Id: <179427225317.3711751.17308143655014772269.b4-ty@b4>
Date: Tue, 10 Nov 2026 00:57:33 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CccUSSTIUwDWy5xBOIHUmZ4ol4nT2UQH+pDuptRb884=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+M8mf73ouF+trOeu5usjqcwt7ODe1eF2x4vK3fmR27
 vxV0Uy+jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEwkwJ2R4dKV0FVu9xk1J/ga
 vDyQF+3Gwvb+753lzdrdd0LT1jC9OczIMM1CKoezWUZ5iaLP7sxte9ZcknJk6Euy/z5Z4t+/tXM
 7GQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 09 Nov 2026 10:26:21 +0800, Zhang Heng wrote:
> ASoC: amd: acp: Add Lenovo Legion 5 15AGP11 to ACP70 override table

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: acp: Add Lenovo Legion 5 15AGP11 to ACP70 override table
      https://git.kernel.org/broonie/sound/c/8f356232d0d5

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

