Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418073;
	b=oWfvLA/2ciZRA1k2V+LK4b5jxK8Q9z+FD4Au+6cWf/rsMgyxhlrP4Xk3XostHV5nqy21
	 4fVAIAj5Cmr7DecN7c6NmCH3gjkm7elXNrmMQYjQt7WA2FF1KveuGlJJU0j7XypNp+Gnl
	 VZkiSLHZ3Jj+9Xk/QRHIRw7eecKJjj0eu4yUq/4dlUKE00iBnQLe+gsX01calArlBymOw
	 C4OETi45TWFkdsQ+pi9M0Oqr3JLxvDaKPqpVplPE0HMfY6ExvRVZMSbnXbhd/5B4PaCOa
	 h85jf74jTgKNn/i75p0a8O4Y42GqpFuCUZpT69l45KaqXPPdw+Eh30VkW6MOLOGQpnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418073;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=De0T4JTIAdwMnBuYojLax6+08mzoMSsAcjhYpoJvGE8=;
	b=E6Lko6UOolXUWjuX60hp/KfPrMAN5Tgwt9ESTPNvCa12Y17C4see3SXwmT6QFcplih1m
	 l/AQ3buzfVJx2x0MqZ6qWulopb+3zTj3NIqhDRBCUmny3rav98zcS7vaD9Es+mp7AxHHi
	 wFNX+bae69P61awochOeF1lRLSnqhKGHHcrvuncQfC+XHlSmRciKKgXA8S/+jIKSuqVeV
	 u2ml4vGceTogAAGa7sjFWqqKJq8KYIjLYm5vWvyo36n79bsxEs64H+a8VmYC1yKK/Y7WE
	 dN0Yu0XkDd5v+6pUOeH/2hzArJjsNxqlz9nNXwZr3tSC40huVNhOAJflsbPU3k9B9rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RRxYElrG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C419606A888;
	Wed, 11 Nov 2026 17:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RRxYElrG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9591F00A07;
	Wed, 11 Nov 2026 17:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418073;
	bh=De0T4JTIAdwMnBuYojLax6+08mzoMSsAcjhYpoJvGE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RRxYElrGuO5Tg7+j5Rdvth+0QnNbQuNk37rfKf4GbsVttADxNwkxXlGXlfHGastu6
	 dRvhC0kcWa80937VCsQDpsiwoAlFApLGW9Hw17n0iehjT5QAYbVHJjvcEOaCw+t/49
	 /+ODY1/VYITljrw8AHaVMS1Ex/NfF+0RJWhycjPXOZBBF4MVKQ8xnZtJSqEwxouCAI
	 HHCyYXnxDimvgpCX8UeGrmh59h2euOazG416cgo2VU4W76K2T9hRR+jeXFowxeWdHk
	 x7rZ0D+m8mWHUoZ0VMISKmeUEmCQC4oeogMKkEtK2NR2BExxCOFwLxWuHRtoKPgmCN
	 8msLgGQNpSlMA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104123249.227920-1-clamor95@gmail.com>
References: <20261104123249.227920-1-clamor95@gmail.com>
Subject: Re: [PATCH v4 0/2] ASoC: codecs: Add support for Fortemedia FM34NE
 DSP
Message-Id: <179436234627.926575.5617855708868297025.b4-ty@b4>
Date: Wed, 11 Nov 2026 01:59:06 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PJ4OFwRDYK5Te6wSfrGGpdJVoYB+pxoIvLp7kPvtzmY=;
 b=kA0DAAoWL+9zsLPQOIkByyZiAGr0pZXId6AtDYe3qptEw1CG/exVmqUBQo8QJ5kF1wgbICUft
 oh1BAAWCgAdFiEEXmoL6X9066wOwaGGL+9zsLPQOIkFAmr0pZUACgkQL+9zsLPQOIkRpAEAqv+/
 zNMqGyCGLYR0OSxj8xwIOylTsH4MUMf7QVrAn3ABAJTf4e1Oku2mrt53tGlLJLsVi0BMljySUNO
 N5EHMkvkH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 14:32:45 +0200, Svyatoslav Ryhel wrote:
> ASoC: codecs: Add support for Fortemedia FM34NE DSP
> 
> The Fortemedia FM34NE is digital sound processing chip used for
> active noise suppression mainly on ASUS Transformers.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: dt-bindings: Document FM34NE DSP
      https://git.kernel.org/broonie/sound/c/72c167d8e3a7
[2/2] ASoC: codecs: Add support for Fortemedia FM34NE DSP
      https://git.kernel.org/broonie/sound/c/2488b6a08b88

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

