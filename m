Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563B13AA4E3;
	Thu,  3 Sep 2026 22:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788474280; cv=none; b=Og8+o66aNNTWw3rtH6jK3c4dxafZnewiIlo3UIMuzc6OHvD30WjtQsBT7txQFIVn9UL9FhWSW8EmuiQigKWLB6BO6esh5HsH4pNgjI7AXNEXNrYgRvJmj3epretVaEn2I0Kr4WkgTgQucl+42/KBuKxXQfw2UEWXf37mqPy4Omg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788474280; c=relaxed/simple;
	bh=o9uzqH/w6XKwn5FtgV9y4TYcpyP6F+RzZt3Ix+RbXE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XOJEPqzOlRwAgqmFc4Ij2dLuGxlve5CyvIfyXlgorAKbXxh5aa8cVGTcHWEpukyCYoGIqSwF4IanEVr38pojtTL4uiF85D+Ra/AgvSU5SP3nRmmMzQOfHDltkkKB5P+F6t+k9nFQ54F4ve8dBrbZ5NDe6IzN98rNCj8M8R9b5kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RR6bZ93M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RR6bZ93M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29251F000E9;
	Thu,  3 Sep 2026 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788474279;
	bh=smD2RzcQBWDNrK4LEeA/1TKZQemBO3xLKFescR1Sxss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RR6bZ93M0gt2Hb5ioYGNh7LSGBrvNKO4FXtvtZPs1lYw8sb0qUrgq48XMBIjw0bPy
	 Pxb1ZxIMwu0ei5SOWtqTSwKP0vDWJWADDX+e28FdYUj5ph8sH8n7Uz8Hc1c8hBLGAM
	 IGhNKWMUcTSJUIjAuQpdVmWNjhiBknH+OVJ04oOhJvZwe5joA8dDp2cv4+KBBACXKn
	 W/1SKSUrYf9TT6Msy5SqCQFTLQ4ysdBZlTPHGRAsQ4VBgdR3TpKoibdvw7iXhTLwcP
	 TWbdGT+atAnvFSwW1r4Kc/u+UJ4OhH1I+xC19xcxVqyj/sIPXyvSswSTykSjcBdg0v
	 iLjjAmgTBhJMw==
From: Mark Brown <broonie@kernel.org>
To: Samuel Kayode <samkay014@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260903082010.4024603-1-donggeunyoo.kernel@gmail.com>
References: <20260903082010.4024603-1-donggeunyoo.kernel@gmail.com>
Subject: Re: [PATCH] regulator: pf1550: fix division by zero in the ramp
 rate selection
Message-Id: <178847061240.628640.146201407366789198.b4-ty@b4>
Date: Thu, 03 Sep 2026 22:23:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=o9uzqH/w6XKwn5FtgV9y4TYcpyP6F+RzZt3Ix+RbXE8=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBqmfOjqz4ubgzwbsBp12oMWMfEGKhdcy75vkLuP
 7FPErnnN4uJATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapnzowAKCRAk1otyXVSH
 0ITlB/jjrLGMCXqftt8DqMZ7+LpUFeMImdmukYi5ITSX/Dz4CckBDKTJlzK/qZMLWOHZXFh4KNG
 4wUNLYCRIOLehXJt+TEwEtdtccIcWDa3GGnM//24LvGj1wd2uZCqXBbHHwoE5S+ndFIsXBgsY25
 VmZMHGGbA8QgSQY65XqF0XBhOeDpDOo6sw/8AQLYJbr/bS6kXecJzSZtmFwWOepTVRv9+zmLcyG
 ggXaRu/KD88vKnjfhZh+TVJoSyyYc9HgGtI1Z729O9oBYzlJycXCEMbPduQRWAb7J8SCon7iSjy
 EUMeRWKmlqChJrbWEYL3iZQ547yto7WFUznUJ1xbjN6AWcg=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 03 Sep 2026 17:20:09 +0900, Donggeun Yoo wrote:
> regulator: pf1550: fix division by zero in the ramp rate selection

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: pf1550: fix division by zero in the ramp rate selection
      https://git.kernel.org/broonie/sound/c/f0c54cc56a9a

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

