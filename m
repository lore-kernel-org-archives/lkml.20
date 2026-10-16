Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C184B3DB632;
	Sun, 18 Oct 2026 17:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345694; cv=none; b=qaDKVNduG2u9CMmbXNItyHze0CJH7qFoLN72Vr1i6ywIasiklHDVV9VJuNIhaf0wGnJAFon/vrw0Y4l/OTBb4UkPj8lMjDO3maFXbr3B0Ye9lCVO0hFTYZMSelJQpjaSPYGfwrnPwjt91lYTNsD9oRAiKnPVSi+yaBb6/mm06q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345694; c=relaxed/simple;
	bh=QWq3i3vzm1mSRgoW4PRUGVCNPZiytoi3lzMyn9N9VfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NFjfcAPlsXsLSa2HnXxTct/E4/vA9cC4zvqCo8gvWrQze5FBqQf17SMjo1c5HTrvGYI0VjktmOkDxeCefrnWIBn3mafoW5PlZVgnOccy6W/P8KRgbxB1j31wFMYeSNLCzC/Y+xSmZGvMoaABr0WAz3X7J5qi/hbhjCSWrxFZh7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WmMsRKJX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WmMsRKJX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831251F000C4;
	Sun, 18 Oct 2026 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792345691;
	bh=dY2M5OxJo8HeSyHYgOk8jaF2BQkfRQ9MFiTg1z74do8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WmMsRKJXRHA7kPl/KchgJmnzSCOk7/+AC+7m/LM0me8m9EDoyPAcPxzuBhYDus1Km
	 zWbojCUpK18UhP3qRdL892hvkftGS4bxpMycE0ee/k+gptg+4P3hSHAuuUzTG/p1As
	 54GX7SH6OudgfWflcFNGP4tsQSeVKdwpKyEg45qLjNj8n9tuECQ69gts09fcFByRXc
	 hmtoM0NETvSt6Wr4Sn1NvZ+wemUmxcV0qNQyCpDMGi0exdaQ3m9ECEZpgJNVkdEWma
	 qJSjO/hV5zpUoxxpsxOell4pJwwp7y+RLR0CTEA+6Ngh6Zk5ypQTwMjq8o4O1FFGkE
	 Ttx+6MC2wKGLg==
From: Mark Brown <broonie@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016073157.611956-1-val@packett.cool>
References: <20261016073157.611956-1-val@packett.cool>
Subject: Re: (subset) [PATCH 0/5] Enable soundcard on Motorola Edge 30
Message-Id: <179218647657.3162228.4284806308774013026.b4-ty@b4>
Date: Fri, 16 Oct 2026 22:34:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QWq3i3vzm1mSRgoW4PRUGVCNPZiytoi3lzMyn9N9VfE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKusjnsvXlOalPSOZVfXa8bu/+I8OkxWf7w8jAqFpoSy
 Prz5FfRjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEyk/gwjw8zn6WtWG1dc15Wp
 0V5uN3veliU7/bv4ZY/ZWDjIsS209mH4K6D/WvhS66x3x/XOFOqIcstM+Pr2/T21BemvF0Wc+JK
 lzA0A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 16 Oct 2026 04:31:48 -0300, Val Packett wrote:
> Enable soundcard on Motorola Edge 30
> 
> This series enables sound support on motorola-dubai, at least the
> speakers.. The WCD that handles microphones and analog USB-C sound
> is left out because it would first need:
> https://lore.kernel.org/all/20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/5] ASoC: qcom: qdsp6: q6routing: add Senary MI2S ports
      https://git.kernel.org/broonie/sound/c/2b20c976bb63
[2/5] ASoC: qcom: sm8250: add Senary MI2S RX support
      https://git.kernel.org/broonie/sound/c/41c6eb15291f
[3/5] ASoC: dt-bindings: qcom,sm8250: Add Motorola Edge 30 sound card
      https://git.kernel.org/broonie/sound/c/a0f1887655af
[4/5] ASoC: qcom: sm8250: Add motorola-dubai soundcard compatible
      https://git.kernel.org/broonie/sound/c/32c9d661dab0

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

