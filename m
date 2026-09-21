Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425EE3C09F5;
	Mon, 21 Sep 2026 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993193; cv=none; b=A4/U6Ev4QzCu79dnwXgpQgm/3AhTeT4smlKwgW6U7jv/jRamfrDTmTBdUMgqkipvQP/xo5vZ9BjXc1Po0LYEOPx/IqYlWE/0kE8R/w+f+lXExTp3K6AQE1GDoSN8Tc2ezwsSRbrl/1yEgAIZh93Q/cyBd1NIcMjo0rcoL/6Hr1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993193; c=relaxed/simple;
	bh=vC35KO3UjRrxzqN3EeVAi3JMuO4wdCcHWMImDy9EXvA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qU5gzRSr3YIXt8vxFcoUMwsoW91IgrYM3Pfz0KUmOfNxNNWYrOcTiyyh4kUcW+6XsZ3p76B11f/oE6uFaFO/4hvzCIKv9LHHGMha6ZSxPFwyZb3J8nT9OTXnvUkgmBX4CthtwcIcE3oc/7r/2tUwuGpMSxXJDHJESz1G4JMkTxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEgjXiND; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEgjXiND"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3071F00893;
	Mon, 21 Sep 2026 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789993191;
	bh=2NQ2AaL4l6+GvUtAEeoWWeF3dsc1rLkw49vQFA3SbuE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JEgjXiNDdFi/KIHNSbNictmCf6VoRzb0nZVN4d8xEDve9HSzAtZWbFE7BfeCVmiwq
	 X9YGnsKea0PoZ/+BVvKGvV8n2iBvP7vljP2JqGJsoRa+ckc0sqCkxz7baK73mvdFR8
	 JPVnZ5kNpIHqWNE5fqlcLoYSQQeu4drnLcb5b9kBnD68kdg3Vppn0BPfwgwqaNVEtE
	 xLHIqNcIdn+FiqbJf7hzsyy7Z1EfFmZOtQkgwn2i42oPLMosqx7LgIpO6sGmzClHHG
	 OV6HhWCZzi2uQtOb5vJHzZMCPW0awVi2EV0Qj86KQqSm7t69WuMVKyzNhSEN+77Fvj
	 kWwdOfhvnmAKg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, HyeongJun An <sammiee5311@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, ckeepax@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920135327.3628704-1-sammiee5311@gmail.com>
References: <20260920135327.3628704-1-sammiee5311@gmail.com>
Subject: Re: [PATCH] ASoC: wm8903: Move the DRC QR threshold to the
 register that holds it
Message-Id: <178998560893.221626.8235922322553520682.b4-ty@b4>
Date: Mon, 21 Sep 2026 12:13:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vC35KO3UjRrxzqN3EeVAi3JMuO4wdCcHWMImDy9EXvA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqsSDiwa8J+xWhKsrjHZgtoLQVtHTu1o0jwnLZO
 HDaRI5R6wuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarEg4gAKCRAk1otyXVSH
 0DHHB/43+dC0xkGt05FTsHb6ZVuSIWpPOgwxLWCCZiVQ8aGiv0nt+w4/bV9lT2+XVh4bJH8JXpn
 nzcOMActm0lLgVD90JdfdbsuKYBxIcqzvZogeZn2EjaJd5r7LrdmGl7YQ8AsgT5K0JJz+6Lgen7
 s7b5OXXDk8hxU8D7bYsmYcE5dRztLW7vFQURSLJzf1iHXHwhp3XFEpSvuwYzZ7IZxZ8GsJ4zVoF
 uRAxRLSeE7Mp2TfhDEUHuZIOJojS51UHJJLe/9uMrjZe7G0r8tnQhVlSP43Gr5nimtE/cOKsjos
 lF+TgL7D6E+tHLSDm273ehneaKR1ThBcTIlWQI8/UD9TsuRK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 20 Sep 2026 22:53:27 +0900, HyeongJun An wrote:
> ASoC: wm8903: Move the DRC QR threshold to the register that holds it

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: wm8903: Move the DRC QR threshold to the register that holds it
      https://git.kernel.org/broonie/sound/c/e31ae4aeb049

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

