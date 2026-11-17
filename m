Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933822;
	b=DYogS61Tpd2eslwQLNyPTmyntFrfPItYPZrkCXRTMvCE6VhlzlYQ9GBKQf3DW1XdBcZ0
	 QLaaLh0PP/ev4JlrzFdeKzi0vov41gHUakURbynxhlvpKoSAkAtdsT0Q4ojPM5BtgFlyL
	 LyMpDT8DkGCy0Yj1olSyfuQkVPaxkdlf1UC/YOubdAZvKp5Yxu+lo/yhlqXJNjY2wsYKR
	 kZ4g9KUc9r6unf7+6HyxDhJa9DJgsGdhjygQkoCId33ct+tHDX68UujxQk7lQkcEACkHC
	 /m5FDKPeyT4+0j73m/U8SEDH8WsMAZ6lrYtP/o7XqMCjV9fZjdRTyFZje5AHmEu212A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933822;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZTHwNVFWZLgXt2unt2sBi2B/rMYxeErvHfpuelqEzts=;
	b=maX9j9zTY3+YMlqbdBqqcPPSUhd2PRVqvNPBhfq/lqiHeWuxn171ABxCbipIYFjh9Puc
	 MtWRDscZcWMQPtr5abWixsJoEMeywsNiM5rlhH0L+4Pm4lsSGa7e/kgGeKoFF97rGAVBg
	 YBfLZKF9mNDMoP37fLb9cD/YVeQZfVgOhFN6jyqHKqxDghxrxWkD8FUcc2YKZ4RDP1XYu
	 KzD9uEVJMBNdpNqCfMzBTTTShEC3V36WN2J9Eewca/J8vK+WidmcDCtWTxcu4LyduevLc
	 rcxRnHJmdXll19d32auaSIYD9uUTZocFlXDA69JQfZCbtQ2+DzPz4f/ODrMTN+7HWUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LS5XszJi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1815A606A31C;
	Tue, 17 Nov 2026 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LS5XszJi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0041F000C8;
	Tue, 17 Nov 2026 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794933821;
	bh=ZTHwNVFWZLgXt2unt2sBi2B/rMYxeErvHfpuelqEzts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LS5XszJiRCQq12tLhYFW9XoELb+ayrhWFUzIjRgwbEEM+HXtG5NWYfzScy9fHajIO
	 QTkrxhxM+CJBXBnfguXKOR069mkrEtbkjD8Y3reNQszDYNbIxDD7bKDKK2y5zclCi5
	 gNkDBJ78Rs8g4NIn1WMYp7PqwXma4rceLKNplVI2Y+hKmbf6nDCKb3AKDDXzEQxiM7
	 BfP+/6IYGhGnM0Mvt6E22uE3q1dSBXWfxTNKQyojkTt+Ae1S6WmJ8xKUieZM/dg7Bp
	 Q2TxkkV4d3RchaJwdZOwXMCAlzM9z06OmctVNnMaG/aKsiXIGf4Kg1ZS5pYjQ6VdlX
	 nh1sulooRi0vQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261110075841.12104-1-phucduc.bui@gmail.com>
References: <20261110075841.12104-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_sai: Improve error handling
Message-Id: <179492781045.77896.18198371225516958659.b4-ty@b4>
Date: Tue, 17 Nov 2026 15:03:30 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1rSLxismt1EO+6tSoslxFlG+H3uyXURGnUef1APXImU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+tFiyW0pEqR+YuubCoZN+7hvTAuI2VwqcFTfNa8lP3
 878v9ayo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABM58Zvhr8yipV9s1tjf5j/r
 tLnyx0OZ6fZbGI9dX5h1YnrF7JTTfqcYGfoCnk+9Ynrhwp/VjbeMt28/skul+OzvqQbRLpXaksa
 XtdgB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 10 Nov 2026 14:58:39 +0700, phucduc.bui@gmail.com wrote:
> ASoC: fsl_sai: Improve error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series includes two follow-up changes for the FSL SAI driver,
> covering hardware reset handling and dataline configuration
> error reporting.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: fsl_sai: Make fsl_sai_reset_hw() return void
      https://git.kernel.org/broonie/sound/c/7192f1a8cb6d
[2/2] ASoC: fsl_sai: Report dataline configuration read errors
      https://git.kernel.org/broonie/sound/c/6616554f4166

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

