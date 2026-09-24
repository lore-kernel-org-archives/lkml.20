Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FC233D51A;
	Fri, 25 Sep 2026 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331353; cv=none; b=kJRzSXJkI9/VOEic2nOFzWarxguj3E9KLquCJofOR1l3uH8NjKAC1PerOPrXTrh8dvi2Y4u5U/pOcJpAchL02kF32WL4TO3r6Gu09/e4X/b10Z0Ecxblv9Wjga7MoBigbtSFUBWXVmoY8C/FOv1DEVqXa1aHAfPBq5TAKq6AtUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331353; c=relaxed/simple;
	bh=uVabgofQu88hjGhl75WJleVJ7FW/OHb+giCp23ISnV0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h+Edugv/3NkO0YnQ5jm+KCb+2lMlXAOZBaC4+drqPBGEYBNqBmNpwIIW474vdtPXIAHY5NY6RlYXa9qLGIevqUJXHVaf7V/+T7fj4IrcZsbfBMwPb9iCJbcQzmJfnPey/Nme3U2PE3H8zpYMPrh0TdWD3aJjHQeBbxZHV6YrX6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsaZILf4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsaZILf4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAB01F000FF;
	Fri, 25 Sep 2026 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790331352;
	bh=SN0flw/8Kg1krmde75Kg/DMOynz3kCotUdHuK1V6Xr0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OsaZILf4w4zlCQlCxj/Q8uDGHj7tj49qi6rT67nMvYGWRJRzwlG+g/gPYXzswuFAx
	 IZCnrXNbTUKGSYEnDrvKmDvBY3gdRYac80GOCdU4v2C1FiNE+LYSnEEHIyT3PMrqLV
	 UCFmj+4+epiqNEVD6ZXavX/78kCObZWpz0IS+qliHIT9buz+2VYzBhzJgnwnc460BO
	 URHoDhRGC+QSD/8Swod0KO5Fw1f3mpNhmJA06StM83Nm59taxOxrV4ZDm02+uzOrtS
	 cIzc36PX6R/PEC12IPPoj7AmAYLbo2WQLqcSG8OD3lBaeK7MlWOfQb5octRaoQ9D+F
	 2QzoXKJ2JusDw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
Subject: Re: (subset) [PATCH v3 0/6] Add audio support for QCS6490 Rubik Pi
 3
Message-Id: <179027686764.149798.12160632737276698266.b4-ty@b4>
Date: Thu, 24 Sep 2026 20:07:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uVabgofQu88hjGhl75WJleVJ7FW/OHb+giCp23ISnV0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtknRBkljFnM61yDSRnzRLtpjle6pslbsWPbI6
 QvEw48jHBCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarZJ0QAKCRAk1otyXVSH
 0OJVB/9bE0yEHFxdW2lfweF638DI6fa/UFgK0UXU/W9e7NJnDqbvKUpWCrHsY6wXOsdUu7P1dno
 VjWF/zQ1qKLIWkB+tNRq6oIJ0TXxrAEhakJiDjNou8uiW1OQvsBozmnajOjI97J5gkd5Tprvap1
 azrTfn2o5siwAVrlGDEkII6G64zCLYVn7AZteAVODpGkthzJz2TF0/11/wsnRM01NcOF3cvY1V8
 ESV7oNUpLglN+rRMjiATx3tOPZ8gzzKk2hKLHjh3/adXCTPBrWkZtvkcPGZ2QmiKBRz47CkF8sB
 ppvaQK2OcmKBG5Yx6BG1PSO/IJW4vh4jEz5nXttJTQt5Rlt8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 04 Sep 2026 18:02:24 +0800, Hongyang Zhao wrote:
> Add audio support for QCS6490 Rubik Pi 3
> 
> Add audio support for the Thundercomm Rubik Pi 3, based on QCS6490.
> 
> The board uses AudioReach/GPR on the ADSP. An ES8316 codec on primary
> MI2S provides headset playback, capture and jack detection, while the
> LT9611 bridge on quaternary MI2S provides HDMI playback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/6] ASoC: dt-bindings: es8316: Document jack detect inversion
      https://git.kernel.org/broonie/sound/c/55c9c04e847f
[2/6] ASoC: dt-bindings: qcom,sm8250: Add RubikPi 3 sound card
      https://git.kernel.org/broonie/sound/c/f6a447b32a39
[3/6] ASoC: qcom: common: Add generic headset jack helpers
      https://git.kernel.org/broonie/sound/c/7f8dd07370f8
[4/6] ASoC: qcom: sc8280xp: Add per-DAI board configuration
      https://git.kernel.org/broonie/sound/c/ea6e98472c65
[5/6] ASoC: qcom: sc8280xp: Add RubikPi 3 sound card support
      https://git.kernel.org/broonie/sound/c/c82a336b1864

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

