Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8EA43C076;
	Fri, 18 Sep 2026 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725588; cv=none; b=Nfc1mThl861Qqt8SFDG0vWzyRqg5XhxajmTvcb2LMM1WHnW2dBnT86+xeX+h9Mk8O/30JJ2CA0KjDIupmKlJzQJ94/0s1mjPYhbmJ3eSDpL43g5Cm7AWnn6J42dWE0DsA7BqdYhQSmXJi0S7CI8HkwpQy6FCLFxzYiqAo+QPwFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725588; c=relaxed/simple;
	bh=vonfNZic0FRILTkniWzlUJ6BwPQV0MvyIG1Aye4fDH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ObIoMJVFv9tkKdxUg17soS9x9PHeRbJ6HbcNDlkuCvgpc3vNF4jKaO8OoeOv8dNgWG+coyyqORqginxgbM7KXkLhpf5UEY4O3wWBissB0E5x7/qfRsL+WiAf2W1dHyRlngThoQPh2Ev5EbeGR0SQu1Jwj57yvBfISTiMpdNhTk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vp7Xw+zT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vp7Xw+zT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3701F000FF;
	Fri, 18 Sep 2026 09:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789725586;
	bh=s2x/hUKOrpwshD5XLyDwpeMawSpqUEFzG89yojrc9SY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Vp7Xw+zT6rzSXK9PRXPvwZsv7ktqbNx1BLzheBnpBUPzvr8fJl9tPjfoxcNpE8Q4k
	 qzSUDLk76+MO90+qvOvdnxsbREpeYhnApn0Bc3uYpAYN9QPzUa1XOTbBoDDhUEvkm+
	 mX38eu5J9sTCjW4kB7ZCRxNbeEZabZmxWjmIG3yjlk9XSM/i3vt9rD+pkquE9/vzXc
	 VD0FWK3sEO4kJiqCLWDgXFvHlSKW7oof2AxPTcmSDttwd3twMY8bnGocAIYw7FUInV
	 jPLN3iyUsrpWpSvYBdHgd1T8Nb4pH6SLDIVlkoHqZ8J4MI6JC+dLp3fMDlxfS20d40
	 ivmU3SpQqei3Q==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260916220453.260472-1-rosenp@gmail.com>
References: <20260916220453.260472-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: mpc5200: gate AC97 driver on PPC_MPC52xx
Message-Id: <178967135736.285745.8925263446043052641.b4-ty@b4>
Date: Thu, 17 Sep 2026 19:55:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vonfNZic0FRILTkniWzlUJ6BwPQV0MvyIG1Aye4fDH0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrQuPTSapOvwhYd2SbKQOXhtggvBhvfy7oXjha
 ipoAKABrpeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaq0LjwAKCRAk1otyXVSH
 0NjPB/9z5TDiSYvgMAuszySnmQDW0w70jBHOFw1IGI4VxqUPV+r83i/GLKOuhF5ioLlE0DFvtOc
 dG70PaOYakrJdZ2xClZneUp/8GS5nfF/Yt7Gf+DbhLuihfIun2VGkCMlDxeGWvUoEHpeoBRiKbP
 oKMJJZhDcRlGWo8Nj9bPYG7PP01ufGwQAyxeHkrqW9AvYucM7o0LOtZQE93nmavzw8DWzrb1N2i
 HfAFk5VFQ6A77KdCNFf7mTuZ4gI68Nnxg3QvTK4QWBGhXMIjxQk0UjeVLkBvEN8t/aQwfnOgHLV
 s7TwP8et1CrfZX8ZKQ7vNq7TWEcHb6CTkCY7aAAVVXF3yzqf
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 16 Sep 2026 15:04:53 -0700, Rosen Penev wrote:
> ASoC: fsl: mpc5200: gate AC97 driver on PPC_MPC52xx

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: fsl: mpc5200: gate AC97 driver on PPC_MPC52xx
      https://git.kernel.org/broonie/sound/c/ebdc596c4262

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

