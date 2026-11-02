Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725418;
	b=XC5TRe1RrY8Y70Qpg9EK8BYbjKk+RXxAy4DwspDcC0jD17jlLpAZCEmH1C2Ggv2KGLd6
	 Akk0h9FFv370kQR98JUCgV0DJ7tRRgorUteU2ITsvEDz2DLhn6j/92FVuKQjsz0vVYAaU
	 EvETDINKYPQCagDe/V4diKHmzZm9OB1Wf0DukI6g8jTFJF/wfqpFyWGaZenGUP7d8Oc3d
	 FwhS6x6HCQsuIXyw/LGNXPfG6QVRwAvVjlro281WEv+wn5W/kFeaoEbjuLqRBYH8QG+wO
	 cWdVNq6bj5V489dbxewynRWTLnt+ZkLHvOC5qjnRFJ5szHmwSdjFjQAjrjRuvtwkhoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725418;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=oJl/TJkLN6vcbAEnvKrOzAyKBfnwjHKhu4PdgIjDoks=;
	b=qUGEXHedjIIjyWzQJYvJyGBX4WfhECgaUgsbnbNsFPHbMEiDuMSR/3R214TWrnHDkmMl
	 iHfGmM0Ilyg8dQmdko4H6iCjMnIMw1d7LHnnBBXT44YriPxr2yyl/A9hSOsOZ0ZEd014n
	 tW0HZrUw+hSjt4zgsD/C1XZlC8YHaVeVKLUmnbs8MYimnJMDF8fRZM4GPEreHR46tm/8D
	 8XTLVj8xVuZTt8Xrpy4ZZFhn12m0uOX0XY0E3fLJhZucIaKTNEH10f6/zCVtcXqyVlSzS
	 A52JtoDyOa2N2HiATAfa0buAfUfZ2Mu5dUOUpV3bY/yYGMb36oV44HvbTHl9Ezh5wjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YnsEWs3y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD76606A328;
	Tue,  3 Nov 2026 17:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YnsEWs3y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AB91F00919;
	Tue,  3 Nov 2026 17:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793725417;
	bh=oJl/TJkLN6vcbAEnvKrOzAyKBfnwjHKhu4PdgIjDoks=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YnsEWs3yYqaEO+ACtWiQnMA+mDs+IhbnDrFnmBDK3JH1zpUiEV89kGy5bkeK4MQUI
	 ydom9mDv+U8k2hJTm/RHxdIQaHrVHl+S9e6VvC4puvO1YRdRQV6gR8QEvdI7MAbCnD
	 58/XlxT1cKDy7N2N0RUkYbISq4MhEb/I6Z/ObEZle2ftUhVJDDgpDUG559wW8K8h+f
	 qZN81d8YTwQcvQdeRgjzHScR5ScbQlkJPLyyTqG61GaU/+8RkBPlomxvmFZPwQcg2V
	 h4Xrd43HR3b+7OoUVjBNlfWKkCh5vfDlajvY0HR4A+0RGqTg43cZhw1VbsaAOwNCNv
	 2P9hOrrLXwPrw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E5C602557271;
	Tue, 03 Nov 2026 17:03:35 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261020170341.1641325-1-val@packett.cool>
References: <20261020170341.1641325-1-val@packett.cool>
Subject: Re: [PATCH v3 0/4] ASoC: codecs: wcd937x: add USB Type-C analog
 audio mux support
Message-Id: <179366137297.2186205.17170898890068464983.b4-ty@b4>
Date: Mon, 02 Nov 2026 23:16:12 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1802; i=broonie@kernel.org;
 h=from:subject:message-id; bh=P0WuLn3qq9FzDL0VHul4uoyyq/cYW1My5q/KDid12bI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeCT/X2VJyavuv+TJaddd7L4leXvAq5daZk2e+VrlqH
 NETEtrl1lHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJtCgw/I++flPsyTSW+a2/
 NoQqyz86qRzwnk/o6tdVsi17vN33rXzD8E/xzOYQFnkBg4vX3wYJdxstXrjp3qzYtIbUF+91v8k
 uu8UOAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 20 Oct 2026 14:03:24 -0300, Val Packett wrote:
> ASoC: codecs: wcd937x: add USB Type-C analog audio mux support
> 
> Currently only wcd939x has support for USB-C SBU audio in mainline, but the
> older WCD codecs can do the same thing 939x does with USBSS, with an
> external 3rd party mux instead. This series adds support for that based on
> wcd939x code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/4] ASoC: dt-bindings: qcom,wcd937x: Add USB-C graph properties
      https://git.kernel.org/broonie/sound/c/cef46975ac77
[2/4] ASoC: codecs: wcd937x: add USB Type-C analog audio mux support
      https://git.kernel.org/broonie/sound/c/66b5b9e4ef2d
[3/4] ASoC: codecs: wcd-mbhc: guard against NULL cfg in typec_report_(un)plug
      https://git.kernel.org/broonie/sound/c/f138c329457a
[4/4] ASoC: codecs: wcd939x: fix ref leak and NULL deref with USB-C audio
      https://git.kernel.org/broonie/sound/c/9003f8ad9c4e

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

