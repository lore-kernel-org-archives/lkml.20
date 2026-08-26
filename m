Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A20231619C;
	Wed, 26 Aug 2026 21:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780705; cv=none; b=QgTz9n0H0twPHPJUUeiiV+Yw/CeUNlktTjfjVDPprFN9whd25MH04IhQCfWUrlL6mKZpi565ZumPVp+WODp3FQVYv0Y7dy6/YqvNXANXnBmvyWS6qP1xCACyAKE29CzhUTRxFtkm6oUPXPq7SUxpuFZqQlva6bD3gYtCBovMfdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780705; c=relaxed/simple;
	bh=OzgBvhDz0sPmjbMmy58pYHT5dyWZeKD27g9GUdsrY20=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ukFbYcZ3DpOEiOsNk/KlCZNWyLoclPDDAdICX8KwDSKxE3nO/bcPO+iQhZn6tFOvVjVmmU9xBPEjyNzRE02GnP9gn3m8gnlmGlQ/N/XGuzY167Fm2TngaQrWEPnezNW6Jkw+QLdCcN8hb+N7lWLWD1pCeyX5gz7R3r26FuSA9xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4RpCUV1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4RpCUV1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AAF71F000E9;
	Wed, 26 Aug 2026 21:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787780704;
	bh=2IeDyvgxihq/bAKZRy6GVVy86r3ij2i7we7pLMRw0XY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P4RpCUV1NydSHFBF4gJzxe8Wi9yyBD8r0JsFwUBDjuMw/phfTiE6aYUovb1xo+zra
	 5h8rJsnft27sgpjGku8Yi1MEVsmNHEgLUUjShjTrO4b+NnWYExrj8+KInTXMgoZcid
	 sjZWnjxLUXQ9g8+T3EFl4ADVADp0+ruzD0lfdK2SJiQ7UmoXXVufquMW5ac7OoKelH
	 b0sDFFdu01K6cQcC5ksBCiP6FL3tAti+RCLMttfN0WhH25zn+RW89I+wzmUzdK9PXk
	 1J9CSJPG8F8e9irjL1ez1ZnYICcOLkaoMf2rrvvSpCgsTBInU3wZaykJaMeFOZDCt2
	 rYJhx9ZR021Yg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, lars@metafoo.de, 
 HyeongJun An <sammiee5311@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260825125745.932832-1-sammiee5311@gmail.com>
References: <20260825125745.932832-1-sammiee5311@gmail.com>
Subject: Re: [PATCH] ASoC: dapm: Fix off-by-one check on the second enum
 channel
Message-Id: <178775623949.88371.15561120678567071292.b4-ty@b4>
Date: Wed, 26 Aug 2026 15:57:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OzgBvhDz0sPmjbMmy58pYHT5dyWZeKD27g9GUdsrY20=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqj15ch7w66JUZLUY1EU3XlWEfRtVgHHfwnAijW
 ZmvkP2TvqaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCao9eXAAKCRAk1otyXVSH
 0N1bB/98DDehXBCtcj+Y24SYiqdk4sRCq0bi3X4hon5YwWXHtW5WEu/VibhB7OYxWFQLk7MTZke
 NhElkKoxriLFg7j9uL2V9OEnlJhi9vhb2JHPqTzM6h07Q6RA86PjUqArlm2CmAj5UDw9d+Ndhm6
 6YPUbQSlr03JfDKUFQM+mML2r3y/SB7I/jkSwz2mHWi5urrsAQo6GB/sdQgznZIwPRcR0Lti9P6
 LFLHFYi+zCrcCjCj/ct/6QGnQQdVhF8YzBh/pmoF7MRJxEDAcEqbfTlONc1q5Rk8SuZAAmAP17m
 DEzUiF61bxpI/27DlHh1kFiZB9qBFs/Djb77WcpjeT1Ahf5O
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 25 Aug 2026 21:57:45 +0900, HyeongJun An wrote:
> ASoC: dapm: Fix off-by-one check on the second enum channel

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: dapm: Fix off-by-one check on the second enum channel
      https://git.kernel.org/broonie/sound/c/14511c9b54ce

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

