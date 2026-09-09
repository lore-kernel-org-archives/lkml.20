Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A57576EBA;
	Wed,  9 Sep 2026 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969181; cv=none; b=PHxF9gwjiDf8VlluWd3mUcAVD2DIy7OLQleWqhlmYq9aS+yNfxwItL+o0wv63f3l/SbY2tLKEPWhpKZ4FeLGO/8Ahr+kPC7WbEO6a7EPh1I726oOn/0WHCu76K6tYcy3I0VrP5qjV9hkeRCpJF2jlEUBcCUcW27s2espVIcn1NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969181; c=relaxed/simple;
	bh=Z6IeuHN2wYLCdpAybEy7zPVVoprRL7CyTaPqhN2PIM8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dB7XOYpiN8RrfNeGNXcFJlP1jOvU7sp8EU0DU8Kmp2nHvZCZnbRGvF3cr8XKkRktz1JLHbWF8/Qz4XnXCAydIZBw4Ouy2HWLKP5NQ+ojnRJNpbOfbzK96C/HgygPkq7GNlCnbDLoZMM4jB4Lat9ifPWljGbgvEZhaTs8GTiycAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZ07dWcw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZ07dWcw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC511F00A3E;
	Wed,  9 Sep 2026 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788969180;
	bh=ygWRkBBeRU244lAb+zP2iWBtYkX+6ckuPk1VTFhikIE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BZ07dWcwPN5U3q6B8HpgBBmSrHZh2Bg6irBogU2MiCaskShvimm8yO4yPKkussFad
	 M6iYJoWddwfo4jx430lshC2xubx6fc1Vs9MEDgrO/jQ4vKZdHFgfGRW5q0GgMh2sjW
	 F31GR95y6BNl51vsHtvPq9pzMjpoxYJ/oCi+WCOj0KJKUqLQQ0lopHJoJO6pxYIUwO
	 7yUE3vVdDFKcmw1d/c5ui9ZI7rP5dlMUtWokPallHbdLj/8FkVgPVcdmDe3OG2skto
	 D7TzQmyqVUgdgK8kpdIHf+vPhFQtKQd8RYBM7LdXeFgfItk0CyRCEzuOi0CGqsxQLp
	 CKX5zpJvfKOWQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260830141828.34419-1-pengpeng@iscas.ac.cn>
References: <20260830141828.34419-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: nau8822: keep regcache offline while supplies
 are off
Message-Id: <178896516885.145772.14048806499861715090.b4-ty@b4>
Date: Wed, 09 Sep 2026 15:46:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Z6IeuHN2wYLCdpAybEy7zPVVoprRL7CyTaPqhN2PIM8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoYDYfB/4xGI6XuLguWzztEy/zWdIT/oKvGqNO
 t6LW2/eDZiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqGA2AAKCRAk1otyXVSH
 0ILeB/9I4fDZmYD2GBfHW666Pazcbs1EG0hA2g2+58O2gzn7Nv75D26hIhGtQD4ewdWRCzl10Yk
 pGDayAqC3s3ZrmB+59LBwonyi1Jlk+aTzrgenLhnn2GOPYzdgvVitPixkLZ5Ztz91TsX4dnuVYv
 pTbdxDAmC74fa/eoXvunBM44X4nez7NDQsJ3AoKsQ8z+op+QKSqAD5LOQHNLS++zRhxRZ3XFt5R
 SgsAm2lFROqoNeGMzJjIxKzxgO4GRjXmDzbBqmAvVoi/OfIKBu2PHt0UHDD218Wf7ZED0DdSH0y
 VIEguVEkGbVgkwJRanAqFD7eXkf47aZqjMO1YhmJ1QUTmPPp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 30 Aug 2026 22:18:28 +0800, Pengpeng Hou wrote:
> ASoC: nau8822: keep regcache offline while supplies are off

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: nau8822: keep regcache offline while supplies are off
      https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=9c343445b349422bddebb4cb9668c246bc6f08de

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

