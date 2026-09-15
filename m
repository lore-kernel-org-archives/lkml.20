Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9124242AF86;
	Tue, 15 Sep 2026 16:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489119; cv=none; b=k7c24msH4EpFtvWvgF5bOOTrlTNYjH8BQGtWGnNyZexybhXrVy6GCMSYwRcV4kT9Uuk80pBvLCUKLtJH8fsEe4n+Uswr+RzQjOB8NHcIbrdm5wOJVShqP8+rNKISTpLBrEBTmEy1Jvg7fERH9ibTmeOT6u4R571ew30YEQ2uJ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489119; c=relaxed/simple;
	bh=DIf4ayilbmZBMh0DHXNgys9GIIZQVEslcAlYqm4XnsE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cKzDRvt8WpUBhL46Oz3LRCt3EwZApzWn5Gy93CQotKaIRufrHm7YqU1VhkyGZg2dbkSScL4MTcmr1b1zJNI3mn0Sz84btkiune5v+pPgIC7H7BD/+yfLAahNrQ3Yqob7ZEQ92Exr7+t9UwLabXqnj5Q7e8PcaU1UldKzekYW860=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obkdRDx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obkdRDx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E2C1F0089B;
	Tue, 15 Sep 2026 16:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789489118;
	bh=yRhFeZH6VLeyCw8HiKqDqANkZ7eBts2fQHzalitssPw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=obkdRDx4KJ/F4ftGNhRVJEks2I7hTSLaZJeET2V7KL5yiAlVLwhQpB0MZQycBXj7H
	 6waxfJWJyJePFCZEiTLGNZoh2cWw5CxqSx/16mMMa7VimmYuYlbVjYxM55UGLRpann
	 fsHzhMo/Nm6IRj/fzEhNtV/Z9DNgPGu4xOYK8C/PNsZXn8TOdadOtWDYiCIX2ziTU0
	 n3UUAqfj7mRAVTii7Kk5OwStrC5b/azuZql17LaCz8f42FJDs8nbthNqGqhBUiSnzM
	 E0rHYnjmYALdD7Ld98naYXDqYbPVVUQIwKDHD8jLy0J+o5dkK8+nhcsfOW6eufN0RO
	 i/cAvOHQQ0TMg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260915102110.3276924-1-rf@opensource.cirrus.com>
References: <20260915102110.3276924-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Wait for firmware timer expiry before
 system suspend
Message-Id: <178948311377.151760.13181956545960061223.b4-ty@b4>
Date: Tue, 15 Sep 2026 15:38:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DIf4ayilbmZBMh0DHXNgys9GIIZQVEslcAlYqm4XnsE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqW/bsk/K5T9ANLyeKruJPkuqLUvrXiXWeu/8e
 546WKyETgSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqlv2wAKCRAk1otyXVSH
 0DjOB/9U4jC2kfM23bWWWpE9AqNsvKD7ufrQALt6NPnEpRvKXW2K+lGIL0RWoaZ5VhtCVzl248E
 PWo1STSFQ/PSQ1FbG3C+Xmh6ik7TsGTSa1FwVYzY8rwPnnKr5RWp4Y1AaIydFpGB4IaCrjhPn/e
 PublzT3ufXe6awSPK035mEkqiSibX+uO0OMQDiSb5Mo6QtqUC3czYJNzFjlHAdbhq5vEIFV1Rfp
 tELzPjFkpKBTOr8qC65SAxsQChcLL+KBs2D8wrUowSYe557E0nrsY4Lz9GbYk5GTLF512DyyEdh
 PBSshyTnvHjdYz8YWseDY1yJgAmZKHJMyKRwtgInHS7gEjia
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 15 Sep 2026 11:21:10 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Wait for firmware timer expiry before system suspend

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: cs35l56: Wait for firmware timer expiry before system suspend
      https://git.kernel.org/broonie/sound/c/7226c5c21f48

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

