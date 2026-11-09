Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242941;
	b=TD83NZvZCU43jzzTqe8vHUP6bSlyCirDS7pte6jFQF5zJA6MSfTEIhRPCXabKuR6DZd2
	 UYNI+SioweoTWWpAiVXCOhEHB99aewLWWyOZYrlYKduIt98+tr5pmQBci5Qei6iZnKjOj
	 GMeizGemZCcLU82VICCn4liwZzddbzPVVsnUj2NMAcUfn8PbfnOocq4kGGXX/FPL1zOUE
	 +vqYfV2PWyUfhGRqVMdBa8ohmbMVwa966DgqMmOa7VZFs87axSt2MrGpBIjBxA+Q7o9ir
	 /rDui/yaQMF3zVcVXQfNKdZn3ulzz/evi+45W7LLqKINejZLAWs+c5Bh5N+xxzE2SNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242941;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=bHkwS0ZwjvdCq8xsPW/+Lvqd+E7itvhLt+8UJ7dsnHE=;
	b=HaEExW5ao/SmWAVOwJIQbi9OK1u5rHbxmE4ANIv7Ozlpmp5WlaWE4VRh0YRenF6nV3z4
	 cfH9KapUBl2WqdosKut8RH36IGlVFwfqBnfz4FJ50nCWJzEgM3yuvRj3XOox37QBvpC0K
	 yKyFdkwY/q6US/kKIV4PnMO9MfGg9B8IZDDpnB5Ao9S+e7yJG3JfPMSzbPS8dcbBrRX0D
	 B9Hj4vaDJqXO/8F8RMfUWMdJr6zUce65PS5FvMlYYPegI4/siGZI5Ph6oQqz/AXW+mUgY
	 uSc8lmcfQV7UTrXeBe8n0H2JbJBLREtKjqS8JOeZ6VyH8B8feZynEbxBvV/dcglaa7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UACi9yds;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9A6606A330;
	Mon,  9 Nov 2026 16:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UACi9yds
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A091F0089F;
	Mon,  9 Nov 2026 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794242940;
	bh=bHkwS0ZwjvdCq8xsPW/+Lvqd+E7itvhLt+8UJ7dsnHE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UACi9ydsXC5gWobSwjUwfSkB6dxT4qBOxiUCjpT5655/XtB5T0HzOCIgz5PzCR6eE
	 6aR7LvzsQAPWlWhJaqZZPxirlJHQTgbStC/uFuVvFhrstMQHO1Bcg4RU12ZqjSfUqN
	 RMIIDyve/iXX63mdcCDu2+995YkTF7gll1PKMvzu+MEryaRryCoP4gX1p7DFWnMlMZ
	 Ai0XTDUyQFt3/7jp/XaXA4spq9/wsqBLJRa6sLZHcPaAr0xSNe2n+Urw9DA+NMAEkk
	 aroElv8rp97h1k0Y2Z0rj0NuegRKAnN1Q2l5Wl9yVrijHhz8O02WxCWmbXv8xo3Gzu
	 2Bws+PRkEP5bg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E15AA2EE9BD1;
	Mon, 09 Nov 2026 16:48:54 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Ben Grisdale <bengris32@protonmail.ch>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261106-fan53555-silergy-sym827-support-v1-0-4e871c7f475c@protonmail.ch>
References: <20261106-fan53555-silergy-sym827-support-v1-0-4e871c7f475c@protonmail.ch>
Subject: Re: [PATCH 0/2] regulator: fan53555: Add support for Silergy
 SYM827
Message-Id: <179422858019.3711751.4588192778187913733.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:49:40 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vJ1QNEV2AtV5T/vUbwZ6fJoFuHrgr9mkT9e2JDdDsDs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+/ix7F3exO3zzShlh6Rmp+vO9l+jMu1sX+ObGt/k/Y
 qa92x02vaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATubmR4b+7hYPDxpXZS399
 yw1mX+Z71P95Xfcahjkxywpu3a2X12ph+B/rmPCv+pT2xhsKH6eU2Bz67tel+EIx1OD/+g1a+e2
 /nvMCAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 06 Nov 2026 15:13:04 +0000, Ben Grisdale wrote:
> regulator: fan53555: Add support for Silergy SYM827
> 
> The Silergy SYM827 is a 6A synchronous step-down converter with a
> similar I2C register map to the FAN53555, found in MediaTek MT8163
> devices as the external VPROC regulator. It differs from the already
> supported SYR827 in its die ID and output voltage range.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/2] regulator: dt-bindings: fan53555: Add Silergy SYM827
      https://git.kernel.org/broonie/regulator/c/9d20773cdfb0
[2/2] regulator: fan53555: Add support for Silergy SYM827
      https://git.kernel.org/broonie/regulator/c/042961947662

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

