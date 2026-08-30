Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6615C4A3845;
	Mon, 31 Aug 2026 18:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200404; cv=none; b=UIiSxbsc82rxf4HSr6row39P3So5CoXEW5WkkIn5OHaOMA6kuCIi0FsF33n7rkvAtnuIYisBwmUna3RJ/CEJL1pVbtQhVQHOoNK9Oen16cHFNpvML1OOeCWngOJ6wSYQhm+T6faCbT1yfrME0z9g+ASVt+jO8DFCF3FNUKBnObc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200404; c=relaxed/simple;
	bh=VXPTCiMlmJnm/6BB3WbVcgD26Nv6q5INsf0zYjdbAt0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nfYHyTjaX5P4Qt+XsjKtaXAKCqzZVNsZcN7SrsLLLjmf7xc+lpUu3eK9MmJu1CA3/hmRSHXe3N06+WjIxvUVrQWOOoiGO+jLrybWEa8xl12Uqk1sDO815FlMx1bNLXTuus1jbUlvDHxEmPySMlei0nyS9DC6Ul86dTU6P5g+5Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Il3qQrO8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Il3qQrO8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3ADB1F000E9;
	Mon, 31 Aug 2026 18:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788200402;
	bh=EC07MfKZUedl94S9o/jflIzKdeSt1sKLMjZEn+mcSyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Il3qQrO8Rz6zhygm2ldrRgkR2aCsY/l+RIv1QK6MvIQO+IvOhN8WTb5eT9Ew2dxsW
	 LDh+UIGHIsT4zNftOmbvBzaUSBkNnLJN39GJGU3nAeaTn46UDUxJ/XTI5RBU4aUOWb
	 iKYuNTeT5sYzE+HcrKbTzD191AMKmV5F5WBCQdaQgoWj7fjHlCZ9Gp75QMUvm/xhgk
	 TbNEBz6k+7PQlVJYH8a8CynFDPmNGWmknlx/CMeyRboInpCtAEWGzBI8uVcyr61Aox
	 ybIM5C6kn4D3pPJuLTvLbnXarK767H/fDoYAca13PCzT0JaVhALE9cePtrm/YRd37C
	 5d3Swtu+URzmQ==
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, 
 m-chawdhry@ti.com
In-Reply-To: <20260815082913.2144978-1-egbostina@gmail.com>
References: <20260815082913.2144978-1-egbostina@gmail.com>
Subject: Re: [PATCH] dt-bindings: regulator: Convert TPS65023 to DT schema
Message-Id: <178812683443.13461.1465776575540582848.b4-ty@b4>
Date: Sun, 30 Aug 2026 22:53:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VXPTCiMlmJnm/6BB3WbVcgD26Nv6q5INsf0zYjdbAt0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlcXOXtsGuDWekVltZmK2x813GifFhQDQYfryB
 axZ9YpMr+WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapXFzgAKCRAk1otyXVSH
 0MneB/9xnoRy//q0mz3BPVNCF6UcHPKCco1ghfNqQGXZPBRA7WzRggQoysGV4YoYwNUXI3A9Z5M
 2Q6qlfT9tut/tqgwjT1Cs8CNCGvhpAAdGSZbIL0nBErHEl3CgmvFNTOiALax1QV/xI+ptBKBnpZ
 +zDbAsOj1HTsoF80Fh2oeboDygMGPzs1s3wGlC8QOcGT4EhYik0TQXn3S+oo17QqqCfeXvMxU0x
 0lV2eYFPgPjmj7Xc45LbZAooYZt4bxDnRPHsxXLFFDdYnyl5DN45K0tFQeJNlndkc589j5U7qMf
 Ka+YfVCrICKVDdNRi8y8i39p6OuebvhnlYqMtStRB+gBwN4o
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 15 Aug 2026 08:29:13 +0000, Eduard Bostina wrote:
> dt-bindings: regulator: Convert TPS65023 to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] dt-bindings: regulator: Convert TPS65023 to DT schema
      https://git.kernel.org/broonie/regulator/c/7a89ec1b4fcc

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

