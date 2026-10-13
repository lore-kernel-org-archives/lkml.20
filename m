Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6706E50276B;
	Thu, 15 Oct 2026 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060313; cv=none; b=nOtkZwtpnlvi8dufPTOFaHGSwTzYlfvR5ylECVKzmLVo6Dtld5EYIWDwF3RclRmiYLd1GzgasnPrhH3BC7l30pwIDPkcoONmnQpddzuF/2MtmY44YfU+5Jv5SHBB5HduPBZxNSOJoWe6mmOt5oc8YTcQ6PXt+NACRlzrPxtjAfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060313; c=relaxed/simple;
	bh=m5Umn1Oz8Qoxkt30kmgTJm8gkCXetLMp9KWj62TATrc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DXQ4teilW3NSUaP0mGBMTunETOCIMSIcE2GtOgycDTx/hyN03OBHf+nqhVfQ/qS+INA2Hk8O0PTb7y5oUkjikQRBtAkKxuW/fuZ92/pZqTKuGlYJMsd07N3w3KaVN45nfBz1Z0K+9DDVNYMbC1Lj5pCD2mlVBAsZkRb5b6L6/h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTBZ6Cch; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTBZ6Cch"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BD41F000C4;
	Thu, 15 Oct 2026 10:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060312;
	bh=2wZjq8a/MR56vaN874X/q1izz/HfFFHNoazfrx/mwXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BTBZ6CchqqCjNdSyrWBNXimmeZVYcro2+fMMCkFNecl61z800S9ofeQBv7aPnfG31
	 gsIsBCybSj3UeD/YXN8UArxNwMvVKil+oPtMHNbbMBosmbcALLBHu5t/5ORjZqUVis
	 Ms2U6p508r+aq/aY/Dc+PamiaaZ+cQAXskGsUkGF52cpgdqDPWnpLdmkkls6iUy5aw
	 lhd7sYCwJCpxFBNiOQywfkYfxvrexYeBj4/JJ93LlWoeiCbEcRUiCwWU5iGESbYkSP
	 1rRkCr+KyZqV0atK72L5NKODctJ1habEG2F+Mu4+vPTyqCHaHWPSiHXnj8h64d1Ih2
	 Yhmc8+2lIQ4LA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jianhao Xu <jianhao.xu@seu.edu.cn>
In-Reply-To: <20261004102346.1203410-1-runyu.xiao@seu.edu.cn>
References: <20261004102346.1203410-1-runyu.xiao@seu.edu.cn>
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: request watchdog IRQs
 without devm
Message-Id: <179192170017.1606900.865056512044670099.b4-ty@b4>
Date: Tue, 13 Oct 2026 21:01:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=m5Umn1Oz8Qoxkt30kmgTJm8gkCXetLMp9KWj62TATrc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIurJ7iImgjt3q29nk9QXWnrFuKRumv931xutTIL/bq3
 Mtfl35VdZSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAieuqMDCdbtK/NSdKV3XR5
 6s9HKfdOXt4UE31cq8Dt77wzlW+nyf5mZGiIWSXxwu1i8LYKgT2plqGTt/D0Fu8/LfXpreAfs2N
 dPmwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 04 Oct 2026 18:23:46 +0800, Runyu Xiao wrote:
> ASoC: codecs: wcd937x: request watchdog IRQs without devm

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: wcd937x: request watchdog IRQs without devm
      https://git.kernel.org/broonie/sound/c/b3f17433a1eb

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

