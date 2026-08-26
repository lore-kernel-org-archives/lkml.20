Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A2240A937;
	Wed, 26 Aug 2026 21:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787778284; cv=none; b=GgYs6lrgkQQM8/r4VMFaWO6XyQi1D2i/xbWhOpkrwDN0dFcofQsP3aGQeOw+qzhny7OBOKhoAcQSoATafgDq0a52q51iBxdPPwOpxI4u3BzuS6xIi5pYzs40z0aCwHFvnHQAH6BDjHotg8L7btJepXiyjBpUp8cCYiM1rxNp7ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787778284; c=relaxed/simple;
	bh=cGnYgGBV8oYmzG0Gjy1YEzAt1TLzGw0cXWpgixyP86o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fHOy3vXUwYWOy1vnh+x0SXU2CJkacIeorMLiSGD4U0HjUkBgGtE+AxxNoX/3uiEi0q93zM/8B+1E5TqsSdWleQ7oD7SxrdngLeQZFozxBlDWvKKRLRXDMmqWNZESEvYEG5WdOxNyHed+5IwNe9d981Po9eKpB2tBVMDlzZBCQQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9lhqMg3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9lhqMg3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8A61F000E9;
	Wed, 26 Aug 2026 21:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787778283;
	bh=EuyLr0toyZjaVFAGPjiCc6G5Kjzl0zb2HEHSutiBrSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=L9lhqMg3kWq5oHD+CqOP+2mf/zlYP1l6363lyMwWbukIbHgsPAeKQ2+n39K69x5rG
	 2hKbjtU9n8qrvQz+AxswbEe8uWOAqnCrdiTLwK1NAs+GHYiRcjj1ehCReN6IGqobAm
	 XOXmjrSUU6HuLR8GskF7uAgbg8mNlcEc092QOFo/zaYd2MnficsOYR9fHtdslhBmIH
	 Q2+OplDNA5WexTmsC1hyFvrG8ao4SCieyAZ2q6chMkf05tHrKWVbl0KfLBews6BlFh
	 mGjFgtRdH4oC/MyEcuUmTVF+/Hw19fhyknx0ELjmp8ImUl1pl/Me1Gujl07tGki1Er
	 IIUiloxQ+ARKw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Mehmet Aysel <mehmet4ysel@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260825092432.56292-1-mehmet4ysel@gmail.com>
References: <20260825092432.56292-1-mehmet4ysel@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: amd: acp-config: Add HVY-WXX9/M1060 DMI
 quirk
Message-Id: <178775291998.88371.18167174635718566831.b4-ty@b4>
Date: Wed, 26 Aug 2026 15:01:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cGnYgGBV8oYmzG0Gjy1YEzAt1TLzGw0cXWpgixyP86o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqj1Tn3U8cvP0fvqx1uxuieEh+RQO13Nnph7c+n
 X6K8UYlydyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCao9U5wAKCRAk1otyXVSH
 0D/zB/9KxEzIbmD8uZAl6bfgDl3Yfex0SWYVpvtrRoRAVg/KO+dr5+4Z6FeXcCTTg0EUoi/JC5g
 idj60xoDEx79jd1sqFpMuGS1jDEsv2VaZ8mOXjV02hujl+DKnAe/UqmM2NetBooCfPcNb99MlaP
 jI2xIDENpksO/idpAzAWjQMUFx6IwDNQVc97hwxZtIzvRPTzgTwKzFV0YccD/saoDoTgHq+YF1E
 G33yLmnKna+6uteudVXEagxfprHH3I7aA0RDbR2HpKzeh+CpWpCnrRUUdxW3wXZfm39PHSjRbOo
 r/tS/LK187tWoXBehDk/ri+j8BZgxXb5VHxlfGB0lCh3n6+k
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 25 Aug 2026 12:24:31 +0300, Mehmet Aysel wrote:
> ASoC: amd: acp-config: Add HVY-WXX9/M1060 DMI quirk

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: amd: acp-config: Add HVY-WXX9/M1060 DMI quirk
      https://git.kernel.org/broonie/sound/c/032bb633e0c3
[2/2] ASoC: amd: acp3x-es83xx: Add HVY-WXX9/M1060 DMI quirk
      https://git.kernel.org/broonie/sound/c/c1a39c228ace

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

