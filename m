Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB16472530;
	Tue,  1 Sep 2026 22:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303374; cv=none; b=c57wrocX+hCeZ/vE5ufJ7juR+Cku7a9DqVGOjjdspxSrvqJbD9T2n4wSjxKRKBreQEMilYsoeKOpvKM0nw7OU2TywWO74CIqdjQexbTTleEmseonYLZ1jGxUZBd1pH4RbHv5PVAwH+tWW0otNTKM6DGcGchU6LJzahlM3P1CDQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303374; c=relaxed/simple;
	bh=/JNk43hFYwRm69rpqFNtmBtR8DBlxeRTVGoAduwwzWQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j2j2gdndmSHiWuRCFY0cBJsKd8e9AEvDjxl0siJo92r5kRX1iDgg4JiPQ3z3NflR1vW/34CEUzDDWwbAy5WcxEQBCd2IEXbNQM5lsMR8sjko3xokCi62AcDJ+EUGdFyD9NQTy5Ezs0HLnGD1WfAPb4yCVcOym3BNWW7gOBUtEl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNIroxzC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNIroxzC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BD31F000E9;
	Tue,  1 Sep 2026 22:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788303372;
	bh=6YSy7g9UPEW0W36+LpQt56tn+F9qr24OgapwNweNbRU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MNIroxzC1VpNhvqq+/5AmC7ol1fNZ8rTBzacRxFahB3tn+UM0K8ywd3HPrZZKy9Va
	 l/cj2a8Wt72wGonC8y/r2wuEwhAN4HHXsF6QpcfFfcninL73I9hp6JeoBxG1oyM9qC
	 slMrekxNujSh9L6jt4aYSG8xzGUHkeRKegf/gZXEEz8rYfQyQX3sgqVuVQCe1FM3St
	 Rn1bWQ8yKuN4OzKsoMArhKoScjt/YWZ39Kw4VAQY37wnZx5MX9ZManew2bTtG2z3ko
	 QE1YzO/N3k4WxK6y0ZZZT7NcUmZGzt943Fy+WeecA5xm7LF1Ih66DEIG+3cWGaFa0E
	 cl20FEmPVafEA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901152838.795864-1-robh@kernel.org>
References: <20260901152838.795864-1-robh@kernel.org>
Subject: Re: [PATCH v2] ASoC: ak4642: Drop "clocks" property presence check
Message-Id: <178828801360.33904.16073161302861474782.b4-ty@b4>
Date: Tue, 01 Sep 2026 19:40:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/JNk43hFYwRm69rpqFNtmBtR8DBlxeRTVGoAduwwzWQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBql1gJhpTQGTzKfzGxbAHeuV36iJFqQ8u6jE9Fi
 BJb0CeK4rKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapdYCQAKCRAk1otyXVSH
 0G3MCACFnVzNrKPabmSC5axH165YBa1o1GDkODxJo9xgzBgH7oDJ0xHKs4GD1/eq3sHbc5YO3mV
 LYsnllYkBlwupJz+EiNQOkmJyoZQ7dPWVEVlmxnmO7iY2waKRgXD13WgRgPc4/UHoFU5tkjK/EV
 oIxCdBsCkdvn/V35Ok1dHXgY6ae0XuFB/kj/30WkgtadybpzC9oUOXM2ujM+gKdJF48TlAziAa4
 5nNxkI/H5InlyWYcBOgJ/Cn10fjMl1QwM2ZMWsBxMogX6/GwKD5uFz3hdR9d7Gt4b8ipz07E2vX
 WUGzBt7xCte0hLyi3rzbUmnuRmHEhX550kXzqqfgmvm5gdif
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 10:28:38 -0500, Rob Herring (Arm) wrote:
> ASoC: ak4642: Drop "clocks" property presence check

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: ak4642: Drop "clocks" property presence check
      https://git.kernel.org/broonie/sound/c/15570f6b54b0

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

