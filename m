Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7403A5158B3;
	Tue, 29 Sep 2026 11:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681427; cv=none; b=bgsaBm/nLDOAZ2/cW27teHEaoi5rxRLUmVhDEYi4cIMh2SZ7wW+/0cUBrJ8nY217TY2aAsGRa2LrNmNnzm/lI+sHrKM4IFpEQAcC7IGWHR9AGLlrdmLXN8wodhV3SOJ7sUSnDWFQp+usQ7CuOmjnG2Aiak8way1rDMBOBXcLG3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681427; c=relaxed/simple;
	bh=WsStNk6YXTEj/yCbN8GVmkiDLCLRSu0yTLXtqtF6LfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EqnwipQBBQKs4Df+cy6iHbBTqt15iKul1FifdCP5YyXpzQpHlvXRJOVKDXYup56IsL5bR+awpBTn2rM5/kCAdAIliM7uhMiouryp1WFdNuuvG1bwYMn49oqfzxOuL9DWysUcPVPrlHTU9IglT5ixdKa4bt/tpEliivt4AqGRyQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhIScCCD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhIScCCD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923971F00893;
	Tue, 29 Sep 2026 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790681425;
	bh=2COO99V3tWZkY2vKSP/RcAXFdKtCl9Xe902JMrRqT08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YhIScCCD2hrldStzzqLVcyZE5j66LQO/qOfz4sFArIpQ2PaLnC5+1+qAN7m54zyB/
	 SG2CxllzCp8opF3hCLOn6KCFj96YcUsRkUlqI4cUSQsfmEzSs4K62HgSck/Eb8HXEW
	 wM1ucBZoYMRH/fPM0icbvi1Gk6zp6oXT3/gvFG+OKOabKJI8AggI4JrV+yYpqsJzpq
	 CoC9LA9YZ0TsWHlXpkoaFOgDKUje/X8QcWk+N+cctaO8xPf8vf9g3CflreSPsDzJDa
	 Eq5Nv71xnMnY2XqkEHwOURk6ysX7vtPuTJrEKfjJYO634tKTV1/EnTQO0skRm0Fdpw
	 EHGG4uYFM7N0A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@oss.nxp.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Chancel Liu <chancel.liu@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20260928061756.1844185-1-shengjiu.wang@oss.nxp.com>
References: <20260928061756.1844185-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH v6 5/5] ASoC: fsl_easrc: expose individual DAIs per
 conversion path
Message-Id: <179068142132.159801.7683706041383677671.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:30:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Mon, 28 Sep 2026 14:17:56 +0800, shengjiu.wang@oss.nxp.com wrote:
> The i.MX EASRC hardware supports four independent conversion contexts
> (A, B, C, D). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_easrc_dai instance with an array of four DAI
> drivers to allow up to four independent conversion paths to be active
> at the same time:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[5/5] ASoC: fsl_easrc: expose individual DAIs per conversion path
      https://git.kernel.org/broonie/sound/c/788e893edb6a

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

