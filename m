Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CFF42668B;
	Mon, 14 Sep 2026 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377859; cv=none; b=jBc04ikbolPEXtYyLegRKKIiW7PA0Ot1apTaeNLSnREXu61bghCdnpCrdkj94/oxISUmAvUclyavHutosYj66mtTvLMlEYLOkSXtrn5lVKRG5TKYG7DBC2zmVW1UvgmLF5Pb/7N6zz9uUhZe1xY36+PYXs1GexNAoTE9I+6fIB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377859; c=relaxed/simple;
	bh=kLvWlprQnIRWSPtEAKnN7A7nxK4UTEzVWAHY2WJ6JDw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lq9Sv3TMDEJG5I4xWblls7mDg0U8gq2jTAfLM2jhDu+GN6TmbIXsGV+LerRe5B5Ndg7qOwVR6nt9c+5mGXLuqRWoXX7s/6bXYPWOLc8fINmkCxiYvrYnB9QtnQ89xY1SBXAb3gHwDKKpZfoen9L+22EbgWY2x1JS6UZnFqrCJf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nspUx3mt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nspUx3mt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FE71F000FF;
	Mon, 14 Sep 2026 09:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377857;
	bh=yl1VYOcTE/3CX3UWsQgOyYMZmU0KbF2rQp0ezzp9AAI=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=nspUx3mtaiLDv+zFtZB8b+6VTtPAc/QyqiIYnrfbFcv1Yy72F2h45hzyGnx6A3wzJ
	 uqu5OgL0LSjqvuBqlxNpAlwDCD6oqh2XaY+Sm443vlV96SFqQW4c1esRzF1sQKy+qs
	 lvWGgodqR1qvpjJWsL+0I2dVd+K744fn4tgmQkXBcoBAT0HdBASlVHJLSPJOxvdB+e
	 KFuHYpY3T7INGy/IdzniD7zqM8BCvMz8engTnq4VnA4fO2wC8UBejaXD488Hxil8wt
	 uDNNJWGaob/T/UUE79/K42VyWyNQoTswjDhWwq3z5lr8KxL3lvFwQKVQqRFxptsRAx
	 x3/EEX39DQRhg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Iskren Chernev <me@iskren.info>, 
 Jisheng Zhang <jszhang@kernel.org>, Joy Zou <joy.zou@nxp.com>, 
 Christoph Fritz <chf.fritz@googlemail.com>, 
 Brian Norris <briannorris@chromium.org>, Lee Jones <lee@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 ChiYuan Huang <cy_huang@richtek.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260913123212.99817-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123212.99817-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] regulator: dt-bindings: Use consistent indentation in
 the example
Message-Id: <178931248778.924975.2279213599006097904.b4-ty@b4>
Date: Sun, 13 Sep 2026 16:14:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kLvWlprQnIRWSPtEAKnN7A7nxK4UTEzVWAHY2WJ6JDw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqp707ls/2fvJ5mpoHBsmBT5YWdxobuwHxqW0/O
 U5zPVLuc2uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqe9OwAKCRAk1otyXVSH
 0A4xB/kBHH/yRTDSU0Z2YxgyJYIS7w5HDFNe/aslhGSdkTmTzX55JxqcOvA1IOinrEtbyfVXasx
 GZXBgDjxdkOYvmvcPpW/j3QmdTzw7xK7+NWonPyKwMkDb4gcu+hm7hTmYtBVNMj/5ouGlHNNosz
 oLTy5nhE3VeoQu+EhdEURVdK6ui6jv+N0hej5bCXlKKU58yEXvseJKZGqwJ0tV1BSyF5FaOMDyj
 9dnf/REJ3Kd4+xP+feLjJ0Ayd9WRR8cHwA9QADRFDSWqXqwS722kh78bfP/khIXxslSj21DeC7D
 Ft/jJdPbq4XKoG5p4+LGBzl9gq+qXlwkvmOG6c37T2M+2/KE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 13 Sep 2026 14:32:13 +0200, Krzysztof Kozlowski wrote:
> regulator: dt-bindings: Use consistent indentation in the example

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: dt-bindings: Use consistent indentation in the example
      https://git.kernel.org/broonie/regulator/c/b89f8972f754

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

