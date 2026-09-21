Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4735436B911;
	Mon, 21 Sep 2026 12:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993186; cv=none; b=CPO2VxyM/V12IRPLHtGhfPeE6ZDIBpcYs+OGSl179O8UAYWHvlrndccpDuYW3CtpgI2MbPwNakypRLzkZZQgpuGMm7QSDlCv3SRcKWpAdfpLdmEMc7cuUeSgHI2LYsYCDcbKgmLLy4wvxbC7/ELTJxpbvHr9a2lk3MNyFkjjyKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993186; c=relaxed/simple;
	bh=J2xkjTXVuatSmZfKYf7LQgPiz2A2e4qNhGyG0AVuCvs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VWjExXJpALfk2Nds8iBMINqpIKuTQuSZl8JAZ6LDoLg0rWLfT0ldx0wmp2yhG2u2fnp1QpnzvrRd1auG//84P2Y2c5HFqhNN8BD2rlZGGk04yataEfvkMCdTRe3UjEtCFNg+TRY2/+BNjQM11SL3q9CisUmVoHWkZxfh1Ovh9Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFEY5/Wr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFEY5/Wr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3463D1F000FF;
	Mon, 21 Sep 2026 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789993185;
	bh=DtBVhxqe07MjevokV0bdUc7GvWG/+2/hBRcNhYu5TTE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RFEY5/WrwQKhZy7rtm7h8A4JgVsm8Wg4I8ken03pHhXxBWrskZfCzbXJpN9etx1Lb
	 CdsXHTPPwYI1qKOk0N9QcGnM45tjz5BGxEY0Ti4otpgxWNCCvzol2W88/vtk7Yp4sE
	 jAHHGtmD4AcLp1j70yGEvvASbO978ISHjIjQKVVoHdOXPNgKLRvO7BKOWGA8mrnOlj
	 V+2EHNoeY5oPHACsN1rHoIockbZ1QNSahRFWVZd2iY6rlm0Q0+aHt1dSAbZ6qY+sg7
	 IS0vCHRRCnNlo4xrBhE+J6Bm4rMrQAXM3vDfo2xCorf7vft55h/zuFmRdSzrnu8Eha
	 YhRyck0jVRfAA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Daniel Ortiz <letargopausado@gmail.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920011920.2482786-1-letargopausado@gmail.com>
References: <20260920011920.2482786-1-letargopausado@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for Lenovo V15 G6 ARP
Message-Id: <178998268990.191028.2889804384844846747.b4-ty@b4>
Date: Mon, 21 Sep 2026 11:24:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=broonie@kernel.org;
 h=from:subject:message-id; bh=J2xkjTXVuatSmZfKYf7LQgPiz2A2e4qNhGyG0AVuCvs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqsSDaYQV4S7jRc/PafEdss3CJH1XoLL/1ga83C
 SHxRCLju1CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarEg2gAKCRAk1otyXVSH
 0E1LB/4ttGE4X9vaL1nP95yplbb9FN4KXVSHwaPo85s/A5cBugGhVLj/4FWheMR8vkA7dbqVYk6
 Sbc7Mb4sc2sGlcCg0NK6+QdsmGZlaYcxIYnWpU97RJsCwftPqTOPyGP9E7SGufhjoE5sI0wlV24
 kizl+DziQ0kguLWsUWr59rrbeMLdLL63EO1k8IdVBRJlGDmxNoPUnLNDtmJFfbrck6FZfIvN53Y
 rm/wMPpMnE89G3RJ4U5lzPke5Gm41RtGrDBt9SuA8C4foWgjCPTjEUKfMq6QLHEJ3Zn2RH9zqaB
 zMYC6JQqmJZWyAIb2A61bCeb1H7tY9L4XqCM5enTHy9D0Mm4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 19 Sep 2026 20:19:20 -0500, Daniel Ortiz wrote:
> ASoC: amd: yc: Add DMI quirk for Lenovo V15 G6 ARP

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for Lenovo V15 G6 ARP
      https://git.kernel.org/broonie/misc/c/d395e1b62d96

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

