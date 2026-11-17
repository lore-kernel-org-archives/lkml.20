Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936405;
	b=0b30gHzTfJwyRMTPHyu+IKTjUeYOwUBaavGvKU6bWXn5CHb8hlxC/PhfHGlHxzzo2MPL
	 s916vUFbqykUogSqy7E+w2bfBpDGkCJ/d+2OfTBYPRkkqxyiqoPemEbMfbJxKfbdoo1t1
	 huPNTeb+hBIhP2ueuB3qw0SYVDqYBIBLU4H7SI6i9gMI8e6zdtFx+c2eplp3ENYP2Z1oW
	 xRYgNZqTqkx3U0oNlOrz/q0JX4P898UVymZOP9/I65EwY+f/UaNXg25mTELKedZRVfh+o
	 QrBdYwLBji4axqIB5sRT0brrMjgnrCOjtCt0FH6CXlg8+zIZInRe4ZGgM2kwemGmGHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936405;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=7/xM8ng4BTtJfUJk0C8WxQ5t81uZNbz1ZRbT3JWX2V8=;
	b=sZukyrW9T0Jy9l1134uXQomYeisQXvdVqW1zY8jdL1py0AZrFR9Sla5RdWjswcdageuz
	 Dr0afH4tZfC/I6OTzHjlenP9qsKdLg62tkdASHxcfLms8w1ovvJR8ONY/EmSD/4Lysxjf
	 QS2SNLtdKnNqXQq6ywmPpSuNUslrcXLKs8zNvqkgmvmeEFGraIvKvXX0hRtF03fvQFFfq
	 ISuPJ6e8Ua0742uenHCEKeL2Tp5TKoUdFYYfsYgb4CULIGpo/MsVxKstPyowsXRY327bm
	 ZcUuqz7BUS/FEweCnJx24Awdz5c2FxSQMtk3FK4GIWivArAqdeYrFuXSOpSyakJ0WFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8TIAsJD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B11606A31C;
	Tue, 17 Nov 2026 17:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8TIAsJD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFF91F000C5;
	Tue, 17 Nov 2026 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936405;
	bh=7/xM8ng4BTtJfUJk0C8WxQ5t81uZNbz1ZRbT3JWX2V8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h8TIAsJDmw0YovpOgJEA2hayV84DfiMWsJmMTXkjUPwaBiqJNnMWPhooucFfOfkiI
	 vEA8gZOdS8LFWs7n/VwA/DZ3p4J5b24OsMR3Fpp6tlCcJH8xCh/TAJH6ZE92LQq2xT
	 eTbeg0lmz2/NGRxhLcaCyUXUjqDcjdfYYQR4MbCPY2aCumyID7ADIyg8BZ82H5Sg+D
	 Rpyr6IkRTiqhYWdEsX1BVU9ztlX8O9cTgIgUKSvUNT65vV1IMIH7qgIxXIwwtnYi6V
	 +dsHpAdBC2sZSOzBzlSmXZmGzUS02dMd2VeAbJOe92Rg/JVxbEbj/qw9mqTjCkK93x
	 MoQmHhq21cv5A==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, suso <gmsuso@gmail.com>
Cc: jaehoon1744@dankook.ac.kr, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261112204325.4696-1-gmsuso@gmail.com>
References: <20261112204325.4696-1-gmsuso@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp: Add ACP70 ACPI flag override for LG
 gram 16U55U
Message-Id: <179492964436.77896.5360643683155636424.b4-ty@b4>
Date: Tue, 17 Nov 2026 15:34:04 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xHp3Hn/2QsvrqS2qd0YjJXyB6pukp+Js8NVca/2QTpA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+9AVFK35UiAt+xKC05iqXU9urvyzPWhzaS4+4Pepem
 /ZmkvmUjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEwksZnhf1BM0773+1u+vuzh
 L0jcm6V6bdG90293vvH64v++cVGTnRUjQ7v0r26ROTye75VF8haLLoneuLXM4fSGLqH6Nz/af+i
 E8gMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 12 Nov 2026 21:43:25 +0100, suso wrote:
> ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16U55U

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16U55U
      https://git.kernel.org/broonie/sound/c/674605f05e0c

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

