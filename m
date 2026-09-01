Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE294472530;
	Tue,  1 Sep 2026 22:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303382; cv=none; b=eOlHUY+IUB/VQvNB1+O0OK0PIJmMzm2rJvEix3jzeKj9oa81TJu2VpkcxvZ2tMdXrdrOlK2lBkwQWMh2R6w7gZuciDWb+QPkQij5d9xk+6S5jMawvCIvLFryE7RZ/8Dxmongs1wV7ZQNF7o4gbWOeF3jO23P9s6obMSXZpasuiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303382; c=relaxed/simple;
	bh=pd5HplcTmMN0BJblTiE9kq+lC/5fjHbRfQTTUvjq+z4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RN9yhEd3eCSos2WGUm66KhfAkCEa+EeXdRnzfxyUL/mQQL9nK8vMDa8ORPSNWKBuodSb9W/CAjmVtIw5BC//73C45e801FdyKfExxEhoIxTBkQihC7Jmq0hmS8KdDpB3vl9Gu92iN6NO95LWVBJKL0Yxwk5YXh+7D5NmMpwMfng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfc/2R8n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfc/2R8n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349B01F000E9;
	Tue,  1 Sep 2026 22:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788303381;
	bh=FIoEcbOHqgM0pDpYRvsPieLJh4+LISvG1+reAMYj0vE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jfc/2R8nMzXaNaeX3NdklD3P4ufl/Rpjc9apXdB55IsrP8rW7TX4+iEQ72fPuLMnC
	 x2280OtRKuv1M6LY54E+TPHexJof2mgWhl2/Ep8tiNtAR95r1o40zmut+X4NQLiUwb
	 sXX3ZlWH1Ifr+7IygIeUe+u9PjnKI4fPu8CBCUZJ0ROAhAxeZm4zRqsrVQ7VlnNN39
	 aq8lQSrQ+qOLwhNJbDvNbomC69LGvd8qbapRJxmwPPUJ/CUlscbpgHzxpzgds58rpf
	 H6pBEA0A2xnZuow1Bw3SM+0saEUg8TcGRGc+amOhsQtt5dCYP8yD3ZJwMU6nxTLrey
	 iLK6vh/uzXQjg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901152855.796769-1-robh@kernel.org>
References: <20260901152855.796769-1-robh@kernel.org>
Subject: Re: [PATCH v2] ASoC: twl4030: Fix "ti,hs_extmute" property type
Message-Id: <178828911442.33904.2413833280872630382.b4-ty@b4>
Date: Tue, 01 Sep 2026 19:58:34 +0100
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
 h=from:subject:message-id; bh=pd5HplcTmMN0BJblTiE9kq+lC/5fjHbRfQTTUvjq+z4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBql1gRm6VgE5OA2Y6KykAmYmgxzbI3DZ7cyjf0V
 NyBxYR7jjWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapdYEQAKCRAk1otyXVSH
 0JksB/9REyuz/kLO0Bi0VoJLR6+SG9jzXgkvMKDwtEa4qkXFdCxyU7mbyZ1edT9sOIdnlvl+dFg
 US42ZL4nYT1qECzi0qrVWAc9wk7H1nFVawZY2HyS6DQNXGlKICmnd3LfOGIwQcPWea1/ciULfVU
 XRzHmkEau0fAn6Sz90SgUgSAdn3vqTze+SmFzGuI6zprooir4RMcXf1whesEWNN3v2PC84A6/kH
 9HJtLYlnNGlyQNEB2rRb+fBwcIIwnF0tnjJWh/LRNQLyOC+KMrytwTWSzVi+bzxPVWrroVFWdzA
 WR5iN6fdPdxtgOaC5EpBwBszkQCICILlJ2NM3x3prr6HuQ2W
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 10:28:55 -0500, Rob Herring (Arm) wrote:
> ASoC: twl4030: Fix "ti,hs_extmute" property type

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: twl4030: Fix "ti,hs_extmute" property type
      https://git.kernel.org/broonie/sound/c/29a88f0d6c74

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

