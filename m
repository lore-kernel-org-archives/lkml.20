Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871971;
	b=UkDiWjebJvK5zh0SRFS2oHgTuaX/A8zpVcxi1iHOPOXvJ9aZ8ohUpyUy1qhLbjkUctz6
	 C1eWBJk8zCmTdFcYwuRP6f+14bKMziOhtZUEwmInKtwmLSUADpgcS5EOwOsUrGD7ZzOqq
	 2H3sFP88yT3out8LelBTwhFbaz7K9hWK9Zza/YWzljH9Fhv1p7AcxTCjmS/DrXuov1bwO
	 ikE+Zlatf7ej+l3xOxzkEZXSr38bLT6zVYyRKWMtGwr347j8AMP5OomiaNUuBEdLUMr7F
	 dUiQFPpvXuzCtL38jOaL4ta7+O4B/NLHNDW54QTx+SAFx8dK07oPaLGemdWFldX7pDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871971;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=POhntuE69ygSILpBSq8k00lPO3CNZt0lPTqIkmQEmgA=;
	b=Uji6z1gWKr++bk8d5QxOogXLP7BwtTf22LRh3ilgVdjrXnGUw0tY0P5bpf6pbXr7dbgm
	 +2csd/DCdQ7wWasreTu5aDDMX4ZeEucCEhkrjJ5rZAjjD0EFRc22my9cTXvuDmNbYnWI/
	 hi3uX4y++TK6qOkwcresd5TrKsShP35Q7cIV4iUJb5UydcnlWuus2MJPvhRRwlW0Hdjcg
	 V200rPC/Vk1Apij850j0JUueef1jzrnTn1DKPJEcmXb9b5jtZknFgCw1l4ykvGEFeglga
	 EWdaUHy1YE9Bgnap6oS5k+yjXcPupmIQc4I3kdiXSfx8Gq5sL41zTvOX5w0jnRnCOzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxDuEbQC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05665606A89E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxDuEbQC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C9C1F000C8;
	Mon, 16 Nov 2026 23:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794871970;
	bh=POhntuE69ygSILpBSq8k00lPO3CNZt0lPTqIkmQEmgA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fxDuEbQCf2IeTKwhY3DFvCgaHzbRklw/IKOSSi0WayM0I4P/xkguciHeonZseF4VY
	 XTPDscw2J6OQKZi1YddGnAb3LeyHCn3ObVrAZLd6UMyJVe8W8adIUgpCJ+kUZC4fqX
	 OkXyXTX17vtDF6raK+jOVD8d7kcl5zYIfk+khI8nzOQnM/KyyCb3jdnokgxNS9zB1S
	 +kU09ODC4chmqDPtWv3B0fNhWvbzNtv0FPmVNR38Ub/FS8IWzsGVTrkSWVyH0+N6bF
	 0qhBFT4UIhttqyh6BjuRsgXtv6IaLQMnotluKXeftlQNM8wZF4HhVFhblm6Jd1I5jv
	 3Vw/ogoVZtvEg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Venkat Reddy Talla <vreddytalla@nvidia.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 Ben Grisdale <bengris32@protonmail.ch>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261111-tps65132-discharge-fix-v1-1-c796428a5d43@protonmail.ch>
References: <20261111-tps65132-discharge-fix-v1-1-c796428a5d43@protonmail.ch>
Subject: Re: [PATCH] regulator: tps65132: Fix incorrect bits for VNEG/VPOS
 discharge
Message-Id: <179486345645.2504946.15197582541667962443.b4-ty@b4>
Date: Mon, 16 Nov 2026 21:10:56 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=k2cSflbZtHYNiyBGjHwfxujdBQUwkj4lFwngcJtzP3Q=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+T1rQf3R7t0Q67x/+7kZew/4LK1OuWmx8ufDoprv7n
 oSrvw7511HKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJsMQw/C8xPbuv9tGFA8I/
 KuutPvqFxt9a5n/lbK2CYmr4JqEbtkwMf7gean62feGz8dy9tEXPNHhC9i6ulxPpXbNmE88rqfy
 FInwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 11 Nov 2026 12:51:54 +0000, Ben Grisdale wrote:
> regulator: tps65132: Fix incorrect bits for VNEG/VPOS discharge

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: tps65132: Fix incorrect bits for VNEG/VPOS discharge
      https://git.kernel.org/broonie/regulator/c/e9bc5937517b

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

