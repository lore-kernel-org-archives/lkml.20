Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060829;
	b=gsf6zRGamWx5ZUJ7gIrTlJQzVA4Gu1WE2uncir6QBhUXT7r9oMIQiCsG4lTmDfSI/COG
	 zIN9Yr/tpOmXWGGripAs9opcgChSXeD+5n89ie9hz+Rq0xMJwhYez9jYaYOHq/dxEArWL
	 nxBLblWBjNyo7CKtmNsc+WQDjIrueuItxDJF+Y1wteB83qNju2Xx0aVbaxTbiOzZ37ydn
	 hzp+m0rxccPLqRGnwGhpcVEOFA7rhVJ/PV1pYpZEC+1rYIQRf9B7Kj+gPjTAWsl1CSVMP
	 lsty/IBI686692RS8vDvFVuEWKLd68rGEVCtk7KxsRBZUlQgYRu0ycRsbZ3zIaK/AQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060829;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=BjDAo3PfR3trTZ4CT+21HMF0w5JupT1Q/iWjhnR1UgU=;
	b=ST4hEppAdoZOpq17ChhJMjGlEzJYU+HQqB80ZA/pyFacmal8/vhVPpIRvri5QLpmjo9K
	 F0KALNSLiE0iVUTfhtCbqKoJPnfczrG1rr0rEm3vlnuZftC7rYnlXgv6PH8P/wV1JXrd/
	 LYTQyLpAK/354Acq4uHqm2lWRzClLZplIRDU3wraaa7ELcL9ZFhB3x1VP6h2v61noGViP
	 2GdGWEucsPc4nZt5ONr6ECZuf18qrP29TesdWldu8GuNC8dim487uIbvoQo3xvqJ3hJ6h
	 YkPhDQDicrHYFy6coyph1BXGyGvGuI7z4qxEdL7Yjia+tS0sj7rI4NRFff78/1UZUNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bBxpWpXD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779CB606A330;
	Sat,  7 Nov 2026 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bBxpWpXD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3741F008A1;
	Sat,  7 Nov 2026 14:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060829;
	bh=BjDAo3PfR3trTZ4CT+21HMF0w5JupT1Q/iWjhnR1UgU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bBxpWpXDc/ka98UhYYRuKTi6hB9mfnPgIDAN9FsGUgOhbi3u8DhOsvekzUpunnH1F
	 skmlwDV5sBsHq7E0qj5+ayegWZML9kTpRRr2+Tlx/4M9tgG3ZziYUuNBdr6AXNPMeS
	 vm0OvDyaJPm3yGkk5j4TD6fenitVLMaOIplVJL3c/dq4c+Ndv10bm1+ZCnMU2L1coP
	 i2efFgFSp5IM1Yr2dYr14sVfJ+wXrVSPMv/l9dMM5biOMdxhWxYwLOqeY8zRIrL8AW
	 vjaQX5dPgzbUuNdJsivC8mDdRY1/u5lKu2lhr5bYP4wcAEZadrK1+9taipIaRTbTJx
	 ImP4avQix+Tsw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id BE93629E6A72;
	Sat, 07 Nov 2026 14:13:44 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Myeonghun Pak <mhun512@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <20261016023912.3658714-1-mhun512@gmail.com>
References: <20261016023912.3658714-1-mhun512@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_esai: Disable reset work before suspending
 on remove
Message-Id: <179397763038.3231166.2110222144709277815.b4-ty@b4>
Date: Fri, 06 Nov 2026 15:07:10 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lNxfmr3kPRt3PVCFU3hjz9tLlDyGlMqmwRteiKLR7nQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeGwllqTpnSBf3KK+dduXwzs0/+Ri2JdycGp59+E+27
 a1DxczbOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRwnaGPzwXxdyCPp1Jm7/j
 u8+dzrnnjPZfTurWi9D5+ziu55zqaW5GhmdTtR/WuAo6L2kVWWcyw/LoF7fsB8nzA2tuXt36/I1
 5GD8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 15 Oct 2026 22:39:12 -0400, Myeonghun Pak wrote:
> ASoC: fsl_esai: Disable reset work before suspending on remove

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: fsl_esai: Disable reset work before suspending on remove
      https://git.kernel.org/broonie/sound/c/b72f6bb43dec

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

