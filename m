Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0FF363C59;
	Mon, 14 Sep 2026 19:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412541; cv=none; b=ocJLzkol8XDY2Wi90A8rpYylFQowkmQQGNV/X5vEJhRhcCYk9J8nHZMOlSYBiwTrrWwako2dgwo14xPgxFALWfYv5AQuRQ4YMQwBHbI/yttwintWO8TVk7JvTu8zmN4cyZqP2Jx7IpRlee/A0goaHtTu56Qq4H/rg3kiUH6EzQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412541; c=relaxed/simple;
	bh=TzQCU1DLFos71TH01lmS5BBPSJ0OYc5S51fZwAsAgk0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=co4vezzUrrAHmRyDAXQnq3nBb6TlVoFXys3zZ9C3GPqjq8PIw/ko9eAvKDiex2CngmwJVB8tZ2szE0J8jjjAyt3nQ4Fs4eRDElG1KPN4I7NgLb6KhfgJEFaXvtN/9vICL0QKOwFSYknUIhjBF5iw8lmsVzjTEPRekLf2Zskshyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/V6fDvz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/V6fDvz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195C81F000FF;
	Mon, 14 Sep 2026 19:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789412535;
	bh=K5/0hv2ponl7DQ/1pwm/cYRBHlb8SSb8zhEmHd7lnAI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=E/V6fDvzL1kozPcpZti142Z6dxOtw66a9CBgP/slNizmlx3hFVqS5z2dd/6JMMWcI
	 5NWdi4BaSpZNiG00WU+7dE0s8ldXNZHiIMmOxukwYmSUBeUWNp1F0LEEbKg/GwHXX4
	 7awYT8ZVXZWEycwhzASxPBNY/B7veckWfCUE2eI8i+LxKE9yY/YwkOyzFsfFY6U7Qe
	 FSYznW/1KIxWlLtO55lbMubd7u5weGc9N3PkB3MyGZ/b8IPNOz/fVnuMp4Rz2eK9lx
	 E/Ulbdgl3BTBEHTydvFlQtrCsz4sevESVw9blZj8dJQikBheXMczuSqce57PHf3xtv
	 4+vOGqW/4jOqQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260914122611.2783563-1-rf@opensource.cirrus.com>
References: <20260914122611.2783563-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs-amp-lib: Prevent NULL pointer if efi variable
 is zero length
Message-Id: <178939626271.1239410.7128187664081087314.b4-ty@b4>
Date: Mon, 14 Sep 2026 15:31:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TzQCU1DLFos71TH01lmS5BBPSJ0OYc5S51fZwAsAgk0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqESk9IrO0/5ArnLN0eka2OQmfVXMowmyBpd+W
 eO0yfBFbuKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqhEpAAKCRAk1otyXVSH
 0Np6B/9copAXd/vK/w2J72OAeAYkmKsiGHMmmGazunZZjRdEbxvETwf/vccRgwaZupeLfdrsJuT
 jz/1q6BJ/XK7ScVu4uYrgJ5yrf3goDpKOJhud0hKKu3dxKkHDnv7z9A2mgscl3SpEq+dBj/Itsq
 OD0EzMfGGShXphaGl+2GJL/fQ+jbVagMtxtX4eGjvN3JtErhSDB5mQAncivrPdWfvm31wEQHiPB
 pZDGUROGDDI0pulba9vgD7D84ifxZU11s5CBVx7k2qICvsrEj7pMeWogcWXDC0auSIpPd/yNc6J
 2JP9g8BlJEpI/5l7QBaNUxwYChvVxdE9KY5whqZ4SvaIn/jm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 14 Sep 2026 13:26:11 +0100, Richard Fitzgerald wrote:
> ASoC: cs-amp-lib: Prevent NULL pointer if efi variable is zero length

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: cs-amp-lib: Prevent NULL pointer if efi variable is zero length
      https://git.kernel.org/broonie/sound/c/8ffd16d6875e

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

