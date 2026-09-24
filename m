Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCA748E0DE;
	Fri, 25 Sep 2026 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331377; cv=none; b=nZI6ekPlvbDengMDLM6YQmcy4wATTLGk1xR37GTBb7ROyAAtKq0JANkNfiGts2IPgtHxDDFOG0dfTyBV7CcGMmW3+llypuuu55y2DinmF9Msi320MDJCJ/C9NI04P8aLC9Jar5gf0hU2TEaCRYh4/w7Ad60n8jPOCl4NsYg0ZzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331377; c=relaxed/simple;
	bh=y/pkRgfVgqtwzu360IWPfkOBTH+11IHGTURl/Z+hIfo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=todZaFGYQFQWkvbi6i/MBq6QLbSIMMVNzQyeji3rJUK0iv5UIcdwH3sRqNoI6uZGTt1YVTxBgFojbxgm1uOr4hCJc9jBOMncFihYYKSDYDflogihcj5BiWpGGo238Qb5Oolyb5cDom5JguQgVQd3SrIiwZCuwv4WdOqRE5SMCOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yp9XNDYk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yp9XNDYk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B7F1F000FF;
	Fri, 25 Sep 2026 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790331376;
	bh=x30XPvX9oq5pFzlLxMBNs2CmcKu5R9h7xi4wepN5BgE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Yp9XNDYkzMo2akdZaGKgo9VdxHiTbYUkikcYR/CVxUgOqs93WJRYJM8B1HtHY4LJy
	 S9apQrQGKZdnhk0wOTgh0uLDvIiu00W6cr/N6gshuu2LItEs7GejiD8xfD5Pcw1kzN
	 xvYwN+dU1W2FmGlyxPizBYakw4fiR1GBTGaG4Uq6NgAu0+aFgUbIsIK9YjlE7pGssh
	 knPYebqiS+jX05vL0Q49CI9GfIC3xt5LCsfDnU9Pd2ippBOyY3XoOztlKT6TpR2y/h
	 Z9qB9qp4CqZb5CBikJF+0oLaaqSBnGNWd64RE7UoFK8IT/PHqkmoYr9aESf3O1t9EX
	 0FgXPQRZ2k4DQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Harendra Gautam <harendra.gautam@oss.qualcomm.com>
In-Reply-To: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
References: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] ASoC: qcom: Add QAIF AIF MI2S and TDM DAI support
Message-Id: <179027514987.149798.7431502097778220726.b4-ty@b4>
Date: Thu, 24 Sep 2026 19:39:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683; i=broonie@kernel.org;
 h=from:subject:message-id; bh=y/pkRgfVgqtwzu360IWPfkOBTH+11IHGTURl/Z+hIfo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtknrjKnqQqh1MGdfB3eKth+VB2/gSvZmbLtEs
 2tAFqnTs8yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarZJ6wAKCRAk1otyXVSH
 0NSdB/4kBbLmp3iWDFgQAs0p0PNUdWqoGbksGWw/SkFJBrH9CP9Q85gBNc0B173FSaW5zM360zW
 g/lInIcZ77EjbJasODiS90LnPEc6ak5LrtuK6wZpnRQoT17ClWgccYI/tExcQxhsKOdZ/mKqvwo
 xbH++xoV8MfJGP/646rxkENrsvosBj2xJMZpWwozlUatkfr2ZpHuyimvFw8+StwRXFfY5ksUSC7
 uBuoHzjdUtCAEYsbCrUOa1Z8Jcal6kTtMQKX5j5CYL7XOp14Vsd/XIjneaF7qVLqli3MM+cKPoE
 n7bLnlYzku7SJPX6kyICd+hGQuUE1fRHQg8xvTqwiEAEX5yD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 18 Sep 2026 19:01:11 +0530, Mohammad Rafi Shaik wrote:
> ASoC: qcom: Add QAIF AIF MI2S and TDM DAI support
> 
> Add support for Qualcomm Audio Interface (QAIF) AIF MI2S and TDM DAI
> id's across the Qualcomm audio stack.
> 
> The new DAI IDs are required for platforms such as Shikra, Hawi, and Nord,
> where QAIF audio interfaces are used to connect external audio devices.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/3] ASoC: dt-bindings: qcom: add QAIF AIF MI2S and TDM dai ids
      https://git.kernel.org/broonie/sound/c/7cb06353a203
[2/3] ASoC: qcom: qdsp6: lpass-ports: add support for QAIF AIF MI2S and TDM dais
      https://git.kernel.org/broonie/sound/c/897be15f03b1
[3/3] ASoC: qcom: sc8280xp: Handle AIF MI2S and TDM interfaces
      https://git.kernel.org/broonie/sound/c/654d53e6901f

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

