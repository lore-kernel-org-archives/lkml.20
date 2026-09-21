Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672B752845A;
	Tue, 22 Sep 2026 08:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066601; cv=none; b=Dv2wEIpeEXDul6YikCh1Enuwzsb87Jdm/yoQdVfuchT+M+KFT6Lvxauz9IneKI5wGWsWskmKLl1wA9rwPi49IR/U5pXeOTtIa2YgX2rJSvfAZtfpxFLMkmUiSKw76luKx00bQXDvHbzLbu65HG9COxxwCofZIaMLTNKi+pXwv7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066601; c=relaxed/simple;
	bh=MuzXIlylj5p22a4qLBLaXRuUYK9HbtmF4T6L8ARg94k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a6pcla2egRZ6SinwAQPujfLegvD4JiIe6m5nSiNcGEFu+oxr5Lj5ErsgeiMJxF/qu6ACsCbW3pvjkEmt8fpH/m/4KnARloC0ttOMhaDd1+yT0dqs+IXhlJCyYLcY3ebqHhuCbVArolqBvMVHkm70Ct/9Z/xRMiyX97rV9r7/Su8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyEy9s13; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyEy9s13"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5221B1F00893;
	Tue, 22 Sep 2026 08:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790066600;
	bh=KellXn/uiva1NZ9uqQ0OQ6h36NhCY0Q5UUjucFFOyVY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LyEy9s13r/nATFL1bZ3ras7t5MaA6DNvV9aoIipxRwDC5FIZWukAYlVeSQPmE9z0f
	 1ML3SXj0EUq3+XiiKr8NVgPQhvsOzq3ty+MQTz2HF9VAtzt1aQlS/2nTa8VjU4HPbe
	 /42RG5rtl8oqFREvh5KxJ4+JHsj2ksBC7HI2VayRLR/Xyw+zXISHvfwAnZunBPDv86
	 pRXVIC4/ZwHH65T4SSuBgGdlxB9f4Igam64xaxn9Sa+iAKPFBrBZvbsK6PiKe/HRzp
	 VdgPwNUZgjxtoRr7EyMNEysvUCftZr1AlGB4GAfX1ab5gTehzfg0gSWH8ifQomWDah
	 /xX0GqSn2wqXg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260921-topic-sm8x50-nex10000ub-v2-0-eeeaf9b0c913@linaro.org>
References: <20260921-topic-sm8x50-nex10000ub-v2-0-eeeaf9b0c913@linaro.org>
Subject: Re: [PATCH v2 0/3] regulator: add support for the Nexperia
 NEX10000UB dual output LCD bias power supply
Message-Id: <178999730838.271927.6877835194554891034.b4-ty@b4>
Date: Mon, 21 Sep 2026 15:28:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Mon, 21 Sep 2026 11:51:29 +0200, Neil Armstrong wrote:
> regulator: add support for the Nexperia NEX10000UB dual output LCD bias power supply
> 
> Document and add regulator support for the Nexperia NEX10000UB dual
> output LCD bias power supply which provides programmable positive
> and negative output voltages mainly for display panels applications.
> 
> The driver supports setting the output voltage from 4V to 6V in
> 100mV steps for each output via the I2C programming interface and
> supports the enable GPIOs for both outputs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/3] dt-bindings: vendor-prefixes: add vendor prefix for Nexperia B.V.
      https://git.kernel.org/broonie/regulator/c/819a3e62d37a
[2/3] regulator: dt-bindings: document the Nexperia NEX10000UB dual output LCD bias power supply
      https://git.kernel.org/broonie/regulator/c/fe7052c3993a
[3/3] regulator: add regulator driver for the Nexperia NEX10000UB
      https://git.kernel.org/broonie/regulator/c/53bb6f50be85

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

