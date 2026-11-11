Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484177;
	b=jLcICrMx4GqC8wQh+MOeyHSMX69xIbF8Cf7tvzL0moZHld9A8Y0dUqAsqFrTWrkJd2W+
	 ionmZ8iGQG6aMuivNHeD5ThR2OCPNl6cdXKb7qpEP62wApwotxI4ti9zQ0dFLRwdReFFr
	 x8Am/DKgpTlIhkbJMa7P56K758aDMII8PC5KwFKJXwo4TXwWBlFGD0PWA3EpCQs4G7GVg
	 V6fRlp4Hl46fNtgRKM5dAP9dx73jcrWtl/b8mk9FcK2qYdX8wNw6vpXiiZSptwRT9Kkcl
	 CiSvZq+ZsNPaLMwXe+frnrRhqq8+HG5+eFP4Yd/r56UxraOwDaQsd0PglP+oUyZZ3Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484177;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PoDoD+x+xqSo1BbhKreQd8qLMQwUX19yoO6B6cJp9lA=;
	b=4a9ifsQ2t7L05xFp5qQCh4yEhF4qHWHTmbTRtdOadZWxO2WWy43k1KwOTjgusofg+odf
	 3AUKeAIiwVit62kXk1GIXh5RqYwYGnKye580HL0LZ7VzvFsMWqHT3xUazK76txFBI1kXO
	 /AtK97v0zUWGl+zQthmEtKr+dHZGnaRjB2pgq55xzNXuGytkGx5bwSzswvFi1UvftLcl1
	 8fIhqYNIAcAR/8iDnam3BJyUxNgDdG7xmmU1ZfR2r945tSAuSlrkfQ2nWH9pWYMI7EtCO
	 5SqboybkJ4lJh8hi3gh86qzOfHyL1tdj/1LpJsisic2hJDACEMxRugib6oMzDTN7V7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i47hdIe6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8790606A882;
	Thu, 12 Nov 2026 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i47hdIe6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6042B1F00A07;
	Thu, 12 Nov 2026 11:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484177;
	bh=PoDoD+x+xqSo1BbhKreQd8qLMQwUX19yoO6B6cJp9lA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=i47hdIe6xCdyrizBtseX8+0xh5Pg+MZJe36+KkxYtSrAtxQ6GcfPEC1jjJ8fX7KMn
	 DayOu9RnWZEfpFds3X5Zaoo6PHhgKWrW6b7FVo/fuOkzVaf8Z1OqWgiEo/YxTxcNYV
	 CdfdT656lNN8pnGG09dfnvZHqQGzacdlId9l4IfD/A5O0YBiVN8Oza/N7wTCf//6mI
	 Qgk6VDLYphnFi9rk+56d8kg+25O2aRIGT08R69SwPGwTiB2IEmkXLYOraF/lAThJs1
	 dVif+pObM/5PzxbBO951bGflvBtpHhiZEO8bpdOwLnE0Hkdzi5/3rgJ4BQmA+jk56a
	 u4e1dbcBqMDrw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Louvel <paul.louvel@bootlin.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
References: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
Subject: Re: [PATCH v5 0/3] Add TI LM51772 buck-boost voltage regulator
Message-Id: <179441961033.393238.13741898464768473200.b4-ty@b4>
Date: Wed, 11 Nov 2026 17:53:30 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xok+mM8OZcMj0Xl4C4/aFSqy353xn7CCqcX7Mo5y+i0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+Lj9bss1KNihua9XOJ/+OnvR6ZMIbv4onIrj4ffNMv
 Zwzu5+qdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiDQIM/zQElhneuBhgcFXg
 pFNdoK3y+bUGP7Q/HFJbf3ld16ygm3cYGRpj5dpNyo7/z3FQalslxDevtInbp7nyTRC/zlKFWf8
 OcgEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 06 Nov 2026 11:12:19 +0100, Paul Louvel wrote:
> Add TI LM51772 buck-boost voltage regulator
> 
> Hi,
> 
> This series provides support for the LM51772, a buck-boost controller
> from TI with I2C control, designed for USB Power Delivery applications.
> The output voltage is software-configurable from 1 V to 48 V, and the
> peak current limit threshold is programmed through software. The
> LM51772 also provides an auxiliary fixed 5 V regulator output (VCC1).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5

Thanks!

[1/3] regulator: dt-bindings: Add TI LM51772 support
      https://git.kernel.org/broonie/regulator/c/776c9d0bbe5d
[2/3] regulator: core: Support regulators where the voltage selector spans two registers
      https://git.kernel.org/broonie/regulator/c/2873782dff62
[3/3] regulator: Add TI LM51772 support
      https://git.kernel.org/broonie/regulator/c/e13d196d7581

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

